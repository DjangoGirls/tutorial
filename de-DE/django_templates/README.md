# Django Templates

Es wird Zeit, ein paar Daten anzuzeigen! Django bringt dafür bereits ein paar sehr hilfreiche **Template Tags** mit.

## Was sind Template Tags?

Also, in HTML kann man nicht wirklich Python-Code schreiben, weil es der Browser nicht verstehen würde. Aber er kennt HTML. Wir wissen, dass HTML, im Gegensatz zum dynamischeren Python, eher statisch ist.

Die **Django Template Tags** helfen dabei, Python-Dinge in HTML auszudrücken, so dass man einfach und schnell dynamische Websites erstellen kann. Super!

## Anzeigen des Post-List-Templates

Im vorangegangen Kapitel haben wir unserem Template in der `posts`-Variable eine Liste von Posts übergeben. Diese wollen wir jetzt in HTML anzeigen.

Um eine Variable in einem Django-Template darzustellen, nutzen wir doppelte, geschweifte Klammern mit dem Namen der Variable darin, so wie hier:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Versuche das in deinem `blog/templates/blog/post_list.html` Template. Ersetze alles vom zweiten `<div>` bis zum dritten `<div>` mit `{{ posts }}`. Speichere die Datei und aktualisiere die Seite, um die Ergebnisse anzuzeigen.

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

Es funktioniert! Aber wir wollen, dass die Posts so angezeigt werden, wie die statischen Posts, die wir vorhin im **Einführung in HTML** Kapitel erstellt haben. Du kannst HTML und Template Tags mischen. Unser `body` sollte dann so aussehen:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

Ist dir aufgefallen, dass wir diesmal eine etwas andere Notation benutzen haben (`{{ post.title }}` oder `{{ post.text }}`)? Wir greifen auf Daten von jedem Feld unseres `Post`-Models zu. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Und zum Schluss

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Dann logg dich wieder bei [PythonAnywhere](https://www.pythonanywhere.com/consoles/) ein und geh zu deiner **Bash-Konsole** (oder starte eine neue) und gib ein:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* Zum Schluss hüpf noch einmal kurz rüber zum [Web-Tab](https://www.pythonanywhere.com/web_app_setup/) und drück auf **Reload**. Deine Änderungen sollten jetzt live sein! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Glückwunsch! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Abbildung 13.4](images/donut.png)