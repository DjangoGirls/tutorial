# Django URL

Stiamo per costruire la nostra pagina web: una homepage per il tuo blog! Ma prima, impariamo un po' di più sulle url di Django.

## Che cos'è un URL?

Una URL è semplicemente un indirizzo web. Puoi vedere una URL ogni volta che visiti un sito web - si vede nella barra degli indirizzi del tuo browser. (sì. (Ma certo che sì! `127.0.0.1:8000` is a URL! Anche `https://djangogirls.org` è una URL.)

![URL](images/url.png)

Ogni pagina internet ha bisogno della sua URL. In questo modo la tua applicazione sa cosa deve mostrare a un utente che visita una URL. In Django usiamo qualcosa chiamato `URLconf` ( configurazione dell'URL). URLconf è un insieme di modelli che Django cercherà di far corrispondere con l'URL ricevuta per trovare la view giusta.

## Come funzionano le URL in Django?

Apriamo il file `mysite/urls.py` nel code editor che hai scelto e vediamo com'è:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import path, include
from django.urls import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Come puoi vedere, Django ha già predisposto qualcosa per noi in questo file.

Le line tra un triplo apice (`'''` o `"""`) sono chiamate docstrings - puoi scriverle all'inizio di file, classi o metodi per descrivere cosa fanno. Verranno ignorati da Python.

L'admin URL , che hai visto nel capitolo precedente è già qui:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Questo significa che per ogni URL che comincia con `admin/` Django troverà la corrispondente *view*. In questo caso stiamo includendo un sacco di admin URL così che non sia tutto imballato in questo piccolo file - è più leggibile e più pulito.

## Il tuo primo URL Django!

E' ora di creare la tua prima URL. Vogliamo usare http://127.0.0.1:8000/ come homepage per il nostro blog e visualizzare il nostro elenco di post.

Vogliamo anche mantenere il file di `mysite/urls.py` pulito, quindi importeremo le url dalla nostra applicazione `blog` sul file principale `mysite/urls.py`.

Vai avanti, aggiungi una linea che importerà `blog.urls`. Dovrai anche cambiare la riga `da django.urls…` perché stiamo usando la funzione `include` qui, quindi dovrai aggiungere questa importazione alla riga.

Il tuo file `mysite/urls.py` ora dovrebbe avere questo aspetto:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Ora Django reindirizzerà tutto ciò che viene da 'http://127.0.0.1:8000/' verso `blog.urls` e cercherà qui ulteriori istruzioni.

## blog.urls

Crea un nuovo file vuoto chiamato `urls.py` nella cartella `blog` e aprilo nell'editor di codice. Tutto a destra! Aggiungi queste prime due righe:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Qui abbiamo importato la funzione `url` di Django e tutte le nostre `views` dalla applicazione `blog` (Non abbiamo ancora nulla, ma ci arriveremo fra un minuto!)

Dopo di che, possiamo aggiungere il nostro primo modello di URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Come vedi, stiamo assegnando una `view` nominata `post_list` alla URL `^$`. Questo modello dell'URL corrisponderà ad una stringa vuota ed al risolutore URL di Django ignorerà il nome del dominio (es., http://127.0.0.1:8000/) che prefissa il percorso URL completo. Questo schema dirà a Django che `views.post_list` è il posto giusto dove andare se qualcuno entra nel tuo sito all'indirizzo 'http://127.0.0.1:8000/'.

L'ultima parte `name='post_list'` è il nome dell'URL che verrà usata per identificare la view. Può avere lo stesso del nome della view, ma può anche essere qualcosa di completamente diverso. Useremo le URL rinominate successivamente nel progetto quindi è importante dare un nome a ciascuna URL nell'app. Inoltre dovremmo cercare di mantenere i nomi delle URL unici e facili da ricordare.

Se provi a guardare adesso http://127.0.0.1:8000/, troverai un qualche tipo di messaggio come 'pagina non disponibile'. Questo perché il server (ricordi quando hai digitato `runserver`?) non è più attivo. Per capirne il motivo dai un occhiata alla console del tuo server.

![Errore](images/error1.png)

La tua console sta mostrando un errore, ma non preoccuparti – è davvero molto utile: ti dice che c'è **nessun attributo 'post_list'**. È il nome della *view* che Django prova a cercare e usare, ma non l'abbiamo ancora creata. In questa fase, anche il tuo `/admin/` non funzionerà. Non ti preoccupare, ci arriveremo. Se vedi un altro messaggio di errore, prova a riavviare il server web. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together). On Windows, you might have to press Ctrl+Break. Then you need to restart the web server by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/