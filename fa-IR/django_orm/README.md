# ORM و QuerySets در جنگو

در این فصل شما نحوه اتصال جنگو به پایگاه داده و روش ذخیره اطلاعات در آن را یاد خواهید گرفت. بگذارید شروع کنیم!

## QuerySet چیست؟

به صورت خلاصه، کوئری‌ست لیستی از تعدادی شیء مربوط به یک مدل خاص است. کوئری‌ست به شما این امکان را می‌دهد که داده‌ها را از پایگاه داده بخوانید، فیلتر کنید یا آن‌ها را مرتب کنید.

ساده‌ترین راه فهمیدن آن، مثال است. پس شروع می‌کنیم.آماده‌اید؟

## کنسول خط فرمان جنگو

کنسول‌های لوکال خود را باز کرده (نه در PythonAnywhere) و این دستور را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    
    

باید پاسخی مانند زیر دریافت کنید:

{% filename %}خط فرمان{% endfilename %}

```python
(InteractiveConsole)
>>>
```

شما در حال حاضر در کنسول تعاملی جنگو هستید. این محل کاملاً شبیه به محیط تعاملی پایتون می‌باشد با این تفاوت که چند ویژگی جادویی جنگو را در بر دارد. :) شما می‌توانید تمامی دستورات پایتون را در اینجا استفاده کنید.

### تمام اشیاء

در ابتدا تمامی پست ها را نمایش می دهیم. با دستور زیر می توان این کار را انجام داد:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

اوه اوه! به خطا خوردیم. این خطا به این معنی است که هیچ پستی وجود ندارد. درست است! فراموش کردیم که پست ها را import کنیم!

{% filename %}خط فرمان{% endfilename %}

```python
>>> from blog.models import Post
```

مدل `Post` را از `blog.models` فراخوانی می‌کنیم. حالا دوباره تمامی پست‌ها را نمایش می‌دهیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

لیستی از پست‌هایی که قبلا ایجاد کرده بودیم درست شد! ما این پست‌ها را با استفاده از صفحه مدیریت جنگو ایجاد کرده‌بودیم. اما حالا می‌خواهیم پست جدیدی با استفاده از پایتون درست کنیم. چطور این کار را انجام می‌دهیم؟

### ساختن شیء

به صورت زیر می‌توان یک شیء جدید از نوع Post در پایگاه داده ایجاد کرد:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

اما ما در اینجا یک عنصر گم شده داریم: `نویسنده`. نیاز هست که یک نمونه از مدل `User` را به عنوان نویسنده برای ساخت شیء جدید تعریف کنیم. نحوه انجام کار به صورت زیر می باشد.

بیایید اول مدل User را فراخوانی کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

چه کاربرانی در پایگاه داده داریم؟ این را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

این همان کاربر اصلی یا superuser است که کمی قبل‌تر ساخته‌ایم! حالا بیایید نمونه ای از روی کاربر اصلی بسازیم (این خط را مطابق نام کاربر اصلی که قبلاً وارد کرده‌اید تغییر دهید):

{% filename %}خط فرمان{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

همان طور که می‌بینید ما یک `کاربر` را به کمک دستور `get` و با ارجاع دادن مقدار 'ola' به متغیر `username` فراخوانی کردیم. خیلی دقیق!

الان ما می‌توانیم پست خود را ایجاد کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

هورا! می‌خواهید امتحان کنیم که آیا درست کار می‌کند؟

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

بنابراین یک پست دیگر در لیست خواهیم داشت!

### اضافه کردن پست های بیشتر

حالا برای تفریح هم که شده می‌توانید پست‌های بیشتری بسازید تا با نحوه کارکرد آن بهتر آشنا شوید. دو یا سه پست دیگربسازید و سپس به مرحله بعد بروید.

### فیلتر کردن اشیاء

بخش مهمی از QuerySet، توانایی فیلتر کردن آن است. در اینجا می‌خواهیم تمام پست‌هایی که کاربر ola ساخته است را پیدا کنیم. در اینجا از عبارت `filter` به جای `all` در `Post.objects.all()` استفاده می‌کنیم. در پرانتز ما شرطی (شرایطی) که لازم است وجود داشته باشد تا شیء مورد نظر به QuerySet اضافه شود را بیان می‌کنیم. در اینجا، شرط ما این است که `author` برابر با `me` باشد. نحوه نوشتن آن در جنگو به این صورت است `author=me`. الان یک کد به صورت زیر داریم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

یا شاید ما بخواهیم تمام پست‌هایی که در فیلد `title` کلمه 'title' را داشته باشند پیدا کنیم؟

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **نکته** دقت کنید که ۲تا کاراکتر underscore ( `ـ`) در میان `title` و `contains` وجود دارد. ORM جنگو از این قانون استفاده می‌کند تا عملیات یا فیلتر مورد نظر را ("contains") از نام فیلد ("title") جدا کند. اگر فقط از یک underscore استفاده کنید خطایی مانند این دریافت خواهید کرد "FieldError: Cannot resolve keyword title_contains".

همچنین می‌توانید لیستی از تمام پست‌های منتشر شده دریافت کنید. ما این کار را با فیلتر کردن همه پست‌هایی که برای آن‌ها `published_date` تعیین کرده بودیم انجام می‌دهیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

متاسفانه پست هایی که از طریق کنسول پایتون اضافه کرده‌ایم هنوز منتشر نشده‌اند. اما می‌توانیم این وضعیت را تغییر دهیم! ابتدا یک نسخه از پست‌هایی که می‌خواهیم منتشر کنیم تهیه می‌کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

و حالا با متد `publish` آن را منتشر می کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> post.publish()
```

الان دوباره سعی کنید لیستی از پست‌های منتشر شده را نمایش دهید (دکمه جهت بالا در کیبورد را ۳ بار زده و `enter` کنید):

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### مرتب‌سازی اشیاء (Ordering objects)

QuerySet ها همچنین به شما اجازه می‌دهند لیستی از اشیاء را مرتب کنید. بیایید آن‌ها را بر اساس `created_date`، مرتب کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

همچنین با اضافه کردن `-` در ابتدای دستور می‌توانیم اشیاء را به صورت معکوس مرتب کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### کوئری‌های پیچیده از طریق زنجیره توابع

همانطور که دیدید برخی از توابع در `Post.objects`، یک کوئری ست باز می‌گردانند. همان تابع می‌تواند مجدداً بر روی یک کوئری ست اعمال شود و کوئری ست دیگری برگرداند. بنابراین، شما می‌توانید تاثیر آن‌ها را به صورت **زنجیره‌ای** با هم ترکیب کنید:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

این روش واقعاً قدرتمند است و به شما اجازه می‌دهد کوئری‌های پیچیده‌ای بسازید.

موفق شدیم! شما الان برای قسمت بعدی آماده هستید. برای بستن پوسته (shell) دستور زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> exit()
```