# Динамічні дані в шаблонах

Маємо різні шматочки на своїх місцях: модель `Post` визначено в `models.py`, маємо `post_list` у `views.py`, а також відповідний шаблон. Однак, яким чином ми змусимо наші пости з'явитися в HTML шаблоні? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

Це саме те, що покликані робити відображення: з'єднаємо моделі і шаблони. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

Нам треба відкрити наш `blog/views.py`. Таким чином, відображення `post_list` виглядає на кшталт:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Пам'ятаєте як ми говорили про включення коду написаного в різних файлах? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Далі імпортуємо ім'я моделі (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

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

Зазначте, будь ласка, що ми створюємо *змінну* для нашого QuerySet: `posts`. Сприймайте її як ім'я для QuerySet. З цього моменту ми можемо посилатися на неї через це ім'я.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Ми повинні дати їм імена (ми обмежились ім'ям `'posts'` наразі). :) Це має виглядати як: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Отже, врешті-решт наш файл `blog/views.py` матиме наступний вигляд:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Це все! Час повернутись назад до нашого шаблону і вивести QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/