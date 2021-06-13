# Ձևանմուշի ընդլայնում/Template extending

Django- ի մեկ այլ օգտակար բան **template extending/ձևանմուշի ընդլայնումն է ** : Ինչ է դա նշանակում? Ձեր կայքի տարբեր էջերիի համար կարող եք օգտագործել HTML- ի նույն մասերը: 

Ձևանմուշներն/Templates օգնում են, երբ ուզում եք նույն տեղեկատվությունը կամ դասավորությունը օգտագործել մեկից ավելի վայրերում: Յուրաքանչյուր ֆայլում հարկավոր չէ կրկնել: Եվ եթե ուզում եք ինչ-որ բան փոխել, ապա հարկավոր չէ դա անել յուրաքանչյուր ձևանմուշում, այլ միայն մեկում:

## Ստեղծեք բազային ձևանմուշ/ base template

Բազային ձևանմուշը/base template ամենահիմնական ձևանմուշն է, որը դուք տարածում եք ձեր կայքի յուրաքանչյուր էջում:

Եկեք ստեղծենք `base.html` ֆայլ `blog/templates/blog/`-ում:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Դրանից հետո բացեք այն կոդերի խմբագրում և պատճենեք ամեն ինչ ՝ `post_list.html` - ից `base.html` ֆայլը, ինչպես սա:

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

Դրանից հետո `base.html`- ում փոխարինեք ձեր ամբողջ `<body>` -ը (ամեն ինչ `<body>` և `</body> ` - ի միջև) հետևյալով.

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

{% raw%} Ինչպես նկատեցիք, մենք փոխարինեցինք ամեն ինչ ՝ սկսած `{% for post in posts %}`-ը, `{% endfor %}` - ով փոխարինելով ՝ {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Բայց ինչու՞ Դուք հենց նոր `block/բլոկ` ստեղծեցիք: Դուք օգտագործեցիք `{% block %}` ձևանմուշի պիտակը ՝ տարածք ստեղծելու համար, որտեղ կտեղադրվի HTML-ը : Այդ HTML- ը կգա մեկ այլ ձևանմուշից, որը տարածում է այս ձևանմուշը (`base.html`): Մենք ձեզ ցույց կտանք, թե ինչպես դա անել մեկ վայրկյանում:

Այժմ պահպանեք `base.html`- ը և նորից բացեք ձեր `blog/templates/blog/post_list.html` կոդերի խմբագրում: {% raw %}Դուք պատրաստվում եք հեռացնել ամեն ինչ, որը գտնվում է `{% for post in posts %}`-ից վերևում, և `{% endfor %}`-ից ներքևում: Ավարտելուց հետո ֆայլն այսպիսի տեսք կունենա.{% endraw %}

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

Մենք ուզում ենք սա օգտագործել որպես մեր ձևանմուշի մի մաս ՝ բովանդակության բոլոր բլոկների համար: Ժամանակն է այս ֆայլին ավելացնել բլոկի պիտակները/block tags:

{% raw %} Դուք ցանկանում եք, որ ձեր բլոկի թեգը համընկնի `base.html` ֆայլի պիտակի/ tag-ի հետ: Դուք նաև ցանկանում եք ներառել ամբողջ ծածկագիրը, որը պատկանում է բովանդակության բլոկներին/content blocks: Դա անելու համար ամեն ինչ տեղադրեք{% block content %} - ի և {% endblock %} - ի միջև: Սրա նման. {% endraw %}

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

Մնում է միայն մեկ բան. Մենք պետք է այս երկու ձևանմուշները միացնենք միմյանց: Սա այն է, ինչ կոչվում է «ձևանմուշի ընդլայնում/extending templates»: Մենք դա կանենք ՝ ֆայլի սկզբին ընդլայնման պիտակ/ extends tag ավելացնելով: Սրա նման:

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

Վերջ Պահեք ֆայլը և ստուգեք, արդյոք ձեր կայքը դեռ պատշաճ կերպով աշխատում է: :) 

> Եթե `TemplateDoesNotExist` սխալ եք ստանում, դա նշանակում է, որ `blog/base.html` ֆայլը բացակայում է, և դուք ունեք `runserver` վահանակում: Փորձեք դադարեցնել այն (միաժամանակ սեղմելով Ctrl + C - Control և C ստեղները) և վերագործարկեք սերվերը `python manage.py runserver` հրամանի միջոցով: