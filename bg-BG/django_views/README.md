# Django views - време за създаване!

Време е да премахнем пречката, която създадохме в последната глава! :)

*view* е мястото, където поставяме "логиката" на приложението ни. Ще изиска информация от моделът, който създадохме по-рано и ще го подаде на шаблона. Ще създадем шаблон в следващата глава. Изгледите са просто Python фукнции, които са малко по-сложни от тези, които написахме в главата **Въведение в Python**.

Изгледите са във файла `views.py`. Ние ще добавим първи си изглед към файла `blog/views.py`.

## blog/views.py

И така, нека отворим файла в редактора си видим какво има в него:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Няма почти нищо все още.

Помнете, че редовете, които започват с `#` са коментари – което означава, че тези редове няма да се четат от Python.

Нека създадем *view* както коментара предлага да направим. Добавете следният минимален изглед под него:

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

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/views/