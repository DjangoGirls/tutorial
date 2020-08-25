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

Вече трябва да сте запознати как работят QuerySets. Говорихме за тях в главата [Django ORM (QuerySets)](../django_orm/README.md).

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

За да покажем нашия QuerySet в списъка с публикации на нашия блог, ни остават две неща:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Моля забележете, че създадохме променлива за нашия QuerySet: `posts`. Ползвайте това като име на нашия QuerySet. От сега нататък можем да се отнасяме към него с това име.

В `render` функцията имаме един параметър `request` (всичко се получава от потребителят чрез Internet) и друг даващ файла на шаблона (`'blog/post_list.html'`). Последният параметър, `{}`, е място в което може да добавим някакви неща, така че шаблона да ги използва. Трябва да им дадем имена (ще се придържаме към `'posts'` засега). :) Трябва да изглежда ето така: `{'posts': posts}`. Забележете, че частта преди `:` е низ; трябва да го заградите с кавички: `''`.

И така накрая нашия файл `blog/views.py` трябва да изглежда така:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Това е! Време е да се върнем към нашия шаблон и да покажем на екрана QuerySet!

Искате да прочетете малко повече за QuerySets в Django? Трябва да погледнете тук: https://docs.djangoproject.com/en/2.2/ref/models/querysets/