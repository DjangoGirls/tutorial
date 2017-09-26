# CSS – make it pretty!

Наш блог все ще виглядає доволі жахливо, чи не так? Час зробити його гарним! Для цього будемо використовувати CSS.

## Що таке CSS?

Cascading Style Sheets (CSS) is a language used for describing the look and formatting of a website written in a markup language (like HTML). Treat it as make-up for our web page. ;)

But we don't want to start from scratch again, right? Once more, we'll use something that programmers released on the Internet for free. Reinventing the wheel is no fun, you know.

## Скористаємось Bootstrap!

Bootstrap is one of the most popular HTML and CSS frameworks for developing beautiful websites: https://getbootstrap.com/

It was written by programmers who worked for Twitter. Now it's developed by volunteers from all over the world!

## Встановлюємо Boostrap

To install Bootstrap, you need to add this to your `<head>` in your `.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. Just go ahead, open your website and refresh the page. Here it is!

![Рисунок 14.1](images/bootstrap1.png)

Вже краще!

## Статичні файли в Django

Нарешті, ми детальніше розглянемо те, що ми називали **статичними файлами**. Static files are all your CSS and images. Their content doesn't depend on the request context and will be the same for every user.

### Де помістити статичні файли для Django

Django already knows where to find the static files for the built-in "admin" app. Now we just need to add some static files for our own app, `blog`.

Створимо директорію з ім’ям `static` всередині додатку blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite
    

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## Ваш перший CSS файл!

Let's create a CSS file now, to add your own style to your web page. Створіть нову папку з назвою `css` всередині вашої папки `static`. Потім всередині цієї папки`css` створіть новий файл з назвою `blog.css`. Готові?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Настав час написати CSS! Відкрийте файл `static/css/blog.css` в обраному редакторі коду.

We won't be going too deep into customizing and learning about CSS here. It's pretty easy and you can learn it on your own after this workshop. There is a recommendation for a free course to learn more at the end of this page.

Але принаймні попрацюємо трохи. Можливо, ми могли б змінити колір заголовка? Щоб зрозуміти кольори, комп'ютери використовують спеціальні коди. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. You may also use [predefined colors](http://www.w3schools.com/colors/colors_names.asp), such as `red` and `green`.

У вашому файлі `static/css/blog.css` потрібно додати наступний код:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` -- CSS селектор. This means we're applying our styles to any `a` element inside of an `h1` element. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. У цьому випадку, ми повідомляємо про те, що треба змінити колір на `#FCA205`, тобто помаранчевий. Звичайно, ви можете визначити тут ваш власний колір!

В CSS файлі ми визначаємо стилі для елементів файлу HTML. The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class і id -- імена, які ви присвоюєте елементам власноруч. Класи (сlasses) визначають групи елементів, а ідентифікатори (id), в свою чергу, вказують на специфічні елементи. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may override code in Bootstrap files. Ми щойно повідомили наш шаблон де розташовані наші CSS файли.

Тепер ваш файл має виглядати наступним чином:

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

OK, збережіть файл і перезавантажте сторінку!

![Рисунок 14.2](images/color2.png)

Чудова робота! Можливо, ми також хотіли б дати нашому веб-сайту трохи повітря і збільшити відступ зліва? Давайте спробуємо!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Рисунок 14.3](images/margin2.png)

Можливо, ми могли б також налаштувати шрифт нашого заголовка? Вставте це всередину розділу `<head>` файлу `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Рисунок 14.3](images/font.png)

Чудово!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Дайте імена певним частинам HTML коду. Додайте клас із назвою `page-header` до блоку `div`, що містить ваш заголовок, як це зроблено тут:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

А тепер додайте клас `post` до вашого блоку `div`, що містить сам допис.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

А тепер додамо визначення блоків для різних селекторів. Селектори, які починають із символу `.` стосуються класів. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. Поки що, просто скопіюйте і вставте це у ваш файл `mysite/static/css/blog.css`:

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

Далі модифікуйте HTML код, що відображує пости. Замініть:

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

в `blog/templates/blog/post_list.html` на:

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
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Збережіть файли і перезавантажте свій сайт.

![Рисунок 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

Готові до наступного розділу?! :)