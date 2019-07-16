# آشنایی با HTML

ممکن است بپرسید تمپلیت چیست؟

تمپلیت (به معنی قالب) فایلی است که می‌توانیم بارها از آن استفاده کنیم و اطلاعات مختلفی را به کمک آن و در یک فرمت ثابت ارائه کنیم. مثلاً شما می‌توانید از یک تمپلیت کمک بگیرید و یک نامه بنویسید چرا که با اینکه هر نامه‌ای پیغام و آدرس متفاوتی دارد، اما از فرمت مشابهی استفاده می‌کند.

یک تمپلیت جنگو در زبانی تعریف می‌شود که با آن HTML می‌گوییم (همان HTML که در بخش اول، **اینترنت چگونه کار می‌کند**، به آن اشاره کرده بودیم).

## HTML چیست؟

HTML نوعی از کد است که توسط مرورگر وب، مانند کروم و فایرفاکس یا سافاری، تفسیر و اجرا می‌شود تا یک صفحه وب را نشان دهد.

HTML مخفف عبارت "HyperText Markup Language" است. **HyperText** به این معنی است که نوعی از نوشته است که هایپرلینک بین صفحات را پشتیبانی می‌کند. **Markup** یعنی ما یک متن را برمی‌داریم و آن را علامت گذاری می‌کنیم تا به سیستم دیگری (مثلاً در اینجا مرورگر وب) بگوییم چطور آن را تفسیر کند. کدهای HTML با **tag** ها ساخته شده اند که هرکدام با `>` آغاز و با `<` پایان می‌یابند. این تگ‌ها **المان‌های** نشانه گذاری هستند.

## اولین تمپلیت شما!

ساختن یک تمپلیت یعنی ساختن یک فایل تمپلیت. هرچیزی، یک فایل است، درست است؟ احتمالاً تا الان این موضوع را متوجه شده اید.

تمپلیت‌ها در دایرکتوری `blog/templates/blog` ذخیره می‌شوند. بنابراین اول یک دایرکتوری به نام `templates` در دایرکتوری وبلاگ بسازید. سپس دایرکتوری دیگری به نام `blog` در داخل آن بسازید:

    blog
    └───templates
        └───blog
    

(ممکنن است فکر کنید که چرا دوتا دایرکتوری به نام `blog` لازم داریم. همانطور که بعدتر خواهیم دید این یک سیستم نامگذاری کارآمد برای وقتی است که اوضاع پیچیده‌تر می‌شود.)

حالا یک فایل `post_list.html` (که فعلاً خالی باشد) در دایرکتوری بسازید `blog/templates/blog`.

نگاه کنید که الان وبسایت شما چه شکلی شده است: http://127.0.0.1:8000/

> اگر هنوز پیغام خطا `TemplateDoesNotExist` را می‌بینید، یک بار سرور را قطع و بعد دوباره فعال کنید. به خط فرمان بروید سرور را با زدن Ctrl+C (کلید کنترل و کلید C باهم) قطع کنید و با اجرای دستور `python manage.py runserver` مجدداً فعال کنید.

![تصویر 11.1](images/step1.png)

پیغام خطایی نیست! تبریک :) با اینحال وبسایت شما هنوز چیزی به غیر از یک صفحه خالی نشان نمی‌دهد برای اینکه تمپلیت شما خالی است. لازم است که آن را اصلاح کنیم.

فایل جدید را در ویرایشگر کد باز کنید و موارد زیر را به آن اضافه کنید:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

الان وبسایت شما چطور به نظر می‌رسد؟ به آن سری بزنید تا بفهمید: http://127.0.0.1:8000/

![تصویر 11.2](images/step3.png)

کار می‌کند! خوب شد :)

* `<html>` پایه‌ای ترین تگ و معمولاً اولین تگ در ابتدای صفحه است و تگ `</html>` معمولاً در انتهای صفحه می‌آید. همانطور که می‌بینید، تمام محتوای وبسایتبین این دو تگ `<html>` در ابتدا و تگ `</html>` در انتها قرار می‌گیرند
* تگ `<p>` برای پاراگراف‌ها به کار می‌رود و تگ `</p>` پایان هر پاراگراف را مشخص می‌کند

## Head and body

هر صفحه HTML همچنین به دو بخش اصلی تقسیم می‌شود: **head** و **body**.

* **head** عنصری است که شامل اطلاعاتی در مورد هر فایل می‌شود که در صفحه نشان داده نمی‌شوند.

* **body** عنصری است که شامل هر چیزی است که در صفحه وبسایت نمایش داده می‌شوند.

ما از `<head>` استفاده می‌کنیم تا در مورد تنظیمات فایل به مرورگر اطلاعاتی بدهیم و `<body>` نشان می‌دهد که چه چیزی واقعاً در صفحه وجود دارد.

برای مثال شما می‌توانید تگ عنوان یا title را به این شکل در `<head>`، قرار دهید:

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

این فایل‎ را ذخیره کنید و وبسایت خود را دوباره بارگذاری کنید.

![تصویر 11.3](images/step4.png)

