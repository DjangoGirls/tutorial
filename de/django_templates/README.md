# Django Templates

Es wird Zeit, ein paar Daten anzuzeigen! Django bringt dafür bereits ein paar sehr hilfreiche **Template Tags** mit.

## Was sind Template Tags?

Also, in HTML kann man nicht wirklich Python-Code schreiben, weil es der Browser nicht verstehen würde. Er kennt nur HTML. Wir wissen, dass HTML, im Gegensatz zum dynamischeren Python, eher statisch ist.

Die **Django Template Tags** helfen dabei, Python-Dinge in HTML auszudrücken, so dass man einfach und schnell dynamische Websites erstellen kann. Super!

## Anzeigen des Post-List-Templates

Im vorangegangen Kapitel haben wir unserem Template in der `posts`-Variable eine Liste von Posts übergeben. Diese wollen wir jetzt in HTML anzeigen.

Um eine Variable in einem Django-Template darzustellen, nutzen wir doppelte, geschweifte Klammern mit dem Namen der Variable darin, so wie hier:

```html
{{ posts }}
```

Versuche dies in deinem `blog/templates/blog/post_list.html` Template. Ersetze alles vom zweiten `<div>` bis zum dritten `<div>` mit `{{ posts }}`. Speichere die Datei und aktualisiere die Seite, um die Ergebnisse anzuzeigen.

![Abbildung 13.1](images/step1.png)

Wie du siehst, haben wir nun das:

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Das heißt, Django versteht es als Liste von Objekten. Kannst du dich noch an die Einführung von Python erinnern, wie man Listen anzeigen kann? Ja, mit for-Schleifen! In einem Django-Template benutzt du sie so:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Versuch das in deinem Template.

![Abbildung 13.2](images/step2.png)

Es funktioniert! Aber wir wollen, dass die Posts so angezeigt werden, wie die statischen Posts, die wir vorhin im **Introduction to HTML** Kapitel erstellt haben. Du kannst HTML und Template Tags mischen. Unser `body` sollte dann so aussehen:

```html
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
```

{% raw %}Alles, was du zwischen `{% for %}`und `{% endfor %}` schreibst, wird für jedes Objekt in der Liste wiederholt. Aktualisiere deine Seite:{% endraw %}

![Abbildung 13.3](images/step3.png)

Ist dir aufgefallen, dass wir diesmal eine etwas andere Notation benutzen bei `{{ post.title }}` oder `{{ post.text }}`? Wir greifen auf Daten von jedem Feld unseres `Post`-Models zu. In den Posttexten konvertiert außerdem der `|linebreaks`-Befehl ("pipe") Zeilenumbrüche in Absätze.

## Und zum Schluss

Es wäre gut zu sehen, ob deine Website noch immer im öffentlichen Internet funktioniert, richtig? Lass uns versuchen, unsere Aktualisierungen wieder zu PythonAnywhere hochzuladen. Hier ist eine Zusammenfassung der Schritte...

* Schiebe zuerst deinen Code auf GitHub

```bash
$ git status
[...]
$ git add --all .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
```

* Dann logg dich wieder bei [PythonAnywhere](https://www.pythonanywhere.com/consoles/) ein und geh zu deiner **Bash-Konsole** (oder starte eine neue) und gib ein:

```bash
$ cd my-first-blog
$ git pull
[...]
```

* Zum Schluss hüpf noch einmal kurz rüber zum [Web-Tab](https://www.pythonanywhere.com/web_app_setup/) und drück auf **Reload**. Deine Änderungen sollten jetzt live sein!

Herzlichen Glückwunsch! Du kannst jetzt in der Django Admin Oberfläche neue Posts hinzufügen (denk daran published_date hinzuzufügen!), dann aktualisiere die Site, um zu sehen, ob der neue Post auch erscheint.

Funktioniert super? Wir sind stolz auf dich! Steh kurz ein bisschen vom Computer auf. Du hast dir eine Pause verdient :)

![Abbildung 13.4](images/donut.png)
