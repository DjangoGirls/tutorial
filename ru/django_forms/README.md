# Формы в Django

Последним, что нам стоит сделать для нашего веб-сайта является удобный способ добавления и редактирования записей. Django `admin`-панель удобна, но её дизайн сложно изменять. С `forms` (формами) мы будем иметь абсолютную власть над нашим интерфейсом - мы сможем сделать практически все, что только можно придумать!

В формах Django удобно то, что мы можем создать новую форму с нуля или воспользоваться `ModelForm` для сохранения содержимого форм в модель.

Это как раз то, что нам нужно сделать: мы создадим форму для модели `Post`.

Как и любая важная часть Django, формы имеют свой собственный файл: `forms.py`.

Нам нужно создать файл с таким именем в директории `blog`.

    blog
       └── forms.py
    

OK, давайте откроем его в редакторе кода и напечатаем следующий код:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Для начала нам нужно импортировать формы Django (`from django import forms`) и, разумеется, нашу модель `Post` (`from .models import Post`).

`PostForm`, как ты, вероятно, подозреваешь, это имя для нашей формы. Нам нужно также сообщить Django, что эта форма относится к `ModelForm` (чтобы он смог поколдовать для нас) - `forms.ModelForm` поможет с этим.

Затем, мы имеем `class Meta`, где мы определяем какая модель будет использоваться для создания формы (`model = Post`).

В завершении мы можем указать, какие поля должны присутствовать в нашей форме. В этом сценарии мы хотим, чтобы только `title` и `text` отображались - `author` должен быть пользователем, который вошел в систему под своим логином (ты!) и `created_date` должна автоматически устанавливаться при создании записи (то есть в коде), верно?

Вот и все! Всё, что нам теперь осталось сделать - это использовать форму в *представлении* и отобразить её в шаблоне.

Итак, еще раз мы создадим ссылку на страницу, URL, представление и шаблон.

## Ссылка на страницу с формой

Пришло время открыть `blog/templates/blog/base.html` в редакторе кода. Мы добавим ссылку в `div`, который называется `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Обрати внимание, что мы хотим вызвать наше новое представление `post_new`. Класс `"glyphicon glyphicon-plus"` предоставляется темой bootstrap, которую мы используем, и она отобразит значок "плюс" для нас.

После добавления строки, твой HTML-файл должен выглядеть следующим образом:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

После обновления страницы http://127.0.0.1:8000 ты увидишь привычное сообщение об ошибке `NoReverseMatch`. Это ваш случай? Отлично!

## URL

Мы открываем `blog/urls.py` в редакторе кода и добавляем строку:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
```

Окончательная версия файла будет выглядеть следующим образом:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

После обновления сайта, мы видим `AttributeError`, так как у нас не добавлено представление для `post_new`. Добавим прямо сейчас.

## Представление post_new

Пришло время открыть `blog/views.py` файл в редакторе кода и добавить следующие строки из остальных строк `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Затем наше *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Чтобы создать новую форму `Post`, нам потребуется вызвать `PostForm()` и передать её шаблону. Мы еще вернемся к этому *view*, но пока давай быстренько создадим шаблон для формы.

## Шаблон

Нам необходимо создать файл `post_edit.html` в папке `blog/templates/blog`, и открыть его в редакторе кода. Чтобы форма работала, нам нужно несколько вещей:

* Нам необходимо отобразить форму на страницу. Это можно сделать (например) с помощью {% raw %}`{{ form.as_p }}`{% endraw %}
* Строка выше должна быть обернута в HTML-теги `<form method="POST">...</form>`.
* Нам потребуется кнопка `Save`. Мы реализуем при помощи HTML-кнопки: `<button type="submit">Save</button>`.
* Наконец, после открытия `&lt;form ...&gt;` тега, нам необходимо добавить {% raw %}`{% csrf_token %}`{% endraw %}. Это очень важно, поскольку так мы делаем форму защищенной! Если вы забудете об этой части, Django будет "жаловаться", когда вы попытаетесь сохранить форму:

![Страница CSFR Forbidden](images/csrf2.png)

Хорошо, давай посмотрим, как должен выглядеть HTML-код в файле `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Время обновить страницу! Ура! Форма отображается!

![Новая форма](images/new_form2.png)