توجه کنید که چگونه مرورگر متوجه شد که "Ola's blog" عنوان صفحه شماست؟ مرورگر عبارت `<title>Ola's blog</title>` را تفسیر کرده و آن را به عنوان نام صفحه در بالای مرورگر قرار داده است (البته تایتل در جاهای دیگری مانند bookmark کردن هم استفاده می‌شود).

احتمالاً تا الان توجه کرده‌اید که هر تگ شروع به همراه یک *تگ پایان* و علامت `/` می‌آید و عوامل در آن نیز *nested* می‌شوند (یعنی شما نمی‌توانید یک تگ را ببندید مگر آنکه تمام تگ‌های درون آن را بسته باشید).

شبیه گذاشتن چیزها در جعبه است. شما یک جعبه بزرگ دارید، `<html></html>`؛ درون آن یک جعبه دیگر `<body></body>`، و این همینطور ادامه دارد تا به کوچکترین جعبه برسد: `<p></p>`.

شما باید از این قوانین *بستن تگ‌ها* و نیز *nesting*، پیروی کنید. اگر این قوانین رعایت نشوند مرورگر ممکن است نتواند فایل شما را درست تفسیر کند و صفحه HTML درست نمایش داده نخواهد شد.

## تنظیم کردن تمپلیت

الان می‌توانید کمی تفریح کنید و تلاش کنید تا تمپلیت خود را تنظیم کنید! در اینجا تعدادی تگ مفید معرفی شده:

* `<h1>A heading</h1>` یک تیتر برای عنوان های مهم است
* `<h2>A sub-heading</h2>` یک تیتر برای عنوان های کم اهمیت تر
* `<h3>A sub-sub-heading</h3>` یک زیر عنوان که تا `<h6>` درجه اهمیت آن کمتر می‌شود
* `<p>پارگرافی از نوشته‌ها</p>`
* `<em>متن</em>` بر نوشته شما تاکید می‌کند
* `<strong>متن</strong>` تأکید بیشتر بر متن
* `<br>` به خط بعد می‌رود (شما چیزی درون تگ br نمیتوانید بگذارید و علاوه بر این تگِ پایانی هم، ندارد)
* `<a href="https://djangogirls.org">لینک</a>` یک لینک می‌سازد
* `<ul><li>آیتم اول</li><li>آیتم دوم</li></ul>` یک لیست، دقیقاً مانند همین لیست درست می‌کند!
* `<div></div>` یک بخش جدید در صفحه درست می‌کند

اینجا نمونه‌ای از یک تمپلیت کامل داریم. آن را در فایل `blog/templates/blog/post_list.html` کپی کنید:

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

ما سه بخش با تگ `div` ساخته‌ایم.

* اولین عنصر `div`، شامل عنوان وبلاگ یعنی یک تیتر و یک لینک، است
* دو عنصر `div` بعدی شامل یک پست وبلاگی و تاریخ انتشار آن است. تگ `h2` با عنوان پست و قابل کلیک کردن و دوتا تگ متنی `p` که یکی برای تاریخ است و دیگری برای متن پست وبلاگ ما.

چنین نتیجه ای به ما می‌دهد:

![تصویر 11.4](images/step6.png)

واای! ولی تا اینجا تمپلیت ما دقیقا **اطلاعات یکسانی** را نمایش می‌دهد درحالیکه جلوتر در مورد این صحبت کردیم که تمپلیت به ما اجازه می‌دهد **اطلاعات متفاوتی** را در **قالب یکسان** نمایش دهیم.

آن چیزی که واقعاً می‌خواهیم این است که پست‌های واقعی که در جنگو ادمین اضافه کرده‌ایم را نمایش دهد و این همان چیزی است که در ادامه سراغ آن خواهیم رفت.

## فقط یک چیز دیگر: دیپلوی!

خیلی خوب خواهد بود که همه اینها را به صورت آنلاین بر روی اینترنت ببینیم، درست است؟ پس بیایید یک بار دیگر به کمک PythonAnywhere وبسایت را منتشر کنیم:

### کامیت کنید و کد را بر روی گیتهاب پوش کنید

اول از همه ببینیم کدام فال ها را به نسبت آخرین انتشار، تغییر داده ایم (این دستور را بر روی کامپیوتر خود اجرا کنید و نه در PythonAnywhere):

{% filename %}خط فرمان{% endfilename %}

    $ git status
    

مطمئن باشید که در دایرکتوری `djangogirls` هستید و به `گیت` اجازه دهید تمام تغییرات ایجاد شده در این دایرکتوری را در نظر بگیرد:

{% filename %}خط فرمان{% endfilename %}

    $ git add --all .
    

> **نکته**: `--all` به معنی آن است که `git` حتی اگر فایلی را هم پاک کرده باشید متوجه آن می‌شود (در حالت عادی فقط فایل‌های جدید و فایل‌‍های تغییر کرده را دنبال می‌‎کند). همچنین به یاد داشته باشید (از بخش 3) که `.` (نقطه) به معنی دایرکتوری جاری است.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}خط فرمان{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}خط فرمان{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}خط فرمان{% endfilename %}

    $ git push
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)