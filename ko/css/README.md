# CSS - 예쁘게 만들기

우리가 만든 블로그가 아직 예쁘지 않죠? 이제 눈에 보기 좋게 예쁘게 만들어 볼 시간이에요. CSS를 사용해 만들어 볼 거에요.

## CSS는 무엇인가요?

CSS(Cascading Style Sheets)는 HTML와 같이 마크업랭귀지(markup language)으로 쓰여진 웹사이트를 나타낼 때 사용하는 언어입니다. 우리 웹페이지 얼굴에 예쁘게 메이크업 하는 것과 같아요 ;)

아무것도 없는 상태에서 시작하기 어렵죠? 이번에도 우리는 개발자들이 만들고 인터넷 무료로 배포된 코드를 사용할 거에요. 바퀴를 다시 발명하는 것은 재미가 없잖아요.

## Bootstrap을 사용해봐요!

부트스트랩(Bootstrap)은 예쁜 웹사이트를 개발하기 위해 사용되는 가장 유명한 HTML과 CSS 프레임워크입니다: https://getbootstrap.com/

부트스트랩은 트위터 개발자들에 의해 만들어졌고 전 세계 자원봉사자들이 지속적으로 참여해 발전시키고 있어요.

## Bootstrap 설치하기

Bootstrap을 설치하려면, `.html` 파일의 `<head>` 안에 이 링크를 넣어야 합니다. (`blog/templates/blog/post_list.html`):

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

이 링크는 프로젝트에 파일을 새로 추가하는 게 아니에요. 인터넷에 있는 파일을 연결하는 거에요. 따라해보고, 웹사이트를 열어 새로고침 버튼을 눌러보세요. 짠!

![그림 14.1][1]

 [1]: images/bootstrap1.png

더 보기 좋아졌죠!

## Django 정적 파일

마지막으로 정적 파일( __static files__)을 다뤄볼 거에요. 정적 파일은 CSS과 이미지 모두를 말합니다. 동적 파일이 아니에요. 그렇기 때문에 콘텐츠 요청 내용이 필요없어 모든 유저들이 동일한 내용을 볼 수 있어요.

### 어디에 정적 파일을 넣어야 하나요

서버에서 `collectstatic`를 실행할 때 처럼, 장고는 "admin" 앱에서 정적 파일을 어디서 찾아야하는지 이미 알고 있어요. 이제 `blog`앱에 정적파일을 추가하면 됩니다.

blog 앱 안에 `static`폴더를 만드세요. :

    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite


장고는 app폴더 안에 있는 "static" 폴더를 자동으로 찾아 안에 있는 내용을 불러낼 거에요.

## 나의 첫 번째 CSS 파일!

CSS파일을 만들어 나만의 스타일을 가진 웹페이지를 만들어봐요. `static`디렉토리 안에 `css`라고 새로운 디렉토리를 만드세요. 그리고 `css`디렉토리 안에 `blog.css`라는 파일을 만드세요. 준비되셨나요?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css


CSS를 쓸 차례에요! 여러분이 사용하고 있는 코드에디터에서 `blog/static/css/blog.css`파일을 불러오세요.

CSS는 꽤 쉽고 워크샵 후에도 스스로 배울 수 있기 때문에 이번에는 CSS에 대해 심도 있게 살펴보지는 않을 거에요. 우리는 여러분이 더 예쁜 웹사이트를 만들 수 있도록 [Codeacademy HTML & CSS course][2]를 실습해보길 추천해요.

 [2]: https://www.codecademy.com/tracks/web

하지만 조금이라도 해보자구요. 제목 색깔을 바꿔볼까요? 컴퓨터는 특별한 코드를 사용해 색깔을 나타내요. `#`으로 시작해 알파벳(A-F)와 숫자(0-9) 중 6개를 조합해 나타내요. 이 곳에서 색깔 코드를 찾을 수 있어요: http://www.colorpicker.com/ 또는 [미리 정의 된 색][3], 예를 들어 `빨간색` 또는 `녹색` 등도 사용할 수 있습니다.

 [3]: http://www.w3schools.com/colors/colors_names.asp

`blog/static/css/blog.css`에 아래의 코드를 추가하세요.

```css
h1 a {
    color: #FCA205;
}
```

`h1 a`가 CSS 셀렉터(Selector)에요. 즉, 우리는 `h1`요소 안에 어떠한 `a`요소를 넣어 스타일을 적용 할 수 있다는 거죠. (예를 들어 코드가 다음과 같을 때: `<h1><a href="">link</a></h1>`) 이 경우에, 우리는 색을 `#FCA205`, 즉 오렌지색으로 바꾸라고 말한 거에요. 물론, 색을 직접 선택할 수도 있어요!

