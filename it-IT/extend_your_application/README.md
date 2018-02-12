# Estendi la tua applicazione

Abbiamo completato i passi necessari per la creazione del nostro sito: sappiamo come scrivere un modello, una url, una view ed un template. Sappiamo anche come far diventare carino il nostro sito.

Ora di far pratica!

La prima cosa di cui abbiamo bisogno nel nostro blog è, ovviamente, una pagina per rendere visibile un post, vero?

Abbiamo già un modello dei `Post`, quindi non abbiamo bisogno di aggiungere niente in `models.py`.

## Creare un link di template verso la pagina di dettaglio di un post

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Vogliamo creare un link che dal titolo di un post facente parte dell'elenco di articoli porti alla pagina di dettaglio. Cambiamo `<h1><a href="">{{ post.title }}</a></h1>` così che linki alla pagina di dettaglio del post:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}È arrivata l'ora di spiegare il misterioso `{% url 'post_detail' pk=post.pk %}`. Come avrai capito, il simbolo `{% %}` significa che stiamo usando i tag del template di Django. Questa volta ne useremo uno che creerà una URL per noi!{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![Errore: nessuna corrispondenza inversa](images/no_reverse_match2.png)

## Crea una URL per i dettagli di un post

Creiamo una URL in `urls.py` per il nostro `post_detail` *view*!

Vogliamo che il nostro primo post venga visualizzato a questo **URL **: http://127.0.0.1:8000/post/1/

Facciamo sì che l'URL nel file `blog/urls.py` punti Django ad una *view* chiamata `post_detail`, che mostrerà un intero post. Aggiungi la riga `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` al file `blog/urls.py`. Il file dovrebbe assomigliare a questo:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. Significa che Django prenderà tutto quello che hai messo qui e lo trasferirà ad una view come variabile denominata `pk`. (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` significa che ci devono essere una o più cifre. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

Ciò significa che se digiti `http://127.0.0.1:8000/post/5/` nel tuo browser, Django capirà che stai cercando una *view* chiamata `post_detail` e trasferirà l'informazione che `pk` è uguale a `5` a quella *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Prova ad aggiornare la pagina: http://127.0.0.1:8000/ Boom! Il server ha smesso di funzionare di nuovo. Have a look at the console – as expected, there's yet another error!

![Errore attributo](images/attribute_error2.png)

Ti ricordi di quale è il prossimo passo? Ma certo: aggiungere una view!

## Aggiungi una view del post

This time our *view* is given an extra parameter, `pk`. La nostra *view* deve prenderlo, vero? Quindi definiremo la nostra funzione come `def post_detail(request, pk):`. Dobbiamo utilizzare esattamente lo stesso nome che abbiamo specificato in urls (`pk`). Omettere questa variabile è sbagliato e genererà un errore!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![Errore: non esiste](images/does_not_exist2.png)

Noi non lo vogliamo! Ma, senza dubbio, Django ha qualcosa che si occuperà del problema per noi: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Pagina non trovata](images/404_2.png)

La buona notizia è che in realtà puoi creare la tua pagina `Page not found` modificarla come vuoi e darle un bell'aspetto. Ma non è importantissimo in questo momento, quindi salteremo questa parte.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Si. E' giunta l'ora di aggiornare la pagina: http://127.0.0.1:8000/

![Visualizzazione elenco post](images/post_list2.png)

Ha funzionato! Ma cosa succede se clicchi su un link nel titolo del post?

![Errore: il template non esiste](images/template_does_not_exist2.png)

Oh no! Un altro errore! Ma sappiamo già come occuparcene, giusto? Dobbiamo aggiungere un template!

## Create a template for the post details

Creeremo un file in `blog/templates/blog` chiamato `post_detail.html`.

Il risultato somiglierà a questo:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Stiamo estendendo ancora una volta il template di base. `base.html`. Nel blocco `content` vogliamo mostrare una published_date del post (se esiste), un titolo ed il testo. Ma dovremmo discutere di alcune cose importanti, vero?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Pagina di dettaglio del post](images/post_detail2.png)

Si! Ha funzionato!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Poi, in una [console PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)