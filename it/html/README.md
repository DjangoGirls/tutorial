# Introduzione all'HTML

Ti potresti chiedere, cos'è un template?

Un template è un file che possiamo riutilizzare per presentare informazioni diverse in un formato consistente - per esempio, potresti utilizzare un template per aiutarti a scrivere una lettera, perché anche se ciascuna lettera potrebbe contenere un messaggio diverso ed essere a sua volta indirizzata ad una persona diversa, condivideranno lo stesso formato.

Un template Django viene descritto in un linguaggio chiamato HTML (è lo stesso HTML che abbiamo menzionato nel primo capitolo **Come funziona l'Internet**).

## Cos'è l'HTML?

HTML è un semplice codice che viene interpretato dal tuo browser - come Chrome, Firefox o Safari - per rendere un sito web visibile all'utente.

HTML sta per "HyperText Markup Language". **HyperText** significa che è un tipo di testo che supporta i collegamenti ipertestuali tra le pagine. **Markup** significa che abbiamo preso un documento e l'abbiamo contrassegnato con il codice per dire a qualcosa (in questo caso, un browser) come interpretare la pagina. Il codice HTML è costruito con **tags**, ognuno inizia con `<` e finisce con `>`. Questi tag rappresentano gli **elementi** di markup.

## Il tuo primo template!

Creare un template significa creare un file template. Tutto è un file, vero? Probabilmente l'hai già notato.

I template vengono salvati in una cartella `blog/templates/blog`. Quindi prima crea una directory chiamata `templates` nella directory del tuo blog. Quindi crea un'altra directory chiamata `blog` all'interno della tua directory templates:

    blog
    └───templates
        └───blog
    

(Ti chiederai perché abbiamo bisogno di due directory chiamate entrambe `blog` - come scoprirai più tardi, si tratta semplicemente di una denominazione convenzionale che serve rendere la vita più facile.)

E ora crea un file `post_list.html` nella directory `blog/templates/blog` (lascialo in bianco per adesso).

Guarda che aspetto ha il tuo sito adesso: http://127.0.0.1:8000/

> Se hai ancora l'errore `TemplateDoesNotExist`, prova a riavviare il tuo server. Vai nella command line, arresta il server premendo Ctrl+C ( I tasti Control e C insieme) e riavvialo utilizzando il comando `python manage.py runserver`.

![Figura 11.1](images/step1.png)

L'errore non c'è più! Congratulazioni :) Tuttavia, il tuo sito in realtà non sta pubblicando niente eccetto una pagina vuota, perché anche il tuo template è vuoto. Dobbiamo sistemarlo.

Apri il nuovo file nell'editor di codice e aggiungi quanto segue:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Quindi come appare il tuo sito ora? clicca per scoprirlo: http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Ha funzionato! Ottimo lavoro :)

* Il comando più basico, `<html>`, è sempre l'inizio di ogni pagina web e `</html>` è sempre la fine. Come puoi vedere, l'intero contenuto del sito va tra il tag iniziale `<html>` ed il tag conclusivo `</html>`
* `<p>` è un tag per gli elementi paragrafo; `</p>` conclude ogni paragrafo

## Testa e corpo

Ciascuna pagina HTML è a sua volta divisa in due elementi: **head** e **body**.

* **head** è un elemento che contiene informazioni sul documento non visibili sullo schermo.

* **body** è l'elemento che contiene tutto ciò che invece viene visualizzato come parte della pagina web.

Utilizziamo `<head>` per dire al browser come interpretare la configurazione della pagina, e `<body>` per dirgli in realtà cosa c'è nella pagina.

Per esempio, puoi mettere un elemento di titolo all'interno di `<head>`, così:

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

Devi seguire queste regole di tag *di chiusura*, e di elementi *annidati* - se non lo fai, il browser potrebbe non essere in grado di interpretarli correttamente e la tua pagina verrà visualizzata incorrettamente.

## Personalizza il tuo template

Ora puoi divertirti un po' e provare a personalizzare il tuo template! Qua ci sono un po' di tag utili per quello:

* `<h1>A heading</h1>` - per la tua intestazione più importante
* `<h2>A sub-heading</h2>` - per un titolo di livello inferiore
* `<h3>A sub-sub-heading</h3>` ... e così via, fino a `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` enfatizza il tuo testo
* `<strong>text</strong>` enfatizza fortemente il tuo testo
* `<br>` va in un'altra riga (puoi mettere qualsiasi cosa dentro br)
* `<a href="https://djangogirls.org">link</a>` crea un link
* `<ul><li>primo elemento</li><li>secondo elemento</li></ul>` fa una lista, proprio come questa qui!
* `<div></div>` definisce una sezione della pagina

Ecco un esempio di modello completo, copia e incolla in `blog/templates/blog/post_list.html`:

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

* Il primo elemento `div` contiene il titolo del nostro blog - è un'intestazione ed un link
* Altri tre elementi `div` contengono i nostri post con la loro data di pubblicazione, `h2` con il titolo di un post che è cliccabile e due `p` (paragrafi) di testo, uno per la data e l'altro per i nostri post.

Ci dà questo effetto:

![Figura 11.4](images/step6.png)

Yaaay! Ma fino adesso, il nostro template mostra esattamente **la stessa informazione** - mentre prima stavamo dicendo che i template ci permettono di mostrare **diverse** informazioni nello **stesso formato**.

Quello che vogliamo è visualizzare i veri post aggiunti nel nel nostro Django admin - è quello che faremo adesso.

## Un'ultima cosa: il deploy!

Sarebbe bello vedere tutto questo live su Internet, giusto? Facciamo un altro deploy su PythonAnywhere:

### Committa e pubblica il tuo codice su GitHub

Prima di tutto, vediamo quali file sono cambiati dall'ultimo deploy (esegui questi comandi localmente, non su PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Assicurati di essere nella directory `djangogirls` e diciamo a `git` di includere tutte le modifiche in questa directory:

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

Quando hai finito, caricheremo (push) le nostre modifiche su Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Scarica il tuo nuovo codice su PythonAnywhere, e ricarica la tua web app

* Apri la [pagina Console PythonAnywhere](https://www.pythonanywhere.com/consoles/) e vai alla tua **Bash console** (o iniziane una nuova). Quindi, esegui:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Ricordati di sostituire `<your-pythonanywhere-domain>` con il sottodominio di PythonAnywhere, senza le parentesi angolo. Il tuo nome di sottodominio è normalmente il tuo nome utente PythonAnywhere, ma in alcuni casi potrebbe essere un po' diverso (come se il tuo nome utente contiene lettere capitali). Quindi, se questo comando non funziona, usa il comando `ls` (files list) per trovare il tuo nome di sottodominio/cartella reale e poi `cd` su di esso.

Ora guarda il tuo codice scaricato. Se vuoi controllare che sia arrivato, puoi saltare alla pagina **"Files** e visualizzare il tuo codice su PythonAnywhere (puoi raggiungere altre pagine PythonAnywhere dal pulsante menu sulla pagina della console).

* Infine, fai un salto alla [scheda Web](https://www.pythonanywhere.com/web_app_setup/) e premi **Reload** sulla tua web app.

Il tuo aggiornamento dovrebbe essere applicato! Vai avanti ed aggiorna il tuo sito nel brower. Le modifiche dovrebbero essere visibili. :)