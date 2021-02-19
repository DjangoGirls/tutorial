# Àwọn fọ́ọ̀mù Django

Ohun tó kẹ́yìn tí a fẹ́ ṣe lórí ààyè ayélujára wa ni láti ṣẹ̀dá ọ̀nà tó dára kan láti ṣàfikún àti ṣàtúnṣe àwọn àròkọ blog. `admin` ti Django dára, ṣùgbọ́n ó ṣòro láti ṣé bí o ṣe fẹ́ àti láti mú rẹwà. Pẹ̀lú `forms`, a máa ní gbogbo agbára lórí atọ́kùn wa – a lè fẹ́rẹ̀ẹ́ ṣe ohunkóhun tí a lè wòye sí!

Ohun tó dára nípa àwọn fọ́ọ̀mù Django ni pé a lè ṣàlàyé ìkan láti ìbẹ̀rẹ̀ tàbí ṣẹ̀dá `ModelForm` kan èyí tí yíò tọ́jú èsì fọ́ọ̀mù náà sínú àwòṣe náà.

Èyí jẹ́ ohun tí a fẹ́ ṣe gan-an: a ó ṣẹ̀dá fọ́ọ̀mù kan fún àwòṣe `Post` wa.

Gẹ́gẹ́ bí gbogbo apá tó ṣe pàtàkì nínú Django, àwọn fọ́ọ̀mù ní fáìlì tiwọn: `forms.py`.

A nílò láti ṣẹ̀dá fáìlì kan pẹ̀lú orúkọ yìí nínú àkójọpọ̀ fáìlì `blog` náà.

    blog
       └── forms.py
    

O dáa, jẹ́ ká ṣí i nínú olóòtú kóòdù náà kí a sì tẹ kóòdù tó tẹ̀le yìí:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

A nílò láti ṣàgbéwọlé àwọn fọ́ọ̀mù Django lákọ̀ọ́kọ́ (`from django import forms`) àti àwòṣe `Post` wa (`from .models import Post`).

`PostForm`, bí o ṣe lérò, jẹ́ orúkọ fọ́ọ̀mù wa. A nílò láti sọ fún Django pé fọ́ọ̀mù yìí jẹ́ `ModelForm` kan (kí Django baà lè ṣe àwọn iṣẹ́ kan fún wa) – `forms.ModelForm` ló máa ṣe ìyẹn.

Lẹ́yìn náà, a ní `class Meta`, níbi tí a ti máa sọ àwòṣe tó yẹ kí Django lò láti ṣẹ̀dá fọ́ọ̀mù yìí (`model = Post`).

Ní ìparí, a lè sọ (àwọn) ààyè tó yẹ kó wà nínú fọ́ọ̀mù wa. Ní irú ìṣẹ̀lẹ̀ yìí, a fẹ́ kí `title` àti `text` nìkan hàn síta – ó yẹ kí `author` jẹ́ ẹni tó ti wọlé lọ́wọ́lọ́wọ́ (ìwọ!) àti pé ó yẹ kí `created_date` wà ní ètò fúnra rẹ̀ nígbà tí a bá ṣẹ̀dá àròkọ kan (ìyẹn ni pé, nínú kóòdù náà), àbí bẹ́ẹ̀ kọ?

Òhun nìyẹn! Gbogbo ohun tí a nílò láti ṣe báyìí ni láti lo fọ́ọ̀mù náà nínú *view* kan kí a sì ṣàfihàn rẹ̀ nínú àwòṣe kan.

Nítorí náà, a ó ṣẹ̀dá atọ́ka sí ojú-ìwé náà kan, URL kan, view kan àti àwòṣe kan lẹ́ẹ̀kan síi.

## Atọ́ka sí ojú-ìwé kan pẹ̀lú fọ́ọ̀mù náà

Before we add the link, we need some icons to use as buttons for the link. For this tutorial, download [file-earmark-plus.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/file-earmark-plus.svg) and save it in the folder `blog/templates/blog/icons/`

> Note: To download the SVG image, open the context menu on the link (usually by right-clicking on it) and select "Save link as". In the dialog asking you where to save the file, navigate to the `djangogirls` directory of your Django project, and within that to subdirectory `blog/templates/blog/icons/`, and save the file there.

It's time to open `blog/templates/blog/base.html` in the code editor. Now we can use this icon file inside the base template as follow. In the `div` tag inside `header` section, we will add a link before `h1` tag:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

