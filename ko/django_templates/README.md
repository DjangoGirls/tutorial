# 장고 템플릿

이제 데이터를 보여줄 차례에요! 이를 위해 장고는 내장된 __템플릿 태그(template tags)__ 라는 유용한 기능을 제공합니다.

## 템플릿 태그는 무엇인가요?

HTML에 여러분은 파이썬 코드를 바로 넣을 수 없어요. 브라우져는 파이썬 코드를 이해할 수 없기 때문이에요요 브라우저는 HTML만을 알고 있어요. 알다시피 HTML는 정적이지만, 파이썬은 동적입니다.

**템플릿 태그**는 파이썬을 HTML로 바꿔주어, 빠르고 쉽게 동적인 웹 사이트를 만들 수 있게 도와주어요. 야호!

## post 목록 템플릿 보여주기

이전 장에서 글 목록이 들어있는 `posts` 변수를 템플릿에 넘겨주었습니다. 이제 넘겨진 `posts`변수를 받아 HTML에 나타나도록 해볼 차례예요.

장고 템플릿 안에 있는 값을 출력하려면, 변수 이름 안에 중괄호를 넣어 표시해야 합니다.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{{ posts }}
```

`blog/templates/blog/post_list.html` 템플릿에서 하세요. 두 번째 `<div>`에서 세 번째 `</div>`까지를 `{{ posts }}`로 바꾸세요. 파일을 저장하고 페이지를 새로고침하면 이렇게 보입니다.

![Figure 13.1](images/step1.png)

아래와 같이 만들었어요 :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
[<Post: My second post>, <Post: My first post>]
```

이는 장고가 `{{ posts }}`를 객체 목록으로 이해하고 처리했다는 것을 의미해요. **Python 시작하기** 장에서 어떻게 목록을 보여줬는지 기억하고 있나요? 맞아요, `for loop`을 이용해서죠! 장고 템플릿에서는 이렇게 써야 합니다.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

여러분의 템플릿 파일에 적용해 보세요.

![Figure 13.2](images/step2.png)

잘 작동하네요! 그런데 디자인이 별로죠. 앞에서 **HTML 시작하기** 했던 정적 블로그 게시글들이 보이게 만들면 참 좋을텐데 말이에요. HTML과 템플릿 태그를 섞어 사용하면 멋있게 만들 수 있어요. `body`를 아래와 같이 수정하세요.


{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
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
```

{% raw %}`{% for %}` 와 `{% endfor %}`사이에 넣은 모든 것은 목록의 모든 객체를 반복하게 됩니다. 페이지를 새로고침 해보세요.{% endraw %}

![Figure 13.3](images/step3.png)

`{{ post.title }}`라던가 `{{ post.text }}`같이 이전과 다른 표기법을 사용한 것을 눈치채셨나요? `Post`모델에서 정의한 각 필드의 데이터에 접근하기 위해 이 표기법을 사용합니다. 또한 `|linebreaksbr`같이 파이프 문자(|)도 사용해요. 이건 블로그 글 텍스트에서 행이 바뀌면 문단으로 변환하도록 하라는 의미입니다. 행바뀜을 문단으로 변환하는 필터를 적용한다는 표현을 쓰기도 합니다.

## 한 가지 더

나 혼자만 웹 사이트를 보는 게 아니라 다른 사람들도 인터넷으로 볼 수 있으면 참 좋겠죠? 이제 PythonAnywhere에 다시 여러분이 만든 블로그를 배포해봅시다. 아래에 각 단계별로 요약했어요.

* 제일 먼저, Github에 여러분의 코드를 git의 push를 사용해서 넣으세요.

{% filename %}command-line{% endfilename %}
```
$ git status
[...]
$ git add --all .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
```

* 다음 [PythonAnywhere](https://www.pythonanywhere.com/consoles/)로 돌아와 **Bash console**로 가서(또는 이미 닫았다면 새 콘솔창을 여세요), 다음 명령어를 실행하세요. :

{% filename %}command-line{% endfilename %}
```
$ cd my-first-blog
$ git pull
[...]
```

* 마지막으로 [Web tab](https://www.pythonanywhere.com/web_app_setup/)에서 **Reload**를 누르세요. 업데이트 내용이 보여야 해요! PythonAnywhere 사이트의 블로그 게시물이 로컬 서버에 호스팅 된 블로그에 나타나는 게시물과 일치하지 않는 것이 정상입니다. 로컬 컴퓨터와 PythonAnywhere의 데이터베이스는 동기화되지 않습니다.

축하합니다! 이제 장고 관리자 페이지로 가서 새 블로그 글을 추가하고(게시일을 추가하는 것을 잊지 마세요!) https://yourname.pythonanywhere.com/admin 로 가야하는 것을 잊지마세요. 새로고침하면 새 글이 보일 거에요.

잘 작동하니까 멋지죠? 잘 해낸 여러분들이 참 자랑스러워요! 잠시 쉬고 오세요. :)

![Figure 13.4](images/donut.png)

