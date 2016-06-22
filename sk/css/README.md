# CSS - skrášli to!

Náš blog vyzerá zatiaľ dosť škaredo, však? Je čas to napraviť! Použijeme na to CSS.

## Čo je CSS?

Kaskádové štýly (CSS, angl. Cascading Style Sheets) je jazyk, ktorý sa používa na popis vzhľadu a formátovania webstránky napísanej v značkovacom jazyku (napríklad HTML). Predstav si to ako make-up pre našu webstránku :).

Ale asi nechceme začať úplne od nuly, však? Znova použijeme niečo, čo už bolo vytvorené programátormi a sprístupnené na internete zadarmo. Veď vieš, znovuobjavovanie kolesa nie je žiadna zábava.

## Používajme Bootstrap!

Bootstrap je jedným z najpopulárnejších HTML a CSS frameworkov pre vývoj krásnych webových stránok: https://getbootstrap.com/

Bol napísaný programátormi, ktorí pracovali pre Twitter a ďalej ho vyvíjajú dobrovoľníci z celého sveta.

## Inštalácia Bootstrapu

Na inštaláciu Bootstrapu musíš pridať do hlavičky `<head>` vo svojom `.html` súbore (`blog/templates/blog/post_list.html`) toto:

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Nepridá to do tvojho projektu žiadne súbory. Iba to ukazuje na súbory, ktoré už existujú na internete. Skúsme to, otvor svoju webstránku a obnov stránku. Tu to máme!

![Obrázok 14.1][1]

 [1]: images/bootstrap1.png

Už teraz vyzerá lepšie!

## Statické súbory v Djangu

Konečne sa pozrieme zblízka na veci, ktoré nazývame **statické súbory**. Sú to všetky tvoje CSS a obrázky -- súbory, ktoré nie sú dynamické, takže ich obsah nezávisí od kontextu požiadavky a budú rovnaké pre všetkých užívateľov.

### Kam umiestniť statické súbory pre Django

Ako si už videla, keď sme spustili `collectstatic` na serveri, Django už vie, kde má nájsť statické súbory pre vstavané "adminské" aplikácie. Teraz už musíme len pridať nejaké statické súbory pre našu vlastnú aplikáciu, `blog`.

To urobíme tak, že vo vnútri našej aplikácie blog vytvoríme adresár s názvom `static`:

```
djangogirls
├── blog
│   ├── migrations
│   └── static
└── mysite
```

Django automaticky nájde všetky priečinky s názvom "static" vo všetkých priečinkoch tvojich aplikácií a bude môcť používať ich obsah ako statické súbory.

## Tvoj prvý CSS súbor!

Vytvorme teraz CSS súbor, ktorý tvojej web stránke pridá vlastný štýl. Vytvor nový adresár s názvom `css` vnútri adresára `static`. Potom vytvor nový súbor s názvom `blog.css` vo vnútri tohto adresára `css`. Pripravená?

```
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
```

Je čas napísať nejaké CSS! Otvor v editore kódu súbor `blog/static/css/blog.css`.

Nepôjdeme príliš do hĺbky ohľadne prispôsobovania web stránky a učenia sa CSS, pretože je to celkom jednoduché a môžeš sa to naučiť sama po tomto workshope. Odporúčame ti urobiť si [kurz Codeacademy HTML & CSS][2], tam sa dozvieš všetko, čo potrebuješ vedieť, aby bola tvoja webstránka vďaka CSS krajšia.

 [2]: https://www.codecademy.com/tracks/web

Ale urobme aspoň niečo. Čo keby sme zmenili farbu hlavičky? Počítače používajú špeciálne kódy, aby rozumeli farbám. Začínajú `#`, potom nasleduje 6 písmen (A-F) a číslic (0-9). Kódy farieb nájdeš napríklad tu: http://www.colorpicker.com/. Môžeš tiež použiť [preddefinované farby][3] ako napríklad `red` (červená) alebo `green` (zelená).

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

V súbore `blog/static/css/blog.css` pridaj nasledujúci kód:

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` je CSS Selector. To znamená, že náš štýl aplikujeme na akýkoľvek element `a` vo vnútri elementu `h1` (napríklad ak máme v kóde niečo takéto: `<h1><a href="">link</a></h1>`). V tomto prípade elementu hovoríme, aby zmenil svoju farbu na `#FCA205`, čo je oranžová. Samozrejme, sem môžeš zadať vlastnú farbu!

