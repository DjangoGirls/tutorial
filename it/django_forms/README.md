# Form Django

Infine vogliamo creare un bel modo per poter aggiungere e cambiare in nostri blog posts. Django `admin` è bello, ma è alquanto difficile da personalizzare e rendere carino. Con `forms` avremo il controllo totale sulla nostra interfaccia - possiamo fare praticamente tutto quello ce vogliamo!

La bella cosa dei Django forms è che possiamo sia inventare un nuovo form da zero che creare un `ModelForm` che salverà il risultato del form sul nostro modello.

Questo è esattamente quello che stiamo per fare: stiamo per creare un form per il nostro modello dei `Post`.

Come ogni parte importante di Django, i forms hanno il proprio file: `forms.py`.

Dobbiamo creare un file con questo nome all'interno della cartella `blog`.

    blog
       └── forms.py
    

Ok, apriamolo nell'editor di codice e digitiamo quanto segue:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Dobbiamo importare prima di tutto i Django Forms (`from django import forms`) e, ovviamente, il nostro `Post` model (`from .models import Post`).

`PostForm`, come probabilmente hai intuito, è nome del nostro form. Dobbiamo ora dire a Django che questa form é una `ModelForm` (così Django farà qualche magia per noi)- `forms.ModelForm` è il comando per farlo.

Successivamente, abbiamo `class Meta`, con cui diciamo a Django quale model utilizzare per creare questo form (`model = Post`).

Finalmente, possiamo indicare uno o più campi che il nostro form deve avere. In questo caso vogliamo che solamente `title` e `text` siano visibili -`author` è la persona attualmente connessa (tu!) e `created_date` dovrebbe generarsi da sola ogni volta che creiamo un post (cioè nel nostro programma), giusto?

E questo è tutto! Tutto quello che dobbiamo fare ora é usare il form nella nostra *view* e visualizzarlo nel template.

Quindi creeremo di nuovo un link alla pagina, un URL, una view e un template.

## Link ad una pagina usando il form

Prima di aggiungere il link, abbiamo bisogno di alcune icone da usare come pulsanti per il link. Per questo tutorial, scarica [file-earmark-plus.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/file-earmark-plus.svg) e salvalo nella cartella `blog/templates/blog/icons/`

> Nota: Per scaricare l'immagine SVG, aprire il menu contestuale sul link (di solito facendo clic destro su di essa) e selezionare "Salva collegamento come". Nella finestra di dialogo che ti chiede dove salvare il file, vai alla directory `djangogirls` del tuo progetto Django, e all'interno di questo fino alla sottodirectory `blog/templates/blog/icons/`, e salvare il file lì.

È ora di aprire `blog/templates/blog/base.html` nell'editor di codice. Ora possiamo usare questo file di icone all'interno del modello di base come segue. Nell'elemento `div` all'interno della sezione `header` , aggiungeremo un link prima dell'elemento `h1`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

Nota che vogliamo chiamare la nostra nuova view `post_new`. L'[icona SVG](https://icons.getbootstrap.com/icons/file-earmark-plus/) è fornita dal [Bootstrap Icons](https://icons.getbootstrap.com/) e mostrerà un'icona di pagina con il segno 'più'. Utilizziamo una direttiva sui modelli Django chiamata `include`. Questo immetterà il contenuto del file nel modello Django. Il browser web sa come gestire questo tipo di contenuto senza ulteriori elaborazioni.

