# پنل مدیریت در جنگو

برای اضافه کردن، ویرایش و حذف پستهایی که ما فقط مدل کرده ایم، از مدیر جنگجو استفاده خواهیم کرد.

بیایید فایل ` وبلاگ/ مدیریت.py </ 0> را باز کنیم و محتویات آن را با این قرار دهید:</p>

<p>{% filename %}}وبلاگ/مدیر.پی{% endfilename %}}</p>

<pre><code class="python">مشارکت جنگجو از وارد کردن مدیر 
از .مدلها واردات پست

مدیر .سایت .ثبت (پست)
مشارکت
`</pre> 

همانطور که می بینید، مدل وارد شده (شامل) را که در فصل قبل تعریف شده وارد می کنیم. برای اینکه مدل ما در صفحه مدیریت نمایش داده شود، ما باید مدل را با ` admin.site.register (ارسال) </ 0> ثبت نام کنیم.</p>

<p>خوب، زمان برای نگاه کردن به مدل پست ما. به خاطر داشته باشید که <code> پایتونمدیریت با سرور درحال اجرا </ 0> را در کنسول اجرا کنید تا سرور وب را اجرا کنید. به مرورگر خود بروید و آدرس http://127.0.0.1:8000/admin/ را تایپ کنید. شما یک صفحه ورود به این صفحه را می بینید:</p>

<p><img src="images/login_page2.png" alt="صفحه ورود" /></p>

<p>برای ورود به سیستم، باید یک کاربر <em> superuser </ 0> ایجاد کنید - یک حساب کاربری که بر روی همه چیز در سایت کنترل داشته باشد. بازگشت به خط فرمان، <code> پایتون مدیریت با ایجاد کاربر فوق العاده </ 0> را تایپ کنید و ورود را فشار دهید.</p>

<blockquote>
  <p>به یاد داشته باشید، برای نوشتن دستورات جدید در حالی که وب سرور در حال اجرا است، یک پنجره ترمینال جدید را باز کرده و مجازی خود را فعال کنید. ما در مورد نحوه نوشتن دستورات جدید در بخش <b> اولین پروژه جانانو شما! </ 0> در بخش <b> شروع وب سرور </ 0> بررسی کردیم.</p>
</blockquote>

<p>{% filename %}Mac OS X or Linux:{% endfilename %}</p>

<pre><code>(myvenv) ~/djangogirls$ python manage.py createsuperuser
`</pre> 

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

اگر می خواهید بیشتر در مورد مدیر جیانگو بدانید، باید مستندات جانگو را بررسی کنید: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

این احتمالا لحظه ای مناسب برای گرفتن یک قهوه (یا چای) یا چیزی برای خوردن است تا انرژی خود را دوباره تحریک کنید. شما اولین مدل جانگو را ایجاد کردید - شما شایسته یک استراحت کوتاه هستید!