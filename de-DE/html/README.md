# Einführung in HTML

Vielleicht fragst du dich, was ein Template (Vorlage) ist?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Was ist HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML bedeutet "HyperText Markup Language". Als **HyperText** wird Text bezeichnet, der über markierte Textstellen, den "Hyperlinks" (die umgangssprachlichen "Links") auf andere (meist ebenfalls in HTML geschriebene) Seiten verweist. **Markup** bedeutet, dass wir ein Dokument nehmen und mit Code versehen, um einem Empfänger mitzuteilen (in diesem Fall dem Browser), wie diese Seite interpretiert werden muss. HTML-Code besteht aus **Tags**, wovon jeder mit `<` beginnt und mit `>` endet. Diese Tags stellen die Markup-**Elemente** dar.

## Dein erstes Template!

Ein Template zu erstellen, heißt, eine entsprechende Datei dafür zu erstellen. Alles ist eine Datei, wie du vielleicht schon bemerkt hast.

Templates werden im Verzeichnis `blog/templates/blog` gespeichert. Als Erstes erzeugen wir das Verzeichnis `templates` in deinem Blog-Verzeichnis. Im Template-Verzeichnis selbst erstellen wir ein weiteres Verzeichnis `blog`:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

Als nächstes erstellen wir eine Datei `post_list.html` (erst mal ohne Inhalt) innerhalb des Verzeichnisses `blog/templates/blog`.

Kontrolliere deine überarbeitete Webseite unter: http://127.0.0.1:8000

> Falls du die Fehlermeldung `TemplateDoesNotExist` angezeigt bekommst, versuche den Server neu zu starten. Auf der Kommandozeile drückst du Strg+C bzw. Ctrl+C (Strg-/Ctrl- und die C-Taste C zusammen) und startest danach den Server erneut mit dem Kommando `python manage.py runserver`.

![Abbildung 11.1](images/step1.png)

Der Fehler sollte weg sein! Toll :) Deine Webseite ist allerdings noch leer, weil dein Template leer ist. Das müssen wir ändern.

Füge folgenden Text in deine Template-Datei ein:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Hat sich die Seite geändert? Sieh nach: http://127.0.0.1:8000/

![Abbildung 11.2](images/step3.png)

Es funktioniert! Gute Arbeit! :)

* Jede Webseite sollte mit dem Tag `<html>` beginnen. Und `</html>` steht immer am Ende. Zwischen den beiden Tags `<html>` und `</html>` steht der gesamte Inhalt der Webseite
* `<p>` ist der Tag für ein Absatz-Element (paragraph), `</p>` beendet einen Absatz

## "Head" und "body"

Jede HTML-Seite gliedert sich in zwei Teile: **head** und **body**.

* Das Element **head** speichert im "Kopf" der Seite Informationen über die Seite, die dir nicht angezeigt werden.

* Das Element **body** enthält den "Körper" - also den dargestellten Inhalt der Seite.

Im `<head>` informieren wir den Browser über Einstellungen und Konfigurationen der Webseite, z.B. wie sie dargestellt werden soll, und im `<body>` darüber, was tatsächlich dargestellt werden soll.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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

Der Titel "Ola's blog" wird nun im Browser angezeigt. Hast du es bemerkt? Der Browser hat `<title>Ola's blog</title>` interpretiert und in die Titelleiste übernommen (dieser Titel wird auch in den Lesezeichen usw. verwendet).

Wie du vielleicht bemerkt hast, hat jedes Element zu Beginn einen öffnenden Tag und einen zugehörigen *schließenden Tag* mit `/` und die Elemente sind darin *eingebettet*. Ein Tag in einem zweiten kann nicht außerhalb von diesem geschlossen werden, die Reihenfolge muss immer stimmen.

Es ist wie Sachen in Kisten stecken. In die größte Box: `<html></html>` kommt eine kleinere Box: `<body></body>`, und dort wiederum packen wir viele kleine Kisten hinein: </code>`&lt;p&gt;&lt;/p&gt;</0>.</p>

<p>You need to follow these rules of <em>closing</em> tags, and of <em>nesting</em> elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.</p>

<h2>Dein Template anpassen</h2>

<p>Jetzt kannst du ein bisschen rumprobieren und dein Template umgestalten! Hier sind ein paar nützliche Tags dafür:</p>

<ul>
<li><code><h1>A heading</h1>` for your most important heading</li> 

* `<h2>Unter-Überschrift</h2>` die nächst tiefere Überschiftenebene
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>Text</em>` hebt deinen Text hervor
* `<strong>Text</strong>` macht deinen Text fett
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` erstellt einen Link
* `<ul><li>Erster Punkt</li><li>second item</li></ul>` generiert eine Liste so wie diese hier!
* `<div></div>` definiert einen Abschnitt auf einer Seite</ul> 

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Wir haben hier drei verschiedene `div` Abschnitte erstellt.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Wir bekommen das Folgende:

![Abbildung 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Noch eine Sache: Deployment!

Es wäre gut, das alles live draußen im Internet zu sehen, oder? Lass uns noch eine PythonAnywhere-Anwendung erstellen:

### Commit, and push your code up to GitHub

Lass uns nachsehen, welche Dateien sich nach dem letzten Veröffentlichen (Deployment) geändert haben. (Führe diese Befehle lokal aus und nicht auf PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Denk auch daran (Kapitel 3), dass `.` das aktuelle Verzeichnis meint.

Bevor wir alle Dateien hochladen prüfen wir noch einmal, was `git` hochladen will (alle Dateien, die `git` hochladen wird, sind jetzt grün):

{% filename %}command-line{% endfilename %}

    $ git status
    

Fast fertig, wir sagen nun noch, dass diese Änderung in der Verlaufsübersicht gespeichert werden soll. Wir erstellen eine "Commit Message", die beschreibt, was wir verändert haben. Du kannst an diesem Punkt hier alles reinschreiben, aber es ist sehr nützlich, etwas zu Sinnvolles einzutragen, damit du dich in Zukunft erinnern kannst, was du geändert hast.

{% filename %}command-line{% endfilename %}

    $ git commit -m "HTML der Site geändert."
    

> **Beachte:** Du musst Anführungszeichen um den Commit-Kommentar setzen.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Hol dir den neuen Code auf PythonAnywhere und aktualisiere deinen Browser

* Öffne die [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) und gehe zu deiner **Bash-Konsole** (oder starte eine neue). Dann, führe Folgendes aus:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **Files tab** and view your code on PythonAnywhere.

* Spring anschließend rüber zum [Web Tab](https://www.pythonanywhere.com/web_app_setup/) und klick auf **Neu laden** in deinem Browser.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)