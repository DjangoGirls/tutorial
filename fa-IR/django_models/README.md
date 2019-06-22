# مدل در جنگو

آنچه الان می‌خواهیم بسازیم چیزی است که تمام پست‌های ما در وبلاگ را ذخیره می‌کند. اما برای اینکه بتوانیم این کار را بکنیم باید کمی در مورد مفهوم `شیء` صحبت کنیم.

## اشیاء

مفهومی در برنامه نویسی وجود دارد که به آن `برنامه‌نویسی شیء‌گرا` گفته می‌شود. به این معنی که به جای آنکه همه چیز را در ردیف‌هایی طولانی از دستورات بنویسیم می‌توانیم مدل هایی درست کنیم و تعریف کنیم که این مدل ها چگونه با هم ارتباط داشته باشند.

یک شیء چیست؟ یک شیء مجموعه‌ای از خصوصیات و اعمال است. ممکن است کمی عجیب باشد اما برای شما مثالی خواهیم زد.

اگر بخواهیم مدلی برای یک گربه بسازیم یک شیء به نام `Cat` میسازیم که دارای خصوصیاتی است مانند `رنگ`، `سن`، `حالت` (مثلاً خوب، بد یا خواب‌آلود) و `مالک` (که می‌تواند اشاره به یک شیء `Person` یا در در مورد گربه‌های ولگرد، بدون اشاره به فردی خاص، خالی بماند).

یک شیء از نوع `Cat` دارای فعالیتی‌هایی مانند: `خُرخُر کردن`، `خراشیدن` و یا `غذا خوردن` است. (برخی مواقع به گربه، `غذای گربه` می‌‌دهیم که می‌تواند یک شیء جداگانه باشد که خصوصیت `مزه` داشته باشد).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

بنابراین ایده اصلی آن است که چیزهای واقعی در کدها با خصوصیات (که به آن `object properties` می‌گوییم) و اعمال (که به آن `methods` می‌گوییم) تعریف شوند.

ما می‌خواهیم یک وبلاگ درست کنیم، درست است؟ چگونه یک مدل برای پست‌های وبلاگی بسازیم؟

باید به این سوال پاسخ دهیم که: یک پست وبلاگی چیست؟ چه خصوصیاتی دارد؟

خب، پست وبلاگی ما قطعاً به مقداری نوشته و یک عنوان نیاز دارد، درست است؟ بسیار خوب خواهد بود که بدانیم چه کسی مطلب را نوشته است، پس به نویسنده هم احتیاج داریم. سرانجام می‌خواهیم بدانیم که این مطلب در چه تاریخی نوشته و منتشر شده است.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

چه کارهایی با یک پست وبلاگی می‌توان انجام داد؟ بسیار جالب خواهد بود که `متدهایی` داشته باشیم که بتواند یک پست را منتشر کند. چطور است؟

بنابراین به یک متد انتشار یا `publish` نیاز داریم.

حالا که می‌دانیم دقیقاً به چه چیزی احتیاج داریم بیایید مدل سازی در جنگو را شروع کنیم!

## مدل در جنگو

حالا که می‌دانیم شیء چیست، می‌توانیم یک مدل جنگویی برای پست‌های وبلاگ‌مان بسازیم.

یک مدل در جنگو نوعی شیء ویژه است که در `پایگاه داده` یا database ذخیره می‌شود. یک پایگاه داده مجموعه‌ای از اطلاعات است. جایی است که در آن اطلاعات مربوط به کاربرها، پست‌های وبلاگی و غیره را نگهداری می‌کنیم. ما از پایگاه داده SQLite برای ذخیره اطلاعات استفاده می‌کنیم. این پایگاه داده، پایگاه داده پیشفرض در جنگو است و الان برای ما کافی است.

شما می‌توانید یک مدل را در پایگاه داده، چیزی شبیه به یک صفحه گسترده با ستون‌ها (فیلدها) و ردیف‌ها(داده‌ها) تصور کنید.

### ساختن یک اپلیکیشن

برای آنکه همه چیز مرتب باشد ما یک برامه مجزا (اپلیکیشن) در پروژه خود خواهیم ساخت. بسیار خوب است که همه چیز از ابتدا مرتب باشد. برای ساخت یک برنامه جدید باید دستور زیر را در خط فرمان اجرا کنیم (در پوشه `djangogirls` و جایی که فایل `manage.py` وجود دارد):

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

