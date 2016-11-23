# HTML 시작하기

템플릿은 어떤 일을 하는지 궁금했죠?

템플릿이란 서로 다른 정보를 일정한 형태로 표시하기 위해 재사용 가능한 파일을 말해요. 예를 들면 편지에도 같은 템플릿을 사용할 수 있어요. 편지의 내용이나 수신인 주소는 달라져도 같은 디자인, 레이아웃을 사용하는 때도 있으니까요.

장고 템플릿 양식은 HTML을 사용합니다. (HTML은 첫 번째 장 [**인터넷은 어떻게 작동할까요**](http://tutorial.djangogirls.org/ko/how_the_internet_works/)에서 들어본 내용이죠)

## HTML이란 무엇일까요?

HTML은 크롬이나 파이어폭스, 사파리 같은 웹 브라우저가 해석할 수 있는 간단한 코드예요. 사용자에게 웹 페이지를 표시할 때 사용합니다.

HTML은 "HyperText Markup Language"의 줄임말로, **하이퍼텍스트(HyperText)**는 페이지 간 하이퍼링크가 포함된 텍스트라는 뜻입니다. **마크업(Markup)**이란 누군가(브라우저)가 문서를 해석하도록 표시(mark)를 했다는 뜻이에요. HTML은 **태그(tag)**들로 이루어져 있어요. 태그는 `<(여는 태그)` 로 시작하고 `>(닫는 태그)`로 끝나는데, 이는 마크업 **요소(elements)**를 말합니다.

## 첫 번째 템플릿!

템플릿은 곧 템플릿 파일을 만든다는 뜻이에요. 템플릿 파일에 모든 내용이 저장되겠죠? 이미 알고 있을 것 같아요.

템플릿은 `blog/templates/blog`디렉터리에 저장됩니다. 먼저 `blog`디렉터리 안에 하위 디렉터리인 `templates`을 생성하세요. 그리고 `template`디렉터리 내 `blog`라는 하위 디렉터리를 생성하세요.

```
blog
└───templates
 └───blog
```

(왜 `blog`디렉터리를 하나 더 만들어야하는지 궁금할 거에요. 나중에 알게 되겠지만, 수월한 작업 진행을 위해 사용하는 방법이랍니다)

다음 `blog/templates/blog`디렉터리 안에 `post_list.html`이라는 새 파일을 만드세요.

그리고 웹 사이트를 확인해보세요. http://127.0.0.1:8000/

> `TemplateDoesNotExists`에러가 보인다면, 웹 서버를 다시 시작하세요. 커맨드라인(혹은 콘솔)으로 가서 `Ctrl + C`를 눌러 웹 서버를 중단합니다. 다시 `python manage.py runserver`명령을 실행해 서버를 재시작합니다.

![그림 11.1][1]

 [1]: images/step1.png

이제 에러가 사라졌어요! 축하합니다. 하지만 웹 사이트에 아무것도 보이지 않네요. 이제 하나씩 고쳐나가 봅시다.

`post_list.html`템플릿 파일에 아래 내용을 넣어주세요.

```html
<html>
 <p>Hi there!</p>
 <p>It works!</p>
</html>
```

웹 사이트가 어떻게 보이나요? 확인해보세요. http://127.0.0.1:8000/

![그림 11.2][2]

 [2]: images/step3.png

잘 작동하네요! 잘 했습니다.

*   모든 웹 페이지는 `<html>`로 시작해 `</html>`로 마칩니다. 가장 기본적인 태그이지요. 모든 내용은 시작 태그 `<html>`과 닫는 태그인`</html>` 사이에 넣어야합니다.
*   `<p>`는 문단 태그입니다. 문단의 끝 역시 `</p>`로 닫습니다.

## Head & body

각 HTML 페이지는 두 가지 요소, **head**와 **body**로 구분됩니다.

*   **head** - 문서 정보를 가지고 있지만, 웹 페이지에서 보이지 않는 정보들을 담는 영역입니다.

*   **body** - 웹 페이지에 직접적으로 보이는 내용들이 들어갑니다. 웹 페이지의 내용은 모두 이 body태그안에 들어갑니다.

`<head>`는 브라우저에 페이지에 대한 설정들을 알려주고, `<body>`는 실제 페이지에 보여줄 내용을 알려줍니다.

`<head>`안에 웹 페이지 제목을 넣어봅시다.
```html
<html>
  <head>
    <title>Ola's blog</title>
  </head>
  <body>
    <p>Hi there!</p>
    <p>It works!</p>
  </body>
</html>
```
파일을 저장하고 페이지를 새로고침 하세요.

![그림 11.3][3]

 [3]: images/step4.png

브라우저는 어떻게 "Ola's blog"를 웹 페이지의 제목으로 이해했을까요? 바로 브라우저가 `<title>Ola's blog</title>`를 해석해 브라우저 제목 표시줄에 내용을 반영한 것입니다. (해당 페이지를 북마크를 할 때도 동일합니다)

태그는 `/`로*태그 마침*하고 여러 태그를 *중첩(nested)*해서 사용할 수 있습니다. (모든 태그를 꼭 닫아줘야합니다)

태그는 상자에 뭔가 집어넣는 것과 같아요. `<html></html>`라고 하는 큰 상자가 있다면, 상자 안에는 `<body></body>` 상자가 있고, 또 그 상자 안에는 `<p></p>`라는 더 작은 상자가 있는 것과 같아요.

*태그 마침*과 *중첩*의 규칙을 잘 따라야 해요. 그렇지 않으면, 브라우저가 해석할 수 없어 페이지가 원하는 모습으로 나오지 않게 됩니다.

## 맞춤형 템플릿 만들기

앞으로 좀 더 재밌어질 거에요. 나만의 템플릿을 만들어 볼 거에요! 아래 태그들을 짚고 넘어가세요.

*   `<h1>A heading</h1>` - 큰 제목
*   `<h2>A sub-heading</h2>` - 중 제목
*   `<h3>A sub-sub-heading</h3>` - 소 제목... `<h6>`레벨까지 사용할 수 있습니다.
*   `<em>text</em>` - 텍스트 기울기 (Italic)
*   `<strong>text</strong>` - 텍스트를 두껍게(Bold)
*   `<br />` - 줄바꿈 (br은 스스로 닫히는 태그로 속성을 사용할 수 없습니다)
*   `<a href="http://djangogirls.org">link</a>` - 하이퍼링크 걸기
*   `<ul><li>first item</li><li>second item</li></ul>`- 목록 만들기
*   `<div></div>` - 페이지 섹션

아래 템플릿 예제가 있습니다.

```html
<html>
  <head>
    <title>Django Girls blog</title>
  </head>
  <body>
    <div>
      <h1><a href="">Django Girls Blog</a></h1>
    </div>
    <div>
      <p>published: 14.06.2014, 12:14</p>
      <h2><a href="">My first post</a></h2>
      <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
    </div>
    <div>
      <p>published: 14.06.2014, 12:14</p>
      <h2><a href="">My second post</a></h2>
      <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
    </div>
  </body>
</html>
```

이 템플릿에는 세 개의 `div` 섹션이 있습니다.

*   첫 번째 `div`는 블로그 제목을 가지고 있어요. 머리말과 링크이지요.
*   나머지 두 `div`는 블로그 게시일과 `h2`로 된 블로그 제목과 링크를가 있습니다. 두 `p(문단)`의 하나는 날짜를, 다른 하나는 블로그를 가리키죠.

태그로 웹 페이지 화면이 아래와 같이 바뀝니다.

![그림 11.4][4]

 [4]: images/step6.png

야호! 이전 템플릿은 **동일한 내용*만을 보여줬어요. 이처럼 템플릿은 **같은 양식**을 사용하지만, **다른** 정보들을 보여줄 때 사용됩니다.

장고 관리자에서 추가한 글을 보여주는 방법은 곧 알아볼 거에요.

## 하나 더: 배포하기!

방금 고친 내용을 인터넷에서도 봐야겠죠? PythonAnywhere으로도 배포해 봅시다.

### Github에 코드를 커밋, 푸시하세요!

제일 먼저, 마지막 배포 이후 수정된 파일을 확인해 봅시다. (PythonAnywhere가 아닌 로컬에서 실행하세요)

```
    $ git status
```

`djangogirls` 디렉터리에서 `git`에게 현재 폴더에 있는 모든 변경 내용을 포함시키라고 말해봅시다.
```
    $ git add -A .
```

> **Note** `-A` ("all"의 축약어)는 `git`이 삭제한 파일을 인식합니다. (기본적으로, 새로 추가하거나 변경한 파일만 인식합니다) `.`가 현재 디렉터리라는 것을 기억하고 있죠? (3장에서 언급한 내용이에요)

파일 업로드 전, `git`으로 업로드 할 파일들을 확인해봅시다. (`git`에서 업로드 할 모든 파일들이 녹색으로 나타나야 합니다.)

    $ git status


거의 다 왔습니다. 이제 github 저장소에 변경 사항을 저장할 단계예요. `커밋 메시지(commit message)`를 입력해, 수정 변경된 내용을 알려줄 거에요. 메시지 내용은 아무거나 적어도 괜찮습니다. 수정한 내용을 간략히 적어 나중에 기억할 수 있도록 하는 것이 좋습니다.

    $ git commit -m "Changed the HTML for the site."


> **Note** 커밋 메시지를 쌍따옴표(")로 감싸주세요.

완성되면, github으로 업로드(푸쉬) 하세요.

    git push


### PythonAnywhere에서 새 코드를 가져와, 웹 앱을 다시 불러옵니다.

*   [PythonAnywhere 콘솔 페이지][5]를 열고 **배시 콘솔**(또는 새로운 창)에서 아래와 같이 명령어를 입력합니다.

 [5]: https://www.pythonanywhere.com/consoles/

    $ cd ~/my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]


코드가 다운되고 있죠? 다 되었는지 확인하고 싶으면 **파일 탭(Files tab)**에 가서 내 코드가 PythonAnywhere에 있는지 확인합니다.

*   마지막으로 [웹 탭(Web tab)][6]으로 가서 웹 앱을 **다시 불러오기(Reload)**를 하세요.

 [6]: https://www.pythonanywhere.com/web_app_setup/

인터넷에도 업데이트 되었어요! 브라우저를 새로고침하면 변경된 내용을 확인할 수 있어요.
