# Django ORM과 QuerySets(쿼리셋)

이번 장에서는 장고를 데이터베이스에 연결, 데이터를 저장하는 방법에 대해서 알아볼 거에요. 함께 시작해봅시다!

## 쿼리셋(QuerySet) 은 무엇인가요?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

가장 쉽게 배우는 방법은 예제로 배우는 것이죠. 함께 해볼까요?

## 장고 쉘(shell)

PythonAnywhere가 아닌 로컬 컨솔에서 아래 명령을 입력하세요. :

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

실행하면 아래처럼 나올 거에요.

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### 모두 보기

자, 이제 먼저 입력했던 모든 글들을 출력하겠습니다. 아래와 같이 입력하세요.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

We import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### 객체 생성하기

데이터베이스에 새 글 객체를 저장하는 방법에 대해 알아봅시다.

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

먼저 User 모델을 불러옵니다. :

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

데이터베이스에서 user는 어떤 일을 할까요? 함께 알아봅시다:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

드디어 우리 게시물을 만들었네요. :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

만세! 그런데 제대로 작동했는지 확인해봐야죠?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

보세요, 목록에 게시글 하나가 더 늘었네요! 

### 글 더 추가하기

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### 필터링하기

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. 이런 경우 `Post.objects.all()`에서 `all` 대신, `filter`를 사용합니다. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. 이제 이 조건이 반영된 코드를 볼까요. :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **주의하세요** `title`와 `contains` 사이에 있는 밑줄(`_`)이 2개입니다. 장고 ORM은 필드 이름("title")과 연산자과 필터("contains")를 밑줄 2개를 사용해 구분합니다. If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

그리고 `publish` 메서드를 사용해서 출판합시다:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### 정렬하기

퀘리셋은 객체 목록을 정렬도 할 수 있어요. 이제 `created_date` 필드를 정렬해봅시다. :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

`-`을 맨 앞에 붙여주면 내림차순으로 정렬도 가능해요. :

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### 쿼리셋(QuerySets) 연결하기

쿼리셋들을 함께 **연결(chaining)**할 수도 있어요.

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

이 방법은 정말 강력해 복잡한 쿼리도 작성할 수 있게 해준답니다.

좋아요! 이제 다음 내용으로 넘어갈 때로군요! 다음 명령을 입력해, 쉘을 종료하세요. :

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```