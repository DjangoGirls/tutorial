# Django 폼

이제 한 가지만 더 하면 웹사이트가 완성되어요. 바로 블로그 글을 추가하거나 수정하는 멋진 기능을 추가하는 것이죠. 장고의 `관리자` 기능도 충분히 멋있기는 하지만, 좀 더 입맛에 맞게 바꾸고 예쁘게 꾸미기에는 좀 한계가 있습니다. `폼(양식, forms)`으로 강력한 인터페이스를 만들 수 있어요. - 우리가 상상할 수 있는 거의 모든 것을 할 수 있거든요!

장고 폼이 정말 멋진 것은 아무런 준비 없이도 양식을 만들 수 있고, `ModelForm`을 생성해 자동으로 모델에 결과물을 저장할 수 있다는 거에요.

이 기능이 지금 우리가 할 내용이에요: 폼을 하나 만들어서 `Post` 모델에 적용해봅시다.

장고의 모든 중요한 부분과 마찬가지로, 폼도 폼만의 파일을 만들어요: `forms.py`.

우리는 이 이름으로 `blog` 디렉토리 안에 파일을 만들 거에요.

    blog
      └── forms.py


좋아요, 이제 이 파일을 열고 아래 코드를 작성해봐요. :

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

다음에는 링크, URL, 뷰 그리고 템플릿을 만들 거에요.

## 폼과 페이지 링크

`blog/templates/blog/base.html` 파일을 열어봅시다. `page-header` 라는 `div` class 에 링크를 하나 추가할거에요.

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

이 새로운 뷰를 `post_new` 라고 부를게요.

위 구문을 추가하고 나면, 이제 html 파일이 아래처럼 보일 거에요.

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

페이지를 저장하고 나서 http://127.0.0.1:8000 페이지를 새로고침 해보면, `NoReverseMatch`이 에러가 나타나죠?

## URL

