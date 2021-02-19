# ความรู้เบื้องต้นเกี่ยวกับ HTML

คุณอาจจะสงสัยว่าเทมเพลต (template) คืออะไร?

Template คือ ไฟล์ที่เราจะสามารถนำมาใช้นำเสนอข้อมูลที่แตกต่างกันออกไป - ตัวอย่างเช่น คุณอาจจะใช้ template สำหรับช่วยเขียนจดหมาย เพราะแต่ละฉบับมีข้อความและที่อยู่ต่างกันไปในแต่ละคน แต่ใช้รูปแบบเดียวกัน

รูปแบบ template ของ Django จะถูกอธิบายโดยใช้ภาษาที่เรียกว่า HTML (เป็น HTML อันเดียวกับที่เราได้เกริ่นไว้ตอนต้นของบท **อินเทอร์เน็ตทำงานอย่างไร**)

## HTML คืออะไร?

HTML เป็นโค้ดง่ายๆ ที่ถูกใช้โดยเว็บเบราว์เซอร์ - เช่น Chrome, Firefox หรือ Safari - เพื่อแสดงผลหน้าเว็บให้กับผู้ใช้

HTML ย่อมาจาก "HyperText Markup Language" **HyperText** หมายถึง เป็นชนิดของข้อความที่มีการเชื่อมโยงไปหน้าเว็บอื่นๆ ได้ **Markup** หมายถึง เราทำเครื่องหมายสักอย่างไว้ที่เอกสารด้วยโค้ดเพื่อทำบางอย่าง (ในที่นี้ เบราว์เซอร์) หรือวิธีการแปลงหน้าเพจ HTML โค้ด สร้างขึ้นจาก **tag** แต่ละ tag เริ่มต้นด้วย `<` และลงท้ายด้วย `>` tag เหล่านี้ถูกทำเครื่องหมายว่าเป็น **element**.

## template แรกของคุณ!

การสร้าง template ที่ว่า คือการสร้างไฟล์ template ทุกอย่างล้วนคือไฟล์ ถูกไหม? คุณคงสังเกตเห็นแล้ว

template ทั้งหลายนั้นถูกบันทึกไว้ที่ไดเรกทอรี `blog/templates/blog` ดังนั้น เราจะสร้างไดเรกทอรีชื่อ `templates` ข้างในไดเรกทอรี blog ของคุณ จากนั้นสร้างไดเรกทอรีเพิ่ม ชื่อ `blog` ข้างในไดเรกทอรี template เมื่อครู่:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

ตอนนี้ให้สร้างไฟล์ `post_list.html` (ยังไม่ต้องมีอะไรข้างใน) ข้างในไดเรกทอรี `blog/templates/blog`

มาดูกันว่าตอนนี้เว็บเราแสดงผลยังไง: http://127.0.0.1:8000/

> ถ้าคุณยังเจอข้อผิดพลาด `TemplateDoesNotExists` ให้ลองปิดและเปิดเซิร์ฟเวอร์อีกครั้ง โดยเปิดบรรทัดคำสั่ง หยุดการทำงานของเซิร์ฟเวอร์โดยใช้คีย์ Ctrl+C (ปุ่ม Control และ C พร้อมกัน) และเริ่มอีกครั้งโดยใช้คำสั่ง `python manage.py runserver`

![รูปที่ 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

แล้วหน้าเว็บคุณตอนนี้เป็นไงนะ? ไปยังหน้านี้ซิ: http://127.0.0.1:8000/

![รูปที่ 11.2](images/step3.png)

It worked. Nice work there! :)

