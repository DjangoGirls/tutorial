# CSS - gör det tjusigt!

Vår blogg är fortfarande ganska ful, eller hur? Dags att göra den snygg! Vi kommer använda CSS för det.

## Vad är CSS?

Cascading Style Sheets (CSS) är ett språk som används för att beskriva utseende och format av en webbsida skriven i ett märkspråk (som HTML). Tänk dig sminkning för vår webbsida. ;)

Men vi vill inte börja helt från början, eller hur? Än en gång använder vi något som programmerare gjort tillgängligt på Internet, helt gratis. Att återuppfinna hjulet är ju inte så roligt.

## Låt oss använda Bootstrap!

Bootstrap är ett av de mest populära HTML- och CSS-ramverken för att bygga snygga webbsidor: https://getbootstrap.com/

Det skapades av programmerare som arbetade på Twitter och utvecklas nu av frivilliga från hela världen!

## Installera Bootstrap

För att installera Bootstrap, öppna din `.html`-fil i kod-editorn och lägg till detta i sektion `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Detta lägger inte till några filer i ditt projekt. Det bara pekar på filer som finns på Internet. Öppna nu webbsidan och ladda om sidan. Här är den!

![Figur 14.1](images/bootstrap1.png)

Det ser redan bättre ut!

## Statiska filer i Django

Vi ska äntligen ta en närmare titt på dessa saker vi kallat **statiska filer**. Statiska filer är alla dina CSS- och bildfiler. Deras innehåll beror inte på klientens förfrågan och kommer att vara lika för alla användare.

### Var ska vi lägga statiska filer för Django?

Django vet redan var den ska hitta statiska filer för den inbyggda "admin"-appen. Nu behöver vi bara lägga till några statiska filer för vår egen app, `blog`.

Vi gör det genom att skapa en mapp kallad `static` i vår blogg-app:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django kommer automatiskt hitta alla mappar kallade "static" i någon av dina app-mappar, och kommer kunna använda dess innehåll som statiska filer.

## Din första CSS-fil!

Nu ska vi skapa en CSS-fil, för att lägga till din egen stil till din webbsida. Skapa en ny mapp kallad `css` i din `static`-mapp. Skapa sen en ny fil som du kallar `blog.css` inne i `css`-mappen. Redo?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Dags att skriva lite CSS! Öppna upp filen `blog/static/css/blog.css` i din kod-editor.

Vi kommer inte gå djupare in på att skräddarsy och lära oss CSS här. Det finns en rekommendation för en gratis CSS kurs på slutet av denna sida om du är sugen på att lära dig mer.

Men låt oss ändra åtminstone lite grann. Vi kanske kan ändra färgen på rubriken? För att förstå färger använder datorer speciella koder. De börjar med `#` följt av 6 bokstäver (A-F) och siffror (0-9). Till exempel är koden för blå `#0000FF`. Du kan hitta exempel på färgkoder här: http://www.colorpicker.com/. Du kan också använda [fördefinierade färger](http://www.w3schools.com/colors/colors_names.asp), som `red` och `green`.

Lägg till följande i filen `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` är en CSS Selektor. Det innebär att vi tillämpar våra stilar på alla `a`-element inom ett `h1`-element; `h2 a` selektoren gör samma sak för `h2`-elementen. Så när vi har något i stil med `<h1><a href="">länk</a></h1>`, kommer `h1 a`-stilen gälla. I detta fall säger vi åt den att ändra sin färg till `#C25100`, vilket är mörk orange. Eller så kan du lägga din egen färg här, men se till att den har god kontrast mot en vit bakgrund!

