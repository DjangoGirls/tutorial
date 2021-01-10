# داده‌های پویا در template ها

ما قطعات مختلفی داریم: مدل `Post` که در فایل `models.py` تعریف شده است، `post_list` که در فایل `views.py` تعریف شده و یک template که ساخته‌ایم. ولی واقعاً چطور پست‌های وبلاگمان را در قالب HTML نشان می‌دهیم؟ چون این کاری است که می‌خواهیم انجام دهیم؛ گرفتن محتوا (مدل‌هایی که در پایگاه داده ذخیره شده اند) و نشان دادن آن در قالب مورد نظر خودمان، درست است؟

این دقیقاً همان چیزی است که *view*ها برای آن طراحی شده اند: وصل کردن مدل ها و قالب‌ها. در *ویو* `post_list` ما نیاز داریم که مدل مورد نظر را بگیریم و آن را به تمپلیت مناسب آن ارجاع دهیم. ما در *ویو* تصمیم می‌گیریم که چه چیزی (model) در تمپلیت نشان داده شود.

بسیار خوب، چطور به این هدف برسیم؟

لازم است که فایل`blog/views.py` را در ویرایشگر کد باز کنیم. تا اینجا *ویو* `post_list` شبیه به این است:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

به یاد دارید که در مورد اضافه کردن کدهای نوشته شده در فایل‌های مختلف صحبت کردیم؟ حالا وقت آن است که مدلی را که در فایل `models.py` نوشتیم به این فایل اضافه کنیم. ما خط `from .models import Post` را به این صورت اضافه می‌کنیم:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

نقطه قبل از `models` به معنی *پوشه جاری* یا *اپلیکیشن جاری* است. هر دو فایل `views.py` و `models.py` در یک پوشه قرار دارند. پس به این معنی است که ما می‌توانیم از `.` به همراه نام فایل (بدون پسوند `.py`) استفاده کنیم. سپس نام مدل را فراخوانی می‌کنیم (`Post`).

قدم بعدی چیست؟ برای اینکه پست‌های وبلاگی واقعی که قبلاً ساخته ایم را فراخوانی کنیم به چیزی نیاز داریم که به آن `کوئری ست` یا `QuerySet` می‌گوییم.

## QuerySet

شما باید با نحوه کار کوئری ست‌ها آشنا باشید. ما در [بخش ORM جنگو](../django_orm/README.md) در مورد آن‌ها صحبت کرده ایم.

حالا ما پست‌هایی را می‌خواهیم که بر اساس `تاریخ انتشار` یا published_date، مرتب شده اند، درست است؟ این کار را هم در بخش کوئری ست انجام داده ایم!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

حالا فایل `blog/views.py` را در ویرایشگر کد باز کنید و این تکه کد را به تابع `def post_list(request)` اضافه کنید. فراموش نکنید که خط `from django.utils import timezone` را هم به بالای فایل اضافه کنید:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

برای نمایش QuerySet در لیست ارسال های بلاگ، دو کار باقی مانده است که باید انجام شود:

1. فرستادن کوئری ست `posts` به تمپلیت با تغییر تابع `render`. الان این کار را انجام می‌دهیم.
2. اصلاح تمپلیت برای نمایش دادن کوئری ست `posts`. این کار را در بخش‌های بعد انجام خواهیم داد.

توجه داشته باشید که ما یک *متغیر* برای کوئری ست مان درست کردیم: `posts`. آن را به عنوان نام کوئری ست در نظر بگیرید. از این به بعد ما به کمک همین نام به این کوئری ست مراجعه می‌کنیم.

در تابع `render` ما یک پارامتر `request` داریم (درخواستی است که کاربر از طریق اینترنت برای ما ارسال کرده است) و یک پارامتر دیگر که نام فایل template است (`'blog/post_list.html'`). آخرین پارامتر ما، `{}`، محلی است که می‌توانیم چیزهایی را برای استفاده در template در آن قرار دهیم. باید برای این چیزها اسم تعریف کنیم (مثلاً همین متغیر `'posts'`). :) باید به این صورت برای فایل تمپلیت ارسال شوند: `{'posts': posts}`. توجه کنید که بخش سمت چپ علامت `:` از نوع رشته یا string است و لازم است که با علامت نقل قول `''` محصور شود.

در نتیجه فایل `blog/views.py` ما شبیه به این خواهد شد:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

همین! وقت آن است که به فایل template برگردیم و این کوئری ست را نمایش دهیم!

دوست دارید در مورد کوئری ست‌ها بیشتر بدانید؟ به اینجا نگاهی بیندازید: https://docs.djangoproject.com/en/2.2/ref/models/querysets/