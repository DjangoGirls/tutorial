# Djangove predloge

Vstavimo na spletno stran nekaj besedila! Django nam pri tem izdatno pomaga z značkami **template**.

## Kaj so značke template?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Prikazovanje objav na blogu

V prejšnjem poglavju smo seznam objav shranili v spremenljivko `posts`. Te objave moramo še prikazati kot HTML.

Za izpis spremenljivke v Djangovih predlogah bomo uporabili zavite oklepaje, znotraj njih pa bomo dali spremenljivko:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Naredi to v predlogi `blog/templates/blog/post_list.html`. Vso kodo med drugo značko `<div>` in tretjo značko `</div>` z `{{ posts }}`. Datoteko shrani, osveži stran in si oglej rezultate:

![Figure 13.1](images/step1.png)

Vse, kar smo dobili, je tole:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Django torej našo spremenljivko razume kot seznam objektov. Se še spomniš, kako se v Pythonu izpiše elemente seznama? Prav si uganila. Z zanko! V predlogah zanko narediš takole:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Preizkusi to še v svoji predlogi.

![Figure 13.2](images/step2.png)

Deluje! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. K sreči se izkaže, da lahko v značke template dodajamo tudi HTML kodo. `body` bo zdaj zgledal takole:

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

{% raw %}Vsa koda, ki je med `{% for %}` in `{% endfor %}` se bo ponovila za vsak objekt v seznamu. Osveži svojo stran:{% endraw %}

![Figure 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? Razlika je v tem, da dostopamo do različnih delov naše baze podatkov `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Še nekaj

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* Za začetek kodo prenesimo na Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Nato se ponovno prijavi v [Pythona nAnywhere](https://www.pythonanywhere.com/consoles/), pojdi na **Bash console**(ali pa odpri novo) in zaženi:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Za konec se premakni na [Web tab](https://www.pythonanywhere.com/web_app_setup/) in v svoji aplikaciji pritisni **Reload**. Najnovejša verzija tvoje strani je objavljena! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)