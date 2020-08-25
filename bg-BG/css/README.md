# CSS - направи го красиво!

Блогът ни все още изглежда доста грозен, нали? Време е да го направиш хубав! За това ще използваме CSS.

## Какво е CSS?

Cascading Style Sheets (CSS) е език, използван за описание на външния вид и форматирането на уебсайт, написан на език за маркиране (като HTML). Отнасяй се към него като грим за нашата уеб страница. ;)

Но не искаме отново да започнем от нулата, нали? Още веднъж ще използваме нещо, което програмистите пуснаха в интернет безплатно. Преосмислянето на колелото не е забавно.

## Нека използваме Bootstrap!

Bootstrap е една от най-популярните фреймуорки за HTML и CSS за разработване на красиви уебсайтове: https://getbootstrap.com/

Той е написан от програмисти, които са работили за Twitter. Сега той е разработен от доброволци от цял свят!

## Инсталирай Bootstrap

За да инсталираш Bootstrap, отвори твоя `.html` файл в редактора на кода и го добави в секцията `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Това не добавя никакви файлове към твоя проект. То просто сочи файлове, които съществуват в Интернет. Затова продължи напред, отвори уебсайта си и актуализирай страницата. Ето го!

![Фигура 14.1](images/bootstrap1.png)

Вече изглежда по-хубав!

## Статични файлове в Django

Накрая ще разгледаме по-подробно тези неща, които наричахме **статични файлове**. Статичните файлове са всички ваши CSS и изображения. Съдържанието им не зависи от контекста на заявката и ще бъде едно и също за всеки потребител.

### Къде да сложа статични файлове за Django

Django вече знае къде да намери статичните файлове за вграденото приложение "admin". Сега трябва да добавим статични файлове за нашето собствено приложение, `blog`.

Правим това, като създаваме папка, наречена `static` в блог приложението:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django автоматично ще открива всички папки, наречени 'static', в която и да е от папките на вашите приложения. Тогава то ще може да използва тяхното съдържание като статични файлове.

## Твоят първи CSS файл!

Нека сега създадем CSS файл, за да добавим свой собствен стил към твоята уеб страница. Създай нова директория, наречена `css` във твоята `static` директория. След това създай нов файл, наречен `blog.css` вътре в тази директория `css`. Готова?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Време е да напишеш малко CSS! Отвори файла `blog/static/css/blog.css` в твоя редактор на код.

Тук няма да навлизаме твърде дълбоко в персонализирането и научаването на CSS. Има препоръка за безплатен CSS курс в края на тази страница, ако искаш да научиш повече.

Но нека направим поне малко. Може би бихме могли да променим цвета на заглавията ни? За да разберат цветовете, компютрите използват специални кодове. Тези кодове започват с `#`, последвани от 6 букви (A–F) и цифри (0–9). Например кодът за синьо е `#0000FF`. Можеш да намериш цветовите кодове за много от цветовете тук: http://www.colorpicker.com/. Можеш също така да използваш [предварително определени цветове](http://www.w3schools.com/colors/colors_names.asp), като `red` и `green`.

Във твоя `blog/static/css/blog.css` файл трябва да добавиш следния код:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` е CSS селектор. Това означава, че прилагаме стиловете си към всеки `a` елемент вътре в елемент `h1`; селекторът `h2 a` прави същото за елементи `h2`. Така че, когато имаме нещо като `<h1><a href="">връзка</a></h1>`, ще се прилага стилът `h1 a`. В този случай ние му казваме да промени цвета си на `#C25100`, което е тъмно оранжево. Или можеш да поставиш свой собствен цвят тук, но се увери, че той има добър контраст на бял фон!

