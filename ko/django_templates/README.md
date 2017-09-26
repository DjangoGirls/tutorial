# Django 템플릿

이제 데이터를 보여줄 차례에요! 이를 위해 장고는 내장된 **template tags**라는 유용한 기능을 제공합니다.

## 템플릿 태그는 무엇인가요?

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Cool!

## post 목록 템플릿 보여주기

이전 장에서 글 목록이 들어있는 `posts` 변수를 템플릿에 넘겨주었습니다. 이제 넘겨진 posts 변수를 받아서 HTML에 나타나도록 해볼 차례예요.

장고 템플릿 안에 있는 값을 출력하려면, 변수 이름안에 중괄호를 넣어 표시해야합니다. 이렇게요. :

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

`blog/templates/blog/post_list.html` 템플릿에서 하세요. 두 번째 `<div>`에서 세 번째 `</div>`까지를 `{{ posts }}`로 바꾸세요. 파일을 저장하고 페이지를 새로 고침하면 이렇게 보입니다. :

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

잘 작동하네요! But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. HTML과 템플릿 태그를 섞어 사용하면 멋있게 만들 수 있어요. 우리의 `body`는 다음과 같을 거에요. :

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

{% raw %} `{% for %}` 와 `{% endfor %}`사이에 넣은 모든 것은 목록의 모든 객체를 반복하게 됩니다. 페이지를 새로고침 해보세요: {% endraw %}

![그림 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }})`? `Post` 모델에서 정의한 각 필드의 데이터에 접근하기 위해 이 표기법을 사용합니다. Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## 한 가지 더

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* 제일 먼저, Github에 여러분의 코드를 git의 push를 사용해서 넣으세요.

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* 다음 [PythonAnywhere](https://www.pythonanywhere.com/consoles/)로 돌아와 **배시 콘솔창**으로 가서(또는 이미 닫았다면 새 콘솔창을 여세요), 다음 명령어를 실행하세요. :

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* 마지막으로 [웹 탭(Web tab)](https://www.pythonanywhere.com/web_app_setup/)에서 **다시 불러오기(Reload)**를 누르세요. 업데이트가 보여야 해요! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![그림 13.4](images/donut.png)