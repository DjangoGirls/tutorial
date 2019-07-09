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

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

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