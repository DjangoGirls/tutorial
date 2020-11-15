# Šablóny Django

Je na čase zobraziť nejaké údaje! Na to nám Django ponúka užitočné vstavané **šablónové tagy**.

## Čo sú to šablónové tagy?

V HTML vlastne nemôžeš písať Pythonský kód, pretože prehliadače mu nerozumejú. Poznajú len HTML. Vieme, že HTML je skôr statické, kým Python je oveľa dynamickejší.

**Šablónové tagy v Djangu** nám umožňujú previesť Pythonovské veci do HTML, takže dynamické webové stránky môžeš vytvoriť rýchlejšie. Paráda!

## Zobraz šablónu so zoznamom príspevkov

V predchádzajúcej kapitole sme našej šablóne dali zoznam príspevkov v premennej `posts`. Teraz to zobrazíme v HTML.

Na vypísanie premennej v Django šablónach použijeme dvojitú zloženú zátvorku s názvom premennej vo vnútri, asi takto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Vyskúšaj to vo svojej šablóne `blog/templates/blog/post_list.html`. Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. Ulož súbor a obnov stránku, aby si videla výsledky:

![Obrázok 13.1](images/step1.png)

Ako vidíš, dostali sme len toto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

To znamená, že to Django chápe ako zoznam objektov. Pamätáš si z kapitoly **Úvod do Pythonu** ako môžeme zobraziť zoznamy? Áno, cyklami! V Django šablóne ich urobíš takto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Vyskúšaj si to vo svojej šablóne.

![Obrázok 13.2](images/step2.png)

Funguje to! Ale my chceme, aby sa príspevky zobrazili ako tie statické, ktoré sme vytvorili predtým v kapitole **Úvod do HTML**. Môžeš skombinovať HTML a šablónové tagy. Naše `body` bude vyzerať takto:

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

{% raw %}Všetko, čo dáš medzi `{% for %}` a `{% endfor %}` sa bude opakovať pre každý objekt v zozname. Obnov svoju stránku:{% endraw %}

![Obrázok 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Pristupujeme k údajom v každom z polí definovanom v našom `Post` modeli. Okrem toho `|linebreaks` preposiela texty príspevkov cez filter, ktorý konvertuje zalomenie riadkov na odstavce.

## Ešte jedna vec

Bolo by fajn vidieť či bude tvoja web stránka stále funkčná aj na Internete, však? Skúsme to znova nasadiť na PythonAnywhere. Tu je rekapitulácia postupu…

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
    

* Potom sa prihlás do [PythonAnywhere](https://www.pythonanywhere.com/consoles/) a choď do **Bash konzoly** (alebo spusti novú) a zadaj:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)