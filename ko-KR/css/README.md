# CSS – make it pretty!

우리가 만든 블로그가 아직 예쁘지 않죠? 이제 눈에 보기 좋게 예쁘게 만들어 볼 시간이에요. CSS를 사용해 만들어볼 거에요.

## CSS는 무엇인가요?

Cascading Style Sheets (CSS) is a language used for describing the look and formatting of a website written in a markup language (like HTML). Treat it as make-up for our web page. ;)

But we don't want to start from scratch again, right? Once more, we'll use something that programmers released on the Internet for free. Reinventing the wheel is no fun, you know.

## Bootstrap을 사용해봐요!

Bootstrap is one of the most popular HTML and CSS frameworks for developing beautiful websites: https://getbootstrap.com/

부트스트랩은 트위터 개발자들에 의해 만들어졌고 전 세계 자원봉사자들이 지속적으로 참여해 발전시키고 있어요.

## Bootstrap 설치하기

To install Bootstrap, you need to add this to your `<head>` in your `.html` file:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. Just go ahead, open your website and refresh the page. Here it is!

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
    │   └── templates
    └── mysite
    

Django will automatically find any folders called "static" inside any of your apps' folders. Then it will be able to use their contents as static files.

## 나의 첫 번째 CSS 파일!

Let's create a CSS file now, to add your own style to your web page. `static` 디렉토리 안에 `css`라고 새로운 디렉토리를 만드세요. 그리고 `css`디렉토리 안에 `blog.css`라는 파일을 만드세요. 준비되셨나요?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

CSS를 쓸 차례에요! 여러분이 사용하고 있는 코드에디터에서 `blog/static/css/blog.css`파일을 불러오세요.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

하지만 조금이라도 해보자구요. 제목 색깔을 바꿔볼까요? 컴퓨터는 특별한 코드를 사용해 색깔을 나타내요. These codes start with `#` followed by 6 letters (A–F) and numbers (0–9). 예를 들어, 파란색 코드는 `#0000FF`입니다. 더 많은 색상 코드는 다음 링크에서 찾을 수 있어요: http://www.colorpicker.com/ You may also use [predefined colors](http://www.w3schools.com/colors/colors_names.asp), such as `red` and `green`.

`blog/static/css/blog.css`에 아래의 코드를 추가하세요.

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a`가 CSS 셀렉터(Selector)에요. `h1`대신 `a`스타일을 적용하라는 뜻입니다. So when we have something like `<h1><a href="">link</a></h1>`, the `h1 a` style will apply. 예를 들어, 오랜지 색상은 `#FCA205`입니다. 물론, 색상을 직접 선택할 수도 있어요!

CSS파일에서는 HTML 파일에 있는 각 요소들에 스타일을 적용할 수 있어요. 요소를 식별하는 첫 번째 방법은 이름을 붙이는 겁니다. HTML에서 태그 이름으로 찾을 수 있겠죠. `a`, `h1`, `body`요소도 그 예입니다. 상속 `class` 또는 상속 `id`로 요소를 식별합니다. Class와 id는 여러분들이 붙인 이름을 갖게 되지요. 클래스는 요소들의 그룹을 결정하는 것이고, id는 특정 요소들을 지칭해요. 예를 들어, 다음 태그들은 css에서 태그 이름 `a`, 클래스 `external_link`, id `link_to_wiki_page`을 사용해서 식별해요.

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

브라우저는 순서대로 차례차례 파일을 읽기 때문에, 올바른 곳에 배치해야해요. Otherwise the code in our file may be overriden by code in Bootstrap files. 이제까지 CSS파일이 있는 템플릿에 대해 알아보았어요.

여러분이 만든 파일은 아래와 같아야해요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
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
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

자, 이제 파일을 저장하고 새로고침을 해보세요!

![그림 14.2](images/color2.png)

잘했어요! 웹사이트 왼쪽 여백을 좀더 주고 싶지 않나요? 한번 해봐요!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Add that to your CSS, save the file and see how it works!

![그림 14.3](images/margin2.png)

제목의 폰트를 바꾸고 싶나요? `blog/templates/blog/post_list.html`파일 안에 `<head>`에 아래 코드를 붙여넣기 해보세요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

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
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

다음 각 다른 선택자(selector) 에 정의를 붙여볼거에요. 클래스를 나타내는 선택자는 `.`으로 시작합니다. There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. 이제 `blog/static/css/blog.css`파일안에 아래 코드를 복사, 붙여넣기 하세요:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #ff9400;
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

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

자, 다음은 글을 보여주는 HTML 코드를 post라는 클래스 이름이 적힌 div로 감싸세요. 그러면 다음과 같을 거에요.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
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
                    <h1><a href="">{{ post.title }}</a></h1>
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

CSS를 고치는 것을 두려워하지 말고, 편하게 고치고 싶은 것을 수정해보세요. 이것저것 고쳐보면서 CSS와 놀아보면 금방 이해할 수 있게 된답니다. If you break something, don't worry – you can always undo it!

[Codeacademy HTML & CSS 강좌](https://www.codecademy.com/tracks/web)를 수강하는 것을 강력히 추천합니다. CSS로 근사한 웹 사이트를 만들 수 있는 모든 방법을 배울 수 있답니다.

다음 장을 읽을 준비됐나요?! :)