> Puoi scaricare tutte le icone di Bootstrap [qui](https://github.com/twbs/icons/releases/download/v1.11.3/bootstrap-icons-1.11.3.zip). Scompattare il file e copiare tutti i file immagine SVG in una nuova cartella all'interno `blog/templates/blog/` chiamata `icone`. In questo modo è possibile accedere a un'icona come `pencil-fill.svg` utilizzando il percorso del file `blog/templates/blog/icons/pencil-fill.svg`

Dopo aver modificato la riga, il file HTML dovrebbe ora assomigliare a questo:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
            <div class="container">
                <a href="{% url 'post_new' %}" class="top-menu">
                    {% include './icons/file-earmark-plus.svg' %}
                </a>
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
        </header>
        <main class="content container">
            <div class="row">
                <div class="col">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </main>
    </body>
</html>
```

Dopo aver salvato e aggiornato la pagina http://127.0.0.1:8000 vedrai un errore che già conosci: `NoReverseMatch`. Lo vedi? Bene!

## URL

Apriamo `blog/urls.py` nell'editor di codice e aggiungiamo:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

E il codice finale sarà così:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Dopo aver aggiornato il sito, vedremo un `AttributeError` dal momento che non abbiamo la view `post_new` implementata. Aggiungiamolo, adesso.

## post_new view

È ora di aprire i `blog/views. y` file nell'editor di codice e aggiungere le seguenti righe con il resto delle `da` righe:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

E poi la nostra *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Per creare un nuovo modulo `Post`, dobbiamo richiamare `PostForm()` e passarlo nel nostro modello. Torneremo sulla *view* in seguito, ma per ora creiamo velocemente un modello per il modulo.

## Template

Dobbiamo creare un file `post_edit. tml` nella directory `blog/templates/blog` , e aprilo nell'editor di codice. Per far si che un modulo funzioni, abbiamo bisogno di diverse cose:

* Dobbiamo visualizzare il form. Possiamo farlo con (ad esempio) {% raw %}`{{ form.as_p }}`{% endraw %}.
* La riga sopra deve essere racchiuso con un elemento di forma HTML: `<form method="POST">...</form>`.
* Ci serve un `Save` pulsante. Possiamo fare Ciò con HTML button: `<button type="submit">Save</button>`.
* E infine, subito dopo l'apertura `<form ...>` abbiamo bisogno di aggiungere {% raw %}`{% csrf_token %}`{% endraw %}. Questo passaggio è molto importante dal momento che rende il nostro form sicuro! Se dimentichi di questo bit, Django si lamenterà quando tenterai di salvare il modulo:

![CSFR Forbidden page](images/csrf2.png)

OK, quindi vediamo come dovrebbe apparire l'HTML in `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
     <h2>New post</h2>
     <form method="POST" class="post-form">{% csrf_token %}
         {{ form.as_p }}
         <button type="submit" class="save btn btn-default">Save</button>
     </form>
{% endblock %}
```

Aggiorna la pagina! Yay! Il tuo modulo è visualizzato!

![Nuovo Modulo](images/new_form2.png)

Ma, aspetta un momento! Se provi a scrivere qualcosa nei campi`titolo` e `testo` e cerchi di salvare ciò che hai scritto- che cosa succede?

Nulla! Siamo ancora una volta nella stessa pagina e il nostro testo è andato perduto… e nessun nuovo post è stato aggiunto. Quindi cosa è andato storto?

La risposta è: nulla. Dobbiamo solo fare un po' di lavoro in più nella nostra *view*.

## Salvare il form

Apri ancora una volta `blog/views.py`. Attualmente tutto quello che abbiamo nella view `post_new` è:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Quando inviamo il form, veniamo riportati alla stessa view, ma questa volta abbiamo più dati in `request`, in particolare in `request.POST` (il nome non ha nulla a che vedere con un blog "post", bensì con l'inglese "posting", ovvero inviare, in questo caso dati). Ricordate come nel file HTML, la nostra definizione `<form>` aveva la variabile `method="POST"`? Tutti i campi dal modulo sono ora in `request.POST`. Non è necessario rinominare `POST` in nessuna altra maniera (l'unico altro valore valido per `method` è `GET`, ma al momento non abbiamo abbastanza tempo per spiegare la differenza).

Quindi, nella nostra *view* abbiamo due situazioni separate da gestire: prima, quando accediamo la pagina per la prima volta e vogliamo un modulo vuoto, e poi, quando torniamo alla *view* con tutti i dati del modulo che abbiamo appena digitato. Per cui dobbiamo aggiungere una condizione(useremo `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

È ora di riempire i punti `[...]`. Se `metodo` è `POST` allora vogliamo costruire il `PostForm` con dati dal modulo, giusto? Lo faremo come segue:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

La cosa successiva è controllare se il modulo è corretto (tutti i campi obbligatori sono impostati e non sono stati inviati valori errati). Lo facciamo con `form.is_valid()`.

Verifichiamo se il modulo è valido e se è così, possiamo salvarlo!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

In pratica, ci sono due cose da fare: salviamo il modulo con `form.save` e aggiungiamo un autore(dal momento che non c'era nessun campo autore `author` nel modulo `PostForm` e questo campo non può essere lasciato bianco). `commit=False` significa che non vogliamo ancora salvare il modello `Post` - vogliamo aggiungere prima l'autore. La maggior parte del tempo userai `form.save()` senza `commit=False`, ma in questo caso dobbiamo fornirlo. `post.save()` manterrà le modifiche (aggiungendo l'autore) ed un nuovo post del blog è stato creato!

Infine, sarebbe fantastico se potessimo andare immediatamente alla pagina `post_detail` per il nostro post appena creato, giusto? Per fare questo abbiamo bisogno di un'altra importazione:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Aggiungilo all'inizio del tuo file. E ora possiamo dire: "vai alla pagina `post_detail` per il post appena creato":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` è il nome della view su cui vogliamo andare. Ti ricordi che questa *view* ha bisogno della variabile `pk`? Per passare alle views, usiamo `pk=post.pk`, dove `post` è il post appena creato!

OK, abbiamo parlato molto, ma probabilmente vogliamo vedere come appare l'intera *view* ora, giusto?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Vediamo se funziona. Vai alla pagina http://127.0.0.1:8000/post/new/, aggiungi un `titolo` e `testo`, salvalo… e voilà! Il nuovo post è stato aggiunto e siamo reindirizzati alla pagina `post_detail`!

Potresti aver notato che stiamo impostando la data di pubblicazione prima di salvare il post. Più tardi, introdurremo un *pulsante pubblcia* nel **Django Girls Tutorial: Estensioni**.

Fantastico!

> Poiché abbiamo recentemente utilizzato l'interfaccia di admin di Django, il sistema attualmente ritiene che siamo ancora loggati. Ci sono alcune situazioni che potrebbero portarci a disconnetterci (chiusura del browser, riavvio del DB, ecc.). Se, quando si crea un post, si scopre che si stanno ricevendo errori in riferimento alla mancanza di un utente loggato, vai alla pagina admin http://127.0.0.1:8000/admin e accedi di nuovo. Questo risolverà temporaneamente il problema. C'è una correzione permanente che ti aspetta nella sezione degli esercizi extra alla fine del tutorial principale **Compiti: aggiungi sicurezza al tuo sito web!**.

![Registrato con un errore](images/post_create_error.png)

## Validazione del form

E adesso ti dimostreremo quanto siano belli i moduli di Django. Un post del blog deve avere dei campi per il `titolo` ed il `testo`. Nel nostro modello `Post` non abbiamo detto che questi campi (contrariamente a `published_date`) non sono richiesti, quindi Django, di default, si aspetta che siano impostati.

Prova a salvare il modulo senza `titolo` e `testo`. Indovina cosa accadrà!

![Convalida del modulo](images/form_validation2.png)

Django si incarica di verificare che tutti i campi nel nostro modulo siano corretti. Non è fantastico?

## Form di modifica

Ora sappiamo come aggiungere un nuovo post. Ma cosa succede se ne vogliamo cambiarne uno esistente? E' molto simile a quanto abbiamo appena fatto. Creiamo rapidamente alcune cose importanti. (Se non capisci qualcosa, dovresti chiedere al tuo coach o guardare i capitoli precedenti, poiché abbiamo già affrontato tutti questi passi.)

Innanzitutto, salviamo l'icona che rappresenta il pulsante di modifica. Scarica [pencil-fill.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/pencil-fill.svg) e salvalo nella posizione `blog/templates/blog/icons/`.

Apri `blog/templates/blog/post_detail.html` nell'editor di codice e aggiungi il seguente codice all'interno dell'elemento `article`:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<aside class="actions">
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
      {% include './icons/pencil-fill.svg' %}
    </a>
</aside>
```

così che il modello sarà così:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <article class="post">
        <aside class="actions">
            <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
                {% include './icons/pencil-fill.svg' %}
            </a>
        </aside>
        {% if post.published_date %}
            <time class="date">
                {{ post.published_date }}
            </time>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endblock %}
```

Apri `blog/urls.py` nell'editor del codice e aggiungi questa riga:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Riutilizzeremo il modello `blog/templates/blog/post_edit.html`, quindi l'ultima cosa che manca è una *view*.

Apriamo `blog/views.py` nell'editor del codice e aggiungiamolo alla fine del file:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Questo sembra quasi esattamente la view `post_new`, giusto? Ma non del tutto. Per una, passiamo un parametro `pk` extra da `urls`. Successivamente, otteniamo il modello `Post` che vogliamo modificare con `get_object_or_404(Post, pk=pk)` e poi, quando creiamo un modulo, passiamo questo post come `istanza`, sia quando salviamo il modulo…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…e quando abbiamo appena aperto un modulo con questo post per modificare:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, vedi se funziona! Vai alla pagina `post_detail` . Dovrebbe esserci un pulsante di modifica nell'angolo in alto a destra:

![Pulsante modifica](images/edit_button2.png)

Quando ci clicchi, vedrai il modulo con i nostri post del blog:

![Modificare il modulo](images/edit_form2.png)

Sentiti libero di cambiare il titolo o il testo e salvare le modifiche!

Complimenti! La tua application è sempre più completa!

Se necessiti di altre informazioni sui moduli di Django, dovresti leggere la documentazione: https://docs.djangoproject.com/en/2.2/topics/forms/

## Sicurezza

Riuscire a creare nuovi post semplicemente cliccando su un link è bellissimo! Ma in questo momento chiunque visiti il tuo sito potrà creare un nuovo post sul blog, e probabilmente non è qualcosa che vuoi. Facciamo spuntare il bottone solo per te e non per gli altri.

Apri `blog/template/blog/base.html` nell'editor del codice, trova il nostro `div` all'interno dell'`intestazione` e il tag di ancoraggio che hai inserito in precedenza. Dovrebbe essere così:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

Aggiungeremo un altro tag `{% if %}` , che farà apparire il link solo per gli utenti che hanno effettuato l'accesso nell'admin. In questo momento, è solo voi! Cambia l'elemento `<a>` per farlo assomigliare a questo:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu">
        {% include './icons/file-earmark-plus.svg' %}
    </a>
{% endif %}
```

Questo `{% if %}` causerà l'invio del link al browser solo se l'utente che richiede la pagina è loggato. Questo non protegge completamente la creazione di nuovi post, ma è un buon primo passo. Ci occuperemo di più sicurezza nelle lezioni di estensione.

Ricordi l'icona modifica che abbiamo aggiunto sulla nostra pagina di dettaglio? Vogliamo faro la stessa cosa qui, così le altre persone non potranno editare i post esistenti.

Apri `blog/templates/blog/post_detail.html` nell'editor del codice e trova questa riga:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
    {% include './icons/pencil-fill.svg' %}
</a>
```

Cambialo in questo:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
        {% include './icons/pencil-fill.svg' %}
     </a>
{% endif %}
```

Siccome probabilmente sei loggata, se ricarichi la pagina non vedrai differenze. Carica la pagina in un browser diverso o in una finestra incognita (chiamata "InPrivate" in Windows Edge), tuttavia, e vedrai che il link non viene mostrato in alto, e l'icona non viene visualizzata!

## Ultima cosa: ora di fare il deploy!

Vediamo se funziona su PythonAnywhere. È l'ora di ripartire!

* Prima di tutto, esegui il tuo nuovo codice e push fino a GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Poi, in una [console PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Ricordati di sostituire `<your-pythonanywhere-domain>` con il sottodominio di PythonAnywhere, senza le parentesi angolo.)

* Infine, salta alla pagina [ "Web" ](https://www.pythonanywhere.com/web_app_setup/) (usa il pulsante menu in alto a destra della console) e premi **Ricarica**. Aggiorna il tuo blog https://subdomain.pythonanywhere.com per vedere le modifiche.

Ecco fatto! Congratulazioni!