# CSS - fă-l frumos!

Blog-ul nostru încă arată destul de urât, nu-i așa? E timpul să-l facem frumos! Pentru asta vom folosi CSS.

## Ce este CSS?

Cascading Style Sheets (CSS) este un limbaj folosit pentru a descrie aspectul vizual și formatarea unui website scris într-un limbaj de marcaj (ca HTML). Poate fi considerat ca machiaj pentru pagina noastră web :)

Dar nu vrem să o luăm de la început, nu-i așa? Încă o dată, vom folosi ceva ce programatorii au lansat gratuit pe internet. Reinventarea roții nu este distractivă, la urma urmei.

## Hai să folosim Bootstrap!

Bootstrap este unul din cele mai populare framework-uri HTML și CSS pentru dezvoltarea website-urilor frumoase: https://getbootstrap.com/

A fost scris de programatorii care au lucrat la Twitter. Acum e dezvoltat de voluntari din toată lumea!

## Instalarea Bootstrap

Pentru a instala Bootstrap, deschide fișierul `.html` în editorul de cod și adaugă codul următor în secțiune `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
```

Aceasta nu adaugă niciun fișier la proiect, ci doar face referință la fișiere care există pe Internet. Deschide website-ul și actualizează pagina. Iat-o!

![Figura 14.1](images/bootstrap1.png)

Deja arată mai frumos!

## Fișierele statice în Django

În sfârșit ne vom uita mai atent la lucrurile pe care le numim **fișiere statice**. Fișierele statice sunt toate imaginile și fișierele CSS. Conținutul acestora nu depinde de contextul cererii la server și va fi la fel pentru orice utilizator.

### Unde se pun fișierele statice pentru Django

Django deja știe unde să găsească fișierele statice pentru aplicația "admin" preconfigurată. Acum trebuie doar să adaugi niște fișiere statice pentru aplicația `blog`.

Facem asta prin crearea unui dosar numit `static` înăuntrul blog-ului:

    djangogirls 
    ├── blog 
    │ ├── migrations 
    │ ├── static 
    │ └── templates 
    └── mysite
    

Django va găsi automat orice dosar numit "static" în oricare din dosarele aplicațiilor tale. Apoi va putea folosi conţinutul lor ca fişiere statice.

## Primul tău fișier CSS!

Hai să creăm un fișier CSS acum, pentru a adăuga propriul stil pe pagina ta web. Creează un director nou numit `css` în interiorul directorului `static`. Apoi creează un nou fișier numit `blog.css` în interiorul directorului `css`. Gata?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

E timpul să scrii niște CSS! Deschide fișierul `blog/static/css/blog.css` în editorul de cod.

Nu vom învăța în detaliu despre personalizarea CSS aici. La sfârșitul acestei pagini există o recomandare pentru un curs gratuit de CSS, dacă vrei să aflii mai multe.

Dar hai să facem cel puțin ceva. Poate am putea schimba culoarea header-ului? Pentru a înțelege culorile, calculatoarele ulilizează niște coduri speciale. Aceste coduri încep cu `#` urmat de 6 litere (A-F) și numere (0-9). De exemplu, codul pentru culoarea albastră este `#0000FF`. Poți găsi codurile pentru mai multe culori aici: http://www.colorpicker.com/. Poți de asemenea utiliza [culori predefinite](http://www.w3schools.com/colors/colors_names.asp), precum `red` - roșu și `green` - verde.

În fișierul `blog/static/css/blog.css` adaugă următorul cod:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` este un Selector CSS. Asta înseamnă că aplicăm stilurile noastre la orice element `a` în interiorul unui element `h1` ; selectorul `h2 a ` face același lucru pentru elementele `h2`. Așa că atunci când avem ceva de genul `<h1><a href="">link</a></h1>`, stilul `h1 a` va fi aplicat. În acest caz, noi îi spunem să își schimbe culoarea în `#C25100`, care reprezintă culoarea oranj. Sau poți pune culoarea ta proprie aici, dar asigură-te că are un contrast bun cu un fundal alb!

