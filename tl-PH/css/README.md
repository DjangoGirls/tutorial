# CSS - gawing nating maganda!

Pangit pa ang ating kasalukuyang blog, hindi ba? Oras na para pagandahin ito! Gagamitin natin ang CSS para riyan.

## Ano ang CSS?

Ang Cascading Style Sheets (CSS) ay isang wika na ginagamit para ilarawan ang itsura at pagkalatag ng mga website ma gumagakip ng markup na wika gaya ng HTML. Isipin itong pampaganda ng ating mga pahina sa web. ;)

Pero hindi natin gusto na magsimula uli sa wala, tama ba? Sa makaisa pa, gagamitin natin ang isang bagay na pinalabas nga mga programmer na libre sa Internet. Ang paggugol ng panahon na mag-isip ng bagong programa ay hindi biro, alam mo yan.

## Gamitin natin ang Bootstrap!

Ang Bootstrap ay isa sa mga pinakasikat na mga balangkas ng HTML ay CSS para makagawa ng magagandang mga website: https://getbootstrap.com/

Ito ay isinulat ng mga programmer na nagtatrabaho sa Twitter. Sa ngayon, ito ay patuloy na ginagawa ng mga boluntaryo galing sa ibat ibang sulok ng mundo!

## Mag-install ng Bootstrap

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Tambilang 14.1](images/bootstrap1.png)

Gumaganda na siya!

## Static Files sa Django

Sa wakas ay titingnan natin nang masinsinan ang mga bagay na tinatawag nating **static files**. Ang static na mga gile ay ang iyong mga CSS at mga larawan. Ang laman nila ay hindi nakadepende sa nilalaman ng request at ito ay pareho lang sa bawat user.

### Saan ilagay ang static na mga file para sa Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

Magagawa natin yan sa pamamagitan ng paglikha ng folder na pinangalanang `static` sa loob ng blog na app:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Si Django ay kusang maghanap ng mga folder na tinawag na "static" sa loob ng iyong mga app na mga folders. Pagkatapos ay pede na niyang gamitin ang mga laman nito isip mga static na mga file.

## Ang iyong unang CSS file!

Gagawa tayo ng CSS na file, para pagandahin ang iyong web page. Gumawa ng bagong directory na `css` sa loob ng iyong `static` directory. Pagkatapos, gumawa ka ng bagong file na `blog.css` sa loob nitong `css` directory mo. Handa ka na ba?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Oras na para magsulat ng CSS! Buksan ang `blog/static/css/blog.css` na file sa loob ng iyong editor ng code.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Pero gumawa naman tayo kahit kaunti lang. Maybe we could change the color of our headers? Para maunawaan ang mga kulay, ang kompyuter ay sumusunod sa mga special codes o mga numero at letra na nagsisimbolo ng kulay. Ang mga code na ito ay nagsimula sa `#` at sinundan ng 6 na letra (A-F) at mga numero (0-9). Halimbawa, ang code para sa asul ay `#0000FF`. Maari mong makita ang mga color code sa iba't ibang kulay dito: http://www.colorpicker.com/. Maari ka ding gumamit ng mga [nakatakdang mga kulay](http://www.w3schools.com/colors/colors_names.asp), tulad ng `red (o pula)` at `green (o berde)`.

