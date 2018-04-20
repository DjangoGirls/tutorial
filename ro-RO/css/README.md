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

Aceasta nu adaugă nici un fișier la proiect, ci doar face referință la fișiere care există pe Internet. Deschidem website-ul nostru și actualizăm pagina. Iat-o!

![Figura 14.1](images/bootstrap1.png)

Deja arată mai frumos!

## Fișierele statice în Django

În sfârșit ne vom uita mai atent la lucrurile pe care le numim **fișiere statice**. Fișierele statice sunt toate imaginile și fișierele CSS. Conținutul acestora nu depinde de contextul cererii la server și va fi la fel pentru orice utilizator.

### Unde se pun fișierele statice pentru Django

Django deja știe unde să găsească fișierele statice pentru aplicația "admin" preconfigurată. Acum trebuie doar să adăugăm niște fișiere statice pentru aplicația noastră `blog`.

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

Nu ne vom adînci prea mult în personalizarea și învățarea CSS. La sfîrșitul acestei pagini este o recomandare pentru un curs gratis de CSS dacă doriți să aflați mai multe.

Dar hai să facem cel puțin ceva. Poate am putea schimba culoarea header-ului? Pentru a înțelege culorile, calculatoarele ulilizează niște coduri speciale. Aceste coduri încep cu `#` urmate de 6 litere (A-F) și numere (0-9). De exemplu, codul pentru culoarea albastră este `#0000FF`. Putem găsi codurile a multe culori aici: http://www.colorpicker.com/. Poți de asemenea utiliza [culori predefinite](http://www.w3schools.com/colors/colors_names.asp), precum `red` - roșu și `green` - verde.

Adaugă următorul cod în fișierul `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {     
    color: #FCA205; 
}
```

`h1 a` este un Selector CSS. Aceasta înseamnă că folosim stilul nostru la orice element `a` înăuntru la un element `h1`. Așa că atunci cînd vom avea ceva ca `<h1><a href="">link</a></h1>`, stilul `h1 a` va fi folosit. În acest caz, noi spunem să își schimbe culoarea în `#FCA205`, care reprezintă culoarea oranj. Desigur poți pune culoarea ta proprie aici!

Într-un fișier CSS determinăm stilurile pentru elementele într-un fișier HTML. Prima metodă de a identifica elementele e prin numele unui element. Le ținem minte ca tag-urile din secția despre HTML. Astfel de lucruri ca `a`, `h1`, și `body` sunt exemple de nume de elemente. De asemenea putem identifica elementele după atributul `class` sau atributul `id`. Numele de clase și id le definești singur. Clasele definesc grupuri de elemente, și id-urile indică la niște elemente anumite. De exemplu, ai putea identifica următorul tag folosind numele tag-ului `a`, clasa `external_link` sau id-ul id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Poți afla mai multe despre [selectorii CSS la w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

De asemenea trebuie să-i spunem șablonului nostru HTML că am adăugat CSS. Deschidem fișierul `blog/templates/blog/post_list.html` și adăugăm această linie la începutul acestuia:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
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
{% load staticfiles %}
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

Bună treabă! Poate ai vrea să-i dai site-ului un pic de air și să mărești marginea din partea stângă? Să încercăm!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figura 14.3](images/margin2.png)

Poate putem personaliza font-ul din header? Inserează aceasta în `<head>` din fișierul `blog/templates/blog/post_list.html`:

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

Grozav!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Numește câteva părți din codul HTML. Adaugă o clasă numită `page-headers` la `div`-ul care conține headerul:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Acum adaugă o clasă `post` la `div`-ul care conține un post de blog.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Acum vom adăuga blocuri de declarare la selectoare diferite. Selectoarele care încep cu `.` se referă la clase. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. Pentru moment, doar copiază-l și inserează-l in fișierul `blog/static/css/blog.css`:

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

în `blog/templates/blog/post_list.html` cu asta:

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

Salvează fișierele și actualizează site-ul.

![Figura 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Gata pentru capitolul următor?! :)