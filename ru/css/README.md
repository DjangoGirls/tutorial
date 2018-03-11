# CSS — сделай это красиво!

Наш блог всё ещё выглядит довольно скверно, не так ли? Пора сделать его красивым! Для этого будем использовать CSS.

## Что такое CSS?

Каскадные таблицы стилей (англ. Cascading Style Sheets, или сокращённо CSS) — специальный язык, используемый для описания внешнего вида и форматирования сайта, написанного на языке разметки (как HTML). Воспринимай это как своего рода макияж для нашей веб-страницы ;)

Но мы же не хотим начинать всё с нуля, правда? Мы просто снова возьмём что-то, что уже было создано программистами и опубликовано в Интернете для свободного пользования. Ты же знаешь, заново изобретать велосипед совсем не весело.

## Давай использовать Bootstrap!

Bootstrap — один из наиболее популярных HTML и CSS фреймворков для разработки красивых сайтов: https://getbootstrap.com/

Он был написан программистами, которые работали в Twitter, а сейчас совершенствуется волонтёрами со всего мира.

## Установка Bootstrap

Для установки Bootstrap тебе нужно добавить следующие строки в `<head>` твоего `.html` файла (`blog/templates/blog/post_list.html`):

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Это не добавит ни одного файла к твоему проекту. Эти строки просто указывают на файлы, опубликованные в Интернете. Просто продолжай, открой свой веб-сайт и обнови страницу. Вот и результат!

![Рисунок 14.1][1]

 [1]: images/bootstrap1.png

Выглядит уже лучше!

## Статические файлы в Django

Теперь мы ближе познакомимся с теми таинственными **статическими файлами**. Статическими файлами называются все файлы CSS и изображения, т.е. файлы, которые не изменяются динамически, их содержание не зависит от контекста запроса и будет одинаково для всех пользователей.

### Куда поместить статические файлы в Django

Django уже знает, где искать статические файлы для встроенного приложения "admin". Теперь нам нужно добавить статические файлы для своего приложения `blog`.

Мы сделаем это, создав папку `static` внутри каталога с нашим приложением:

```
djangogirls
├── blog
│   ├── migrations
│   ├── static
│   └── templates
└── mysite
```

Django будет автоматически находить папки `static` внутри всех каталогов твоих приложений и сможет использовать их содержимое в качестве статических файлов.

## Твой первый CSS файл!

Давай создадим CSS файл, чтобы добавить свой собственный стиль для твоей веб-страницы. Создай новую папку под названием `css` внутри твоей папки `static`. Затем создай новый файл под названием `blog.css` внутри папки `css`. Готово?

```
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
```

Пришло время написать несколько строк CSS! Открой файл `blog/static/css/blog.css` в своем редакторе кода.

Мы не будем здесь погружаться слишком глубоко в процесс настройки и изучения CSS, поскольку это так просто, что ты сможешь изучить этот материал самостоятельно после этого руководства. В конце этой главы мы порекомендуем тебе бесплатный курс для дальнейшего изучения.

Но давай сделаем хотя бы немного. Возможно, мы могли бы изменить цвет заголовка?
Чтобы понимать цвета, компьютеры используют специальные коды. Они начинаются с `#` и далее следуют 6 букв (A-F) и цифр (0-9). Ты можешь найти коды цветов, например, здесь: http://www.colorpicker.com/. Также можешь пользоваться [предопределенными цветами][3], такими как `red` и `green`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

В файле `blog/static/css/blog.css` тебе нужно добавить следующий код:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
}
```

`h1 a` — это CSS-селектор. Это означает, что мы применяем наши стили к каждому элементу `a` внутри элемента `h1` (например, когда у нас в коде что-то вроде: `<h1><a href="">link</a></h1>`). В этом случае мы говорим о том, что нужно изменить цвет элемента на `#FCA205`, то есть на оранжевый. Конечно, ты можешь указать свой собственный цвет!

