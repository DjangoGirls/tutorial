# اولین پروژه جنگو شما!

> قسمت‌هایی از این بخش بر اساس دوره آموزشی Geek Girls Carrots بنا شده است (https://github.com/ggcarrots/django-carrots).
> 
> قسمت‌هایی هم بر اساس دوره آموزشی [django-marcador tutorial](http://django-marcador.keimlink.de/) تحت مجوز بین المللی Creative Commons Attribution-ShareAlike 4.0 تهیه شده است. امتیاز دوره آموزشی django-marcador متعلق به Markus Zapke-Gründemann و همکاران است.

قصد داریم یک وبلاگ کوچک بسازیم!

در قدم اول یک پروژه جدید جنگو میسازیم. در واقع ساختن یک پروژه جنگو شامل اجرا کردن دستوراتی است که توسط جنگو آماده شده و با اجرای آن، بدنه اصلی پروژه ساخته می‌شود. این بدنه، شامل تعدادی پوشه و فایل است که ما بعداً از آن ها استفاده خواهیم کرد.

نام برخی از این فایل‌ها و پوشه‌ها برای جنگو بسیار مهم است. شما نباید نام فایل‌‌هایی که الان می‌خواهیم بسازیم را تغییر دهید. همچنین تغییر پوشه‌های آنها هم ایده خوبی نیست. جنگو باید در یک ساختار مشخص مورد استفاده قرار گیرد تا بتواند موارد مهم را پیدا کند.

> به یاد داشته باشید که همه دستورات را در محیط مجازی (virtualenv) اجرا کنید. اگر پیشوند `(myvenv)` را در کنسول خط فرمان نمی‌بینید، باید محیط مجازی را فعال کنید. فعال کردن محیط مجازی را در قسمت **کارکردن با محیط مجازی** از بخش **نصب جنگو** توضیح داده‌ایم. در ویندوز با تایپ `myvenv\Scripts\activate` و در لینوکس یا مک با نوشتن `source myvenv/bin/activate` می‌توانید محیط مجازی را فعال کنید.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

در کنسول لینوکس یا مک باید دستورات زیر را اجرا کنید. **فراموش نکنید که `علامت نقطه` را در آخر عبارت بگذارید!**

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> علامت `.` مهم است برای اینکه به سیستم می‌گوید که جنگو را در همین پوشه جاری نصب کند (علامت `.` به پوشه ای که در حال حاضر در آن هستیم اشاره میکند).
> 
> **نکته** وقتی دستور بالا را می‌نویسید به یاد داشته باشید که فقط بخشی را می‌نویسید که با `django-admin` شروع می‌شود. بخش `(myvenv) ~/djangogirls$` نشان می‌دهد که شما باید دستورات ورودی را در مقابل آن بنویسید.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

در ویندوز باید دستور زیر را اجرا کنید. **(فراموش نکنید که `علامت نقطه` را در انتها بگذارید)**:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> علامت `.` مهم است برای اینکه به سیستم می‌گوید که جنگو را در همین پوشه جاری نصب کند (علامت `.` به پوشه ای که در حال حاضر در آن هستیم اشاره میکند).
> 
> **نکته** وقتی دستور بالا را می‌نویسید به یاد داشته باشید که فقط بخشی را می‌نویسید که با `django-admin.exe` شروع می‌شود. بخش `(myvenv) C:\Users\Name\djangogirls>` نشان می‌دهد که شما باید دستورات ورودی را در مقابل آن بنویسید.

<!--endsec-->

`django-admin.py` دستوری است که پوشه‌ها و فایل‌ها را برای شما می‌سازد. الان باید ساختار پوشه‌ها و فایل‌های شما شبیه به این باشد:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **نکته**: در ساختار پوشه‌ها، شما پوشه `venv` را هم که قبلاً ساخته ایم خواهید دید.

`manage.py` دستوری است که به مدیریت سایت کمک می‌کند. به کمک این دستور (و برخی چیزهای دیگر) و بدون نصب نرم افزارهای دیگر می‌توانیم یک وب سرور بر روی کامپیوتر خود راه اندازی کنیم.

فایل `settings.py` حاوی تنظیمات وبسایت شما است.

یادتان می‌آید در مورد حامل نامه و این موضوع که: کجا را باید نگاه کند تا بتواند نامه را به مقصد برساند‌، صحبت کردیم؟ فایل `urls.py` شامل الگوهایی است که توسط `urlresolver` استفاده می‌شوند.

اجازه بدهید الان از سایر فایل‌ها چشم‌پوشی کنیم چون آن‌ها را تغییر نخواهیم داد. تنها چیزی که باید مواظب آن باشید این است که آن‌ها را اشتباهی پاک نکنید!

## تغییر تنظیمات

می‌خواهیم کمی تغییرات در فایل `mysite/settings.py` ایجاد کنیم. این فایل را در ویرایشگر کد، که پیش از این نصب کرده اید باز کنید.

**نکته**: به یاد داشته باشید که فایل `settings.py`، یک فایل معمولی مانند بقیه فایل‌ها است. شما می‌توانید این فایل را به کمک ویرایشگر کد با استفاده از منو "file -> open"، باز کنید. از این طریق یک پنجره معمولی باز می‌شود که می‌توانید به کمک آن فایل `settings.py` را پیدا کنید و آن را انتخاب کنید. به جای این کار، می‌توانید در بین پوشه‌ها، پوشه djangogirls را پیدا کنید بر روی آن راست کلیک کنید. سپس نام ویرایشگر کد خود را از لیست به نمایش درآمده انتخاب کنید. انتخاب ویرایشگر مهم است چرا که ممکن است نرم افزارهای دیگر هم فایل را باز کنند ولی اجازه ویرایش کردن به شما ندهند.

خیلی خوب خواهد بود که زمان درست را در وبسایت خود داشته باشیم. به [لیست منطقه های زمانی ویکیپدیا](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) بروید و محدوده زمانی مناسب را برای خود انتخاب کنید (TZ) (مثلاً `Asia/Tehran`).

در فایل `settings.py` خطی را که حاوی `TIME_ZONE` است پیدا کنید و آن را اصلاح کنید تا منطقه زمانی شما را نشان دهد. مثلاً:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Asia/Tehran'
```

یک شناسه زبان شامل دو بخش است یکی زبان، مثلاً `en` برای انگلیسی و `fa` برای فارسی، و دیگری کد کشور، مثلاً `de` برای آلمان و `ir` برای ایران. اگر انگلیسی زبان اصلی شما نیست می‌توانید این شناسه را تغییر دهید تا پیغام‌های جنگو به زبان خودتان برای شما نمایش داده شود. بنابراین شما ترجمه دکمه "Cancel" را به زبانی که در اینجا معرفی کرده اید خواهید دید. [جنگو به زبان‌های زیادی ترجمه شده و قابل استفاده است](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

اگر زبان دیگری را می‌خواهید شناسه زبان را در خط زیر تغییر دهید:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

علاوه بر این نیاز داریم تا آدرس فایل‌های ثابت یا ایستا را نیز اضافه کنیم. (بعداً به طور کامل در این دوره آموزشی به فایل‌های ثابت و CSS خواهیم پرداخت.) به *انتهای* فایل بروید و دقیقاً زیر ورودی `STATIC_URL`، یک خط جدید با عنوان `STATIC_ROOT` اضافه کنید:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

وقتی در این فایل `DEBUG` برابر با `True`باشد و `ALLOWED_HOSTS` خالی باشد، مقادیر هاست `['localhost', '127.0.0.1', '[::1]']` خواهد بود. این هاست در هنگام انتشار وبسایت روی اینترنت، با هاست PythonAnywhere هماهنگ نخواهد بود پس تنظیمات را به این شکل تغییر می‌دهیم:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **نکته**: اگر از کروم بوک استفاده می‌کنید، این خط را هم به انتهای فایل settings.py اضافه کنید: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> اگر از cloud9 استفاده می‌کنید `.amazonaws.com` را به `ALLOWED_HOSTS` اضافه کنید

## راه اندازی یک پایگاه داده

تعداد بسیار زیادی پایگاه داده وجود دارد که می‌تواند داده های وبسایت شما را ذخیره کند. ما از پایگاه داده پیشفرض `sqlite3` استفاده می‌کنیم.

این پایگاه داده از قبل در این بخش از فایل `mysite/settings.py` تعریف شده است:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

برای ساختن یک پایگاه داده برای وبسایتمان، دستور زیر را در کنسول خط فرمان اجرا می‌کنیم: `python manage.py migrate` (هنگام اجرای این دستور باید در پوشه `djangogirls` باشیم جایی که فایل `manage.py` قرار دارد). اگر همه چیز خوب پیش برود باید چیزی شبیه به این را ببینیم:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

تمام شد! وقت آن است که وب سرور را اجرا کنیم و ببینیم آیا وبسایت ما کار می‌کند!

## فعال کردن وب سرور

شما باید در پوشه‌ای باشید که فایل `manage.py` در آن قرار دارد. (در پوشه `djangogirls`). در کنسول خط فرمان، وب سرور را به کمک این دستور فعال می‌کنیم `python manage.py runserver`:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

اگر در Chromebook کار می‌کنید از این دستور استفاده کنید:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

اگر در ویندوز کار می‌کنید و پیغام خطا `UnicodeDecodeError` را دریافت کردید، به جای دستور بالا از این دستور استفاده کنید:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

حالا زمان آن است که چک کنید وبسایت کار می‌کند یا نه. مرورگر خود را باز کنید (فایرفاکس، کروم، سافاری، اینترنت اکسپلورر یا هر چیز دیگر) و آدرس زیر را وارد کنید:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

اگر از Chromebook و Cloud9 استفاده می‌کنید، در پنجره pop-up که در گوشه ی بالا، سمت راست پنجره ی خط فرمان، که در حال اجرای وب سرور است، باز شده است، بر روی آدرس URL ظاهر شده کلیک کنید. این آدرس چیزی شبیه به این است:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

تبریک! شما اولین وبسایت خود را ساخته اید و با یک وب سرور آن را فعال کرده اید! فوق العاده نیست؟

![Install worked!](images/install_worked.png)

توجه داشته باشید که یک کنسول خط فرمان در هر لحظه فقط یک کار را می‌تواند انجام دهد و کنسول خط فرمان که شما قبل تر باز کرده اید در حال اجرای وب سرور است. تا زمانی که وب سرور در حال اجراست و منتظر است تا درخواستی به آن برسد می‌توان چیزی تایپ کرد ولی هیچ دستور جدیدی را نمی‌توان اجرا کرد.

> نحوه عملکرد وب سرور را در بخش **اینترنت چگونه کار می‌کند** دوره کرده ایم.

برای اینکه در زمان فعال بودن وب سرور، دستورات بیشتری را در کنسول خط فرمان تایپ کنید باید یک کنسول جدید باز کنید و محیط مجازی خود را فعال کنید. برای آنکه روش باز کردن یک کنسول جدید را مرور کنید می‌توانید به بخش [آشنایی با خط فرمان](../intro_to_command_line/README.md) نگاهی بیندازید. برای قطع فعالیت وب سرور، به همان کنسولی بروید که وب سرور در آن فعال است و کلید CTRL و C را با هم بزنید (در ویندوز ممکن است لازم باشد کلید CTRL را با کلید Break بزنید).

برای قدم بعدی آماده هستید؟ حالا وقت آن است که کمی محتوا بسازیم!