# I dati dinamici nei templates

Abbiamo diversi pezzi: il modello `Post` è definito in `models.py`, abbiamo `post_list` nel file `views.py` ed abbiamo aggiunto il template. Ma come faremo a far comparire i nostri post nel nostro template HTML? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

Questo è esattamente quello che le *views* dovrebbero fare: collegare i modelli ed i template. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. Nella *view* decidiamo cosa (modello) renderemo visibile nel template.

OK, so how will we achieve this?

Dobbiamo aprire il nostro `blog/views.py`. Per ora `post_list` *view* si vede così:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Ricordi quando abbiamo parlato di includere codice scritto in diversi file? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Il punto prima di `models` significa *directory attuale* oppure *applicazione attuale*. Sia `views.py` che `models.py` sono nella stessa cartella. Questo significa che possiamo usare `.` seguito dal nome del file (senza `.py`). Allora importiamo il nome del modello (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

Quindi ora vogliamo i post del blog che sono pubblicati ordinati per `published_date`, giusto? Lo abbiamo già fatto nel capitolo sulle QuerySet!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

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

Nota che abbiamo creato una *variabile* per il nostro QuerySet: `posts`. Vedila come il nome del nostro QuerySet. Da qui in avanti possiamo riferirci ad esso con questo nome.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Dobbiamo dargli un nome (ci atterremo a `'posts'` per il momento). :) Si vede così: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Finalmente il nostro file `blog/views.py` dovrebbe essere così:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

E' tutto! Ora di tornare al nostro template e rendere visibile questo QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/