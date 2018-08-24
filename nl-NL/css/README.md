# CSS - Maak het mooi!

Onze blog ziet er nog steeds nogal lelijk uit, toch? Tijd om hem mooi te maken! Daarvoor gebruiken we CSS.

## Wat is CSS?

Cascading Style Sheets (CSS) is een taal die gebruikt wordt om het uiterlijk en de opmaak van een website geschreven in markup taal (zoals HTML) te beschrijven. Zie het als make-up voor onze webpagina. ;)

Maar we willen niet weer helemaal vanuit het niets beginnen, toch? We maken wederom gebruik van iets wat programmeurs gratis via het internet delen. Het wiel opnieuw uitvinden is saai, toch?

## We maken gebruik van Bootstrap!

Bootstrap is een van de meest populaire HTML en CSS frameworks om mooie websites te ontwikkelen: https://getbootstrap.com/

Het werd geschreven door programmeurs die voor Twitter werkten. Nu wordt het onderhouden door vrijwillers van over de hele wereld!

## Bootstrap installeren

Om Bootstrap te installeren moet je het volgende toevoegen aan je `.html` bestand:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Figuur 14.1](images/bootstrap1.png)

Dit ziet er al een stuk beter uit!

## Statische bestanden in Django

Tenslotte zullen we een kijkje nemen naar de bestanden die we **statische bestanden** hebben genoemd. Statische bestanden zijn al je CSS-bestanden en afbeeldingen. Hun inhoud is niet afhankelijk van de context en is hetzelfde voor elke gebruiker.

### Waar zet je statische bestanden in Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

We doen dit door een folder met de naam `static` aan te maken binnenin de blog applicatie:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django vindt automatisch mappen die "static" genoemd zijn binnen je applicatiemappen, en kan de inhoud daarvan vervolgens als statische bestanden gebruiken.

## Je eerste CSS bestand!

Laten we een CSS-bestand aanmaken, om je eigen stijl aan je website toe te voegen. Maak een nieuwe map aan genaamd: `css` binnen je `static` map. Maak daarna een nieuw bestand genaamd: `blog.css` aan binnen deze `css` map. Klaar?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Tijd om wat CSS te schrijven! Open het `blog/static/css/blog.css` bestand in je code editor.

We zullen hier niet te diep ingaan op het customiseren en leren over CSS. Er staan een aanbeveling voor een gratis cursus CSS op het einde van deze pagina als je meer wil leren hierover.

Maar laten we wat details veranderen. Misschien kunnen we de kleur van onze header veranderen? Om kleuren te begrijpen gebruiken computers speciale kleurcodes. Deze codes beginnen met `#`, gevolgd door een combinatie van 6 letters (A-F) en cijfers (0-9). De code voor de kleur blauw is bijvoorbeeld `#0000FF`. Je vindt een groot overzicht van kleurcodes hier: http://www.colorpicker.com/. Je kunt ook voorgedefinieerde kleuren gebruiken zoals `red` en `green`.

In je `blog/static/css/blog.css` bestand moet je de volgende code toevoegen:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a{
    color: #FCA205;
}
```

`h1 a` is een CSS Selector. Dit betekent dat we onze stijl toepassen op elk `a` element binnen een `h1` element. Dus als we bijvoorbeeld iets hebben als `<h1><a href="">link</a></h1>`, wordt de `h1 a` stijl die we hebben opgegeven toegepast. In dit geval vertellen we het element zijn kleur te veranderen naar `#FCA205`, wat oranje is. Or you can put your own color here!