Sa iyong `blog/static/css/blog.css` na file, kailangan mong idagdag ang sumusunod na code:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` ay isang Selector ng CSS. This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. Kung mayroon kang `<h1><a href="">link</a></h1>` na gaya nito, ang estilo na `h1 a` ay magagamit. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

Sa loob ng CSS file nakabase ang estilo ng mga elemento sa loob ng HTML na file. Ang unang pamamaraan na makilala natin ang mga elemento ay gamit ang pangalan ng elemento. Maari mong naalala ang mga tag na ito mula sa pangkat ng HTML. Mga bagay gaya ng `a`, `h1`, at `body` ay puro mga halimbawa ng mga pangalan ng elemento. Maaari din nating kilalanin ang mga elemento sa pamamagitan ng katangian na `class` o sa katangian na `id`. Ang class at id ay mga pangalan na sarili mong ibinigay sa mga elemento. Ang mga class ay nagbibigay kahulugan sa mga grupo ng mga elemento, at ang id ay nagtuturo sa mga tiyak na mga elemento. Halimbawa, maari mong kilalanin ang sumusunod na tag sa pamamagitan ng paggamit ng pangalan ng tag na `a`, sa `external_link` na class, o sa `link_to_wiki_page` na id:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Maari ka pang magbasa ng higit pa tungkol sa mga [Selector ng CSS sa w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Nagloload lang kami ng mga static na file dito. :) Sa gitna ng `<head>` at `</head>` na mga tag, kasunod ng mga link sa mga CSS file ng Bootstrap, idagdag mo ang linya na ito:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Ang browser ang nagbabasa sa mga file sa hanay na ibinigay, kaya kinakailangan nating isiguro na nasa tamang lugar ito. Kung hindi, ang mga code sa ating file ay mapangingibawan ng code ng mga file ng Bootstrap. Kakasabi lang natin sa ating template kung saan nakalagay ang ating CSS na file.

Ang file mo ay dapat maging katulad nito:

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

Sige, i-save ang file at i-refresh ang site!

![Tambilang 14.2](images/color2.png)

Magaling! Siguro dapat din nating bigyan ang ating website ng kaunnting simoy ng hangin at dagdagan ang baybay sa kaliwang bahagi? Subukan natin ito!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Idagdag mo ito sa iyong CSS, i-save ang file at tingnan kung paano ito gumagana!

![Tambilang 14.3](images/margin2.png)

Maari nating i-customize ang istilo ng mga letra sa ating header? Idikit ito sa iyong `<head>` sa `blog/templates/blog/post_list.html` na file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Tulad ng dati, pakitingnan ang pagkasunod-sunod at ilagay bago ang link sa `blog/static/css/blog.css`. Ang linyang ito ay mag-import ng istilo ng letra na tinatawag na *Lobster* mula sa mga Font ng Google (https://www.google.com/fonts).

Hanapin ang `h1 a` na deklerasyon na bloke (ang code sa pagitan ng braces `{` at `}`) sa loob ng CSS na file na `blog/static/css/blog.css`. Ngayon, idagdag ang linya na `font-family: 'Lobster';` sa pagitan ng mga kawing, at i-refresh ang pahina:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Tambilang 14.3](images/font.png)

Mainam!

Gaya ng binanggit sa taas, ang CSS ay mayroon konsepto ng mga class. Ang mga ito ay gamit para mapangalanan mo ang parte ng iyong HTML na code at i-apply ang istilo sa parte na ito lamang, na hindi makaapekto sa ibang bahagi. Ito ay sobrang makakatulong! Maari na mayroon kang dalawang div na kakaiba ang gamit (gaya ng iyong header at ang iyong post). Ang class ay makakatulong para gawing magkaiba ang kanilang anyo.

Sige at pangalanan mo ang ibang parte ng iyong HTML code. Magdagdag ng klase na tinatawag na `page-header` sa iyong `div` na naglalaman ng iyong header, gaya nito:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Blog ng Django Girls</a></h1>
</div>
```

At ngayon, magdagdag ng class na `post` sa iyong `div` na naglalaman ng iyong blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Ngayon, aming idadagdag ang deklerasyon na mga bloke sa iba ibang mga selector. Ang mga selector na nagsimula sa `.` ay may kaugnayan sa mga classes. Mayroong maraming magagandang tutorial doon at mga pagpapaliwanag tungkol sa CSS sa Web na makakatulong sa iyo sa pag-intindi sa mga sumusunod na code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Pagkatapos, palibutan ang HTML code na nagdidisplay ng mga post nang mga deklerasyon ng mga class. Palitan mo ito:

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

sa loob ng `blog/templates/blog/post_list.html` nito:

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

I-save ang mga file na iyon at i-refresh ang iyong website.

![Tambilang 14.4](images/final.png)

Woohoo! Kagilas-gilas di ba? Tingnan mo ang iyong code na kakadikit lang natin para mahanap mo ang lugar na dinagdagan natin ng mga class sa loob ng HTML at ginamit sa CSS. Saan mo gawin ang mga pagbabago kung gusto mong palitan ang kulay ng petsa ng turquoise (o turkesa)?

Huwag matakot paglaruan ng konti ang CSS at subukang baguhin ang mga istilo. Ang paglalarong CSS ay makakatulong sa iyo para maintindihan mo kung ano ang ginagawa ng iba't ibang bagay. Kung may nasira ka, huwag mag-alala - pwedeng-pwede mong ibalik ito sa dati!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Handa ka naba sa sunod na kabanata?! :)