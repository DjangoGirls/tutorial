# Šablóny Django

Je na čase zobraziť nejaké údaje! Na to nám Django ponúka užitočné vstavané **šablónové tagy**.

## Čo sú to šablónové tagy?

V HTML vlastne nemôžeš písať Pythonský kód, pretože prehliadače mu nerozumejú. Poznajú len HTML. Vieme, že HTML je skôr statické, kým Python je oveľa dynamickejší.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Zobraz šablónu so zoznamom príspevkov

V predchádzajúcej kapitole sme našej šablóne dali zoznam príspevkov v premennej `posts`. Teraz to zobrazíme v HTML.

To print a variable in Django templates, we use double curly brackets with the variable's name inside, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Vyskúšaj to vo svojej šablóne `blog/templates/blog/post_list.html`. Replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. Save the file, and refresh the page to see the results:

![Obrázok 13.1](images/step1.png)

Ako vidíš, dostali sme len toto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

To znamená, že to Django chápe ako zoznam objektov. Pamätáš si z kapitoly **Úvod do Pythonu** ako môžeme zobraziť zoznamy? Áno, cyklami! In a Django template you do them like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Vyskúšaj si to vo svojej šablóne.

![Obrázok 13.2](images/step2.png)

Funguje to! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. Môžeš skombinovať HTML a šablónové tagy. Naše `body` bude vyzerať takto:

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

{% raw %}Everything you put between `{% for %}` and `{% endfor %}` will be repeated for each object in the list. Refresh your page:{% endraw %}

![Obrázok 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? We are accessing data in each of the fields defined in our `Post` model. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## One more thing

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* Najskôr pošli svoj kód na Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Potom sa prihlás do [PythonAnywhere](https://www.pythonanywhere.com/consoles/) a choď do **Bash konzoly** (alebo spusti novú) a zadaj:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. Your update should be live! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Gratulujeme! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Obrázok 13.4](images/donut.png)