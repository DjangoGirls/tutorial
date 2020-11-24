# Django форми

Остання річ, яку б ми хотіли зробити з нашим сайтом це створити зручний спосіб додавати і редагувати пости. Django адміністратор це звісно круто, але водночас він є досить складним для налаштування. За допомогою форм ми матимемо абсолютний контроль над нашим інтерфейсом - ми можемо робити майже все, що тільки можемо собі уявити!

Що тішить стосовно Django форм так це те, що останні можна визначати як з нуля так і створювати засобами `ModelForm`, що зберігають результат форми всередині моделі.

Це саме те, що нам потрібно: створимо форму для нашої моделі `Post`.

Як і кожна важлива складова Django, форми мають свій власний файл: `forms.py`.

Потрібно створити файл із заданим ім'ям в папці `blog`.

    blog
       └── forms.py
    

Гаразд, давайте відкриємо його в редакторі коду і наберемо такий код:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Спочатку нам потрібно імпортувати форми Django (`from django import forms`) та нашу модель (`from .models import Post`).

`PostForm`, як ви можливо зазначили, ім'я нашої форми. Нам потрібно сказати Django, що ця форма є `ModelForm` ( тому Django зробить для нас трішки магії ) – ` і рядок.ModelForm` відповідає за це.

Далі, у нас є `class Meta`, де ми вказуємо для Django котра з моделей має бути використана для створення форми (`model = Post`).

Зрештою, можемо зазначити якими полями має закінчуватись наша форма. У цьому сценарії ми хочемо опублікувати такі параметри як заголовок `title` і зміст `text`, дані про автора `author`, що автоматично встановлюються як дані особи, яка наразі увійшла в систему (тобто ви!), а також дата створення `created_date`, яка автоматично встановлюється при створенні публікації (тобто в коді), вірно ж?

І це все! Все що нам потрібно тепер зробити це використати форму в блоці *view* і відобразити її в шаблоні.

То ж ще раз ми створимо посилання на сторінку, URL- адресу, вид і шаблон.

## Посилання на сторінку з формою

Час відкрити `blog/templates/blog/base.html` у редакторі коду. Додаємо посилання всередину блоку `div` з ім’ям `page-header`.

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Зверніть увагу, що ми хочемо викликати наше нове подання `post_new`. забезпечується темою bootstrap, яку ми використовуємо, і відображатиме для нас знак плюса.

Після додавання відповідного рядка, ваш файл HTML повинен виглядати таким чином:

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

Після зберігання та оновлення сторінки http://127.0.0.1:8000 ви побачите знайому помилку `NoReverseMatch` error. Правда ж? Добре! 

## URL

Відкриваємо `blog/urls.py` і додаємо відповідний рядок: 

{% filename %}blog/urls.py{% endfilename %}

```python
шлях('post/new/', views.post_new, name='post_new'),
```

Остаточно код буде виглядати так:

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

Після того як ми оновимо сайт, ми побачимо помилку `AttributeError`, оскільки вид `post_new` не є реалізованим. Давайте додамо цей вид прямо зараз.

## post_new view

Тепер відкриємо файл `blog/views.py` і додамо наступні рядки:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

А далі *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Щоб створити нову форму `Post`, нам потрібно викликати функцію `PostForm()` і передати її до шаблону. Повернемось пізніше до цього відображення, а зараз ми створимо шаблон для форми.

## Шаблон

Нам потрібно створити файл `post_edit.html` у папці `blog/templates/blog`. Щоб створити форму нам потрібно декілька речей:

* Ми маємо проявити форму. Можемо це зробити, наприклад, за допомогою `{{ form.as_p }}`. 
* Верхній рядок має бути розміщений всередині тега HTML для форми: `<form method="POST">...</form>`.
* Нам знадобиться кнопка Зберегти - `Save`. Створимо її в HTML за допомогою: `<button type="submit">Save</button>`.
* І нарешті зразу після відкриття тегу для форми `<form ...>` потрібно додати `{% csrf_token %}`. Це дуже важливо з міркувань безпеки вашої форми! Якщо ви раптом забудете про цей біт, Django поскаржиться, коли будете намагатися зберегти форму:

![CSFR Forbidden page](images/csrf2.png)

Добре, отож давайте розглянемо як маж виглядати HTML код в `post_edit.html`:

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

Час перезавантажитись! Йой! Ваша форма відображується!

![New form](images/new_form2.png)

Одну хвилинку! Коли ви набираєте щось в полях `title` і `text` і намагайтесь зберегти зміни - що ж станеться тоді?