CSS파일에서는 HTML 파일에 있는 각 요소들에 스타일을 적용할 수 있어요. 각 요소는 요소 이름(다시 말하면, `a`, `h1`, `body`), `class`상속 아니면 `id`상속에 의해 식별돼요. Class와 id는 여러분들이 붙인 이름을 갖게 되지요. 클래스는 요소들의 그룹을 결정하는 것이고, id는 특정 요소들을 지칭해요. 예를 들어, 다음 태그들은 CSS에서 태그 이름 `a`, 클래스 `external_link`, id `link_to_wiki_page`을 사용해서 식별해요.

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

W3Schools에서 [CSS Selectors][4]에 대해 읽어보세요..

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

이제 CSS의 내용을 HTML에 적용시킬 차례에요. `blog/templates/blog/post_list.html`파일을 열고 가장 위에 이 라인을 추가하세요:

```html
{% load staticfiles %}
```

정적 파일이 실행되고 있답니다. :)

다음, `<head>`와 `</head>` 사이에, 부트스트랩 CSS파일 링크 다음(브라우저는 순서대로 파일을 읽기 때문에 부트스트랩 파일에 있는 코드를 무시할 수 있어요.) 다음 코드를 추가하세요.

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

이제까지 CSS파일이 있는 템플릿에 대해 알아 보았어요.

여러분이 만든 파일은 아래와 같아야해요.

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

![그림 14.2][5]

 [5]: images/color2.png

잘했어요! 웹사이트 왼쪽 여백을 좀더 주고 싶지 않나요? 한 번 해봐요!

```css
    body {
        padding-left: 15px;
    }
```

이 코드를 CSS에 붙여넣고, 파일을 저장하고 어떻게 바뀌었는지 확인해봐요!

![그림 14.3][6]

 [6]: images/margin2.png

제목의 폰트를 바꾸고 싶나요? `blog/templates/blog/post_list.html`파일 안에 `<head>`에 아래 코드를 붙여넣기 해보세요.

```html
    <link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

이 코드 라인은 구글 폰트 (https://www.google.com/fonts) 에서 *Lobster* 폰트를 불러온 거에요.

이제 CSS에 `font-family: 'Lobster';`를 추가하세요 ; `blog/static/css/blog.css`파일 안에 `h1 a` 안에 있는 블록 (다음 표기가 된 부분 안에 `{` and `}`) 에 추가하고 새로고침을 누르세요. :

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![그림 14.3][7]

 [7]: images/font.png

잘했어요!

앞서 말했듯이, CSS는 클래스 개념을 가지고 있어요. 클래스는 기본적으로 여러분이 HTML의 코드 일부에 이름을 붙이고 그 부분만 특정 스타일을 적용할 수 있게 해줍니다. 두 개의 div가 있는데 각각 다르게 사용되서(예를 들어 하나는 제목에 있고 하나는 글 본문에 있는 경우), 서로 다르게 보여야 할 경우에 매우 유용해요.

이제 HTML 코드의 일부에 이름을 붙여 봅시다. header에 포함된 `div`에 `page-header`라고 class 이름을 붙여봅시다. 다음과 같이 말이죠. :

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

그리고 이제 블로그 글 안에 있는 `div`에 `post`라고 class 이름을 붙이세요.

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

다음 각 다른 선택자(selector) 에 정의를 붙여 볼 거에요. 클래스를 나타내는 선택자는 `.`으로 시작합니다. 아래 있는 코드의 이해를 돕기 위해 인터넷에서 CSS에 대한 튜토리얼이나 설명을 참고하면 많은 도움이 될 거에요. 이제 `blog/static/css/blog.css`파일 안에 아래 코드를 복사, 붙여넣기 하세요. :

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
    float: right;
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

클래스 선언이 있는 post가 있는 곳으로 가세요. 이 부분을 바꿀 거에요. :

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

```html
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
```

파일을 저장하고 웹사이트를 새로고침하세요.

![그림 14.4][8]

 [8]: images/final.png

와! 멋지지 않나요? 지금까지 붙여넣기한 코드는 이해하기 어렵지 않으니 무슨 뜻인지 이해 할 수 있을 거에요.

아직 CSS를 다루는 것이 서툴다고 걱정하지 말고 여러분이 바꾸고 싶은 부분을 고쳐보세요. 만약 문제가 생겼다면, 걱정하지말아요. 언제든지 되돌리기를 할 수 있으니까요!

워크샵 사전 숙제로 CSS로 더 예쁜 웹사이트를 만들기 위해서[Codeacademy HTML & CSS course][2]를 수강해보길 추천해요.

다음 장을 읽을 준비가 됐나요?! :)
