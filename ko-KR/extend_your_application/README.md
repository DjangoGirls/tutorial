{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# 어플리케이션 확장하기

우리는 지금까지 웹사이트 제작에 필요한 모든 단계들을 마쳤어요. 모델, URL, 뷰와 템플릿을 만드는지 알게 되었고요. 또 웹사이트를 어떻게 멋지게 꾸미는지 알게 되었어요.

이제 연습해 봅시다!

블로그에 가장 필요한 것은 페이지에 포스트가 보이게 만드는 것이겠죠?

이미 앞에서 `Post` 모델을 만들었으니 `models.py`에 추가할 내용은 없습니다.

## Post에 템플릿 링크 만들기

`blog/templates/blog/post_list.html` 파일에 링크를 추가하는 것부터 시작합시다. 아마 아래와 같을 거에요. : 코드편집기를 열면 아래와 같이 보일거에요: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}우리는 post 목록에 있는 제목에서 post의 내용 페이지로 가는 링크를 만들 거에요. `<h2><a href="">{{ post.title }}</a></h2>` 를 변경해 봅시다. post의 상세 페이지는 {% endraw %} 로 연결됩니다.

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %} `{% url 'post_detail' pk=post.pk %}`에 대해 설명할 때가 왔군요! 예상하셨겠지만 `{% %}` 표기는 장고 템플릿 태그를 사용하고 있는 것을 말합니다. 이번에는 우리를 위한 URL를 만들어 사용해 봅시다!{% endraw %}

`post_detail` 부분은 `blog/urls.py`에서 URL을 name=post_detail 로 예측하는걸 의미해요.

그리고 `pk=post.pk`는 어떨까요? `pk` 는 데이터베이스에서 각 레코드의 고유 식별자를 의미하는 기본키(Primary Key)의 줄임말이에요. 모든 장고 모델은 기본키 역할을 하는 필드를 가지고 있고 다른 이름이 무엇이든간에 "pk"라 할 수 있어요. `Post` 모델에 기본키를 정의하지 않았기 때문에,장고는 우리를 위해 기본키를 생성해요(기본값으로 필드명이 "id" 예를들어 1, 2, 3과 같이 레코드마다 숫자가 증가하는 숫자값을 지녀요) 그리고 각 글마다 이 필드를 추가한답니다. `post.pk`와 같이 기본키에 접근할 수 있어요, 같은 방법으로 `Post`객체의 다른 필드에 접근(`title`, `author`, 기타.)할 수 있어요.

http://127.0.0.1:8000/를 열어보세요. 오류 메세지가 나올 거에요. (예상대로, 아직 `post_detail`을 위한 *view*파일 만들지 않아 오류가 나는 것이죠.) 아마 이렇게 나왔을 거에요. :

![NoReverseMatch error](images/no_reverse_match2.png)

## Post 상세 페이지에 URL 만들기

`urls.py` 파일에 `post_detail` *view*를 위한 URL를 만들어 봅시다!

첫 번째 게시물의 상세 **URL**은 이렇게 나올 거에요. : http://127.0.0.1:8000/post/1/

`blog/urls.py`파일에 URL을 만들어, 장고가 `post_detail` *뷰*로 보내, 게시글이 보일 수 있게 해봅시다. `path('post/<int:pk>/', views.post_detail, name='post_detail')`코드를 `blog/urls.py`파일에 추가하면 아래와 같이 보일 거에요.

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

여기서 `post/<int:pk/>/`는 URL 패턴을 나타내요. 하나씩 차근차근 알아볼 거에요.

