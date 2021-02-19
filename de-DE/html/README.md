# Einführung in HTML

Vielleicht fragst du dich, was ein Template (Vorlage) ist?

Ein Template (zu deutsch "Vorlage") ist eine Textdatei und ermöglicht es uns, verschiedene Inhalte in einer einheitlichen Darstellung zu erzeugen. Eine Vorlage für z.B. einen Brief hilft uns, immer gleich aussehende Nachrichten zu versenden, in denen sich Empfänger, Betreff und Text jeweils ändern, das äußere Format jedoch bestehen bleibt.

Ein Django-Template wird mit einer Sprache namens HTML beschrieben. (Genau das HTML aus dem ersten Kapitel: **Wie das Internet funktioniert**).

## Was ist HTML?

HTML ist recht einfacher Code, der von deinem Browser – z.B. Chrome, Firefox oder Safari – interpretiert wird, um dem Benutzer eine Website darzustellen.

HTML steht für "HyperText Markup Language". Als **HyperText** wird Text bezeichnet, der über markierte Textstellen, den "Hyperlinks" (die umgangssprachlichen "Links"), auf andere (meist ebenfalls in HTML geschriebene) Seiten verweist. **Markup** bedeutet, dass wir ein Dokument nehmen und mit Code versehen, um einem Empfänger mitzuteilen (in diesem Fall dem Browser), wie diese Seite interpretiert werden muss. HTML-Code besteht aus **Tags**, wovon jeder mit `<` beginnt und mit `>` endet. Diese Tags stellen die Markup-**Elemente** dar.

## Dein erstes Template!

Ein Template zu erstellen, heißt, eine entsprechende Datei dafür zu erstellen. Alles ist eine Datei, wie du vielleicht schon bemerkt hast.

Templates werden im Verzeichnis `blog/templates/blog` gespeichert. Als Erstes erzeugen wir das Verzeichnis `templates` in deinem Blog-Verzeichnis. Im Template-Verzeichnis selbst erstellen wir ein weiteres Verzeichnis `blog`:

    blog
    └───templates
        └───blog
    

(Falls du dich wunderst, warum wir zwei `blog`-Verzeichnisse brauchen – das hängt mit den nützlichen Namenskonventionen von Django zusammen, die das Leben einfacher machen, wenn deine Projekte immer komplizierter und komplexer werden.)

Als nächstes erstellen wir eine Datei `post_list.html` (erst mal ohne Inhalt) innerhalb des Verzeichnisses `blog/templates/blog`.

Kontrolliere deine überarbeitete Webseite unter: http://127.0.0.1:8000

> Falls du die Fehlermeldung `TemplateDoesNotExist` angezeigt bekommst, versuche den Server neu zu starten. Auf der Kommandozeile drückst du dafür Strg+C bzw. Ctrl+C (Strg-/Ctrl- und die C-Taste C zusammen) und startest danach den Server erneut mit dem Kommando `python manage.py runserver`.

![Abbildung 11.1](images/step1.png)

Der Fehler sollte weg sein! Gratulation! :) Deine Webseite ist allerdings noch leer, weil dein Template leer ist. Das müssen wir ändern.

Öffne die neue Datei im Code-Editor, und füge Folgendes hinzu:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Hat sich die Seite geändert? Besuche http://127.0.0.1:8000/, um nachzusehen.

![Abbildung 11.2](images/step3.png)

Es funktioniert. Gute Arbeit! :)