В CSS файл определяме стилове за елементи в HTML файла. Първият начин да идентифицираме елементите е с името на елемента. Може да ги запомниш като тагове от секцията HTML. Нещата като `a`, `h1` и `body` са примери за имена на елементи. Ние също така идентифицираме елементи по атрибут `class` или атрибут `id`. Class и id са имена, които сама даваш на елемента. Класовете определят групи от елементи, а идентификаторите сочат конкретни елементи. Например, можеш да идентифицираш следния маркер, като използваш името на тага `a`, класа `external_link` или id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Можеш да прочететеш повече за [CSS селектори в w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Трябва също така да кажем на нашия HTML шаблон, че добавихме някои CSS. Отвори файла `blog/templates/blog/post_list.html` в редактора на кода и добави този ред в самото начало:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Тук просто зареждаме статични файлове. :) Между таговете `<head>` и `</head>`, след връзките към CSS файловете на Bootstrap, добави този ред:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Браузърът чете файловете в реда, в който са зададени, така че трябва да се уверим, че това е на правилното място. В противен случай кодът в нашия файл може да бъде отменен с кода във файлове Bootstrap. Току-що казахме на нашия шаблон къде се намира нашият CSS файл.

Твоят файл сега трябва да изглежда така:

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

ОК, запази файла и актуализирай сайта!

![Фигура 14.2](images/color2.png)

Добра работа! Може би също бихме искали да дадем на нашия уебсайт малко въздух и да увеличим полето от лявата страна? Нека опитаме това!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Добави това към твоя CSS, запиши файла и виж как работи!

![Фигура 14.3](images/margin2.png)

Може би можем да персонализираме шрифта в заглавието ни? Постави това в твоя `<head>` в `blog/templates/blog/post_list.html` файл:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Както и преди, провери поръчката и постави преди връзката към `blog/static/css/blog.css`. Този ред ще импортира шрифт, наречен *Lobster* от Google Fonts (https://www.google.com/fonts).

Намери блока за деклариране `h1 a` (кодът между скобите `{` и `}`) в CSS файла `blog/static/css/blog.css`. Сега добави ред `font-family: 'Lobster';` между скобите и актуализирай страницата:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Фигура 14.3](images/font.png)

Страхотно!

Както бе споменато по-горе, CSS има концепция за класове. Те ви позволяват да назовете част от HTML кода и да приложите стилове само към тази част, без да засягате другите. Това може да бъде супер полезно! Може би имаш два div (от division, разделяне), които правят нещо различно (като заглавието и публикацията ти). Един клас може да ти помогне да ги накараш да изглеждат различно.

Продължи и дай име на някои части от HTML кода. Добави клас, наречен `page-header`, към твоя `div`, който съдържа заглавието ти, ето така:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

И сега добави клас `post` към твоя `div` съдържащ публикация в блог.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Сега ще добавим декларационни блокове към различни селектори. Селектори, започващи с `.`, се отнасят за класове. Има много страхотни ръководства и обяснения за CSS в мрежата, които могат да ти помогнат да разбереш следния код. Засега го копирай и постави във твоя `blog/static/css/blog.css` файл:

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

След това заобиколи HTML кода, който показва публикациите с декларации за класове. Замени това:

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

в `blog/templates/blog/post_list.html` с това:

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

Запази тези файлове и актуализирай уебсайта си.

![Фигура 14.4](images/final.png)

Ура! Изглежда страхотно, нали? Виж кода, който току-що поставихме, за да намериш местата, където добавихме класове в HTML и ги използвахме в CSS. Къде би направила промяната, ако искаш датата да е тюркоазена?

Не се страхувай да се поинтересуваш с този CSS малко и се опитай да промениш някои неща. Играта с CSS може да ти помогне да разбереш какво правят различните неща. Ако счупиш нещо, не се притеснявай - винаги можеш да го отмениш!

Наистина препоръчваме да вземеш безплатните онлайн курсове "Basic HTML & HTML5" и "Basic CSS" на [freeCodeCamp](https://learn.freecodecamp.org/). Те могат да ти помогнат да научиш всичко за правенето на уебсайтовете ти по-красиви с HTML и CSS.

Готова ли си за следващата глава?! :)