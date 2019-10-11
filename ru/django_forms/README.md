# Формы в Django

Последним, что нам стоит сделать для нашего веб-сайта, является удобный способ добавления и редактирования записей. `admin`-панель Django удобна, но её дизайн сложно изменять. С `forms` (формами) у нас будет абсолютная власть над интерфейсом блога — мы сможем сделать практически всё, что только можно придумать!

Формы Django удобны тем, что мы можем создать новую форму с нуля или воспользоваться `ModelForm` для сохранения содержимого формы в модель.

Это как раз то, что нам нужно сделать: мы создадим форму для модели `Post`.

Как и любая важная часть Django, формы имеют свой собственный файл: `forms.py`.

Нам нужно создать файл с таким именем в директории `blog`.

```
blog
   └── forms.py
```

Теперь открой его и набери следующее:

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

`PostForm`, как ты, вероятно, подозреваешь, — это имя для нашей формы. Нам нужно также сообщить Django, что эта форма относится к `ModelForm` (чтобы он смог поколдовать для нас) — `forms.ModelForm` поможет с этим.

Дальше у нас `class Meta`, где мы определяем, какая модель будет использоваться для создания формы (`model = Post`).

В завершение мы можем указать, какие поля должны присутствовать в нашей форме. Сейчас нам требуются только поля `title` и `text` — `author` будет автоматически выбран в зависимости от авторизованного пользователя (тебя), а `created_date` должна автоматически проставляться в момент создания записи (т.е. через код), верно?

Вот и всё! Теперь мы можем использовать форму в *представлении* и отобразить её в шаблоне.

Поэтому снова нам необходимо создать ссылку на страницу, URL-адрес, представление и шаблон.

## Ссылка на страницу с формой

Пришло время открыть файл `blog/templates/blog/base.html`. Мы добавим ссылку в элемент `div` с именем `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Обрати внимание, что мы назвали новое представление `post_new`. Класс `glyphicon glyphicon-plus` определён в используемой нами теме bootstrap — таким образом мы выведем значок плюса.

После добавления строки твой html-файл должен выглядеть следующим образом:

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

После сохранения файла и перезагрузки страницы по адресу http://127.0.0.1:8000 ты, конечно, увидишь знакомую ошибку `NoReverseMatch`, верно?

## URL

Нам нужно открыть файл `blog/urls.py` и добавить строку:

{% filename %}blog/urls.py{% endfilename %}
```python
path('post/new/', views.post_new, name='post_new'),
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

После перезагрузки веб-сайта мы увидим ошибку `AttributeError`, поскольку представление `post_new` не реализовано. Давай добавим его прямо сейчас.

## Представление post_new

Самое время открыть файл `blog/views.py` и добавить следующую строку к остальным, начинающимся с `from`:

{% filename %}blog/views.py{% endfilename %}
```python
from .forms import PostForm
```

А затем наше *представление*:

{% filename %}blog/views.py{% endfilename %}
```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Чтобы создать новую форму `Post`, нам потребуется вызвать `PostForm()` и передать её шаблону. Мы ещё вернёмся к этому *представлению*, а пока давай быстро создадим шаблон под форму.

## Шаблон

Нам нужно создать файл `post_edit.html` в директории `blog/templates/blog`. Чтобы заставить форму работать, нам потребуется несколько вещей:

-   Нам нужно отобразить форму. Мы можем сделать это, к примеру, простым `{% raw %}{{ form.as_p }}{% endraw %}`.
-   Строка выше должна быть обёрнута в HTML-теги `<form method="POST">...</form>`
-   Нам потребуется кнопка `Save`. Мы добавим её при помощи HTML-кнопки: `<button type="submit">Save</button>`
-   И, наконец, сразу после открытия тега `< form... >` мы должны добавить `{% raw %}{% csrf_token %}{% endraw %}`. Это очень важно, поскольку так мы делаем форму защищённой! Django будет ругаться, если ты забудешь добавить этот код:

![Страница CSFR Forbidden][1]

 [1]: images/csrf2.png

Хорошо, давай посмотрим, как должен выглядеть HTML-код в файле `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}
```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Время обновить страницу! Ура! Форма отображается!

![Новая форма][2]

 [2]: images/new_form2.png

Но подожди минутку! Если ты наберёшь что-нибудь в полях `title` и `text` и попробуешь сохранить — что произойдёт?

Ничего! Мы снова на той же странице и наш текст пропал... и новая запись не была добавлена. Так что же пошло не так?

Ответ прост: ничего. Нам нужно сделать кое-что ещё, чтобы новое *представление* заработало.

## Сохраняем данные из формы

Снова открой файл `blog/views.py`. Всё, что у нас есть в представлении `post_new`, выглядит пока следующим образом:

{% filename %}blog/views.py{% endfilename %}
```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

