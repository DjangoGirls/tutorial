# HTML 시작하기

템플릿이 무엇인지 궁금하셨죠?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## HTML이란 무엇일까요?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML은 "HyperText Markup Language"의 줄인 말입니다. **하이퍼텍스트(HyperText)** 는 텍스트인데 페이지간에 하이퍼링크를 담을 수 있다는 뜻이예요. **마크업(Markup)**이란 누군가에게(여기서는 브라우저) 문서를 해석하는 방법을 표시(mark)를 했다는 뜻이에요. HTML 코드는 **태그(tag)**들로 이루어져있어요. 태그는 `<` 로 시작하고 `>`로 끝나요. 이런 태그들은 마크업 **요소(elements)**를 나타냅니다.

## 첫번째 템플릿!

템플릿을 만드는 것은 템플릿 파일을 만든다는 뜻이예요. 모든 것은 파일에 저장되겠죠? 이미 눈치챘을 것 같군요.

템플릿은 `blog/templates/blog` 디렉토리에 저장됩니다. 그러니까 먼저 블로그 디렉토리에 `templates` 디렉토리를 생성해야해요. 그리고, 템플릿 디렉토리에 `blog` 라는 디렉토리를 만드세요.

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

다음 `blog/templates/blog` 디렉토리에 `post_list.html` (비어있는) 파일을 만드세요.

웹사이트를 확인해보세요. : http://127.0.0.1:8000/

> 여전히 `TemplateDoesNotExists`에러가 나온다면, 웹 서버를 다시 시작하세요. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![그림 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![그림 11.2](images/step3.png)

It worked. Nice work there! :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. 웹사이트의 모든 내용은 시작 태그 `<html>`과 닫는 태그인`</html>` 사이에 넣어야만 합니다.
* `<p>`는 문단 태그입니다. 문단의 끝은 `</p>`로 닫습니다.

## Head and body

각 HTML 페이지는 두 가지 요소, **head**와 **body**로 구분됩니다.

* **head**는 문서에 대한 정보를 담고 있지만 이 정보는 화면에 직접적으로 보여지 않습니다.

* **body**는 웹사이트에 보여지는 모든 내용을 담고 있습니다.

`<head>`는 브라우저에 페이지에 대한 설정들을 알려주고, `<body>`는 실제 페이지에 보여줄 내용을 알려줍니다.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

![그림 11.3](images/step4.png)

브라우저가 어떻게 "Ola's blog"를 웹 페이지의 제목으로 이해했을까요? 바로 브라우저가 `<title>Ola's blog</title>`를 해석해 브라우저 제목 표시줄에 내용을 반영한 것입니다. (북마크를 할 때도 이렇게 사용됩니다.)

태그는 `/`로*태그 마침*하고 *중첩(nested)*해서 사용할 수 있습니다. (모든 태그가 닫힐 때까지 특정 태그 하나만 닫을 수 없습니다.)

이 개념은 박스에 뭔가 집어 넣는 것과 같아요. 여러분에게 `<html></html>`라고 하는 큰 박스가 있습니다. 박스 안에는 `<body></body>` 박스가 있고, 또 그 박스 안에는 `<p></p>`라는 더 작은 박스들이 있는 것이죠.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## 맞춤형 템플릿 만들기

여러분은 이제 좀 더 재밌어질 것입니다. 여러분만의 템플릿을 만들어봅시다! 여기 몇 가지 유용한 태그들이 있습니다:

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` 그 다음 수준의 머리말에 사용하는 태그
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` 텍스트를 강조할 때 사용하는 태그
* `<strong>text</strong>` 여러분의 텍스트를 강력하게 강조할 때 사용하는 태그
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` 링크 걸기
* `<ul><li>first item</li><li>second item</li></ul>` 목록을 만듭니다. 지금 여러분이 보고 있는 목록처럼요!
* `<div></div>` 페이지의 섹션을 정의합니다.

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
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

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

이 태그들로 이렇게 변합니다. :

![그림 11.4](images/step6.png)

야호! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## 하나 더: 배포하기!

방금 작업했던 것이 인터넷에서도 볼 수 있으면 좋겠죠? PythonAnywhere으로도 배포해 봅시다. :

### Commit, and push your code up to GitHub

제일 먼저, 마지막 배포 이후 수정된 파일을 확인해 봅시다. (PythonAnywhere가 아닌 로컬에서 실행하세요) :

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

파일 업로드 전, `git`으로 업로드 할 파일들을 확인해봅시다. (`git`에서 업로드 할 모든 파일들이 녹색으로 나타나야 합니다.) :

{% filename %}command-line{% endfilename %}

    $ git status
    

거의 다 왔습니다. 이제 저장소에 변경 사항을 저장할 단계예요. 우리는 "커밋 메시지(commit message)"를 주어, 어떤 것이 수정 변경되었는지 알려줄 거에요. 이번에는 아무거나 적어도 괜찮습니다. 하지만 앞으로는 내가 수정한 내용을 간략하게 적어 다음에 기억할 수 있도록 하는 것이 좋을 거에요.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### PythonAnywhere에서 새 코드를 가져와, 웹 앱을 다시 불러옵니다.

* [PythonAnywhere 콘솔 페이지](https://www.pythonanywhere.com/consoles/)를 열고 **배시 콘솔** (또는 새로운 창)을 준비합니다. 그 다음, 명령어를 입력합니다. :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)