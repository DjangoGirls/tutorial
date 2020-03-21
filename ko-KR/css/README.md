# CSS - 예쁘게 만들기

우리가 만든 블로그가 아직 예쁘지 않죠? 이제 눈에 보기 좋게 예쁘게 만들어 볼 시간이에요. CSS를 사용해 만들어볼 거에요.

## CSS는 무엇인가요?

CSS(Cascading Style Sheets)는 웹사이트의 보여지는 부분 나타낼 때 사용하는 HTML와 같은 마크업 언어에요. 우리 웹페이지를 예쁘게 메이크업 하는 것과 같아요. ;)

하지만, 처음부터 다시 시작하고 싶지는 않죠? 한 번 더, 인터넷에서 다른 개발자가 만든 무료로 배포된 코드를 사용할 거에요. (자동차를 만들기 위해) 바퀴를 다시 발명하는 건 재미있지 않죠.

## Bootstrap을 사용해봐요!

부트스트랩(Bootstrap)은 예쁜 웹사이트를 개발하기 위해 사용되는 유명한 HTML과 CSS 프레임워크 중 하나에요: https://getbootstrap.com/

부트스트랩은 트위터 개발자들에 의해 만들어졌고 전 세계 자원봉사자들이 지속적으로 참여해 발전시키고 있어요.

## Bootstrap 설치하기

Bootstrap을 설치하려면 코드 편집기에서 `.html ` 파일을 열고 이 파일을 `<head>` 섹션에 추가하십시오.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

당신의 프로젝트에 어떤 파일도 추가하지 않는다. 인터넷에 존재하는 파일만 가리키고 있다. 그러니 웹사이트를 열고 페이지를 새로 고치세요. 여기있다!

![그림 14.1](images/bootstrap1.png)

더 보기 좋아졌죠!

## Django의 정적 파일

마지막으로 **정적 파일(static files)**을 다뤄볼 거에요. 모든 CSS와 이미지들은 정적 파일(static file) 이에요. Css와 정적파일은 모든 유저들이 동일하게 보여지기 때문에 콘텐츠와 상관없어요.

### 어디에 정적 파일을 넣어야 하나요

서버에서 `collectstatic`를 실행할 때 처럼, 장고는 "admin" 앱에서 동적 파일을 어디서 찾아야하는지 이미 알고 있어요. 이제 `blog`앱에 동적파일을 추가하면 되어요.

blog앱 안에 `static`폴더를 만드세요:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django는 app폴더 안에 있는 "static" 폴더를 자동으로 찾아 안에 있는 내용을 불러내요. 그러면 컨텐츠를 정적 파일로 사용할 수 있어요.

## 나의 첫 번째 CSS 파일!

CSS파일을 만들어 나만의 스타일을 가진 웹페이지를 만들어 봐요. `static` 디렉토리 안에 `css`라고 새로운 디렉토리를 만드세요. 그리고 `css`디렉토리 안에 `blog.css`라는 파일을 만드세요. 준비되셨나요?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

CSS를 쓸 차례에요! 여러분이 사용하고 있는 코드에디터에서 `blog/static/css/blog.css`파일을 불러오세요.

우리는 여기서 CSS에 대해 깊게 배우거나 다루지않을 거에요. 만약 더 많이 배우고 싶다면, 페이지 마지막 부분에 무료 CSS 코스에 대한 추천을 참고하세요.

하지만 조금이라도 해보자구요. 제목 색깔을 바꿔볼까요? 컴퓨터는 특별한 코드를 사용해 색깔을 나타내요. `#`으로 시작해 알파벳(A-F) 와 숫자(0-9) 중 6개를 조합해 나타내요(16진수로 말이에요). 예를 들어, 파란색 코드는 `#0000FF`입니다. 더 많은 색상 코드는 다음 링크에서 찾을 수 있어요: http://www.colorpicker.com/ 그리고 [미리 정의 된 색](http://www.w3schools.com/colors/colors_names.asp), 예를 들어 `빨간색` 또는 `녹색` 등도 사용할 수 있어요.

`blog/static/css/blog.css`에 아래의 코드를 추가하세요.

{% filename %}blog/templates/blog/post_blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a`가 CSS 셀렉터(Selector)에요. 이건 `h1` 안에있는 어떤 `a` 요소에도 스타일을 적용한다는 뜻입니다; `h2` 셀렉터도 `h2`요소에 같은 작용을 한답니다. 예를 들어 `<h1><a href="">link</a></h1>`은 `h1 a` {...} 을 통해 스타일이 적용됩니다. 위의 예시에서, 다크 오렌지인 `#FCA205`으로 색상을 바꾸라 명한 겁니다. 아니면 여기에 색상을 입히셔도 되지만, 하얀 배경에 대비가 잘 되도록 주의하세요!

