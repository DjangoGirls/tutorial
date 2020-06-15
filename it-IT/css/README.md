# CSS - rendilo carino!

Il nostro blog sembra ancora bruttino, vero? È arrivato il momento di abbellirlo! Per fare ciò useremo i CSS.

## Che cosa sono i CSS?

I CSS (Cascading Style Sheet, fogli di stile a cascata) servono a descrivere l'aspetto e la formattazione di un sito web scritto in un linguaggio di Markup (come l'HTML). Vedilo come il make-up per la nostra pagina web. ;)

Ma non vogliamo iniziare di nuovo dalle basi, vero? Ancora una volta, useremo qualcosa che i programmatori hanno rilasciato su internet gratuitamente. Reinventare la ruota non è divertente, come saprai.

## Usiamo Bootstrap!

Bootstrap è uno dei framework HTML e CSS più poplari per sviluppare bellissimi siti web: https:/getbootstrap.com/

È stato scritto dai programmatori che lavoravano per Twitter. Adesso è sviluppato da volontari provenienti da tutto il mondo!

## Installare Bootstrap

Per installare Bootstrap, apri il tuo file `.html` nell'editor di codice e aggiungi la riga seguente alla sezione `<head>`:

{% filename %}blog/templates/blog/post_list{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Queste righe non aggiungono nessun file al tuo progetto. Puntano solo ad altri file già esistenti siu Internet. Quindi avanti, apri il tuo sito e ricarica la pagina. Ecco qua!

![Figura 14.1](images/bootstrap1.png)

Sembra già più carino!

## File statici in Django

Infine, daremo uno sguardo più approfondito a quelli che abbiamo chiamato **file statici**. I file statici sono tutti i tuoi CSS e le tue immagini. Il loro contenuto non dipende dal contesto richiesto e sarà lo stesso per tutti gli utenti.

### Dove mettere i file statici in Django

Django sa già dove trovare file statici per l'app integrata "admin". Ora dobbiamo aggiungere alcuni file statici per la nostra app, `blog`.

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

Non approfondiremo l'apprendimento dei CSS in questa sede. Se vuoi saperne di più, in fondo a questa pagina ti consigliamo un corso gratuito.

Facciamo comunque un esempio. Vogliamo cambiare il colore del nostro header? Per decifrare i colori, i computer usano dei codici speciali. Questi codici iniziano con `#` seguiti da 6 lettere (A–F) e numeri (0–9). Per esempio, questo è il codice per il blu `#0000FF`. Puoi trovare i codici per molti colori qui: http://www.colorpicker.com/. Puoi anche usare [colori predefiniti](http://www.w3schools.com/colors/colors_names.asp) come ad esempio `red` e `green`.

Aggiungi il seguente codice nel tuo file `static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
   color: #C25100;
}

```

`h1 a` è un esempio di selettore CSS. Significa che stiamo applicando i nostri fogli di stile ad ogni elemento `a` all'interno di un elemento `h1`; il selettore `h2 a` si comporta allo stesso modo con gli elementi `h2`. Quindi quando si ha qualcosa come `<h1><a href="">link</a></h1>`, lo stile `h1 a` verrà applicato. In questo caso stiamo impostando il colore `#C25100`, che corrisponde all'arancione scuro. Puoi inserire il colore che preferisci, ma assicurati che ci sia un buon contrasto con lo sfondo bianco!

In un file CSS definiamo lo stile degli elementi presenti nel file HTML. Il primo modo per identificare gli elementi è attraverso il loro nome. Potresti ricordarli come tags dalla sezione sull'HTML. Cose come `a`, `h1` e `body` sono tutti esempi di nomi di elementi. Possiamo identificare anche con l'attributo `class` o l'attributo `id`. Class e id sono i nomi che assegni agli elementi. Le classi definiscono gruppi di elementi mentre gli id indicano uno specifico elemento. Per esempio puoi identificare il tag seguente usando il nome `a`, la classe `external_link` o l'id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Puoi leggere di più su i [Selettori CSS su w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Inoltre dobbiamo dire al nostro template HTML che abbiamo aggiunto del codice CSS. Apri il file `blog/templates/blog/post_list.html` nell'editor di codice e aggiungi questa riga all'inizio:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Qui stiamo semplicemente caricando file statici. :) Tra i tag `<head>` e `</head>`, dopo il link ai file CSS di Bootstrap, aggiungi la riga seguente:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Il browser legge i file nell'ordine in cui sono messi, quindi dobbiamo essere sicuri che sia nel posto giusto. Altrimenti il codice del nostro file potrebbe essere sovrascritto dal codice dei file di Bootstrap. Stiamo dicendo al nostro template dove trovare i nostri file CSS.

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
                <h2><a href="">{{ post.title }}</a></h2>
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

Aggiungi queste righe al tuo CSS, salva il file e guarda il risultato!

![Figura 14.3](images/margin2.png)

Potremmo anche personalizzare lo stile calligrafico nel nostro header. Incolla quanto segue all'interno del tag `<head>` che si trova nel file `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Come prima, controlla l'ordine e la posizione prima del link a `blog/static/css/blog.css`. Questa riga di codice importerà un carattere chiamato *Lobster* da Google Fonts (https://www.google.com/fonts).

Trova il blocco `h1 a` (il codice tra parentesi `{` e `}`) nel file CSS `blog/static/css/blog.css`. Ora aggiungi la riga `font-family: 'Lobster';` tra le parentesi e ricarica la pagina:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
   color: #C25100;
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
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ora aggiungiamo dei blocchi di codice ai nostri nuovi selettori. I selettori che iniziano con `.` indicano una classe. Sul Web ci sono diversi ottimi tutorial e spiegazioni sui CSS che possono aiutarti a capire il codice che stiamo per scrivere. Per ora, copia e incolla quanto segue nel tuo file `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
     background-color: #C25100;
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
     float: right; } 

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

.post h2 a, .post h2 a:visited {
     color: #000000; 
}
```

Ora aggiungi all'esterno del codice HTML riguardante i posts all'interno del blog alcuni elementi con definizione di classi. Sostituisci questo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
     <div class="post">
         <p>published: {{ post.published_date }}</p>
         <h2><a href="">{{ post.title }}</a></h2> 
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
                    <h2><a href="">{{ post.title }}</a></h2>
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

Non aver paura di fare qualche esperimento con i CSS, prova a fare qualche modifica. Giocare con i CSS può aiutarti a capire cosa fanno le varie cose. Se fai qualche errore, non preoccuparti - puoi sempre tornare indietro!

Consigliamo vivamente di seguire i corsi online gratuiti di "Basic HTML & HTML 5" e "Basic CSS" su [freeCodeCamp](https://learn.freecodecamp.org/). Possono aiutarti ad imparare tutto sul creare siti web più carini in HTML e CSS.

Pronta per il prossimo capitolo?! :)