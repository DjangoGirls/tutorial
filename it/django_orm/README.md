# Django ORM e QuerySets

In questo capitolo imparerai come Django si collega al database e archivia i dati al suo interno. Tuffiamoci!

## Cos'è un QuerySet?

Un QuerySet è in sostanza una lista di oggetti di un Model. Ti permettono di leggere i dati dal database, filtrarli e ordinarli.

È più facile impararlo con un esempio. Proviamo, ti va?

## La shell di Django

Apri la tua console locale (non su PythonAnywhere) e digita questo comando:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

L'effetto dovrebbe essere come questo:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Ora ti trovi nella consolle interattiva di Django. E' come il prompt di python ma con un po' di magia di Django in più :). Qui puoi anche utilizzare tutti i comandi Python, ovviamente.

### Tutti gli oggetti

Proviamo a rendere visibili tutti i nostri post prima. Puoi farlo con il seguente comando:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ops! È comparso un errore. Ci dice che non c'è nessun Post. È corretto -- ci siamo dimenticati di importarlo!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

È semplice: importiamo il modello `Post` da `blog.models`. Proviamo a rendere di nuovo visibili tutti i post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

È la lista dei post che abbiamo creato prima! Li abbiamo creati utilizzando l'interfaccia di amministrazione di Django. Se volessimo crearne uno con Python, come dovremmo fare?

### Creare oggetti

Così si crea un nuovo oggetto Post nel database:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ma manca un ingrediente qui: `me`. Dobbiamo passare un'istanza del modello `User` come un autore. Come si fa?

Importiamo il modello User prima:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Quali utenti abbiamo nel nostro database? Prova questo:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Questo è il superutente che abbiamo creato prima! Ora riceviamo un'istanza dell'utente (regolare questa linea per utilizzare il tuo nome utente):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Come puoi vedere, ora `riceviamo` un `Utente` con un `username` che equivale a 'ola'. Vicino!

Adesso possiamo finalmente creare il nostro post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Evviva! Vuoi controllare se funziona?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Eccolo, un altro post nell'elenco!

### Aggiungi altri post

Ora puoi divertirti un po' ed aggiungere altri post per vedere come funziona. Aggiungi altri 2 o 3 e vai alla prossima parte.

### Filtrare gli oggeti

Larga parte parte dei QuerySets consiste nell'abilità di filtrarli. Diciamo che vogliamo trovare tutti i post il cui autore è ola. Useremo `filter` invece di `all` in `Post.objects.all()`. Nelle parentesi andremo ad inserire tutte le condizioni che un Post deve avere per essere nel nostro queryset. Nella nostra situazione è `autore` che è uguale a `me`. Il modo di scriverlo in Django è `autore=me`. Ora il nostro pezzo di codice ha questo aspetto:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

O magari vogliamo vedere tutti i post che contengono la parola 'titolo' nel campo `titolo`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Nota** ci sono due caratteri di sottolineatura (`_`) tra `titolo` e `contains`. L'ORM di Django usa questa regola per separare i nomi dei field ("title") dalle operazioni e dai filtri ("contains"). Se usi solo un carattere di sottolineatura, otterrai un errore come "FieldError: non è possibile risolvere la parola chiave title_contains".

Puoi anche ottenere una lista di tutti i post pubblicati. Lo facciamo filtrando tutti i post che hanno una `published_date` impostata in passato:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Purtroppo, il post che abbiamo aggiunto dalla console Python non è ancora pubblicato. Possiamo modificarlo! In primo luogo ottenere un'istanza di un post che vogliamo pubblicare:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Ora pubblicalo con il nostro metodo `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Ora cerca di ottenere di nuovo l'elenco dei post pubblicati (premere il pulsante di freccia in su 3 volte e premere `invio`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordinare gli oggetti

I QuerySet ti permettono anche di ordinare le liste di oggetti. Proviamo a ordinarli in base al campo `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Possiamo anche invertire l'ordine aggiungendo `-` all'inizio:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Query complesse attraverso la catena di metodo

Come hai visto, alcuni metodi su `Post.objects` restituiscono un QuerySet. Gli stessi metodi possono a loro volta essere chiamati su un QuerySet, e poi restituiranno un nuovo QuerySet. Puoi anche combinare QuerySets ** concatenandole** insieme:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

È davvero potente e ti permette di scrivere query piuttosto complesse.

Fantastico! Ora sei pronta per la prossima parte! Per chiudere la shell, digita questo:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```