* The line `<!DOCTYPE html>` is not a HTML tag. It only declares the document type. Here, it informs the browser that document type is [HTML5](https://html.spec.whatwg.org/#the-doctype). This is always the beginning of any HTML5 file.
* The most basic tag, `<html>`, is always the beginning of html content and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## Head and body (หัวและเนื้อหา)

ในแต่หน้า HTML ถูกแบ่งเป็นสองส่วน: **head** และ **body**.

* **head** คือส่วนของข้อมูลต่างๆ ที่เกี่ยวกับเอกสาร แต่ไม่ปรากฎหรือแสดงผลบนหน้าจอ

* **body** คือส่วนที่เหลือทั้งหมดที่แสดงผลอยู่บนหน้าเว็บเพจ

เราใช้ `<head>` เพื่อบอกเบราว์เซอร์เกี่ยวกับการกำหนดค่าต่างๆ ของหน้าเพจ และ `<body>` บอกเกี่ยวกับเนื้อหาบนหน้าเว็บจริงๆ

ตัวอย่างเช่น คุณสามารถใส่ title อยู่ภายใน tag `<head>` แบบนี้:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

คุณต้องทำตามกฎในการ *ปิด* tag และการ *ซ้อนกัน* ของแต่ละองค์ประกอบ - ไม่เช่นนั้น เบราว์เซอร์อาจไม่สามารถแสดงผลได้อย่างถูกต้อง

## ปรับแต่ง template ของคุณ

ตอนนี้คุณจะได้สนุกกับการปรับแต่งและลองแก้นิดๆ หน่อยๆ ใน template ของคุณ! และนี่คือ tag ที่น่าสนใจที่จะลองเล่น:

* `<h1>A heading</h1>` สำหรับหัวเรื่องที่สำคัญที่สุด
* `<h2>A sub-heading</h2>` สำหรับหัวเรื่องระดับถัดมา
* `<h3>A sub-sub-heading</h3>` ... และไปจนถึง `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` เน้นข้อความของคุณ
* `<strong>text</strong>` ทำให้ข้อความที่เน้นหนาขึ้น
* `<br>` ขึ้นบรรทัดใหม่ (คุณไม่สามารถใส่อะไรลงใน br ได้)
* `<a href="https://djangogirls.org">link</a>` สร้างการเชื่อมโยง
* `<ul><li>first item</li><li>second item</li></ul>` สร้างรายการ เหมือนเช่นอันนี้!
* `<div></div>` สร้างส่วนของหน้าเพจ
* `<nav></nav>` defines a set of navigation links
* `<article></article>` specifies independent, self-contained content
* `<section></section>` defines a section in a document
* `<header></header>` specifies a header for a document or section
* `<main></main>` specifies the main content of a document
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer></footer>` defines a footer for a document or section
* `<time></time>` defines a specific time (or datetime)

และนี่ก็คือตัวอย่างของ template ตัวเต็ม บันทึกและวางมันลงใน `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

We've created one `header` section and two `article` section here.

* The `header` element contains the title of our blog – it's a heading and a link
* Another two `article` elements contain our blog posts with a published date in `time` element, `h2` with a post title that is clickable and a `p` (paragraph) of text for our blog post.

โดยจะทำให้มีผลแบบนี้:

![รูปที่ 11.4](images/step6.png)

เย้! แต่ตอนนี้ template แสดงผลโดยใช้ **ข้อมูลเดิม** ในขณะที่ก่อนหน้านี้ เราพูดถึง template ที่แสดงผลข้อมูล **ต่างกันออกไป** แต่อยู่ใน **รูปแบบเดียวกัน**.

สิ่งที่เราต้องการคือ แสดงโพสต์ที่เราได้เพิ่มในหน้า Django admin - และนั่นคือสิ่งที่เราจะทำต่อไป

## มีอีกอย่างนึง: deploy!

เราทำให้ไปโผล่บนอินเทอร์เน็ตน่าจะดี ว่าไหม? เรามา deploy บน PythonAnywhere อีกกัน

### Commit และ push โค้ดของคุณไปยัง Github

ก่อนอื่น มาดูกันว่าไฟล์ไหนถูกเปลี่ยนแปลงไปบ้างจากครั้งล่าสุด (ใช้คำสั่งต่อไปนี้บนเครื่องคุณเอง ไม่ใช่บน PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

ตรวจสอบว่าอยู่ในไดเรกทอรี `djangogirls` หรือไม่ และใช้ `git` ในการรวมทุกไฟล์ที่เราแก้ไขภายในไดเรกทอรีเข้ามาด้วย:

{% filename %}command-line{% endfilename %}

    $ git add .
    

ก่อนเราละอัปโหลดไฟล์ทั้งหมด ตรวจสอบดูว่า `git` จะอัปไฟล์ไหนไป (ไฟล์ที่ `git` จะอัปโหลดจะเป็นตัวอักษรสีเขียว):

{% filename %}command-line{% endfilename %}

    $ git status
    

เราเกือบเสร็จแล้ว ตอนนี้ถึงเวลาที่จะบันทึกการเปลี่ยนแปลงนี้แล้ว เรากำลังจะ "เขียนข้อความบันทึก" ซึ่งอธิบายสิ่งที่เราเปลี่ยนแปลงไป คุณสามารถพิมพ์อะไรก็ได้ตามที่ต้องการ แต่มันจะช่วยได้มาก หากเราอธิบายให้ตัวคุณเองจำสิ่งที่คุณทำลงไปได้ ในอนาคต

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

เมื่อเสร็จแล้ว เราจะทำการอัปโหลด (push) การเปลี่ยนแปลงไปที่ Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### ดึงโค้ดล่าสุดของคุณมาที่ PythonAnywhere และโหลดเว็บของคุณอีกครั้ง

* เปิด [หน้าคอนโซล PythonAnywhere](https://www.pythonanywhere.com/consoles/) และไปยัง **Bash console** ของคุณ (หรือเริ่มอันใหม่) จากนั้นใช้คำสั่ง:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

เว็บที่ปรับปรุงใหม่ควรจะโชว์บนอินเตอร์เน็ตแล้ว! ลองโหลดหน้าบนเบราว์เซอร์ของคุณ คุณน่าจะได้เห็นความเปลี่ยนแปลงแล้วล่ะ :)