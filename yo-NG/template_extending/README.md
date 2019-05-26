# Mímú kí àwòṣe (template) gbòòrò síi

Nnkan tó dára mìíràn tí Django ní fún ẹ jẹ́ **mímú kí àwòṣe gbòòrò síi**. Kíni èyí túmọ̀sí? Ó túmọ̀ sí pé o lè lo àwọn apá kannáà ti HTML rẹ fún oríṣiríṣi ojú-ìwé ti ààyè ayélujára rẹ.

Àwọn àwòṣe wúlò nígbà tí o bá fẹ́ lo àlàyé tàbí àgbékalẹ̀ kannáà lọ́nà tó ju ẹyọkan lọ. Ìwọ kò nílò láti pààrà ara rẹ nínú gbogbo fáìlì. Àti pé tí o bá fẹ́ ṣàyípadà nnkan kan, ìwọ kò nílò láti ṣeé nínú gbogbo àwòṣe, ẹyọkan ṣoṣo ti tó!

## Ṣẹ̀dá àwòṣe ìpìlẹ̀ kan

Àwòṣe ìpìlẹ̀ kan jẹ́ àwòṣe tó ṣe pàtàkì jù lọ tí o lè mú gbòòrò sórí gbogbo ojú-ìwé ààyè ayélujára rẹ.

Ẹ jẹ́ ká ṣẹ̀dá fáìlì `base.html` kan sínú `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Lẹ́yìn náà ṣí sílẹ̀ nínú olóòtú kóòdù náà kí o sì ṣàdàkọ gbogbo rẹ̀ láti fáìlì `post_list.html` sí `base.html`, bíi èyí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Lẹ́yìn náà nínú `base.html`, rọ́pò gbogbo `<body>` rẹ (gbogbo nnkan tó wà láàrin `<body>` àti `</body>`) pẹ̀lú èyí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    <div class="content container">
        <div class="row">
            <div class="col-md-8">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </div>
</body>
```

{% raw %}O lè ṣàkíyèsí pé èyí rọ́pò gbogbo nnkan láti `{% for post in posts %}` sí `{% endfor %}` pẹ̀lú: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Ṣùgbọ́n kí nìdí? O ṣẹ̀ṣẹ̀ ṣẹ̀dá `block` kan! You used the template tag `{% block %}` to make an area that will have HTML inserted in it. That HTML will come from another template that extends this template (`base.html`). We will show you how to do this in a moment.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}You're going to remove everything above `{% for post in posts %}` and below `{% endfor %}`. When you're done, the file will look like this:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

We want to use this as part of our template for all the content blocks. Time to add block tags to this file!

{% raw %}You want your block tag to match the tag in your `base.html` file. You also want it to include all the code that belongs in your content blocks. To do that, put everything between `{% block content %}` and `{% endblock %}`. Like this:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

Only one thing left. We need to connect these two templates together. This is what extending templates is all about! We'll do this by adding an extends tag to the beginning of the file. Like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

That's it! Save the file, and check if your website is still working properly. :)

> If you get the error `TemplateDoesNotExist`, that means that there is no `blog/base.html` file and you have `runserver` running in the console. Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.