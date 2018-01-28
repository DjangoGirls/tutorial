# CSS - skrášli to!

Náš blog vyzerá zatiaľ dosť škaredo, však? Je čas to napraviť! Použijeme na to CSS.

## Čo je CSS?

Kaskádové štýly (CSS, angl. Cascading Style Sheets) je jazyk, ktorý sa používa na popis vzhľadu a formátovania webstránky napísanej v značkovacom jazyku (napríklad HTML). Predstav si to ako make-up pre našu webstránku. ;)

Ale nechceme začať od nuly, že? Znovu budeme používať niečo, čo programátori zverejnili na internete zadarmo. Ako vieš, vymýšlať koleso nie je žiadna zábava.

## Použime Bootstrap!

Bootstrap je jedným z najpopulárnejších HTML a CSS frameworkov pre vývoj krásnych webových stránok: https://getbootstrap.com/

Bol napísaný programátormi, ktorí pracovali pre Twitter. Teraz je vyvíjaný dobrovoľníkmi z celého sveta!

## Inštalácia Bootstrapu

Aby si nainštalovala Bootstrap, potrebuješ pridať nasledovnú vec do `<head>` tvojho `.html` súboru:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Nepridá to do tvojho projektu žiadne súbory. Iba to ukazuje na súbory, ktoré už existujú na Internete. Skúsme to, otvor svoju webstránku a obnov stránku. Už to máme!

![Obrázok 14.1](images/bootstrap1.png)

Už to vyzerá lepšie!

## Statické súbory v Djangu

Konečne sa pozrieme zblízka na veci, ktoré nazývame **statické súbory**. Statické súbory sú všetky vaše CSS a obrázky. Ich obsah nie je závislý na kontexte žiadosti a budú rovnaké pre každého používateľa.

### Kam umiestniť statické súbory pre Django

Django už vie, kde nájsť statické súbory pre zabudovanú aplikáciu "admin". Teraz už len musíme pridať niektoré statické súbory pre našu vlastnú aplikáciu, `blog`.

To urobíme tak, že vo vnútri našej aplikácie blog vytvoríme adresár s názvom `static`:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django automaticky nájde všetky zložky s názvom "static" vo všetkých priečinkoch tvojej aplikácie. Následne bude možné použiť ich obsah ako statické súbory.

## Tvoj prvý CSS súbor!

Vytvorme teraz CSS súbor, ktorý tvojej web stránke pridá tvoj vlastný štýl. Vytvor nový adresár s názvom `css` vnútri adresára `static`. Potom vytvor nový súbor s názvom `blog.css` vo vnútri tohto adresára `css`. Pripravená?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Je čas napísať trochu CSS! Otvor v editore kódu súbor `blog/static/css/blog.css`.

Tu sa nebudeme do hĺbky zaoberať úpravou a štúdiom CSS. Na konci tejto stránky sa nachádza odkaz na bezplatný CSS kurz, ak sa o tom cheš dozvedieť viacej.

Ale urobme aspoň niečo. Čo keby sme zmenili farbu hlavičky? Počítače používajú špeciálne kódy, aby rozumeli farbám. Tieto kódy sa začínajú `#` potom nasleduje 6 písmen (A-F) a číslice (0-9). Napríklad kód pre modrú je `#0000FF`. Kódy farieb nájdeš napríklad tu: http://www.colorpicker.com/. Môžeš tiež použiť [preddefinované farby](http://www.w3schools.com/colors/colors_names.asp) ako napríklad `red` (červená) alebo `green` (zelená).

V súbore `blog/static/css/blog.css` pridaj nasledujúci kód:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` je CSS Selector. To znamená, že sme naše štýly použili na akýkoľvek prvok `a`, vo vnútri prvku `h1`. Takže keď máme niečo ako: `<h1><a href="">link</a></h1>` použije sa naň `h1 a` štýl. V tomto prípade elementu hovoríme, aby zmenil svoju farbu na `#FCA205`, čo je oranžová. Samozrejme, sem môžeš zadať vlastnú farbu!

V CSS súbore definujeme štýly pre elementy v HTML súbore. Prvý spôsob, akým môžme identifikovať elementy je názov elementu. Môžno si pamätáte tieto značky z HTML sekcie. Veci ako `a`,`h1`, a `body` sú príklady názvov elementov. Elementy taktiež identifikujeme pomocou atribútu `class` alebo atribútu `id`. Triedy (class) a id sú názvy, ktorými nazveš elementy. Triedy definujú skupiny elementov a id-čká poukazujú na konkrétne elementy. Napríklad, nasledujúci tag môže byť identifikovaný v CSS pomocou mena tagu `a`, triedy `external_link`, alebo id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

