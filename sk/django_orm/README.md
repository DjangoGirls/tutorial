# Django ORM (QuerySety)

V tejto kapitole sa naučíš, ako sa Django pripája k databáze a ukladá do nej údaje. Poďme na to!

## Čo je QuerySet?

QuerySet je v podstate zoznam objektov daného modelu. QuerySet ti umožňuje čítať dáta z databázy, filtrovať a zoraďovať ich.

Najjednoduchšie bude ukázať si to na príklade. Vyskúšajme si to, čo povieš?

## Django konzola

Otvor si lokálnu konzolu (nie na PythonAnywhere) a napíš tento príkaz:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Toto by sa ti malo zobraziť:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Teraz si v interaktívnej Django konzole. Je to ako konzola Pythonu, ale s trochou Django mágie. :) Môžeš v nej používať všetky pythonové príkazy.

### Všetky objekty

Skúsme najskôr zobraziť všetky naše príspevky. To sa robí nasledovným príkazom:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Objavila sa chybová hláška. Hovorí nám, že nič také ako Post neexistuje. To dáva zmysel - zabudli sme ho totiž najskôr naimportovať!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Naimportujeme model `Post` z `blog.models`. Skúsme teda znova zobraziť všetky príspevky:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Je to zoznam príspevkov, ktoré sme vytvorili dávnejšie! Vytvorili sme ich pomocou Django administrátorského rozhrania. No radi by sme vytvorili nové príspevky pomocou Pythonu, tak ako na to?

### Vytvorenie objektu

Takto vytvoríš nový objekt typu Post v databáze:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Chýba nám však jedna prísada: `me`. Ako autorku musíme vložiť inštanciu `User` modelu. Ako to urobiť?

Najskôr naimportujme User model:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Akých užívateľov a užívateľky máme v našej databáze? Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Toto je superuser, ktorého sme vytvorili dávnejšie! Poďme ho dostať ako inštanciu (uprav tento riadok tak, aby obsahoval tvoje vlastné užívateľské meno):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Ako môžeš vidieť, teraz sme dostali (`get`) `Usera` s užívateľským menom (`username`) 'ola'. Môže byť!

Teraz už konečne môžeme vytvoriť náš prvý príspevok:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hurá! Chceš si overiť, či to zabralo?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Je to tam, jeden príspevok v zozname pribudol!

### Pridanie ďalších príspevkov

Teraz sa môžeš trochu zabaviť a pridať pár ďalších príspevkov, aby si si vyskúšala, ako to funguje. Pridaj dva-tri ďalšie príspevky a potom poďme na ďalšiu časť.

### Filtrovanie objektov

Dôležitou vlastnosťou QuerySetov je možnosť ich filtrovať. Povedzme, že chceme nájsť všetky príspevky, ktorých autorkou je užívateľka (User) ola. Použijeme `filter` namiesto `all` v príkaze `Post.objects.all()`. V zátvorkách definujeme jednu alebo viac podmienok, ktoré má príspevok spĺňať, aby skončil v našom querysete. V našom prípade je to `author`, ktorý sa rovná `me`. V Djangu to napíšeš takto: `author=me`. Náš kúsok kódu bude teraz vyzerať takto:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Alebo možno chceme vyhľadať všetky príspevky, ktoré obsahujú slovo 'title' v poli `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Poznámka** Medzi `title` a `contains` sú dva podčiarkovníky (`_`). Django ORM používa túto syntax, aby oddelil názvy polí ("title") a operácie či filtre ("contains"). Ak použiješ iba jeden podčiarkovník, dostaneš chybu "FieldError: Cannot resolve keyword title_contains".

Môžeš tiež získať zoznam všetkých publikovaných príspevkov. To urobíme vyfiltrovaním príspevkov, ktorých `published_date` je v minulosti:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Bohužiaľ, príspevok, ktorý sme pridali z konzoly Pythonu, ešte nie je publikovaný. To môžeme zmeniť! Najskôr získaj inštanciu príspevku, ktorý chceme publikovať:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

A potom ho zverejni pomocou našej metódy `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Teraz skús získať zoznam publikovaných postov znova (stlač šípku hore trikrát a stlač `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Zoradenie objektov

QuerySety tiež umožňujú zoradiť zoznamy objektov. Skúsme ich zoradiť podľa dátumu vytvorenia (pole `created_date`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Poradie môžeme vymeniť pridaním `-` na začiatok:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Zložité požiadavky pomocou reťazenia metód

Ako sme videli, niektoré metódy na `Post.objects` vracajú QuerySet. Tie isté metódy môžeš zavolať na ďalšom QuerySete a vrátia ti nový QuerySet. Týmto môžeš kombinovať ich efekt **reťazením**:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

To je skutočne silný nástroj, vďaka ktorému môžeš písať pomerne komplexné požiadavky (queries).

Super! Teraz si pripravená na ďalšiu časť! Django konzolu zatvoríš príkazom:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```