Нічого! Ми знову опинимось на цій ж самій сторінці і наш текст зникне... і жодного нового поста. Отож, що ж пішло не так?

Відповідь: нічого. Мусимо проробити трохи більше роботи з нашим блоком *view*.

## Зберігання форми

Відкрийте `blog/views.py` знову. Наразі все що ми маємо в `post_new` це:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Коли ми відправляємо форму, ми потрапляємо в той самий view, але цього разу ми маємо більше даних в `request`, а якщо бути точним - в `request.POST` ( ця назва не є пов’язаною з блогерським терміном "пост", вона пов’язана з тим, що ми "постимо" дані. Запам’ятайте, що у файлі HTML наше визначення `<form>` містило деяку зміну `method="POST"`? Усі поля форми на даний момент знаходитимуться в `request.POST`. Ви не повинні перейменовувати `POST` на щось інше (лише єдине альтернативне прийнятне значення для атрибуту `method` це `GET`, але ми не маємо часу пояснювати в чому різниця).

Отож в нашому * режимі перегляду * ми маємо дві окремих ситуацій, що слід виконувати: спочатку, коли ми отримуємо доступ до сторінки вперше і хочемо отримати порожню форму, і вдруге, коли ми повертаємось до * виду * з усіма даними формами, які ми щойно вказали. Таким чином, маємо додати умову (використаємо для цього `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Час заповнювати точки `[...]`. Якщо ` метод ` `POST` тоді ми хочемо створити `PostForm` з даними нам формами, правда ж? Ми можемо зробити наступним чином:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Наступний крок - перевірити правильність форми ( встановлено усі обов’язкові поля і не відбулося зберігання неправильних значень ). Ми зробимо це за допомогою `form.is_valid()`.

Ми перевіряємо чи є форма прийнятною і якщо це так, то можемо зберегти її!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

В основі, маємо тут два моменти: зберігаємо форму за допомогою `form.save` і додаємо автора (оскільки поле автор `author` було відсутнє в `PostForm` і це поле є необхідним). `commit=False` це означає, що ми не хочемо поки зберігати модель `Post` - ми хочемо спочатку додати ім’я автора. В більшості випадків ви будете використовувати `form.save()` без `commit=False`, але в даному випадку нам слід це зробити. `post.save()` це захистить зміни, які зробили ( додавання автора ) і получиться новий блог пост!

Нарешті, було б чудово, якби ми могли негайно переходити на сторінку `post_detail` для нашого нещодавнього створеного допису в блозі, правда ж? Для цього нам потрібен ще один імпорт: 

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Додайте його на самому початку вашого файлу. І тепер ми можемо сказати: перейдіть на сторінку `post_detail` для новоствореної публікації:

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` is the name of the view we want to go to. Пам'ятаєте, що цей вид потребує змінної `pk`? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

OK, we've talked a lot, but we probably want to see what the whole *view* looks like now, right?

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

Подивимося, чи усе працює. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

Просто чудово!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. Проблему тимчасово буде вирішено. Безповоротне розв'язання проблеми чекає на вас у розділі **Домашня робота: безпека вашого сайту!** після освоєння головної програми.

![Logged in error](images/post_create_error.png)

## Form validation

А тепер, ми покажемо вам наскільки круто використовувати Django форми. Блог пост повинен мати такі поля як заголовок - `title` і зміст - `text`. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new post. Та якщо ми раптом захочемо відредагувати вже існуючу? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

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

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

We will reuse the template `blog/templates/blog/post_edit.html`, so the last missing thing is a *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

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

Виглядає майже точно так як і наш вид `post_new`, чи не так? Але не зовсім. For one, we pass an extra `pk` parameter from `urls`. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…and when we've just opened a form with this post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, let's test if it works! Let's go to the `post_detail` page. There should be an edit button in the top-right corner:

![Edit button](images/edit_button2.png)

Коли ви натиснете на неї, то побачите форму з нашим блог постом:

![Edit form](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Вітаємо! Ваш додаток стає все більше і більше завершеним!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Безпека

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Змініть тег `<a>` щоб він виглядав так:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. Це не захищає від створення нових публікацій анонімами повністю, але це непоганий перший крок. Ми розглянемо більше питань безпеки в розширених уроках.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## Ще одне: розгортання!

Давайте поглянемо чи це все працює на PythonAnywhere. Час для ще одного деплою!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Тоді, в [bash консолі PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it. Congrats! :)