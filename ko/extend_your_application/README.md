# 프로그램 어플리케이션 확장하기

우리는 지금까지 웹사이트 제작에 필요한 모든 단계들을 마쳤어요. 모델, url, 뷰와 템플릿을 만드는지 알게 되었고요. 또 웹사이트를 어떻게 멋지게 꾸미는지 알게 되었어요.

이제 연습해 봅시다!

블로그에 가장 필요한 것은 페이지에 포스트가 보이게 만드는 것이겠죠?

이미 앞에서 `Post` 모델을 만들었으니 `models.py`에 추가할 내용은 없습니다.

## Post에 템플릿 링크 만들기

`blog/templates/blog/post_list.html` 파일에 링크를 추가하는 것부터 시작합시다. 아마 아래와 같을 거에요. :

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```

{% raw %}우리는 post 목록에 있는 제목에서 post의 내용 페이지로 가는 링크를 만들 거에요. `<h1><a href="">{{ post.title }}</a></h1>` 를 변경해 봅시다. post의 상세 페이지는 {% endraw %} 로 연결됩니다.

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

`{% url 'post_detail' pk=post.pk %}`에 대해 설명할 때가 왔군요! 예상하셨겠지만 `{% %}` 표기는 장고 템플릿 태그를 사용하고 있는 것을 말합니다. 이번에는 우리를 위한 URL를 만들어 사용해 봅시다!

`blog.views.post_detail`는 우리가 만들려고 하는 경로인 `post_detail` *view* 입니다. 반드시 주의하세요 : `blog`는 우리의 응용 프로그램 (디렉토리 `blog`)의 이름이에요. `views`는 `views.py` 파일의 이름에서 나온 것이에요. 마지막인 `post_detail`는 *view* 의 이름입니다.

http://127.0.0.1:8000/를 열어보세요. 오류 메세지가 나올 거에요. (예상대로, 아직 `post_detail`을 위한 *view* 파일 만들지 않아 오류가 나는 것이죠.) 아마 이렇게 나왔을 거에요. :

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

## Post 상세 페이지에 URL 만들기

`urls.py` 파일에 `post_detail` *view* 를 위한 URL를 만들어 봅시다!

첫 번째 게시물의 상세 **URL** 은 이렇게 나올 거에요. : http://127.0.0.1:8000/post/1/

`blog/urls.py`파일에 URL을 만들어, 장고가 `post_detail`이란 *view* 로 보내, 전체 블로그 글이 보일 수 있게 만들어 봅시다. `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail')` 코드를 `blog/urls.py` 파일에 추가하세요. 그러면 아래처럼 보일 거에요. :

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

`^post/(?P<pk>[0-9]+)/$` 이 부분이 무섭게 보이지만, 걱정하지 마세요. 하나씩 차근차근 설명해드릴 거에요.
 - `^`은 "시작"을 뜻합니다.
 - 첫 부분 다음부터 나오는 `post/`는 URL이 __post__ 를 포함해야한다는 것을 뜻합니다. 아직까지 할 만 하죠?
 - `(?P<pk>[0-9]+)` - 이 부분은 좀 까다롭습니다. 이 정규 표현식의 의미는 장고가 여러분이 여기에 넣은 모든 것을 `pk`변수에 넣어 뷰로 전송하겠다는 뜻입니다. `[0-9]`은 문자를 제외하고, 숫자 0부터 9까지 하나의 숫자만 있다는 뜻입니다. `+`는 하나 또는 그 이상의 숫자가 와야한다는 것을 의미합니다. 따라서 `http://127.0.0.1:8000/post//`라고 하면 post/ 다음에 숫자가 없기 때문에 해당이 안되지만, `http://127.0.0.1:8000/post/1234567890/`는 완벽하게 매칭됩니다.
 - `/` - 다음에 __/__ 가 한번 더 와야 한다는 의미입니다.
 - `$` - "마지막"! 입니다. 그 뒤로 더이상 문자가 오면 안됩니다.

브라우저에 `http://127.0.0.1:8000/post/5/`입력하면, 장고는 `post_detail`인 *view* 를 찾고 있다고 생각하고 `pk`가 `5`와 일치한 *view* 로 정보를 보내게 됩니다..

`pk`는 `primary key`의 약자입니다. 장고 프로젝트에서 자주 사용되는 이름이에요. 물론 여러분은 내가 원하는 변수 이름을 사용할 수 있어요. (기억하세요 : 변수 이름에 공백문자는 사용할 수 없으며 소문자와 `_`를 사용할 수 있습니다.) 예를 들어, `(?P<pk>[0-9]+)`의 변수를 `post_id`바꾼다면 하면 정규표현식도 `(?P<post_id>[0-9]+)`으로 바뀌게 됩니다.