O [CSS selektoroch ](http://www.w3schools.com/cssref/css_selectors.asp) si môžeš prečítať viac na stránkach w3schools.

Ešte musíme povedať našej HTML šablóne, že sme pridali nejaké CSS. Otvor súbor `blog/templates/blog/post_list.html` a pridaj tento riadok na úplný začiatok:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

Tu sme len nahrali statické súbory. :) Medzi `<head>` a `</head>`, po odkazoch na Bootstrap CSS súbory pridať tento riadok:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Prehliadač číta súbory ktoré dostane zaradom, takže musíme sa uistiť, že sú na správnom mieste. Inak kód v našich súboroch môžu byť prepísané kódom z Bootstrap súborov. Práve sme našej šablóne povedali, kde sa nachádza náš CSS súbor.

Súbor by mal teraz vyzerať asi takto:

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

OK, ulož súbor a obnov stránku!

![Obrázok 14.2](images/color2.png)

Pekne! Možno by sme chceli dať našej webovej stránke trochu vzduchu. Zväčšíme okraj na ľavej strane? Skúsme to!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Pridaj to do svojho CSS, ulož súbor a pozri, ako to funguje!

![Obrázok 14.3](images/margin2.png)

Mohli by sme trochu upraviť font v našej hlavičke, nie? Skopíruj toto do svojej hlavičky `<head>` v súbore `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Rovnako ako predtým, skontroluj poradie a umiestni pred odkaz na `blog/static/css/blog.css`. Tento riadok bude importovať font pod názvom *Lobster* z Google Fonts (https://www.google.com/fonts).

Nájdite `h1 a` deklaračný blok (kód medzi zátvorkami `{` a `}`) v súbore CSS ` blog/static/css/blog.css `. Teraz pridajte riadok` font-family: 'Lobster';` medzi zátvorky a obnovte stránku:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Obrázok 14.3](images/font.png)

Super!

Ako bolo uvedené vyššie, CSS má koncept tried. Triedy umožnia pomenovať časti HTML kódu a použiť štýly iba na tejto časti, bez ovplyvnenia ostatných častí. To môže byť super užitočné! Možno máš dva div-y, ktoré robia niečo iné (ako hlavička a tvoj príspevok). Triedy ti umožnia aby vyzerala každá inak.

Skús pomenovať niektoré časti HTML kódu. Pridaj triedu s názvom `page-header` do `div`u, ktorý obsahuje takúto nejakú hlavičku:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

A teraz pridaj triedu, `post` do `div`u, v ktorom je blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Teraz pridáme deklarácie rôznym selektorom. Selektory, ktoré začínajú `.` sa týkajú tried. Na webe je ohľadne CSS veľa skvelých tutorialov a vysvetlení, ktoré ti pomôžu pochopiť nasledujúci kód. Ale teraz len skopíruj a vlož nasledujúci kód do súboru `blog/static/css/blog.css`:

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

Teraz s deklaráciami tried obklop HTML kód, ktorý zobrazuje posty. Nahraď toto:

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

v súbore `blog/templates/blog/post_list.html` týmto:

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

Ulož tieto súbory a obnov svoju web stránku.

![Obrázok 14.4](images/final.png)

Woohoo! Vyzerá to úžasne, že áno? Pozrite sa na kód, ktorý sme práve vložili, nájdi miesta, kde sme pridali triedy v HTML a použili sme ich v CSS. Kde by si spravila zmenu, ak by si chcela dátum, tyrkysovej farby?

Neboj sa trochu pohrať s týmto CSS a pokús sa zmeniť niektoré veci. Hraním sa s CSS, môžeš pochopiť, čo robia rôzne veci. Ak niečo pokazíš, neboj sa, môžeš vždy vrátiť zmeny späť!

Naozaj odporúčame, tento kurz zadarmo on-line [ CSS & Codeacademy HTML](https://www.codecademy.com/tracks/web). Môžeš sa dozvedieť všetko o tom, ako môžeš svoje stránky skrášliť pomocou CSS.

Pripravená na ďalšiu kapitolu?! :)