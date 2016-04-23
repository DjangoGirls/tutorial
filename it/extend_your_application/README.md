# Estendi la tua applicazione

Abbiamo completato i passi necessari per la creazione del nostro sito: sappiamo come scrivere un modello, una url, una view ed un template. Sappiamo anche come far diventare carino il nostro sito.

Ora di far pratica!

La prima cosa di cui abbiamo bisogno nel nostro blog è, ovviamente, una pagina per rendere visibile un post, vero?

Abbiamo già un modello dei `Post`, quindi non abbiamo bisogno di aggiungere niente in `models.py`.

## Creare un link di template verso la pagina di dettaglio di un post

Cominceremo aggiungendo un link all'interno del file `blog/templates/blog/post_list.html`. Per ora dovrebbe avere questo aspetto:

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```


{% raw %}Vogliamo creare un link che dal titolo di un post facente parte dell'elenco di articoli porti alla pagina di dettaglio. Cambiamo `<h1><a href="">{{ post.title }}</a></h1>` così che linki alla pagina di dettaglio del post:{% endraw %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}È arrivata l'ora di spiegare il misterioso `{% url 'post_detail' pk=post.pk %}`. Come avrai capito, il simbolo `{% %}` significa che stiamo usando i tag del template di Django. Questa volta ne useremo uno che creerà una URL per noi!{% endraw %}

`blog.views.post_detail` è un percorso per arrivare alla `post_detail` *view* che vogliamo creare. Nota bene: `blog` è il nome della nostra applicazione (la directory `blog`), `views` viene dal nome del file `views.py` e l'ultima cosa - `post_detail` - è il nome della *view*.

Adesso quando andremo all'indirizzo: http://127.0.0.1:8000/ avremo un errore (come sapevamo, dal momento che non abbiamo una URL oppure una *view* per `post_detail`). Avrà questo aspetto:

![Errore: nessuna corrispondenza inversa][1]

 [1]: images/no_reverse_match2.png

## Crea una URL per i dettagli di un post

Creiamo una URL in `urls.py` per il nostro `post_detail` *view*!

Vogliamo che il nostro primo post venga visualizzato a questo **URL **: http://127.0.0.1:8000/post/1/

Facciamo sì che l'URL nel file `blog/urls.py` punti Django ad una *view* chiamata `post_detail`, che mostrerà un intero post. Aggiungi la riga `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` al file `blog/urls.py`. Il file dovrebbe assomigliare a questo:

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

Questa parte `^post/(?P<pk>[0-9]+)/$` sembra spaventosa, ma non preoccuparti - te la spiegheremo: - inizia ancora con `^` -- "l'inizio" - `post/` semplicemente significa che dopo l'inizio, l'URL dovrebbe contenere la parola **post** e **/**. Fin qui tutto bene. - `(?P<pk>[0-9]+)` - questa parte è più complicata. Significa che Django prenderà tutto quello che hai messo qui e lo trasferirà ad una view come variabile denominata `pk`. `[0-9]` ci dice anche che la variabile può essere solo un numero, non una lettera (quindi tutto tra 0 e 9). `+` significa che ci devono essere una o più cifre. Quindi qualcosa di simile a `http://127.0.0.1:8000/post//` non è valido, ma `http://127.0.0.1:8000/post/1234567890/` è perfetto! - `/` Quindi ci serve **/** di nuovo - `$` - "fine"!

Ciò significa che se digiti `http://127.0.0.1:8000/post/5/` nel tuo browser, Django capirà che stai cercando una *view* chiamata `post_detail` e trasferirà l'informazione che `pk` è uguale a `5` a quella *view*.

`pk` è un diminutivo di `primary key`. Questo nome viene frequentemente utilizzato nei progetti Django. Ma puoi chiamare la tua variabile come vuoi (ricorda: minuscole e `_` invece degli spazi!). Per esempio invece di `(?P<pk>[0-9]+)` potremmo avere la variabile `post_id`quindi questo pezzettino dovrebbe assomigliare a: `(?P<post_id>[0-9]+)`.

