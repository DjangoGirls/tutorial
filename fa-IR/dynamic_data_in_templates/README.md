# داده های پویا در templates

ما قطعات مختلفی داریم: مدل `Post` که در فایل `models.py` تعریف شده است، `post_list` که در فایل `views.py` تعریف شده و یک template که ساخته ایم. ولی واقعاً چطور پست‌های وبلاگمان را در در قالب HTML تعریف شده نشان می‌دهیم؟ چون این چیزی است که ما می‌خواهیم انجام دهیم، گرفتن محتوا (مدل‌هایی که در پایگاه داده ذخیره شده اند) و نشان دادن آن در قالب مورد نظر خودمان، درست است؟

این دقیقاً همان چیزی است که *view*ها برای آن طراحی شده اند: وصل کردن مدل ها و قالب‌ها. در نمای(view) `post_list` ما نیاز داریم که مدل مورد نظر را بگیریم و آن را به قالب مناسب آن ارجاع دهیم. ما در *نما* تصمیم می‌گیریم که چه چیزی (model) در قالب نشان داده شود.

بسیار خوب، چطور به این هدف برسیم؟

لازم است که فایل`blog/views.py` را در ویرایشگر کد باز کنیم. تا اینجا *نمای* `post_list` شبیه به این است:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

به یاد دارید که در مورد اضافه کردن کدهای نوشته شده در فایل‌های مختلف صحبت کردیم؟ حالا وقتی آن است که مدلی را که در فایل `models.py` نوشتیم به این فایل اضافه کنیم. ما خط `from .models import Post` را به این صورت اضافه می‌کنیم:

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

آخرین قطعه گم شده، فرستادن کوئری ست `posts` به قالب HTML است. نگران نباشید این کار را در بخش‌های بعدی انجام خواهیم داد.

توجه داشته باشید که ما یک *متغیر* برای کوئری ست مان درست کردیم: `posts`. با این مانند نام کوئری ست رفتار کنید. از این به بعد ما به کمک همین نام به این کوئری ست مراجعه می‌کنیم.

در تابع `render` ما یک پارامتر `request` داریم (درخواستی است که کاربر از طریق اینترنت برای ما ارسال کرده است) و یک پارامتر دیگر که نام فایل تمپلیت است (`'blog/post_list.html'`). آخرین پارامتر ما، `{}`، محلی است که می‌توانیم چیزهایی را برای استفاده در تمپلیت در آن قرار دهیم. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

So finally our `blog/views.py` file should look like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/