Но подожди минутку! Если ты наберешь что-нибудь в полях `title` и `text` и попробуешь сохранить - что произойдет?

Ничего! Мы снова на той же странице и наш текст пропал... и новая запись не была добавлена. Так что же пошло не так?

Ответ прост: ничего. Нам нужно сделать кое-что еще, чтобы новое *представление* заработало.

## Сохраняем данные из формы

Снова открой файл `blog/views.py` в редакторе кода. Все что у нас есть в представлении `post_new` выглядит пока следующим образом:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

После отправки формы мы возвращаемся к тому же представлению, но в этот раз с новыми данными в `request`, а точнее в `request.POST` (имя POST не имеет ничего общего с "постом" в блоге, оно связано с тем, что мы "посылаем" данные). Помнишь, что в HTML-файле, определение `< form>` имеет параметр `method="POST"`? Все поля формы теперь находятся в `request.POST`. Ты не должна переименовывать `POST` во что-то другое (другое доступное значение параметра `method` - `GET`, но у нас нет времени объяснять разницу сейчас).

Итак, в нашем *view* у нас имеется 2 отдельных ситуации для обработки: первая, когда мы получаем доступ к странице в первый раз и хотим пустую форму; и вторая, когда мы возвращаемся к *view* со всеми данными формы, которые мы только что напечатали. Таким образом, нам потребуется ввести условие (мы будем использовать условный оператор `if` для этой цели):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Пришло время заполнить в точках `[...]`. Если используется `method` `POST`, тогда мы хотим построить `PostForm` с данными из формы, верно? Вы можете сделать это следующим образом:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Далее нужно проверить, корректна ли форма (все необходимые поля заполнены и нет неверных данных, отосланных на обработку). Это выполняется с помощью `form.is_valid()`.

Мы проверяем допустимо ли содержание формы и, если все в порядке, сохраняем её!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Практически мы выполняем две операции: сохраняем форму `form.save` и добавляем автора (поскольку обязательного поля `author` нет в `PostForm`). `commit=False` означает, что мы пока не хотим сохранять модель `Post` - сначала нужно добавить автора. В основном ты будешь использовать `form.save()`, без `commit=False`, но в данном случае нам это пригодится. `post.save()` сохранит изменения (добавление автора) и новая запись будет создана!

Наконец, будет прекрасно, если мы сможем сразу переходить к странице `post_detail` после добавления новой записи, согласна? Для этого нам понадобится еще один импорт:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Добавь эту строку в начало файла. Теперь мы можем сказать "иди на страницу `post_detail` для новой созданной записи":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`blog. views. post_detail`это имя представления, на которое мы хотим перейти. Помнишь, что это *представление* требует переменную `pk`? Чтобы передать её представлению мы используем аргумент `pk=post.pk`, где `post` - это новая созданная запись в блоге!

Хорошо, мы многое обсудили, пора взглянуть на *представление* полностью, верно?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Проверим, все ли работает. Перейди по адресу http://127.0.0.1:8000/post/new/, добавь текст в поля `title` и `text`, затем сохрани… и вуаля! Новая запись создана и мы перешли на страницу `post_detail`!

Возможно, ты заметила, что мы устанавливаем дату публикации перед сохранением поста. В последствии мы сделаем *кнопку публикации* в **Django Girls Tutorial: Extensions**.

Это круто!

> Поскольку мы недавно использовали панель администратора Django, системы до сих пор думает, что мы авторизованы. Существует несколько случаев, когда мы можем случайно выйти из аккаунта (закрытие браузера, перезапуск базы данных и т. д.). Если в процессе создания записи ты получаешь ошибку, которая ссылается на отсутствие вошедшего в систему пользователя, то потребуется перейти на страницу http://127.0.0.1:8000/admin и авторизоваться в системе снова. Это решит проблему. В главе **Домашнее задание: добавляем безопасность нашему веб-сайту!** после основного учебника приводится перманентное исправление.

![Ошибка при выходе из аккаунта](images/post_create_error.png)

## Валидация формы

Теперь мы покажем тебе насколько круты формы в Django. Запись в блоге должна иметь поля `title` и `text`. В нашей модели `Post` мы не указываем, что эти поля необязательны (в отличии от `published_date`), так Django по умолчанию будет ожидать их заполнение пользователем.

Попробуй сохранить форму с незаполненными полями `title` и `text`. Угадай, что произойдет!

