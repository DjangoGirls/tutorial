# Django форми

Остання річ, яку б ми хотіли зробити з нашим сайтом, це створити зручний спосіб додавати і редагувати пости. Django адміністратор - це звісно круто, але водночас він є досить складним для налаштування. З формами ми будемо мати абсолютний контроль над нашим інтерфейсом - можемо робити майже усе, що заманеться!

Що тішить стосовно Django форм, так це те, що останні можна визначати як з нуля, так і створювати засобами `ModelForm`, що зберігають результат форми всередині моделі.

Це саме те, що нам потрібно: створимо форму для нашої моделі `Post`.

Як і кожна важлива складова Django, форми мають свій власний файл: `forms.py`.

Потрібно створити файл із заданим ім'ям в папці `blog`.

    blog
       └── forms.py

Добре, відкриємо цей файл і наберемо наступний код:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Спершу потрібно імпортувати Django форми (`from django import forms`) і, очевидно, нашу модель `Post` (`from .models import Post`).

`PostForm`, як ви можливо зазначили, це ім'я нашої форми. Ми маємо повідомити Django, що наша форма є `ModelForm` (таким чином Django здійснить для нас певні магічні маніпуляції) і рядок `forms.ModelForm` відповідає за це.

Далі, у нас є `class Meta`, де ми вказуємо для Django котра з моделей має бути використана для створення форми (`model = Post`).

Зрештою, можемо зазначити, якими полями має закінчуватись наша форма. В даному сценарії ми би хотіли опублікувати такі параметри, як заголовок `title` і зміст `text`, дані про автора `author`, що автоматично встановлюються як дані користувача, який наразі залогінився (тобто ви!), а також дата створення `created_date`, яка автоматично встановлюється при створенні поста (тобто в коді), вірно ж?

І це все! Все що нам потрібно тепер зробити це використати форму в блоці *view* і відобразити її в шаблоні.

Отже, знову ми створимо: посилання на сторінку, адресу (URL), вид (view) і шаблон (template).

## Посилання на сторінку з формою

Час відкрити `blog/templates/blog/base.html`. Додамо лінк всередині блоку `div` із ім'ям `page-header`:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Зауважте, що ми хочемо запустити наше нове відображення `post_new`. Клас `"glyphicon glyphicon-plus"` постачається bootstrap темою, яку ми використовуємо, і буде відображати знак плюса.

Після додавання відповідного рядка, ваш html файл має виглядати наступним чином:

```html
{% load staticfiles %}
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

Після збереження та оновлення сторінки http://127.0.0.1:8000 ви звісно побачите знайому помилку `NoReverseMatch`, правда?

## URL

Відкриваємо `blog/urls.py` і додаємо рядок:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```

Остаточно код буде виглядати так:

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Після оновлення сайту бачимо помилку `AttributeError`, оскільки відображення `post_new` не реалізоване. Давайте додамо цей вид прямо зараз.

## Відображення post_new

Час відкрити файл `blog/views.py` і додати наступні рядки:

```python
from .forms import PostForm
```

і функцію для потрібного *відображення*:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Щоб створити нову форму `Post`, нам потрібно викликати функцію `PostForm()` і передати її до шаблону. Повернемося пізніше до цього відображення, а зараз давайте створимо шаблон для форми.

## Шаблон

Нам потрібно створити файл `post_edit.html` у папці `blog/templates/blog`. Щоб створити форму нам знадобиться декілька речей:

- нам треба показати форму. Можна, наприклад, зробити це за допомогою простого `{% raw %}{{ form.as_p }}{% endraw %}`.
- верхній рядок має бути розміщений всередині тега HTML для форми: `<form method="POST">...</form>`
- нам знадобиться кнопка Зберегти - `Save`. Створимо її в HTML за допомогою: `<button type="submit">Save</button>`
- і нарешті, одразу після відкриваючого тегу `<form ...>` ми маємо додати `{% raw %}{% csrf_token %}{% endraw %}`. Це дуже важливо з міркувань безпеки вашої форми! Django наголосить на цьому, якщо ви раптом забудете вказати згадану вказівку і будете намагатися зберегти форму:

![CSFR Forbidden page](images/csrf2.png)

Добре, отже, давайте подивимось як має виглядати HTML код в `post_edit.html`:

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

Час перезавантажитись! Йой! Ваша форма відображується!

![New form](images/new_form2.png)

Але, одну хвилиночку! Коли ви набираєте щось в полях `title` і `text`, та намагаєтесь зберегти зміни - що ж тоді станеться?

