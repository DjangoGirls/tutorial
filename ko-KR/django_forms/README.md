# Django 폼

이제 한 가지만 더 하면 웹사이트가 완성되어요. 바로 블로그 글을 추가하거나 수정하는 멋진 기능을 추가하는 것이죠. 장고의 `관리자` 기능도 충분히 멋있기는 하지만, 좀 더 입맛에 맞게 바꾸고 예쁘게 꾸미기에는 좀 한계가 있습니다. `폼(양식, forms)`으로 강력한 인터페이스를 만들 수 있어요. - 우리가 상상할 수 있는 거의 모든 것을 할 수 있거든요!

장고 폼이 정말 멋진 것은 아무런 준비 없이도 양식을 만들 수 있고, `ModelForm`을 생성해 자동으로 모델에 결과물을 저장할 수 있다는 거에요.

이 기능이 지금 우리가 할 내용이에요: 폼을 하나 만들어서 `Post` 모델에 적용해봅시다.

장고의 모든 중요한 부분과 마찬가지로, 폼도 폼만의 파일을 만들어요: `forms.py`.

우리는 이 이름으로 `blog` 디렉토리 안에 파일을 만들거에요.

    blog
      └── forms.py
    

자, 코드 에디터를 열어 아래 코드를 입력해 보아요.

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

위 코드를 보면 첫 번째로 forms model을 import 해야하고 (`from django import forms`), 그 다음으로 `Post` model 도 import 해야합니다. (`from .models import Post`).

`PostForm` 은 이미 다들 예상 하셨듯이 우리가 만들 폼의 이름이에요. 그리고 장고에게 이 폼이 `ModelForm`이라는 것을 알려줘야해요. (그러면 장고가 뭔가 마술을 부릴 거에요) - `forms.ModelForm`은 ModelForm이라는 것을 알려주는 구문이에요.

자, 이제 다음으로 `class Meta`가 나오는데요, 이 구문은 이 폼을 만들기 위해서 어떤 model이 쓰여야 하는지 장고에게 알려주는 구문입니다. (`model = Post`).

마지막으로, 이 폼에 필드를 넣으면 완성되겠죠. 이번 폼에서는 `title` 과 `text` 만 보여지게 해 봅시다. - `author` 는 현재 로그인 하고 있는 사람이 될 것이고 (바로 당신이요!) 그리고 `created_date` 는 글이 등록되는 시간이 될 것입니다. (예를 들어, code 상에서요), 됐죠?

마쳤습니다! 이제 *뷰* 에서 이 폼을 사용해 템플릿에서 보여주기만 하면 되네요.

다음에는 링크, URL, 뷰 그리고 템플릿을 만들거에요.

## 폼과 페이지 링크

`blog/templates/blog/base.html` 파일을 코드 에디터로 열어봅시다. `page-header` 라는 `div` class 에 링크를 하나 추가할거에요.

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

이 새로운 뷰는 `post_new`입니다. 부트스트랩 테마에 있는 `"glyphicon glyphicon-plus"` 클래스로 더하기 기호가 보이게 됩니다.

위 구문을 추가하고 나면, 이제 HTML 파일이 아래처럼 보일거에요.

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

페이지를 저장하고 나서 http://127.0.0.1:8000 페이지를 새로고침 해보면, `NoReverseMatch`이 에러가 나타나죠?

## URL

이제 코드 에디터에서 `blog/urls.py` 을 열고 아래 구문을 추가하겠습니다:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

전체 코드는 아래와 같을 거에요.

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

## post_new view

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

새 `Post` 폼을 추가하기 위해 `PostForm()` 함수를 호출하도록 하여 템플릿에 넘깁니다. We will go back to this *view*, but for now, let's quickly create a template for the form.

## 템플릿

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* The line above needs to be wrapped with an HTML form tag: `<form method="POST">...</form>`.
* We need a `Save` button. We do that with an HTML button: `<button type="submit">Save</button>`.
* And finally, just after the opening `<form ...>` tag we need to add {% raw %}`{% csrf_token %}`{% endraw %}. 이 작업은 폼 보안을 위해 중요하답니다! If you forget about this bit, Django will complain when you try to save the form:

![CSFR 서버가 허용하지 않는 웹 페이지(Forbidden page)](images/csrf2.png)

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

다 작성했으면 화면을 다시 불러옵시다! 여러분의 폼이 이렇게 나타났나요!

![새 폼(New form)](images/new_form2.png)

But, wait a minute! When you type something in the `title` and `text` fields and try to save it, what will happen?

Nothing! We are once again on the same page and our text is gone… and no new post is added. So what went wrong?

