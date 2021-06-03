اگر از Chromebook استفاده نمی‌کنید می‌توانید [از این بخش ](http://tutorial.djangogirls.org/en/installation/#install-python) عبور کنید. اگر از آن استفاده می‌کنید تجربه نصب شما کمی متفاوت خواهد بود. شما می توانید بقیه دستورالعمل نصب را نادیده بگیرید.

### IDE ابری (PaizaCloud Cloud IDE, AWS Cloud9 و Glitch.com)

IDE ابری ابزاری است که به شما دسترسی به یک ویرایشگر کد و یک کامپیوتر در حال کار کردن روی اینترنت را می‌دهد که می‌توانید نصب، نوشتن و اجرای برنامه‌ها را در آن انجام دهید. در زمان این آموزش، IDE ابری به عنوان * دستگاه محلی شما * عمل خواهد کرد. شما همچنان مانند سایر همکلاسی‌ها که از OS X، اوبونتو یا ویندوز استفاده می‌کنند، دستورات را در ترمینال اجرا خواهید کرد اما ترمینال شما به کامپیوتری که IDE ابری برای شما آماده کرده متصل است. در اینحا دستورالعمل استفاده از IDE های ابری ( PaizaCloud Cloud IDE، AWS Cloud9 و Glitch.com) را خواهید دید. شما می‌توانید یکی از IDE های ابری را انتخاب کنید و دستورالعمل را دنبال کنید.

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
7. در هنگام انجام تنظیمات، در بخش "Environment Type" گزینه *Create a new instance for environment (EC2)* را و در بخش "Instance type" گزینه *t2.micro* را انتخاب کنید ("Free-tier eligible" را نشان خواهد داد). تنظیمات پیشفرض صرفه جویانه و خوب است و شما هم باقی تنظیمات پیشفرض را نگه دارید.
8. بر روی *Next step* کلیک کنید
9. بر روی *Create environment* کلیک کنید

حالا باید صفحه‌ای با یک نوار کناری، یک صفحه اصلی بزرگ با مقداری نوشته و یک صفحه کوچک در پایین ببینید که شبیه به این خواهد بود:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

این محدوده پایین، ترمینال شماست. شما می‌توانید از این ترمینال برای فرستادن دستورات به کامپیوتر Cloud 9 استفاده کنید. می‌توانید ابعاد این پنجره را تغییر دهید تا کمی بزرگتر دیده شود.

#### IDE ابری Glitch.com

1. به [Glitch.com](https://glitch.com/) بروید 
2. یک حساب کاربری (https://glitch.com/signup) بسازید یا از حساب GitHub خود استفاده کنید. (راهنمای استفاده از حساب GitHubرا در زیر ببینید)
3. Click *New Project* and choose *hello-webpage*
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### محیط مجازی

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).