А нічого! Ми знову опинимося на тій самій сторінці, і наш текст зникне... і жодного нового поста. Отже, що ж пішло не так?

Відповідь: нічого. Мусимо проробити трохи більше роботи з нашим блоком *view*.

## Зберігання форми

Відкрийте `blog/views.py` знову. Наразі все що ми маємо в `post_new` це:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Коли ми відправляємо форму, ми потрапляємо в той самий view, але цього разу маємо більше даних в `request`, а якщо точніше - в `request.POST` (ця назва не пов’язана з блогерським терміном "пост", вона пов’язана з тим що ми "постимо" дані). Пам'ятайте, що у файлі HTML наше визначення `<form>` містило атрибут `method="POST"`? Усі поля форми на даний момент знаходитимуться в `request.POST`. Ви не повинні перейменовувати `POST` на щось інше (лише єдине альтернативне прийнятне значення для атрибуту `method` це `GET`, але ми не маємо часу пояснювати в чому різниця).

Отже, ми маємо дві окремі ситуації, що потребують контролю для нашого блоку вид *view*. Перша: коли ми отримуємо доступ до сторінки вперше і хочемо отримати пусту форму. Друга: коли ми повертаємось назад до виду *view* із усіма нещодавно доданими даними форми. Таким чином, маємо додати умову (використаємо для цього `if`).

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Час заповнити порожнє місце `[...]`. Якщо метод `method` є методом `POST`, тоді ми захочемо створити `PostForm` з даними форми, вірно? Зробимо це за допомогою:

```python
form = PostForm(request.POST)
```

Просто! Наступна річ - перевірити чи коректно заповнена форма (налаштовані усі необхідні поля і не відбулося зберігання жодного некоректного значення). Зробимо це за допомогою `form.is_valid()`.

Ми перевіряємо чи є форма прийнятною і якщо це так, то можемо зберегти її!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

В основі, маємо тут два моменти: зберігаємо форму за допомогою `form.save` і додаємо автора (оскільки поле автор `author` було відсутнє в `PostForm` і це поле є необхідним!). `commit=False` означає, що ми не хочемо поки що зберігати модель `Post` - ми хочемо спочатку додати ім'я автора. У більшості випадків ви будете користуватися `form.save()` без `commit=False`, але в даному випадку, ми маємо це зробити.
`post.save()` захистить здійснені зміни (додавання автора) і створиться новий блог пост!

Зрештою, було б чудово, якби ми могли миттєво переходити на сторінку `post_detail` для щойно створеного допису у блозі, чи не так? Щоб зробити це, нам необхідно виконати ще один імпорт:

```python
from django.shortcuts import redirect
```

Додайте це з самого початку вашого файлу. А тепер можемо сказати: перейти на сторінку `post_detail` для щойно створеного поста.

```python
return redirect('post_detail', pk=post.pk)
```

`blog.views.post_detail` - ім'я виду, до якого ми хочемо перейти. Пам'ятаєте, що цей вид потребує змінної `pk`? Щоб здійснити передачу вище згаданої змінної, скористаємося `pk=post.pk`, де `post` є новим постом!

Але, щось дуже багато балачок, напевно ми хотіли б побачити, як відображується даний вид наразі в цілому, правда ж?

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

Подивимося, чи усе працює. Зайдіть на сторінку http://127.0.0.1:8000/post/new/, додайте `title` та `text`, збережіть... і вуаля! Новий блог пост успішно додано і нас автоматично перенаправило на сторінку `post_detail`!

Ви могли помітити, що ми встановлюємо дату публікації, перед збереженням поста. Пізніше, ми введемо *кнопку публікації* в **Django Girls Tutorial: Розширте ваш додаток**.

Просто чудово!

> Оскільки ми нещодавно мали справу з інтерфейсом Django адміністратора система наразі вважає, що ми залогінились. Є декілька ситуацій, які могли призвести до того, що ми вийшли з системи (закриття браузера, перезавантаження бази даних тощо). Якщо раптом виявиться, що при створенні поста з'явиться помилка, пов'язана із відсутністю залогіненого користувача, перейдіть на сторінку адміністратора http://127.0.0.1:8000/admin і залогіньтеся знову. Проблему тимчасово буде вирішено. Безповоротне розв'язання проблеми чекає на вас у розділі __Домашня робота: безпека вашого сайту!__ після освоєння головного посібника.

![Logged in error](images/post_create_error.png)


## Перевірка форми

