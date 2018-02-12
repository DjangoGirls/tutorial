# دیپلوی!

> **توجه داشته باشید** که قسمت های پیش رو ممکن است کمی سخت به نظر برسد. یکی از مهم ترین قسمت های توسعه وب سایت, دیپلوی می باشد. این فصل در وسط آموزش قرار گرفته است، بنابراین مربی شما می تواندبه شما در راه اندازی آنلاین وبسایتتان کمک کند. این به این معنی است که شما هنوز هم می توانید آموزش خود را به اتمام برسانید اگر زمان کمتری اجرا شود.

تا به اینجا وب سایت شما فقط در رایانه شما قابل مشاهده است. حالا شما یاد خواهید گرفت که چگونه آن را دیپلوی کنید! دیپلوی یعنی فرآیند انتشار پروژه شما در اینترنت است تا مردم بتوانند در نهایت پروژه شما را ببینند. :)

همانطور که یاد گرفتید، وب سایت باید بر یک سرور واقع شود. سرورهای زیادی در اینترنت وجود دارد، ما قصد داریم از [PythonAnywhere](https://www.pythonanywhere.com/) استفاده نماییم. PythonAnywhere</0> برای پروژه های کوچک رایگان است و بازدید کنندگان خیلی زیادی ندارد بنابراین در حال حاضر برای شما مناسب میباشد.

سرویس خارجی دیگری که ما استفاده می کنیم  گیت هاب</ 0> است که سرویس میزبانی کد است. دیگران وجود دارد، اما تقریبا همه برنامه نویسان این روزها حساب گیت هاب دارند و حالا هم همینطور است!</p> 

این سه مکان برای شما مهم خواهد بود. کامپیوتر محلی شما جایی است که شما در حال توسعه و آزمایش هستید. هنگامی که شما با تغییرات راضی هستید، یک نسخه از برنامه خود را در گیت هاب قرار دهید. وب سایت شما در هرکجا پایتون خواهد بود و شما آن را با دریافت یک کپی جدید از کد خود را از گیت هاب به روز رسانی کنید.

# گیت

> ** نکته </ 0> اگر قبلا مراحل نصب را انجام دادید نیازی به انجام این کار وجود ندارد - شما می توانید به بخش بعدی بروید و شروع به ایجاد مخزن گیت کنید.</p> </blockquote> 
> 
> % include "/deploy/install_git.md" %}}
> 
> ## شروع به مخزن گیت هاب ذما
> 
> آهنگ گیت هاب تغییرات به یک مجموعه خاص از فایل ها در آنچه که مخزن کد (یا "repo" برای کوتاه) نامیده می شود. بیایید یک پروژه را برای شروع بگذاریم. کنسول خود را باز کنید و این دستورات را در دایرکتوری ` دختران جنگجو</ 0> اجرا کنید:</p>

<blockquote>
  <p><strong> توجه </ 0> قبل از مقداردهی مجدد مخزن، دستورالعمل فعلی کار خود را با دستور <code> pwd </ 1> (سیستم عامل Mac OS X / Linux) یا <code> cd </ 1> (ویندوز) بررسی کنید. شما باید در پوشه <code> دختران جنگجو</ 0> باشد.</p>
</blockquote>

<p>% filename %}}خط فرمان% endfilename %}}</p>

<pre><code>$ گیت اینت
مخزن گیت هاب خالی را در ~ / دختران جنگجو /.git /
$پیکربندی - کاربر جهانی.نام "نام شما"
$ پیکربندی - ایمیل.کاربر جهانی شما@برای مثال.com
`</pre> 
> 
> ابتدایی مخزن git چیزی است که ما فقط باید یک بار در هر پروژه انجام دهیم (و مجبور نیستید مجددا نام کاربری را دوباره وارد کنید و دوباره ایمیل کنید).
> 
> گیت هاب تغییرات را به تمام فایل ها و پوشه ها در این پوشه پیگیری می کند، اما برخی از فایل هایی که می خواهیم آن را نادیده بگیریم وجود دارد. ما این کار را با ایجاد یک فایل به نام `.رد کردن گیت هاب </ 0> در دایرکتوری پایه انجام می دهیم. ویرایشگر خود را باز کنید و یک فایل جدید با مطالب زیر ایجاد کنید:</p>

<p>{% filename %}.ردکردن گیت{% endfilename %}</p>

<pre><code>*.pyc
*~
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
`</pre> 
> 
> و در پوشه "دختران جنگجو" آن را `.ردکردن گیت </ 0> ذخیره کنید.</p>

<blockquote>
  <p><strong> توجه </ 0> نقطه در ابتدای نام فایل مهم است!  اگر مشکلی در ایجاد آن دارید (به عنوان مثال مکینتاش شما را دوست ندارد فایل هایی را ایجاد کنید که از طریق یاب شروع می شود)، سپس از ویژگی ذخیره در استفاده کنید در ویرایشگر خود. آن ضد گلوله است.</p>
  
  <p><strong> توجه </ 0> یکی از فایل هایی که در فایل <code>.ردکردن گیت </ 1> مشخص شده است <code> db.sqlite3 </ 1> است. این فایل پایگاه داده محلی شما است، که همه پست های شما ذخیره می شود. ما نمی خواهیم این را به مخزن خود اضافه کنیم؛ زیرا وب سایت شما در هرجا پایتون از یک پایگاه داده متفاوت استفاده می کند.  این پایگاه داده می تواند اسکیولایت مانند دستگاه توسعه خود باشد، اما معمولا شما از یک مای اسکیوال استفاده می کنید که می تواند با بازدیدکنندگان سایت بسیار بیشتر از اسکیولایت مقابله کند. در هر صورت، با نادیده گرفتن پایگاه داده اسکیولایت خود برای نسخه گیت هاب، این بدان معنی است که همه پستهایی که تا کنون ایجاد کرده اید، ماندگار میشوند و فقط در محلی در دسترس هستند، اما شما مجبورید آنها را دوباره در تولید اضافه کنید. شما باید از پایگاه داده محلی خود به عنوان یک زمین بازی خوب که در آن شما می توانید چیزهای مختلف را آزمایش کنید و نگران نباشید که شما قصد ارسال پست واقعی خود را از وبلاگ خود را دارید، فکر کنید.</p>
</blockquote>

<p>ایده خوبی است برای استفاده از دستور <code> وضعیت گیت </ 0> قبل از اینکه <code> گیت اضافه </ 0> یا هر زمان که خودتان مطمئن نیستید از چه چیزی تغییر کرده اید. این به جلوگیری از هر گونه شگفتی از اتفاق می افتد، مانند فایل های اشتباه اضافه شده یا مرتکب می شوند. دستور <code> وضعیت گیت </ 0> اطلاعاتی را در مورد هر گونه فایل های غیر قابل شناسایی / تغییر یافته / مرتب شده، وضعیت شاخه و موارد دیگر باز می گرداند. خروجی باید شبیه به موارد زیر باشد:</p>

<p>% filename %}}خط فرمان% endfilename %}}</p>

<pre><code>وضعیت $ گیت
در شاخه کارشناسی ارشد

تعهد اولیه

فایل های غیرقابل پیگیری:
   (استفاده از "گیت اضافه کردن <file> ..." برای شامل در آنچه متعهد خواهد شد)

         .ردکردن گیت
         وبلاگ/
         مدیریت.py
         مکان من/

هیچ چیز اضافه نشده به مرتکب شدن اما فایل های غیرقابل مشاهده موجود (استفاده از "git add" برای ردیابی)
`</pre> 
> 
> و در نهایت ما تغییرات ما را ذخیره می کنیم. به کنسول خود بروید و این دستورات را اجرا کنید:
> 
> % filename %}}خط فرمان %endfilename %}}
> 
>     $همه گیت --همه .
>     $فرمان گیت -m "برنامه دیجانگو دختران من، برای اولین بار متعهد"
>       [...]
>       13 فایل تغییر کرده است، 200 درج (+)
>       ایجاد حالت 100644. ردکردن گیت
>       [...]
>       ایجاد حالت 100644 سایت من / wsgi.py
>       `` `
>     
>     
>     ## فشار دادن کد خود به گیت هاب
>     
>     به [GitHub.com] بروید (https://www.github.com) و ثبت نام کنید تا یک حساب کاربری جدید رایگان ایجاد کنید. (اگر قبلا این کار را در آمادگی کارگاه انجام دادید، این عالی است!)
>     
>     سپس یک مخزن جدید ایجاد کنید، آن را به نام "my-first-blog" بدهید. از کادر انتخاب "مقداردهی اولیه با من را بخوان" را بدون علامت چک کنید، گزینه ".ردکردن گیت" را خالی بگذارید (ما این کار را به صورت دستی انجام داده ایم) و مجوز را به عنوان هیچ می گذاریم.
>     
>     <0 />
>     
>     & gt؛ ** نکته ** نام 'اولین وبلاگ من` مهم است - شما می توانید چیزی دیگری را انتخاب کنید، اما در دستورالعمل های زیر بارها اتفاق می افتد و شما باید هر بار آن را جایگزین کنید. این احتمالا ساده تر است که فقط با نام "اولین وبلاگ من" قرار بگیرد.
>     
>     در صفحه بعد، آدرس اینترنتی کلون ریپو شما نشان داده می شود. نسخه "HTTPS" را انتخاب کنید، آن را کپی کنید و مدت کوتاهی آن را در ترمینال قرار می دهیم:
>     
>     <0 />
>     
>     حالا ما باید مخزن Git را بر روی رایانه خود بسازیم تا در گیت هاب یکپارچه شود.
>     
>     زیر را در کنسول خود بنویسید (با نام کاربری که در هنگام ایجاد حساب GitHub خود وارد کردید، جایگزین `&lt;your-github-username&gt; 'با نام کاربری خود وارد کنید، اما بدون زاویه مطابق):
>     
>     % filename %}}خط فرمان% endfilename %}}
>     
> 
> $ گیت از راه دور منشا اضافه کنیدhttps://github.com/<your-github-username>/اولین وبلاگ من.گیت $ فشار گیت -u اصلی استاد
> 
>     <br />نام کاربری و رمز عبور GitHub خود را وارد کنید و باید چیزی شبیه به این را ببینید:
>     
>     {٪ filename٪} خط فرمان {٪ endfilename٪}
>     
> 
> Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. نوشتن اشیاء: 100٪ (6/6)، 200 بایت | 0 بایت / ثانیه، انجام شده است. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git
> 
> - [شاخه جدید] استاد -> استاد کارشناسی ارشد برای راه انداختن استاد شاخه از راه دور از مبدأ تنظیم شده است.
> 
>     <br />& lt؛! - TODO: ممکن است کلیدهای SSH در حزب نصب نصب شود و نقطه PPL که آن را به یک پسوند نرسیده است - & gt؛
>     
>     کد شما در حال حاضر در GitHub است. برو و بررسیش کن!  شما این را در شرکت خوبی خواهید یافت - [جانگاو] (https://github.com/django/django)، [دختران آموزش یونانی] (https://github.com/DjangoGirls/tutorial) و بسیاری دیگر از بزرگ پروژه های نرم افزاری منبع باز نیز کد خود را در GitHub میزبانی می کنند. :)
>     
>     
>     # Setting up our blog on PythonAnywhere
>     
>     ## Sign up for a PythonAnywhere account
>     
>     &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
>     
>     {% include "/deploy/signup_pythonanywhere.md" %}
>     
>     
>     ## Configuring our site on PythonAnywhere
>     
>     Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.
>     
>     &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
>     
>     &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
>     
>     Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application.  There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> $ pip3.6 install --user pythonanywhere
> 
>     <br />That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.
>     
>     Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
> 
>     <br />As you watch that running, you'll be able to see what it's doing:
>     
>     - Downloading your code from GitHub
>     - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
>     - Updating your settings file with some deployment settings
>     - Setting up a database on PythonAnywhere using the `manage.py migrate` command
>     - Setting up your static files (we'll learn about these later)
>     - And configuring PythonAnywhere to serve your web app via its API
>     
>     On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.  The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
>     
>     As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> (ola.pythonanywhere.com) $ python manage.py createsuperuser
> 
>     <br />Type in the details for your admin user.  Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
>     
>     Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> (ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```
> 
> You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.
> 
> ## You are now live!
> 
> Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)
> 
> ## Debugging tips
> 
> If you see an error while running the `pa_autoconfigure_django.py` script, there are a couple of common causes:
> 
> - Forgetting to create your API token.
> - Making a mistake in your GitHub URL
> 
> If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> 
> There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> 
> And remember, your coach is here to help!
> 
> # Check out your site!
> 
> The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.
> 
> Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> 
> Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!