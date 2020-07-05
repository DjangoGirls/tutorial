# CSS - сделай это красивым!

Наш блог все еще выглядит довольно скверно, не так ли? Пора сделать его красивым! Для этого будем использовать CSS.

## Что такое CSS?

Каскадные таблицы стилей (CSS) - это язык, используемый для описания внешнего вида и форматирования веб-сайта, написанного на языке разметки (например, HTML). Рассматривай это как макияж для нашей веб-страницы :)

Но ты же не хочешь начинать все сначала, правда? Повторюсь, мы будем использовать все то, что другие программисты выложили в интернет бесплатно. Не очень-то интересно изобретать велосипед еще раз :)

## Давай использовать Bootstrap!

Bootstrap - один из самых популярных HTML и CSS фреймворков для разработки красивых сайтов: https://getbootstrap.com/

Он был написан программистами из Twitter, а сейчас разрабатывается волонтерами со всего мира!

## Установка Bootstrap

Для установки Bootstrap открой файл содержащий код `.html` в редакторе и добавь эти строки в заголовок `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Это не добавит никаких файлов в твой проект. Этот код просто указывает на то, что эти файлы существуют в Интернете. Поэтому открой сайт и обнови страницу, где ты обнаружишь изменения!

![Рисунок 14.1](images/bootstrap1.png)

Выглядит уже лучше!

## Статические файлы в Django

Наконец мы ближе познакомимся с тем, что называли **статическими файлами**. Статические файлы - это файлы CSS и изображения. Их содержимое не зависит от контекста запроса и будет одинаковым для всех пользователей.

### Куда поместить статические файлы в Django

Django уже знает, где искать статические файлы для встроенного приложения"admin". Теперь нам нужно добавить статические файлы в наше собственное приложение, `blog`.

Мы сделаем это, создав папку `static` внутри каталога с нашим приложением:

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Django автоматически найдет все папки с именем "static" внутри папок приложений. Теперь можно использовать их содержимое как статические файлы :)

## Твой первый CSS файл!

Давай создадим CSS файл, чтобы украсить нашу веб-страницу. Создай новую папку под названием `css` внутри твоей папки `static`. Затем создайте новый файл под названием `blog.css` внутри папки `css`. Готова?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Пришло время написать несколько строк CSS! Открой файл `blog/static/css/blog.css` в своем редакторе кода.

Мы не будем слишком углубляться в настройки и изучение CSS здесь. В конце страницы находятся рекомендованные бесплатные CSS курсы, если вы захотите изучить CSS самостоятельно.

Но давай сделаем хотя бы немного. Может мы могли бы поменять цвет наших заголовков? Чтобы понимать цвета, компьютеры используют специальные коды. Эти коды начинаются с `#`, состоят из букв (A-F) и цифр (0-9). Например, код для синего цвета - `#0000FF`. Коды многих цветов можно найти здесь: http://www.colorpicker.com/. Также можешь пользоваться [предопределенными цветами](http://www.w3schools.com/colors/colors_names.asp), такими как `red` и `green`.

В файле `blog/static/css/blog.css` тебе нужно добавить следующий код:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` это CSS селектор. Это означает, что мы применяем наши стили к любым элементам `a`, внутри элемента `h1`; селектор `h2 a` делает то же самое для элементов `h2`. Поэтому, когда у нас есть что-то вроде `<h1><a href="">ссылка</a></h1>`, будет применяться стиль `h1 a`. В этом случае, мы говорим сменить этот цвет на `#C25100`, то есть на темно-оранжевый. Или же вы можете поместить сюда свой собственный цвет, но убедитесь, что у него хороший контраст на белом фоне!

