# تمديد القالب

شيء جميل آخر يقدمه جانغو لك هو **تمديد القالب **. ماذا يعني هذا؟ هذا يعني أنه يمكنك استخدام الأجزاء نفسها من HTML لصفحات مختلفة من موقعك على الويب.

القوالب تساعدك عندما تريد استخدام نفس الشكل او المعلومات اكثر من مرة او في اكثر من مكان. ليس عليك تكرار نفسك في كل ملف. وإذا كنت ترغب في تغيير شيء ما، ليس عليك تغيره في كل قالب, بل ستغيره في قالب واحد!

## أنشئ القالب الرئيسي

القالب الرئيسي هو قالب اساسي والذي ستقوم بتمديده اثناء استخدامه في اي صفحة من موقعك.

لنقم بإنشاء ملف `base.html` في `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

بعد ذلك افتحه في محرر الأكواد وانسخ كل شي من `post_list.html` إلى ملف `base.html` ، هكذا:

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

ثم في `base.html`، استبدل 1 (كل شيء بين 1 و `</body>`) مع هذا:

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

{% raw %}قد تلاحض ان هذا قد غير `{% for post in posts %}` إلى `{% endfor %}` ب: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}{% endblock %}
```

لكن لماذا؟ لقد انشأت `كتلة`! استخدمت علامة القالب `{% block %}` لإنشاء منطقة التي ستضع فيها إتش تي أم ال HTML. ذاك HTML قادم من قالب اخر الذي قام بتمديد هذا القالب (`base.html`). نحن سنريك طريقة فعل ذالك خلال لحضات.

والآن احفظ `base.html` وافتح ملفك `blog/templates/blog/post_list.html` مرة أخرى في محرر الأكواد {% raw %}ستحتاج لحدف كل شي فوق `{% for post in posts %}` وتحت `{% endfor %}`. عند الانتهاء من ذلك، الملف سيبدو هكذا:{% endraw %}

{% filename %}blog/templates/blog/list.html{% endfilename %}

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

نريد أن نستخدم هذه كجزء من قالبنا لجميع كتل المحتوى. حان الوقت لإضافة علامات الكتل لهذا الملف!

{% raw %}You تريد لعلامة كتلتك ان تطابق العلامة في ملف `base.html`. تحتاج أيضا ان تشمل كافة التعليمات البرمجية التي تنتمي إليها في كتل المحتوى الخاص بك. للقيام بذلك، ضع كل شيء بين `{% block content %}` و `{% endblock %}`. مثل هذا: {% endraw %}

{% filename %}blog/templates/blog/list.html{% endfilename %}

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

بقي شيء واحد فقط. نحن بحاجة إلى ربط هذين القالبين معا. هذا ما نقصد به توسيع القوالب! سنفعل ذلك عن طريق إضافة علامة تمديد إلى بداية الملف. مثال:

{% filename %}blog/templates/blog/list.html{% endfilename %}

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

That's it! Save the file, and check if your website is still working properly. :)

> اذا حصلت على هذا الخطأ `TemplateDoesNotExist`، وهذا يعني انه ليس هناك ملف`blog/base.html` ولديك `runserver` يشتغل في الكونسول. حاول إيقافه (بالضغط على Ctrl+C - مفتاح التحكم و C معا) وإعادة تشغيله من خلال تشغيل أمر  python manage.py runserver </ 0>.</p>
</blockquote>