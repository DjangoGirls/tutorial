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

Punct înainte de `models` înseamnă *directoriu curent* sau *aplicație curentă*. `views.py` și `models.py` sunt în același directoriu. This means we can use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

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

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

So finally our `blog/views.py` file should look like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/