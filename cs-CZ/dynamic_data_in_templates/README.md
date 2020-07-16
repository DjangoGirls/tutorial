# Dynamická data v šablonách

Máme různé části na svém místě: `Post` model je definován v `models.py`, `post_list` máme v `views.py` a máme přidanou šablonu. Ale jak skutečně přinutíme naše příspěvky objevit se v naší HTML šabloně? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

To je přesně to, co *views* mají dělat: spojovat modely a šablony. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Vzpomínáš si, jak jsme mluvili o zahrnování kódu napsaného v různých souborech? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Potom importujeme název modelu (`Post`).

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

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Vezmi, prosím, na vědomí, že jsme vytvořili *proměnnou* pro QuerySet: `posts`. Považuj to za název našeho QuerySetu. Od teď k němu budeme referovat tímto názvem.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Potřebujeme je pojmenovat (teď zůstaneme u `'posts'`). :) Mělo by to vypadat takhle: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

A nakonec by náš `blog/views.py` soubor měl vypadat takhle:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

A je to! Čas jít zpět do šablony a zobrazit tento QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/