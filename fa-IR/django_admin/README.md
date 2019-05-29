# پنل مدیریت در جنگو

برای اضافه کردن، ویرایش و حذف پست‌هایی که تازگی مدل آن‌ها را درست کرده‌ایم، از جنگجو ادمین یا پنل مدیریت جنگو استفاده خواهیم کرد.

فایل `blog/admin.py` را در ویرایشگر کد باز کنید و محتوای آن را با خطوط زیر عوض کنید:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

همانطور که می‌بینید، مدل Post را که در بخش قبل تعریف کرده بودیم فراخوانی کرده‌ایم. برای اینکه مدل ما در صفحه مدیریت نمایش داده شود، ما باید مدل را با دستور ` admin.site.register(Post)` ثبت کنیم.

خوب، وقت آن است که به مدل Post نگاهی بیندازیم. به خاطر داشته باشید که دستور `python manage.py runserver` را در کنسول اجرا کنید تا وب سرور اجرا شود. به مرورگر خود بروید و آدرس http://127.0.0.1:8000/admin/ را تایپ کنید. شما یک صفحه لاگین را به شکل زیر می‌بینید:

![صفحه ورود](images/login_page2.png)

برای ورود به سیستم، باید یک کاربر *superuser* ایجاد کنید - یک حساب کاربری که بر روی همه چیز در سایت کنترل داشته باشد. به محیط خط فرمان بازگردید و دستور `python manage.py createsuperuser` را تایپ کنید و Enter را فشار دهید.

> به یاد داشته باشید، برای نوشتن دستورات جدید در حالی که وب سرور در حال اجرا است، یک پنجره ترمینال جدید را باز کرده و محیط مجازی خود را فعال کنید. ما در مورد نحوه نوشتن دستورات جدید در بخش ** اولین پروژه جانانو شما! </ 0> در بخش ** شروع وب سرور </ 0> بررسی کردیم.</p> </blockquote> 
> 
> {% filename %}Mac OS X or Linux:{% endfilename %}
> 
>     (myvenv) ~/djangogirls$ python manage.py createsuperuser
>     
> 
> % filename %}}ویندوز% endfilename %}}
> 
>     (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
>     
> 
> هنگام درخواست، نام کاربری خود را (حروف کوچک، فضایی)، آدرس ایمیل و رمز عبور تایپ کنید. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. خروجی باید مانند این باشد (که در آن نام کاربری و ایمیل باید خود شما باشد):
> 
>     Username: ola
>     Email address: ola@example.com
>     Password:
>     Password (again):
>     Superuser created successfully.
>     
> 
> به مرورگر خود برگردید با اعتبار کاربری کاربر که انتخاب کرده اید وارد شوید شما باید داشبورد مدیر جنگجو را ببینید.
> 
> ![جنگجو مدیر](images/django_admin3.png)
> 
> Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)
> 
> اطمینان حاصل کنید که حداقل دو یا سه پست (اما نه همه) تاریخ انتشار را تعیین کنید. بعدا مفید خواهد بود.
> 
> ![جنگجو مدیر](images/edit_post3.png)
> 
> If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/
> 
> این احتمالا لحظه ای مناسب برای گرفتن یک قهوه (یا چای) یا چیزی برای خوردن است تا انرژی خود را دوباره تحریک کنید. شما اولین مدل جانگو را ایجاد کردید - شما شایسته یک استراحت کوتاه هستید!