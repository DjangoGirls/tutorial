# Introduzione all'HTML

Ti potresti chiedere, cos'è un template?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Cos'è l'HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML sta per "HyperText Markup Language". **HyperText** significa che è un tipo di testo che supporta i collegamenti ipertestuali tra le pagine. **Markup** significa che abbiamo preso un documento e l'abbiamo contrassegnato con il codice per dire a qualcosa (in questo caso, un browser) come interpretare la pagina. Il codice HTML è costruito con **tags**, ognuno inizia con `<` e finisce con `>`. Questi tag rappresentano gli **elementi** di markup.

## Il tuo primo template!

Creare un template significa creare un file template. Tutto è un file, vero? Probabilmente l'hai già notato.

I template vengono salvati in una cartella `blog/templates/blog`. Quindi prima crea una directory chiamata `templates` nella directory del tuo blog. Quindi crea un'altra directory chiamata `blog` all'interno della tua directory templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

E ora crea un file `post_list.html` nella directory `blog/templates/blog` (lascialo in bianco per adesso).

Guarda che aspetto ha il tuo sito adesso: http://127.0.0.1:8000/

> Se hai ancora l'errore `TemplateDoesNotExist`, prova a riavviare il tuo server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Figura 11.1](images/step1.png)

L'errore non c'è più! Congratulazioni :) Tuttavia, il tuo sito in realtà non sta pubblicando niente eccetto una pagina vuota, perché anche il tuo template è vuoto. Dobbiamo sistemarlo.

Aggiungi quanto segue nel tuo file template:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Ha funzionato! Ottimo lavoro :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Come puoi vedere, l'intero contenuto del sito va tra il tag iniziale `<html>` ed il tag conclusivo `</html>`
* `<p>` è un tag per gli elementi paragrafo; `</p>` conclude ogni paragrafo

## Head and body

Ciascuna pagina HTML è a sua volta divisa in due elementi: **head** e **body**.

* **head** è un elemento che contiene informazioni sul documento non visibili sullo schermo.

* **body** è l'elemento che contiene tutto ciò che invece viene visualizzato come parte della pagina web.

Utilizziamo `<head>` per dire al browser come interpretare la configurazione della pagina, e `<body>` per dirgli in realtà cosa c'è nella pagina.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Salva il file e aggiorna la tua pagina.

![Figura 11.3](images/step4.png)

Hai notato come il browser ha capito che "Il blog di Ola" è il titolo della tua pagina? Ha interpretato `<title>Il blog di Ola</title>` ed ha messo il testo nella barra del titolo sul tuo browser (sarà anche utilizzato per i segnalibri e così via).

Probabilmente hai anche notato che ogni tag di apertura è abbinato ad un *tag di chiusura*, con un `/`, e che gli elementi sono *annidati* (i.e. non puoi chiudere un tag particolare fino a quando tutti quelli che erano al suo interno sono stati chiusi a loro volta).

È come mettere le cose in delle scatole. Hai una grossa scatola, `<html></html>`; al suo interno c'è `<body></body>`, che contiene scatole ancora più piccole: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Personalizza il tuo template

Ora puoi divertirti un po' e provare a personalizzare il tuo template! Qua ci sono un po' di tag utili per quello:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Un sottotitolo</h2>` per un titolo di livello inferiore
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` enfatizza il tuo testo
* `<strong>text</strong>` enfatizza fortemente il tuo testo
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` crea un link
* `<ul><li>primo elemento</li><li>secondo elemento</li></ul>` fa una lista, proprio come questa qui!
* `<div></div>` definisce una sezione della pagina

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>pubblicato: 14.06.2014, 12:14</p>
            <h2><a href="">Il mio secondo postt</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Abbiamo creato tre sezioni `div` qui.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Ci dà questo effetto:

![Figura 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Un'ultima cosa: il deploy!

Sarebbe bello vedere tutto questo live su Internet, giusto? Facciamo un altro deploy su PythonAnywhere:

### Commit, and push your code up to GitHub

Prima di tutto, vediamo quali file sono cambiati dall'ultimo deploy (esegui questi comandi localmente, non su PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Nota** `--all` significa che `git` riconoscerà anche se hai eliminato dei files (di default riconosce solo i file nuovi o modificati). Ricorda anche (dal capitolo 3) che il `.` significa la directory attuale.

Prima di caricare tutti i file, proviamo a controllare cosa caricherà `git` (tutti i file che caricherà `git` ora appariranno in verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Ci siamo quasi, ora è il momento di dirgli di salvare questa modifica nella cronologia. Gli daremo un "messaggio di commit" dove descriviamo ciò che abbiamo modificato. Puoi digitare tutto quello che vuoi a questo punto, sarebbe utile scrivere qualcosa di descrittivo in modo da ricordare in futuro cos'hai fatto.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Ho cambiato l'HTML per questo sito."
    

> **Nota** Assicurati di usare doppie virgolette attorno al messaggio di commit.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Scarica il tuo nuovo codice su PythonAnywhere, e ricarica la tua web app

* Apri la [pagina Console PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vai alla tua **Bash console** (o iniziane una nuova). Quindi, esegui:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **Files tab** and view your code on PythonAnywhere.

* Infine, fai un salto alla [scheda Web](https://www.pythonanywhere.com/web_app_setup/) e premi **Reload** sulla tua web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)