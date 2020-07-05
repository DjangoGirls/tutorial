# CSS - csinosítsd ki!

Egyelőre nem túl szép a blogunk, igaz? Itt az ideje, hogy kicsinosítsd! Erre a CSS-t fogjuk használni.

## Mi a CSS?

A CSS (Cascading Style Sheets) egy nyelv, amit a HTML-ben megírt weboldalak kinézetének leírására használunk. Vagyis mintha kisminkelnéd a weboldaladat. ;)

De ugye mi nem akarunk mindent elölről kezdeni? Megint csak egy olyat fogunk használni, amit a programozók kitettek az internetre, ingyenesen. A kerék újra feltalálás tudod nem olyan jó dolog.

## Használjunk Bootstrapet!

A Bootstrap az egyik legnépszerűbb HTML és CSS keretrendszer, amivel szép weboldalakat készíthetünk: https://getbootstrap.com/

Eredetileg a Twitternél dolgozó programozók készítették, de most önkéntesek fejlesztik szerte a világon!

## Bootstrap telepítés

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![14.1 ábra](images/bootstrap1.png)

Már sokkal jobban néz ki!

## Statikus fájlok a Django-ban

Most nézzük meg kicsit közelebbről ezeket a "**statikus fájl**"-nak nevezett dolgokat. Static files are all your CSS and images. Their content doesn't depend on the request context and will be the same for every user.

### Hová pakoljuk a statikus fájlokat?

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

Ehhez pedig létre kell hozunk egy "`static`" nevű könyvtárat a blog applikáción belül:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

A Django automatikusan megtalál minden "static" nevű mappát az alkalmazásaid könyvtárain belül, és képes lesz használni azok tartalmát statikus fájlokként.

## Az első CSS fájlod!

Írjunk egy CSS fájlt, hogy hozzáadd a saját stílusodat a weboldaladhoz. Hozz létre egy `css` nevű könyvtárat a `static` könyvtárban! Majd hozz létre egy új fájlt `blog.css` néven a `css` könyvtárban. Kész vagy?

    djangogirls
     └─── blog
         └─── statikus
             └─── css
                 └─── blog.css
    

Itt az ideje, hogy a CSS fájlunkba írjunk is valamit! Nyisd meg a `blog/static/css/blog.css` fájlt a kódszerkesztődben.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

De azért egy pár dolgot megmutatunk. Maybe we could change the color of our headers? Hogy a számítógépek megértsék a színeket, speciális kódokat használnak. `#` jellel kezdődnek, majd 6 betű (A-F) és szám (0-9) következik. For example, the code for blue is `#0000FF`. Színkódokat például itt találhatsz: http://www.colorpicker.com/. [Előre meghatározott színeket](http://www.w3schools.com/colors/colors_names.asp) is használhatsz, mint a `red` vagy a `green`.

A `blog/static/css/blog.css` fájlba írd bele a következő kódot:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

A `h1 a` egy CSS szelektor. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

A CSS fájlban mondjuk meg, hogy nézzenek ki a HTML fájl elemei. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. A class és az id olyan nevek, amelyeket te adhatsz meg az elemeknek. A class attribútum elemek egy csoportjára vonatkozik, míg az id-val kifejezetetten egy elemet tudunk beazonosítani. A következő tag például beazonosítható akár az "`a`" tag névvel, az `external_link` class-szal vagy a `link_to_wiki_page` id-val:

```html
html<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Olvass utána a [CSS szelektorokról a w3schools oldalán](http://www.w3schools.com/cssref/css_selectors.asp).

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

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. Most megmondtuk a template-ünknek, hol találja a CSS fájlokat.

Így kellene kinéznie a fájlodnak:

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

Oké, mentsd el a fájlt és frissítsd be az oldalt!

![14.2 ábra](images/color2.png)

Szép munka! Lehet, hogy jó lenne adni egy kis "teret" a weboldalunknak és növelni a bal oldali margót. Próbáljuk meg!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Írd hozzá a CSS fájlodhoz, mentsd el és lássuk, működik-e!

![14.3 ábra](images/margin2.png)

Lehet, hogy testre szabhatnánk a betű stílusát a header-ünkben. A következő sort másold bele a `<head>`-be a `blog/templates/blog/post_list.html` fájlon belül:

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

![14.3 ábra](images/font.png)

Szuper!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Menj végig és nevezd el egy részét a HTML kódodnak. Adj egy `page-header` nevű class-t a `div`-edhez, amelyik a header-t tartalmazza, akárcsak így:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

És most adj egy `post` class-t a `div`-hez, ami a blog postokat tartalmazza.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Most pedig adjunk stílusblokkokat a különböző szelektorokhoz. A `.` -tal kezdődő szelektorok classokra utalnak. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Ezután jelöld ki a HTML kódot, ami a post-okat jeleníti meg egy class="post" attribútummal. Cseréld le ezt:

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

a `blog/templates/blog/post_list.html` fájlban ezzel:

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

Mentsd el a fájlokat és frissítsd az oldalad.

![14.4 ábra](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Készen állsz a következő fejezetre?! :)