좋아요, 이제 새로운 URL 패턴을 `blog/urls.py` 파일에 추가했어요! 이제 페이지를 새로고침 하세요. : http://127.0.0.1:8000/ 쾅! 또 에러가 났어요! 예상대로에요!

![AttributeError][2]

다음 단계는 무엇일까요? 그렇죠. : view를 추가해야죠!

## Post 상세 페이지에 뷰 추가하기

이제 *view* 는 추가적으로 매개 변수`pk`를 받아야합니다. *view* 에 가져다가 써야겠죠? 그래서 함수를 정의할 때, pk를 받도록 `def post_detail(request, pk):`라고 정의 할 것입니다. 기입된 urls(`pk`)에 지정한 것과 정확히 똑같은 이름을 사용해야함을 주의하세요. 변수가 생략되면 문제가 생겨 오류가 날 거에요!

이제, 우리는 딱 한 개 블로그만 보고 싶어요. 이를 위해 다음과 같이 쿼리셋(queryset)을 사용해야해요. :

```python
    Post.objects.get(pk=pk)
```

하지만 이 코드에는 문제가 있어요. `primary key` (`pk`)가있는 `Post`가 없다면 보고 싶지 않은 오류가 나올 거에요!

![DoesNotExist error][3]

우리가 원하는게 아니에요! 장고에서는 이를 해결 하기위해 특별한 기능을 제공해요. : `get_object_or_404`이에요. 이 기능을 사용하면 `pk`에 맞는 `Post`가 없을 경우, 멋진 페이지(`페이지 찾을 수 없음 404 : Page Not Found 404)`를 보여줄 거에요.

![Page not found][4]

좋은 점은 여러분 만의 `페이지 찾을 수 없음(Page not found)` 페이지를 예쁘게 만들 수 있다는 거에요. 지금 당장 중요한 것이 아니까 생략할게요.

좋아요. 이제 `views.py` 파일에 *view* 를 추가합시다!

`blog/views.py` 파일을 열어서 아래 코드를 추가하세요. :

```python
    from django.shortcuts import render, get_object_or_404
```

`from`행 근처로 가서, 파일 맨 끝에 *view* 를 추가하세요. :

```python
    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})
```

브라우저를 새로고침 해보세요. : http://127.0.0.1:8000/

![Post list view][5]

잘 되네요! 그런데 블로그 제목 안의 링크를 클릭하면 어떻게 되나요?

![TemplateDoesNotExist error][6]

이런! 또 에러가 나왔네요! 하지만 이제는 이런 걸 어떻게 다뤄야하는지 알고 있죠? 우리는 이제 템플릿을 추가해 볼 거에요!

## Post 상세 페이지에 템플릿 만들기

`blog/templates/blog` 디렉토리 안에 `post_detail.html`라는 새 파일을 생성하세요.

아마도 화면에는 이런 것들이 보이겠죠?

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endblock %}
```

다시 한 번 `base.html`을 확장해 봅시다. `content` 블록에서, 블로그 글의 published_date 출판일(존재한다면) 과 제목, 내용을 보이게 할 거에요. 그런데 제일 중요한 것을 얘기해봐야하지 않겠어요?

{% raw %}`{% if ... %} ... {% endif %}` 는 무엇인가를 확인할 때 사용하는 템플릿 태그 입니다. (`if ... else ..` 를 __파이썬 들어가기__ 장에서 본 기억이나나요?) 우리는 post의 `출판 날짜(published_date)`가 비어있는지 아닌지 확인하고 싶어요. {% endraw %}

페이지를 새로고침하면 `페이지 찾을 수 없음(Page not found)` 페이지가 없어진 것을 알 수 있어요.

![Post detail page][7]

야호! 잘 되네요!

## 한 가지만 더: 배포하세요!

PythonAnywhere에서도 웹사이트가 잘 작동하는지 봐야겠죠? 다시 한 번 배포해봅시다.

```
$ git status
$ git add --all .
$ git status
$ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
$ git push
```

* 그 다음 [PythonAnywhere Bash console][8]을 여세요:

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

* 마지막으로 [웹 탭(Web tab)][9]에서 **다시 불러오기(Reload)** 를 누르세요.

이제 배포가 완료 되었어요. 잘 작동되는지 확인해 보세요! 축하합니다. :)

 [2]: images/attribute_error2.png
 [3]: images/does_not_exist2.png
 [4]: images/404_2.png
 [5]: images/post_list2.png
 [6]: images/template_does_not_exist2.png
 [7]: images/post_detail2.png
 [8]: https://www.pythonanywhere.com/consoles/
 [9]: https://www.pythonanywhere.com/web_app_setup/
