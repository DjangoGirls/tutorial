# การ extend template

ความเจ๋งอีกอย่างหนึ่งของ Django คือ **ความสามารถในการ extend template** มันหมายความว่าไงล่ะ? มันก็หมายความว่า คุณสามารถใช้ส่วนเดียวกันของ HTML ของคุณในหลายๆ หน้าของเว็บไซต์ของคุณ

เทมเพลตช่วยคุณได้ เมื่อคุณต้องการใช้ข้อมูลเดิมหรือเค้าโครงเดียวกันมากกว่าหนึ่งครั้ง คุณไม่ต้องทำซ้ำในทุกๆไฟล์ และถ้าหากคุณต้องการปรับเปลี่ยนบางอย่าง คุณก็ไม่จำเป็นต้องทำในทุกๆเทมเพลต คุณแค่ทำในเทมเพลตเดียวเท่านั้น

## สร้าง template พื้นฐาน

Template พื้นฐาน คือ template ที่เรียบง่ายที่สุด ที่คุณจะสามารถนำไปสร้างเป็นหน้าอื่นในเว็บของคุณได้

สร้างไฟล์ `base.html` ใน `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

จากนั้นเปิดไฟล์และคัดลอกทุกบรรทัดจาก `post_list.html` ไปยังไฟล์ `base.html` แบบนี้:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load staticfiles %}
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

จากนั้น ในไฟล์ `base.html` แทนที่ทุกสิ่งใน `<body>` (ทุกสิ่งระหว่าง `<body>` และ `</body>`) ด้วย:

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

ตอนนี้ บันทึกไฟล์ `base.html` และเปิดไฟล์ `blog/templates/blog/post_list.html` ขึ้นมาอีกครั้ง {% raw %}คุณกำลังจะลบทุกอย่างด้านบน `{% for post in posts %}` และด้านล่าง `{% endfor %}` เมื่อคุณทำสำเร็จ หน้าตาของไฟล์มันจะเป็นแบบนี้: {% endraw %}

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

We want to use this as part of our template for all the content blocks. Time to add block tags to this file!

{% raw %}You want your block tag to match the tag in your `base.html` file. You also want it to include all the code that belongs in your content blocks. To do that, put everything between `{% block content %}` and `{% endblock %}`. แบบนี้:{% endraw %}

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
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

เสร็จแล้ว! ลองเช็คดูว่าเว็บเรายังทำงานอยู่มั้ย :)

> ถ้าคอมพิวเตอร์โชว์ว่า `TemplateDoesNotExist` หมายความว่า มันไม่มีไฟล์ `blog/base.html` และคุณมี `runserver` ที่กำลังรันอยู่ในคอนโซล ลองหยุดการทำงานของเซิร์ฟเวอร์ (โดยกดปุ่ม Ctrl+C - ปุ่ม Ctrl และปุ่ม C พร้อมกัน) และรีสตาร์ทเซิร์ฟเวอร์ด้วยการรันคำสั่ง `python manage.py runserver`