# CSS - rendilo carino!

Il nostro blog sembra ancora un pochino brutto, vero? È arrivato il momento di abbellirlo! Per fare ciò useremo CSS.

## Che cos'è CSS?

Il CSS (Cascading Style Sheet, fogli di stile a cascata) è un linguaggio usato per descrivere l'aspetto e la formattazione di un sito web scritto in un linguaggio di Markup (come l'HTML). Vedilo come il trucco per la nostra pagina. ;)

Ma non vogliamo iniziare di nuovo dalle basi, vero? Ancora una volta, useremo qualcosa che i programmatori hanno rilasciato su internet gratuitamente. Reinventare la ruota non è divertente, come saprai.

## Usiamo Bootstrap!

Bootstrap è uno dei framework HTML e CSS più poplari per sviluppare bellissimi siti web: https:/getbootstrap.com/

È stato scritto dai programmatori che lavoravano per Twitter. Adesso è sviluppato da volontari provenienti da tutto il mondo!

## Installare Bootstrap

Per installare Bootstrap devi aggiungere nella sezione `<head>` del tuo file `.html`:

{% filename %}blog/templates/blog/post_list{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Le due linee sopra riportate non aggiungono nessun file al tuo progetto. Stanno solo reindirizzando ad alcuni files the esistono in internet. Ma non ti preoccupare troppo, vai avanti, apri la tua pagina web e ricaricala. Eccolo qui!

![Figura 14.1](images/bootstrap1.png)

Sembra già più carino!

## File statici in Django

Infine, daremo uno sguardo più approfondito a quelli che abbiamo chiamato **file statici**. I file statici sono tutti i tuoi CSS e le tue immagini. Il loro contenuto non dipende dal contesto richiesto e sarà lo stesso per tutti gli utenti.

### Dove mettere i file statici in Django

Django sa già dove può trovare i file statici per l'app "admin". Adesso andremo ad aggiungere qualche file statico per la tua app `blog`.

Lo facciamo creando una cartella denominata `static` all'interno dela nostra app blog:

    djangogirls
    ├── blog
    |     ├── migrations
    |     ├── static
    |     └── templates
    └── mysite
    

Django trova automaticamente ogni cartella chiamata ''static'' all'interno di qualsiasi cartella della tua app. Quindi potrà usarne il contenuto come file statici.

## Il tuo primo file CSS!

Creiamo un file CSS, per aggiungere uno stile alla tua pagina web. Crea una nuova cartella dal nome `css` all'interno della tua cartella `static`. Poi, crea un nuovo file all'interno della tua cartella `css` e chiamalo `blog.css`. Fatto?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

È il giunto il momento di scrivere un po' di CSS! Apri il file `static/css/blog.css` nel tuo editor di codice.

Non andremmo troppo a fondo nel modificare e imparare il CSS qui. Alla fine di questa pagina c'è una raccomandazione per un corso gratuito di CSS se ti piacerebbe conoscere di più.

Facciamo comunque un esempio. Perchè non cambiare il colore del nostro header? Per decifrare i colori, i computer usano dei codici speciali. Questi codici iniziano con `#` seguiti da 6 lettere (A–F) e numeri (0–9). Per esempio, questo è il codice per il blu `#0000FF`. Puoi trovare i codici per molti colori qui: http://www.colorpicker.com/. Puoi anche usare [colori predefiniti](http://www.w3schools.com/colors/colors_names.asp) come ad esempio `red` e `green`.

Aggiungi il seguente codice nel tuo file `static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` è un esempio di selettore CSS. Questo significa che stiamo applicando il nostro stile a tutti gli elementi `a` contenuti in un elemento `h1`. Quindi quando si ha qualcosa come `<h1><a href="">link</a></h1>`, lo stile `h1 a` verrà applicato. In questo caso, stiamo cercando di cambiare il colore con `#FCA205`, che corrisponde all'arancione. Ovviamente puoi mettere il codice di qualsiasi altro colore tu preferisca!

In un file CSS definiamo lo stile degli elementi presenti nel file HTML. Il primo modo per identificare gli elementi è attraverso il loro nome. Potresti ricordarli come tags dalla sezione sull'HTML. Cose come `a`, `h1` e `body` sono tutti esempi di nomi di elementi. Possiamo identificare anche con l'attributo `class` o l'attributo `id`. Class e id sono i nomi che assegni agli elementi. Le classi definiscono gruppi di elementi mentre gli id indicano uno specifico elemento. Per esempio puoi identificare il tag seguente usando il nome `a`, la classe `external_link` o l'id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Puoi leggere di più su i [Selettori CSS su w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Il browser legge i file nell'ordine in cui sono messi, quindi dobbiamo essere sicuri che sia nel posto giusto. Otherwise the code in our file may be overriden by code in Bootstrap files. Stiamo dicendo al nostro template dove trovare i nostri file CSS.

Il tuo file dovrebbe avere questo aspetto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
```

OK, salviamo il file e ricarichiamo la pagina web!

![Figura 14.2](images/color2.png)

Ben fatto! Adesso potremmo dare un po' più d'aria alla nostra pagina web e aumentare il margine nella parte sinistra. Proviamo!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figura 14.3](images/margin2.png)

Potremmo anche personalizzare lo stile calligrafico nel nostro header. Incolla quanto segue all'interno del tag `<head>` che si trova nel file `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

Grandioso!

Come già detto in precedenza, CSS possiede il concetto di classi. Questo ti permette identificare una parte del codice HTML e applicare lo stile solo su quella parte, senza modificare le altre. Questo è utilissimo! Potresti avere due div che hanno qualcosa di differente (come il tuo header e il tuo post). Una classe ti aiuta a renderli differenti.

Prova a dare dei nomi ad alcune parti dell'HTML. Aggiungi una classe chiamta `page-header` al tuo `div` che contiene l'intestazione così:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

E ora aggiungi una classe `post` al tuo `div` che contiene un articolo del blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ora aggiungiamo dei blocchi di codice ai nostri nuovi selettori. I selettori che iniziano con `.` indicano una classe. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. Per ora, copia e incolla quanto segue nel tuo file `mysite/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

Ora aggiungi all'esterno del codice HTML riguardante i posts all'interno del blog alcuni elementi con definizione di classi. Sostituisci questo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

nel file `blog/templates/blog/post_list.html` con quanto segue:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Salva entrambi i file e ricarica la pagina web.

![Figura 14.4](images/final.png)

Woohoo! È fantastico, vero? Guarda il codice che abbiamo appena incollato, per trovare i punti dove abbiamo aggiunto le classi nell'HTML usate nel CSS. Dove dovremmo modificare se volessimo la data in azzurro?

Non aver paura di fare qualche esperimento con i CSS, prova a fare qualche modifica. Giocare con i CSS può aiutarti a capire cosa fanno le varie cose. If you break something, don't worry – you can always undo it!

Ti raccomandiamo di fare questo corso gratuito: [Codeacademy HTML & CSS](https://www.codecademy.com/tracks/web). Può aiutarti a imparare tutto ciò che ti serve per rendere carini i tuoi siti con CSS.

Pronta per il prossimo capitolo?! :)