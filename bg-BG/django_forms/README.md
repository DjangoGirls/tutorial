# Django Forms

Последното нещо, което искаме да направим в нашия уеб сайт е да създадем начин за добавяне и редактиране на публикации в блога. Django's `admin` е супер, но е по-трудно да се персонализира и направи приятно на външен вид. С `forms` ще имаме абсолютно надмощие над нашия изглед - можем да правим почти всичко което може да си представим!

Хубавото на Django формите е, че може да дефинираме форма от самото начало или да създадем ModelForm, в която ще съхраняваме резултатът от формата на модела.

Точно това искаме да направим: ще създадем форма за нашия `Post` модел.

Като всяка важна част от Django, формите също имат собствен файл: `forms.py`.

Трябва да създадем файл с това наименование в директорията на `blog`.

    blog
       └── forms.py
    

И така, нека да отворим IDE и напишем следният код:

{% filename %}blog/forms.py{% endfilename %} 

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Първо трябва да въведем Django формите (`from django import forms`) и нашия `Post` модел (`from .models import Post`).

`PostForm`, както забелязахте е името на нашата форма. Трябва да кажем на Django, че тази форма е `ModelForm` (така че Django да направи малко магия за нас) - `forms.ModelForm` отговаря за това.

След това с `class Meta`, казваме на Django кой модел трябва да се използва за да се създаде тази форма (`model = Post`).

Най-накрая трябва да кажем с какви полета ще разполагаме в нашата форма. При този сценарий искаме само `title` и `text` да бъдат показани - `author` ще бъде този, който в момента е влязъл с профила си (ти!) и `created_date` трябва автоматично да се създаде, когато започнем нова публикация (като в кода), нали?

И това е! Всичко от което имаме нужда в момента е да използваме формата във *view* и да я покажем в шаблона.

И така още веднъж, ще създадем връзка до страницата чрез URL, view и template.

## Връзка до страницата чрез формата

Време е да отворим `blog/templates/blog/base.html` в редактора. В `div` наречен `page-header` ще добавим връзка:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Забележете, че искаме да извикаме нашия нов изглед `post_new`. Класът `"glyphicon glyphicon-plus"` е предоставен от темата на bootstrap, която използваме и ще покаже знака плюс.

След добаване на този ред, вашия HTML файл трябва да изглежда ето така:

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

След запазване и обновяване на страницата http://127.0.0.1:8000 трябва да виждате познатата грешка `NoReverseMatch`. Така ли е? Добре!

## URL

Отваряме файла `blog/urls.py` в редактора и добавяме ред:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

И последния код трябва да изглежда така:

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

След като обновим сайта виждаме `AttributeError`, тъй като нямаме изглед за изпълнението на `post_new`. Нека го добавим сега.

## post_new изглед

Време е да отворим файлът `blog/views.py` в редактора и да добавим следните няколко реда от код при останалите във формата

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

И след това нашия изглед:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

За да създадем нова форма `Post`, трябва да извикаме `PostForm()` и да я препратим към шаблона (template). Ще се върнем отново на този изглед (view), но сега нека бързо да създадем шаблон (template) за формата.

## Шаблон (Template)

Трябва да създадем файл `post_edit.html` в директория `blog/templates/blog` и да го отворим в редактора ни за код. За да направим така, че формата да работи са ни нужни няколко неща:

* Трябва да покажем формата. Можем да направим това чрез (например) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Горният ред трябва да бъде обвит с HTML form tag: `<form method="POST">...</form>`.
* Трябва ни бутон `Save`. Това правим с HTML button: `<button type="submit">Save</button>`.
* И най-накрая, точно след отварящия `<form ...>` tag трябва да добавим {% raw %}`{% csrf_token %}`{% endraw %}. Това е много важно, тъй като прави нашата форма надеждна! Ако забравите за това, Django ще се оплаче когато се опитате да запазите формата.

![CSFR Forbidden page](images/csrf2.png)

Добре, нека видим сега как трябва да изглежда HTML кода в `post_edit.html`:

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

Време е да обновим страницата! Иха! Формата се показа!

