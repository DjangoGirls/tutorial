# 프로그램 애플리케이션 확장하기

지금까지 웹 사이트 제작 단계를 모두 마쳤어요. 모델, url, 뷰와 템플릿을 만드는 방법을 알게 되었고요. 웹 사이트를 예쁘게 꾸미는 방법도 알게 되었어요.

이제 또 실습해봅시다!

블로그 게시글이 각 페이지마다 보이게 만들어 봅시다.

이미 앞에서 `Post`모델을 만들었으니 `models.py`에 새로 추가할 내용은 없어요.

## Post에 템플릿 링크 만들기

`blog/templates/blog/post_list.html`파일에 링크를 추가하는 것부터 시작합시다. 아래와 같이 보일 거에요.

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

`post`제목 목록이 보이고 해당 링크를 클릭하면, `post`상세 페이지로 이동하게 만들어 볼 거에요. `<h1><a href="">{{ post.title }}</a></h1>`부분을 수정해 봅시다.

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

`{% url 'post_detail' pk=post.pk %}`을 설명할 때가 왔군요! `{% %}`는 장고 템플릿 태그을 말합니다. URL를 생성해 사용해봅시다.

`blog.views.post_detail`는 `post_detail` *뷰* 경로입니다. `blog`는 응용프로그램(디렉터리 `blog`)의 이름인 것을 꼭 기억하세요. `views`는 `views.py`파일명이에요. 마지막 부분 `post_detail`는 *view* 이름입니다.

http://127.0.0.1:8000/를 열어보세요. 오류 메세지가 나올 거에요. (아직 `post_detail` *뷰*를 만들지 않아 오류가 나는 거에요) 이런 화면이 보일 거에요.

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

## Post 상세 페이지 URL 만들기

`post_detail`*뷰*가 보이게 `urls.py`에 URL를 만들어 봅시다!

첫 게시물의 상세 페이지 **URL**이 http://127.0.0.1:8000/post/1/가 되게 만들 거에요.

