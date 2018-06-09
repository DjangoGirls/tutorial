# แนะนำให้รู้จัก HTML

อะไรคือ template คุณอาจสงสัย?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## HTML คืออะไร?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML ย่อมาจาก "HyperText Markup Language" **HyperText** หมายถึง เป็นชนิดของข้อความที่มีการเชื่อมโยงไปหน้าเว็บอื่นๆ ได้ **Markup** หมายถึง เราทำเครื่องหมายสักอย่างไว้ที่เอกสารด้วยโค้ดเพื่อทำบางอย่าง (ในที่นี้ เบราว์เซอร์) หรือวิธีการแปลงหน้าเพจ HTML โค้ด สร้างขึ้นจาก **tag** แต่ละ tag เริ่มต้นด้วย `<` และลงท้ายด้วย `>` tag เหล่านี้ถูกทำเครื่องหมายว่าเป็น **element**.

## template แรกของคุณ!

การสร้าง template ที่ว่า คือการสร้างไฟล์ template ทุกอย่างล้วนคือไฟล์ ถูกไหม? คุณคงสังเกตเห็นแล้ว

template ทั้งหลายนั้นถูกบันทึกไว้ที่ไดเรกทอรี `blog/templates/blog` ดังนั้น เราจะสร้างไดเรกทอรีชื่อ `templates` ข้างในไดเรกทอรี blog ของคุณ จากนั้นสร้างไดเรกทอรีเพิ่ม ชื่อ `blog` ข้างในไดเรกทอรี template เมื่อครู่:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

ตอนนี้ให้สร้างไฟล์ `post_list.html` (ยังไม่ต้องมีอะไรข้างใน) ข้างในไดเรกทอรี `blog/templates/blog`

มาดูกันว่าตอนนี้เว็บเราแสดงผลยังไง: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![รูปที่ 11.1](images/step1.png)

ไม่มีข้อผิดพลาดแล้ว! ขอแสดงความยินดี :) อย่างไรก็ตาม เว็บของคุณก็ยังไม่มีอะไรใดๆ นอกจากหน้าว่างเปล่า เพราะว่า template ของคุณยังไม่มีอะไรข้างใน เราต้องแก้ไขมัน

ลองเพิ่มบรรทัดเหล่านี้ลงในไฟล์ template:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![รูปที่ 11.2](images/step3.png)

มันทำงานแล้ว! ทำได้ดีมาก :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. อย่างที่คุณเห็น เนื้อหาทั้งหมดของเว็บไซต์ เกิดขึ้นระหว่าง tag เริ่มต้น `<html>` และปิดท้ายด้วย tag `</html>`
* `<p>` คือ tag สำหรับองค์ประกอบที่เป็น ย่อหน้า; `</p>` ปิดแต่ละย่อหน้า

## Head and body

ในแต่หน้า HTML ถูกแบ่งเป็นสองส่วน: **head** และ **body**.

* **head** คือส่วนของข้อมูลต่างๆ ที่เกี่ยวกับเอกสาร แต่ไม่ปรากฎหรือแสดงผลบนหน้าจอ

* **body** คือส่วนที่เหลือทั้งหมดที่แสดงผลอยู่บนหน้าเว็บเพจ

เราใช้ `<head>` เพื่อบอกเบราว์เซอร์เกี่ยวกับการกำหนดค่าต่างๆ ของหน้าเพจ และ `<body>` บอกเกี่ยวกับเนื้อหาบนหน้าเว็บจริงๆ

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

บันทึกไฟล์และโหลดหน้าเว็บอีกครั้ง

![รูปที่ 11.3](images/step4.png)

สังเกตดูว่า เบราว์เซอร์เข้าใจว่า "Ola's blog" นั้คือ title ของหน้าเว็บคุณไหม? เบราว์เซอร์ ได้ทำการแปล `<title>Ola's blog</title>` และแทนที่ข้อความบนแถบ title บนเบราว์เซอร์คุณ (และถูกใช้เมื่อเราทำที่คั่นหน้าด้วยเช่นกัน)

