# CSS - направи го красиво!

Блогът ни все още изглежда доста грозен, нали? Време е да го направите хубав! За това ще използваме CSS.

## Какво е CSS?

Cascading Style Sheets (CSS) е език, използван за описание на външния вид и форматирането на уебсайт, написан на език за маркиране (като HTML). Отнасяйте се към него като грим за нашата уеб страница. ;)

Но не искаме отново да започнем от нулата, нали? Още веднъж ще използваме нещо, което програмистите пуснаха в интернет безплатно. Преосмислянето на колелото не е забавно.

## Нека използваме Bootstrap!

Bootstrap е една от най-популярните фреймуорки за HTML и CSS за разработване на красиви уебсайтове: https://getbootstrap.com/

Той е написан от програмисти, които са работили за Twitter. Сега тя е разработена от доброволци от цял свят!

## Инсталирайте Bootstrap

За да инсталирате Bootstrap, отворете вашия файл `.html` в редактора на кода и го добавете в секцията `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Това не добавя никакви файлове към вашия проект. Той просто сочи файлове, които съществуват в Интернет. Затова продължете напред, отворете уебсайта си и актуализирайте страницата. Ето го!

![Figure 14.1](images/bootstrap1.png)

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
    

Django автоматично ще открива всички папки, наречени 'static', в която и да е от папките на вашите приложения. Тогава той ще може да използва тяхното съдържание като статични файлове.

## Вашият първи CSS файл!

Нека сега създадем CSS файл, за да добавим свой собствен стил към вашата уеб страница. Създайте нова директория, наречена `css` във вашата `static` директория. След това създайте нов файл, наречен `blog.css` вътре в тази директория `css`. Готови?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Време е да напишете малко CSS! Отворете файла `blog/static/css/blog.css` във вашия редактор на код.

Тук няма да навлизаме твърде дълбоко в персонализирането и научаването на CSS. Има препоръка за безплатен CSS курс в края на тази страница, ако искате да научите повече.

Но нека направим поне малко. Може би бихме могли да променим цвета на заглавките си? За да разберат цветовете, компютрите използват специални кодове. Тези кодове започват с `#`, последвани от 6 букви (A–F) и цифри (0–9). Например кодът за синьо е `#0000FF`. Можете да намерите цветовите кодове за много цветове тук: http://www.colorpicker.com/. Можете също така да използвате [предварително определени цветове](http://www.w3schools.com/colors/colors_names.asp), като `червено` и `зелено`.

Във вашия `blog/static/css/blog.css` файл трябва да добавите следния код:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` е CSS селектор. Това означава, че прилагаме стиловете си към всеки `a` елемент вътре в елемент `h1`; селекторът `h2 a` прави същото за елементи `h2`. Така че, когато имаме нещо като `<h1><a href="">връзка</a></h1>`, ще се прилага стилът `h1 a`. В този случай ние му казваме да промени цвета си на `#C25100`, което е тъмно оранжево. Или можете да поставите свой собствен цвят тук, но се уверете, че той има добър контраст на бял фон!

Във CSS файл определяме стилове за елементи в HTML файла. Първият начин да идентифицираме елементите е с името на елемента. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Class and id are names you give the element by yourself. Classes define groups of elements, and ids point to specific elements. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. We just told our template where our CSS file is located.

Your file should now look like this:

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

OK, save the file and refresh the site!

![Figure 14.2](images/color2.png)

Nice work! Maybe we would also like to give our website a little air and increase the margin on the left side? Let's try this!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![Figure 14.3](images/margin2.png)

Maybe we can customize the font in our header? Paste this into your `<head>` in `blog/templates/blog/post_list.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Figure 14.3](images/font.png)

Great!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Add a class called `page-header` to your `div` that contains your header, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

And now add a class `post` to your `div` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

We will now add declaration blocks to different selectors. Selectors starting with `.` relate to classes. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. For now, copy and paste it into your `blog/static/css/blog.css` file:

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

Then surround the HTML code which displays the posts with declarations of classes. Replace this:

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

in the `blog/templates/blog/post_list.html` with this:

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

Save those files and refresh your website.

![Figure 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Ready for the next chapter?! :)