В CSS файле мы определяем стили для элементов HTML файла. Первый способ определить элементы — по имени. Ты должна помнить эти теги из HTML. `a`, `h1`, `head` - все это примеры имен элементов. Мы также назначить элементу `класс` или атрибут `id`. Class и id – это имена, которые ты сама присваиваешь элементам. Классы (сlass) определяют группы элементов, а идентификаторы (id) указывают на конкретные элементы. Например, следующий тег может быть идентифицирован CSS с использованием имени тега `a`, класса `external_link` или идентификатора `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Вы можете прочитать больше о CSS селекторах на [w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Нам также нужно сообщить нашему шаблону HTML что мы добавили CSS стили. Откройте файл `blog/templates/blog/post_list.html` в редакторе кода и добавьте эту строчку в самое начало:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Мы просто загружаем статические файлы :) Между `<head>` и `</head>`, после ссылки на файлы загрузки CSS, добавьте эту строку:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Браузер считывает файлы в том порядке, в котором он их получил, так что мы должны убедиться, что они находятся в нужном месте. В противном случае код в нашем файле может быть переопределен кодом в Bootstrap файлах. Мы только что сказали нашему шаблону, где находится наш CSS файл.

Твой файл должен теперь выглядеть следующим образом:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
```

ОК, сохрани файл и обнови страницу!

![Рисунок 14.2](images/color2.png)

Отличная работа! Может быть, мы также хотели бы добавить нашему веб-сайту немного пространства и увеличить отступ слева? Давай попробуем!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Добавь это к твоему CSS, сохрани файл и посмотри, как это работает!

![Рисунок 14.3](images/margin2.png)

Возможно, мы можем настроить шрифт нашего заголовка? Вставь это внутрь тега `<head>` в файле `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Как и прежде, проверьте порядок и место перед ссылкой на `blog/static/css/blog.css`. Эта строка будет импортировать шрифт *Lobster* из Google Fonts (https://www.google.com/fonts).

Найди блок стилей (код между фигурными скобками `{` и `}`) для `h1` в CSS файле `blog/static/css/blog.css`. Теперь добавьте строку `font-family: 'Lobster';` между фигурными скобками и обновите страницу:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Рисунок 14.3](images/font.png)

Отлично!

Как упоминалось выше, CSS имеет концепцию классов. Они позволяют назвать часть HTML-кода и применить стили только к этой части, не влияя на другие части. Это может быть супер полезно! Возможно, у вас есть два div, которые делают что-то разное (например, заголовок и ваше сообщение). Класс может помочь вам сделать их выглядеть иначе.

Дайте имена определенным частям HTML кода. Добавьте класс под названием `page-header` в блок `div`, содержащий ваш заголовок, как это сделано здесь:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

А теперь добавьте класс `post` в ваш `div`, содержащий сообщение в блоге.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

А теперь добавим определения блоков для различных селекторов. Селекторы, которые начинают с символа `.` относятся к классам. Существует много хороших справочников о CSS в Интернете, которые могут помочь вам понять следующий код. А сейчас просто скопируйте и вставьте его в файл `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Далее переделайте HTML код, отображающий посты. замените:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

в `blog/templates/blog/post_list.html` этим кодом:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Сохраните эти файлы и обновить свой веб-сайт.

![Рисунок 14.4](images/final.png)

Юююхуууу! Выглядит неплохо, ведь так? :) Посмотрите на код, который мы только что вставили. Мы добавили классы в HTML и использовали их в CSS. Где бы вы вносили изменения, если бы вы хотели, чтобы дата была бирюзой?

Не бойтесь возиться с CSS - попробуйте изменить некоторые вещи. Игра с CSS может помочь вам понять, что делают разные вещи. Если вы нарушите что-то, не беспокойтесь - вы всегда можете отменить это!

Мы весьма рекомендуем пройти бесплатные онлайн-курсы "Basic HTML & HTML5" и "Basic CSS" на [freeCodeCamp](https://learn.freecodecamp.org/). Они могут помочь тебе узнать все о том, что делает тебе сайты красивее с HTML и CSS.

Готовы к следующей главе?! :)