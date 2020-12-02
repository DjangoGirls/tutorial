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

그리고 `pk=post.pk`는 어떨까요? `pk` 는 데이터베이스에서 각 레코드의 고유 식별자를 의미하는 기본키(Primary Key)의 줄임말이에요. 모든 장고 모델은 기본키 역할을 하는 필드를 가지고 있고 다른 이름이 무엇이든간에 "pk"라 할 수 있어요. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match2.png)

## Post 상세 페이지에 URL 만들기

Let's create a URL in `urls.py` for our `post_detail` *view*!

We want our first post's detail to be displayed at this **URL**: http://127.0.0.1:8000/post/1/

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

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? It's adding a view!

## Post 상세 페이지에 뷰 추가하기

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that this parameter must have the exact same name as the one we specified in `urls` (`pk`). Also note that omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But luckily Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

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

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

Enter the following code:

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ...` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://subdomain.pythonanywhere.com page to see the result.

And that should be it. Congrats! :)