V CSS súbore definujeme štýly pre elementy v HTML súbore. Elementy sa identifikujú podľa svojho názvu (t. j. `a` `h1`, `body`), atribútom `class` (trieda) alebo atribútom `id`. Triedy a id sú názvy, ktorými nazveš elementy. Triedy definujú skupiny elementov a idy poukazujú na konkrétne elementy. Napríklad, nasledujúci tag môže byť identifikovaný v CSS pomocou tagu `a`, triedy `external_link` a idu `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Prečítaj si o [CSS selektoroch na w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Potom musíme povedať našej HTML šablóne, že sme pridali nejaké CSS. Otvor súbor `blog/templates/blog/post_list.html` a pridaj tento riadok na úplný začiatok:

```html
{% load staticfiles %}
```

Práve načítavame statické súbory :). Potom medzi `<head>` a `</head>`, po odkazoch na CSS súbory Bootstrapu pridaj nasledujúci riadok (prehliadač číta súbory v poradí, v akom sú zadané, takže kód v našom súbore môže prepísať už načítaný kód z Bootstrapu):

    html
    <link rel="stylesheet" href="{% static 'css/blog.css' %}">


Práve sme našej šablóne povedali, kde sa nachádza náš CSS súbor.

Súbor by mal teraz vyzerať asi takto:

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

![Obrázok 14.2][5]

 [5]: images/color2.png

Pekne! Možno by sme chceli dať našej webovej stránke trochu vzduchu. Zväčšíme okraj na ľavej strane? Skúsme si to!

```css
body {
    padding-left: 15px;
}
```

Pridaj to do svojho CSS, ulož súbor a pozri, ako to funguje!

![Obrázok 14.3][6]

 [6]: images/margin2.png

Mohli by sme trochu upraviť font v našej hlavičke, nie? Skopíruj toto do svojej hlavičky `<head>` v súbore `blog/templates/blog/post_list.html`:

```html
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Tento riadok naimportuje z Google fontov (https://www.google.com/fonts) font, ktorý sa volá *Lobster*.

Teraz pridaj riadok `font-rodina: 'Lobster';` do CSS súboru `blog/static/css/blog.css` vnútri deklarácie `h1 a` (to je ten kód medzi zátvorkami `{` a `}`) a obnov stránku:

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Obrázok 14.3][7]

 [7]: images/font.png

Super!

Ako sme už spomenuli vyššie, CSS má koncept tried, ktorými v podstate pomenuješ časť HTML kódu a aplikuješ štýly len na túto konkrétnu časť, bez vplyvu na ostatné časti. Je to super užitočné, ak máš dva div-y, z ktorých každý robí niečo úplne iné (napríklad hlavička a príspevok), takže nechceš, aby vyzerali rovnako.

Skús pomenovať niektoré časti HTML kódu. Pridaj triedu s názvom `page-header` do `div`u, ktorý obsahuje hlavičku, takto nejako:

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

A teraz pridaj triedu, `post` do `div`u, v ktorom je blog post.

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Teraz pridáme deklarácie rôznym selektorom. Selektory, ktoré začínajú `.` sa týkajú tried. Na webe je ohľadne CSS veľa skvelých tutorialov a vysvetlení, ktoré ti pomôžu pochopiť nasledujúci kód. Ale teraz len skopíruj a vlož nasledujúci kód do súboru `blog/static/css/blog.css`:

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

Teraz s deklaráciami tried obklop HTML kód, ktorý zobrazuje posty. Nahraď toto:

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

Ulož tieto súbory a obnov svoju web stránku.

![Obrázok 14.4][8]

 [8]: images/final.png

No paráda! Vyzerá to super, nie? Kód, ktorý sme práve vložili, fakt nie je veľmi ťažké pochopiť a väčšinu asi pochopíš už len tým, že ho prečítaš.

Neboj sa trochu pohrať s týmto CSS, skús niektoré veci zmeniť. Ak niečo pokazíš, nevadí, vždy sa môžeš vrátiť späť!

Mimochodom, naozaj odporúčame tento bezplatný on-line [kurz HTML & CSS Codeacademy ][2] ako domácu úlohu po skončení tohto workshopu, kde sa naučíš všetko, čo potrebuješ vedieť, aby boli tvoje webové stránky s CSS krajšie.

Pripravená na ďalšiu kapitolu?! :)
