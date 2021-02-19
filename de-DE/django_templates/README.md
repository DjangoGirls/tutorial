# Django-Templates

Es wird Zeit, ein paar Daten anzuzeigen! Django bringt dafür bereits ein paar sehr hilfreiche **Template-Tags** mit.

## Was sind Template-Tags?

Also, in HTML kann man nicht wirklich Python-Code schreiben, weil es der Browser nicht verstehen würde. Denn der kennt nur HTML. Wir wissen, dass HTML ziemlich statisch ist, während Python dynamischer ist.

Die **Django-Template-Tags** erlauben uns, Python-artige Dinge ins HTML zu bringen, so dass man einfach und schnell dynamische Websites erstellen kann. Super!

## Anzeigen des Post-List-Templates

Im vorangegangen Kapitel haben wir unserem Template in der `posts`-Variable eine Liste von Posts übergeben. Diese wollen wir jetzt in HTML anzeigen.

Um eine Variable in einem Django-Template darzustellen, nutzen wir doppelte, geschweifte Klammern mit dem Namen der Variable darin, so wie hier:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Versuche das in deinem `blog/templates/blog/post_list.html` Template. Öffne es in deinem Code-Editor und ersetze alles vom zweiten `<div>` bis zum dritten `</div>` mit `{{ posts }}`. Speichere die Datei und aktualisiere die Seite, um die Ergebnisse anzuzeigen.

![Abbildung 13.1](images/step1.png)

Wie du siehst, haben wir nun das:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Das heißt, Django versteht es als Liste von Objekten. Kannst du dich noch an die Einführung von Python erinnern, wie man Listen anzeigen kann? Ja, mit for-Schleifen! In einem Django-Template benutzt du sie so:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Versuch das in deinem Template.

![Abbildung 13.2](images/step2.png)

Es funktioniert! Aber wir wollen, dass die Posts so wie die statischen Posts angezeigt werden, die wir vorhin im **Einführung in HTML**-Kapitel erstellt haben. Du kannst HTML und Template Tags mischen. Unser `body` sollte dann so aussehen:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

{% raw %}Alles, was du zwischen `{% for %}`und `{% endfor %}` schreibst, wird für jedes Objekt in der Liste wiederholt. Aktualisiere deine Seite:{% endraw %}

![Abbildung 13.3](images/step3.png)

Ist dir aufgefallen, dass wir diesmal eine etwas andere Notation benutzen haben (`{{ post.title }}` oder `{{ post.text }}`)? Wir greifen auf Daten von jedem Feld unseres `Post`-Models zu. Außerdem leitet das `|linebreaksbr` den Text der Posts durch einen Filter, um Zeilenumbrüche in Absätze umzuwandeln.

## Und zum Schluss

Es wäre gut zu sehen, ob deine Website noch immer im öffentlichen Internet funktioniert, richtig? Lass uns versuchen, unsere Aktualisierungen wieder zu PythonAnywhere hochzuladen. Hier ist eine Zusammenfassung der Schritte…

* Schiebe zuerst deinen Code auf GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Dann logg dich wieder bei [PythonAnywhere](https://www.pythonanywhere.com/consoles/) ein, geh zu deiner **Bash-Konsole** (oder starte eine neue) und gib ein:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <deine-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Denk daran, `<deine-pythonanywhere-domain>` durch deine tatsächliche PythonAnywhere-Subdomain zu ersetzen - ohne die spitzen Klammern.)

* Spring anschließend rüber zur [Seite "Web"](https://www.pythonanywhere.com/web_app_setup/) und klick auf **Neu laden** in deinem Browser. (Um von der Konsolen-Seite aus zu anderen PythonAnywhere-Seiten zu gelangen, benutze den Menü-Knopf in der rechten oberen Ecke.) Ein Update sollte auf https://subdomain.pythonanywhere.com live sein -- guck's dir im Browser an! Wenn die Blogposts auf deiner PythonAnywhere-Seite anders sind als die auf deinem lokalen Server, ist das in Ordnung so. Die Datenbanken auf deinem lokalen Computer und auf PythonAnywhere werden nicht zusammen mit den restlichen Dateien abgeglichen.

Glückwunsch! Nun kannst du dich daran machen, neue Posts in deinem Django Admin zu erstellen (denk daran, auch ein published_date einzufügen!). Stell sicher, dass du im Django-Admin der PythonAnywhere-Seite https://subdomain.pythonanywhere.com/admin arbeitest. Dann aktualisiere die Seite und schau nach, ob die Posts dort erscheinen.

Funktioniert super? Wir sind so stolz auf dich! Steh kurz auf und geh ein Stück weg vom Computer. Du hast dir eine Pause verdient :)

![Abbildung 13.4](images/donut.png)