Ok, abbiamo aggiunto un nuovo schema di URL a `blog/urls.py`! Aggiorniamo la pagina: http://127.0.0.1:8000/ Boom! Ancora un altro errore! Come previsto!

![Errore attributo][2]

 [2]: images/attribute_error2.png

Ti ricordi di quale è il prossimo passo? Ma certo: aggiungere una view!

## Aggiungi una view del post

Questa volta alla nostra *view* viene data un altro parametro `pk`. La nostra *view* deve prenderlo, vero? Quindi definiremo la nostra funzione come `def post_detail(request, pk):`. Dobbiamo utilizzare esattamente lo stesso nome che abbiamo specificato in urls (`pk`). Omettere questa variabile è sbagliato e genererà un errore!

Ora, noi vogliamo ottenere un unico post. Per farlo possiamo utilizzare le queryset così:

    Post.objects.get(pk=pk)


Ma questo codice presenta un problema. Se non c'è `Post` con `primary key` (`pk`) otterremo un errore bruttissimo!

![Errore: non esiste][3]

 [3]: images/does_not_exist2.png

Noi non lo vogliamo! Ma, senza dubbio, Django ha qualcosa che si occuperà del problema per noi: `get_object_or_404`. Nel caso in cui non ci sia `Post` con la data `pk` mostrerà una pagina molto più carina (chiamata `Page Not Found 404`).

![Pagina non trovata][4]

 [4]: images/404_2.png

La buona notizia è che in realtà puoi creare la tua pagina `Page not found` modificarla come vuoi e darle un bell'aspetto. Ma non è importantissimo in questo momento, quindi salteremo questa parte.

Ok, è arrivata l'ora di aggiungere una *view* al nostro file `views.py`!

Dovremo aprire `blog/views.py` ed aggiungere il seguente codice:

    from django.shortcuts import render, get_object_or_404


Vicino ad altre righe `from` ed alla fine del file aggiungeremo la nostra *view*:

```python
    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
```

Si, è giunta l'ora di aggiornare la pagina: http://127.0.0.1:8000/

![Visualizzazione elenco post][5]

 [5]: images/post_list2.png

Ha funzionato! Ma cosa succede se clicchi su un link nel titolo del post?

![Errore: il template non esiste][6]

 [6]: images/template_does_not_exist2.png

Oh no! Un altro errore! Ma sappiamo già come occuparcene, giusto? Dobbiamo aggiungere un template!

## Crea un template per il post detail

Creeremo un file in `blog/templates/blog` chiamato `post_detail.html`.

Il risultato somiglierà a questo:

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
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```

Stiamo estendendo ancora una volta il template di base. `base.html`. Nel blocco `content` vogliamo mostrare una published_date del post (se esiste), un titolo ed il testo. Ma dovremmo discutere di alcune cose importanti, vero?

{% raw %}`{% if ... %} ... {% endif %}` è un tag di template che possiamo utilizzare quando vogliamo controllare qualcosa (ricordi `if ... else ..` dal capitolo **Introduzione a Python**?). In questo caso vogliamo controllare che la `published_date` di un post non sia vuota. {% endraw %}

Ok, possiamo aggiornare la nostra pagina e vedere se `Page not found` non c'è più.

![Pagina di dettaglio del post][7]

 [7]: images/post_detail2.png

Si! Ha funzionato!

## Ultima cosa: ora di fare il deploy!

Sarebbe bello vedere se il tuo sito Web sarà ancora funzionante in PythonAnywhere, vero? Proviamo a fare un alrto deploy.

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push


*   Poi, in una [console PythonAnywhere Bash][8]:

 [8]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]


*   Infine, vai su il [Web tab][9] e premi **Reload**.

 [9]: https://www.pythonanywhere.com/web_app_setup/

Fatto! Congratulazioni :)