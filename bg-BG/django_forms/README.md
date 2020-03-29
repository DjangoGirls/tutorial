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

> Тъй като наскоро ползвахме административния интерфейс на Django, системата в момента си мисли, че сме влезнали в акаунта си. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. This will fix the issue temporarily. There is a permanent fix awaiting you in the **Homework: add security to your website!** chapter after the main tutorial.

![Logged in error](images/post_create_error.png)

## Form validation

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new post. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

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

This looks almost exactly the same as our `post_new` view, right? But not entirely. For one, we pass an extra `pk` parameter from `urls`. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

When you click it you will see the form with our blog post:

![Edit form](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Congratulations! Your application is getting more and more complete!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Security

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` tag to look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. This doesn't protect the creation of new posts completely, but it's a good first step. We'll cover more security in the extension lessons.

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

## One more thing: deploy time!

Let's see if all this works on PythonAnywhere. Time for another deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it! Congrats :)