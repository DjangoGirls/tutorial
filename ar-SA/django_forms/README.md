# نماذج جانغو

الشيء الأخير الذي نريد القيام به على موقعنا هو خلق وسيلة لطيفة لإضافة وتحرير مشاركات مدونتنا. دجانغو `admin` جميل ، لكن من الصعب تخصيصه وجعله جميلا. مع `forms` سيكون لدينا سلطة مطلقة على واجهتنا – يمكن أن نفعل أي شيء تقريبا يمكن أن نتصور!

الشيء الجميل حول أشكال جانغو هو أنه يمكننا تخصيص واحد من الصفر أو إنشاء `ModelForm` الذي سيحفظ نتيجة النموذج في الشكل.

هذا بالضبط ما نريد فعله سننشئ شكل لنمودج `Post`.

مثل كل جزء مهم من دجانغو، فإن النماذج لها ملف خاص بها `forms.py`.

نحن بحاجة إلى إنشاء ملف بهذا الاسم في دليل `blog`.

    blog
       └── forms.py
    

حسنًا، دعونا نفتحه في محرر التعليمات البرمجية (أي في البرنامج الذي تكتب فيه الأكواد) ونكتب التعليمات البرمجية التالية:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

نحتاج أولا الى جلب و احضار نماذج جانغو (`from django import forms`) and our `Post` model (`from .models import Post`).

