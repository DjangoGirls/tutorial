# Mga template ng Django

Oras na para magpakita ng mga datos! Ang Django ay nagbibigay sa atin ng mga nakakatulong na mga built-it na mga **template na tags** para dito.

## Ano ang mga template tags?

Makita mo, sa HTML, hindi ka maaring magsulat ng code na Python, dahil hindi ito maiintindihan ng mga browser. Alam lang nila ang HTML. Alam natin na ang HTML ay hindi nababago, habang ang Python ay pabago-bago.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## Magdisplay ng Post List na Template

Sa nakaraang kabanata, binigyan natin ang ating template ng lista ng mga posts sa ating `posts` na variable. Ngayon, maari na natin itong ilagay sa HTML.

Para magprint ng variable sa templates ng Django, gagamit tayo ng dobleng pamukod na may pangalan ng variable sa loob, gaya nito:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Subukan mo ito sa loob ng iyong `blog/templates/blog/post_list.html` na template. Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. I-save ang file, at i-refresh ang pahina para makita ang mga resulta:

![Tambilang 13.1](images/step1.png)

Gaya nang makikita mo, ang lahat ng nakuha natin ay ito lang:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Ibig sabihin nito ay naintindihan ni Django na ito ay isang lista ng mga object. Natandaan mo mula sa **Introduksyon sa Python** kung paano nati mapakita ang mga lista? Oo, gamit ang for loops! Sa Django template gagawin natin ito gaya nito:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Subukan ito sa iyong template.

![Tambilang 13.2](images/step2.png)

Gumana ito! Pero gusto nating i-display ang mga post gaya ng mga static na post na ginawa natin kanina sa **Introduksyon sa HTML** na kabanata. Maari mong ihalo ang HTML at ang mga template tags. Ang ating `body` ay magmukhang ganito:

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

{% raw %}Lahat ng nilagay mo sa pagitan ng `{% for %}` at `{% endfor %}` ay uulitin sa bawat object na nasa list. I-refresh ang iyong pahina:{% endraw %}

![Tambilang 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Tayo ay kukuha ng mga datos sa bawat field na nakalarawan sa ating `Post` na model. At, ang `|linebreaksbr` ay nagpipe nga mga teskto ng post sa filter para i-convert ang mga line-break sa mga talata.

## Isa pang bagay

Magandang tingnan kung ang website ay gumagana pa rin sa publikong Internet, di ba? Subukan nating mag-deploy sa PythonAnywhere ulit. Eto ay pagbibigay buod sa mga hakbang…

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
    

* Pagkatapos, maglog ulit sa [PythonAnywhere](https://www.pythonanywhere.com/consoles/) at pumunta sa iyong **Bash na console** (o magpatakbo ng isa pa), at patakbuhin ang:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)