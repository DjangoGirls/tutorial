# CSS - mach es hübsch!

Unser Blog sieht immer noch ziemlich unfertig aus, oder? Zeit, das zu ändern! Dafür nutzen wir CSS.

## Was ist CSS?

Cascading Style Sheets (CSS) ist eine Sprache, die das Aussehen und die Formatierung einer Website beschreibt. Es handelt sich wie bei HTML um eine Auszeichnungssprache (Markup Language). Sie ist sowas wie das "Make-up" unserer Website. ;)

Aber wir wollen nicht nochmal bei Null anfangen, oder? Einmal mehr werden wir etwas verwenden, dass ProgrammiererInnen entwickelt haben und gratis im Internet zur Verfügung stellen. Wir wollen ja nicht das Rad neu erfinden.

## Lass uns Bootstrap verwenden!

Bootstrap ist eines der bekanntesten HTML- und CSS-Frameworks für die Entwicklung von schönen Webseiten: https://getbootstrap.com/

Es wurde ursprünglich von ProgrammiererInnen bei Twitter geschrieben. Heute wird es von Freiwilligen aus der ganzen Welt weiterentwickelt!

## Bootstrap installieren

Um Bootstrap zu installieren, musst du Folgendes in den `<head>` deiner `.html`-Datei einfügen:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Dies fügt deinem Projekt keine Dateien hinzu. Es verweist nur auf Dateien, die im Internet vorhanden sind. Öffne und aktualisiere deine Webseite. Da ist sie!

![Abbildung 14.1](images/bootstrap1.png)

Sie sieht jetzt schon viel schöner aus!

## Statische Dateien in Django

Schlussendlich werden wir einen genaueren Blick auf die Dinge werfen, die wir bisher **statische Dateien** genannt haben. Statische Dateien sind alle deine CSS- und Bilddateien. Ihr Inhalt hängt nicht vom Requestkontext ab, sondern gilt für alle Benutzer gleichermassen.

### Wohin kommen die statischen Dateien für Django

Django weiss schon wo die statischen Dateien für die integrierte "admin" App zu finden sind. Wir müssen nur noch die statischen Dateien für unsere `blog` App hinzufügen.

Dies tun wir, indem wir einen Ordner namens `static` in der Blog-App erstellen:

    djangogirls 
    ├── blog 
    │ ├── migrations 
    │ ├── static 
    │ └── templates 
    └── mysite
    

Django findet automatisch alle Ordner mit dem Namen "static" in allen unserer App-Ordner. So ist es in der Lage, ihre Inhalte als statische Dateien zu nutzen.

## Deine erste CSS-Datei!

Erstellen wir nun eine CSS-Datei, um deiner Website deinen eigenen Stil zu verleihen. Erstelle ein neues Verzeichnis namens `css` in deinem `static`-Verzeichnis. Dann erstelle eine neue Datei namens `blog.css` in diesem `css`-Verzeichnis. Fertig?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Zeit, ein wenig CSS zu schreiben! Öffne die `blog/static/css/blog.css` Datei in Deinem Code-Editor.

Wir gehen nicht zu sehr auf die Details von CSS ein. Für diejenigen, die mehr über CSS lernen möchten, haben wir am Ende des Kapitels einen Link auf eine Empfehlung für einen kostenlosen CSS-Kurs angefügt.

Aber lass uns wenigstens etwas Kleines probieren. Beispielsweise könnten wir die Farbe unserer Kopfzeile ändern. Computer benutzen spezielle Codes, um Farben zu verstehen. Diese Codes starten immer mit `#`, danach folgen sechs Buchstaben (A-F) und Zahlen (0-9). Blau zum Beispiel ist `#0000FF`. Beispiele für solche Farbcodes findest Du hier: http://www.colorpicker.com/. Du kannst auch [vordefinierte Farben](http://www.w3schools.com/colors/colors_names.asp) wie `red` und `green` benutzen.

In deiner `blog/static/css/blog.css` Datei änderst du den folgenden Code:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
  color: #FCA205;
}
```

`h1 a` ist ein CSS-Selektor. Das bedeutet, dass wir unsere Styles auf alle `a` Elemente innerhalb von einem `h1` Element anwenden. Wenn wir also etwas haben wie: `<h1><a href="">link</a></h1>` wird der `h1 a` Style angewendet. In diesem Fall sagen wir, dass die Farbe in `#FCA205` geändert werden soll, was für Orange steht. Du kannst hier natürlich deine eigene Farbe angeben!

In einer CSS-Datei werden Stile für Elemente der HTML-Datei festgelegt. Ein Weg, HTML-Elemente zu identifizieren, ist der Name des Elements. Du erinnerst dich vielleicht an diese Namen, die wir als 'Tags' im HTML Kapitel bezeichnet haben. Zum Beispiel sind `a`, `h1` und `body` solche Elementnamen. Wir identifizieren Elemente auch über die Attribute `class` oder `id`. Klassen (`class`) und IDs (`id`) sind Namen, die du den Elementen selbst gibst. Klassen definieren dabei Gruppen von Elementen und IDs verweisen auf bestimmte Elemente. Du könntest zum Beispiel den folgenden Tag anhand des Elementnamens `a`, der Klasse `external_link` oder der ID `link_to_wiki_page` identifizieren:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