- `post/`란 URL이 **post** 문자를 포함해야 한다는 것을 말합니다. 아직 할 만하죠?
- `<int:pk>`<int:pk></0>는 조금 까다롭습니다. 장고는 숫자로 나타낼 수 있는 값을 읽어들이며, 이를 뷰에 `pk`라는 변수로써 전달할 수 있다는 것을 의미합니다.
- `/`은 다음에 **/** 가 한 번 더 와야 한다는 의미입니다.

브라우저에 `http://127.0.0.1:8000/post/5/`입력하면, 장고는 `post_detail`인 *view*를 찾고 있다고 생각하고 `pk`가 `5`와 일치한 *view*로 정보를 보내게 됩니다.

좋아요, `blog/urls.py`에 새로운 URL 패턴이 추가됐네요! 페이지를 새로고침 해보세요: http://127.0.0.1:8000/ 짠! 서버 실행이 멈추었어요! 예상했던대로 콘솔에 에러가 발생했네요!

![AttributeError](images/attribute_error2.png)

다음 단계는 무엇일까요? 그렇죠. : view를 추가해야죠!

## Post 상세 페이지에 뷰 추가하기

이제 *view*는 추가적으로 매개 변수`pk`를 받아야합니다. *view*에 가져다가 써야겠죠? 그래서 함수를 정의할 때, pk를 받도록 `def post_detail(request, pk):`라고 정의 할 것입니다. 이 파라미터는 반드시 `urls` (`pk`)에 명시된 이름과 같아야 한다는걸 주의하세요. 변수가 생략되면 문제가 생겨 오류가 날 거에요!

이제, 우리는 딱 한 개 블로그만 보고 싶어요. 이를 위해 다음과 같이 쿼리셋(queryset)을 사용해야해요. :

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

하지만 이 코드에는 문제가 있어요. `primary key` (`pk`)가있는 `Post`가 없다면 보고 싶지 않은 오류가 나올 거에요!

![DoesNotExist error](images/does_not_exist2.png)

우리가 원하는게 아니에요! 장고에서는 이를 해결 하기위해 특별한 기능을 제공해요. : `get_object_or_404`이에요. 이 기능을 사용하면 `pk`에 맞는 `Post`가 없을 경우, 멋진 페이지(`페이지 찾을 수 없음 404 : Page Not Found 404)`를 보여줄 거에요.

![Page not found](images/404_2.png)

좋은 점은 여러분 만의 `페이지 찾을 수 없음(Page not found)` 페이지를 예쁘게 만들 수 있다는 거에요. 지금 당장 중요한 것이 아니까 생략할게요.

좋아요. 이제 `views.py` 파일에 *view*를 추가합시다!

`blog/urls.py`파일에서 `views.post_detail`라는 뷰를 `post_detail`이라 이름을 붙이도록 URL 법칙을 만들었어요. 이는 장고가 `post_detail`이라는 이름을 해석할 때, `blog/views.py`파일 내부의 `post_detail`이라는 뷰 함수로 이해하도록 해줍니다.

`blog/views.py`파일을 열고, `from`으로 시작하는 행에서 다음과 같이 코드를 추가해주세요:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

`blog/views.py`파일을 열고, `from`으로 시작하는 행에서 다음과 같이 코드를 추가해주세요:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

브라우저를 새로고침 해보세요. : http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

잘 되네요! 그런데 블로그 제목 안의 링크를 클릭하면 어떻게 되나요?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

이런! 또 에러가 나왔네요! 하지만 이제는 이런 걸 어떻게 다뤄야하는지 알고 있죠? 우리는 이제 템플릿을 추가해 볼 거에요!

## Post 상세 페이지에 템플릿 만들기

`blog/templates/blog` 디렉토리 안에 `post_detail.html`라는 새 파일을 생성하세요.

다음 코드를 추가하세요:

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
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

다시 한 번 `base.html`을 확장해 봅시다. `content` 블록에서, 블로그 글의 published_date 출판일(존재한다면) 과 제목, 내용을 보이게 할 거에요. 그런데 제일 중요한 것을 얘기해봐야하지 않겠어요?

{% raw %}`{% if ... %} ... {% endif %}` 는 무엇인가를 확인할 때 사용하는 템플릿 태그 입니다. ( ` If else ...` 를 **파이썬 소개** 장에서 다뤘던걸 기억하나요?) 이 시나리오 에서는 우리는 글의`published_date` 가 비어있지 않은지 확인하고 싶어요.{% endraw %}

페이지를 새로고침하면 `페이지 찾을 수 없음(Page not found)` 페이지가 없어진 것을 알 수 있어요.

![Post detail page](images/post_detail2.png)

야호! 잘 되네요!

# 배포 시간!

PythonAnywhere에서도 웹사이트가 잘 작동하는지 봐야겠죠? 다시 한 번 배포해봅시다.

{% filename %}명령줄{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

그 다음 [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/)을 여세요:

{% filename %}PythonAnywhere 명령줄{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(당신의 PythonAnywhere 서브 도메인을 `<your-pythonanywhere-domain>`에 화살괄호 없이 입력하는것을 잊지마세요)

## 서버의 정적파일을 업데이트

PythonAnywhere 와 같은 서버는 "정적 파일" (CSS와 같은 파일)을 파이썬 파일과는 다르게 다뤄요, 왜냐하면 더 빨리 불러올 수 있도록 최적화 할 수 있기 때문이에요. 결과적으로, 우리가 CSS파일을 변경했을때, 우리는 서버에서 이것을 업데이트하기 위한 추가 명령을 실행해야 해요. 이 명령은 `collectstatic`이라 불려요.

만약 활성화 하고 있지 않았다면 virtualenv를 활성화하고 실행해요 (PythonAnywhere 는`workon` 명령을 사용해요, 내 컴퓨터에서 쓰던 `source myenv/bin/activate`명령과 같아요.):

{% filename %}PythonAnywhere 명령줄{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

`manage.py collectstatic` 명령은 `manage.py migrate`와 같아요. 코드를 변경하고 장고에게 서버의 정적 파일 모음이나 데이터베이스에 이러한 변경사항을 *적용*하도록 지시할거에요.

어쨌든, 이제 콘솔 오른쪽 상단에 있는 메뉴 버튼에서 ["Web" page](https://www.pythonanywhere.com/web_app_setup/)로 이동해서 **Reload**를 누른 다음 https://subdomain.pythonanywhere.com 페이지를 확인하여 결과를 확인할 수 있어요.

이제 완료 되었어요. 축하합니다. :)