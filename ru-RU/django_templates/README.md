# Шаблоны Django

Пришло время отобразить данные на сайте! Django поможет нам с этим при помощи встроенных **тегов шаблонов**.

## Что представляются из себя теги шаблонов?

Как видишь, в HTML нельзя помещать код Python, поскольку браузеры не понимают его. Они знаю только HTML. Мы помним, что HTML статичен, в то время как Python позволяет динамические изменения.

**Теги шаблонов Django** позволяют нам вставлять Python в HTML, так что ты можешь создавать динамические веб-сайты быстрее и проще. То что надо!

## Отображаем шаблон списка записей

В предыдущей главе мы передали нашему шаблону список записей в переменной `posts`. Теперь мы отобразим его в HTML.

Чтобы вставить переменную в шаблон Django, нам нужно использовать двойные фигурные скобочки с именем переменной внутри:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Попробуй это в шаблоне `blog/templates/blog/post_list.html`. Замени всё, начиная со второго `<div>` и вплоть до третьего `</div>` кодом `{{ posts }}`. Сохрани файл и обнови страницу, чтобы увидеть результат:

![Рисунок 13.1](images/step1.png)

Как ты можешь заметить, мы получили следующую строку:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Это показывает, что Django понял переменную как список объектов. Помнишь из главы **Введение в Python** как мы можем аккуратно отобразить список? Правильно, циклом for! В шаблонах Django ты можешь использовать их таким образом:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Попробуй вставить это в свой шаблон.

![Рисунок 13.2](images/step2.png)

Сработало! Но мы хотим, чтобы они отображались как статические записи, которые мы создавали в главе **Введение в HTML**. ты можешь смешивать HTML и теги шаблонов. Наш элемент `body` будет выглядеть следующим образом:

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

{% raw %}Всё что ты поместишь между `{% for %}` и `{% endfor %}` будет повторено для каждого объекта в списке. Обнови страницу:{% endraw %}

![Рисунок 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Мы обращаемся к различным полям нашей модели `Post`. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## Еще один момент

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
    

* Затем заходим на [PythonAnywhere](https://www.pythonanywhere.com/consoles/), открываем **Bash console** и набираем команду:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* Наконец, переключаемся на вкладку [Web](https://www.pythonanywhere.com/web_app_setup/) и жмем кнопку **Reload**. Обновления запущены в жизнь! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Поздравляем! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Рисунок 13.4](images/donut.png)