In een CSS bestand bepalen we de stijl voor de elementen in het HTML bestand. De eerste manier waarop we elementen identificeren, is met de naam van het element. Je hebt deze eerder voorbij zien komen als tags uit het HTML hoofdstuk. Dingen zoals `a`, `h1` en `body` zijn allemaal namen van elementen. We kunnen elementen ook identificeren bij het attribuut `class` of het attribuut `id`. Class en id zijn namen die je zelf aan een element geeft. Een class definieert een groep van elementen, en id's verwijzen naar specifieke elementen. Je kunt bijvoorbeeld de volgende tag identificeren door de tag naam `a`, de class `external_link`, of het id `link_to_wiki_page` te gebruiken:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Je kunt meer over CSS lezen op [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We moeten ook ons HTML template laten weten dat we wat CSS toegevoegd hebben. Open het `blog/templates/blog/post_list.html` bestand en voeg deze regel toe, helemaal bovenaan het bestand:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We laden hier aleen de statische bestanden in. :) Tussen de `<head>` en `</head>` tags, na de link naar de Bootstrap bestanden, voeg je deze regel toe:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

De browser leest bestanden in de opgegeven volgorde, dus we moeten ervoor zorgen dat dit op de juiste plek staat. Anders wordt de code in ons bestand overschreven door de code in de Bootstrap bestanden. We hebben net aan onze template verteld waar onze CSS staat.

Je bestand zou er nu zo uit moeten zien:

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

Ok, sla het bestand op en vernieuw de site!

![Figuur 14.2](images/color2.png)

Goed werk! Misschien moeten we onze site een beetje ruimte geven en de marge aan de linker kant groter maken? Laten we dit proberen!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Voeg dit aan je CSS toe, sla het bestand op, en kijk wat er veranderd is!

![Figuur 14.3](images/margin2.png)

Misschien kunnen we het lettertype in onze header aanpassen? Kopieer en plak dit in je `<head>` in het `blog/templates/blog/post_list.html` bestand:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Let weer op de volgorde en zet het vóór de link naar `blog/statig/css/blog.css`. Deze regel importeert een lettertype van Google wat *Lobster* heet. (https://www.google.com/fonts).

Zoek het `h1 a` declaratieblok op (de code tussen de haken `{` en `}`) in het CSS bestand `blog/static/css/blog.css`. Voeg nu de regel `font-family: 'Lobster';` toe tussen de haken, en ververs je pagina:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Figuur 14.3](images/font.png)

Geweldig!

Zoals hierboven vermeld, hanteert CSS een concept van klassen. Hiermee kun je een deel van je HTML code een naam geven, en een stijl alleen op dit gedeelte toepassen zonder gevolgen voor de andere delen. Dit is super handig! Misschien heb he bijvoorbeeld twee divs die allebei iets anders doen (bijvoorbeeld je header en je blog post). Met behulp van een klasse kun je ze anders stylen.

Leef je uit en benoem delen van je HTML code. Voeg als volgt een klasse genaamd `page-header` toe aan de `div` die de header bevat:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

En voeg nu de klasse `post` toe aan de `div` die je blog post bevat.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We gaan nu declaratieblokken toevoegen aan verschillende selectors. Selectors die beginnen met `.` hebben betrekking op klassen. Er is heel veel goede uitleg en tutorials over CSS te vinden op het web die je kunnen helpen om de volgende code te begrijpen. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Vervolgens omring je de HTML code die die posts weergeeft met klassedeclaraties. Vervang dit:

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

in `blog/templates/blog/post_list.html` met dit:

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

Sla de bestanden op en ververs je website.

![Figuur 14.4](images/final.png)

Whoohoo! Ziet er gaaf uit, toch? Bekijk de code die je zojuist geplakt hebt en probeer de plekken te vinden waar je in de HTML klassen toegevoegd hebt, die je vervolgens in de CSS hebt gebruikt. Wat zou je wijzigen als je de datum bijvoorbeeld turquoise wil maken?

Wees niet bang om een beetje met de CSS te spelen en wat dingen te veranderen. Met de CSS spelen helpt je om te begrijpen wat de verschillende dingen doen. Als er per ongeluk iets stuk gaat, maak je geen zorgen! Je kunt het altijd weer ongedaan maken!

We raden je aan om deze gratis online [Codecademy HTML & CSS cursus](https://www.codecademy.com/tracks/web) te doen. Hiermee leer je alles over het mooier maken van websites met CSS.

Klaar voor het volgende hoofdstuk?! :)