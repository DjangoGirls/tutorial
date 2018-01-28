# فاز دیپلوی!

> **توجه داشته باشید** که قسمت های پیش رو ممکن هست کمی سخت به نظر برسد. یکی از مهم ترین قسمت های توسعه وب سایت, دیپلوی می باشد. This chapter is placed in the middle of the tutorial so that your mentor can help with the slightly trickier process of getting your website online. This means you can still finish the tutorial on your own if you run out of time.

Until now, your website was only available on your computer. Now you will learn how to deploy it! Deploying is the process of publishing your application on the Internet so people can finally go and see your app. :)

As you learned, a website has to be located on a server. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

The other external service we'll be using is [GitHub](https://www.github.com), which is a code hosting service. There are others out there, but almost all programmers have a GitHub account these days, and now so will you!

These three places will be important to you. Your local computer will be the place where you do development and testing. When you're happy with the changes, you will place a copy of your program on GitHub. Your website will be on PythonAnywhere and you will update it by getting a new copy of your code from GitHub.

# Git

> **Note** If you already did the Installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

% include "/deploy/install_git.md" %}}

## شروع به مخزن گیت هاب ذما

آهنگ گیت هاب تغییرات به یک مجموعه خاص از فایل ها در آنچه که مخزن کد (یا "repo" برای کوتاه) نامیده می شود. بیایید یک پروژه را برای شروع بگذاریم. کنسول خود را باز کنید و این دستورات را در دایرکتوری ` دختران جنگجو</ 0> اجرا کنید:</p>

<blockquote>
  <p><strong> توجه </ 0> قبل از مقداردهی مجدد مخزن، دستورالعمل فعلی کار خود را با دستور <code> pwd </ 1> (سیستم عامل Mac OS X / Linux) یا <code> cd </ 1> (ویندوز) بررسی کنید. شما باید در پوشه <code> دختران جنگجو</ 0> باشد.</p>
</blockquote>

<p>% filename %}}خط فرمان% endfilename %}}</p>

<pre><code>$ گیت اینت
مخزن گیت هاب خالی را در ~ / دختران جنگجو /.git /
$پیکربندی - کاربر جهانی.نام "نام شما"
$ پیکربندی - ایمیل.کاربر جهانی شما@برای مثال.com
`</pre> 

ابتدایی مخزن git چیزی است که ما فقط باید یک بار در هر پروژه انجام دهیم (و مجبور نیستید مجددا نام کاربری را دوباره وارد کنید و دوباره ایمیل کنید).

گیت هاب تغییرات را به تمام فایل ها و پوشه ها در این پوشه پیگیری می کند، اما برخی از فایل هایی که می خواهیم آن را نادیده بگیریم وجود دارد. ما این کار را با ایجاد یک فایل به نام `.رد کردن گیت هاب </ 0> در دایرکتوری پایه انجام می دهیم. ویرایشگر خود را باز کنید و یک فایل جدید با مطالب زیر ایجاد کنید:</p>

<p>{% filename %}.ردکردن گیت{% endfilename %}</p>

<pre><code>*.pyc
*~
__pycache__
myvenv
db.sqlite3
/static
.DS_Store
`</pre> 

و در پوشه "دختران جنگجو" آن را `.ردکردن گیت </ 0> ذخیره کنید.</p>

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

و در نهایت ما تغییرات ما را ذخیره می کنیم. به کنسول خود بروید و این دستورات را اجرا کنید:

% filename %}}خط فرمان %endfilename %}}

    $همه گیت --همه .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!)
    
    Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to just stick with the name `my-first-blog`.
    
    On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Go and check it out!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Choose the option to start a "Bash" console – that's the PythonAnywhere version of a console, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Let's pull down our code from GitHub and onto PythonAnywhere by creating a "clone" of our repo. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Patience, patience!  But if it takes more than five minutes, something is wrong.  Ask your coach.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. So the user accounts and posts can be different on the server and on your computer.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. We're ready to publish it as a web app!
    
    Click back to the PythonAnywhere dashboard by clicking on its logo, and then click on the **Web** tab. Finally, hit **Add a new web app**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
    
    &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. We're too cool for the default PythonAnywhere Django setup. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Click the blue box with the checkmark to save the path before moving on.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. If you make a mistake, PythonAnywhere will show you a little warning.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. The way we configure PythonAnywhere to recognize our Django blog is by editing a WSGI configuration file.
    
    Click on the "WSGI configuration file" link (in the "Code" section near the top of the page – it'll be named something like `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.
    
    Delete all the contents and replace them with the following:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

This file's job is to tell PythonAnywhere where our web app lives and what the Django settings file's name is.

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. We'll find out a bit more about static files later in the tutorial, when we edit the CSS for our site.

Hit **Save** and then go back to the **Web** tab.

We're all done! Hit the big green **Reload** button and you'll be able to go view your application. You'll find a link to it at the top of the page.

## Debugging tips

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom. Common problems include:

- Forgetting one of the steps we did in the console: creating the virtualenv, activating it, installing Django into it, migrating the database.

- Making a mistake in the virtualenv path on the Web tab – there will usually be a little red error message on there, if there is a problem.

- Making a mistake in the WSGI configuration file – did you get the path to your my-first-blog folder right?

- Did you pick the same version of Python for your virtualenv as you did for your web app? Both should be 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

And remember, your coach is here to help!

# You are live!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!