А тепер ми покажемо вам, наскільки круто використовувати Django форми. Блог пост повинен мати такі поля як заголовок - `title` і зміст - `text`. В нашій моделі `Post` ми не вказали (на відміну від дати публікації - `published_date`), що ці поля не є необхідними, отже, Django, за замовчуванням, очікує що вони будуть заповнені.

Спробуйте зберегти форму без атрибутів `title` і `text`. Здогадуємось, що трапиться!

![Перевірка форми](images/form_validation2.png)

Django турбується про те, щоб усі поля нашої форми були коректно заповнені. Хіба це не круто?


## Редагування форми

Тепер ми знаємо як додати нову форму. Та якщо ми раптом захочемо відредагувати вже існуючу? Це дуже схоже на те, що ми щойно проробили. Давайте швидко створимо певні важливі речі (якщо вам щось незрозуміло, ви маєте запитати вашого тренера або ще раз передивитись попередній параграф, оскільки ми вже пройшли усі ці речі).

Відкрийте `blog/templates/blog/post_detail.html` і додайте наступний рядок:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

таким чином, шаблон буде виглядати подібним чином:

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

В `blog/urls.py` додамо цей рядок:

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

Повторно використаємо шаблон `blog/templates/blog/post_edit.html`, отже, остання річ, яка лишилась це відображення..

Давайте відкриємо `blog/views.py` і додамо в самому кінці файлу:

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

Виглядає майже точно так, як і наш вид `post_new`, правда? Не зовсім. Перше: ми передаємо додатковий параметр `pk` з адресного рядку. Наступне: ми отримуємо модель `Post`, яку хотіли б відредагувати як `get_object_or_404(Post, pk=pk)` і потім, при створенні форми ми передаємо цей пост як екземпляр `instance`, коли зберігаємо форму:

```python
form = PostForm(request.POST, instance=post)
```

а коли ми просто відкриваємо форму з цим постом для редагування:

```python
form = PostForm(instance=post)
```

Добре, давайте протестуємо, чи все працює! Перейдімо на сторінку `post_detail`. У верхньому правому кутку має з'явитися кнопка редагування:

![Кнопка редагування](images/edit_button2.png)

Коли ви натиснете на неї, то побачите форму з нашим блог постом:

![Редагування форми](images/edit_form2.png)

Можете вільно змінити заголовок або текст і зберегти зміни!

Вітаємо! Ваш додаток стає все більш і більш повним!

Якщо бажаєте дізнатись більше інформації про форми Django, ознайомтесь із документацією: https://docs.djangoproject.com/en/1.9/topics/forms/

## Безпека

Створювати нові публікації просто клацаючи на посилання класно! Але зараз, будь-хто хто відвідує ваш сайт, буде здатним опублікувати пост, а ви цього напевне не хочете. Давайте зробимо так що кнопка показується для вас, але не показується для всіх інших.

В `blog/templates/blog/base.html`, знайдіть наш `page-header` `div` і тег посилання який ви додали туди раніше. Вони повинні виглядати якось так:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Ми збираємось додати інший тег `{% if %}` який показуватиме посилання лише користувачам які ввійшли від імені адміністратора. На даний момент, це лише ви! Змініть тег `<a>` щоб він виглядав так:

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Цей `{% if %}` зробить так, що посилання буде відправлятись браузеру лише коли користувач, що запитував сторінку, залогований. Це не захищає від створення нових публікацій анонімами повністю, але це непоганий перший крок. Ми розглянемо більше питань безпеки в розширених уроках.

Пам'ятаєте іконку редагування, що ми додали до нашої сторінки з деталями посту? Ми також хочемо додати цю ж зміну сюди, щоб інші люди не могли редагувати існуючі пости.

Відкрийте `blog/templates/blog/post_detail.html` і знайдіть:

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Замініть це на:

```html
{% if user.is_authenticated %}
	<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Оскільки ви ввійшли до системи, то якщо оновите сторінку, не побачите зміни. Відкрийте сторінку в новому браузері або в анонімному вікні, і тоді ви побачите, що посилання не показується!

## Ще одне: розгортання!

Давайте поглянемо, чи це все працює на PythonAnywhere. Час для ще одного розгортання!

*   Спершу, закомітьте новий код і зробіть push на GitHub

```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```

*   Тоді, в [bash консолі PythonAnywhere](https://www.pythonanywhere.com/consoles/):

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

* Нарешті, перейдіть на [вкладку Web](https://www.pythonanywhere.com/web_app_setup/) і натисніть **Reload**.


І це все! Вітання :)