![New form](images/new_form2.png)

Но, чакай малко! Когато напишеш нещо в полетата `title` и `text` и се опиташ да го запазиш, какво ще стане?

Нищо! Пак сме на същата страница и нашият текст изчезна... и няма нова публикация. Какво се обърка?

Отговорът е: нищо. Трябва още малко да поработим върху нашия изглед (*view*).

## Запазване на формата

Отворете пак `blog/views.py` в редактора. В момента всичко, което имаме в изгледа на `post_new` е следното:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Когато изпратим форматата се връщаме пак на същият изглед, но този път имаме повече данни в запитването (`request`) или по-точно в `request.POST` (наименованието няма нищо общо с блога "post", а с факта, че "публикуваме" информация). Помните ли как в нашия HTML файл при дефинирането на `<form>` имахме променлива `method="POST"`? Всички тези полета са сега в `request.POST`. Не трябва да преименувате `POST` (друга валидна стойност за `method` е `GET`, но нямаме време да обясним каква е разликата).

И така в нашия изглед (*view*) имаме две отделни ситуации да разрешим: първо, когато достъпваме страницата за първи път и искаме празна форма, и второ, когато се върнем назад към изгледа (*view*) с всичките данни които сме въвели във формата. Тоест трябва да добавим условие (ще използваме `if` за тази цел):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Време е да попълним празното място `[...]`. Ако `method`-а е `POST` тогава искаме да изградим `PostForm` с данни от формата, нали? Ще направим това както следва:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Следващото нещо е да проверим дали формата е вярна (всики полета които се изискват да са определени и да няма неправилно въведени стойности). Правим това чрез `form.is_valid()`.

Проверяваме дали формата е валидна и ако да в запазваме!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Основно имаме две неща: запазваме формата с `form.save` и добавяме автор (тъй като няма поле `author` във формата `PostForm` а това поле се изисква). `commit=False` означава, че не искаме все още да запазим моделът `Post` - искаме да добавим първо автора. През повечето време ще използвате `form.save()` без `commit=False`, но в този случай трябва да се снабдим с него. `post.save()` ще запази промените (добавяне на автора) и новата публикация в блога е създадена!

Накрая, би било добре ако можем веднага да отидем на страницата `post_detail` за нашата новосъздадена блог публикация, нали? За да направим това трябва ни трябва още едно въвеждане:

{% filename %}blog/views.py{% endfilename %} 

```python
from django.shortcuts import redirect

```

Добавете го в самото начало на вашия файл. И сега можем да кажем "отиди на страница `post_detail` за новосъздадената публикация":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)