I en CSS-fil bestämmer vi stilar för element i HTML-filen. Det första sättet vi identifierar element är med elementnamnet. Du kanske minns dessa som taggar från HTML-avsnittet. Saker som `a`, `h1` och `body` är alla exempel på elementnamn. Vi identifierar även element genom attributet `class` eller attributet `id`. Class och id är namn du själv ger elementet. Class definierar grupper av element, medan id pekar på specifika element. Till exempel, följande tagg kan identifieras i CSS genom dess elementnamn `a`, dess class-attribut `external_link` eller genom dess id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Du kan läsa mer om [CSS Selektorer hos w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Vi behöver också berätta för vår HTML-mall att vi har lagt till lite CSS. Öppna filen `blog/templates/blog/post_list.html` och lägg till denna rad i början:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Vi laddar bara in statiska filer här. :) Mellan `<head>` och `</head>` taggarna, efter länkarna till Bootstraps CSS-filer, lägg till följande rad:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Webbläsaren läser filerna i den ordning som de anges, så vi behöver se till att dessa är på rätt plats. Annars kanske koden i vår fil skrivs över av kod i Bootstrap-filerna. Vi berättade just för vår mall var CSS-filen finns.

Filen ska nu se ut såhär:

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

OK, spara filen och ladda om sidan!

![Figur 14.2](images/color2.png)

Bra jobbat! Kanske skulle vi också vilja ge vår webbsida lite mer luft och öka marginalen på vänstersidan? Låt oss prova!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Lägg till detta i CSS-filen, spara filen och se hur det ändras!

![Figur 14.3](images/margin2.png)

Vi kanske kan anpassa typsnittet i rubriken? Kopiera detta till `<head>` i filen `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Som tidigare, kontrollera ordningen och placera den nya länken ovanför `blog/static/css/blog.css`. Denna rad kommer att importera ett teckensnitt kallat *Lobster* från Google Fonts (https://www.google.com/fonts).

Hitta deklarationsblocket till `h1 a` (koden mellan klammerparenteserna `{` och `}`) i CSS-filen `blog/static/css/blog.css`. Lägga nu till raden `font-family: 'Lobster';` mellan klammerparenteserna och uppdatera sidan:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figur 14.3](images/font.png)

Toppen!

Som tidigare nämnt har CSS ett koncept av klasser. Dessa tillåter dig att namnge en del av HTML-koden och använda formatmallar till enbart denna del, utan att det påverkar andra delar. Detta kan vara väldigt användbart! Kanske har du två div-taggar som gör något specifikt (som din rubrik och ditt inlägg). En klass kan hjälpa dig att få dem att se annorlunda ut.

Nu kan vi börja namnge delar av vår HTML. Lägg till en klass `page-header` till den `div` som innehåller din header, såhär:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Och lägg till klassen `post` till den `div` som innehåller en blogg-post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Vi kommer nu lägga till deklarations-block till olika selektorer. Selektorer som börjar med `.` avser klasser. Det finns mängder av bra guider och förklaringar om CSS på webben som kan hjälpa dig förstå följande kod. Men för stunden, kopiera den bara till filen `blog/static/css/blog.css`:

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

Sen omger vi HTML-koden som visar inlägg med deklarationer av klasser. Ersätt detta:

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

i filen `blog/templates/blog/post_list.html` med detta:

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

Spara filerna och ladda om sidan.

![Figur 14.4](images/final.png)

Hurra! Ser snyggt ut, eller hur? Titta på den kod som vi just klistrade in och hitta de platser där vi lagt till klasser i HTML och som vi använde i CSS-filen. Var skulle du göra ändringen om du vill att datumet ska vara turkos?

Var inte rädd för att experimentera med CSS och ändra utseendet på saker. Att leka runt med CSS kan hjälpa dig att förstå vad de olika sakerna gör. Om du har sönder något, ingen fara - du kan alltid ångra ändringarna!

Vi rekommenderar starkt att du läser de kostnadsfria onlinekurserna "Basic HTML & HTML5" och "Basic CSS" på [freeCodeCamp](https://learn.freecodecamp.org/). De kan lära dig allt om att göra dina webbplatser snyggare med HTML och CSS.

Redo för nästa kapitel?! :)