# การขยายเทมแพลต

ความเจ๋งอีกอย่างหนึ่งของ Django คือ **ความสามารถในการขยายเทมเพลต** มันหมายความว่าไงล่ะ? มันก็หมายความว่า คุณสามารถใช้ส่วนเดียวกันของ HTML ของคุณในหลายๆ หน้าของเว็บไซต์ของคุณ

เทมเพลตช่วยคุณได้ เมื่อคุณต้องการใช้ข้อมูลเดิมหรือเค้าโครงเดียวกันมากกว่าหนึ่งครั้ง คุณไม่ต้องทำซ้ำในทุกๆไฟล์ และถ้าหากคุณต้องการปรับเปลี่ยนบางอย่าง คุณก็ไม่จำเป็นต้องทำในทุกๆเทมเพลต คุณแค่ทำในเทมเพลตเดียวเท่านั้น

## สร้างเทมเพลตพื้นฐาน

เทมเพลตพื้นฐาน คือเทมเพลตที่เรียบง่ายที่สุด ที่คุณจะสามารถนำไปสร้างเป็นหน้าอื่นในเว็บของคุณได้

สร้างไฟล์ `base.html` ใน `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

จากนั้น ในไฟล์ `base.html` ให้แทน `<body>` ทั้งหมด (ทุกสิ่งระหว่าง `<body>` และ `</body>`) ด้วย:

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

{% raw %} คุณอาจจะสังเกตว่ามันแทนที่ทุกๆอย่างตั้งแต่ `{% for post in posts %}` ไปจนถึง `{% endfor %}` ด้วย: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

แต่ทำไมล่ะ? คุณเพิ่งสร้าง `block` นี่นา! คุณใช้ template tag `{% block %}` ในการสร้างพื้นที่ที่จะแทรก HTML ไว้ ซึ่ง HTML นั้นจะมาจากอีกเทมเพลตนึงที่ขยายเทมเพลตนี้ (`base.html`) เดี๋ยวเราจะแสดงให้คุณเห็นว่าคุณควรทำยังไง

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}คุณกำลังจะลบทุกอย่างก่อน `{% for post in posts %}` และหลัง`{% endfor %}` เมื่อคุณทำสำเร็จ หน้าตาของไฟล์มันจะเป็นแบบนี้: {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

เราต้องการใช้ข้อมูลนี้เป็นส่วนหนึ่งของเทมเพลตของเราสำหรับบล็อกเนื้อหาทั้งหมด ได้เวลาเพิ่มแท็กบล็อคในไฟล์นี้แล้ว!

{% raw %}คุณจะต้องให้แท็กบล็อกของคุณเหมือนกับแท็กในไฟล์ `base.html` คุณยังต้องรวมโค้ดทั้งหมดที่อยู่ในบล็อคเนื้อหาของคุณ ในการจะทำแบบนั้น เราต้องใส่ทุกอย่างลงไประหว่าง `{% block content %}` และ `{% endblock %}` แบบนี้:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

ตอนนี้ก็เหลือแค่อย่างเดียวที่เราต้องทำ ก็คือการเชื่อมเทมเพลตสองอันนี้เข้าด้วยกัน นี่แหละคือทั้งหมดของการขยายเทมเพลต เราจะทำโดยเพิ่มแท็กขยายลงในตอนต้นของไฟล์ แบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

That's it! Save the file, and check if your website is still working properly. :)

> ถ้าคอมพิวเตอร์โชว์ว่า `TemplateDoesNotExist` หมายความว่า มันไม่มีไฟล์ `blog/base.html` และคุณมี `runserver` ที่กำลังรันอยู่ในคอนโซล ลองหยุดการทำงานของเซิร์ฟเวอร์ (โดยกดปุ่ม Ctrl+C - ปุ่ม Ctrl และปุ่ม C พร้อมกัน) และรีสตาร์ทเซิร์ฟเวอร์ด้วยการรันคำสั่ง `python manage.py runserver`