# CSS - gjør det pent!

Bloggen vår ser fortsatt litt stygg ut, sant? På tide å gjøre den penere! Vi skal bruke CSS til det.

## Hva er CSS?

Cascading Style Sheets (CSS) er et språk brukt for å beskrive utseendet og formatteringen av en webside skrevet i et 'markup language' (som HTML). Behandle det som en makeup for websiden vår. ;)

Men vil ønsker ikke å starte fra begynnelsen igjen, sant? Igjen, vi skal bruke noe som programmerere ga ut på internett gratis. Å finne opp hjulet på nytt er jo ikke noe gøy.

## La oss bruke Bootstrap!

Bootstrap er en av de mest populære rammeverkene for HTML og CSS, for å utvikle nydelige websider: https://getbootstrap.com/

Det ble skrevet av utviklere som jobber for Twitter. Nå blir det videreutviklet av frivillige fra hele verden!

## Installere Bootstrap

For å installere Bootstrap må du åpne din `.html`-fil i kodeeditoren og legge dette til `<head>`-delen:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Dette legger ikke noen filer til i prosjektet ditt. Det peker bare på filer som finnes på internett. Så kom igjen, åpne websiden din og oppdater siden. Her er det!

![Figure 14.1](images/bootstrap1.png)

Ser bedre ut allerede!

## Static-filer i Django

Til slutt skal vi se nærmere på det som vi kaller **static files**. Static files er alle dine CSS-filer og bilder. Innholdet avhenger ikke av forespørselkonteksten, og vil være det samme for alle brukere.

### Hvor legger man static files for Django

Django vet allerede hvor static-filene er for den innebygde admin-appen. Nå trenger vi å legge til noen static files for vår egen app, `blog`.

Dette gjør vi ved å opprette en mappe kalt `static` inni blog-appen:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django vil automatisk finne enhver mappe kalt "static" inni noen av de andre app-mappene. Deretter vil det kunne bruke innholdet som static-filer.

## Din først CSS-fil!

La oss opprette en CSS-fil nå, for å legge til din egen stil på websiden. Opprett en ny mappe kalt `css` inni `static`-mappen. Deretter oppretter du en ny fil som du kaller `blog.css` inni `css`-mappen. Klar?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Det er på tide å skrive litt CSS! Åpne filen `blog/static/css/blog.css` i kodeeditoren.

Vi kommer ikke til å gå i dybden på tilpasning og lære alt om CSS her. Det finnes en anbefaling for et gratis CSS-kurs på slutten av denne siden hvis du ønsker å lære mer.

Men la oss i det minste gjøre litt. Kanskje vi kan endre farge på overskriftene? For å forstå farger bruker datamaskiner spesielle koder. Disse kodene starter med `#` etterfulgt av 6 bokstaver (A-F) og nummer (0-9). For eksempel er koden for blå `#0000FF`. Du kan finne fargekodene for mange farger her: http://www.colorpicker.com/. Du kan også bruke [ forhåndsdefinerte farger](http://www.w3schools.com/colors/colors_names.asp), som for eksempel `rød` og `grønn`.

I filen `blog/static/css/blog.css` legger du til følgende kode:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` er en CSS Selector. Dette betyr at vi angir våre stiler til et hvilket som helst `a` element inni et `h1`-element; `h2 a`-selector gjør det samme for `h2`-elementer. Så når vi har noe sånt som `<h1><a href="">link</a></h1>`, vil `h1 a`-stilen gjelde. I dette tilfellet, ber vi om å endre fargen til `#C25100`, som er en mørk oransje. Eller du kan sette din egen farge her, men vær sikker på at den har god kontrast mot en hvit bakgrunn!

I en CSS-fil bestemmer vil stiler for elementer i HTML-filen. Først identifiserer vi elementene ved hjelp av elementnavnet. Du husker kanskje disse kodene fra HTML-delen. Ting som `a`, `h1`, og `body` er alle eksempler på elementnavn. Vi identifiserer også elementer etter attributten `class` eller attributten `id`. Class og id er navn du selv gir elementet. Klasser definerer grupper av elementer, og id-er peker til spesifikke elementer. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. We just told our template where our CSS file is located.

Your file should now look like this:

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

OK, save the file and refresh the site!

![Figure 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figure 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Great!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

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

in the `blog/templates/blog/post_list.html` with this:

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

Save those files and refresh your website.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ready for the next chapter?! :)