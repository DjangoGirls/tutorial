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

Попробуй это в шаблоне `blog/templates/blog/post_list.html`. Открой это в редакторе кода и замени все со второй `&lt;div&gt;`до третьего `&lt;/div&gt;` на `{{ posts }}`. Сохрани файл и обнови страницу, чтобы увидеть результат:

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
&lt;div&gt;
    &lt;h1&gt;&lt;a href="/"&gt;Django Girls Blog&lt;/a&gt;&lt;/h1&gt;
&lt;/div&gt;

{% for post in posts %}
    &lt;div&gt;
        &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
        &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
        &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
    &lt;/div&gt;
{% endfor %}
```

{% raw %}Всё что ты поместишь между `{% for %}` и `{% endfor %}` будет повторено для каждого объекта в списке. Обнови страницу:{% endraw %}

![Рисунок 13.3](images/step3.png)

Ты заметила, что мы использовали немного другую запись в этот раз `{{ post.title }}` или `{{ post.text }}`)? Мы обращаемся к различным полям нашей модели `Post`. Также `|linebreaks` прогоняет текст через фильтр, для преобразования переносов строк в параграфы.

## Еще один момент

Пришло время еще раз убедиться, что наш сайт будет работать в сети, согласна? Попробуем развернуть новую версию сайта на PythonAnywhere. Краткий обзор необходимых шагов...

* Сначала загрузи свой код на GitHub

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

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Наконец, переключись на вкладку [Web](https://www.pythonanywhere.com/web_app_setup/) и нажми кнопку **Reload**. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! Если сообщения в блоге на сайте PythonAnywhere не соответствуют сообщениям, появляющимся на блоге, размещенном на локальном сервере, то это нормально. Базы данных на локальном компьютере и на PythonAnywhere не синхронизируются с остальными вашими файлами.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)