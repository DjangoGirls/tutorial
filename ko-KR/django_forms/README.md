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

브라우저에 사이트를 다시 불러오면 `AttributeError`가 보이게 됩니다. 왜냐하면 아직 우리는 `post_new`뷰를 구현하지 않았기 때문이죠. 이제 하나 추가해봅시다.

## 새로운 뷰 게시

코드 에디터로 `blog/views.py` 파일을 열어서 `from` 아랫줄에 아래와 같은 코드를 추가합니다.

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

그리고 *view*에 추가합니다.

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

새 `Post` 폼을 추가하기 위해 `PostForm()` 함수를 호출하도록 하여 템플릿에 넘깁니다. 이따가 *view*로 다시 돌아와서 이 작업을 하겠지만, 지금 당장은 폼을 위한 템플릿을 먼저 빨리 만들어보도록 할게요.

## 템플릿

이번에는 코드 에디터로 `blog/templates/blog` 디렉토리 안에 `post_edit.html` 파일을 생성해 폼이 작동할 수 있게 만들거에요.

* 이제 폼을 나타나게 할거에요. 예를 들어 {% raw %}`{{ form.as_p }}`{% endraw %} 로 나타나게 할 수 있답니다.
* 위 코드를 HTML태그로 폼을 감싸세요. `<form method="POST">...</form>`.
* `Save` 버튼이 필요합니다. 이 것은 HTML 버튼으로 만들 수 있어요: `<button type="submit">Save</button>`.
* 그리고 마지막으로 열린 `<form ...>` 태그에 {% raw %}`{% csrf_token %}`{% endraw %}를 추가해야 해요. 이 작업은 폼 보안을 위해 중요하답니다! 만약 이걸 잊어버린다면, 장고는 당신이 폼을 저장할때 주의를 시킬 거에요.

![CSFR 서버가 허용하지 않는 웹 페이지(Forbidden page)](images/csrf2.png)

네, 이제 `post_edit.html` 파일의 HTML을 확인해볼게요:

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

그런데, 잠깐만요! `title`과 `text` 필드에 아무거나 입력하고 저장해보세요. 어떻게 됐나요?

글이 사라졌어요! 한번 더 해봐도 내가 입력한 글들은 어디론가로 사라지고는 새 글이 추가되지 않아요. 뭐가 잘못된걸까요?

정답은요: 여러분이 잘못한 게 없어요. 단지 *view*에 조금 작업이 필요할 뿐이에요.

## 폼 저장하기

코드 에디터로 `blog/views.py`를 다시 여세요. 지금 여러분이 보고 있는 `post_new` 뷰는 아래와 같을 거에요:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

우리가 폼을 제출할 때, 동일한 뷰를 불러옵니다. 이 때 `request`에는 우리가 입력했던 데이터들을 가지고 있는데, `request.POST`가 이 데이터를 가지고 있습니다. (POST는 글 데이터를 "등록하는(posting)"하는 것을 의미합니다. 블로그 "글"을 의미하는 "post"과 관련이 없어요.) HTML에서 `<form>`정의에 `method="POST"`라는 속성이 있던 것이 기억나나요? 이렇게 POST로 넘겨진 폼 필드의 값들은 이제 `request.POST`에 저장됩니다. `POST`로 된 값을 다른 걸로 바꾸면 안돼요.(`method` 속성의 값으로 넣을 수 있는 유효한 값 중에 `GET` 같은 것도 있지만 post와 어떤 차이점이 있는지 등에 대해서 다루기에는 너무 길어질 것 같아 생략할게요.)

그래서 우리의 *view*에서는 두 개의 상황을 부리해서 다뤄야해요. 첫째, 우리가 페이지에 처음 접속시 빈 폼을 원할때에요. 그리고 둘 째, *view*로 되돌아 갔을때 우리가 입력한 데이터가 폼 데이터를 포함할 때에요. 여기서 조건문을 추가시켜야해요. (`if`을 사용할게요):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

`[...]` 에 입력할 시간이에요. `method` 가 `POST` 일때 `PostForm` 을 폼에서 받은 데이터로 구성하고 싶어요, 맞죠? 아래와 같이 해보아요.

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

참 쉽죠! 다음에는 폼에 들어있는 값들이 올바른지를 확인해야합니다.(모든 필드에는 값이 있어야하고 잘못된 값이 있다면 저장하면 되지 않아야해요.) 이를 위해 `form.is_valid()`을 사용할거에요.

폼에 입력된 값이 올바른지 확인한 다음, 저장되는거죠!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

일반적으로, 이 작업을 두 단계로 나눌 수 있어요: `form.save`로 폼을 저장하는 작업과 작성자를 추가하는 작업입니다.(`PostForm`에는 `작성자(author)` 필드가 없지만, 필드 값이 필요하죠). `commit=False`란 넘겨진 데이터를 바로 `Post` 모델에 저장하지는 말라는 뜻입니다. - 왜냐하면 작성자를 추가한 다음 저장해야하니까요. 대부분의 경우에는 `commit=False`를 쓰지 않고 바로 `form.save()`를 사용해서 저장해요. 다면 여기서는 작성자 정보를 추가하고 저장해야하기 때문에 commit=False를 사용하는 거에요. `post.save()`는 변경사항(작성자 정보를 포함)을 유지할 것이고 새 블로그 글이 만들어 질거에요!

