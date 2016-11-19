# 템플릿 확장하기

장고의 또 다른 멋진 기능은 __템플릿 확장(template extending)__ 입니다. 무슨 뜻일까요? 바로 여러분의 웹사이트 안의 서로 다른 페이지에서 HTML의 일부를 동일하게 재사용 할 수 있다는 뜻이에요.

이 방법을 사용하면 동일한 정보/레이아웃을 사용하고자 할 때, 모든 파일마다 같은 내용을 반복해서 입력 할 필요가 없게 됩니다. 또 뭔가 수정할 부분이 생겼을 때, 각각 모든 파일을 수정할 필요 없이 딱 한번만 수정하면 된답니다!

## 기본 템플릿 생성하기

기본 템플릿은 웹사이트 내 모든 페이지에 확장되어 사용되는 가장 기본적인 템플릿입니다.

`blog/templates/blog/`에 `base.html` 파일을 만들어 봅시다:

    blog
    └───templates
        └───blog
                base.html
                post_list.html


그 다음 파일을 열어 `post_list.html`에 있는 모든 내용을 `base.html`에 아래 내용을 복사해 붙여넣습니다.

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
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

그 다음 `base.html`에서 `<body>` (`<body>`와 `</body>` 사이에 있는 모든 내용)의 모든 내용을 아래와 같이 바꿉니다:

```html
<body>
    <div class="page-header">
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
```

`{% for post in posts %}{% endfor %}` 사이에 있는 모든 내용을 바꿨습니다. :

```html
{% block content %}
{% endblock %}
```

무슨 의미일까요? 여러분이 만든 `block`은 템플릿 태그로 `base.html`을 확장한 이 블럭에 HTML을 추가할 수 있게 해줍니다. 어떻게 동작하는지 보여 드릴게요.

이제 파일을 저장을 하고, `blog/templates/blog/post_list.html` 파일을 다시 엽니다. body 태그 안에 있는 모든 내용을 지우고, `<div class="page-header"></div>`도 지웁니다. 그러면 파일은 아래처럼 될 거에요. :

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

파일 맨 윗 줄에 아래 내용을 추가합니다.

```html
    {% extends 'blog/base.html' %}
```

`post_list.html` 파일에 있는 {% raw %}는 이제 `base.html` 템플릿을 확장했음을 의미합니다. 이제 한 가지만 더 하면 되어요.: `{% block content %}`과 `{% endblock content %}` 사이에 (우리가 방금 추가한 행들을 빼고) 모든 것을 넣습니다. 아래 처럼요. :{% endraw %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock content %}
```

다 되었어요! 여러분의 웹사이트가 잘 작동하는지 확인해보세요. :)

> 만약 `TemplateDoesNotExists` 에러가 난다면 `blog/base.html` 파일이 없어 콘솔에서 `runserver`가 작동되고 있는 경우 입니다. 이런 경우, (Ctrl+C)를 눌러서 멈춘 후 `python manage.py runserver`명령어로 재시작해 주세요.
