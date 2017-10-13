# CSS - mach es hübsch!

Unser Blog sieht immer noch ziemlich unfertig aus, oder? Zeit, das zu ändern! Dafür nutzen wir CSS.

## Was ist CSS?

Cascading Style Sheets (CSS) ist eine Sprache, die das Aussehen und die Formatierung einer Website beschreibt. Es handelt sich wie bei HTML um eine Auszeichnungssprache (Markup Language). Sie ist sowas wie das "Make-up" unserer Website ;).

Aber wir wollen nicht wieder von vorne anfangen, nicht wahr? Ein weiteres Mal werden wir von dem profitieren, was andere Programmiererinnen vor uns erstellt und im Internet veröffentlicht haben. Das Rad neu zu erfinden, macht ja keinen Spaß.

## Lass uns Bootstrap verwenden!

Bootstrap ist eines der bekanntesten HTML- und CSS-Frameworks für die Entwicklung von schönen Websites: http://getbootstrap.com/

Bootstrap hat seinen Ursprung im Umfeld von Twitter und wird heute von Freiwilligen weltweit weiterentwickelt.

## Bootstrap installieren

Um Bootstrap zu installieren, musst du das Folgende in den `<head>`-Bereich in deiner `HTML`-Datei einfügen (`blog/templates/blog/post_list.html`):

```html 
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> 
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Dies fügt deinem Projekt keine Dateien hinzu. Es verweist nur auf Dateien, die im Internet vorhanden sind. Öffne und aktualisiere deine Webseite. Da ist sie!

![Abbildung 14.1](images/bootstrap1.png)

Sie sieht jetzt schon viel schöner aus!

## Statische Dateien in Django

Schlussendlich werden wir einen genaueren Blick auf die Dinge werfen, die wir bisher **statische Dateien** genannt haben. Statische Dateien sind Bilder und dein CSS-Code. Diese Dateien sind nicht dynamisch, sie reagieren nicht auf Anfragen auf der Nutzerseite und sehen für jeden gleich aus.

### Wohin kommen die statischen Dateien für Django

Wie du gesehen hast, als wir `collectstatic` auf dem Server ausgeführt haben, weiß Django bereits, wo die statischen Dateien für die eingebaute `admin`-App zu finden sind. Nun müssen wir nur ein paar statische Dateien für unsere eigene App, `blog`, hinzufügen.

Dies tun wir, indem wir einen Ordner namens `static` in der Blog-App erstellen:

```
djangogirls
├── blog
│   ├── migrations
│   ├── static
│   └── templates
└── mysite
```

Django findet automatisch alle Ordner mit dem Namen "static" in allen Ordnern unserer Apps und ist in der Lage, ihre Inhalte als statische Dateien zu nutzen.

## Deine erste CSS-Datei!

Nun erstellen wir eine CSS-Datei, um deiner Website deinen eigenen Stil zu verleihen. Erstelle ein neues Verzeichnis namens `css` in deinem `static`-Verzeichnis. Dann erstelle eine neue Datei namens `blog.css` in diesem `css`-Verzeichnis. Fertig?

```
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
```

Zeit, ein wenig CSS zu schreiben! Öffne die `blog/static/css/blog.css` Datei in einem Code-Editor.

Wir werden an dieser Stelle nicht weiter auf das Anpassen und Erlernen von CSS eingehen, weil es ziemlich einfach ist und du es nach dem Workshop selbst erlernen kannst. Wir empfehlen diesen [Codeacademy HTML- & CSS-Kurs](http://www.codecademy.com/tracks/web), um alles zu erlernen, was du wissen musst, um deine Website mit CSS noch hübscher zu machen.

Aber lass uns wenigstens etwas Kleines probieren. Beispielsweise könnten wir die Farbe unserer Kopfzeile ändern. Computer benutzen spezielle Codes, um Farben zu verstehen. Ein solcher (hexadezimal) Code beginnt mit einer `#`, gefolgt von 6 Buchstaben (A-F) und Zahlen (0-9). Beispiele für solche Farbcodes findest du hier: http://www.colorpicker.com/. Du kannst auch [vordefinierte Farben](http://www.w3schools.com/cssref/css_colornames.asp) wie `red` und `green` benutzen.

In deiner `blog/static/css/blog.css` Datei änderst du den folgenden Code:

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` ist ein CSS-Selektor. Das bedeutet, dass wir jedem `a`-Element innerhalb eines `h1`-Elements unsere Stilvorgaben zuordnen (z. B. wenn wir in unserem Code so etwas wie `<h1><a href="">link</a></h1>` haben). In diesem Fall sagen wir, dass es seine Farbe in `#FCA205` ändern soll, was für Orange steht. Du kannst hier natürlich deine eigene Farbe angeben!