끝으로, 새 블로그 글을 작성한 다음에 `post_detail` 페이지로 바로 이동할 수 있으면 좋겠죠? 이 작업을 하려면 한 가지를 더 불러와야해요.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

위 코드를 여러분의 파일 맨 위에 추가하세요. 그리고 새로 작성한 글을 볼 수 있도록 `post_detail` 페이지로 가라고 수정합시다":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`blog.views.post_detail`은 이동해야 할 뷰의 이름이에요. *post_detail 뷰*는 `pk`변수가 필요한 거 기억하고 있겠죠? `pk=post.pk`를 사용해서 뷰에게 값을 넘겨줄 거에요. 여기서 `post`는 새로 생성한 블로그 글이에요.

잘 했어요. 너무 설명이 길어졌네요... 이제 *view*의 전체 코드를 확인할게요.

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

잘 작동하는지 확인해보세요. http://127.0.0.1:8000/post/new/ 페이지로 접속해서 `title`과 `text`를 입력하고, 저장하세요! 새로운 블로그 글이 추가되고 `post_detail` 페이지가 나타났어요!

아마 우리가 아직 게시 일자를 세팅하지 않은 것을 눈치챘을 지 모르겠군요. 이 부분은 **Django Girls 튜터리얼: 확장**의 *게시하기 버튼* 챕터에서 다룰 것입니다.

모두 잘 해냈어요!

> 앞서 우리가 사용한 장고 관리자 인터 페이스처럼 로그인 된 상태라고 생각해봅시다. 하지만 사용자가 로그아웃이 되는 상황이 발생하기도 하죠.(브라우저가 닫히거나, DB가 재시작된다던가 등) 만약 로그인 되지 않은 상태에서 새 글을 저장한다면, 사용자가 로그인 정보가 부족해 누가 글을 작성한지 알 수 없어 글을 저장할 때 오류가 발생하고, 로그인시키도록 http://127.0.0.1:8000/admin 관리자 페이지가 나타나게 될 거에요. 이 문제는 금방 해결할 수 있어요. 다만 이건 이 튜터리얼 후에 해야할 **과제(Homework): 여러분의 사이트에 보안 추가하기** 챕터로 남겨놓겠습니다.

![로그인 오류 (Logged in error)](images/post_create_error.png)

## 폼 검증하기

이제 장고 폼이 얼마나 멋진지 알아볼 차례에요. 블로그 글은 `title`과 `test` 필드가 반드시 있어야해요. 우리가 만든 `Post` 모델에서는 이 필드 값들이 필요없다고 했지만(`published_date`는 제외하고) 장고는 모두 기본 값으로 설정되어 있다고 생각합니다.

Try to save the form without `title` and `text`. Guess what will happen!

![폼 검증하기](images/form_validation2.png)

장고는 모든 필드의 값이 올바른지 검증할 수 있답니다. 정말 멋지죠?

## 폼 수정하기

지금까지 새 게시물을 추가하는 방법에 대해 배웠어요. 하지만 이미 있던 글을 수정하려면 어떻게 해야할까요? 이 것도 앞서 했던 것과 매우 비슷해요. 빨리 해보도록 합시다! (만약 여러분이 뭔가 이해하지 못하는 부분이 있다면, 여러분의 코치에게 이전 챕터의 내용에 대해서 물어보고 차례대로 하나씩 해결해 나가야합니다)

코드에디터로 `blog/templates/blog/post_detail.html`파일을 열어 아래와 같이 작성된 라인을 찾아주세요:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

이제 템플릿이 아래처럼 보일 거에요:

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

이제 코드 에디터에서 `blog/urls.py` 을 열고 아래 구문을 추가하겠습니다:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

우리는 `blog/templates/blog/post_edit.html` 템플릿을 재사용할 거에요. 마지막으로 할 일은 *view*를 만드는 것입니다.

코드 에디터로 `blog/views.py` 파일을 열어서 파일의 맨 밑에 코드를 추가해봅시다:

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

음.. 코드가 `post_new`과 거의 비슷해보이지 않나요? 하지만 완전히 같지는 않아요. 첫 번째: `url`로부터 추가로 `pk` 매개변수를 받아서 처리합니다. 두번째: `get_object_or_404(Post, pk=pk)`를 호출하여 수정하고자 하는 글의 `Post` 모델 `인스턴스(instance)`로 가져옵니다(원하는 글은 pk를 이용해 찾습니다.). 이렇게 가져온 데이터를 폼을 만들 때와(글을 수정할 때 폼에 이전에 입력했던 데이터가 있어야 하겠죠?) 폼을 저장할 때 사용하게 됩니다...

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

...그리고 폼에 아래와 같이 수정했어요

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