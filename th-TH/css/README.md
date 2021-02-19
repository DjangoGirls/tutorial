# CSS - จับแต่งหน้าให้สวยปิ๊ง!

อุต๊ะ บล๊อคของเราทำไมดูน่าเกลียดอย่างนี้ ได้เวลาที่จะทำให้มันดีขึ้น เราจะใช้ CSS สำหรับการปรับแต่ง

## อะไรคือ CSS?

Cascading Style Sheets (CSS) เป็นภาษาที่ใช้สำหรับอธิบายลักษณะ และรูปแบบของเว็บไซต์ที่ถูกเขียนในรูปภาษามาร์กอับ (เช่น HTML) อาจจะเรียกมันว่า เป็น make-up สำหรับเว็บไซต์ก็ได้นะ. ;)

แต่เราไม่อยากเริ่มใหม่ตั้งแต่ต้นอีกครั้งใช่ไหม? เราจะใช้สิ่งที่โปรแกรมเมอร์ปล่อยออกมาบนอินเทอร์เน็ตฟรี การสร้างล้อใหม่ไม่สนุกคุณก็รู้

## Bootstrap คือคำตอบ!

Bootstrap เป็นหนึ่งใน frameworks ภาษา HTML และ CSS ที่ได้รับความนิยมอย่างสูงสำหรับการพัฒนาเว็บไซด์ให้สวยงาม: http://getbootstrap.com/

มันถูกเขียนโดยเหล่าโปรแกรมเมอร์ที่เคยทำงานให้กับ Twitter และตอนนี้ได้ถูกพัฒนาต่อโดยอาสาสมัครจากทั่วทุกมุมโลก!

## ติดตั้ง Bootstrap

To install Bootstrap, open up your `.html` file in the code editor and add this to the `<head>` section:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![รูปที่ 14.1](images/bootstrap1.png)

ดูดีขึ้นแล้ว!

## Static files ใน Django

ในที่สุดเราก็จะได้ดูสิ่งที่เราเรียกกันว่า **static file** Static files คือ ไฟล์บรรจุ CSS และ รูปภาพต่างๆ ของคุณทั้งหมด Their content doesn't depend on the request context and will be the same for every user.

### แล้วจะเราเก็บไฟล์ static ไว้ที่ไหนสำหรับ Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

เราสามารถทำแบบนั้นได้โดยสร้างโฟลเดอร์ชื่อ `static` ข้างในแอป blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django จะค้นหาโฟลเดอร์ชื่อ "static" ในทุกโฟลเดอร์ของแอป โดยอัตโนมัติ แล้วจะใช้ข้อมูลที่อยู่ในตัวของมันเป็น static files ได้

## ไฟล์ CSS แรกของคุณ!

มาสร้างไฟล์ CSS กัน! เพื่อให้หน้าเว็บของคุณสวยปิ๊ง สร้างไดเรกทอรีชื่อ `css` ข้างในไดเรกทอรี `static` ของคุณ จากนั้นสร้างไฟล์ใหม่ชื่อ `blog.css` ข้างในไดเรกทอรี `css` เมื่อสักครู่ พร้อมหรือยัง?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

ได้เวลาเขียน CSS กันแล้ว! เปิดไฟล์ `blog/static/css/blog.css` ด้วยตัวแก้ไขโค้ดของคุณ

ในที่นี้เราจะไม่ลงรายละเอียดไปถึงการปรับแต่งและการเรียนเกี่ยวกับ CSS ที่ลึกมากเกินไป ที่ด้านล่างของเพจนี้จะมีรายละเอียดเกี่ยวกับคอร์ส CSS ฟรี ถ้าคุณต้องการที่จะเรียนรู้เพิ่มเติม

แต่ตอนนี้เราจะลองตกแต่งสักเล็กน้อย Maybe we could change the color of our headers? การจะเข้าใจสีนั้น คอมพิวเตอร์จะใช้รหัสพิเศษ โค้ดเหล่านี้ขึ้นต้นด้วย `#` แล้วตามด้วยตัวอักษร 6 ตัว (A ถึง F) และตัวเลข (0 ถึง 9) ตัวอย่างเช่น โค้ดสำหรับสีฟ้าคือ `#0000FF` คุณสามารถหารหัสสีต่างๆได้จากเว๊บนี้ http://www.colorpicker.com/ คุณอาจใช้ [สีที่กำหนดไว้แล้ว](http://www.w3schools.com/colors/colors_names.asp) เช่น `red` และ `green`.

