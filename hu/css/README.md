# CSS - csinosítsd ki!

Egyelőre nem túl szép a blogunk, igaz? Itt az ideje, hogy kicsinosítsd! Erre a CSS-t fogjuk használni.

## Mi a CSS?

A CSS (Cascading Style Sheets) egy nyelv, amit a HTML-ben megírt weboldalak kinézetének leírására használunk. Vagyis mintha kisminkelnéd a weboldaladat ;).

De nem akarjuk megint az alapoktól kezdeni, igaz? Itt is olyasmit fogunk felhasználni, amit más programozók már létrehoztak, és szabadon elérhetővé tettek az Interneten. Minek találnánk fel újra a spanyolviaszt?

## Használjunk Bootstrapet!

A Bootstrap az egyik legnépszerűbb HTML és CSS keretrendszer, amivel szép weboldalakat készíthetünk: https://getbootstrap.com/

Eredetileg a Twitternél dolgozó programozók készítették, de most önkéntesek fejlesztik szerte a világon.

## Bootstrap telepítés

Hogy telepítsd a Bootstrapet, add hozzá a következő a sorokat a `<head>` részhez a `.html` fájlodban (`blog/templates/blog/post_list.html`):

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```    

Ezzel nem adsz hozzá új fájlokat a projektedhez, csak az Interneten létező fájlokra hivatkozol. Nyisd meg újra a weboldaladat, és frissítsd! Itt is van!

![14.1 ábra][1]

 [1]: images/bootstrap1.png

Már sokkal jobban néz ki!

## Statikus fájlok a Django-ban

Most nézzük meg kicsit közelebbről ezeket a "**statikus fájl**"-nak nevezett dolgokat. A CSS-ed és az összes képfájl statikus fájlnak számít -- ilyen minden, ami nem dinamikus, vagyis aminek a tartalma nem függ a kontextustól (magyarul a weboldal aktuális állapotától), és ezért minden felhasználó számára ugyanaz.

### Hová pakoljuk a statikus fájlokat?

Amikor -- kicsit korábban -- a `collectstatic` parancsot futtattuk a szerveren, Django már tudta, hol találja a statikus fájlokat a beépíttett "admin" alkalmazáshoz. Most csak annyit kell tennünk, hogy a saját, `blog` alkalmazásunkhoz hozzáadunk néhány statikus fájlt.

Ehhez pedig létre kell hozunk egy "`static`" nevű könyvtárat a blog applikáción belül:

    djangogirls
     ├── blog
     │ ├── migrations
     │ └── static 
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

Most nem fogunk túlságosan belemélyedni a CSS-be, mert nem bonyolult, és magadtól is meg tudod majd tanulni a workshop után. Szerintünk a [Codeacademy][2] HTML & CSS kurzusából mindent megtanulhatsz arról, hogyan teheted széppé a weboldalaidat CSS segítségével.

 [2]: https://www.codecademy.com/tracks/web

De azért egy pár dolgot megmutatunk. Például megváltoztathatnánk a header színét? Hogy a számítógépek megértsék a színeket, speciális kódokat használnak. `#` jellel kezdődnek, majd 6 betű (A-F) és szám (0-9) következik. Színkódokat például itt találhatsz: http://www.colorpicker.com/. [Előre meghatározott színeket][3] is használhatsz, mint a `red` vagy a `green`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

A `blog/static/css/blog.css` fájlba írd bele a következő kódot:

```css
h1 a {
  color: #FCA205;
}
```    

A `h1 a` egy CSS szelektor. Ez azt jelenti, hogy alkalmazzuk a stílusunkat minden olyan `a` elemre, ami egy `h1` elemen belül van (például, mikor valami ilyesmi van a kódban: `<h1><a href="">link</a></h1>`). Ebben az esetben azt mondjuk, hogy változtasd meg a kiválasztott elem színét `#FCA205`-re, ami narancssárgát jelent. Természetesen nyugodtan használd a saját színedet itt!

