# I dati dinamici nei templates

Abbiamo diversi pezzi: il modello `Post` è definito in `models.py`, abbiamo `post_list` nel file `views.py` ed abbiamo aggiunto il template. Ma come faremo a far comparire i nostri post nel nostro template HTML? Perché è quello che vogliamo: prendere qualche contenuto (modelli salvati nel database) e farlo vedere in modo carino nel nostro template, giusto?

Questo è esattamente quello che le *views* dovrebbero fare: collegare i modelli ed i template. Nella nostra `post_list` *view* avremo bisogno di prendere i modelli che vogliamo far vedere e passarli nel template. Nella *view* decidiamo cosa (modello) renderemo visibile nel template.

OK, quindi come facciamo a farlo?

Dobbiamo aprire il nostro `blog/views.py`. Per ora `post_list` *view* si vede così:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Ricordi quando abbiamo parlato di includere codice scritto in diversi file? Ora è il momento di includere il model che abbiamo scritto in `models.py`. Aggiungeremo questa riga `from .models import Post` così:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Il punto prima di `models` significa *directory attuale* oppure *applicazione attuale*. Sia `views.py` che `models.py` sono nella stessa cartella. Questo significa che possiamo usare `.` seguito dal nome del file (senza `.py`). Allora importiamo il nome del modello (`Post`).

Cos'altro bisogna fare? Per poter prendere i post del blog dal modello`Post` ci serve una cosa chiamata `QuerySet`.

## QuerySet

Dovresti già sapere come funziona QuerySet. Ne abbiamo parlato nel capitolo [Django ORM (QuerySets) ](../django_orm/README.md).

Quindi ora vogliamo i post del blog che sono pubblicati ordinati per `published_date`, giusto? Lo abbiamo già fatto nel capitolo sulle QuerySet!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Quindi, apriamo il file `blog/views.py` nell'editor del codice, e aggiungiamo questo codice alla funzione `def post_list(request)` -- ma non dimenticare di aggiungere prima `da django.utils import timezone`:

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

Nota che abbiamo creato una *variabile* per il nostro QuerySet: `posts`. Vedila come il nome del nostro QuerySet. Da qui in avanti possiamo riferirci ad esso con questo nome.

Nella funzione `render` abbiamo già un parametro con `request` (quindi tutto quello che riceviamo dal nostro utente via internet) e un file template `'blog/post_list.html'`). Nell'ultimo parametro, che è simile a questo: `{}` possiamo aggiungere cose che il template possa utilizzare. Dobbiamo dargli un nome (ci atterremo a `'posts'` per il momento). :) Si vede così: `{'posts': posts}`. Ti preghiamo di notare che la parte prima di `:` è una stringa; devi metterla tra virgolette.

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

Vuoi leggere un poco di più su QuerySets in Django? Dovresti guardare qui: https://docs.djangoproject.com/en/2.2/ref/models/querysets/