* The line `<!DOCTYPE html>` is not a HTML tag. It only declares the document type. Here, it informs the browser that document type is [HTML5](https://html.spec.whatwg.org/#the-doctype). This is always the beginning of any HTML5 file.
* The most basic tag, `<html>`, is always the beginning of html content and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## "Head" und "body"

Jede HTML-Seite gliedert sich in zwei Teile: **head** und **body**.

* Das Element **head** speichert im "Kopf" der Seite Informationen über die Seite, die dir nicht angezeigt werden.

* Das Element **body** enthält den "Körper" - also den dargestellten Inhalt der Seite.

Im `<head>` informieren wir den Browser über Einstellungen und Konfigurationen der Webseite, z.B. wie sie dargestellt werden soll, und im `<body>` darüber, was tatsächlich dargestellt werden soll.

In den `<head>` können wir z.B. noch den Titel (title) der Seite mit aufnehmen:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Speichere die Datei und aktualisiere die Seite im Browser.

![Abbildung 11.3](images/step4.png)

Der Titel "Olas Blog" wird nun im Browser angezeigt. Hast du es bemerkt? Der Browser hat `<title>Olas Blog</title>` interpretiert und in die Titelleiste übernommen (dieser Titel wird auch in den Lesezeichen usw. verwendet).

Wie du vielleicht bemerkt hast, hat jedes Element zu Beginn einen öffnenden Tag und einen zugehörigen *schließenden Tag* mit `/` und innerhalb davon sind Elemente *eingebettet*. Ein innerer Tag kann nicht außerhalb des umschließenden Tags geschlossen werden, die Reihenfolge muss immer stimmen.

Es ist, wie wenn man Sachen in Kisten steckt. Du hast eine große Kiste, `<html></html>`. In der ist als weitere, etwas kleinere Kiste `<body></body>` drin, und in der wiederum weitere kleine Kistchen: `<p></p>`.

Die Regeln und Reihenfolgen von *schließenden* Tags und *Verschachtelung* der Elemente musst du immer einhalten. Anderenfalls können Browser die Seite nicht richtig interpretieren und darstellen.

## Dein Template anpassen

Jetzt kannst du ein bisschen rumprobieren und dein Template umgestalten! Hier sind ein paar nützliche Tags dafür:

* `<h1>Überschrift</h1>` (headline) für wichtigste Überschriften
* `<h2>Unter-Überschrift</h2>` die nächst tiefere Überschiftenebene
* `<h3>Unter-Unter-Überschrift</h3>` ... und so weiter bis `<h6>`
* `<p>Ein Fliesstext-Absatz</p>`
* `<em>Text</em>` hebt deinen Text hervor
* `<strong>Text</strong>` hebt deinen Text stark hervor
* `<br>` fängt eine neue Zeile an (du kannst nichts in das br schreiben und es gibt keinen schließenden Tag)
* `<a href="https://djangogirls.org">link</a>` erstellt einen Link
* `<ul><li>Erster Punkt</li><li>second item</li></ul>` generiert eine Liste so wie diese hier!
* `<div></div>` definiert einen Abschnitt auf einer Seite
* `<nav></nav>` defines a set of navigation links
* `<article></article>` specifies independent, self-contained content
* `<section></section>` defines a section in a document
* `<header></header>` specifies a header for a document or section
* `<main></main>` specifies the main content of a document
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer></footer>` defines a footer for a document or section
* `<time></time>` defines a specific time (or datetime)

Hier ist ein vollständiges Beispiel eines Templates. Kopiere es und füge es in `blog/templates/blog/post_list.html` ein:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

We've created one `header` section and two `article` section here.

* The `header` element contains the title of our blog – it's a heading and a link
* Another two `article` elements contain our blog posts with a published date in `time` element, `h2` with a post title that is clickable and a `p` (paragraph) of text for our blog post.

Wir bekommen das Folgende:

![Abbildung 11.4](images/step6.png)

Yaaay! Bis jetzt zeigt unser Template aber immer genau die **gleichen Inhalte** – obwohl wir aber vorhin davon gesprochen haben, dass Templates uns erlauben, **verschiedene** Informationen im **gleichen Format** darzustellen.

Eigentlich wollen wir richtige Posts anzeigen, die in unserer Django-Admin-Oberfläche hinzugefügt wurden – und das wollen wir als Nächstes tun.

## Noch eine Sache: Deployment!

Es wäre gut, das alles live draußen im Internet zu sehen, oder? Lass uns noch eine PythonAnywhere-Anwendung erstellen:

### Committe und pushe deinen Code auf GitHub

Lass uns nachsehen, welche Dateien sich nach dem letzten Veröffentlichen (Deployment) geändert haben. (Führe diese Befehle lokal aus und nicht auf PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Stelle sicher, dass du im `Djangogirls` Verzeichnis bist und sag `git`, dass alle Änderungen in diesem Verzeichnis hinzugefügt werden sollen:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Bevor wir alle Dateien hochladen, prüfen wir noch einmal, was `git` hochladen will (alle Dateien, die `git` hochladen wird, sind jetzt grün):

{% filename %}command-line{% endfilename %}

    $ git status
    

Fast fertig, wir sagen nun noch, dass diese Änderung in der Verlaufsübersicht gespeichert werden soll. Wir erstellen eine "Commit Message", die beschreibt, was wir verändert haben. Du kannst an diesem Punkt hier alles reinschreiben, aber es ist sehr nützlich, etwas Sinnvolles einzutragen, damit du dich in Zukunft erinnern kannst, was du geändert hast.

{% filename %}command-line{% endfilename %}

    $ git commit -m "HTML der Site geändert."
    

> **Beachte:** Du musst Anführungszeichen um den Commit-Kommentar setzen.

Nachdem wir das gemacht haben, laden (push) wir unsere Änderungen auf GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Hol dir den neuen Code auf PythonAnywhere und aktualisiere deinen Browser

* Öffne die [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) und gehe zu deiner **Bash-Konsole** (oder starte eine neue). Dann, führe Folgendes aus:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<deine-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Du musst `<deine-pythonanywhere-domain>` durch deine tatsächliche PythonAnywhere-Subdomain zu ersetzen - ohne die spitzen Klammern. Normalerweise ist deine Subdomain dein PythonAnywhere-Benutzername, aber in manchen Fällen ist sie leicht anders (z.B. wenn dein Benutzername Großbuchstaben enthält). Wenn dieser Befehl also nicht funktioniert, verwende den Befehl `ls` (listet Dateien auf), um den tatsächlichen Subdomain-/Ordner-Name herauszufinden, und verwende dann `cd`, um dorthin zu wechseln.

Nun sieh zu, wie dein Code heruntergeladen wird. Wenn du überprüfen willst, dass er angekommen ist, geh' hinüber zur **Seite "Files"** and schau deinen Code auf PythonAnywhere an (du kannst andere PythonAnywhere-Seiten über den Menü-Knopf auf der Konsolen-Seite erreichen).

* Spring anschließend rüber zur [Seite "Web"](https://www.pythonanywhere.com/web_app_setup/) und klick auf **Neu laden** in deinem Browser.

Dein Update sollte live sein! Lade die Seite neu in deinem Browser. Es sollten nun Änderungen zu sehen sein. :)