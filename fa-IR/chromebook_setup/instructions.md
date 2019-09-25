اگر از Chromebook استفاده نمی‌کنید می‌توانید [از این بخش ](http://tutorial.djangogirls.org/en/installation/#install-python) عبور کنید. اگر از آن استفاده می‌کنید تجربه نصب شما کمی متفاوت خواهد بود. شما می توانید بقیه دستورالعمل نصب را نادیده بگیرید.

### IDE ابری (PaizaCloud Cloud IDE, AWS Cloud9)

IDE ابری ابزاری است که به شما دسترسی به یک ویرایشگر کد و یک کامپیوتر در حال کار کردن روی اینترنت را می‌دهد که می‌توانید نصب، نوشتن و اجرای برنامه‌ها را در آن انجام دهید. در زمان این آموزش، IDE ابری به عنوان * دستگاه محلی شما * عمل خواهد کرد. شما همچنان مانند سایر همکلاسی‌ها که از OS X، اوبونتو یا ویندوز استفاده می‌کنند، دستورات را در ترمینال اجرا خواهید کرد اما ترمینال شما به کامپیوتری که IDE ابری برای شما آماده کرده متصل است. در اینحا دستورالعمل استفاده از IDE های ابری (PaizaCloud Cloud IDE و AWS Cloud9) را خواهید دید. شما می‌توانید یکی از IDE های ابری را انتخاب کنید و دستورالعمل را دنبال کنید.

#### IDE ابری PiazaCloud

1. به [PaizaCloud Cloud IDE](https://paiza.cloud/) بروید
2. یک حساب کاربری بسازید
3. بر روی *New Server* کلیک کنید و گزینه Django app را انتخاب کنید
4. دکمه Terminal را (در سمت چپ صفحه) بزنید

حالا شما باید صفحه ای با یک ستون کناری و کلیدهایی در سمت چپ ببینید. بر روی دکمه "Terminal" کلیک کنید تا پنجره ترمینال با پیغامی شبیه به این باز شود:

{% filename %}Terminal{% endfilename %}

    $
    

ترمینال در IDE ابری PiazaCloud برای دستورات شما آماده شده است. شما می‌توانید اندازه این پنجره را تغییر دهید تا کمی بزرگتر دیده شود.

#### AWS Cloud9

در حال حاضر برای استفاده از Cloud 9 باید با اکانت AWS ثبت نام کنید و مشخصات کارت اعتباری را نیز وارد کنید.

1. Cloud 9 را از [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp) نصب کنید
2. به [c9.io](https://c9.io) بروید و بر روی *Get started with AWS Cloud9* کلیک کنید
3. با یک حساب AWS ثبت نام کنید (به اطلاعات کارت اعتباری نیاز است اما می‌توانید به رایگان از آن استفاده کنید)
4. در داشبورد AWS عبارت *Cloud9* را در محل جستجو وارد کنید و کلید جستجو را بزنید
5. در داشبورد Cloud 9 بر روی *Create environment* کلیک کنید
6. نام آن را *django-girls* بگذارید
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### محیط مجازی

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).