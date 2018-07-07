# Django templates

ได้เวลาแสดงข้อมูลกันบ้างแล้ว! Django นั้นให้เครื่องมือที่ทำงานนี้ได้อย่างสะดวก นั้นคือ **template tags**

## แล้วอะไรคือ template tags?

ใน HTML นั้น คุณไม่สามารถเขียนโค้ด Python ลงไปได้ เพราะเบราว์เซอร์ไม่เข้าใจภาษา Python พวกมันเข้าใจเฉพาะ HTML เรารู้ว่า HTML นั้นข้อมูลจะเป็นแบบ static (คือเป็นเว็บที่มีการแสดงผลได้อย่างเดียว) ขณะที่ Python นั้นจะเป็นแบบ dynamic มากกว่า (คือเป็นเว็บที่มีการตอบโต้ รับส่งข้อมูลระหว่างตัวเว็บกับผู้เข้าชม)

**Django template tags** นั้นทำให้เราสามารถใช้โค้ดที่เหมือนกับ Python ให้เป็น HTML, ดังนั้นคุณสามารถสร้างหน้าเว็บแบบไดนามิกอย่างรวดเร็วและง่ายขึ้น เจ๋งสุดๆ!

## แสดง template รายการโพสต์

ในบทที่แล้ว เราส่งรายการของโพสต์จากในตัวแปร `posts` ไปยัง template และตอนนี้เราจะแสดงรายการโพสต์ออกมาในรูปแบบ HTML

การจะแสดงผลค่าตัวแปรใน Django template เราจะใช้วงเล็บก้ามปูสองอัน ที่มีชื่อตัวแปรอยู่ข้างใน แบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

ลองแก้ไขไฟล์ template `blog/templates/blog/post_list.html` แทนที่ทุกอย่างจาก `<div>` ที่สอง ไปจนถึง `</div>` ที่สาม โดยแทนที่ด้วย `{{ posts }}` บันทึกไฟล์และโหลดหน้าเว็บอีกครั้งเพื่อดูผลลัพธ์:

![รูปที่ 13.1](images/step1.png)

อย่างที่คุณเห็น เราได้ผลลัพธ์แบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

ตรงนี้หมายความว่า Django สามารถเข้าใจและรู้ว่านี่คือรายการวัตถุ ยังจำวิธีที่เราแสดงรายการจากในบท **แนะนำให้รู้จัก Python** ได้ไหม? ใช่แล้ว ใช้การวนลูปไง! ใน Django template เราสามารถทำแบบนี้ได้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

ลองแบบนี้ใน template ของคุณ

![รูปที่ 13.2](images/step2.png)

มันทำงานถูกต้อง! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. คุณสามารถผสมผสานการใช้ HTML กับ template tag ในส่วน `body` จะมีหน้าตาแบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
```

{% raw %}ทุกสิ่งที่คุณใส่ไประหว่าง `{% for %}` และ `{% endfor %}` จะถูกทำซ้ำหลายรอบตามจำนวนวัตถุในรายการ โหลดหน้าเว็บอีกครั้ง:{% endraw %}

![รูปที่ 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? เราเข้าถึงแต่ละข้อมูลที่ได้สร้างไว้ในโมเดล `Post` ของเรา Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## ส่วนสุดท้าย

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* จากนั้นไปที่ [PythonAnywhere](https://www.pythonanywhere.com/consoles/) และไปยังส่วน **Bash console** (หรือเปิดอันใหม่) และรันคำสั่ง:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* สุดท้าย ไปยัง [Web tab](https://www.pythonanywhere.com/web_app_setup/) และกดปุ่ม **Reload** บนเว็บของคุณ การแก้ไขของคุณจะปรากฎเป็นล่าสุดแล้ว! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

ยินดีด้วย! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![รูปที่ 13.4](images/donut.png)