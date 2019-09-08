{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="Этот код ожидаемо вызовет ошибку!" ></span>' %}

# Расширяем свое приложение

Мы уже выполнили часть необходимых шагов для создания веб-сайта: мы знаем как создать модель, URL, представление и шаблон. Мы также знаем, как улучшить визуальный дизайн с помощью CSS.

Время для практики!

Первое, что нам потребуется в блоге — страница для отображения конкретной записи, верно?

У нас уже есть модель `Post`, так что нам не нужно добавлять дополнительный код в файл `models.py`.

## Создадим в шаблоне ссылку на страницу поста

Мы начнём с добавления ссылки внутри файла `blog/templates/blog/post_list.html`. Пока он выглядит следующим образом:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Нам хотелось бы иметь ссылку с заголовка поста в списке на страницу с подробной информацией о посте. Давай изменим `<h1><a href="">{{ post.title }}</a></h1>`, чтобы получилась ссылка на пост:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}
```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Самое время разобраться с загадочным `{% url 'post_detail' pk=post.pk %}`. Как можешь предположить, синтаксис `{% %}` означает использование тегов шаблонов Django. На этот раз мы используем тот, что создаст для нас URL!{% endraw %}

Параметр `post_detail` означает, что Django будет искать URL с именем `post_detail` в файле `blog.urls.py`.

А что насчёт `pk=post.pk`? `pk` — это сокращение от primary key (первичный ключ). Он уникальным образом определяет каждую запись в базе данных. Поскольку мы не задали первичного ключа в нашей модели `Post`, Django создал такой ключ за нас (по умолчанию это порядковый номер, то есть 1, 2, 3…) и добавил поле `pk` к каждой записи блога. Для получения первичного ключа мы напишем `post.pk` — точно так же, как мы получали значения остальных полей (`title`, `author` и т.д.) нашего объекта `Post`.

Теперь, когда мы перейдем по адресу http://127.0.0.1:8000/, мы получим ошибку (как и ожидается, поскольку у нас нет прописанного URL и *представления* для `post_detail`). Она будет выглядеть следующим образом:

![Ошибка NoReverseMatch][1]

 [1]: images/no_reverse_match2.png

## Создадим URL для страницы поста

Давай создадим в `urls.py` URL для *представления* `post_detail`!

Мы хотим, чтобы наш первый пост отображался на странице со следующим **URL**-адресом: http://127.0.0.1:8000/post/1/

Давай создадим URL в файле `blog/urls.py` и укажем Django на *представление* под названием `post_detail`, которое будет отображать пост целиком. Добавь строчку `path('post/<int:pk>/', views.post_detail, name='post_detail')` в файл `blog/urls.py`. Файл должен выглядеть так:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}
```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Фрагмент `post/<int:pk>/` определяет шаблон URL-адреса. Сейчас мы его поясним:
- `post/` значит, что после начала строки URL должен содержать слово **post** и косую черту **/**. Пока всё в порядке.
- `<int:pk>` — эта часть посложнее. Она означает, что Django ожидает целочисленное значение и преобразует его в представление — переменную `pk`.
- `/` — затем нам нужен еще один символ __/__ перед тем, как адрес закончится.


Славненько, мы добавили новый шаблон URL в файл `blog/urls.py`! Давай обновим страницу: http://127.0.0.1:8000/. Бууум! Сервер снова перестал работать. Проверь консоль — как и ожидалось, ещё одна ошибка!

![AttributeError][2]

 [2]: images/attribute_error2.png

Помнишь, каким должен быть следующий шаг? Конечно: добавить представление!

## Добавим представление для страницы поста

В этот раз *представление* получит дополнительный параметр `pk`. Но как дать нашему *представлению* знать о нём? Для этого мы определим функцию как `def post_detail(request, pk):`. Обрати внимание, что мы должны использовать то же имя переменной, что мы выбрали для обработки URL (`pk`). Пропуск переменной будет неправилен и приведёт к ошибке!

Теперь мы хотим получить одну конкретную запись из блога. Для этого потребуется использовать QuerySet:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}
```python
Post.objects.get(pk=pk)
```

Однако в этом коде есть проблема. Если не существует экземпляра объекта `Post` с заданным `primary key` (`pk`), мы получим страшную ошибку!

![Ошибка DoesNotExist][3]

 [3]: images/does_not_exist2.png

Мы этого не хотим! Однако в Django, конечно, есть средство, которое позволит нам её обойти: `get_object_or_404`. В случае, если не существует экземпляра объекта `Post` с заданным `pk`, мы получим намного более приятную страницу (которая называется `Page Not Found 404`).

![Страница не найдена][4]

 [4]: images/404_2.png

Хорошая новость состоит в том, что ты можешь сделать свою страницу `Page not found`. Но для нас сейчас это не самая важная задача, и мы её пропустим.

Хорошо, пришло время добавить *представление* в файл `views.py`!

В файле `blog/urls.py` мы создали шаблон URL под названием `post_detail`, который ссылался на представление под названием `views.post_detail`. Это значит, что Django ожидает найти функцию-представление с названием `post_detail` в `blog/views.py`.

Нам нужно открыть файл `blog/views.py` и добавить в него следующий код:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import render, get_object_or_404
```

— рядом с другими строками, начинающимися с `from`. В конец же файла мы добавим наше новое *представление*:

{% filename %}blog/views.py{% endfilename %}
```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Вот так. Теперь обнови страницу http://127.0.0.1:8000/

![Представление списка записей][5]

 [5]: images/post_list2.png

Заработало! Только что произойдёт, если ты попробуешь перейти по ссылке из заголовка записи?

![Ошибка TemplateDoesNotExist][6]

 [6]: images/template_does_not_exist2.png

Ой, нет! Другая ошибка! Но мы уже знаем, как иметь с ней дело, верно? Нам нужно добавить шаблон!

## Создадим шаблон для страницы поста

Мы создадим файл `post_detail.html` в директории `blog/templates/blog`.

Он должен содержать следующее:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

И снова мы расширяем `base.html`. В блоке `content` мы отображаем дату публикации (published_date, если она существует), заголовок и текст. Нам также нужно обсудить пару важных вещей, хорошо?

{% raw %}`{% if ... %} ... {% endif %}` — это тег шаблона, который мы можем использовать, если нам нужно что-то проверить (помнишь конструкцию `if ... else ..` из главы **Введение в Python**?). В данном случае мы хотим проверить, не пуста ли дата публикации  поста — `published_date`.{% endraw %}

Отлично, можешь перезагрузить страницу и проверить, пропала ли ошибка `Page not found`.

![Отдельная страницы записи][7]

 [7]: images/post_detail2.png

Ура! Всё работает!

## Ещё одна вещь: развёртывание!

Было бы неплохо проверить, что веб-сайт всё ещё будет работать на PythonAnywhere, верно? Давай еще раз проведём развёртывание.

{% filename %}command-line{% endfilename %}
```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
$ git push
```

Затем набери в [Bash-консоли PythonAnywhere][8]:

 [8]: https://www.pythonanywhere.com/consoles/

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
$ git pull
[...]
```

И нажми **Reload** на вкладке [Web][9].

 [9]: https://www.pythonanywhere.com/web_app_setup/

## Обновим статические файлы на сервере

Серверы вроде PythonAnywhere часто обрабатывают статические файлы (например, CSS) не так, как Python-файлы. Так происходит потому, что сервера могут оптимизировать их использование так, чтобы они быстрее загружались. В результате после того, как мы поменяли CSS-файлы, надо дать серверу команду обновить их. Эта команда называется `collectstatic`.

Начни с активации virtualenv, если окружение уже не активно (PythonAnywhere использует для этого команду `workon`. Она работает так же, как `source myenv/bin/activate`, которую ты используешь на своём компьютере.

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ workon <your-pythonanywhere-domain>.pythonanywhere.com
(ola.pythonanywhere.com)$ python manage.py collectstatic
[...]
```

Команда `manage.py collectstatic` немножко похожа на `manage.py migrate`. Мы сперва вносим какие-то изменения в наш код, а затем сообщаем Django *применить* эти изменения — к набору статических файлов на сервере или к базе данных.

В любом случае, мы теперь готовы перейти по ссылке ["Web" page][10] (нажав на кнопку в меню в правом верхнем углу консоли) и кликнуть на **Reload**, а затем посмотреть на страницу [https://subdomain.pythonanywhere.com][11], где отобразится результат.

 [10]: https://www.pythonanywhere.com/web_app_setup/
 [11]: https://subdomain.pythonanywhere.com


Вот и всё! Поздравляем :)
