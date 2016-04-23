# HTML 시작하기

템플릿이 무엇인지 궁금하셨죠?

템플릿이란 서로 다른 정보를 일정한 형태로 표시하기 위해 재사용 가능한 파일이예요. 예를 들면 편지를 쓸때도 템플릿을 사용할 수 있어요. 편지의 내용이나 수신인 주소는 달라져도 동일한 디자인, 레이아웃을 사용하는 경우가 있으니까요.

장고의 템플릿 양식은 HTML을 사용합니다. (HTML은 첫 번째 장 **인터넷은 어떻게 작동할까요** 에서 들어봤죠)

## HTML이란 무엇일까요?

HTML은 크롬이나 파이어폭스, 사파리같은 웹브라우저가 해석할 수 있는 간단한 코드예요. 사용자에게 웹페이지를 표시할 때 사용해요.

HTML은 "HyperText Markup Language"의 줄인 말입니다. **하이퍼텍스트(HyperText)** 는 텍스트인데 페이지간에 하이퍼링크를 담을 수 있다는 뜻이예요. **마크업(Markup)** 이란 누군가에게(여기서는 브라우저) 문서를 해석하는 방법을 표시(mark)를 했다는 뜻이에요. HTML 코드는 **태그(tag)** 들로 이루어져있어요. 태그는 `<` 로 시작하고 `>`로 끝나요. 이런 태그들은 마크업 **요소(elements)** 를 나타냅니다.

## 첫번째 템플릿!

템플릿을 만드는 것은 템플릿 파일을 만든다는 뜻이예요. 모든 것은 파일에 저장되겠죠? 이미 눈치챘을 것 같군요.

템플릿은 `blog/templates/blog` 디렉토리에 저장됩니다. 그러니까 먼저 블로그 디렉토리에 `templates` 디렉토리를 생성해야해요. 그리고, 템플릿 디렉토리에 `blog` 라는 디렉토리를 만드세요.

    blog
    └───templates
        └───blog


(왜 `blog` 디렉토리를 하나 더 만들어야하는지 궁금할 거에요. 나중에 알게 되겠지만, 작업이 좀더 복잡해질 때 편하게 만들기 위해 사용하는 관습같은 거에요.)

다음 `blog/templates/blog` 디렉토리에 `post_list.html` (비어있는) 파일을 만드세요.

웹사이트를 확인해보세요. : http://127.0.0.1:8000/

> 여전히 `TemplateDoesNotExists` 에러가 나온다면, 웹 서버를 다시 시작하세요. 커맨드라인(혹은 콘솔창)으로 가서 Ctrl + C를 눌러 웹 서버 작동을 멈춥니다. 그런 후 다시 `python manage.py runserver` 명령을 실행해 서버를 재시작합니다.

![그림 11.1][1]

 [1]: images/step1.png

이제 에러가 사라졌어요! 축하합니다. :) 하지만 웹사이트가 비어있어 아무 내용도 보여지지 않네요. 이제 고쳐나가 봅시다.

템플릿 파일 post_list.html에 아래 내용을 넣어주세요. :

```html
    <html>
        <p>Hi there!</p>
        <p>It works!</p>
    </html>
```

웹 사이트가 어떻게 보이나요? 확인해보세요. : http://127.0.0.1:8000/

![그림 11.2][2]

 [2]: images/step3.png

잘 작동하네요! 잘 했습니다. :)

*   모든 웹 페이지는 `<html>`로 시작해서 `</html>`로 끝나게 됩니다. 가장 기본적인 태그이지요. 웹사이트의 모든 내용은 시작 태그 `<html>`과 닫는 태그인`</html>` 사이에 넣어야만 합니다.
*   `<p>`는 문단 태그입니다. 문단의 끝은 `</p>`로 닫습니다.

## Head & body

각 HTML 페이지는 두 가지 요소, **head** 와 **body** 로 구분됩니다.

*   **head** 는 문서에 대한 정보를 담고 있지만 이 정보는 화면에 직접적으로 보여지 않습니다.

*   **body** 는 웹사이트에 보여지는 모든 내용을 담고 있습니다.

`<head>`는 브라우저에 페이지에 대한 설정들을 알려주고, `<body>`는 실제 페이지에 보여줄 내용을 알려줍니다.

그 예로, `<head>` 안에 웹페이지의 제목을 넣어봅시다. :

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

파일을 저장하고 페이지를 새로고침 해보세요.

![그림 11.3][3]

 [3]: images/step4.png

브라우저가 어떻게 "Ola's blog"를 웹 페이지의 제목으로 이해했을까요? 바로 브라우저가 `<title>Ola's blog</title>`를 해석해 브라우저 제목 표시줄에 내용을 반영한 것입니다. (북마크를 할 때도 이렇게 사용됩니다.)

태그는 `/`로*태그 마침*하고 *중첩(nested)* 해서 사용할 수 있습니다. (모든 태그가 닫힐 때까지 특정 태그 하나만 닫을 수 없습니다.)