이제 `blog/urls.py` 을 열고 아래 구문을 추가하겠습니다:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```

전체 코드는 아래와 같을 거에요.

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

브라우저에 사이트를 다시 불러오면 `AttributeError`가 보이게 됩니다. 왜냐하면 아직 우리는 `post_new`뷰를 구현하지 않았기 때문이죠. 이제 하나 추가해봅시다.

## post_new view

`blog/views.py` 파일을 열어서 `from` 줄에 아래와 같은 코드를 추가합니다.

```python
from .forms import PostForm
```

그리고 *view* 에 추가합니다.

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

새 `Post` 폼을 추가하기 위해 `PostForm()` 함수를 호출하도록 하여 템플릿에 넘깁니다. 이따가 *view* 로 다시 돌아와서 이 작업을 하겠지만, 지금 당장은 폼을 위한 템플릿을 먼저 빨리 만들어보도록 할게요.

## 템플릿

이번에는 `blog/templates/blog` 디렉토리 안에 `post_edit.html` 파일을 생성해 폼이 작동할 수 있게 만들거에요.

- 먼저 폼이 보여져야합니다. 그 예로, `{% raw %}{{ form.as_p }}{% endraw %}`로 간단히 만들 수 있어요..
- 위 코드를 HTML태그로 폼을 감싸세요. `<form method="POST">...</form>`
- `Save` 버튼이 필요합니다. 이 것은 HTML 버튼으로 만들 수 있어요: `<button type="submit">Save</button>`
-  마지막으로 `<form ...>`을 열어 `{% raw %}{% csrf_token %}{% endraw %}`를 추가하세요. 이 작업은 폼 보안을 위해 중요하답니다! 이 작업을 빼먹고 저장하면 장고는 이렇게 불평할 거에요.

![CSFR 서버가 허용하지 않는 웹 페이지(Forbidden page)][1]

 [1]: images/csrf2.png

네, 이제 `post_edit.html` 파일의 HTML을 확인해볼게요:

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

다 작성했으면 화면을 다시 불러옵시다! 여러분의 폼이 이렇게 나타났나요!

![새 폼(New form)][2]

 [2]: images/new_form2.png

그런데, 잠깐만요! `title`과 `text` 필드에 아무거나 입력하고 저장해보세요. 어떻게 됐나요?

글이 사라졌어요! 한번 더 해봐도 내가 입력한 글들은 어디론가로 사라지고는 새 글이 추가되지 않아요. 뭐가 잘못된 걸까요?

정답은요: 여러분이 잘못한 게 없어요. 단지 *view* 에 조금 작업이 필요할 뿐이에요.

## 폼 저장하기

`blog/views.py` 다시 여세요. 지금 여러분이 보고 있는 `post_new` 뷰는 아래와 같을 거에요:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

폼을 제출할 때, 동일한 뷰를 불러오게 됩니다. 이 때 `request`에는 우리가 입력했던 데이터들을 가지고 있는데, `request.POST`가 이 데이터를 가지고 있습니다. (POST는 글 데이터를 "등록하는(posting)"하는 것을 의미합니다. 블로그 "글"을 의미하는 "post"과 관련이 없어요.) HTML에서 `<form>`정의에 `method="POST"`라는 속성이 있던 것이 기억나나요? 이렇게 POST로 넘겨진 폼 필드의 값들은 이제 `request.POST`에 저장됩니다. `POST`로 된 값을 다른 걸로 바꾸면 안돼요.(`method` 속성의 값으로 넣을 수 있는 유효한 값 중에 `GET` 같은 것도 있지만 post와 어떤 차이점이 있는지 등에 대해서 다루기에는 너무 길어질 것 같아 생략할게요.)

이제 *view* 에서 두 상황으로 나누어 처리해볼게요.
첫 번째: 처음 페이지에 접속했을 때입니다. 당연히 우리가 새 글을 쓸 수 있게 폼이 비어있어야겠죠.
두번째: 폼에 입력된 데이터를 *view* 페이지로 가지고 올 때입니다. 여기서 조건문을 추가시켜야해요. (`if`을 사용하세요.)

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

이제 생략된 `[...]`부분에 코드를 추가해봅시다. 만약 `method`가 `POST`라면, 폼에서 받은 데이터를 `PostForm`으로 넘겨줘야겠죠? 이렇게 작성하면 됩니다. :

```python
form = PostForm(request.POST)
```

참 쉽죠! 다음에는 폼에 들어있는 값들이 올바른지를 확인해야합니다.(모든 필드에는 값이 있어야하고 잘못된 값이 있다면 저장하면 되지 않아야해요.) 이를 위해 `form.is_valid()`을 사용할거에요.

폼에 입력된 값이 올바른지 확인한 다음, 저장되는거죠!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

일반적으로, 이 작업을 두 단계로 나눌 수 있어요. : `form.save`로 폼을 저장하는 작업과 작성자를 추가하는 작업입니다.(`PostForm`에는 `작성자(author)` 필드가 없지만, 필드 값이 필요하죠!) `commit=False`란 넘겨진 데이터를 바로 `Post` 모델에 저장하지는 말라는 뜻입니다. - 왜냐하면 작성자를 추가한 다음 저장해야하니까요. 대부분의 경우에는 `commit=False`를 쓰지 않고 바로 `form.save()`를 사용해서 저장해요. 다면 여기서는 작성자 정보를 추가하고 저장해야하기 때문에 commit=False를 사용하는 거에요. `post.save()`는 변경사항(작성자 정보를 포함)을 유지할 것이고 새 블로그 글이 만들어질 거에요!

끝으로, 새 블로그 글을 작성한 다음에 `post_detail` 페이지로 이동할 수 있으면 좋겠죠? 이 작업을 하려면 한 가지를 더 불러와야해요.

```python
from django.shortcuts import redirect
```

위 코드를 여러분의 파일 맨 위에 추가하세요. 그리고 새로 작성한 글을 볼 수 있도록 `post_detail` 페이지로 가라고 수정합시다.

    python
    return redirect('blog.views.post_detail', pk=post.pk)


`blog.views.post_detail`은 우리가 이동해야 할 뷰의 이름이에요 *post_detail 뷰* 는 `pk`변수가 필요한 거 기억하고 있겠죠? `pk=post.pk`를 사용해서 뷰에게 값을 넘겨줄 거에요. 여기서 `post`는 새로 생성한 블로그 글이에요.

잘 했어요. 너무 설명이 길어졌네요. 이제 *view* 의 전체 코드를 확인할게요.

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

잘 작동하는지 확인해보세요. http://127.0.0.1:8000/post/new/ 페이지로 접속해서 `title`과 `text`를 입력하고, 저장하세요... 그리고.. 짜잔!!! 새로운 블로그 글이 추가되고 `post_detail` 페이지가 나타났어요!

블로그 글을 저장하기 전에 출판일을 설정하고 싶나요. __장고 걸스 튜토리얼 심화 : (Django Girls Tutorial: Extensions)__ 에서 _publish button_ 에 대해 확인할 수 있어요.

모두 잘 해냈어요!

## 폼 검증하기

이제 장고 폼이 얼마나 멋진지 알아볼 차례에요. 블로그 글은 `title`과 `test` 필드가 반드시 있어야해요. 우리가 만든 `Post` 모델에서는 이 필드 값들이 필요없다고 했지만(`published_date`는 제외하고) 장고는 모두 기본 값으로 설정되어 있다고 생각합니다.

`title`와 `text`가 없이 폼을 저장해보세요. 어떻게 될지 생각해보세요!

![폼 검증하기][3]

 [3]: images/form_validation2.png

장고는 모든 필드의 값이 올바른지 검증할 수 있답니다. 정말 멋지죠?

> 앞서 우리가 사용한 장고 관리자 인터 페이스처럼 로그인 된 상태라고 생각해봅시다. 하지만 사용자가 로그아웃이 되는 상황이 발생하기도 하죠.(브라우저가 닫히거나, DB가 재시작된다던가 등) 만약 로그인 되지 않은 상태에서 새 글을 저장한다면, 사용자가 로그인되어있지 않아 누가 글을 작성한지 알 수 없어요. 때문에 글을 저장할 때 오류가 발생하고, 로그인시키도록 http://127.0.0.1:8000/admin 관리자 페이지가 나타나게 될 거에요. 이 문제는 금방 해결할 수 있어요. 다만 이건 이 튜터리얼 후에 해야할 __과제(Homework): 여러분의 사이트에 보안 추가하기__ 챕터로 남겨놓겠습니다.

![로그인 오류 (Logged in error)][4]

 [4]: images/post_create_error.png

## 폼 수정하기

지금까지 새 폼을 추가하는 방법에 대해 배웠어요. 하지만 이미 있던 글을 수정하려면 어떻게 해야할까요? 이 것도 앞서 했던 것과 매우 비슷해요. 빨리 해보도록 합시다!(만약 여러분이 뭔가 이해하지 못하는 부분이 있다면, 여러분의 코치에게 이전 챕터의 내용에 대해서 물어보고 차례대로 하나씩 해결해 나가야합니다)

`blog/templates/blog/post_detail.html` 파일을 열어 아래 내용을 추가하세요:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

이제 템플릿이 아래처럼 보일 거에요. :

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

`blog/urls.py`에 아래 코드를 추가합니다.

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

우리는 `blog/templates/blog/post_edit.html` 템플릿을 재사용할 거에요. 마지막으로 할 일은 *view* 를 만드는 것입니다.

`blog/views.py` 파일을 열어서 파일의 맨 밑에 코드를 추가해봅시다. :

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
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

음.. 코드가 `post_new`과 거의 비슷해보이지 않나요? 하지만 완전히 같지는 않아요.
첫 번째: url로부터 추가로 `pk` 매개변수를 받아서 처리합니다.
두 번째: `get_object_or_404(Post, pk=pk)`를 호출하여 수정하고자 하는 글의 `Post` 모델 `인스턴스(instance)`로 가져옵니다. (원하는 글은 pk를 이용해 찾습니다.) 이렇게 가져온 데이터를 폼을 만들 때와(글을 수정할 때 폼에 이전에 입력했던 데이터가 있어야 하겠죠?) 폼을 저장할 때 사용하게 됩니다. :

```python
form = PostForm(request.POST, instance=post)
```

그리고 폼에 아래와 같이 수정했어요:

```python
form = PostForm(instance=post)
```

잘했어요. 이제 잘 작동하는지 확인해보세요! `post_detail` 페이지로 가보세요. 거기에 우측 상단에 수정 버튼이 있어야 합니다.

![수정 버튼(Edit button)][5]

 [5]: images/edit_button2.png

수정 버튼을 누르면 우리가 쓴 블로그 글이 들어가 있는 폼을 볼 수 있을 거에요.

![폼 수정하기][6]

 [6]: images/edit_form2.png

자유롭게 제목과 텍스트를 수정하고 저장해보세요!

축하합니다! 여러분의 어플리케이션이 점점 더 완벽해지고 있어요!

장고 폼에 대해 자세한 정보가 필요하다면 공식 문서를 읽어보세요. : https://docs.djangoproject.com/en/1.8/topics/forms/

## 보안

링크를 클릭해 새로운 포스트가 나오게 만드는 것은 멋져요! 지금은 웹사이트를 방문하는 누구든지 글을 쓸 수 있지만, 그렇게 하고 싶지 않을 수 있어요. 나에게만 보이고 다른 사람에게는 보이지 않는 버튼을 만들어 볼게요.

`blog/templates/blog/base.html` 파일에서, `page-header` `div`를 찾아 그 위에 아래와 같이 입력합니다. :

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

여기에 `{% if %}` 태그를 추가해 관리자로 로그인한 유저들만 링크가 보일 수 있게 만들 거에요. 그게, 바로 여러분이죠! `<a>`태그를 아래와 같이 변경하세요. :

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

이 `{% if %}`는 브라우저에 페이지를 요청 하는 사용자가 로그인 하는 경우 링크가 발생됩니다. 이는 새 게시글을 완전히 보호해주는 것은 아니지만, 바람직한 방법입니다. 이 부분은 튜토리얼 심화에서 좀더 자세히 다룰거에요.

로그인 후, 페이지를 새로고침해야하는 경우, 아무것도 변화가 없으면 안되겠죠. 새로운 브라우저 시크릿 창에서 로그인해도 링크가 보이지 않아요!

## 한 가지만 더: 배포하세요!

모든 작업을 끝마쳤으면 PythonAnywhere로 배포해야죠!

* 제일 먼저, 여러분의 코드를 커밋하고 Github로 푸시합니다.

```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added views to create/edit blog post inside the site."
$ git push
```

* 그 다음 [PythonAnywhere Bash console(배시 콘솔)][7]을 여세요. :

 [7]: https://www.pythonanywhere.com/consoles/

 ```
 $ cd my-first-blog
 $ source myvenv/bin/activate
 (myvenv)$ git pull
 [...]
 (myvenv)$ python manage.py collectstatic
 [...]
 ```

* 마지막으로 [웹 탭(Web tab)][8]에서 **다시 불러오기(Reload)** 를 누르세요.

 [8]: https://www.pythonanywhere.com/web_app_setup/

이제 배포가 완료 되었어요. 잘 작동되는지 확인하세요! 축하합니다. :)
