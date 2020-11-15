# Django sablonok (template)

Itt az idő, hogy megjelenítsünk pár adatot! Ehhez Django felkínál nekünk pár beépített **template tag**-et számunkra.

## Mik a template tag-ek?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## Template a bejegyzések listájához

Az előző fejezetben hozzáadtuk a template-hez a bejegyzéseink listáját a `post` változóban. Most meg fogjuk ezt jeleníteni a HTML-ben.

Ahhoz, hogy kiírjunk egy változót a Django template-ben, dupla kapcsos zárójelet használunk, benne a változó nevével, mint itt:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Próbáld ki a `blog/templates/blog/post_list.html` template-ben. Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. Mentsd el a fájlt és frissítsd az oldalt, hogy lásd az eredményt:

![13.1 ábra](images/step1.png)

Ahogy látod, ez minden, amink van:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Ez azt jelenti, hogy a Django objektumok listájaként értelmezi. Emlékszel a **Bevezetés a Python-ba** című fejezetből, hogy hogyan jelenítünk meg listákat? Igen, for loop-okkal! Egy Django template-ben ezt így tudod megtenni:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Próbáld ki a template-edben.

![13.2 ábra](images/step2.png)

És működik! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. A HTML-t és a template tageket használhatod együtt. A `body` így fog kinézni:

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

{% raw %} Minden, amit a `{% for %}` és `{% endfor %}` közé írsz, a lista minden egyes elemére meg fog ismétlődni. Frissítsd az oldalt:{% endraw %}

![13.3 ábra](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Az adatokat a `Post` modelben meghatározott mezők szerint érjük el. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Még valami

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Ezután a [PythonAnywhere](https://www.pythonanywhere.com/consoles/)-en menj a **Bash console**-ba (vagy indíts újat), és futtasd le:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)