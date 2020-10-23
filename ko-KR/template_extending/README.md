# 템플릿 확장하기

장고의 또 다른 멋진 점은 **템플릿 확장(template extending)**입니다. 무슨 뜻일까요? 바로 여러분의 웹사이트 안의 서로 다른 페이지에서 HTML의 일부를 동일하게 재사용 할 수 있다는 뜻이에요.

템플릿은 여러 곳에 동일한 정보/레이아웃을 사용하게 만들어 줍니다. 모든 파일에 동일한 내용을 반복해서 작성할 필요가 없게 되지요. 만약 어떤 부분을 변경하고 싶다면, 모든 템플릿을 수정하지 않아도 되어요. 딱 한번만 수정하면 끝난답니다!

## 기본 템플릿 생성하기

기본 템플릿은 웹사이트 내 모든 페이지에 확장되어 사용되는 가장 기본적인 템플릿입니다.

`blog/templates/blog/`에 `base.html` 파일을 만들어 봅시다:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

그 다음 코드 에디터에서 파일을 열어 `post_list.html`에 있는 모든 내용을 `base.html`에 아래 내용을 복사해 붙여넣습니다.

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
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

{% raw %}`{% for post in posts %}` 부터`{% endfor %}` 까지 모든 내용을 바꿨어요. {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

왜 그럴까요? `block`을 만들었기 때문이죠! `{% block %}`템플릿 태그는 HTML이 삽입될 수 있는 영역을 만들어줍니다. (`base.html`)템플릿이 확장되어 HTML이 다른 템플릿에도 들어갈 수 있게 됩니다. 그럼 어떻게 동작하는지 알아볼게요.

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}`{% for post in posts %}`부터 `{% endfor %}`까지 모든 내용을 지우세요. When you're done, the file will look like this:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

모든 콘텐츠 블록마다 이 템플릿을 사용할 거에요. 이제 파일에 블록 태그를 추가할 차례입니다!

{% raw %}`base.html`파일 내 태그와 블록 태그가 일치하게 만들어야 합니다. 콘텐츠 블록에 속한 모든 코드가 포함되어야 하고요. 이를 위해, `{% block content %}`와 `{% endblock %}`사이에 모든 코드를 작성하면 됩니다. 아래 처럼요. :{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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

한가지가 남았습니다. 템플릿 두 개를 서로 연결해야합니다. 그래서 템플릿을 확장한다는 거죠! 파일의 첫 부분에 태그를 추가하면 됩니다. 이렇게요:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

다 되었어요! 여러분의 웹사이트가 잘 작동하는지 확인해보세요. :)

> 만약 `TemplateDoesNotExists(템플릿파일이 존재하지 않습니다)`라는 에러 메세지가 난다면 `blog/base.html`파일이 없이 콘솔에서 `runserver`가 작동되고 있는 경우입니다. 이런 경우, (Ctrl+C)를 눌러서 멈춘 후 `python manage.py runserver`명령어로 다시 서버를 실행하세요.