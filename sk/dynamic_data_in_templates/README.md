# Dynamické dáta v šablónach

Niekoľko vecí už máme na svojom mieste: model `Post` je definovaný v `models.py`, máme `post_list` v `views.py` a pridanú šablónu. Ale ako vlastne prinútime HTML šablónu, aby zobrazila naše príspevky? Pretože to je to, čo chceme urobiť - vziať nejaký obsah (modely uložené v databáze) a zobraziť ich pekne v našej šablóne, že?

To je presne to, čo majú robiť *viewy*: spájať modely a šablóny. V našom *viewe* `post_list` potrebujeme vziať modely, ktoré chceme zobraziť, a posunúť ich šablóne. Čiže vo *viewe* sa rozhodne, čo (resp. ktorý model) bude zobrazené v šablóne.

Dobre, takže ako toto dosiahneme?

Musíme otvoriť náš `blog/views.py` v editore. Zatiaľ *view* `post_list` vyzerá takto:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Pamätáš si, keď sme sa rozprávali o vložení kódu napísaného v rozdielnych súboroch? Teraz nastal čas, kedy musíme vložiť model, ktorý sme napísali v `models.py`. Pridáme riadok `from .models import Post` takto:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Bodka za `from` znamená *aktuálny priečinok* alebo *aktuálna aplikácia*. `views.py` aj `models.py` sú v rovnakom priečinku. To znamená, že môžeme použiť `.` a názov súboru (bez `.py`). Potom naimportujeme názov modelu (`Post`).

Ale čo ďalej? Na to, aby sme mohli zobrať konkrétny príspevok blogu z `Post` modelu, potrebujeme niečo, čo sa volá `QuerySet`.

## QuerySet

Už by si mala vedieť, ako fungujú QuerySety. Hovorili sme o tom v kapitole [Django ORM (QuerySety)](../django_orm/README.md).

Takže teraz chceme zoznam zverejnených príspevkov, ktoré sú zoradené podľa `published_date`, však? To sme už spravili v kapitole QuerySety!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Takže poďme otvoriť súbor `blog/views.py` v našom editore a pridajme tento kus kódu do funkcie `def post_list(request)`, ale nezabudni najprv pridať `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Ak chceme zobraziť náš QuerySet v našom zozname blog postov, ešte nám zostáva urobiť dve veci:

1. Poslať náš QuerySet `posts` šablóne tak, že zmeníme, ako voláme funkciu `render`. To spravíme teraz.
2. Upraviť šablónu, aby nám zobrazila náš QuerySet `posts`. K tomuto sa dostaneme v neskoršej kapitole.

Vezmi, prosím, na vedomie, že vytvárame *premennú* pre náš QuerySet: `posts`. Ber to ako meno nášho QuerySetu. Odteraz mu môžeme hovoriť týmto menom.

Vo funkcii `render` už máme jeden parameter `request` (všetko, čo príjmeme od užívateľa či užívateľky cez internet) a ďalší, ktorý hovorí, ktorú šablónu použiť (`'blog/post_list.html'`). Posledný parameter, `{}`, je miestom, kam môžeme pridať veci, ktoré chceme poslať našej šablóne. Potrebujeme im dať mená (zatiaľ sa budeme držať `'posts'`). :) Malo by to vyzerať takto: `{'posts': posts}`. Všimni si, že časť pred `:` je reťazec: potrebuješ ju obaliť do úvodzoviek:`"`.

Nakoniec by náš súbor `blog/views.py` mal vyzerať takto:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

To je všetko! Čas prejsť na našu šablónu a zobraziť tento QuerySet!

Pokiaľ si chceš prečítať niečo viac o QuerySetoch v Djangu, mala by si sa pozrieť sem: https://docs.djangoproject.com/en/3.2/ref/models/querysets/