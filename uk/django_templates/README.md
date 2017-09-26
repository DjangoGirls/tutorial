# Django шаблони

Час вивести деякі дані! Django надає нам певні допоміжні, вбудовані **шаблонні теги** для цього.

## Що таке шаблонні теги?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## Шаблон для виведення списку постів

В попередньому розділі ми надали нашому шаблону список постів у змінній `posts`. А тепер відобразимо це в HTML.

Щоб надрукувати змінну в Django шаблоні, ми використовуємо подвійні фігурні дужки з іменем змінної всередині:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Спробуйте це в шаблоні `blog/templates/blog/post_list.html`. Починаючи з другого `<div>` до третього `</div>` замініть все на `{{ posts }}`. Збережіть файл і оновіть сторінку, щоб побачити результат:

![Figure 13.1](images/step1.png)

Як можна побачити, все що ми отримали це:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Означає, що Django розуміє це як список об'єктів. Пам'ятаєте із розділу **Вступ до Python** як ми можемо виводити списки? Звичайно, за допомогою циклу **for**! У Django шаблонах ви можете створити їх наступним чином:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Спробуйте це у вашому шаблоні.

![Figure 13.2](images/step2.png)

Працює! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. Ви можете компонувати теги HTML і шаблонні теги. Наша частина `body` буде виглядати так:

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

Все що ви напишете між `{% for %}` та `{% endfor %}` повторюватиметься для кожного об'єкта у списку. Оновіть сторінку:

![Figure 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? Ми маємо доступ до даних, що містяться в кожному полі, визначеному в нашій моделі `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Ще одне

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* По-перше, проштовхніть ваш код на Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Потім, увійдіть назад до [PythonAnywhere](https://www.pythonanywhere.com/consoles/) та перейдіть до **Bash консолі** (або запустіть нову) і виконайте команди:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* Нарешті, перейдіть на вкладку [Web tab](https://www.pythonanywhere.com/web_app_setup/) і натисніть **перезавантажити** у веб-додатку. If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)