В CSS файле мы определяем стили для элементов файла HTML. Элементы идентифицируются именами (то есть `a`, `h1`, `body`), атрибутом `class` или атрибутом `id`. Class и id – это имена, которые ты сама присваиваешь элементам. Классы (сlass) определяют группы элементов, а идентификаторы (id) указывают на конкретные элементы. Например, следующий тег может быть идентифицирован CSS с использованием имени тега `a`, класса `external_link` или идентификатора `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Почитай про CSS селекторы в [CSS Selectors на w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Затем нам также нужно сообщить нашему HTML-шаблону о том, что мы добавили CSS. Открой файл `blog/templates/blog/post_list.html` и добавь эту строку в самое начало:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% load staticfiles %}
```

Мы просто загружаем здесь статические файлы :)
Далее между `<head>` и `</head>`, после ссылок на файлы Bootstrap CSS, добавь такую строку:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```
Браузер читает файлы в порядке их следования, поэтому нам необходимо удостовериться, что файл расположен в необходимом месте. Иначе код нашего файла может переопределить код в файлах Bootstrap.
Мы только что сказали нашему шаблону, где находится наш CSS файл.

Твой файл должен теперь выглядеть следующим образом:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% load staticfiles %}
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
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Ок, сохрани файл и обнови страницу!

![Рисунок 14.2][5]

 [5]: images/color2.png

Отличная работа! Может быть, мы также хотели бы добавить нашему веб-сайту немного пространства и увеличить отступ слева? Давай попробуем!

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
body {
    padding-left: 15px;
}
```

Добавь это к твоему CSS, сохрани файл и посмотри, как это работает!

![Рисунок 14.3][6]

 [6]: images/margin2.png

Возможно, мы можем настроить шрифт нашего заголовка? Вставь это внутрь тега `<head>` в файле `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,cyrillic" rel="stylesheet" type="text/css">
```

Как и ранее, проверь порядок и вставь эту строку перед ссылкой на `blog/statid/css/blog.css`. Эта строка импортирует шрифт под названием *Lobster* из шрифтов Google (https://www.google.com/fonts).

Теперь добавь строку `font-family: 'Lobster';` в CSS файле `blog/static/css/blog.css` внутри блока определения стиля `h1 a` (код помещается между скобками `{` и `}`) и обнови страницу:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Рисунок 14.3][7]

 [7]: images/font.png

Отлично!

Как было указано выше, в CSS используется концепция классов, которая позволяет назвать часть HTML кода и применять стили только для этой части без всякого эффекта для других. Это очень полезно, если у тебя есть, скажем, два блока div, но они выполняют совершенно разные функции (как ваш заголовок и пост), следовательно, ты не хочешь, чтобы они выглядели одинаково.

Дадим имена определённым частям HTML кода. Добавь класс под названием `page-header` в блок `div`, содержащий наш заголовок, как это сделано здесь:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

А теперь добавь класс `post` в твой `div`, содержащий сообщение в блоге:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Теперь добавим определения блоков для различных селекторов. Селекторы, которые начинают с символа `.`, относятся к классам. В Интернете много хороших справочников по CSS, которые могут помочь тебе понять следующий код. А сейчас просто скопируй и вставь код в файл `djangogirls/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
.page-header {
    background-color: #ff9400;
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

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

Далее переделаем код HTML, отображающий посты, используя классы. Замени:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
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
                        <p>Опубликовано: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Сохрани эти файлы и обнови свой веб-сайт.

![Рисунок 14.4][8]

 [8]: images/final.png

Юхууу! Выглядит прекрасно, не так ли? Код, который мы только что вставили, на самом деле не сложный для понимания, и ты, просто прочитав его, сможешь понять большую часть.

Не бойся немного повозиться с этим CSS-файлом и попробуй поменять некоторые вещи. Если что-то сломается, не волнуйся, ты всегда можешь отменить предыдущее действие!

В любом случае, мы настоятельно рекомендуем пройти бесплатный онлайн курс [Codeacademy HTML & CSS course ][2] в виде домашней работы после воркшопа, чтобы изучить всё, что нужно знать об оформлении веб-сайтов с помощью CSS.

Готова к следующей главе?! :)
