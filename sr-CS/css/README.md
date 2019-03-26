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

Ali, hajde ipak da uradimo neke stvari. Možda bismo mogli da promenimo boju zaglavlja? Kako bi razumeli boje, računari koriste određene kodove. Ti kodovi počinju sa `#`, nakon čega sledi 6 slova (A–F) i brojeva (0–9). Na primer, kod za plavu boju je `#0000FF`. Za mnoge boje, možete da pronađete kodove na ovom linku: http://www.colorpicker.com/. Moguće je i koristiti [unapred podešene boje](http://www.w3schools.com/colors/colors_names.asp) kao što su `red` (crvena) i `green` (zelena).

Trebalo bi da dodate sledeću liniju koda u vašem `blog/static/css/blog.css` fajlu:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` je CSS selektor. To znači da primenjujemo naš stil na bilo koji `a` element unutar `h1` elementa; selektor `h2 a` radi potpuno istu stvar za `h2` elemente. Dakle, kada imamo liniju koda kao što je `<h1><a href="">link</a></h1>`, tada će se primeniti `h1 a` stil. U ovom slučaju, uneli smo naredbu da se boja promeni u `#C25100`, što je zapravo tamno narandžasta. Možete da unesete i Vašu željenu boju, ali se postarajte da ima dobar kontrast naspram bele pozadine!

U CSS fajlovima određujemo stilove za elemente u HTML fajlovima. Prvi način na koji možemo da identifikujemo elemente je pomoću imena elementa. Možda Vam je to poznatije pod nazivom tagovi, iz dela sa HTML-om. Stvari kao što su `a`, `h1`, i `body` su primeri imena elemenata. Takođe, identifikujemo elemente i prema atributu `class` ili atributu `id`. Class (klasa) i id (identifikacioni broj) su imena koja sami dodeljujete elementima. Klase predstavljaju grupe elemenata, a identifikacioni brojevi pokazuju jedan određeni element. Na primer, možete da odredite sledeći tag koristeći naziv taga `a`, klasu `external_link`, ili identifikacioni broj `link_to_wiki_page`:

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

Pretraživač učitava fajlove po redosledu od početka do kraja, tako da moramo da budemo sigurni da je ova linija koda na pravom mestu. U suprotnom, kod u našem fajlu može da bude "pregažen" od strane koda iz Bootstrap fajla. We just told our template where our CSS file is located.

Your file should now look like this:

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

OK, save the file and refresh the site!

![Slika 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Slika 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

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

![Slika 14.3](images/font.png)

Great!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

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

in the `blog/templates/blog/post_list.html` with this:

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

Save those files and refresh your website.

![Slika 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Ready for the next chapter?! :)