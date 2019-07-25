# I templates di Django

È l'ora di visualizzare alcuni dati! Django ci dà alcuni **template tags** già pronti per farlo.

## Cosa sono i template tags?

In HTML non puoi scrivere codice Python, perché i browser non lo capiscono. Essi conoscono solo l'HTML. Noi sappiamo che l'HTML è piuttosto statico, mentre Python è molto più dinamico.

I **Django template tags** ci permettono di trasferire le cose simili a Python in HTML, in modo che tu possa costruire siti web in modo più veloce e facile. Accidenti!

## Mostra il template con la lista di post

Nel capitolo precedente abbiamo dato al nostro template una lista di posts nella variabile `posts`. Adesso lo mostreremo nell'HTML.

Per stampare una variabile nel template Django, usiamo doppie parentesi graffe con il nome della variabile all'interno, così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Prova ad inserirlo nel tuo template `blog/templates/blog/post_list.html`. Sostituisci tutto dal secondo `<div>` al terzo `</div>` con `{{ posts }}`. Salva il file e aggiorna la pagina per vedere i risultati:

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

Funziona! Ma noi vogliamo che vengano mostrate come i post statici che abbiamo creato prima nel capitolo **Introduzione ad HTML**. Puoi mischiare i tag HTML con quelli di template. Il nostro `body` avrà questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Tutto quello che hai messo tra `{% for %}` e `{% endfor %}` Sarà ripetuto per ciascun oggetto della lista. Aggiorna la tua pagina:{% endraw %}

![Figura 13.3](images/step3.png)

Ti sei accorto che abbiamo utilizzato una notazione leggermente diversa questa volta `{{ post.title }}` oppure `{{ post.text }}`)? Stiamo introducendo i dati in ciascuno dei campi definiti nel nostro modello `Post`. Inoltre il comando `|linebreaks` introduce un filtro che traduce gli accapo (la pressione del tasto "invio" sulla tastiera) nel loro equivalente in HTML.

## Un' ultima cosa

Sarebbe bello vedere se il tuo sito funziona ancora su Internet, giusto? Proviamo a fare il deploy su PythonAnywhere di nuovo. Ecco un riepilogo dei passaggi...

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

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Ricordati di sostituire `<your-pythonanywhere-domain>` con il sottodominio di PythonAnywhere, senza le parentesi angolo.)

* Infine, fai un salto alla [scheda Web](https://www.pythonanywhere.com/web_app_setup/) e premi **Reload** sulla tua web app. (Per raggiungere altre pagine PythonAnywhere dalla console, usa il pulsante menu nell'angolo in alto a destra.) Il tuo aggiornamento dovrebbe essere attivo su https://subdomain.pythonanywhere.com -- scoprilo nel browser! Se i post che hai sul computer non combaciano con quelli presenti su PythonAnywhere, va tutto bene. Il database su PythonAnywhere e quello sul tuo computer sono diversi a differenza degli altri file.

Congratulazioni! Andiamo avanti e proviamo ad aggiungere nuovi post nel tuo admin di Django (ricordati di aggiungere published_date!). Assicurati di essere nell'admin del tuo sito su pythonanywhere, https://subdomain.pythonanywhere.com/admin. Quindi aggiorna la pagina per vedere se i post sono comparsi.

Funziona come un incantesimo? Ne siamo fieri! Staccati dal computer per un po', ti sei guadagnato/a una pausa. :)

![Figura 13.4](images/donut.png)