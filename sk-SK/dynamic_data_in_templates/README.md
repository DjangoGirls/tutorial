# Dynamické dáta v šablónach

Máme rozdielne kúsky na svojom mieste: `Post` model je definovaný v `models.py`, máme `post_list` v `views.py` a pridanú šablónu. Ale ako prinútime HTML šablónu, aby zobrazovala náš príspevok? Pretože to je to, čo chceme urobiť - vziať nejaký obsah (modely uložené v databáze) a zobraziť ich pekne v našej šablóne, že?

To je presne to, čo majú *views* robiť: spojiť modely a šablóny. V našom `post_list` *view* potrebujeme vziať modely ktoré chceme zobraziť a posunúť ich do šablóny. Takže sa rozhodneme vo *view* čo (model) bude zobrazené v šablóne.

Dobre, takže ako toto dosiahneme?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Pamätáš si, keď sme rozprávali o zahrnutí kódu napísanom v rozdielnych súboroch? Teraz nastal čas kedy musíme zahrnúť model, ktorý sme napísali v `models.py`. Pridáme tento riadok `from .models import Post` takto:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Bodka za `from` znamená *aktuálna zložka* alebo *aktuálna aplikácia*. `views.py` aj `models.py` sú v rovnakom adresári. To znamená, že môžeme použiť `.` a názov súboru (bez `.py`). Potom importujeme názov modelu (`Post`).

Ale čo ďalej? Na to aby sme boli schopní vziať konkrétny príspevok blogu z `Post` modelu potrebujeme niečo, čo sa volá `QuerySet`.

## QuerySet

Už by si mala vedieť ako funguje QuerySets. Hovorili sme o tom v kapitole [Django ORM (QuerySets)](../django_orm/README.md).

Takže teraz chceme zoznam príspevkov, ktoré sú uverejnené a zoradené podľa `published_date`, však? To sme už spravili v kapitole QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Vezmi prosím na vedomie, že vytvárame *premennú* pre náš QuerySet: `posts`. Považuj to za meno nášho QuerySetu. Odteraz ho môžeme referovať pod týmto menom.

V `render` funkcii už máme jeden parameter `request` (všetko čo príjmeme od užívateľa cez Internet) a ďalší ktorý poskytuje súbor šablóny `'blog/post_list.html'`). Posledný parameter, `{}` je miesto na ktoré môžeme dať nejaké veci ktoré môže použiť šablóna. Potrebujeme im dať mená (zatiaľ sa budeme držať `'posts'`). :) Malo by to vyzerať takto: `{'posts': posts}`. Všimni si, že časť pred `:` je reťazec: potrebuješ ju obaliť do úvodzoviek:`"`.

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/