خواهید دید که یک پوشه جدید به نام `blog` ساخته شده و شامل تعدادی فایل است. پوشه‌ها و فایل‌ها در پروژه ما باید شبیه به این باشد:

    djangogirls
    ┤── blog
    │   ┤── __init__.py
    │   ┤── admin.py
    │   ┤── apps.py
    │   ┤── migrations
    │   │   ┘── __init__.py
    │   ┤── models.py
    │   ┤── tests.py
    │   ┤── urls.py
    │   ┘── views.py
    ┤── db.sqlite3
    ┤── manage.py
    ┤── mysite
    │   ┤── __init__.py
    │   ┤── settings.py
    │   ┤── urls.py
    │   ┘── wsgi.py
    ┘── requirements.txt
    

بعد از ساختن این برنامه، باید به جنگو بگوییم تا از آن استفاده کند. این کار را در فایل `mysite/settings.py` انجام می‌دهیم -- این فایل را در ویرایشگر کد باز کنید. باید بخش `INSTALLED_APPS` را پیدا کنیم و یک خط شامل `'blog',` را دقیقاً قبل از علامت `]` اضافه کنیم. پس در نهایت شبیه این خواهد بود:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### ساختن مدل برای پست وبلاگ

در فایل `blog/models.py` ما تمام اشیائی را که به آن `مدل Model` می‌گوییم تعریف می‌کنیم. اینجا فضایی است که قالب پست‌های وبلاگی را تعریف می‌کنیم.

بیاید فایل `blog/models.py` را در کد ادیتور باز کنیم، تمام محتویات ان را پاک کینم و کد‌های مانند این را در ان بنویسی:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> مطمئن بشوید که در هر طرف `str` دوبار از کارارکتر `_` استفاده کنید. از این قرارداد زیاد در پایتون استفاده می‌شود که به آن "dunder" هم می‌گویند که مخفف "double-underscore" است.

عجیب به نظر می‌رسد؟ نگران نباشید ما درباره عملکرد این خط ها توضیح خواهیم داد!

تمام خطوطی که با `from` یا `import` شروع می‌شوند خطوطی هستند که محتوایی را از یک فایل دیگر به این فایل اضافه می‌کنند. پس به جای آنکه یک محتوای یکسان را از در هر فایل تکرار کنیم، می‌توانیم از این الگو استفاده کنیم `from ... import ... `.

`class Post(models.Model):` – این خط مدل ما را تعریف می‌کند (که یک `شیء` یا object است).

- `class` کلید واژه‌ای است که نشان می‌دهد در حال تعریف کردن یک شیء هستیم.
- `Post` نام مدل ما است. می‌توانیم به آن نام متفاوتی بدهیم (اما نباید از کاکترهای خاص و اسپیس استفاده کنیم). همیشه نام یک کلاس را با حروف بزرگ شروع کنید.
- `models.Model` به این معنی است که Post یک مدل جنگویی است، بنابراین جنگو می‌داند که این مدل باید در پایگاه داده ذخیره شود.

حالا ویژگی‌هایی که در مورد آن‌ها صحبت کردیم را اضافه می‌کنیم: `title`، `text`، `created_date`، `published_date` و `author`. برای این کار باید ویژگی های هرکدام از این‌ها را مشخص کنیم( آیا متن است؟ یا عدد؟ یا تاریخ؟ یا ارتباطی با یک شیء دیگر، مثلا کاربر؟

- `models.CharField` – این عبارت مشخص می‌کند که ویژگی مورد نظر از جنس متن با تعداد کاراکتر محدود است.
- `models.TextField` – این عبارت برای اختصاص دادن متن با تعداد کاراکتر نامحدود است. به نظر برای متن پست‌های وبلاگی مناسب است، درست است؟
- `models.DateTimeField` – مشخص کننده تاریخ و زمان است.
- `models.ForeignKey` – نشان دهنده ارتباط به یک مدل دیگر است.

ما همه قطعات کد را توضیح نخواهیم داد برای آنکه زمان بسیار زیادی می‌گیرد. اگر بخواهید در مورد انواع نمونه‌های ستون‌های (فیلد) مدل‌ها بدانید باید به مستندات جنگو در آدرس زیر نگاهی بیندازید (https://docs.djangoproject.com/en/2.0/ref/models/fields/#field-types).

What about `def publish(self):`? This is exactly the `publish` method we were talking about before. `def` means that this is a function/method and `publish` is the name of the method. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods often `return` something. There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

If something is still not clear about models, feel free to ask your coach! We know it is complicated, especially when you learn what objects and functions are at the same time. But hopefully it looks slightly less magic for you now!

### Create tables for models in your database

The last step here is to add our new model to our database. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. It will look like this:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Hurray! Our Post model is now in our database! It would be nice to see it, right? Jump to the next chapter to see what your Post looks like!