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
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
          <div class="container">
              <h1><a href="/">Django Girls Blog</a></h1>
          </div>
        </header>

        <main class="container">
            <div class="row">
                <div class="col">
                {% for post in posts %}
                    <article class="post">
                        <time class="date">
                            {{ post.published_date }}
                        </time>
                        <h2><a href="">{{ post.title }}</a></h2>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </article>
                {% endfor %}
                </div>
            </div>
        </main>
    </body>
</html>
```

Lẹ́yìn náà nínú `base.html`, rọ́pò gbogbo `<body>` rẹ (gbogbo nnkan tó wà láàrin `<body>` àti `</body>`) pẹ̀lú èyí:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <header class="page-header">
      <div class="container">
          <h1><a href="/">Django Girls Blog</a></h1>
      </div>
    </header>
    <main class="container">
        <div class="row">
            <div class="col">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </main>
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
    <article class="post">
        <time class="date">
            {{ post.published_date }}
        </time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

A fẹ́ lo èyí gẹ́gẹ́ bí ara àwòṣe wa fún gbogbo àwọn búlọ́ọ̀kù àkóónú náà. Àkókò láti ṣàfikún àwọn àmì búlọ́ọ̀kù sí fáìlì yìí!

{% raw %}O fẹ́ kí àmì búlọ́ọ̀kù rẹ dọ́gba pẹ̀lú àmì tó wà nínú fáìlì `base.html` rẹ. O tún fẹ́ kí ó ní gbogbo kóòdù tó wà nínú àwọn búlọ́ọ̀kù àkóónú rẹ. Láti ṣe ìyẹn, kó gbogbo rẹ̀ sí àárín `{% block content %}` àti `{% endblock %}`. Báyìí:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Nnkan kan ṣoṣo ló kù. A nílò láti ṣe ìsopọ̀ àwọn àwòṣe méjèèjì wọ̀nyí papọ̀. Èyí ni ohun tí ṣíṣe ìmúgbòòrò àwọn àwòṣe dá lé lórí! A ó ṣe èyí nípasẹ̀ ṣíṣe àfikún àmì ìmúgbòòrò kan sí ìbẹ̀rẹ̀ fáìlì náà. Báyìí:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Ó parí! Tọ́jú fáìlì náà, kí o sì ṣàyẹ̀wò tí ààyè ayélujára rẹ bá sì n ṣiṣẹ́ dáadáa. :)

> Tí o bá rí àṣìṣe `TemplateDoesNotExist`, ìyẹn túmọ̀ sí pé kò sí fáìlì `blog/base.html` àti pé o ní `runserver` tó n ṣiṣẹ́ nínú console náà. Gbìyànjú láti dá a dúró (nípasẹ̀ títẹ̀ Ctrl+C – àwọn bọ́tìnnì Control àti C papọ̀) kí o sì tun bẹ̀rẹ̀ nípasẹ̀ lílo àṣẹ `python manage.py runserver` kan.