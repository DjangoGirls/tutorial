# Динамични данни в шаблоните

Имаме различни парчета на места: `Post` моделът е дефиниран в `models.py`, имаме `post_list` във `views.py` и добавен шаблон. Но как всъщност ще направим, така че нашите публикации да се показват на HMTL шаблон? Защото това е, което искаме да направим – да вземем някакво съдържание (запазените модели в базата от данни) и да се показват хубаво на нашия шаблон, нали?

Това е точно, което *views* трябва да правят: свързват моделите с шаблоните. В нашия изглед за `post_list` ще трябва да вземем моделите, които искаме да показваме и да ги предадем на шаблоните. В изгледа ние определяме какво (модел) ще се изобразява в шаблона.

Добре, как ще го постигнем?

Трябва да отворим `blog/views.py` в редактора си. До момента `post_list` изгледа е такъв: 

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Помните ли когато говорихме за вмъкване на код написан в различни файлове? Сега е моментът, в който трябва да вмъкнем модела, който създадохме в `models.py`. Ще добавим реда `from .models import Post` така:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Точката преди `models` означава настояща директория или настояща апликация. Двата файла `views.py` и `models.py` са в една и съща директория. Това означава, че можем да използваме `.` и името на файла (без разширението `.py`). Тогава въвеждаме името на модела (`Post`).

Но след това какво? За да вземем всъщност публикация от `Post` модела ни трябва нещо наречено `QuerySet`.

## QuerySet

Вече трябва да се запознати как QuerySets работят. Говорихме за тях в главата [Django ORM (QuerySets)](../django_orm/README.md).

Сега искаме публикуваните ни блог постове сортирани по дата на публикуване, нали? Вече направихме това в главата QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

И така, нека да отворим файла `blog/views.py` в редактора и добавим този код към функцията `def post_list(request)` -- но нека не забравяме първо да добавим `from django.utils import timezone`: 

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Последната липсваща част е подаването на QuerySet постове към контекста на шаблона. Не се притеснявайте -- ще обясним как става в по-следваща глава.

Моля забележете, че създадохме променлива за нашия QuerySet: `posts`. Ползвайте това като име на нашия QuerySet. От сега нататък можем да се отнасяме към него с това име.

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/