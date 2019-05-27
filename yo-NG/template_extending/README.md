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

Ṣùgbọ́n kí nìdí? O ṣẹ̀ṣẹ̀ ṣẹ̀dá `block` kan! O ti lo àmì àwòṣe `{% block %}` náà láti ṣe agbègbè kan tí a ó fi HTML sínú rẹ̀. HTML yẹn yíò wá láti àwòṣe mìíràn tí yíò mú àwòṣe yìí gbòòrò (`base.html`). A ó fi hàn ọ́ bí o ṣe lè se èyí ní ìṣẹ́jú kan.

Ní báyìí tọ́jú `base.html` kí o ṣí `blog/templates/blog/post_list.html` rẹ lẹ́ẹ̀kan síi nínú olóòtú kóòdù náà. {% raw %}Ìwọ yóò yọ gbogbo nnkan tó wà lókè `{% for post in posts %}` àti nísàlẹ̀ `{% endfor %}` kúrò. Nígbà tí o bá parí, fáìlì náà yíò rí báyìí:{% endraw %}

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

A fẹ́ lo èyí gẹ́gẹ́ bí ara àwòṣe wa fún gbogbo àwọn búlọ́ọ̀kù àkóónú náà. Àkókò láti ṣàfikún àwọn àmì búlọ́ọ̀kù sí fáìlì yìí!

{% raw %}O fẹ́ kí àmì búlọ́ọ̀kù rẹ dọ́gba pẹ̀lú àmì tó wà nínú fáìlì `base.html` rẹ. O tún fẹ́ kí ó ní gbogbo kóòdù tó wà nínú àwọn búlọ́ọ̀kù àkóónú rẹ. Láti ṣe ìyẹn, kó gbogbo rẹ̀ sí àárín `{% block content %}` àti `{% endblock %}`. Báyìí:{% endraw %}

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

Nnkan kan ṣoṣo ló kù. A nílò láti ṣe ìsopọ̀ àwọn àwòṣe méjèèjì wọ̀nyí papọ̀. Èyí ni ohun tí ṣíṣe ìmúgbòòrò àwọn àwòṣe dá lé lórí! A ó ṣe èyí nípasẹ̀ ṣíṣe àfikún àmì ìmúgbòòrò kan sí ìbẹ̀rẹ̀ fáìlì náà. Báyìí:

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

Ó parí! Tọ́jú fáìlì náà, kí o sì ṣàyẹ̀wò tí ààyè ayélujára rẹ bá sì n ṣiṣẹ́ dáadáa. :)

> If you get the error `TemplateDoesNotExist`, that means that there is no `blog/base.html` file and you have `runserver` running in the console. Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.