```

`post_detail` е името на изгледа, на който искаме да отидем. Помните ли, че този изглед (*view*) изискваше стойност `pk`? За да го предадем на изгледа използваме `pk=post.pk`, където `post` е новосъздадена публикация!

И така, говорихме много, но може би искаме да видим как изглежда всичко, нали?

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

Нека видим дали работи. Отидете на страница http://127.0.0.1:8000/post/new, добвавете `title` и `text`, запазете..и voilà! Новата публикация е добавена и сме пренасочени към страница `post_detail`!

Може би забелязахте, че избираме датата на публикуване преди да запазим публикацията. По-късно ще се запознаем с *publish button* in **Django Girls Tutorial: Extensions**.

Това е страхотно!

> Тъй като наскоро ползвахме административния интерфейс на Django, системата в момента си мисли, че сме влезнали в акаунта си. Има няколко ситуации, които могат да доведат до излизане от акаунта (затваряне на търсачката, рестартиране на базата данни, и др.). Ако при създаване на нова публикация получавате грешки свързани с потребител, който не е влязал в акаунта си, отидете на администраторската страница http://127.0.0.1:8000/admin и влезте пак в акаунта си. Това ще реши проблема временно. Има дълготрайно решение на проблема, което ви очаква в раздела **Домашна работа: добавяне на сигурност към уеб страницата ви!** намиращ се след главното ръководство.

![Logged in error](images/post_create_error.png)

## Проверка на формите (Form validation)

Сега ще ви покажем колко са готини формите на Django. Една публикация трябва да има полета за `title` и `text`. В нашия `Post` модел не казахме дали тези полета се изискват (както при `published_date`), така че Django очаква те да са нагласени по подразбиране.

Опитайте се да запазите формата без `title` и `text`. Познайте какво ще стане!

![Form validation](images/form_validation2.png)

Django се грижи за проверката дали всички полета във формата ни са правилни. Не е ли готино?

## Редактиране на формата

Сега знаем как да добавим нова публикация. Но какво ако искаме да променим вече съществуваща? Това много прилича на това, което тъкмо направихме. Нека набързо да създадем няколко важни неща. (Ако не разбирате нещо, попитайте инструктора си или вижте в предходните глави, тъй като вече минахме врез всичко това.)

Отворете `blog/templates/blog/post_detail.html` в редактора и добавете реда

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

така че шаблона (template) да изглежда така:

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

Отворете `blog/urls.py` в редактора и добавете този ред:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Ще използваме пак шаблона `blog/templates/blog/post_edit.html`, така че последното липсващо нещо е изгледа (*view*).

Нека отворим `blog/views.py` в редактора и да добваим това накрая на файла:

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

Това изглежда почти еднакво с нашия изглед `post_new`, нали? Но не изцяло. Първо зададохме допълнителен `pk` параметър от `urls`. После взехме `Post` модела, който искаме да променим с `get_object_or_404(Post, pk=pk)` и накрая, когато създаваме форма, подаваме тази публикация като инстанция (`instance`), когето запазваме формата...

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

... и когато отваряме формата с публикацията, която искаме да променим:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Добре! Нека проверим дали работи! Да отидем на страница `post_detail`. Трябва да има бутон за редактиране в горния десен ъгъл:

![Edit button](images/edit_button2.png)

Когато го натиснете, ще видите формата с нашата публикация:

![Edit form](images/edit_form2.png)

Можете да промените заглавието или текста и да запазите промените!

Поздравления! Вашата апликация изглежда все по- и по-завършена!

Ако искате повече информация относно Django формите, трябва да прочетете документацията: https://docs.djangoproject.com/en/2.2/topics/forms/

## Сигурност

Да можете да създадете нови публикация чрез един клие е страхотно! Но сега всеки, който посети вашата страница ще може да създаде нова публикация и това е нещо, което може би не искате. Нека направим така, че бутонът да се показва за вас, но не и за останалите.

Отворете `blog/templates/blog/base.html` в редактора и намерете `page-header` `div` и реда посочващ anchor tag, който по-рано сложихте там. Трябва да изглежда така:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Ще добавим още един `{% if %}` към това, което ще накара връзката да се показва само за потребители, които са влезнали в административния панел. В момента това си само ти! Променете `<a>` да изглежда така:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Този `{% if %}` ще накара връзката да се изпраща до търсачката, само ако потребителят, който изисква страницата е влязъл в акаунта си. Това не предпазва напълно от създаване на нови публикации, но е добре като за начало. Ще покрием повече относно сигурността в продължението на уроците.

Помните ли иконата за редактиране, която тъкмо добавихме в страницата ни с детайли? Ще добавим същата промяна и там, така че други хора да не могат да променят съществуващи публикации.

Отворете `blog/templates/blog/post_detail.html` в редактрора и намерете този ред:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %} 

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Променете го на това:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Тъй като най-вероятно сте в акаунта си, ако опресните страницата, няма да видите разликата. Заредете страницата в друга търсачка или в инкогнито прозорец (наречен още "InPrivate" в Windows Edge) и ще видите, че връзката не се показва и иконата също не се появява на екрана!

## Още едно нещо: време за deploy

Нека видим дали всичко работи на PythonAnywhere. Време е за още един deploy!

* Първо съхранете новия си код и го пратете към GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* След това в [PythonAnywhere Bash конзолата](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Не забравяйте да замените `<your-pythonanywhere-domain>` с вашият PythonAnywhere субдомейн без скобите.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it! Congrats :)