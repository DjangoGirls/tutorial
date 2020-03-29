# Django шаблони

Време е да покажем на екран малко данни! Django има вградени **template tags** за тази цел.

## Какви са тези шаблонни етикети?

Виждате, в HTML не може наистина да пишете Python код, защото търсачките не го разбират. Те знаят само HTML. Знаем, че HTML е статичен, докато Python е по-динамичен.

**Django template tags** ни позволяват да прехвърлим Python нещата към HTML, така че да изграждаме динамични сайтове по-бързо. Супер!

## Показване на шаблон за лист от публикации

В предишната глава дадохме на нашия шаблон лист от публикации с променливата `posts`. Сега ще го покажем на екран с HTML.

За да отпечатаме променливата в шаблоните на Django, използваме къдрави скоби с името на променливата вътре ето така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Пробвайте това във вашия шаблон `blog/templates/blog/post_list.html`. Отворете го в редактора си и заместете всичко от вторият `<div>` до третият `</div>` с `{{ posts }}`. Запазете файла и опреснете страницата за да видите резултатите:

![Figure 13.1](images/step1.png)

Както може да видите, всичко което имаме е това:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Това означава, че Django го разбира като лист от обекти. Помните ли от **Въведение в Python** как показваме листове? Да, с for цикли! При Django шаблоните ги правим така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Пробвайте това във вашия шаблон.

![Figure 13.2](images/step2.png)

Работи! Но ние искаме публикациите ни да се показват като статичните публикации, които създадохме по-рано в главата **Въведение в HTML**. Можете да смесвате HTML с шаблони. Нашето `body` ще изглежда така:

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

{% raw %}Всичко, което сложите между `{% for %}` и `{% endfor %}` ще се повтаря за всеки обект в листа. Опреснете страницата си: {% endraw %}

![Figure 13.3](images/step3.png)

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