A CSS fájlban mondjuk meg, hogy nézzenek ki a HTML fájl elemei. Az egyes elemek beazonosíthatók az elemek nevei alapján (pl. `a`, `h1`, `body`), és a `class` vagy az `id` attribútumaik alapján. A class és az id olyan nevek, amelyeket te adhatsz meg az elemeknek. A class attribútum elemek egy csoportjára vonatkozik, míg az id-val kifejezetetten egy elemet tudunk beazonosítani. A következő tag például beazonosítható akár az "`a`" tag névvel, az `external_link` class-szal vagy a `link_to_wiki_page` id-val:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```    

Olvass utána a [CSS szelektorokról a w3schools oldalán][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Mindezek után közölnünk kell a HTML fájlunkkal is, hogy hozzáadtunk pár CSS-t. Nyisd meg a `blog/templates/blog/post_list.html` fájlt és add a következő sort a fájl legelejére:

```html
{% load staticfiles %}
```    

Itt csak betöltünk pár statikus fájlt :). Ezután a `<head>` és a `</head>` tagek közé, a Bootstrap CSS fájlok linkjei után (a böngésző olyan sorrendben olvassa az egyes fájlokat, amilyenben követik egymást, tehát a mi fájlunkban lévő kód lehet, hogy felülír pár kódot a Bootstrap fájlban), a következő sort add:

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```     

Most megmondtuk a template-ünknek, hol találja a CSS fájlokat.

Így kellene kinéznie a fájlodnak:

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
    

Oké, mentsd el a fájlt és frissítsd be az oldalt!

![14.2 ábra][5]

 [5]: images/color2.png

Szép munka! Lehet, hogy jó lenne adni egy kis "teret" a weboldalunknak és növelni a bal oldali margót. Próbáljuk meg!

```css
body {
    padding-left: 15px;
}
```    

Írd hozzá a CSS fájlodhoz, mentsd el és lássuk, működik-e!

![14.3 ábra][6]

 [6]: images/margin2.png

Lehet, hogy testre szabhatnánk a betű stílusát a header-ünkben. A következő sort másold bele a `<head>`-be a `blog/templates/blog/post_list.html` fájlon belül:

```html
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```    

Ez a sor beimportál egy *Lobster* nevű betűtípust a Google Fonts-ból (https://www.google.com/fonts).

Most add hozzá a `font-family: 'Lobster';` sort a `blog/static/css/blog.css` fájlodban, a `h1 a` stílusát meghatározó blokkhoz (ez a `{` kapcsos zárójel `}` közötti kód) és frissítsd az oldalt:

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![14.3 ábra][7]

 [7]: images/font.png

Szuper!

Ahogy fentebb említettük, a CSS-ben van egy "class" nevű fogalom, ami alapvetően azt teszi lehetővé, hogy elnevezd a HTML kódod egy részét és alkalmazz rajta egy stílust, csak ezen a részen, ami így nem befolyásolja a többit. Nagyon hasznos tud lenni, például amikor van két dived, amelyek nagyon különböző dolgokat csinálnak (akár a header-ed vagy a post-od), tehát nem akarod, hogy ugyanúgy nézzenek ki.

Menj végig és nevezd el egy részét a HTML kódodnak. Adj egy `page-header` nevű class-t a `div`-edhez, amelyik a header-t tartalmazza, akárcsak így:

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
``` 

És most adj egy `post` class-t a `div`-hez, ami a blog postokat tartalmazza.

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Most pedig adjunk stílusblokkokat a különböző szelektorokhoz. A `.` -tal kezdődő szelektorok classokra utalnak. Rengeteg szuper tutorial és magyarázat található a weben a CSS-ről, ami segít megérteni a következő kódot. Most csak másold ki és illeszd be a `blog/static/css/blog.css` fájlodba:

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
    float: right;
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

Ezután jelöld ki a HTML kódot, ami a post-okat jeleníti meg egy class="post" attribútummal. Cseréld le ezt:

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

a `blog/templates/blog/post_list.html` fájlban ezzel:

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        {{ post.published_date }}
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Mentsd el a fájlokat és frissítsd az oldalad.

![14.4 ábra][8]

 [8]: images/final.png

Nahát! Fantaszikus nem? A kódot, amit beillesztettünk, nem túl nehéz megérteni és a nagyja már csak átolvasva is érthető kell, hogy legyen.

Ne félj kicsit megbuherálni ezt a CSS-t és megváltoztatni pár dolgot. Ha valamit elrontasz, ne aggódj, vissza tudod csinálni!

Mindenesetre melegen ajánljuk ezt az ingyenes online [Codeacademy HTML & CSS kurzust][2], mint workshop utáni házi feladatot, hogy mindent tudj arról, hogyan tudod csinosabbá varázsolni a weboldaladat CSS-sel.

Készen állsz a következő fejezetre?! :)