# CSS – make it pretty!

อุต๊ะ บล๊อคของเราทำไมดูน่าเกลียดอย่างนี้ ได้เวลาที่จะทำให้มันดีขึ้น เราจะใช้ CSS สำหรับการปรับแต่ง

## อะไรคือ CSS?

Cascading Style Sheets (CSS) is a language used for describing the look and formatting of a website written in a markup language (like HTML). Treat it as make-up for our web page. ;)

But we don't want to start from scratch again, right? Once more, we'll use something that programmers released on the Internet for free. Reinventing the wheel is no fun, you know.

## Bootstrap คือคำตอบ!

Bootstrap is one of the most popular HTML and CSS frameworks for developing beautiful websites: https://getbootstrap.com/

It was written by programmers who worked for Twitter. Now it's developed by volunteers from all over the world!

## ติดตั้ง Bootstrap

To install Bootstrap, you need to add this to your `<head>` in your `.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. Just go ahead, open your website and refresh the page. Here it is!

![รูปที่ 14.1](images/bootstrap1.png)

ดูดีขึ้นแล้ว!

## Static files ใน Django

ในที่สุดเราก็จะได้ดูสิ่งที่เราเรียกกันว่า **static file** Static files are all your CSS and images. Their content doesn't depend on the request context and will be the same for every user.

### แล้วจะเราเก็บไฟล์ static ไว้ที่ไหนสำหรับ Django

Django already knows where to find the static files for the built-in "admin" app. Now we just need to add some static files for our own app, `blog`.

เราสามารถทำแบบนั้นได้โดยสร้างโฟลเดอร์ชื่อ `static` ข้างในแอป blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite
    

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## ไฟล์ CSS แรกของคุณ!

Let's create a CSS file now, to add your own style to your web page. สร้างไดเรกทอรีชื่อ `css` ข้างในไดเรกทอรี `static` ของคุณ จากนั้นสร้างไฟล์ใหม่ชื่อ `blog.css` ข้างในไดเรกทอรี `css` เมื่อสักครู่ พร้อมหรือยัง?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

ได้เวลาเขียน CSS กันแล้ว! เปิดไฟล์ `blog/static/css/blog.css` ด้วยตัวแก้ไขโค้ดของคุณ

We won't be going too deep into customizing and learning about CSS here. It's pretty easy and you can learn it on your own after this workshop. There is a recommendation for a free course to learn more at the end of this page.

แต่ตอนนี้เราจะลองตกแต่งสักเล็กน้อย บางทีเราอาจจะลองเปลี่ยนสีข้อความส่วนหัวของเรา? การจะเข้าใจสีนั้น คอมพิวเตอร์จะใช้รหัสพิเศษ These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). For example, the code for blue is `#0000FF`. You can find the color codes for many colors here: http://www.colorpicker.com/. You may also use [predefined colors](http://www.w3schools.com/colors/colors_names.asp), such as `red` and `green`.

ในไฟล์ `blog/static/css/blog.css` ของคุณ ควรเพิ่มโค้ดต่อไปนี้ลงไป:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` คือการเลือกโดย CSS This means we're applying our styles to any `a` element inside of an `h1` element. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. ในกรณีนี้ คือการบอกว่า เราต้องการให้เปลี่ยนสีให้เป็นรหัส `#FCA205` ซึ่งคือสีส้มนั่นเอง แน่นอนว่าคุณสามารถเปลี่ยนเป็นสีที่คุณต้องการได้นะ!

ในไฟล์ CSS เราจะกำหนดลักษณะรูปแบบต่างๆ ให้กับองค์ประกอบที่อยู่ในไฟล์ HTML The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. class และ id คือชื่อที่คุณตั้งให้กับองค์ประกอบในหน้าเว็บเอง class กำหนดกลุ่มขององค์ประกอบ และ id ระบุไปยังองค์ประกอบที่จำเพาะเจาะจง For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

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

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may override code in Bootstrap files. ตรงนี้เราบอก tempate ไปว่าจะหาไฟล์ CSS ของเราได้จากที่ไหน

ตอนนี้ ไฟล์ของคุณควรมีหน้าตาแบบนี้:

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

โอเค บันทึกไฟล์และโหลดหน้าเว็บอีกครั้ง!

![รูปที่ 14.2](images/color2.png)

คุณเก่งมาก! บางทีเราอาจต้องการให้เว็บของเรามีพื้นที่ส่วนขอบด้านซ้ายสักเล็กน้อยไหม? ลองนี่!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![รูปที่ 14.3](images/margin2.png)

บางที เราอยากจะปรับแต่งแบบอักษรในส่วนหัวของเรา? ลองเพิ่มบรรทัดนี้ใน `<head>` ในไฟล์ `blog/templates/blog/post_list.html`:

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

![รูปที่ 14.3](images/font.png)

ดีงาม!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

มาตั้งชื่อให้กับบางส่วนในโค้ด HTML กัน เพิ่ม class ชื่อ `page-header` ให้กับ `div` ซึ่งมีส่วนหัวของโพสต์คุณ เช่น:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

และตอนนี้ เพิ่ม class `post` ให้กับ `div` ที่มีบล็อกโพสต์

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

เราจะเพิ่มส่วนประกาศ ที่จะใช้เลือกในแต่ละบล็อคที่เราได้กำหนด ตัวเลือกที่เริ่มต้นด้วยเครื่องหมายจุด `.` จะใช้กับการเลือก class There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. สำหรับตอนนี้ คัดลอกและวางลงในไฟล์ `blog/static/css/blog.css` ของคุณ:

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

จากนั้นแทนที่โค้ด HTML ที่แสดงโพสต์ของเราด้วยโค้ดที่เราได้ทำกับปรับแต่งหน้าตา:

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

ในไฟล์ `blog/templates/blog/post_list.html` ด้วยโค้ดนี้:

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

บันทึกไฟล์และโหลดหน้าเว็บอีกครั้ง

![รูปที่ 14.4](images/final.png)

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

พร้อมสำหรับบทต่อไปหรือยัง?! :)