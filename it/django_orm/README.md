# Django ORM e i QuerySet

In questo capitolo imparerai come Django si collega al database e archivia i dati al suo interno. Tuffiamoci!

## Cos'è un QuerySet?

Un QuerySet, in sostanza, è una lista di oggetti di un determinato Modello. Il QuerySet ti permette di leggere il dato dal database, filtrarlo e ordinarlo.

È più facile impararlo con un esempio. Proviamo, ti va?

## La shell di Django

Apri la tua console locale (non su PythonAnywhere) e digita questo comando:

    (myvenv) ~/djangogirls$ python manage.py shell


L'effetto dovrebbe essere come questo:

    (InteractiveConsole)
    >>>


Ora ti trovi nella consolle interattiva di Django. È come il prompt di python ma con un po' di magia di Django in più :). Qui puoi anche utilizzare tutti i comandi Python, ovviamente.

### Tutti gli oggetti

Proviamo a rendere visibili tutti i nostri post prima. Puoi farlo con il seguente comando:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined


Ops! È comparso un errore. Ci dice che non c'è nessun Post. È corretto -- ci siamo dimenticati di importarlo!

    >>> from blog.models import Post


È semplice: importiamo il modello `Post` da `blog.models`. Proviamo a rendere di nuovo visibili tutti i post:

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>]>


È una lista di post che abbiamo creato prima! Abbiamo creato questi post usando l'interfaccia di ammisnistrazione di Django. Comunque sia, ora vogliamo creare nuovi post usando Python, quindi come lo facciamo?

### Creare oggetti

Così si crea un nuovo oggetto Post nel database:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')


Ma manca un ingrediente qui: `me`. Dobbiamo passare un'istanza del modello `User` come un autore. Come si fa?

Importiamo il modello User prima:

    >>> from django.contrib.auth.models import User


Quali utenti abbiamo nel nostro database? Prova questo:

    >>> User.objects.all()
    <QuerySet [<User: ola>]>


È il superuser che abbiamo creato prima! Ora prendiamo un'istanza del user:

    me = User.objects.get(username='ola')


Come puoi vedere, ora prendiamo `(get)` un `User` con un `username` che è uguale a 'ola'. Ben fatto, devi cambiarlo con il tuo username.

Adesso possiamo finalmente creare il nostro post:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')


Evviva! Vuoi controllare se funziona?

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>


Eccolo, un altro post nell'elenco!

### Aggiungi altri post

Ora puoi divertirti un po' ed aggiungere altri post per vedere come funziona. Aggiungi altri 2 o 3 e vai alla prossima parte.

### Filtrare gli oggeti

Larga parte parte dei QuerySet consiste nell'abilità di filtrarli. Diciamo che vogliamo trovare tutti i post che hanno come autore l'Utente ola. Useremo `filter` invece di `all` in `Post.objects.all()`. Tra parentesi affermeremo le condizioni che un blog post deve soddisfare per finire nel nostro queryset. Nella nostra situazione è `autore` che è uguale a `me`. Il modo di scriverlo in Django è `autore=me`. Ora il nostro pezzo di codice ha questo aspetto:

    >>> Post.objects.filter(author=me)
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>


O magari vogliamo vedere tutti i post che contengono la parola 'titolo' nel campo `titolo`?

    >>> Post.objects.filter(title__contains='title')
    <QuerySet [<Post: Sample title>, <Post: 4th title of post>]>


> **Nota** ci sono due caratteri di sottolineatura (`_`) tra `titolo` e `contains`. L'ORM di Django usa questa sintassi per separare i nomi dei campi ("titolo") ed operazioni o filtri ("contiene"). Se usi solo un carattere di sottolineatura, otterrai un errore come "FieldError: non è possibile risolvere la parola chiave title_contains".

Puoi anche ottenere una lista di tutti i post pubblicati. Lo facciamo filtrando tutti i post che hanno una `published_date` impostata in passato:

    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

Purtroppo, il post che abbiamo aggiunto dalla console Python non è ancora pubblicato. Possiamo modificarlo! In primo luogo ottenere un'istanza di un post che vogliamo pubblicare:

    >>> post = Post.objects.get(title="Sample title")


Ora pubblicalo con il nostro metodo `publish`!

    >>> post.publish()


Ora cerca di ottenere di nuovo l'elenco dei post pubblicati (premere il pulsante di freccia in su 3 volte e premere `invio`):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    <QuerySet [<Post: Sample title>]>


### Ordinare gli oggetti

I QuerySet ti permettono anche di ordinare le liste di oggetti. Proviamo a ordinarli in base al campo `created_date`:

    >>> Post.objects.order_by('created_date')
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>


Possiamo anche invertire l'ordine aggiungendo `-` all'inizio:

    >>> Post.objects.order_by('-created_date')
    <QuerySet [<Post: 4th title of post>, <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>


### QuerySet di concatenamento

Puoi anche combinare QuerySet ** concatenandole** insieme:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')


È davvero potente e ti permette di scrivere query piuttosto complesse.

Fantastico! Ora sei pronta per la prossima parte! Per chiudere la shell, digita questo:

    >>> exit()
    $
