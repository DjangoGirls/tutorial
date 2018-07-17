# Django views – time to create!

Час позбутися помилки, створеної в останньому розділі! :)

Відображення - *view* -- це місце, в якому ми закладаємо "логіку" нашої програми. Воно запитує інформацію з `моделі`, яку ми створили раніше і передає його до `шаблону`. Ми створимо шаблон в наступному розділі. Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

Відображення розташовані у файлі `views.py`. Додамо наші відображення до файлу `blog/views.py`.

## blog/views.py

OK, давайте відкриємо цей файл подивимось що тут:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Інша помилка! Прочитайте у чому цього разу справа:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/