이 개념은 박스에 뭔가 집어 넣는 것과 같아요. 여러분에게 `<html></html>`라고 하는 큰 박스가 있습니다. 박스 안에는 `<body></body>` 박스가 있고, 또 그 박스 안에는 `<p></p>`라는 더 작은 박스들이 있는 것이죠.

*태그 마침* 과 *중첩* 의 규칙을 잘 따라야 해요. 그렇지 않으면, 브라우저가 해석을 할 수 없어, 페이지가 원하는 모습으로 나오지 않게 됩니다.

## 맞춤형 템플릿 만들기

여러분은 이제 좀 더 재밌어질 것입니다. 여러분만의 템플릿을 만들어봅시다! 여기 몇 가지 유용한 태그들이 있습니다. :

*   `<h1>A heading</h1>` - 가장 중요한 머리말에 사용하는 태그
*   `<h2>A sub-heading</h2>` 그 다음 수준의 머리말에 사용하는 태그
*   `<h3>A sub-sub-heading</h3>` ... 그 다음 머리말.. `<h6>` 까지 계속 수준이 낮아집니다.
*   `<em>text</em>` 텍스트를 강조할 때 사용하는 태그
*   `<strong>text</strong>` 여러분의 텍스트를 강력하게 강조할 때 사용하는 태그
*   `<br />` 개행. 행을 내누기(br 태그 안에는 속성으로 아무 것도 넣을 수 없습니다.)
*   `<a href="http://djangogirls.org">link</a>` 링크 걸기
*   `<ul><li>first item</li><li>second item</li></ul>` 목록을 만듭니다. 지금 여러분이 보고 있는 목록처럼요!
*   `<div></div>` 페이지의 섹션을 정의합니다.

여기에 완전한 템플릿 예제가 있습니다. :

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
*   나머지 두 `div`는 블로그 글 출판 날짜와 클릭할 수 있는 `h2`로 된 블로그 제목을 가지고 있습니다. 두 `p`(문단)의 하나는 날짜를, 다른 하나는 블로그를 위한 거에요.

이 태그들로 이렇게 변합니다. :

![그림 11.4][4]

 [4]: images/step6.png

야호! 지금까지 만든 우리 템플릿은 계속 **같은 내용**만 보여주었죠. 그러나 앞에서 템플릿은 **같은 양식**을 사용하지만 **다른** 정보들을 보여줄 때 사용한다고 말했었죠..

장고 관리자에서 실제 추가한 글들을 보여주는 방법은 앞으로 배우게 될 거에요.

## 하나 더: 배포하기!

방금 작업했던 것이 인터넷에서도 볼 수 있으면 좋겠죠? PythonAnywhere으로도 배포해 봅시다. :

### Github에 코드를 커밋, 푸시하세요!

제일 먼저, 마지막 배포 이후 수정된 파일을 확인해 봅시다. (PythonAnywhere가 아닌 로컬에서 실행하세요.) :

    $ git status


`djangogirls` 디렉토리에서 `git`에게 현재 폴더에 있는 모든 변경 내용을 포함라고 말합니다.

    $ git add --all .


> **Note** `-A` ("all"의 축약어) 는 `git`이 삭제한 파일을 인식합니다. (기본적으로, 새로 추가하거나 변경한 파일만 인지합니다.) 또한 `.`의미가 현재 디렉토리라는 것을 기억하고 있죠? (3장에서 언급한 내용이에요.)

파일 업로드 전, `git`으로 업로드 할 파일들을 확인해봅시다. (`git`에서 업로드 할 모든 파일들이 녹색으로 나타나야 합니다.) :

    $ git status


거의 다 왔습니다. 이제 저장소에 변경 사항을 저장할 단계예요. 우리는 "커밋 메시지(commit message)"를 주어, 어떤 것이 수정 변경되었는지 알려줄 거에요. 이번에는 아무거나 적어도 괜찮습니다. 하지만 앞으로는 내가 수정한 내용을 간략하게 적어 다음에 기억할 수 있도록 하는 것이 좋을 거에요.

    $ git commit -m "Changed the HTML for the site."


> **Note** 커밋 메시지는 쌍따옴표(")로 감싸주세요.

완성되면, Github으로 업로드(푸쉬) 하세요. :

    git push


### PythonAnywhere에서 새 코드를 가져와, 웹 앱을 다시 불러옵니다.

*   [PythonAnywhere 콘솔 페이지][5]를 열고 **배시 콘솔** (또는 새로운 창)을 준비합니다. 그 다음, 명령어를 입력합니다. :

 [5]: https://www.pythonanywhere.com/consoles/

    $ cd ~/my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]


그러면 코드가 다운되는 것을 볼 수 있어요. 다 되었는지 확인하고 싶으면 **파일 탭(Files tab)**에 가서 내 코드가 PythonAnywhere에 있는지 확인합니다.

*   마지막으로 [웹 탭(Web tab)][6]으로 가서 여러분의 웹 앱을 **다시 불러오기** 하세요.

 [6]: https://www.pythonanywhere.com/web_app_setup/

인터넷에도 업데이트 되었네요! 브라우저로 가서 웹사이트를 새로고침하세요. 변경한 내용들이 보일 거에요. :)