После отправки формы мы возвращаемся к тому же представлению, но в этот раз с новыми данными в `request`, а точнее, в `request.POST` (имя POST не имеет ничего общего с "постом" в блоге, оно связано с тем, что мы "публикуем" данные). Помнишь, что в HTML-файле определение `<form>` имеет параметр `method="POST"`? Все поля формы теперь находятся в `request.POST`. Ты не должна переименовывать `POST` во что-то другое (другое доступное значение параметра `method` — `GET`, но у нас сейчас нет времени объяснять разницу).

Получается, что в представлении *view* нам нужно обработать две разные ситуации. Первая: когда мы только зашли на страницу и хотим получить пустую форму. Вторая: когда мы возвращаемся к *представлению* со всей информацией, которую мы ввели в форму. Таким образом, нам потребуется ввести условие (для этого мы будем использовать условный оператор `if`):

{% filename %}blog/views.py{% endfilename %}
```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Теперь заполним строку, занятую `[...]`. Если `method` — `POST`, тогда мы хотим построить `PostForm` с данными из формы, верно? Мы добьёмся этого следующим образом:

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(request.POST)
```

Легко! Дальше мы проверим, корректна ли форма (все ли необходимые поля заполнены и не отправлено ли некорректных значений). Мы сделаем это при помощи `form.is_valid()`.

Мы проверяем, допустимо ли содержимое формы, и, если всё в порядке, сохраняем её!

{% filename %}blog/views.py{% endfilename %}
```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Фактически мы выполняем две операции: сохраняем форму `form.save` и добавляем автора (поскольку обязательного поля `author` нет в `PostForm`!). `commit=False` означает, что мы пока не хотим сохранять модель `Post` — сначала нужно добавить автора. В основном ты будешь использовать `form.save()`, без `commit=False`, но в данном случае нам это пригодится. `post.save()` сохранит изменения (после добавления автора), и новая запись будет создана!

Наконец, будет прекрасно, если мы сможем сразу переходить к странице `post_detail` после добавления новой записи, согласна? Для этого нам понадобится еще один импорт:

{% filename %}blog/views.py{% endfilename %}
```python
from django.shortcuts import redirect
```

Добавь эту строку в начало файла. Теперь мы можем сделать переадресацию на страницу `post_detail` для созданной записи:

{% filename %}blog/views.py{% endfilename %}
```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` — это имя представления, которое нам необходимо. Помнишь, что это *представление* требует переменную `pk`? Чтобы передать её представлению, мы используем аргумент `pk=post.pk`, где `post` — это новая запись в блоге!

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

Проверим, всё ли работает. Перейди по адресу http://127.0.0.1:8000/post/new/, добавь текст в поля `title` и `text`, затем сохрани… и вуаля! Новая запись создана, и мы перешли на страницу `post_detail`!

Возможно, ты заметила, что мы устанавливаем дату публикации перед сохранением поста. В последствии мы сделаем _кнопку публикации_ в __Django Girls Tutorial: Extensions__.

Это круто!

> Поскольку мы недавно использовали панель администратора Django, система до сих пор думает, что мы авторизованы. Существует несколько случаев, когда мы можем случайно выйти из аккаунта (закрытие браузера, перезапуск базы данных и т.д.). Если ты получаешь ошибку при попытке сохранения записи, то потребуется перейти на страницу http://127.0.0.1:8000/admin и авторизоваться в системе снова. Это решит проблему. В главе **Домашнее задание: добавляем безопасность нашему веб-сайту!** после основного учебника описано окончательное решение этой проблемы.

![Ошибка при выходе из аккаунта][4]

 [4]: images/post_create_error.png

## Валидация формы

Теперь мы покажем тебе, насколько круты формы в Django. Запись в блоге должна иметь поля `title` и `text`. В нашей модели `Post` мы не указываем, что эти поля необязательны (в отличие от `published_date`), так что Django по умолчанию будет ожидать, что пользователь их заполнит.

Попробуй сохранить форму с незаполненными полями `title` и `text`. Угадай, что произойдёт!

![Валидация формы][3]

 [3]: images/form_validation2.png

Django заботится о проверке всех полей в нашей форме на корректность. Разве не шикарно?

## Форма редактирования

Теперь мы знаем, как добавить новую форму. Но что, если мы хотим внести исправления в уже существующую запись? По сути это схожая с предыдущей задача. Давай быстро создадим пару важных вещей (если ты чего-то не понимаешь, спроси своего тренера или загляни в предыдущие главы, поскольку мы уже объясняли все необходимые шаги).

Открой `blog/templates/blog/post_detail.html` и добавь следующую строку:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

так, чтобы шаблон выглядел следующим образом:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

В файле `blog/urls.py` добавь:

{% filename %}blog/urls.py{% endfilename %}
```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Мы будем использовать повторно шаблон `blog/templates/blog/post_edit.html`, так что осталось лишь отсутствующее *представление*.