![Валидация формы](images/form_validation2.png)

Django заботится о проверке всех полей в нашей форме на корректность. Разве не шикарно?

## Форма редактирования

Теперь мы знаем, как добавить новую запись. Но что, если мы хотим внести исправления в уже существующую запись? По сути это схожая с предыдущей задача. Давайте создадим некоторые важные вещи быстро. (Если ты чего то не понимаешь, то тебе следует спросить своего тренера или просмотреть предыдущие главы, так как мы уже выполняли все данные шаги раньше.)

Открой `blog/templates/blog/post_detail.html` в редакторе кода и добавь следующую строку

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

итак, шаблон будет выглядеть следующим образом:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Открой `blog/urls.py` в редакторе кода и добавь строку:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Мы будем использовать повторно шаблон `blog/templates/blog/post_edit.html`, так что осталось лишь отсутствующее *представление*.

Давай откроем `blog/views.py` в редакторе кода и добавим в конец файла:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Выглядит практически идентично представлению `post_new`, верно? Но не совсем. Первое: мы передаем дополнительный параметр `pk` из Url-адреса. Следующее: мы получаем модель `Post` для редактирования при помощи `get_object_or_404(Post, pk=pk)` и передаем экземпляр post в качестве `instance` форме для сохранения…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…и когда мы только что открыли форму с этой записью для редактирования:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Хорошо, давай проверим что все работает! Перейди на страницу `post_detail`. Ты должна увидеть кнопку редактирования в правом верхнем углу:

![Кнопка редактирования](images/edit_button2.png)

Когда ты её нажмешь, то увидишь форму с выбранной записью:

![Форма редактирования](images/edit_form2.png)

Смело поменяй заголовок или текст и сохрани изменения!

Поздравляем! Твое приложение становится все более сложным!

Если тебе нужно больше информации о формах в Django, то обратись к официальной документации: https://docs.djangoproject.com/en/2.2/topics/forms/

## Безопасность

Круто иметь возможность создавать новые посты просто нажав на ссылку! Однако, сейчас кто угодно из посетителей вашего сайта может создать новую запись в блоге, а это, скорее всего, совсем не то, чего бы вам хотелось. Давай сделаем так, чтобы кнопка показывалась для нас, а не кого-либо еще.

Открой файл `blog/templates/blog/base.html` в редакторе кода, найди наш `page-header` `div` и тег &lta&gt который мы добавили ранее. Должно выглядеть примерно так:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Мы собираемся добавить еще один `{% if %}` тег, который сделает так, чтобы ссылка показывалась только авторизованным в панель администратора пользователям. Прямо сейчас это только ты! Измени тег `< >`, чтобы получилось так:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Из-за этого `{% if %}` ссылка будет отправлена в браузер, только если запрашивающий страницу пользователь вошёл в систему. Это не обезопасит создание новых постов полностью, но для начала и это неплохо. Мы подробнее рассмотрим вопросы безопасности в дополнении к учебнику.

Помнишь иконку редактирования, которую мы только что добавили в нашу страницу detail? Мы хотим внести такое же изменение сюда, чтобы другие люди не могли редактировать уже существующие записи.

Открой `blog/templates/blog/post_detail.html` в редакторе кода и найди следующую строку:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Замени это на эту строку:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

С тех пор как ты авторизована, если ты перезагрузишь страницу, ты не увидишь ничего нового. Загрузи страницу в любом другом браузере или в режиме "инкогнито" просмотра окна (для Windows Edge называется "InPrivate"), и ты увидишь, что ссылка не показана и иконка также отсутствует!

## И последнее: публикация!

Теперь давай посмотрим как это будет работать на PythonAnywhere. Пришло время для очередного развертывания!

* Сначала нам нужно сделать commit и push нового кода в репозиторий Github:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Затем набери в [Bash консоли PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Не забудьте заменить `<your-pythonanywhere-domain>` на ваше имя пользователя PythonAnywhere, без угловых скобок.)

* Наконец, прыжок на [страницу «Веб»](https://www.pythonanywhere.com/web_app_setup/) (используйте кнопку меню в верхнем правом углу консоли) и клик по **Reload**. Обновите ваш https://subdomain.pythonanywhere.com блог, чтобы увидеть изменения.

Вот и все! Поздравляем :)