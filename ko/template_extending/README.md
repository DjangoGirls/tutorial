# 템플릿 확장하기

장고의 또 다른 멋진 기능은 __템플릿 확장(template extending)__ 입니다. 무슨 뜻일까요? 바로 여러분의 웹사이트 안의 서로 다른 페이지에서 HTML의 일부를 동일하게 재사용 할 수 있다는 뜻이에요.

이 방법을 사용하면 동일한 정보/레이아웃을 사용하고자 할 때, 모든 파일마다 같은 내용을 반복해서 입력 할 필요가 없게 됩니다. 또 뭔가 수정할 부분이 생겼을 때, 각각 모든 파일을 수정할 필요 없이 딱 한번만 수정하면 된답니다!

## 기본 템플릿 생성하기

기본 템플릿은 웹사이트 내 모든 페이지에 확장되어 사용되는 가장 기본적인 템플릿입니다.

`blog/templates/blog/`에 `base.html` 파일을 만들어 봅시다. :

    blog
    └───templates
        └───blog
                base.html
                post_list.html


그 다음 파일을 열어 `post_list.html`에 있는 모든 내용을 `base.html`에 아래 내용을 복사해 붙여넣습니다.

{% filename %}blog/templates/blog/base.html{% endfilename %}
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

그 다음 `base.html`에서 `<body>` (`<body>`와 `</body>` 사이에 있는 모든 내용)의 모든 내용을 아래와 같이 바꿉니다. :

{% filename %}blog/templates/blog/base.html{% endfilename %}
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

{% raw %}`{% for post in posts %}{% endfor %}` 사이에 있는 모든 내용을 바꿨습니다.: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}
```html
{% block content %}
{% endblock %}
```

이 코드는 무엇을 의미일까요? 우리는 `block`을 만든 거에요! 템플릿 태그 `{% block %}`으로 HTML 내에 들어갈 수 있는 공간을 만들었어요. `base.html`을 확장해 다른 템플릿에도 가져다 쓸 수 있게 한 거죠. 어떻게 동작하는지 보여 드릴게요.

이제 `base.html`을 파일을 저장을 하고, `blog/templates/blog/post_list.html` 파일을 다시 엽니다. 
{% raw %}`{% for post in posts %}`부터 `{% endfor %}`까지만 남기고 나머지는 전부  지우세요. 그럼 아래와 같이 될 겁니다. :{% endraw %}


{% filename %}blog/templates/blog/post_list.html{% endfilename %}
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

우리는 이 코드를 모든 컨텐츠 블록에 대한 템플릿의 일부로 거에요.
이 파일에 블록 태그를 추가해봅시다!

{% raw %}블록 태그가 `base.html`파일의 태그와 일치해야겠죠. 또 콘텐츠 블록에 속한 모든 코드를 포함하게 만들어야 할 거에요. 이를 위해서 `{% block content %}`와 `{% endblock %}`사이에 모든 코드를 넣으세요. 이렇게 말이죠. : {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
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
{% endblock %}
```

한 가지만 남았습니다. 이 두 템플릿을 연결해야해요. 지금까지 실습한 내용이 바로 확장 템플릿의 전부입니다! 확장 태그를 파일 맨 처음에 추가합니다. 아래와 같이요. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
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
{% endblock %}
```

다 되었어요! 여러분의 웹사이트가 잘 작동하는지 확인해보세요.)

> 만약 `TemplateDoesNotExists(템플릿파일이 존재하지 않습니다)`라는 에러 메세지가 난다면 `blog/base.html`파일이 없이 콘솔에서 `runserver`가 작동되고 있는 경우입니다. 이런 경우, (Ctrl+C)를 눌러서 멈춘 후 `python manage.py runserver`명령어로 다시 서버를 실행하세요.
