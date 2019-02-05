# Django URLs

We're about to build our first webpage: a homepage for your blog! But first, let's learn a little bit about Django URLs.

## URL이란 무엇인가요?

URL은 웹 주소입니다. 웹사이트를 방문할 때마다 URL을 볼 수 있으며 브라우저의 주소창에 표시됩니다. (맞아요! `127.0.0.1:8000`가 URL입니다! 그리고 `https://djangogirls.org` 또한 URL이죠.)

![URL](images/url.png)

인터넷에 있는 모든 페이지들은 자신만의 URL을 가지고 있어야 해요. This way your application knows what it should show to a user who opens that URL. In Django, we use something called `URLconf` (URL configuration). URLconf is a set of patterns that Django will try to match the requested URL to find the correct view.

## Django에서 URL은 어떻게 작동할까요?

코드 에디터에서 `mysite/urls.py`파일을 열면 아래와 같을 거에요. :

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

As you can see, Django has already put something here for us.

세 개의 따옴표들(`"""`, `'''`) 사이에 있는 줄들은 독스트링(docstring)이라 불려요. 파일의 최상단이나 클래스 혹은 메서드 위에 적어두면, 그것이 어떤 역할을 하는지 알려주는 역할을 합니다. 파이썬은 이 구문을 읽지 않아요.

The admin URL, which you visited in the previous chapter, is already here:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

This line means that for every URL that starts with `admin/`, Django will find a corresponding *view*. In this case, we're including a lot of admin URLs so it isn't all packed into this small file – it's more readable and cleaner.

## Your first Django URL!

첫 번째 URL을 만들어 봅시다! 우리는 '<http://127.0.0.1:8000/>' 이 주소를 우리 블로그의 홈페이지 주소로 쓸 것이고, 이 주소로 들어가면 글 목록이 보이게 만들어 볼 거에요.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

먼저, `blog.urls`를 가져오는 행을 추가해 봅시다. `blog.urls`를 가져오려면, `include` 함수를 이용해야 합니다. 그 함수를 이용하려면, `from django.urls` 로 시작하는 행을 수정해야 할 거에요.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory, and open it in the code editor. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

우리는 장고에서 제공되는 함수 `path`와 `blog` 애플리케이션에서 사용할 모든 `views`를 불러오고 있어요. (물론 아직 뷰를 하나도 안 만들었지만, 곧 만들거니 조금만 기다리세요!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

이제 `post_list`라는 이름의 `view`가 루트 URL에 할당되었습니다. 이러한 URL 패턴은 빈 문자열에 매칭이 되며, 장고 URL 확인자(resolver)는 전체 URL 경로에서 접두어(prefix)에 포함되는 도메인 이름(i.e. <http://127.0.0.1:8000/>)을 무시해서 받아들입니다. 따라서, 이 패턴은 장고에게 누군가 웹사이트에 'http://127.0.0.1:8000/' 주소로 들어왔을 때 `views.post_list`를 보여주라고 말할 거에요.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

콘솔에서 에러가 발생했네요. 하지만 걱정하지 마세요. 에러는 해결할 방법을 알려준답니다. : __no attribute 'post_list'__ 라는 메시지가 보일 텐데요. 이것은 장고가 찾고 사용하려고하는 *뷰*가 아직 없다는 거에요. 이 단계에서 `/admin/`로도 접속되지 않을 거에요. 앞으로 고쳐볼 테니 걱정하지 마세요. 혹시 여러분이 다른 에러 메시지를 보게 된다면, 웹서버를 껐다 켜보세요. 그러기 위해서는, 커맨드라인(혹은 콘솔)으로 가서 `Ctrl + C`를 눌러 웹 서버를 중단합니다. 다시 `python manage.py runserver`명령을 실행해 서버를 재시작합니다.

> > 장고 URL 설정에 대해 더 알고 싶다면 장고 공식 문서를 읽어보세요. :https://docs.djangoproject.com/en/2.0/topics/http/urls/