# فاز دیپلوی!

> **توجه داشته باشید** که قسمت های پیش رو ممکن هست کمی سخت به نظر برسد. یکی از مهم ترین قسمت های توسعه وب سایت, دیپلوی می باشد. این فصل در وسط آموزش قرار گرفته است، به طوری که مربی شما می تواند با فرایند بسیار پیچیده ای که وب سایت شما را آنلاین می کند کمک کند. این به این معنی است که شما هنوز هم می توانید آموزش خود را به اتمام برسانید اگر زمان کمتری اجرا شود.

تا به حال، وب سایت شما فقط در رایانه شما موجود است. حالا شما یاد خواهید گرفت که چگونه آن را بکار ببندید! استقرار فرآیند انتشار برنامه شما در اینترنت است تا مردم بتوانند در نهایت برنامه خود را ببینند. :)

همانطور که یاد گرفتید، یک وب سایت باید بر روی یک سرور واقع شود. سرویس دهنده های زیادی در اینترنت وجود دارد، ما قصد داریم از  هرکجا پایتون </ 0> استفاده کنیم. هرکجا پایتون رایگان برای برنامه های کوچک است که بازدید کنندگان بیش از حد ندارد بنابراین قطعا به اندازه کافی برای شما در حال حاضر.</p> 

سرویس دیگر خارجی که ما استفاده می کنیم  گیت هاب</ 0> است که سرویس میزبانی کد است. دیگران وجود دارد، اما تقریبا همه برنامه نویسان این روزها حساب گیت هاب دارند و حالا هم همینطور است!</p> 

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
>     Type the following into your console (Replace `&lt;your-github-username&gt;` with the username you entered when you created your GitHub account, but without the angle-brackets):
>     
>     {% filename %}command-line{% endfilename %}
>     
> 
> $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master
> 
>     <br />Enter your GitHub username and password and you should see something like this:
>     
>     {% filename %}command-line{% endfilename %}
>     
> 
> Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git
> 
> - [new branch] master -> master Branch master set up to track remote branch master from origin.
> 
>     <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
>     
>     Your code is now on GitHub. Go and check it out!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
>     
>     
>     # Setting up our blog on PythonAnywhere
>     
>     &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
>     
>     {% include "/deploy/signup_pythonanywhere.md" %}
>     
>     
>     ## Pulling our code down on PythonAnywhere
>     
>     When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
>     
>     &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
>     
>     &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
>     
>     Let's pull down our code from GitHub and onto PythonAnywhere by creating a "clone" of our repo. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> $ git clone https://github.com/<your-github-username>/my-first-blog.git
> 
>     <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> $ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py
> 
>     <br /><br />### Creating a virtualenv on PythonAnywhere
>     
>     Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> $ cd my-first-blog
> 
> $ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.
> 
> $ source myvenv/bin/activate
> 
> (myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3
> 
>     <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than five minutes, something is wrong.  Ask your coach.
>     
>     &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
>     
>     ### Creating the database on PythonAnywhere
>     
>     Here's another thing that's different between your own computer and the server: it uses a different database. So the user accounts and posts can be different on the server and on your computer.
>     
>     Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
>     
>     {% filename %}PythonAnywhere command-line{% endfilename %}
>     
> 
> (mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser
> 
>     <br />## Publishing our blog as a web app
>     
>     Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. We're ready to publish it as a web app!
>     
>     Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
>     
>     After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
>     
>     &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup. ;-)
>     
>     
>     ### Setting the virtualenv
>     
>     You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
>     
>     &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
>     
>     In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Click the blue box with the checkmark to save the path before moving on.
>     
>     &gt; **Note** Substitute your own PythonAnywhere username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.
>     
>     
>     ### Configuring the WSGI file
>     
>     Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognize our Django blog is by editing a WSGI configuration file.
>     
>     بر روی پیوند "فایل پیکربندی WSGI" (در بخش "کد" در بالای صفحه کلیک کنید - آن را به نام `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), نامگذاری کنید) و شما خواهید بود گرفته شده به یک ویرایشگر.
>     
>     تمام مطالب را حذف کنید و آنها را با موارد زیر جایگزین کنید:
>     
>     {٪ filename٪} & amp؛ lt؛ your-username & amp؛ gt؛ _pythonanywhere_com_wsgi.py {٪ endfilename٪}
>     `` `پایتون
>     واردات os
>     واردات سیستم
>     
>     مسیر = os.مسیر.فرستنده ('~ / my-first-blog')
>     اگر مسیر در sys.path نیست:
>          sys.مسیر.اضافه کردن (مسیر)
>     
>     os.environ ['DJANGO_SETTINGS_MODULE'] = 'سایت من.موقعیت'
>     
>     از جنگجو.هسته.wsgi وارد گرفتن _wsgi_ابزارها
>     از جنگجو.contrib.staticfiles.هندلر واردات فایل مدیریت استاتیک
>     ابزارها = فایل مدیریت استاتیک (get_wsgi_application ())
>     
> 
> این کار این است که هرکجا پایتون را در جایی که برنامه وب ما زندگی می کند و نام پرونده تنظیمات جنگو است، بفرستیم.
> 
>  فایل مدیریت استاتیک </ 0> برای مقابله با CSS ما است. این فرمان <code> اجرا سرور </ 0> به طور خودکار برای شما در حین توسعه محلی مراقبت می شود. بعدا در مورد آموزش فایل های استاتیک کمی بیشتر توضیح خواهیم داد، وقتی CSS را برای سایت ما ویرایش میکنیم.</p>

<p>هیت <strong> ذخیره </ 0> و سپس به برگه <strong> وب </ 0> بروید.</p>

<p>همه ما انجام شده است! دکمه بزرگ سبز <strong> بارگیری مجدد </ 0> را فشار دهید و شما قادر به مشاهده برنامه خود خواهید بود. یک پیوند به آن در بالای صفحه پیدا خواهید کرد.</p>

<h2>نکات اشکال زدایی</h2>

<p>اگر هنگام تلاش برای بازدید از سایت خود خطایی را مشاهده کردید، اولین مکان برای جستجوی برخی از اطلاعات خطایابی در <strong> خطا در ورود </ 0> وجود دارد. پیوند این را در هرکجا پایتون <a href="https://www.pythonanywhere.com/web_app_setup/"> برگه وب </ 0> پیدا خواهید کرد. ببینید اگر پیام های خطا در آنجا وجود داشته باشد؛ آخرین آنها در پایین هستند. مشکلات رایج عبارتند از:</p>

<ul>
<li><p>فراموش کردن یکی از مراحل انجام شده در کنسول: ایجاد مجازی، فعال کردن آن، نصب کردن جانگو در آن، مهاجرت به پایگاه داده.</p></li>
<li><p>اشتباه در مسیر مجازی در برگه وب - معمولا یک پیام خطای قرمز کوچک وجود دارد، اگر یک مشکل وجود دارد.</p></li>
<li><p>اشتباه در فایل پیکربندی WSGI - آیا مسیر را به پوشه اولین وبلاگ من درست کردم?</p></li>
<li><p>آیا همان نسخه پایتون را برای مجازی خود انتخاب کردید همانطور که برای برنامه وب خود انجام دادید؟ هر دو باید 3.6 باشد.</p></li>
</ul>

<p>همچنین برخی از نکات اشکال زدائی کلی <a href="https://www.pythonanywhere.com/wiki/DebuggingImportError"> در ویکی هرکجا پایتون </ 0> وجود دارد.</p>

<p>و به یاد داشته باشید، مربی شما برای کمک به اینجا است!</p>

<h1>تو زندگی میکنی!</h1>

<p>صفحه پیش فرض سایت شما باید بگوید "این کار کرده است!" درست همانطور که در رایانه محلی شماست. سعی کنید <code> / مدیر / </ 0> را به انتهای آدرس اینترنتی اضافه کنید و به سایت مدیریت برسید. با نام کاربری و رمز عبور وارد شوید و ببینید که می توانید پست های جدید را در سرور اضافه کنید.</p>

<p>هنگامی که چند پست ایجاد شده دارید می توانید به تنظیم محلی خود (نه هرکجا پایتون) بازگردید. از اینجا باید تنظیمات محلی خود را انجام دهید تا تغییرات ایجاد کنید. این یک گردش کار مشترک در توسعه وب است - تغییرات را به صورت محلی انجام دهید، این تغییرات را به گیت هاب فشار دهید و تغییرات خود را به سرور وب زنده خود بکشید. این به شما اجازه می دهد بدون شکستن وب سایت زنده خود کار کنید و آزمایش کنید. خیلی خن?</p>

<p><em> بزرگ </ 0> خودت را در پشت بگذار! استقرار سرور یکی از پیچیده ترین قسمت های توسعه وب است و اغلب مردم چند روز قبل از اینکه کارشان را انجام دهند، آنها را می گیرد. اما شما سایت خود را در زندگی واقعی، در اینترنت واقعی، درست مثل این است!</p>