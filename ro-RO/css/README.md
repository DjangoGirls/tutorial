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
    

Django va găsi automat orice fișiere numite "static" în orice mapă a aplicației. Apoi va putea să le folosească conținutul ca fișiere statice.

## Primul fișier CSS!

Să creăm un fișier CSS acum pentru a adăuga stil propriu paginii web. Creăm o mapă nouă numită `css` în interiorul mapei `static`. Apoi creăm un nou fișier numit `blog.css` înăuntrul mapei `css`. Gata?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

E timpul pentru a scrie niște CSS! Deschidem fișierul `blog/static/css/blog.css` în editorul de cod.

Nu ne vom adînci prea mult în personalizarea și învățarea CSS. La sfîrșitul acestei pagini este o recomandare pentru un curs gratis de CSS dacă este dorința de a afla mai multe.

Dar hai să facem cel puțin ceva. Poate am putea schimba culoarea header-ului? Pentru a înțelege culorile, calculatoarele ulilizează niște coduri speciale. Aceste coduri încep cu `#` urmate de 6 litere (A-F) și numere (0-9). De exemplu, codul pentru culoarea albastră este `#0000FF`. Putem găsi codurile a multe culori aici: http://www.colorpicker.com/. Poți de asemenea utiliza [culori predefinite](http://www.w3schools.com/colors/colors_names.asp), precum `red` - roșu și `green` - verde.

Adaugăm următorul cod în fișierul `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` este un Selector CSS. Acesta înseamnă că utilizăm stilurile pentru fiecare element `a` în element `h1`; selector `h2 a` face lucru asemănător, doar pentru elemente `h2`. Așa că atunci cînd vom avea ceva ca `<h1><a href="">link</a></h1>`, stilul `h1 a` va fi folosit. În acest caz, noi îi spunem să își schimbe culoarea în `#C25100`, care reprezintă culoarea oranj. Sau puteți să utilizați altă culoare, dar să asigurați că există un contrast bun cu fundalul deschis!

Într-un fișier CSS determinăm stilurile pentru elementele într-un fișier HTML. Prima metodă de a identifica elementele e prin numele unui element. Le ținem minte ca tag-urile din secția despre HTML. Astfel de lucruri ca `a`, `h1`, și `body` sunt exemple de nume de elemente. De asemenea putem identifica elementele după atributul `class` sau atributul `id`. Numele de clase și id le definim singuri. Clasele definesc grupuri de elemente, și id-urile indică la niște elemente anumite. For example, you could identify the following element by using the element name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Putem afla mai multe despre [selectorii CSS la w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

De asemenea trebuie să-i spunem șablonului nostru HTML că am adăugat CSS. Deschidem fișierul `blog/templates/blog/post_list.html` și adăugăm această linie la începutul acestuia:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Noi doar încărcăm fișierele statice aici. :) Între tag-urile `<head>` și `</head>`, după referințele la fișierele CSS de Bootstrap, adaugăm această linie:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Browser-ul citește fișierele în ordinea în care sunt transmise, așa că trebuie să ne asigurăm că se află în locul potrivit. În caz contrar, codul din fișierul nostru poate fi rescris de codul din fișierele Bootstrap. În acest moment i-am spus șablonului unde se află fișierul nostru CSS.

Fișierul nostru trebuie să arate așa:

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

Bine, salvăm fișierul și actualizăm pagina!

![Figura 14.2](images/color2.png)

Bună treabă! Poate am vrea să-i dăm site-ului un pic de spațiu și să mărim marginea din partea stângă? Să încercăm!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Adăugăm aceasta la CSS-ul nostru, salvăm fișierul și ne uităm cum lucrează!

![Figura 14.3](images/margin2.png)

Poate putem personaliza font-ul din header? Inserăm aceasta în `<head>` din fișierul `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Ca și mai înainte, notăm ordinea și plasăm înaintea link-ului la `blog/static/css/blog.css`. Această linie va importa un font numit *Lobster* din Google Fonts (https://www.google.com/fonts).

Găsim declarația blocului `h1 a` (codul între parantezele `{` și `}`) în fișierul CSS `blog/static/css/blog.css`. Acum adăugăm linia `font-family: 'Lobster';` între paranteze și actualizăm pagina:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figura 14.3](images/font.png)

Grozav!

Cum am menționat mai înainte, CSS are conceptul de clase. Acestea ne permit să numim o parte din codul HTML și să folosim stiluri doar pentru această parte fără a influența celelalte părți. Aceasta poate fi foarte util! Poate avem două div-uri care fac ceva diferit (de exemplu header-ul nostru și postarea). O clasă poate să ne ajute să le facem să arate diferit.

Go ahead and name some parts of the HTML code. Replace the `header` that contains your header with the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

And now add a class `post` to your `article` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

Acum vom adăuga blocuri de declarare la selectoare diferite. Selectoarele care încep cu `.` se referă la clase. Sunt o mulțime de tutoriale și explicări a CSS pe web care ne pot ajuta să înțelegem codul următor. Pentru moment, doar copiază-l și inserează-l in fișierul `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    margin-bottom: 40px;
    padding: 20px 20px 20px 40px;
}

.page-header h1,
.page-header h1 a,
.page-header h1 a:visited,
.page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

h1,
h2,
h3,
h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea,
.post-form input {
    width: 100%;
}

.top-menu,
.top-menu:hover,
.top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a,
.post h2 a:visited {
    color: #000000;
}

.post > .date,
.post > .actions {
    float: right;
}

.btn-default,
.btn-default:visited {
    color: #C25100;
    background: none;
    border-color: #C25100;
}

.btn-default:hover {
    color: #FFFFFF;
    background-color: #C25100;
}
```

Apoi selectează codul HTML care afișează posturile cu declarațiile de clase. Înlocuiește asta:

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

Salvăm fișierele și actualizăm site-ul.

![Figura 14.4](images/final.png)

Uau! Arată super, așa-i? Hai să ne uităm la codul care l-am copiat ca să găsim locurile unde am adăugat clasele în HTML și le-am folosit în CSS. Unde am face schimbarea dacă am dori ca data să fie de culoare turcoaz?

Să nu ne temem să schimbăm acest CSS un pic și să modificăm niște lucruri. Jucîndu-ne cu CSS putem înțelege ce fac diferite lucruri. Dacă ceva se strică, fără griji - putem oricînd să anulăm schimbarea!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Gata pentru capitolul următor?! :)