정답은요: 여러분이 잘못한 게 없어요. 단지 *view*에 조금 작업이 필요할 뿐이에요.

## 폼 저장하기

Open `blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

When we submit the form, we are brought back to the same view, but this time we have some more data in `request`, more specifically in `request.POST` (the naming has nothing to do with a blog "post"; it's to do with the fact that we're "posting" data). Remember how in the HTML file, our `<form>` definition had the variable `method="POST"`? 이렇게 POST로 넘겨진 폼 필드의 값들은 이제 `request.POST`에 저장됩니다. `POST`로 된 값을 다른 걸로 바꾸면 안돼요.(`method` 속성의 값으로 넣을 수 있는 유효한 값 중에 `GET` 같은 것도 있지만 post와 어떤 차이점이 있는지 등에 대해서 다루기에는 너무 길어질 것 같아 생략할게요.)

So in our *view* we have two separate situations to handle: first, when we access the page for the first time and we want a blank form, and second, when we go back to the *view* with all form data we just typed. 여기서 조건문을 추가시켜야해요. (`if`을 사용할게요):

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

폼에 입력된 값이 올바른지 확인한 다음, 저장되는거죠!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

일반적으로, 이 작업을 두 단계로 나눌 수 있어요: `form.save`로 폼을 저장하는 작업과 작성자를 추가하는 작업입니다.(`PostForm`에는 `작성자(author)` 필드가 없지만, 필드 값이 필요하죠). `commit=False` means that we don't want to save the `Post` model yet – we want to add the author first. Most of the time you will use `form.save()` without `commit=False`, but in this case, we need to supply it. `post.save()` will preserve changes (adding the author) and a new blog post is created!

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

`blog.views.post_detail`은 이동해야 할 뷰의 이름이에요. *post_detail 뷰*는 `pk`변수가 필요한 거 기억하고 있겠죠? To pass it to the views, we use `pk=post.pk`, where `post` is the newly created blog post!

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

잘 작동하는지 확인해보세요. Go to the page http://127.0.0.1:8000/post/new/, add a `title` and `text`, save it… and voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

모두 잘 해냈어요!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. 이 문제는 금방 해결할 수 있어요. 다만 이건 이 튜터리얼 후에 해야할 **과제(Homework): 여러분의 사이트에 보안 추가하기** 챕터로 남겨놓겠습니다.

![로그인 오류 (Logged in error)](images/post_create_error.png)

## 폼 검증하기

이제 장고 폼이 얼마나 멋진지 알아볼 차례에요. 블로그 글은 `title`과 `test` 필드가 반드시 있어야해요. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![폼 검증하기](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## 폼 수정하기

Now we know how to add a new post. 하지만 이미 있던 글을 수정하려면 어떻게 해야할까요? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

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

우리는 `blog/templates/blog/post_edit.html` 템플릿을 재사용할 거에요. 마지막으로 할 일은 *view*를 만드는 것입니다.

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

음.. 코드가 `post_new`과 거의 비슷해보이지 않나요? 하지만 완전히 같지는 않아요. For one, we pass an extra `pk` parameter from `urls`. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

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

![수정 버튼(Edit button)](images/edit_button2.png)

수정 버튼을 누르면 우리가 쓴 블로그 글이 들어가 있는 폼을 볼 수 있을 거에요.

![폼 수정하기](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

축하합니다! 여러분의 어플리케이션이 점점 더 완벽해지고 있어요!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## 보안

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. 나에게만 보이고 다른 사람에게는 보이지 않는 버튼을 만들어볼게요.

`blog/templates/blog/base.html` 파일에서, `page-header` `div`를 찾아 아래와 같이 작성된 앵커 태그를 찾습니다:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! `<a>`태그를 아래와 같이 변경하세요:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. 이는 새 게시글을 완전히 보호해주는 것은 아니지만, 바람직한 방법입니다. 이 부분은 튜토리얼 심화에서 좀더 자세히 다룰거에요.

세부 페이지에 있는 수정 아이콘이 기억나죠? 이번에도 동일하게 다른 사람들이 게시글을 수정하지 못하게 할 거에요.

`blog/templates/blog/post_detail.html`파일을 열어 아래와 같이 작성된 라인을 찾아주세요:

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

로그인했기 때문에, 페이지 새로고침을 해도 아무것도 표시되지 않을 거에요. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## 한 가지만 더: 배포하세요!

모든 작업을 끝마쳤으면 PythonAnywhere로 배포해야죠!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* 그 다음 [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/)을 여세요:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it. Congrats! :)