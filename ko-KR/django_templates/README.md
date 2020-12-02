# Django 템플릿

이제 데이터를 보여줄 차례에요! 이를 위해 장고는 내장된 **template tags**라는 유용한 기능을 제공합니다.

## 템플릿 태그는 무엇인가요?

HTML에 여러분은 파이썬 코드를 바로 넣을 수 없어요. 브라우저는 HTML만을 알고 있고 파이썬 코드를 이해할 수 없기 때문이에요. 알다시피 HTML는 정적이지만, 파이썬은 동적입니다.

**장고 템플릿 태그**는 파이썬을 HTML로 바꿔주어, 빠르고 쉽게 동적인 웹사이트를 만들 수 있게 도와주어요. 야호!

## post 목록 템플릿 보여주기

이전 장에서 글 목록이 들어있는 `posts` 변수를 템플릿에 넘겨주었습니다. 이제 넘겨진 posts 변수를 받아서 HTML에 나타나도록 해볼 차례예요.

장고 템플릿 안에 있는 값을 출력하려면, 변수 이름안에 중괄호를 넣어 표시해야합니다. 이렇게요. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

`blog/templates/blog/post_list.html` 템플릿에서 하세요. 에디터로 열고 두 번째 `<div>`에서 세 번째 `</div>`까지를 `{{ posts }}`로 바꾸세요. 파일을 저장하고 페이지를 새로 고침하면 이렇게 보입니다. :

![그림 13.1](images/step1.png)

우리는 아래와 같이 만들었어요. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

이는 장고가 {{ posts}} 를 객체들의 목록으로 이해하고 처리했다는 것을 의미해요. **파이썬 들어가기**에서 어떻게 목록을 보여줬는지 기억하고 있나요? 맞아요, for loop을 이용해서죠! 장고 템플릿에서는 이렇게 해야합니다. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

여러분의 템플릿 파일에 적용해 보세요.

![그림 13.2](images/step2.png)

잘 작동하네요! 그런데 디자인이 별로죠. 앞에서 **HTML 소개** 챕터에서 했던 정적 글들처럼 보이면 참 좋을텐데 말이에요. HTML과 템플릿 태그를 섞어 사용하면 멋있게 만들 수 있어요. 우리의 `body`는 다음과 같을 거에요. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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
```

{% raw %} `{% for %}` 와 `{% endfor %}`사이에 넣은 모든 것은 목록의 모든 객체를 반복하게 됩니다. 페이지를 새로고침 해보세요: {% endraw %}

![그림 13.3](images/step3.png)

(`{{ post.title }}`라던가 `{{ post.text }}`) 같이 이전과 다른 표기법을 사용한 것을 눈치 채셨나요? `Post` 모델에서 정의한 각 필드의 데이터에 접근하기 위해 이 표기법을 사용합니다. 또한 `|linebreaks` 같이 파이프 문자(|)도 사용해요. 이건 블로그 글 텍스트에서 행이 바뀌면 문단으로 변환하도록 하라는 의미입니다. 행바뀜을 문단으로 변환하는 필터를 적용한다는 표현을 쓰기도 합니다.

## 한 가지 더

나혼자만 웹 사이트를 보는게 아니라 다른 사람들도 인터넷을 통해서 볼 수 있으면 참 좋겠죠? 이제 PythonAnywhere에 다시 여러분이 만든 블로그를 배포해봅시다. 아래에 각 단계별로 요약했어요.

* 먼저, 코드를 깃허브에 푸시해보아요

{% filename %}명령줄{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* 다음 [PythonAnywhere](https://www.pythonanywhere.com/consoles/)로 돌아와 **배시 콘솔창**으로 가서(또는 이미 닫았다면 새 콘솔창을 여세요), 다음 명령어를 실행하세요. :

{% filename %}PythonAnywhere 명령줄{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(당신의 PythonAnywhere 서브 도메인을 `<your-pythonanywhere-domain>`에 화살괄호 없이 입력하는것을 잊지마세요)

* 마지막으로 [웹 탭(Web tab)](https://www.pythonanywhere.com/web_app_setup/)으로 가서 여러분의 웹 앱을 **다시 불러오기**를 하세요. (PythonAnywhere 의 다른 페이지를 콘솔에서 접근하기 위해서는, 우측상단 메뉴 버튼을 이용해요.) 새로 업데이트한 내용이 https://subdomain.pythonanywhere.com 에 갱신될 거에요-- 브라우저에서 확인해보세요! PythonAnywhere 사이트 내 블로그 게시글 내용과 로컬 서버에 있는 내용이 똑같지 않아도 돼요. 로컬 컴퓨터 데이터베이스와 PythonAnywehere 데이터베이스 파일은 파일 동기화를 하지 않아요.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)