Давай откроем файл `blog/views.py` и добавим в самый конец следующее:

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

Выглядит практически идентично представлению `post_new`, верно? Но не совсем. Во-первых, мы передаём параметр `pk` из URL-адреса. Кроме того, мы получаем модель `Post` для редактирования при помощи `get_object_or_404(Post, pk=pk)` и передаём экземпляр post в качестве `instance` форме и при сохранении…

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(request.POST, instance=post)
```

… и когда мы открываем форму для редактирования:

{% filename %}blog/views.py{% endfilename %}
```python
form = PostForm(instance=post)
```

Хорошо, давай удостоверимся, что всё работает! Перейди на страницу `post_detail`. Ты должна увидеть кнопку редактирования в правом верхнем углу:

![Кнопка Редактировать (Edit)][5]

 [5]: images/edit_button2.png

Когда ты её нажмёшь, то увидишь форму с выбранной записью:

![Форма редактирования][6]

 [6]: images/edit_form2.png

Поменяй заголовок и текст, а затем сохрани запись!

Поздравляем! Твое приложение становится всё более сложным!

Если тебе нужно больше информации о формах в Django, обратись к официальной документации: https://docs.djangoproject.com/en/2.0/topics/forms/

## Безопасность

Круто иметь возможность создавать новые посты, просто перейдя по ссылке! Однако сейчас кто угодно из посетителей твоего сайта может создать новую запись в блоге, а это, скорее всего, совсем не то, чего бы тебе хотелось. Давай сделаем так, чтобы кнопка показывалась для нас, а не кого-либо ещё.

В файле `blog/templates/blog/base.html` найди `page-header` `div` и тег `<a>`, который мы добавили ранее. Должно выглядеть примерно так:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Мы добавим сюда ещё один тег `{% if %}`, чтобы ссылка показывалась только пользователям, вошедшим в админку. То есть пока что — только тебе! Измени тег `<a>`, чтобы получилось так:

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Из-за этого `{% if %}` ссылка будет отправлена в браузер, только если запрашивающий страницу пользователь вошёл в систему. Это не обезопасит создание новых постов полностью, но для начала и это неплохо. Мы подробнее рассмотрим вопросы безопасности в дополнении к учебнику.

Помнишь иконку редактирования, которую мы добавили на страницу поста? Чтобы посторонние не смогли менять уже созданные посты, нам нужно изменить страничку похожим образом.

Открой файл `blog/templates/blog/post_detail.html` и найди такую строку:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Замени её на следующее:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}
```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Поскольку ты авторизована, никаких изменений после обновления страницы ты не увидишь. Но попробуй загрузить страницу в другом браузере или в режиме инкогнито, и увидишь, что ссылка не отобразится!

## И последнее: публикация!

Теперь давай посмотрим, как это будет работать на PythonAnywhere. Пришло время для очередного развёртывания!

*   Сначала нам нужно сделать commit и push нового кода в репозиторий GitHub:

{% filename %}command-line{% endfilename %}
```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```

*   Затем набери в [Bash-консоли PythonAnywhere][7]:

 [7]: https://www.pythonanywhere.com/consoles/

{% filename %}PythonAnywhere command-line{% endfilename %}
```
$ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
$ git pull
[...]
```

(Не забудь подставить вместо <your-pythonanywhere-domain> свой поддомен на PythonAnywhere без угловых скобок.)

*   Наконец, зайди на страницу ["Web" page][8] (используй кнопку меню в правом верхнем углу консоли) и нажми **Reload**. Обнови страницу блога http://subdomain.pythonanywhere.com/, чтобы увидеть изменения.


 [8]: https://www.pythonanywhere.com/web_app_setup/

Вот и всё! Поздравляем :)