Într-un fișier CSS determinăm stilurile pentru elementele din fișierul HTML. Primul mod în care identificăm elementele este cu numele elementului. Poate îți amintești de acestea ca tag-uri din secţiunea HTML. Lucruri ca `a`, `h1`, şi `bodz` sunt exemple de nume de elemente. De asemenea putem identifica elementele după atributul `class` sau atributul `id`. Numele de clasă și id le definești singură. Clasele definesc grupuri de elemente, iar id-urile indică elemente specifice. De exemplu, ai putea identifica următorul element folosind numele elementului `a`, clasa `external_link`, sau id-ul `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Poți citi mai multe despre [selectori CSS pe w3school](http://www.w3schools.com/cssref/css_selectors.asp).

De asemenea, trebuie să-i spunem șablonului nostru HTML că am adăugat CSS. Deschide fișierul `blog/templates/blog/post_list.html` în editorul de cod și adaugă această linie la începutul acestuia:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Noi doar încărcăm fișierele statice aici. :) Între tag-urile `<head>` și `</head>`, după link-urile către fișierele CSS Bootstrap, adaugă această linie:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Browser-ul citește fișierele în ordinea în care sunt transmise, așa că trebuie să ne asigurăm că se află în locul potrivit. În caz contrar, codul din fișierul nostru poate fi rescris de codul din fișierele Bootstrap. Tocmai i-am spus șablonului unde se află fișierul nostru CSS.

Fișierul tău trebuie să arate așa:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        {% for post in posts %}
            <article>
                <time>published: {{ post.published_date }}</time>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </article>
        {% endfor %}
    </body>
</html>
```

Bine, salvează fișierul și actualizează pagina!

![Figura 14.2](images/color2.png)

Bună treabă! Poate am vrea să-i dăm site-ului un pic de spațiu și să mărim marginea din partea stângă? Să încercăm!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Adaugă asta la codul tău CSS, salvează fișierul și vezi cum funcționează!

![Figura 14.3](images/margin2.png)

Poate putem personaliza font-ul din header? Inserează asta în `<head>` în fișierul `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Ca și înainte, verifică ordinea și plasează linia înainte de link-ul către `blog/static/css/blog.css`. Această linie va importa un font numit *Lobster* din Google Fonts (https://www.google.com/fonts).

Găsește blocul de declarații `h1 a` (codul dintre paranteze `{` și `}`) în fișierul CSS `blog/static/css/blog. ss`. Acum adaugă linia `font-family: 'Lobster';` între paranteze și actualizează pagina:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

Grozav!

Cum am menționat mai înainte, CSS are conceptul de clase. Acestea îți permit să numești o parte din codul HTML și să aplici stiluri numai la această parte, fără a afecta alte părți. Acest lucru poate fi foarte util! Poate ai două div-uri care fac ceva diferit (de exemplu, header şi postare). O clasă te poate ajuta să le faci să arate diferit.

Acum numește câteva părți ale codului HTML. Înlocuiește `header` care conține header-ul tău cu următorul cod:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

Acum adaugă o clasă `post` la `article` care conține un post de blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

Acum vom adăuga blocuri de declarare la selectoare diferite. Selectoarele care încep cu `.` se referă la clase. Există multe tutoriale și explicații despre CSS pe Internet care te ajută să înțelegi următorul cod. Pentru moment, doar copiază-l și inserează-l în fișierul `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
<0>
    <1>published: {{ post.published_date }}</1>
    <2>{{ post.title }}</2>
    <3>{{ post.text|linebreaksbr }}</3>
</0>
```

Apoi înconjoară codul HTML care afișează postările cu declarații de clase. Înlocuiește asta:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

în `blog/templates/blog/post_list.html` cu acest cod:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<main class="container">
    <div class="row">
        <div class="col">
            {% for post in posts %}
                <article class="post">
                    <time class="date">
                        {{ post.published_date }}
                    </time>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </article>
            {% endfor %}
        </div>
    </div>
</main>
```

Salvează fișierele și actualizează site-ul.

![Figura 14.4](images/final.png)

Uau! Arată super, așa-i? Hai să ne uităm la codul pe care l-am copiat ca să găsim locurile unde am adăugat clasele în HTML și le-am folosit în CSS. Unde ai face schimbarea dacă ai dori ca data să fie de culoare turcoaz?

Nu-ți fie teamă să experimentezi cu acest CSS și să încerci să modifici unele lucruri. Joaca cu CSS te poate ajuta să înțelegi ce fac diferite lucruri. Dacă strici ceva, nu-ți face griji – poți oricând să anulezi schimbarea!

Îți recomandăm să urmezi cursurile online gratuite "Basic HTML & HTML5" şi "Basic CSS" pe [freeCodeCamp](https://learn.freecodecamp.org/). Ele te pot ajuta să înveți cum să-ți înfrumusețezi site-urile cu HTML și CSS.

Gata pentru capitolul următor?! :)