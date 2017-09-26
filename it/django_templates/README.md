# I templates di Django

È l'ora di visualizzare alcuni dati! Django ci dà alcuni **template tags** già pronti per farlo.

## Cosa sono i template tags?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Mostra il template con la lista di post

Nel capitolo precedente abbiamo dato al nostro template una lista di posts nella variabile `posts`. Adesso lo mostreremo nell'HTML.

Per stampare una variabile nel template Django, usiamo doppie parentesi graffe con il nome della variabile all'interno, così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Prova questo nel tuo template `blog/templates/blog/post_list.html`. Sostituisci tutto dal secondo `<div>` al terzo `</div>` con `{{ posts }}`. Salva il file e aggiorna la pagina per vedere i risultati:

![Figura 13.1](images/step1.png)

Come vedi, quello che abbiamo è:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Significa che Django lo vede come una lista di oggetti. Ricordi dalla **Introduzione a Python** come possiamo rendere visibili le liste? Sì, con for loops! In un template Django si fanno così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Prova ad inserirlo nel tuo template.

![Figura 13.2](images/step2.png)

Funziona! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. Puoi mischiare i tag HTML con quelli di template. Il nostro `body` avrà questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Tutto quello che hai messo tra `{% for %}` e `{% endfor %}` Sarà ripetuto per ciascun oggetto della lista. Aggiorna la tua pagina:{% endraw %}

![Figura 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? Stiamo introducendo i dati in ciascuno dei campi definiti nel nostro modello `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Un' ultima cosa

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* Prima di tutto, fai il push del tuo codice verso Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Poi, ritorna su [PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vai alla tua **console di Bash** (o iniziane una nuova) ed esegui:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Infine, vai sulla [Web tab](https://www.pythonanywhere.com/web_app_setup/) e premi **Reload** sulla tua web app. L'aggiornamento dovrebbe essere live! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figura 13.4](images/donut.png)