`PostForm`,، كما كنت تظن ربما، هو اسم النموذج. نحن بحاجة إلى أن نقول لدجانغو ان هذا النموذج هو `ModelForm`(لذلك جانغو ستقوم ببعض السحر `forms.ModelForm` هو المسؤول عن ذلك.

تاليا ، لدينا `class Meta` والذي يقول لدجانغو اي نمودج يجب استخدامه لإنشاء الشكل (`model = Post`).

وأخيراً، يمكننا أن نقول ياي حقول يجب ان تنتهي في شكلنا. في هذا السيناريو نريد فقط `title` و `text` عرضه – – `author` ينبغي أن يكون الشخص الذي قام بتسجيل هو (أنت!) ويجب تعيين `created_date` تلقائياً عندما نقوم بإنشاء مشاركة (أي في التعليمات البرمجية)، اليس كذالك؟

وهذا كل شيء! كل ما يتعين علينا فعله الآن هو استخدام الشكل في *view* وعرضه في نموذج.

لذلك مرة أخرى سنقوم بإنشاء رابط إلى صفحة، UR، والعرض والقالب.

## رابط لصفحة مع الشكل

قبل أن نضيف الرابط، نحتاج إلى بعض الأيقونات لاستخدامها كأزرار للرابط. لهذا البرنامج التعليمي، قم بتنزيل [file-earmark-plus.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/file-earmark-plus.svg) وحفظه في المجلد `blog/templates/blog/icons/`

> ملاحظة: لتنزيل صورة SVG، قم بفتح قائمة السياق على الرابط (عادة بالنقر على اليمين عليه) واختر "حفظ الرابط ك". في مربع الحوار الذي يسألك أين تحفظ الملف، انتقل إلى دليل `djangogirl` لمشروع جانغو الخاص بك. وفي ذلك إلى الدليل الفرعي `blog/templates/blog/icons`، وحفظ الملف هناك.

حان الوقت لفتح `blog/templates/blog/base.html` في محرر التعليمات البرمجية. الآن يمكننا استخدام ملف الأيقونة هذا داخل قالب القاعدة كما يلي. في عنصر `div` داخل قسم `header` ، سنضيف رابط قبل عنصر `h1`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

لاحظ أننا نريد تسمية العرض الجديد `post_new`. الـ SVG icon [](https://icons.getbootstrap.com/icons/file-earmark-plus/) مقدم من [Bootstrap Icons](https://icons.getbootstrap.com/) وسوف يعرض أيقونة صفحة مع علامة زائد. نحن نستخدم موجه قالب جانغو يسمى `include`. سيؤدي هذا إلى حقن محتوى الملف في قالب جانغو. متصفح الويب يعرف كيفية التعامل مع هذا النوع من المحتوى دون أي معالجة أخرى.

> يمكنك تنزيل جميع أيقونات Bootstrap [here](https://github.com/twbs/icons/releases/download/v1.1.0/bootstrap-icons-1.1.0.zip). فك ضغط الملف وانسخ جميع ملفات صور SVG في مجلد جديد داخل `blog/templates/blog/` يسمى `icons`. بهذه الطريقة يمكنك الوصول إلى أيقونة مثل `pencil-fill.svg` باستخدام مسار الملف `blog/templates/blog/icons/pencil-fill.svg`

بعد تعديل السطر ، يجب أن يبدو ملف HTML الخاص بك مثل هذا:

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

بعد حفظ و تحديث الصفحة : http://127.0.0.1:8000 سوف ترى خطأ مألوف! `NoReverseMatch` هل هذا ما حدث معك/معكي؟ جيد !!

## عنوان الموقع URL

نقوم بفتح `blog/urls.py` في محرر التعليمات البرمجية وإضافة سطر:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

وسوف تبدو التعليمات البرمجية النهائية هكذا:

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

بعد تحديث الموقع، نرى `AttributeError`، حيث أننا ليس لدينا `post_new` طريقة عرض منفذة. دعونا نضيفها الآن.

## عرض post_new

حان الوقت لفتح `blog/views. y` الملف في محرر التعليمات البرمجية وإضافة الأسطر التالية مع بقية صفوف `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

عندها *view* الخاصة بنا:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

لإنشاء نموذج `Post` جديد، نحن بحاجة إلى استدعاء `PostForm()` وتمريرها إلى القالب. سنعود لهذا *view* لكن الأن دعونا ننشئ شكل نمودج سريعا.

## القالب

نحن بحاجة إلى إنشاء ملف `post_edit.html` في الدليل `blog/templates/blog`، وفتحه في محرر التعليمات البرمجية. لجعل النموذج يعمل نحن بحاجة إلى عدة أشياء:

* علينا عرض الشكل. يمكننا أن نفعل ذلك عبر (على سبيل المثال{% raw %}`{{ form.as_p }}`{% endraw %}.
* يجب تغليف السطر أعلاه مع عنصر نموذج HTML: `<form method="POST">...</form>`.
* ونحن بحاجة إلى زر `Save`. ونحن نفعل ذلك مع زر HTML: `<button type="submit">Save</button>`.
* وأخيراً، فقط بعد افتتاح العلامة `<form ...>` نحن بحاجة إلى إضافة {% raw %} `{% csrf_token %}`{% endraw %}. هذا أمر مهم جداً، لأنه يجعل النماذج الخاصة بك آمنة! إذا كنت قد نسيت هذا قليلاً، سيشكو جانغو عند محاولة حفظ النموذج:

![CSFR Forbidden page](images/csrf2.png)

حسنًا، دعونا نرى كيف يجب أن تبدو HTML في `post_edit.html`:

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

حان وقت التحديث! ياي! يتم عرض النموذج الخاص بك!

![New form](images/new_form2.png)

ولكن انتظر لحظة! عندما تكتب شيئا في حقول `title` و `text` ومحاولة حفظه، ما الذي سيحدث؟

لا شيء! نحن مرة أخرى في نفس الصفحة و النص الخاص بنا يذهب… و لم تتم إضافة أي مشاركة جديدة. إذاً ماذا خطأ؟

الجواب: لا شيء. نحن بحاجة إلى العمل أكثر قليلاً في *view*.

## حفظ الشكل

افتح `blog/views.py` مرة أخرى في محرر التعليمات البرمجية. حاليا كل ما لدينا في العرض `post_new` هو التالي:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

عندما نسلم الشكل، يتم أخذنا إلى نفس المكان، ولكن هذه المرة لدينا بيانات أكثر في `request`، وبشكل أكثر تحديداً في `request.POST` (التسمية ليس لها علاقة بمشاركات المدونة؛ إنها تتعلق بحقيقة أننا "ننشر" البيانات). تذكر كيف في ملف HTML ، تعريفنا `<form>` لديه المتغير `method="POST"`؟ جميع الحقول من النموذج الآن في `request.POST`. You should not rename `POST` to anything else (the only other valid value for `method` is `GET`, but we have no time to explain what the difference is).

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

## التحقق من صحة النموذج

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## تحرير النموذج

Now we know how to add a new post. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

First, let's save the icon which represents the edit button. Download [pencil-fill.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/pencil-fill.svg) and save it to the location `blog/templates/blog/icons/`.

Open `blog/templates/blog/post_detail.html` in the code editor and add the following code inside `article` element:

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

## الحماية

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `div` inside `header` and the anchor element you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` element to look like this:

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

## شيء اخر: أنشر الوقت!

Let's see if all this works on PythonAnywhere. Time for another deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* وبعد ذلك، في وحدة [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it. Congrats! :)