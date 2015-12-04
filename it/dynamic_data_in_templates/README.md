# I dati dinamici nei templates

Abbiamo diversi pezzi: il modello `Post` è definito in `models.py`, abbiamo `post_list` nel file `views.py` ed abbiamo aggiunto il template. Ma come faremo a far comparire i nostri post nel nostro template HTML? Perché questo è quello che vogliamo: prendere qualche contenuto (modelli salvati nel database) e farlo vedere in modo carino nel nostro template, giusto?

Questo è esattamente quello che le *views* dovrebbero fare: collegare i modelli ed i template. Nella nostra `post_list` *view* avremo bisogno di prendere i modelli che vogliamo far vedere e passarli nel template. Quindi praticamente nella *view* decidiamo cosa (modello) renderemo visibile nel template.

OK, quindi come facciamo a farlo?

Dobbiamo aprire il nostro `blog/views.py`. Per ora `post_list` *view* si vede così:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Ricordi quando abbiamo parlato di includere codice scritto in diversi file? Ora è il momento di includere il model che abbiamo scritto in `models.py`. Aggiungeremo questa riga `from .models import Post` così:

```python
from django.shortcuts import render
from .models import Post
```

Il punto dopo il `from` significa *directory attuale* oppure *applicazione attuale*. Dal momento che `views.py` e `models.py` sono nella stessa directory possiamo semplicemente utilizzare `.` ed il nome del file (senza `.py`). Allora importiamo il nome del modello (`Post`).

Cos'altro bisogna fare? Per poter prendere i post del blog dal modello`Post` ci serve una cosa chiamata `QuerySet`.

## QuerySet

Dovresti già sapere come funziona QuerySet. Ne abbiamo parlato nel capitolo [Django ORM (QuerySets) ][1].

 [1]: ../django_orm/README.md

Quindi ora ci interessa una lista di post del blog che sono pubblicati e organizzati da `published_date`, giusto? Lo abbiamo già fatto nel capitolo sulle QuerySet!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')


Adesso mettiamo questo pezzo di codice nel file `blog/views.py` aggiungendolo alla funzione `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Nota che abbiamo creato una *variabile* per il nostro QuerySet: `posts`. Vedila come il nome del nostro QuerySet. Da qui in avanti possiamo riferirci ad esso con questo nome.

Il codice utilizza anche la funzione `timezone.now()`, quindi dobbiamo aggiungere un import per `timezone`.

L'ultima cosa che manca è passare la QuerySet `posts` nel template (ci occuperemo di come renderlo visibile nel prossimo capitolo).

Nella funzione `render` abbiamo già un parametro con `request` (quindi tutto quello che riceviamo dal nostro utente via internet) e un file template `'blog/post_list.html'`. Nell'ultimo parametro, che è simile a questo: `{}` possiamo aggiungere cose che il template possa utilizzare. Dobbiamo dargli un nome (ci atterremo a `'posts'` per il momento :)). Si vede così: `{'posts': posts}`. Ti preghiamo di notare che la parte prima di `:` è una stringa; devi metterla tra virgolette `''`.

Il nostro file `blog/views.py` dovrà risultare così:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

È tutto! Ora di tornare al nostro template e rendere visibile questo QuerySet!

Se vuoi leggere di più sui QuerySets in Django dovresti dare un'occhiata qui: https://docs.djangoproject.com/en/1.8/ref/models/querysets/