Note that we want to call our new view `post_new`. The [SVG icon](https://icons.getbootstrap.com/icons/file-earmark-plus/) is provided by the [Bootstrap Icons](https://icons.getbootstrap.com/) and it will display a page icon with plus sign. We use a Django template directive called `include`. This will inject the file's content into the Django template. The web browser knows how to handle this type of content without any further processing.

> You can download all the Bootstrap icons [here](https://github.com/twbs/icons/releases/download/v1.1.0/bootstrap-icons-1.1.0.zip). Unzip the file and copy all the SVG image files into a new folder inside `blog/templates/blog/` called `icons`. That way you can access an icon like `pencil-fill.svg` using the file path `blog/templates/blog/icons/pencil-fill.svg`

After editing the line, your HTML file should now look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
            <div class="container">
                <a href="{% url 'post_new' %}" class="top-menu">
                    {% include './icons/file-earmark-plus.svg' %}
                </a>
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
        </header>
        <main class="content container">
            <div class="row">
                <div class="col">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </main>
    </body>
</html>
```

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` in the code editor and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

And the final code will look like this:

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

After refreshing the site, we see an `AttributeError`, since we don't have the `post_new` view implemented. Let's add it right now.

## view post_new

Time to open the `blog/views.py` file in the code editor and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

And then our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

To create a new `Post` form, we need to call `PostForm()` and pass it to the template. We will go back to this *view*, but for now, let's quickly create a template for the form.

## Àwòṣe (template)

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* A ní láti ṣàfihàn fọ́ọ̀mù náà. A lè ṣe ìyẹn pẹ̀lú (fún àpẹẹrẹ) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Ìlà tó wà lókè yìí nílò láti gba wíwé pẹ̀lú àmì fọ́ọ̀mù HTML kan: `<form method="POST">...</form>`.
* A nílò bọ́tìnnì `Save` kan. A lè ṣe ìyẹn pẹ̀lú bọ́tìnnì HTML kan: `<button type="submit">Save</button>`.
* Ní ìparí, kété lẹ́yìn àmì `<form ...>` ṣíṣí náà, a nílò láti ṣàfikún {% raw %}`{% csrf_token %}`{% endraw %}. Èyí ṣe pàtàkì púpọ̀, nítorí pé yóò pèsè ààbò fún àwọn fọ́ọ̀mù rẹ! Tí o bá gbàgbé nípa apá yìí, Django yíò ṣàròyé nígbà tí o bá gbìyànjú láti tọ́jú fọ́ọ̀mù náà:

![CSFR Forbidden page](images/csrf2.png)

OK, so let's see how the HTML in `post_edit.html` should look:

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

Time to refresh! Yay! Your form is displayed!

![New form](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

The answer is: nothing. We need to do a little bit more work in our *view*.

## Títọ́jú fọ́ọ̀mù náà

Open `blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? All the fields from the form are now in `request.POST`. You should not rename `POST` to anything else (the only other valid value for `method` is `GET`, but we have no time to explain what the difference is).

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. So we need to add a condition (we will use `if` for that):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

It's time to fill in the dots `[...]`. If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? We will do that as follows:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.

We check if the form is valid and if so, we can save it!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Basically, we have two things here: we save the form with `form.save` and we add an author (since there was no `author` field in the `PostForm` and this field is required). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

Finally, it would be awesome if we could immediately go to the `post_detail` page for our newly created blog post, right? To do that we need one more import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Add it at the very beginning of your file. And now we can say, "go to the `post_detail` page for the newly created post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` is the name of the view we want to go to. Remember that this *view* requires a `pk` variable? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

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

Let's see if it works. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

That is awesome!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. This will fix the issue temporarily. There is a permanent fix awaiting you in the **Homework: add security to your website!** chapter after the main tutorial.

![Logged in error](images/post_create_error.png)

## Fífìdí fọ́ọ̀mù múlẹ̀

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Fọ́ọ̀mù àtúnṣe

Now we know how to add a new post. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

First, let's save the icon which represents the edit button. Download [pencil-fill.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/pencil-fill.svg) and save it to the location `blog/templates/blog/icons/`.

Open `blog/templates/blog/post_detail.html` in the code editor and add the following code inside `article` tag:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<aside class="actions">
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
      {% include './icons/pencil-fill.svg' %}
    </a>
</aside>
```

so that the template will look like this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <article class="post">
        <aside class="actions">
            <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
                {% include './icons/pencil-fill.svg' %}
            </a>
        </aside>
        {% if post.published_date %}
            <time class="date">
                {{ post.published_date }}
            </time>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
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

## Ààbò

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `div` inside `header` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` tag to look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu">
        {% include './icons/file-earmark-plus.svg' %}
    </a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. This doesn't protect the creation of new posts completely, but it's a good first step. We'll cover more security in the extension lessons.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
    {% include './icons/pencil-fill.svg' %}
</a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
        {% include './icons/pencil-fill.svg' %}
     </a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## Ó ṣì ku nnkan kan: àkókò láti ṣàgbékalẹ̀!

Let's see if all this works on PythonAnywhere. Time for another deploy!

* Lákọ̀ọ́kọ́, ṣàrídájú kóòdù tuntun rẹ, kí o sì tì í sí GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Lẹ́yìn náà, nínú [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/) kan:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Ní ìparí, lọ sí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) náà (lo bọ́tìnnì àkójọ àṣàyàn tó wà ní òkè lápá ọ̀tún console náà) kí o sì tẹ **Reload**. Ṣe ìmúdójúìwọ̀n blog https://subdomain.pythonanywhere.com rẹ láti rí àwọn ìyípadà náà.

And that should be it. Congrats! :)