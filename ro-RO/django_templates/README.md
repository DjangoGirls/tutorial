# Template-urile în Django

Este timp să afișăm ceva date! Django are un instrument incorporat pentru acesta **template tags**.

## Ce reprezintă tăgurile din template?

În HTML nu puteți să srieți codul Python, pentru că browser-ul nu poate să-l interpreteze. Ei știu numai HTML. Noi știm că HTML este destul de static, dar Python este mai dinamic.

**Tăgurile din Django template** ne dă posibilitate de a utiliza Python în HTML, deci puteți să construiți site-urile dinamice mai rapid. E bun!

## Afișarea articolului în template

În capitolul precedent am transmis o listă de articole în template, utilizând variabilă `posts`. Acum trebuie să le afișăm în HTML.

Pentru a afișa o variabilă în Django template, utilizăm we use paranteze paralele duble cu denumirea variabilei în ei, în mod următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Încercați acesta în template `blog/templates/blog/post_list.html`. Deschideți-l în editorul de cod, și schimbați tot cod începând cu al doilea `<div>` până la al treilea `</div>` cu `{{ posts }}`. Salvați fișierul și faceți un refresh a paginii pentru a vedea rezultate:

![Figura 13.1](images/step1.png)

Am primit următoare:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Acesta înseamnă că Django știe că acesta este o listă de obiecte. Ținteți minte cum noi putem afișa liste de la capitol **Introducere în Python**? Da, utilizând cicluri! În Django template facem acesta în mod următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Încercați acesta în template-ul vostru.

![Figura 13.2](images/step2.png)

Lucrează! Dar noi dorim ca articolele să fie afișate în mod similar cu acela cum noi am afișat articolele create mai înainte în capitolul **Introducere în HTML**. You can mix HTML and template tags. Our `body` will look like this:

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

{% raw %}Everything you put between `{% for %}` and `{% endfor %}` will be repeated for each object in the list. Refresh your page:{% endraw %}

![Figura 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? We are accessing data in each of the fields defined in our `Post` model. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## One more thing

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
    

* Then, log back in to [PythonAnywhere](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one), and run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)