ในไฟล์ `blog/static/css/blog.css` ของคุณ ควรเพิ่มโค้ดต่อไปนี้ลงไป:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` คือการเลือกโดย CSS This means we're applying our styles to any `a` element inside of an `h1` element; the `h2 a` selector does the same thing for `h2` elements. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. In this case, we're telling it to change its color to `#C25100`, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!

ในไฟล์ CSS เราจะกำหนดลักษณะรูปแบบต่างๆ ให้กับองค์ประกอบที่อยู่ในไฟล์ HTML The first way we identify elements is with the element name. You might remember these as tags from the HTML section. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. class และ id คือชื่อที่คุณตั้งให้กับองค์ประกอบในหน้าเว็บเอง class กำหนดกลุ่มขององค์ประกอบ และ id ระบุไปยังองค์ประกอบที่จำเพาะเจาะจง ตัวอย่างเช่น tag ต่อไปนี้อาจะถูกระบุโดย Css โดยใช้ ชื่อ tag `a`, class `external_link`, หรือ id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

คุณสามารถอ่านเพิ่มเติมได้ที่นี่ [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp)

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

The browser reads the files in the order they're given, so we need to make sure this is in the right place. Otherwise the code in our file may be overriden by code in Bootstrap files. ตรงนี้เราบอก tempate ไปว่าจะหาไฟล์ CSS ของเราได้จากที่ไหน

ตอนนี้ ไฟล์ของคุณควรมีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        {% for post in posts %}
            <article>
                <time>published: {{ post.published_date }}</time>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </article>
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

แอดนี่ไปยัง CSS ของคุณ บันทึกไฟล์แล้วดูว่ามันใช้งานได้มั้ย!

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
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![รูปที่ 14.3](images/font.png)

ดีงาม!

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

Go ahead and name some parts of the HTML code. Replace the `header` that contains your header with the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

And now add a class `post` to your `article` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

เราจะเพิ่มส่วนประกาศ ที่จะใช้เลือกในแต่ละบล็อคที่เราได้กำหนด ตัวเลือกที่เริ่มต้นด้วยเครื่องหมายจุด `.` จะใช้กับการเลือก class มีเว็บที่มีบทเรียนดีๆที่สอนและอธิบายเกี่ยวกับ CSS อยู่มากมาย ที่จะช่วยคุณเข้าใจโค้ดด้านล่างนี้ For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    margin-bottom: 40px;
    padding: 20px 20px 20px 40px;
}

.page-header h1,
.page-header h1 a,
.page-header h1 a:visited,
.page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

h1,
h2,
h3,
h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea,
.post-form input {
    width: 100%;
}

.top-menu,
.top-menu:hover,
.top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a,
.post h2 a:visited {
    color: #000000;
}

.post > .date,
.post > .actions {
    float: right;
}

.btn-default,
.btn-default:visited {
    color: #C25100;
    background: none;
    border-color: #C25100;
}

.btn-default:hover {
    color: #FFFFFF;
    background-color: #C25100;
}
```

จากนั้นแทนที่โค้ด HTML ที่แสดงโพสต์ของเราด้วยโค้ดที่เราได้ทำกับปรับแต่งหน้าตา:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

ในไฟล์ `blog/templates/blog/post_list.html` ด้วยโค้ดนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
```

บันทึกไฟล์และโหลดหน้าเว็บอีกครั้ง

![รูปที่ 14.4](images/final.png)

วู้ฮู้! มันดูเจ๋งสุดๆเลยใช่มั้ยล่ะ? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. คุณจะเปลี่ยนตรงไหนถ้าคุณอยากจะทำให้วันที่เปลี่ยนเป็นสีฟ้าเทอร์คอยซ์?

Don't be afraid to tinker with this CSS a little bit and try to change some things. ลองเล่นกับ CSS แล้วมันจะช่วยให้คุณเข้าใจว่าสิ่งต่างๆทำงานยังไง ถ้าคุณทำมันเจ๊ง ก็ไม่ต้องห่วง คุณสามารถใช้คำสั่งย้อนกลับ (undo) ได้!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

พร้อมสำหรับบทต่อไปหรือยัง?! :)