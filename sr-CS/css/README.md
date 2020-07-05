# CSS - vreme je za ulepšavanje!

Naš blog izgleda poprilično ružno, zar ne? Vreme je da ga osvežimo! Iskoristićemo CSS za to.

## Šta je CSS?

CSS (eng. Cascading Style Sheets) je jezik koji se koristi za opisivanje izgleda i formatiranje veb sajta napisanog u jeziku za označavanje (poput HTML-a). Možete smatrati da je to šminka za Vaš veb sajt. :)

Ali ne želimo da počnemo sve ispočetka, zar ne? Da napomenemo još jednom, koristićemo nešto što su programeri objavili ranije na internetu, potpuno besplatno. Izmišljanje tople vode ponovo nije baš zabavno.

## Hajde da koristimo Bootstrap!

Bootstrap je jedna od najpopularnijih HTML i CSS biblioteka za razvoj lepih veb sajtova: https://getbootstrap.com/

Inicijalno je napisana je od strane programera koji su radili u Twitter-u. Trenutno se razvija od strane developera širom sveta.

## Instalacija Bootstrap-a

Kako biste instalirali Bootstrap, otvorite Vaš `.html` fajl u editoru i u `<head>` odeljku dodajte ovo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Ova naredba ne dodaje ni jedan novi fajl u Vaš projekat. Umesto toga, samo pokazuje fajlove koji postoje na Internetu. Samo napred, otvorite svoj veb sajt i osvežite stranicu. Evo ga!

![Slika 14.1](images/bootstrap1.png)

Već izgleda lepše!

## Statički fajlovi u Djangu (Django)

Najzad ćemo detaljnije pogledati ono što smo zvali **statički fajlovi**. To predstavlja sav Vaš CSS i sve slike. Njihov sadržaj ne zavisi od konteksta zahteva i jednak je za svakog korisnika.

### Gde staviti statičke fajlove u Django-u

Django sam zna gde da nađe statičke fajlove za ugrađene "admin" aplikacije. Sada samo treba da dodamo neke statičke fajlove za našu novu aplikaciju, `blog`.

To ćemo uraditi tako što ćemo kreirati folder pod nazivom `static` unutar blog aplikacije:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django će automatski da pronađe bilo koji folder koji je nazvan "static" (statički) unutar nekog od foldera Vaše aplikacije. Zatim će biti moguće da koristite pronađeni sadržaj kao statičke fajlove.

## Vaš prvi CSS dokument!

Hajde da kreiramo sada CSS fajl, kako bismo dodali malo stila veb stranici. Kreirajte novi direktorijum koji se zove `css` unutar Vašeg `static` direktorijuma. Zatim kreirajte novi fajl po imenu `blog.css` unutar tog `css` direktorijuma. Spremni?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Vreme je da napišete neki CSS! Otvorite `blog/static/css/blog.css` fajl u svom editoru.

Nećemo pričati opširno o personalizovanju i učenju CSS-a ovde, jer postoji preporuka za besplatan CSS kurs na kraju ove stranice, ukoliko želite da naučite više.

Ali, hajde da ipak uradimo neke stvari. Možda bismo mogli da promenimo boju zaglavlja? Kako bi razumeli boje, računari koriste određene kodove. Ti kodovi počinju sa `#`, nakon čega sledi 6 slova (A–F) i brojeva (0–9). Na primer, kod za plavu boju je `#0000FF`. Za mnoge boje, možete da pronađete kodove na ovom linku: http://www.colorpicker.com/. Moguće je i koristiti [unapred podešene boje](http://www.w3schools.com/colors/colors_names.asp) kao što su `red` (crvena) i `green` (zelena).

Trebalo bi da dodate sledeću liniju koda u Vašem `blog/static/css/blog.css` fajlu:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` je CSS selektor. To znači da primenjujemo naš stil na bilo koji `a` element unutar `h1` elementa; selektor `h2 a` radi potpuno istu stvar za `h2` elemente. Dakle, kada imamo liniju koda kao što je `<h1><a href="">link</a></h1>`, tada će se primeniti `h1 a` stil. U ovom slučaju, uneli smo naredbu da se boja promeni u `#C25100`, što je zapravo tamno narandžasta. Možete da unesete i Vašu željenu boju, ali se postarajte da ima dobar kontrast naspram bele pozadine!

