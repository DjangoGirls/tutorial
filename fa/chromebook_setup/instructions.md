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
3. بر روی *New Project* کلیک کنید و گزینه *hello-webpage* را انتخاب کنید
4. بر روی گزینه کشویی Tools کلیک کنید (در سمت چپ و پایین صفحه)، سپس بر روی دکمه Terminal کلیک کنید تا یک کنسول خط فرمان باز شود: 

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

هنگامی که از Glitch.com به عنوان ویرایشگر ابری خود استفاده می‌کنید، لازم نیست که یک محیط مجازی بسازید، به جای آن فایل‌های زیر را باید بسازید:

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

وقتی این فایل‌ها ساخته شدند، به Terminal بروید و دستورات زیر را اجرا کنید تا اولین پروژه جنگو شما ساخته شود:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

برای دیدن جزییات مربوط به پیغام خطا، می‌توانید لاگ عیب‌یابی جنگو را در اپلیکیشن Glitch فعال کنید. به سادگی کد زیر را به انتهای فایل `mysite/settings.py` اضافه کنید.

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

این کار یک فایل `debug.log` می‌سازد که جزییات عملیات جنگو و پیغام‌های خطای احتمالی، در آن است، به کمک این فایل عیب‌یابی وب‌سایت بسیار ساده‌تر می‌شود.

اولین ریستارت پروژه Glitch‌ موفقیت‌آمیز نخواهد بود. (اگر بر روی منوی کشویی `Show` کلیک کنید و سپس `In a New Window` را بزنید، پیغام خطای `DisallowedHost` را دریافت خواهید کرد) در مورد این مرحله نگران نباشید، این آموزش این مشکل را به زودی و پس از به روزرسانی تنظیمات پروژه که در فایل `mysite/settings.py` است، حل خواهد کرد.

### محیط مجازی

یک محیط مجازی (Virtual Environment یا virtualenv) شبیه یک جعبه خصوصی است که ما می‌توانیم کدهای کامپیوتری مربوط به یک پروژه را در آن جمع کنیم. ما از آن‌ها استفاده می‌کنیم تا تکه‌های مختلف کدهای هر پروژه را جدا از پروژه دیگر نگه داریم تا بین پروژه‌ها تداخل پیش نیاید.

بعد، دستورات زیر را اجرا کنید:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(توجه کنید که در خط آخر ما از یک علامت مد و یک مساوی استفاده کردیم: `~=`).

### GitHub

یک حساب کاربری [GitHub](https://github.com) بسازید.

### PythonAnywhere

دوره آموزشی جنگوگرلز شامل بخشی است به نام فاز دیپلوی یا Deployment، که شامل گرفتن و انتقال دادن کدهای وبسایت شما به یک کامپیوتر در دسترس عموم (به نام سرور) است تا سایرین هم بتوانند کار شما را ببینند.

اگر این دوره آموزشی را بر روی Chromebook که خودش کامپیوتری بر روی اینترنت است (در مقابل لپ تاپ‌های معمولی که کامپیوتری محلی محسوب می‌شوند)، انجام می‌دهید این بخش کمی عجیب خواهد بود. با این‌حال، استفاده از Cloud 9 به عنوان یک محیط کاری برای کارهای در جریان و استفاده از Python Anywhere به عنوان یک فضای معرفی و نمایش پروژه هایی که در طول زمان کامل می‌شوند، مفید است.

بنابراین یک حساب کاربری جدید در [www.pythonanywhere.com](https://www.pythonanywhere.com) بسازید.