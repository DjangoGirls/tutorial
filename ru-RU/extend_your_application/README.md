{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Расширяем свое приложение

Мы уже выполнили часть необходимых шагов для создания веб-сайта: мы знаем как создать модель, URL, представление и шаблон. Мы также знаем как улучшить визуальный дизайн с помощью CSS.

Время практики!

Первое, что нам потребуется в блоге - страница для отображения конкретной записи, верно?

У нас уже есть модель `Post`, так что нам не нужно добавлять дополнительный код в файл `models.py`.

## Создадим в шаблоне ссылку на страницу поста

Мы начнем с добавления ссылки внутри файла `blog/templates/blog/post_list.html`. Откройте его в редакторе кода, и сейчас он должен выглядеть следующим образом: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        &lt;div class="post"&gt;
            &lt;div class="date"&gt;
                {{ post.published_date }}
            &lt;/div&gt;
            &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
            &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
        &lt;/div&gt;
    {% endfor %}
{% endblock %}
```

{% raw %}Нам хотелось бы иметь ссылку с заголовка поста в списке на страницу подробной информации о посте. Давай изменим `<h2><a href="">{{ post.title }}</a></h2>` чтобы получилась ссылка на страницу с полным содержанием поста:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}Самое время разобраться с загадочным `{% url 'post_detail' pk=post.pk %}`. Как можешь предположить, синтаксис `{% %}` означает использование тегов шаблонов Django. На этот раз мы используем тот, что создаст для нас URL!{% endraw %}

Часть `post_detail` означает, что Django будет ожидать URL в `blog/urls.py` с именем =post_detail

А что же `pk=post.pk`? `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Теперь, когда мы перейдем по адресу http://127.0.0.1:8000/ мы получим ошибку (как и ожидается, поскольку у нас нет прописанного URL и *view* для `post_detail`). Она будет выглядеть следующим образом:

![NoReverseMatch ошибка](images/no_reverse_match2.png)

## Создадим URL для страницы поста

Давай создадим URL в `urls.py` для *представления* `post_detail`!

Мы хотим, чтобы адрес страницы нашего первого поста был таким: **URL**: http://127.0.0.1:8000/post/1/

Давай создадим URL в файле `blog/urls.py` и укажем Django на *представление* под названием `post_detail`, которое будет отображать пост целиком. Открой файл `blog/urls.py` в редакторе кода и добавь строку `path('post/<int:pk>/', views.post_detail, name='post_detail'),` так, что файл должен выглядить следующим образом:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Эта часть `post/<int:pk>/` указывает шаблон URL-адреса – далее мы объясним это для тебя:

- `post/` означает, что URL-адрес должен начинаться со слова **post** и далее следует **/**. Пока все в порядке.
- `<int:pk>`– эта часть сложнее. Она означает, что Django ожидает целое числовое значение и передаст его в представление как переменную с именем `pk`.
- `/`- затем нам нужно **/** снова, до окончания URL-адреса.

Это значит, что если ты введешь адрес `http://127.0.0.1:8000/post/5/` в браузер, Django должен понять, что тебе требуется *view* с именем `post_detail`, и передать информацию о переменной `pk` (равной `5`) этому *view*.

ОК мы добавили новый шаблон URL-адреса для `blog/urls.py`! Давайте обновите страницу: http://127.0.0.1:8000 / Бууум! Сервер снова остановил работу. Посмотрим в консоль – как и ожидалось, теперь еще есть другая ошибка!

![AttributeError](images/attribute_error2.png)

Помнишь, каким должен быть следующий шаг? Конечно: добавить представление!

## Добавим представление для страницы поста

В этот раз наше *view* получит дополнительный параметр `pk`. Но как дать нашему *view* знать о нем? Для этого мы определим функцию как `def post_detail(request, pk):`. Обрати внимание, что мы должны использовать то же имя переменной, что мы выбрали для обработки URL (`pk`). Пропуск переменной будет неправилен и приведет к ошибке!

Теперь мы хотим получить одну конкретную запись из блога. Для этого потребуется использовать QuerySet, примерно такую:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Однако в этом коде есть проблема. Если не существует экземпляра объекта `Post` с заданным `primary key` (`pk`) мы получим очень страшную ошибку!

![DoesNotExist ошибка](images/does_not_exist2.png)

Мы этого не хотим! К счастью, Django, конечно, имеет средство, которое позволит нам её обойти: `get_object_or_404`. В случае, если не существует экземпляра объекта `Post` с заданным `pk`, мы получим намного более приятную страницу (которая называется `Page Not Found 404`.

![Страница не найдена](images/404_2.png)

Хорошая новость в том, что ты можешь сделать свою собственную страницу `Page not found`, и сделать ее достаточно привлекательной на свой вкус. Но для нас сейчас это не самая важная задача, и поэтому мы её пропустим.

Хорошо, пришло время добавить *view* в файл `views.py`!

В `blog/urls.py` мы создали URL-правило с именем `post_detail`, которое отсылает в представление, названное `views.post_detail`. Это означает, что Django будет ожидать представления функция с именем `post_detail` внутри `blog/views.py`.

Пришло время открыть `blog/views.py` файл в редакторе кода и добавить следующие строки рядом со строками `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

И в конце файла мы добавим наше *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Да. Пришло время обновить страницу: http://127.0.0.1:8000/

![Post list view](images/does_not_exist2.png)

Заработало! Только что произойдет, если ты попробуешь перейти по ссылке из заголовка записи?

![TemplateDoesNotExist ошибка](images/does_not_exist2.png)

Ой, нет! Другая ошибка! Но мы уже знаем как с ней справиться, верно? Нам нужно добавить шаблон!

## Создадим шаблон для страницы поста

Мы создадим файл `post_detail.html` в директории `blog/templates/blog`, и откроем его в редакторе кода.

Enter the following code:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    &lt;div class="post"&gt;
        {% if post.published_date %}
            &lt;div class="date"&gt;
                {{ post.published_date }}
            &lt;/div&gt;
        {% endif %}
        &lt;h2&gt;{{ post.title }}&lt;/h2&gt;
        &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
    &lt;/div&gt;
{% endblock %}
```

И снова мы расширяем `base.html`. В блоке `content` мы отображаем дату публикации (published_date, если она существует), заголовок и текст. Нам также нужно обсудить пару важных вещей, хорошо?

{% raw %}`{% if ... %} ... {% endif %}` это тег шаблона, который мы можем использовать, если нам нужно что-то проверить. (Помнишь конструкцию `if ... else ..` из главы **Введение в Python**?) В этом сценарии мы хотим проверить, содержит ли `published_date` нашей записи данные или нет.{% endraw %}

Отлично, можешь перезагрузить страницу и проверить пропала ли теперь ошибка `TemplateDoesNotExist`.

![Post detail страница](images/does_not_exist2.png)

Ура! Все работает!

# Время развертывания!

Было бы неплохо проверить, что веб-сайт все еще работает на PythonAnywhere, верно? Давай еще раз проведем развертывание.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Затем набери в [Bash консоли PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Не забудьте заменить `<your-pythonanywhere-domain>` на ваше имя пользователя PythonAnywhere, без угловых скобок.)

## Обновление статических файлов на сервере

Серверы, такие как PythonAnywhere любят обрабатывать "статичные файлы" (такие как CSS-файлы) отдельно от Python-файлов, потому что они могут оптимизировать их загружаться быстрее. В результате всякий раз, когда мы вносим изменения в наши CSS-файлы, нам нужно выполнить дополнительную команду на сервере, чтобы сказать ему обновить их. Команда называется `collectstatic`.

Начните с активации вашего virtualenv, если она еще не активна (PythonAnywhere использует для этого команду под названием `workon`, это также как и `source myenv/bin/activate` команда, которую вы используете на вашем собственном компьютере):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Команда `manage.py collectstatic` немного похожа `manage.py migrate`. Мы вносим некоторые изменения в наш код, а затем мы говорим Django чтобы он *применил* эти изменения для коллекции статических файлов на сервере, либо в базе данных.

В любом случае, мы теперь готовы перепрыгнуть на ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (из меню кнопки в верхнем правом углу консоли) и кликнуть **Reload**, а затем смотри на страницу https://subdomain.pythonanywhere.com чтобы увидеть результат.

Вот и все! Поздравляем :)