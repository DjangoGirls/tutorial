# وقت ساختن نماهای جنگو!

وقتشه که از شر باگی که تو فصل قبلی ایجاد کردیم راحت بشیم :)

یک *view* یا نما بخشی از برنامه است که "منطق" برنامه در آن قرار می‌گیرد. این مولفه اطلاعات مورد نیاز را از `model` هایی که قبلا ایجاد کرده‌اید گرفته و به `template` ارسال می‌کند. ما در بخش بعد یک قالب یا template خواهیم ساخت. نماها صرفاً توابع پایتونی هستند که البته از چیزهایی که در بخش **آشنایی با پایتون** نوشتیم کمی پیچیده‌تر هستند.

نماها در فایل `views.py` قرار دارند. ما *نماهای* مورد نظرمان را در فایل `blog/views.py` اضافه خواهیم کرد.

## blog/views.py

خب، بیایید این فایل را در ویرایشگر کد باز کنیم و ببینیم چه چیزی در آن هست:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

چیز زیادی هنوز در آن نیست.

به یاد داشته باشید که خط هایی که با `#` شروع می‌شوند کامنت یا توضیحات هستند - به این معنی که این خط ها توسط پایتون اجرا نمی‌شوند.

حالا بیایید همانند توصیه‌ای که در خود فایل شده است یک *نما* بسازیم. این نمای بسیار خلاصه را زیر کامنت موجود در فایل اضافه کنید:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Another error! Read what's going on now:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/