In einer CSS-Datei werden Stile für Elemente der HTML-Datei festgelegt. Die Elemente werden durch den Elementnamen (in der Regel `a`, `h1`, `body`), das Attribut `class` oder das Attribut `id` bestimmt. Klassen (`class`) und IDs (`id`) sind Namen, die du den Elementen selbst gibst. Klassen definieren dabei Gruppen von Elementen und IDs verweisen auf bestimmte Elemente. Beispielsweise kann das folgende HTML-Tag von CSS mittels des Tag-Namens `a`, der Klasse `external_link` oder der ID `link_to_wiki_page` identifiziert werden:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```    

[Auf w3schools](http://www.w3schools.com/cssref/css_selectors.asp) erfährst du mehr über CSS-Selektoren.

Dann musst du auch deiner HTML-Vorlage sagen, dass wir CSS aus einer externen Datei laden wollen. Öffne dazu die Datei `blog/templates/blog/post_list.html` und füge folgende Zeile ganz am Anfang der Datei an:

```html
{% load staticfiles %}
```

Hier laden wir nur statische Dateien :). Dann fügst du zwischen `<head>` und `</head>`, nach dem Link auf die Bootstrap-CSS-Dateien die folgenden Zeilen an (Der Browser liest die Dateien in der Reihenfolge, wie sie angegeben sind, ein, so dass dein CSS möglicherweise den Code in den Bootstrap-Dateien überschreibt.):

```html 
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Wir haben unserer Vorlage gerade gesagt, wo sich die CSS-Datei befindet.

Deine Datei sollte jetzt so aussehen:

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

OK, speicher die Datei und lade die Seite neu!

![Abbildung 14.2](images/color2.png)

Gut gemacht! Vielleicht wollen wir unserer Webseite etwas mehr Luft geben, indem wir den Abstand auf der linken Seite vergrößern? Probieren wir es aus!

```css
body {     
    padding-left: 15px; 
}
```

Füge dies zu deinem CSS hinzu, speicher die Datei und guck dir die Veränderung an!

![Abbildung 14.3](images/margin2.png)

Vielleicht können wir auch die Schrift in unserem HTML-Kopf anpassen? Füge dies zu `<head>` in `blog/templates/blog/post_list.html` hinzu:

```html 
<link href="http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Diese Zeile importiert die Schriftart *Lobster* von Google Fonts (https://www.google.com/fonts).

Nun füge die Zeile `font-family: 'Lobster';` in die CSS-Datei `blog/static/css/blog.css` ein. Sie gehört in den `h1 a` Deklaration-Block (der Code zwischen den Klammern `{` und `}`) und lade die Seite neu:

```css
h1 a {
    color: #FCA204;
    font-family: 'Lobster';
}
```

![Abbildung 14.3](images/font.png)

Super!

CSS hat - wie schon gesagt - ein Klassen-Konzept. Das erlaubt dir, Teile des HTML-Codes mit Namen zu versehen und die Stile (Styles) nur auf diese Teile anzuwenden. Die anderen Teile bleiben davon unberührt. Das ist sehr hilfreich, wenn du z.B. zwei div-Container hast, die ganz verschiedene Sachen bewirken sollen, einer für die Kopfzeile, einer für den Inhalt. Sie sollen dann ja nicht gleich aussehen.

Im nächsten Schritt werden wir den HTML-Code einteilen. Füge eine Klasse (class) names `page-header` dem `div` hinzu, der die Kopfzeilen (header) enthalten soll:

```html 
<div class="page-header">     
    <h1><a href="/">Django Girls Blog</a></h1> 
</div>
```
Jetzt fügen wir noch eine Klasse `post` für den Blog-Inhalt (Post) dem `div` hinzu.

```html 
<div class="post">     
    <p>published: {{ post.published_date }}</p>     
    <h1><a href="">{{ post.title }}</a></h1>     
    <p>{{ post.text|linebreaks }}</p> 
</div>
```

Gemäß der Änderungen im HTML erweitern wir unser CSS mit entsprechenden Selektoren. Selektoren, die mit `.` anfangen, beziehen sich auf Klassen im HTML. Wenn du dich weiter mit dem folgenden CSS-Code auseinandersetzen willst, helfen dir die zahlreichen Anleitungen im Internet weiter. Für den Anfang reicht es aus, folgenden Text in deine `blog/static/css/blog.css`-Datei zu kopieren:

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

Der HTML-Code, der für die Anzeige der Blogposts verantwortlich ist, soll durch Klassen erweitert werden. Ersetze den folgenden Code:

```html
{% for post in posts %}
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaks }}</p>
</div>
{% endfor %}
```

in `blog/templates/blog/post_list.html` durch diesen:

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
                <p>{{ post.text|linebreaks }}</p>
            </div>
        {% endfor %}
        </div>
    </div>
</div>
```

Speichere die geänderten Dateien und aktualisiere die Webseite.

![Abbildung 14.4](images/final.png)
 
Und?! Sieht viel besser aus, oder!? Der verwendete Code ist nicht allzu schwer zu verstehen. Wenn du ihn liest, sollte schon fast alles klar sein.

Ändere ruhig das eine oder andere im CSS und probiere ein paar Sachen aus. Geht etwas kaputt, mach deine Änderungen im Editor rückgängig und starte von vorn.

Wir empfehlen den freien Online-Kurs [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web) als Hausaufgabe. So kannst du alles lernen, was du über das Verschönern von Webseiten mit CSS wissen willst.

Bereit für das nächste Kapitel? :)
