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
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Dann logg dich wieder bei [PythonAnywhere](https://www.pythonanywhere.com/consoles/) ein, geh zu deiner **Bash-Konsole** (oder starte eine neue) und gib ein:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Spring anschließend rüber zur [Seite "Web"](https://www.pythonanywhere.com/web_app_setup/) und klick auf **Neu laden** in deinem Browser. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! Wenn die Blogposts auf deiner PythonAnywhere-Seite anders sind als die auf deinem lokalen Server, ist das in Ordnung so. Die Datenbanken auf deinem lokalen Computer und auf PythonAnywhere werden nicht zusammen mit den restlichen Dateien abgeglichen.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)