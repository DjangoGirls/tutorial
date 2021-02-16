# CSS – make it pretty!

Náš blog nevypadá stále dost pěkně, že? Je na čase ho udělat hezčí! Použijeme na to CSS.

## Co je to CSS?

Kaskádové styly (Cascading Style Sheets, CSS) je jazyk používáný pro popis vzhledu a formátu webové stránky napsané ve značkovacím jazyce (jako například HTML). Berte to jako make-up pro naši webovou stránku. ;)

Ale nechceme začínat od nuly, že? Znovu použijeme něco, co už někdo vytvořil a umístil na Internet aby to mohli ostatní programátoři používat zdarma. Vymýšlení už vymyšlených věcí není zábava.

## Použijme Bootstrap!

Bootstrap je jeden z nejpopulárnějších frameworků pro HTML a CSS na vytváření krásných webových stránek: https://getbootstrap.com/

Byl vytvořen programátory, kteří pracovali pro Twitter. Nyní je Bootstrap vyvíjen dobrovolníky po celém světě!

## Instalace Bootstrapu

Pro instalaci Bootstrapu otevři svůj `.html` soubor v kódovém editoru a přidej tohle do `<head>` sekce:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Nepřidá to žádné soubory do tvého projektu. Jen to ukazuje na soubory, které existují na Internet. Takže do toho, otevři svoji webovou stránku a obnov ji. To je ono!

![Obrázek 14.1](images/bootstrap1.png)

Hned to vypadá lépe!

## Statické soubory v Djangu

Konečně se podíváme zblízka na téma, které jsme již zmínili, **statické soubory**. Statické soubory jsou všechna tvá CSS a obrázky. Jejich obsah nezávisí na kontextu požadavku a bude stejný pro každého uživatele.

### Kam umístit statické soubory pro Django

Django již ví, kde najít statické soubory pro vestavěnou "admin" aplikaci. Nyní potřebujeme přidat nějaké statické soubory do naší vlastní aplikace, `blog`.

Uděláš to tak, že vytvoříš složku s názvem `static` uvnitř aplikace blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django bude automaticky hledat jakékoliv složky nazvané "static" uvnitř tvých složek v aplikaci. Poté bude schopný použít jejich obsah jako statické soubory.

## Tvůj první soubor CSS!

Pojďme vytvořit nějaký CSS soubor a přidat vlastní styly pro tvou webovou stránku. Vytvoř nový adresář s názvem `css` uvnitř adresáře `static`. Vytvoř nový soubor s názvem `blog.css` uvnitř tohoto adresáře `css`. Připraveno?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Čas k napsání nějakého CSS! Otevři soubor `blog/static/css/blog.css` v editoru kódu.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Ale pojďme něco málo udělat. Maybe we could change the color of our headers? Pro interpretaci barev, počítače používají speciální kódy. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. Můžeš také použít [předdefinované barvy](http://www.w3schools.com/colors/colors_names.asp), `červená/red` a `zelená/green`.

V souboru `blog/static/css/blog.css` přidej následující kód:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1` je CSS selector. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

V CSS souboru určujeme styly pro prvky v souboru HTML. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Třídy/Class a id jsou jména, které pojmenovávají samotný prvek. Třídy definují skupiny prvků a Id poukazují na konkrétní prvky. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

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

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. Právě jsi řekla naší šabloně, kde je umístěn náš soubor CSS.

Soubor by měl nyní vypadat takto:

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

OK, ulož soubor a aktualizuj stránky!

![Obrázek 14.2](images/color2.png)

Dobrá práce! Možná bychom také chtěli provzdušnit náš web a zvětšit okraj na levé straně? Pojďme to zkusit!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Obrázek 14.3](images/margin2.png)

Možná můžeme také chtít přizpůsobit písmo v našem záhlaví? Vlož mezi tag `< head >` v souboru `blog/templates/blog/post_list.html`:

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

![Obrázek 14.3](images/font.png)

Skvěle!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Pokračuj a pojmenuj některé části kódu HTML. Přidáš třídu s názvem `page-header` do tvého `div` tagu, který obsahuje záhlaví, jako je tento:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

A nyní přidej třídu, `post` do svého `div` obsahující blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Nyní přidáme deklaraci bloků pro jiné selektory. Selektory začínající `.` se týkají tříd. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Pak obklopující HTML kód, který zobrazuje příspěvek s deklaracemi tříd. Nahraď tímto:

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

v `blog/templates/blog/post_list.html` tímto:

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

Tyto soubory ulož a aktualizuj své webové stránky.

![Obrázek 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Připravena na další kapitolu?! :)