CSS파일에서는 HTML 파일에 있는 각 요소들에 스타일을 적용할 수 있어요. 요소를 식별하는 첫 번째 방법은 이름을 붙이는 겁니다. HTML에서 태그 이름으로 찾을 수 있겠죠. `a`, `h1`, `body`요소도 그 예입니다. 상속 `class` 또는 상속 `id`로 요소를 식별합니다. Class와 id는 여러분들이 붙인 이름을 갖게 되지요. 클래스는 요소들의 그룹을 결정하는 것이고, id는 특정 요소들을 지칭해요. 예를 들어, 다음 태그들은 css에서 태그 이름 `a`, 클래스 `external_link`, id `link_to_wiki_page`을 사용해서 식별해요.

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

W3Schools에서 [CSS Selectors](http://www.w3schools.com/cssref/css_selectors.asp)에 대해 더 읽을 수 있어요.

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file in the code editor and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

드디어 정적파일을 실행시켰어요 :) `<head>`와 `</head>`사이에, 아래 코드를 추가해 부트스트랩 CSS 파일과 연결시키세요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

브라우저는 순서대로 차례차례 파일을 읽기 때문에, 올바른 곳에 배치해야해요. 그렇지 않으면, 파일의 부트스트랩 코드를 재정의해야 할 수도 있어요. 이제까지 CSS파일이 있는 템플릿에 대해 알아보았어요.

여러분이 만든 파일은 아래와 같아야해요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>published: {{ post.published_date }}</p>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

자, 이제 파일을 저장하고 새로고침을 해보세요!

![그림 14.2](images/color2.png)

잘했어요! 웹사이트 왼쪽 여백을 좀더 주고 싶지 않나요? 한번 해봐요!

{% filename %}blog/templates/blog/post_blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

이 코드를 CSS에 붙여넣고, 파일을 저장하고 어떻게 바뀌었는지 확인해봐요!

![그림 14.3](images/margin2.png)

제목의 폰트를 바꾸고 싶나요? `blog/templates/blog/post_list.html`파일 안에 `<head>`에 아래 코드를 붙여넣기 해보세요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

이전과 마찬가지로, `blog/static/css/blog.css`를 연결 하기 전에 위치와 명령을 확인하세요. 이제 구글 폰트(https://www.google.com/fonts)에서 *랍스터* 라는 폰트를 가져오는 작업을 진행할 거에요.

우선 `blog/static/css/blog.css`파일 내에서 `h1 a` 블록( h1 a {...} 사이의 코드)을 찾아보세요. 그리고 괄호 사이에 `font-family: 'Lobster';<0>을 추가하고 페이지 새로고침을 해보세요:</p>

<p>{% filename %}blog/templates/blog/post_blog.css{% endfilename %}</p>

<pre><code class="css">h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
`</pre> 

![그림 14.3](images/font.png)

잘했어요!

위에서 언급했듯이, CSS는 클래스 개념을 가지고 있습니다. HTML 코드 내 이름을 지정해 다른 부분에 영향을 주지 않고 특정 부분에만 스타일을 적용할 수 있습니다. 정말 멋지죠! 두 div를 사용해 제목과 게시글이 다르게 보이게 만들 수도 있어요. 이처럼 클래스는 겉모습을 다르게 바꿔줍니다.

이제 HTML 코드의 일부에 이름을 붙여봅시다. header에 포함된 `div`에 `page-header`라고 class 이름을 붙여봅시다. 다음과 같이 말이죠:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

그리고 이제 블로그 글 안에 있는 `div`에 `post`라고 class 이름을 붙여보세요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

다음 각 다른 선택자(selector) 에 정의를 붙여볼거에요. 클래스를 나타내는 선택자는 `.`으로 시작합니다. 아래의 코드(클래스 선택자) 를 이해하기 위해서 CSS에 대한 튜토리얼이나 설명을 참고하면 큰 도움이 될 거에요. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/templates/blog/post_blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

자, 다음은 글을 보여주는 HTML 코드를 post라는 클래스 이름이 적힌 div로 감싸세요. 그러면 다음과 같을 거에요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

`blog/templates/blog/post_list.html` 안에 아래 코드를 넣으세요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

파일을 저장하고 웹사이트를 새로고침하세요.

![그림 14.4](images/final.png)

와! 멋지지 않나요? 붙여넣기한 HTML 클래스와 CSS 코드를 보세요. 초록색으로 날짜를 바꾸려면 어느 곳을 고쳐야할까요?

CSS를 고치는 것을 두려워하지 말고, 편하게 고치고 싶은 것을 수정해보세요. 이것저것 고쳐보면서 CSS와 놀아보면 금방 이해할 수 있게 된답니다. 만약 무엇인가 깨져보이면, 걱정하지마세요 - 항상 되돌릴 수 있어요!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

다음 장을 읽을 준비됐나요?! :)