`blog/urls.py`파일에 URL을 만들어, 장고가 `post_detail` *뷰*로 보내, 게시글이 보일 수 있게 해봅시다. `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail')`코드를 `blog/urls.py`파일에 추가하면 아래와 같을 보일 거에요.

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
  url(r'^$', views.post_list, name='post_list'),
  url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```

`^post/(?P<pk>[0-9]+)/$`부분이 복잡하게 보이지만, 걱정하지 마세요. 하나씩 차근차근 알아봅시다.
 - `^`은 "시작"을 뜻합니다.
 - `post/`란 URL이 **post** 문자를 포함해야 한다는 것을 말합니다. 아직 할 만하죠?
 - `(?P<pk>[0-9]+)`는 조금 까다롭습니다. 이 정규표현식은 장고가 `pk`변수에 모든 값을 넣어 뷰로 전송하겠다는 뜻입니다. `[0-9]`은 문자를 제외한 숫자 0부터 9 중, 한 가지 숫자만 올 수 있다는 것을 말합니다. `+`는 하나 또는 그 이상의 숫자가 올 수 있습니다.. 따라서 `http://127.0.0.1:8000/post/`라고 하면 post/ 다음에 숫자가 없으므로 해당 사항이 아니지만, `http://127.0.0.1:8000/post/1234567890/`는 완벽하게 매칭됩니다.
 - `/`은 다음에 **/** 가 한 번 더 와야 한다는 의미입니다.
 - `$`는 "마지막"을 말합니다. 그 뒤로 더는 문자가 오면 안 됩니다.

브라우저에 `http://127.0.0.1:8000/post/5/`라고 입력하면, 장고는 `post_detail` *뷰*를 찾아 매개변수 `pk`가 `5`인 값을 찾아 *뷰*로 전달합니다.

`pk`는 `primary key`의 약자로, 장고에서 많이 사용되는 변수명입니다. 변수명은 내가 원하는 것으로 변경할 수 있어요. (변수명에 공백문자는 사용할 수 없으며 소문자와 `_`를 사용할 수 있음을 주의하세요) 예를 들어, `(?P<pk>[0-9]+)`변수를 `post_id`으로 바꾸면, 정규표현식도 `(?P<post_id>[0-9]+)`으로 바뀌게 됩니다.

좋아요, 새로운 URL 패턴을 `blog/urls.py`에 추가했어요! 페이지를 새로고침 하세요. http://127.0.0.1:8000/ 쾅! 또 에러가 났어요! 예상했던 대로에요!

![AttributeError][2]

다음 단계는 무엇일까요? 그렇죠. 뷰를 추가해야죠!

## Post 상세 페이지 내 뷰 추가하기

*뷰*에 매개변수 `pk`를 추가해봅시다. *뷰*가 `pk`를 식별해야겠죠? 그래서 함수를 `def post_detail(request, pk):`라고 정의합니다. urls(`pk`)과 동일하게 이름을 사용해야 합니다. 변수가 생략되면 오류가 날 거예요!

블로그 게시글 한 개만 보려면, 아래와 같이 쿼리셋(queryset)을 작성해야해요.

```python
    Post.objects.get(pk=pk)
```

하지만 이 코드에는 문제가 있어요. 만약 해당 `primary key(pk)`의 `Post`를 찾지 못하면 오류가 나올 거에요!

![DoesNotExist error][3]

우리가 원하는게 아니죠! 장고에는 이를 해결하기 위해 `get_object_or_404`라는 특별한 기능을 제공해요. `pk`에 해당하는 `Post`가 없을 경우, 멋진 페이지(`페이지 찾을 수 없음 404 : Page Not Found 404)`를 보여줄 거에요.

![Page not found][4]

나중에 `페이지 찾을 수 없음(Page not found)`페이지를 예쁘게 만들 수 있어요. 지금 당장 중요한 것이 아니니 이 부분은 생략할게요.

좋아요. 이제 `views.py`파일에 새로운 *뷰*를 추가합시다!

`blog/views.py`파일을 열고 아래 코드를 추가하세요.

```python
from django.shortcuts import render, get_object_or_404
```

`from`행 가서, 파일 마지막 부분에 *뷰*를 추가하세요.
```python
  def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

브라우저를 새로고침 하세요. http://127.0.0.1:8000/

![Post list view][5]

잘 작동하네요! 그런데 블로그 제목 링크를 클릭하면 어떻게 되나요?

![TemplateDoesNotExist error][6]

이런! 또 에러가 나왔네요! 하지만 이제 어떻게 해야하는지 알고 있죠? 드디어 템플릿을 추가할 차례에요!

## Post 상세 페이지 템플릿 만들기

`blog/templates/blog` 디렉터리 안에 `post_detail.html`라는 새 파일을 생성하고 아래와 같이 코드를 작성하세요.

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

다시 한 번 `base.html`을 확장한 거에요. `content`블록에서 블로그 글의 게시일, 제목과 내용을 보이게 만들었어요.

가장 중요한 부분은 `{% if ... %} ... {% endif %}`라는 템플릿 태그인데, 내용이 있는지 확인할 때 사용합니다. (`if ... else ..`구문을 [**파이썬 들어가기**](http://tutorial.djangogirls.org/en/python_introduction/) 장에서 봤었죠?) `post`의 `게시일(published_date)`이 있는지, 없는지를 확인하는 거에요.

페이지를 새로고침하면 `페이지 찾을 수 없음(Page not found)` 페이지가 없어졌어요.

![Post detail page][7]

야호! 잘 되네요!

## 한 가지만 더 합시다. 배포하세요!

PythonAnywhere에도 웹사이트가 잘 작동하는지 봐야겠죠? 다시 한 번 배포합시다.

```
$ git status
$ git add -A .
$ git status
$ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
$ git push
```

* 그 다음 [PythonAnywhere Bash console][8]을 여세요.

```
$ cd my-first-blog
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```

* 마지막으로 [Web tab(웹 텝)][9]에서 **Reload(다시 불러오기)**를 누르세요.

배포를 마쳤습니다. 잘 작동되는지 확인해 보세요! 축하합니다.

 [2]: images/attribute_error2.png
 [3]: images/does_not_exist2.png
 [4]: images/404_2.png
 [5]: images/post_list2.png
 [6]: images/template_does_not_exist2.png
 [7]: images/post_detail2.png
 [8]: https://www.pythonanywhere.com/consoles/
 [9]: https://www.pythonanywhere.com/web_app_setup/
