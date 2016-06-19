# Django ORM a QuerySety

V tejto kapitole sa naučíš, ako sa Django pripája k databáze a ukladá do nej údaje. Poďme na to!

## Čo je QuerySet?

QuerySet je v podstate zoznam objektov daného modelu. QuerySet ti umožňuje čítať dáta z databázy, filtrovať ich a zoraďovať.

Najjednoduchšie bude ukázať si to na príklade. Vyskúšajme si to.

## Django shell (konzola)

Otvor svoju lokálnu konzolu (nie na PythonAnywhere) a napíš tento príkaz:

```
(myvenv) ~/djangogirls$ python manage.py shell
```

Malo by to mať tento efekt:

```
(InteractiveConsole)
>>>
```

Teraz si v interaktívnej Django konzole. Je to ako konzola Pythonu, ale s trochou Django mágie :). Môžeš tu, samozrejme, použiť všetky príkazy Pythonu.

### Všetky objekty

Skúsme najskôr zobraziť všetky naše príspevky. To môžeš urobiť týmto príkazom:

```
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Objavila sa chybová hláška! Hovorí nám, že žiaden Post (príspevok) neexistuje. To je správne - zabudli sme ho totiž najskôr naimportovať!

```
>>> from blog.models import Post
```

Je to jednoduché: importujeme model `Post` z `blog.models`. Skúsme teda znova zobraziť všetky príspevky:

```
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>]
```

Je to zoznam príspevkov, ktoré sme už predtým vytvorili! Vytvorili sme ich pomocou Django administrátorského rozhrania. No radi by sme vytvorili nové príspevky pomocou Pythonu, tak ako na to?

### Vytvorenie objektu

Takto vytvoríš nový Post objekt v databáze:

```
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Chýba nám však jedna prísada: `me`. Ako autorku musíme vložiť inštanciu `User` modelu. Ako to urobiť?

Najskôr naimportujme User model:

```
>>> from django.contrib.auth.models import User
```

Akých užívateľov máme v našej databáze? Skús toto:

```
>>> User.objects.all()
[<User: ola>]
```

To je superuser, ktorého sme už vytvorili predtým. Teraz získajme inštanciu tohto užívateľa:

```python
ja = User.objects.get(username='ola')
```

Ako vidíš, teraz získame (angl. `get`) užívateľa (angl. `User`) s užívateľským meno (angl. `username`), ktoré sa rovná 'ola'. Aké elegantné! Samozrejme musíš si to upraviť na svoje meno.

Teraz už konečne môžeme vytvoriť náš prvý príspevok:

```
>>> Post.objects.create(author=ja, title='titulka', text='Test')
```

Hurá! Chceš si overiť, či to fungovalo?

```
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>, <Post: Sample title>]
```

Je to tam, jeden príspevok v zozname pribudol!

### Pridaj viac príspevkov

Teraz sa môžeš trochu pobaviť a pridať pár ďalších postov, aby si videla, ako to funguje. Pridaj dva-tri ďalšie príspevky a potom poďme na ďalšiu časť.

### Filtrovanie objektov

Dôležitou vlastnosťou QuerySetov je možnosť ich filtrovať. Povedzme, že chceme nájsť všetky príspevky, ktorých autorom je užívateľ (User) ola. Použijeme `filter` namiesto `all` v príkaze `Post.objects.all()`. V zátvorkách definujeme jednu alebo viac podmienok, ktoré majú byť splnené príspevkom, aby skončil v tvojom querysete. V našom prípade je to `author`, ktorý sa rovná `ja`. V Djangu to napíšeš takto: `author=ja`. Náš kúsok kódu bude teraz vyzerať takto:

```
>>> Post.objects.filter(author=ja)
[<Post: titulka>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4ta titulka postu>]
```

Alebo neskúsime vyhľadať všetky príspevky, ktoré obsahujú slovo 'titulka' v políčku `title`?

```
>>> Post.objects.filter(title__contains='titulka')
[<Post: titulka>, <Post: 4ta titulka postu>]
```

> **Poznámka** Medzi `title` a `contains` sú dva podčiarkovníky (`_`). Django ORM používa túto syntax, aby oddelil názvy polí ("title") a operácie či filtre ("contains"). Ak použiješ iba jeden podčiarkovník, dostaneš chybu "FieldError: Cannot resolve keyword title_contains".

Môžeš tiež získať zoznam všetkých publikovaných postov. To urobíme vyfiltrovaním príspevkov, ktoré majú nastavený `published_date` v minulosti:

```
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Bohužiaľ, príspevok, ktorý sme pridali z konzoly Pythonu, ešte nie je publikovaný. To môžeme zmeniť! Najskôr získaj inštanciu postu, ktorý chceme publikovať:

```
>>> post = Post.objects.get(title="Sample title")
```

A potom ho publikuj pomocou našej metódy `publish`!

```
>>> post.publish()
```

Teraz skús získať zoznam publikovaných postov znova (stlač šípku hore trikrát a stlač `enter`):

```
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### Radenie objektov

QuerySety tiež umožňujú zoradiť zoznamy objektov. Skúsme ich zoradiť podľa dátumu vytvorenia (pole `created_date`):

```
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Môžeme ich tiež zoradiť naopak pridaním `-` na začiatok:

```
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### Reťazenie QuerySetov

QuerySety môžeš dokonca kombinovať pomocou **reťazenia**:

```
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

To je skutočne mocný nástroj, s ktorým môžeš písať dosť komplexné požiadavky (queries).

Super! Teraz už si pripravená na ďalšiu časť! Shell zatvoríš príkazom:

```
>>> exit()
$
```