U CSS fajlovima određujemo stilove za elemente u HTML fajlovima. Prvi način na koji možemo da identifikujemo elemente je pomoću imena elemenata. Možda Vam je to poznatije pod nazivom tagovi, iz dela sa HTML-om. Stvari kao što su `a`, `h1`, i `body` su primeri imena elemenata. Takođe, identifikujemo elemente i prema atributu `class` ili atributu `id`. Class (klasa) i id (identifikacioni broj) su imena koja sami dodeljujete elementima. Klase predstavljaju grupe elemenata, a identifikacioni brojevi pokazuju jedan određeni element. Na primer, možete da odredite sledeći tag koristeći naziv taga `a`, klasu `external_link`, ili identifikacioni broj `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Možete da pročitate više o tome na linku [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Takođe, moramo da na neki način obavestimo HTML obrazac da smo dodali neki CSS. Otvorite `blog/templates/blog/post_list.html` fajl u editoru i dodajte ovu liniju na samom početku:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Sada samo učitavamo statičke fajlove. :) Između `<head>` i `</head>` tagova, nakon linkova do Bootstrap CSS fajlova, dodajte sledeću liniju:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Pretraživač učitava fajlove po redosledu od početka do kraja, tako da moramo da budemo sigurni da je ova linija koda na pravom mestu. U suprotnom, kod u našem fajlu može da bude "pregažen" od strane koda iz Bootstrap fajla. Ovim smo na neki način rekli našem obrascu gde je lociran naš CSS fajl.

Vaš fajl bi trebalo sada da izgleda ovako:

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

U redu, sada sačuvajte fajl i osvežite sajt!

![Slika 14.2](images/color2.png)

Lepo urađeno! Možda bismo mogli da damo našem sajtu malo prostora i da povećamo marginu sa leve strane? Hajde da to pokušamo!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Dodajte to Vašem CSS-u, sačuvajte fajl i pogledajte šta ste dobili!

![Slika 14.3](images/margin2.png)

Možda bismo mogli da podesimo željeni font u našem zaglavlju? Nalepite ovo u Vaš `<head>` u fajlu `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Kao i prošli put, proverite redosled i mesto na koje postavljate link, unutar `blog/static/css/blog.css` fajla. Ova linija koda će iz Google Fontova (https://www.google.com/fonts) uvesti font koji se zove *Lobster*.

Pronađite blok u kojem je deklarisan `h1 a` (deo koda između zagrada `{` `}`) u CSS fajlu `blog/static/css/blog.css`. Dodajte liniju `font-family: 'Lobster';` između zagrada i osvežite stranicu:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Slika 14.3](images/font.png)

Odlično!

Kao što je napomenuto ranije, u CSS-u postoje klase. One omogućavaju da odredite deo HTML koda i da primenite određene stilove na taj deo, bez ikakvog uticaja na ostale delove. To može da bude jako korisno! Možda imate dve celine (div-ovi) koje rade potpuno različite stvari (kao na primer zaglavlje i post). Klase mogu da Vam pomognu da učinite da ti delovi izgledaju drugačije.

Pokušajte da imenujete neke delove Vašeg HTML koda. Dodajte klasu koja se zove `page-header` u Vaš `div` koji sadrži zaglavlje:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Sada dodajte klasu `post` u Vaš `div` koji sadrži post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Sada ćemo dodati deklaracione blokove različitim selektorima. Selektori počinju `.` (tačkom) za razliku od klasa. Postoje mnogi odlični priručnici i objašnjenja o CSS-u na internetu koji mogu da Vam pomognu da razumete sledeći kod. Za sada, kopirajte ga i nalepite u Vaš `blog/static/css/blog.css` fajl:

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

Zatim umetnite HTML kod koji prikazuje post između deklaracija klasa. Zamenite sledeći deo:

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

u `blog/templates/blog/post_list.html` fajlu ovim delom:

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

Sačuvajte ove fajlove i osvežite svoj sajt.

![Slika 14.4](images/final.png)

Vauuu! Izgleda odlično, zar ne? Pogledajte kod koji smo nalepili kako biste videli gde su dodate klase u HTML-u i upotrebljene u CSS-u. Gde biste načinili izmenu, ako biste želeli da obojite datum u tirkizno?

Ne plašite se da malo eksperimentišete sa CSS-om i da pokušate da promenite neke stvari. Igranje CSS-om može da Vam pomogne da razumete kako različite stvari funkcionišu. Ako negde pogrešite, ne brinite - uvek možete da se vratite korak unazad!

Zaista preporučujemo polaganje besplatnih online kurseva "Basic HTML & HTML5" i „Basic CSS“ na [ freeCodeCamp ](https://learn.freecodecamp.org/). Oni vam mogu pomoći da naučite sve o tome kako da napravite vaše web stranice lepše koristeci HTML i CSS.

Da li ste spremni za sledeće poglavlje?! :)