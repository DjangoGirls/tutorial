# 장고 urls

첫 웹 페이지를 만들어 봅시다. 블로그 홈페이지요! 먼저 장고 url에 대해서 조금 배워보기로 합시다.

## URL이란 무엇인가요?

URL은 웹 주소랍니다. 웹 사이트를 방문할 때마다 브라우저의 주소창에 URL을 볼 수 있죠. 맞아요! `127.0.0.1:8000`이 바로 URL이에요. `https://djangogirls.org/`도 URL이랍니다.

![Url](images/url.png)

인터넷의 모든 페이지는 고유한 URL을 가지고 있어야 해요. 애플리케이션은 사용자가 URL을 입력하면 어떤 내용을 보여줘야 하는지 알고 있어요. 장고는 `URLconf (URL configuration)`를 사용합니다. `URLconf`는 장고에서 URL과 일치하는 뷰를 찾기 위한 패턴들의 집합입니다.

## 장고 URL은 어떻게 작동할까요?

코드 에디터에서 `mysite/urls.py`파일을 열면 아래 내용이 보일 거에요.

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

장고가 이미 어떤 내용을 넣어 두었네요.

세 개의 따옴표들(`"""`, `'''`) 사이에 있는 줄들은 독스트링(docstring)입니다. 독스트링은 파일 제일 첫 부분, 클래스 또는 메서드 윗 부분에 작성해, 이들이 어떤 일을 수행하는지 알려줍니다. 파이썬은 이 부분을 실행하지 않을 거에요.

이전 장에서 봤던 관리자 URL도 여기에 이미 있어요.

{% filename %}mysite/urls.py{% endfilename %}
```python
    path('admin/', admin.site.urls),
```

장고는 `admin/`로 시작하는 모든 URL을  *view*와 대조해 찾아냅니다. 무수히 많은 URL이 `admin URL`에 포함될 수 있어 일일이 모두 쓸 수 없답니다. 그래서 정규표현식을 사용합니다.

## 나의 첫 번째 Django url!

첫 번째 URL을 만들어 봅시다! 'http://127.0.0.1:8000/' 주소를 블로그 홈 페이지로 지정하고 여기에 글 목록을 보여줄 거에요.

또한 `mysite/urls.py`파일을 깨끗한 상태로 유지하기 위해, `blog` 애플리케이션에서 메인 `mysite/urls.py`파일로 url들을 가져올 거에요.

먼저 `blog.urls`를 가져오는 행을 추가해 봅시다. `blog.urls`를 가져오려면, `include` 함수가 필요합니다. `from django.urls ` 행을 찾아 `import` 뒤에 `include` 함수를 추가하세요.

이제 `mysite/urls.py` 파일은 아래처럼 보일 거에요.

{% filename %}mysite/urls.py{% endfilename %}
```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

지금 장고는 http://127.0.0.1:8000/ 로 들어오는 모든 접속 요청을 `blog.urls`로 전송해 추가 명령을 찾을 거예요.

## blog.urls

`blog/urls.py`이라는 새 파일을 생성하세요. 좋아요! 이제 아래 두 줄을 추가하세요.

{% filename %}blog/urls.py{% endfilename %}
```python
from django.urls import path
from . import views
```

여기서 장고 함수인 `path`와 `blog` 애플리케이션에서 사용할 모든 `views`를 가져왔어요. (물론 아직 뷰를 만들기 전이지만 일 분 내로 만들거에요!)

그 다음, 첫 번째 URL 패턴을 추가하세요.

{% filename %}blog/urls.py{% endfilename %}
```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

이제 `post_list`라는 `view`가 루트 URL에 할당되었습니다. 이 URL 패턴은 빈 문자열에 매칭이 되며, 장고 URL 확인자(resolver)는 전체 URL 경로에서 접두어(prefix)에 포함되는 도메인 이름(i.e. http://127.0.0.1:8000/)을 무시하고 받아들입니다. 이 패턴은 장고에게 누군가 웹사이트에 'http://127.0.0.1:8000/' 주소로 들어왔을 때 `views.post_list`를 보여주라고 말해줍니다.

마지막 부분인 `name='post_list'`는 URL에 이름을 붙인 것으로 뷰를 식별합니다. 뷰의 이름과 같을 수도 완전히 다를 수도 있습니다. 이름을 붙인 URL은 프로젝트의 후반에 사용할 거예요. 그러니 앱의 각 URL마다 이름 짓는 것은 중요합니다. URL에 고유한 이름을 붙여, 외우고 부르기 쉽게 만들어야 해요.

http://127.0.0.1:8000/ 접속했는데 '웹 페이지를 사용할 수 없음(web page not available)'이라는 메시지가 표시되었나요?. 이는 서버(`runserver`라고 입력하는 것을 기억 하는가?)가 실행되지 않았기 때문이에요. 에러가 발생한 이유를 찾으려면 서버 콘솔 창을 보세요.
![Error](images/error1.png)

콘솔에서 에러가 발생했네요. 하지만 걱정하지 마세요. 에러는 해결할 방법을 알려준답니다. : **no attribute 'post_list'** 라는 메시지가 보일거에요. 이 메시지는 장고가 찾고 사용하고자 하는 _뷰_가 아직 없다는 거에요. 이 단계에서 `/admin/`도 접속되지 않을 거에요. 앞으로 고쳐볼 테니 걱정하지 마세요. 혹시 여러분이 다른 에러 메시지를 보게 된다면, 웹 서버를 껐다 다시 켜보세요. 커맨드라인(혹은 콘솔)으로 가서 `Ctrl + C`를 눌러 웹 서버를 중단하면 됩니다. 다시 `python manage.py runserver` 명령어를 실행해 서버를 다시 시작하세요.

> 장고 URL 설정에 대해 더 알고 싶다면 장고 공식 문서를 읽어보세요. :
https://docs.djangoproject.com/en/2.0/topics/http/urls/