บางทีคุณจะสังเกตเห็นเช่นกันว่าแต่ละ tag ที่เปิดนั้นจะมีการ *ปิด tag* โดยใช้ `/` แต่ละองค์กระกอบจะอยู่ *ข้างใน* (เช่น ไม่สามารถปิด tag ได้จนกว่า ทุก tag ที่อยู่ข้างในมันเองจะยังไม่ได้ปิด)

เหมือนกับการใส่สิ่งของลงในกล่อง คุณมีหนึ่งกล่องใหญ่ `<html></html>`; ข้างในนั้นคือ `<body></body>` และมีกล่องเล็กๆ อยู่ข้างใน: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## ปรับแต่ง template ของคุณ

ตอนนี้คุณจะได้สนุกกับการปรับแต่งและลองแก้นิดๆ หน่อยๆ ใน template ของคุณ! และนี่คือ tag ที่น่าสนใจที่จะลองเล่น:

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` สำหรับหัวเรื่องระดับถัดมา
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` เน้นข้อความของคุณ
* `<strong>text</strong>` ทำให้ข้อความที่เน้นหนาขึ้น
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` สร้างการเชื่อมโยง
* `<ul><li>first item</li><li>second item</li></ul>` สร้างรายการ เหมือนเช่นอันนี้!
* `<div></div>` สร้างส่วนของหน้าเพจ

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

เราได้สร้าง `div` ไว้เป็นสามส่วน

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

โดยจะทำให้มีผลแบบนี้:

![รูปที่ 11.4](images/step6.png)

เย้! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## มีอีกอย่างนึง: deploy!

เราทำให้ไปโผล่บนอินเทอร์เน็ตน่าจะดี ว่าไหม? เรามา deploy บน PythonAnywhere อีกกัน

### Commit และ push โค้ดของคุณไปยัง Github

ก่อนอื่น มาดูกันว่าไฟล์ไหนถูกเปลี่ยนแปลงไปบ้างจากครั้งล่าสุด (ใช้คำสั่งต่อไปนี้บนเครื่องคุณเอง ไม่ใช่บน PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). ยังจำ (จากบทที่ 3) เครื่องหมาย `.` หมายถึงไดเรกทอรีปัจจุบัน

ก่อนเราละอัปโหลดไฟล์ทั้งหมด ตรวจสอบดูว่า `git` จะอัปไฟล์ไหนไป (ไฟล์ที่ `git` จะอัปโหลดจะเป็นตัวอักษรสีเขียว):

{% filename %}command-line{% endfilename %}

    $ git status
    

เราเกือบเสร็จแล้ว ตอนนี้ถึงเวลาที่จะบันทึกการเปลี่ยนแปลงนี้แล้ว เรากำลังจะ "เขียนข้อความบันทึก" ซึ่งอธิบายสิ่งที่เราเปลี่ยนแปลงไป คุณสามารถพิมพ์อะไรก็ได้ตามที่ต้องการ แต่มันจะช่วยได้มาก หากเราอธิบายให้ตัวคุณเองจำสิ่งที่คุณทำลงไปได้ ในอนาคต

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **หมายเหตุ** ตรวจสอบให้แน่ใจว่าคุณใช้อัญประกาศคู่กับข้อความบันทึก

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### ดึงโค้ดล่าสุดของคุณมาที่ PythonAnywhere และโหลดเว็บของคุณอีกครั้ง

* เปิด [หน้าคอนโซล PythonAnywhere](https://www.pythonanywhere.com/consoles/) และไปยัง **Bash console** ของคุณ (หรือเริ่มอันใหม่) จากนั้นใช้คำสั่ง:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **Files tab** and view your code on PythonAnywhere.

* สุดท้าย ไปยัง [Web tab](https://www.pythonanywhere.com/web_app_setup/) และกดปุ่ม **Reload** บนเว็บของคุณ

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)