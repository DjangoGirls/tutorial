# Date dinamice în template-uri

Avem câteva lucruri: model `Post` care este definit în `models.py`, `post_list` în `views.py` și template. Dar cum să facem ca posturile noastre să apare în template-ul HTML? Pentru că ceea ce noi dorim este de a arăta careva content (modele salvate în baza de date) în template-ul, corect?

Acesta este ceea ce *views* trebuie să facă: conecta modele și template-uri. În *view* `post_list` trebuie să obținem pe toate modele, pe care vream să le afișăm și să le transmitem la template. În *view* noi decidem care modele va fi afișate în template.

OK, dar cum obținem asta?

Trebuie să deschidem `blog/views.py` în editorul de cod. Până când `post_list` *view* este următor:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Țineți minte am vorbit despre încorporarea codului care este scris în fișiere diferite? Acum este momentul când trebuie să includem modelul pe care l-am scris în `models.py`. O să adăugăm linie `from .models import Post` în mod următor:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Punct înainte de `models` înseamnă *directoriu curent* sau *aplicație curentă*. `views.py` și `models.py` sunt în același directoriu. Acesta înseamnă că putem utiliza `.` și denumirea fișierului (fără `.py`). Apoi facem import de denumirea modelului (`Post`).

Dar ce urmează? Pentru a obține posturile de blog din modelul `Post` noi avem nevoie de `QuerySet`.

## QuerySet

Trebuie să știți cum QuerySets lucrează. Acest subiect s-a discutat în [capitolul Django ORM (QuerySets)](../django_orm/README.md).

Acum dorim să obținem posturile de blog sortate după `published_date`, corect? Deja am făcut acesta în capitolul QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Hai să deschidem fișierul `blog/views.py` în editorul de cod, și să adăugăm codul următor în funcție `def post_list(request)` -- dar nu uitați să adăugați `from django.utils import timezone`:

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

Trebuie să atrageți atenția că creați o *variabilă* pentru QuerySet: `posts`. Acesta va fi denumirea QuerySet-ului. De acum puteți să-l referiți după dunumire.

În funcția `render` avem un parametru `request` (tot ce primim de la utilizatorul din Internet) și al doilea parametru cu denumirea template-ului (`'blog/post_list.html'`). În ultimul parametru, `{}`, putem adăuga niște variabile care vor fi utilizate în template. Trebuie să le denumim (o să utilizăm `'posts'` până când). :) Trebuie să aibă următoare structură: `{'posts': posts}`. Atrageți atenția că o parte înainte `:` este un șir; trebuie să-l utilizați cu ghilimele: `''`.

În sfârșit fișierul `blog/views.py` trebuie să conțină cod următor:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Asta e! Este timpul să afișăm datele din QuerySet în template!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/