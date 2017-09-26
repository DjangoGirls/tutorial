# Django views – time to create!

Time to get rid of the bug we created in the last chapter! :)

*view* คือส่วนที่เราใส่ "logic" ของโปรแกรมของเรา โดยจะขอข้อมูลจาก `model` ที่คุณสร้างก่อนหน้านี้และส่งไปยัง `template` เราจะสร้าง template ในบทถัดไป Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

view จะอยู่ในไฟล์ `views.py` เราจะเพิ่ม *view* ของเราลงในไฟล์ `blog/views.py`

## blog/views.py

โอเค เปิดไฟล์นี้ขึ้นมาดูว่ามีอะไรข้างใน:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

The simplest *view* can look like this:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

เกิดข้อผิดพลาดอีกแล้ว! ลองอ่านดูว่าเกิดไรขึ้นตอนนี้:

![ข้อผิดพลาด](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/views/