[Auf w3schools](http://www.w3schools.com/cssref/css_selectors.asp) erfährst du mehr über CSS-Selektoren.

Wir müssen der HTML-Vorlage noch sagen, dass wir CSS eingefügt haben. Öffne die Datei `blog/templates/blog/post_list.html` und füge diese Zeile ganz oben ein:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Wir laden hier die statischen Dateien. :) Füge zwischen den Tags `<head>` und `</head>`, direkt nach den Links zu den Bootstrap-Dateien, noch diese Zeile ein:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Der Browser liest die Dateien in der Reihenfolge, in der sie aufgeschrieben wurden. Darum müssen wir sicherstellen, dass die Zeile am richtigen Ort steht. Sonst könnte der Code der Bootstrap-Dateien den Code aus unserer Datei überschreiben. Wir haben also unserem Template gerade gesagt, wo sich die CSS-Datei befindet.

Deine Datei sollte jetzt so aussehen:

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
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, speichere die Datei und lade die Seite neu!

![Abbildung 14.2](images/color2.png)

Gut gemacht! Vielleicht wollen wir unserer Webseite etwas mehr Luft geben, indem wir den Abstand auf der linken Seite vergrößern? Probieren wir es aus!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Füge dies zu deinem CSS hinzu, speichere die Datei und schau dir an, was passiert.

![Abbildung 14.3](images/margin2.png)

Vielleicht können wir auch die Schrift in unserem HTML-Kopf anpassen? Füge dies zu `<head>` in `blog/templates/blog/post_list.html` hinzu:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Wie eben bereits gemacht, prüfe die Reihenfolge und platziere die Anweisung vor dem Link `blog/static/css/blog.css`. Sie importiert einen Font (Zeichensatz) mit Namen *Lobster* von Google Fonts (https://www.google.com/fonts).

Suche den Anweisungsblock: `h1 a` (der Code zwischen den geschweiften Klammern `{` und `}`) in der CSS Datei `blog/static/css/blog.css`. Nun füge die Zeile `font-family: 'Lobster';` zwischen den geschweiften Klammern hinzu und aktualisiere die Seite:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Abbildung 14.3](images/font.png)

Super!

Wie oben erwähnt, basiert CSS auf dem Konzept von Klassen. Dies erlaubt dir, einen Teil des HTML Codes mit einem Namen zu versehen und nur für diesen Teil einen Style hinzuzufügen, ganz ohne Auswirkungen auf andere Teile des Codes. Das kann sehr hilfreich sein! Eventuell hast Du zwei 'div's die etwas vollkommen Verschiedenes auszeichnen (wie einen Seitentitel oder Post Beitrag). Die Klasse hilft dir, sie unterschiedlich aussehen zu lassen.

Im nächsten Schritt werden wir den HTML-Code einteilen. Füge eine Klasse (class) namens `page-header` dem `div` hinzu, der die Kopfzeilen (header) enthalten soll:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Jetzt fügen wir dem `div` für den Blog-Inhalt (Post) noch eine Klasse `post` hinzu.

{% filename %}blog/templates/blog/post_list{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Wir erweitern jetzt unser CSS mit entsprechenden Selektoren. Selektoren, die mit `.` anfangen, beziehen sich auf Klassen im HTML. Es gibt im Internet viele gute Tutorials, die dir CSS weiter erläutern und helfen können, den folgenden Code besser zu verstehen. Für den Anfang reicht es aus, folgenden Text in deine `blog/static/css/blog.css`-Datei zu kopieren:

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

Der HTML-Code, der für die Anzeige der Blogposts verantwortlich ist, soll durch Klassen erweitert werden. Ersetze den folgenden Code:

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

in `blog/templates/blog/post_list.html` durch diesen:

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

Speichere die geänderten Dateien und aktualisiere die Webseite.

![Abbildung 14.4](images/final.png)

Juhuu! Sieht super aus, oder? Schau dir den Code an, den wir gerade eingefügt haben. Da siehst du, wo wir überall Klassen zu den HTML Objekten hinzugefügt haben, um sie in CSS zu referenzieren. Wo würdest du eine Änderung machen, um das Datum in Türkis anzuzeigen?

Hab keine Angst, etwas mit dieser CSS Datei herumzuspielen und versuche, ein paar Dinge zu ändern. Mit CSS herumzuspielen, kann dir helfen zu verstehen, was die verschiedenen Dinge genau machen. Mach dir keine Sorgen, wenn etwas kaputt geht, du kannst deine Änderungen immer rückgängig machen!

Wir empfehlen diesen kostenlosen [Codeacademy HTML & CSS Kurs](https://www.codecademy.com/tracks/web). Er wird dir helfen, deine Webseiten mit CSS schöner zu gestalten.

Bereit für das nächste Kapitel? :)