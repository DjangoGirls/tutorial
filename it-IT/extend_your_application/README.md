{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Estendi la tua applicazione

We've already completed all the different steps necessary for the creation of our website: we know how to write a model, URL, view and template. We also know how to make our website pretty.

Ora di far pratica!

La prima cosa di cui abbiamo bisogno nel nostro blog è, ovviamente, una pagina per rendere visibile un post, vero?

Abbiamo già un modello dei `Post`, quindi non abbiamo bisogno di aggiungere niente in `models.py`.

## Creare un link di template verso la pagina di dettaglio di un post

Cominceremo aggiungendo un link all'interno del file `blog/templates/blog/post_list.html`. Per ora dovrebbe avere questo aspetto: Aprilo nell'editor di codice, e finora dovrebbe sembrare così: {% filename %}blog/template/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
     {% for post in posts %}
         <div class="post">
             <div class="date">
                 {{ post.published_date }}
             </div>
             <h2><a href="">{{ post.title }}</a></h2>
             <p>{{ post.text|linebreaksbr }}</p>
         </div>
     {% endfor %}
 {% endblock %}
```

{% raw %}Vogliamo creare un link che dal titolo di un post facente parte dell'elenco di articoli porti alla pagina di dettaglio. Cambiamo `<h2><a href="">{{ post.title }}</a></h2>` così che linki alla pagina di dettaglio del post:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}È arrivata l'ora di spiegare il misterioso `{% url 'post_detail' pk=post.pk %}`. Come avrai capito, il simbolo `{% %}` significa che stiamo usando i tag del template di Django. Questa volta ne useremo uno che creerà una URL per noi!{% endraw %}

La parte `post_detail` significa che Django si aspetta un URL in `blog/urls.py` con nome=post_detail

E come si può parlare di `pk=post.pk`? `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Adesso quando andremo all'indirizzo: http://127.0.0.1:8000/ avremo un errore (come sapevamo, dal momento che non abbiamo una URL oppure una *view* per `post_detail`). Avrà questo aspetto:

![Errore: nessuna corrispondenza inversa](images/no_reverse_match2.png)

## Crea una URL per i dettagli di un post

Creiamo una URL in `urls.py` per il nostro `post_detail` *view*!

Vogliamo che il nostro primo post venga visualizzato a questo **URL **: http://127.0.0.1:8000/post/1/

Facciamo sì che l'URL nel file `blog/urls.py` punti Django ad una *view* chiamata `post_detail`, che mostrerà un intero post. Apri il file `blog/urls.py` nell'editor del codice e aggiungi la riga `path('post/<int:pk>/', view.post_detail, name='post_detail'),` così che il file assomiglia a questo:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Questa parte `post/<int:pk>/` specifica un modello URL – lo spiegheremo per te:

- `post/` significa che l'URL deve iniziare con la parola **post** seguita da **/**. Fin qui tutto bene.
- `<int:pk>` – questa parte è più difficile. Significa che Django si aspetta un valore intero e lo trasferirà in una vista come variabile chiamata `pk`.
- `/` – abbiamo bisogno di un **/** di nuovo prima di completare l'URL.

Ciò significa che se digiti `http://127.0.0.1:8000/post/5/` nel tuo browser, Django capirà che stai cercando una *view* chiamata `post_detail` e trasferirà l'informazione che `pk` è uguale a `5` a quella *view*.

Ok, abbiamo aggiunto un nuovo pattern URL in `blog/urls.py`! Prova ad aggiornare la pagina: http://127.0.0.1:8000/ Boom! Il server ha smesso di funzionare di nuovo. Diamo un occhiata alla console - come previsto, c'è una altro errore!

![Errore Attributo](images/attribute_error2.png)

Ti ricordi di quale è il prossimo passo? Ma certo: aggiungere una view!

## Aggiungi una view del post

Questa volta alla nostra *view* viene data un altro parametro `pk`. La nostra *view* deve prenderlo, vero? Quindi definiremo la nostra funzione come `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in `urls` (`pk`). Omettere questa variabile è sbagliato e genererà un errore!

Ora, noi vogliamo ottenere un' unico post. Per farlo possiamo utilizzare le queryset così:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ma questo codice presenta un problema. Se non c'è `Post` con `primary key` (`pk`) otterremo un errore bruttissimo!

![Errore: non esiste](images/does_not_exist2.png)

Noi non lo vogliamo! Ma, senza dubbio, Django ha qualcosa che si occuperà del problema per noi: `get_object_or_404`. Nel caso in cui non ci sia `Post` con la data `pk` mostrerà una pagina molto più carina (chiamata `Page Not Found 404`.

![Pagina non trovata](images/404_2.png)

La buona notizia è che in realtà puoi creare la tua pagina `Page not found` modificarla come vuoi e darle un bell'aspetto. Ma non è importantissimo in questo momento, quindi salteremo questa parte.

Ok, è arrivata l'ora di aggiungere una *view* al nostro file `views.py`!

In `blog/urls.py` abbiamo creato una regola URL chiamata `post_detail` che si riferisce a una vista chiamata `views.post_detail`. Ciò significa che Django si aspetta una funzione di visualizzazione chiamata `post_detail` all'interno di `blog/views.py`.

Apri il file `blog/views.py` e aggiungi quanto segue con il resto delle importazioni `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

E alla fine del file aggiungeremo la nostra *vista*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Sì. È ora di aggiornare la pagina: http://127.0.0.1:8000/

![Visualizzazione elenco post](images/post_list2.png)

Ha funzionato! Ma cosa succede se clicchi su un link nel titolo del post?

![Errore: il template non esiste](images/template_does_not_exist2.png)

Oh no! Un altro errore! Ma sappiamo già come occuparcene, giusto? Dobbiamo aggiungere un template!

## Crea un template per il post detail

Creeremo un file in `blog/templates/blog` chiamato `post_detail.html`.

Enter the following code:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Stiamo estendendo ancora una volta il template di base. `base.html`. Nel blocco `content` vogliamo mostrare una published_date del post (se esiste), un titolo ed il testo. Ma dovremmo discutere di alcune cose importanti, vero?

{% raw %}`{% if ... %}... {% endif %}` è un tag di template che possiamo utilizzare quando vogliamo controllare qualcosa (ricordi if. (Ricorda `se... altro ...` da **Introduzione al capitolo Python** ?) In questo scenario vogliamo controllare se il post `published_date` non è vuoto.{% endraw %}

Ok, possiamo aggiornare la nostra pagina e vedere se `TemplateDoesNotExist` non c'è più.

![Pagina di dettaglio del post](images/post_detail2.png)

Si! Ha funzionato!

# Tempo di Deploy!

Sarebbe bello vedere se il tuo sito web funziona ancora su PythonAnywhere, giusto? Proviamo a fare nuovamente il deploy.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Poi, in una [console PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Ricordati di sostituire `<your-pythonanywhere-domain>` con il sottodominio di PythonAnywhere, senza le parentesi angolo.)

## Aggiornamento file statici sul server

Server come PythonAnywhere amano trattare "file statici" (come file CSS) in modo diverso dai file Python, perché possono ottimizzare per essere caricati più velocemente. Di conseguenza, ogni volta che modifichiamo i nostri file CSS, dobbiamo eseguire un comando extra sul server per dirlo per aggiornarli. Il comando è chiamato `colleziona`.

Inizia attivando il tuo virtualenv se non è ancora attivo da prima (PythonAnywhere utilizza un comando chiamato `workon` per farlo, è proprio come il comando `sorgente myenv/bin/activate` che usi sul tuo computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Il comando `manage.py collectstatic` è un po' come `manage.py migrate`. Facciamo alcune modifiche al nostro codice, e poi diciamo a Django a *applica* queste modifiche, sia alla collezione di file statici del server, sia al database.

In ogni caso, siamo pronti a salire sulla pagina [ "Web"](https://www.pythonanywhere.com/web_app_setup/) (dal pulsante menu in alto a destra della console) e colpire **Ricarica**, e poi guarda la pagina https://subdomain.pythonanywhere.com per vedere il risultato.

Fatto! Congratulazioni :)