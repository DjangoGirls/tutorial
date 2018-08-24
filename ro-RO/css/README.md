# CSS - fă-l frumos!

Blog-ul nostru încă arată destul de urât, corect? E timpul să-l facem frumos! Pentru asta vom folosi CSS.

## Ce este CSS?

Cascading Style Sheets (CSS) este un limbaj folosit pentru a descrie aspectul vizual și formatarea unui website scris într-un limbaj de marcaj (ca HTML). Poate fi socotit ca machiaj pentru pagina noastră web :)

Dar noi nu vrem să începem de la început, așa-i? Și iarăși vom folosi ceva ce programatorii au lansat gratis pe net. Nu e foarte vesel să reinventezi bicicleta.

## Să folosim procesul de Bootstrap!

Bootstrap este unul din cele mai populare framework-uri HTML și CSS pentru dezvoltarea website-urilor frumoase: https://getbootstrap.com/

A fost scris de programatorii care au lucrat la Twitter. Acum e dezvoltat de voluntari din toată lumea!

## Instalăm Bootstrap

Pentru a instala Bootstrap, trebuie de adăugat următoarele în `<head>` în fișierul `.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Figura 14.1](images/bootstrap1.png)

Deja arată mai frumos!

## Fișierele statice în Django

În sfârșit ne vom uita mai atent la lucrurile pe care le numim **fișiere statice**. Fișierele statice sunt toate imaginile și fișierele CSS. Conținutul acestora nu depinde de contextul cererii la server și va fi la fel pentru orice utilizator.

### Unde se pun fișierele statice pentru Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

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
h1 a {     
    color: #FCA205; 
}
```

`h1 a` este un Selector CSS. Aceasta înseamnă că folosim stilul nostru la orice element `a` înăuntru la un element `h1`. Așa că atunci cînd vom avea ceva ca `<h1><a href="">link</a></h1>`, stilul `h1 a` va fi folosit. În acest caz, noi îi spunem să își schimbe culoarea în `#FCA205`, care reprezintă culoarea oranj. Or you can put your own color here!

Într-un fișier CSS determinăm stilurile pentru elementele într-un fișier HTML. Prima metodă de a identifica elementele e prin numele unui element. Le ținem minte ca tag-urile din secția despre HTML. Astfel de lucruri ca `a`, `h1`, și `body` sunt exemple de nume de elemente. De asemenea putem identifica elementele după atributul `class` sau atributul `id`. Numele de clase și id le definim singuri. Clasele definesc grupuri de elemente, și id-urile indică la niște elemente anumite. De exemplu, am putea identifica următorul tag folosind numele tag-ului `a`, clasa `external_link` sau id-ul id `link_to_wiki_page`:

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
h1 a {     
    color: #FCA205;     
    font-family: 'Lobster'; 
}
```

![Figura 14.3](images/font.png)

Grozav!

Cum am menționat mai înainte, CSS are conceptul de clase. Acestea ne permit să numim o parte din codul HTML și să folosim stiluri doar pentru această parte fără a influența celelalte părți. Aceasta poate fi foarte util! Poate avem două div-uri care fac ceva diferit (de exemplu header-ul nostru și postarea). O clasă poate să ne ajute să le facem să arate diferit.

Hai să numim câteva părți din codul HTML. Adaugăm o clasă numită `page-headers` la `div`-ul nostru care conține headerul:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Acum adaugăm o clasă `post` la `div`-ul care conține un post de blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Acum vom adăuga blocuri de declarare la selectoare diferite. Selectoarele care încep cu `.` se referă la clase. Sunt o mulțime de tutoriale și explicări a CSS pe web care ne pot ajuta să înțelegem codul următor. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Apoi selectează codul HTML care afișează posturile cu declarațiile de clase. Înlocuiește asta:

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

în `blog/templates/blog/post_list.html` cu acest cod:

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

Salvăm fișierele și actualizăm site-ul.

![Figura 14.4](images/final.png)

Uau! Arată super, așa-i? Hai să ne uităm la codul care l-am copiat ca să găsim locurile unde am adăugat clasele în HTML și le-am folosit în CSS. Unde am face schimbarea dacă am dori ca data să fie de culoare turcoaz?

Să nu ne temem să schimbăm acest CSS un pic și să modificăm niște lucruri. Jucîndu-ne cu CSS putem înțelege ce fac diferite lucruri. Dacă ceva se strică, fără griji - putem oricînd să anulăm schimbarea!

Recomandăm acest curs online gratuit [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). Ne poate ajuta să învățăm tot despre cum să ne facem website-ul mai frumos cu CSS.

Gata pentru capitolul următor?! :)