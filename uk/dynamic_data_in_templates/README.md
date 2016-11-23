# Динамічні дані в шаблонах

Маємо різні шматочки на своїх місцях: модель `Post` визначено в `models.py`, маємо `post_list` у `views.py`, а також відповідний шаблон. Однак, яким чином ми змусимо наші пости з'явитися в HTML шаблоні? Оскільки це те, чого ми хочемо: взяти деякий контент (моделі збережені в базі даних) і вивести його в гарному вигляді на нашому шаблоні, правда ж?

Це саме те, що покликані робити відображення: з'єднаємо моделі і шаблони. В нашому відображенні `post_list` нам потрібно взяти моделі, які ми хочемо зобразити, і передати їх до шаблону. Отже, в основному, у секції відображення - *view* ми вирішуємо що (модель) буде виведено в шаблоні.

Добре, отже як ми цього досягнемо?

Нам треба відкрити наш `blog/views.py`. Таким чином, відображення `post_list` виглядає на кшталт:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Пам'ятаєте, як ми говорили про включення коду написаного в різних файлах? Тепер настав момент, коли ми повинні включити модель написану в `models.py`. Додаймо рядок `from .models import Post`:

```python
from django.shortcuts import render
from .models import Post
```

Крапка після `from` означає *поточна директорія* або *поточний додаток*. Оскільки `views.py` і `models.py` розташовані в одній і тій же папці, можемо просто використовувати `.` і ім'я файлу (без `.py`). Далі імпортуємо ім'я моделі (`Post`).

А що далі? Щоб вилучити реальні пости з моделі `Post`, нам потрібна певна річ, що називається `QuerySet`.

## QuerySet

Ви маєте вже бути ознайомлені із роботою QuerySets. Ми говорили про це у розділі [Django ORM (QuerySets)](../django_orm/README.md).

Отже, наразі ми зацікавлені у списку опублікованих і відсортованих за параметром `published_date` блог постів, чи не так? Ми вже робили це у розділі QuerySets!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')

А тепер вставимо цей шматок коду у файл `blog/views.py` додавши його до функції `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Зазначте, будь ласка, що ми створюємо *змінну* для нашого QuerySet: `posts`. Сприймайте її як ім'я для QuerySet. З цього моменту ми можемо посилатися на неї через це ім'я.

Крім того, код використовує функцію `timezone.now()`, а значить, ми повинні імпортувати `timezone`.

Остання пропущена частина - передача QuerySet `posts` шаблону (розглянемо, як це вивести в наступному розділі).

У функції `render` ми вже маємо параметр `request` (тобто усе, що ми отримуємо від користувача через Інтернет) і файл шаблону `'blog/post_list.html'`. Останній параметр, котрий виглядає як: `{}` - це місце, в якому ми можемо додавати певні речі для використання у шаблоні. Ми повинні дати їм імена (ми обмежились ім'ям `'posts'` наразі :)). Це має виглядати як: `{'posts': posts}`. Прохання звернути увагу, що частина перед `:` є рядком; вам необхідно взяти це у лапки `''`.

Отже, врешті-решт наш файл `blog/views.py` матиме наступний вигляд:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Це все! Час повернутись назад до нашого шаблону і вивести QuerySet!

Якщо бажаєте дізнатись трохи більше про QuerySets в Django, зазирніть сюди: https://docs.djangoproject.com/en/1.9/ref/models/querysets/

