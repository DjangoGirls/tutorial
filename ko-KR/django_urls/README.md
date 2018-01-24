# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## URL이란 무엇인가요?

URL은 단순히 웹 주소랍니다. You can see a URL every time you visit a website – it is visible in your browser's address bar. (Yes! `127.0.0.1:8000`가 바로 URL이에요! And `https://djangogirls.org` is also a URL.)

![URL](images/url.png)

인터넷에 있는 모든 페이지들은 자신만의 URL을 가지고 있어야 해요. This way your application knows what it should show to a user who opens that URL. 장고는 `URLconf` (URL configuration)를 사용합니다. URLconf is a set of patterns that Django will try to match with the requested URL to find the correct view.

## Django에서 URL은 어떻게 작동할까요?

코드 에디터에서 `mysite/urls.py`파일을 열면 아래와 같을 거에요. :

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

Lines between triple quotes (`'''` or `"""`) are called docstrings – you can write them at the top of a file, class or method to describe what it does. 파이썬은 이 구문을 읽지 않아요.

The admin URL, which you visited in previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## 정규표현식(Regex)

장고가 URL을 뷰에 매칭시키는 방법이 궁금하죠? 이 부분은 조금 까다로울 수 있어요. 장고는 `regex`를 사용하는데, "정규표현식(regular expressions)"의 줄임말입니다. 정규식은 정말 (아주!) 많은 검색 패턴의 규칙을 가지고 있어요. 정규식은 심화 내용이기 때문에, 자세한 내용은 다루지 않을 거에요.

If you still wish to understand how we created the patterns, here is an example of the process – we will only need a limited subset of the rules to express the pattern we are looking for, namely:

* `^` for the beginning of the text
* `$` for the end of the text
* `\d` for a digit
* `+` to indicate that the previous item should be repeated at least once
* `()` to capture part of the pattern

Anything else in the URL definition will be taken literally.

Now imagine you have a website with the address like `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

뷰마다 모든 글 번호을 작성하는 것은 정말 힘든 일이 될 거에요. With regular expressions, we can create a pattern that will match the URL and extract the number for us: `^post/(\d+)/$`. Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)**는 숫자(한 개 또는 여러개) 가 있다는 뜻입니다. 내가 뽑아내고자 글 번호가 되겠지요.
* **/**는 장고에게 `/`뒤에 문자가 있음을 말해 줍니다.
* **$**는 URL의 끝이 방금 전에 있던 `/`로 끝나야 매칭될 수 있다는 것을 나타냅니다.

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

이제 `mysite/urls.py` 파일은 아래처럼 보일 거에요.

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

지금 장고는 'http://127.0.0.1:8000/'로 들어오는 모든 접속 요청을 `blog.urls`로 전송하고 추가 명령을 찾을 거에요.

Writing regular expressions in Python is always done with `r` in front of the string. 이는 파이썬에게는 별 의미가 없지만, 파이썬에게 문자열에 특수 문자가 있다는 것을 알려줍니다.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

그 다음, 첫 번째 URL 패턴을 추가하세요.

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. 틀린 것이 아니에요. 왜냐하면 장고 URL 확인자(resolver)는 'http://127.0.0.1:8000/' 는 URL의 일부가 아니기 때문입니다. 이 패턴은 장고에게 누군가 웹사이트에 'http://127.0.0.1:8000/' 주소로 들어왔을 때`views.post_list`를 보여주라고 말할 거에요.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. 이 부분은 뷰의 이름과 같을 수도 완전히 다를 수도 있습니다. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

지금 http://127.0.0.1:8000를 접속해도, 'web page not available(웹 페이지를 사용할 수 없습니다')라는 메세지가 보일 겁니다. 더 이상 서버(`runserver`라고 입력했어요)가 실행되지 않기 때문이에요. 서버 콘솔 윈도우를 보고 왜 그런지 이유를 찾아보세요.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. Django *뷰*가 계속해서 찾고 있지만, 우리는 아직 만들지 않았으니까요. At this stage your `/admin/` will also not work. No worries – we will get there.

> 장고 URL 설정에 대해 더 알고 싶다면 공식 문서를 읽어보세요. : https://docs.djangoproject.com/en/1.11/topics/http/urls/