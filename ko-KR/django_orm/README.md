# Django ORM과 QuerySets(쿼리셋)

이번 장에서는 장고를 데이터베이스에 연결, 데이터를 저장하는 방법에 대해서 알아볼 거에요. 함께 시작해봅시다!

## 쿼리셋(QuerySet) 은 무엇인가요?

핵심만 말하자면, 쿼리셋은 전달받은 모델의 객체 목록입니다. 쿼리셋은 데이터베이스로부터 데이터를 읽고, 필터를 걸거나 정렬을 할 수 있습니다.

가장 쉽게 배우는 방법은 예제로 배우는 것이죠. 함께 해볼까요?

## 장고 쉘(shell)

PythonAnywhere가 아닌 로컬 컨솔에서 아래 명령을 입력하세요. :

{% filename %}명령줄{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

실행하면 아래처럼 나올 거에요.

{% filename %}명령줄{% endfilename %}

```python
(InteractiveConsole)
>>>
```

여러분은 이제 장고 인터랙티브 콘솔(interactive console) 로 들어왔습니다. 파이썬 프롬프트와 비슷하지만 장고만의 마법을 부릴 수 있는 곳이기도 하지요. :) 물론 파이썬의 모든 명령어를 여기서 사용할 수 있습니다.

### 모두 보기

자, 이제 먼저 입력했던 모든 글들을 출력하겠습니다. 아래와 같이 입력하세요.

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

이런! 에러가 나타났어요. 글이 없다고 하네요. 이럴수가... 그런데 이렇게 나오는 것이 맞는 거랍니다. 이 글을 먼저 불러오는 것(import) 을 잊었네요!

{% filename %}명령줄{% endfilename %}

```python
>>> from blog.models import Post
```

간단합니다. : 우리는 `Post`모델을 `blog.models`에서 불러왔어요. 이제 모든 글들을 출력해봅시다.

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

우리가 만들었던 그 글 목록이 나타났네요! 장고 관리자 인터페이스로 만들었던 것들이에요. 그런데 파이썬으로 새 글을 포스팅하려면, 어떻게 해야할까요?

### 객체 생성하기

데이터베이스에 새 글 객체를 저장하는 방법에 대해 알아봅시다.

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

하지만 여기에 뭔가 빼먹은 것이 하나 있어요.: `me` . 작성자로서 `User`(사용자) 모델의 인스턴스를 가져와 전달해줘야 합니다. 어떻게 해야 할까요?

먼저 User 모델을 불러옵니다. :

{% filename %}명령줄{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

데이터베이스에서 user는 어떤 일을 할까요? 함께 알아봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

이전에 만든 슈퍼유저에요! 사용자 개체를 얻어봐요(현재 가지고 있는 사용자이름을 사용하기위해 다음줄을 수정해요)

{% filename %}명령줄{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

보다싶이 우리는 `username` 이 'ola'인 사용자를 깔끔하게`get`했어요.

드디어 우리 게시물을 만들었네요. :

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

만세! 그런데 제대로 작동했는지 확인해봐야죠?

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

보세요, 목록에 게시글 하나가 더 늘었네요! 

### 글 더 추가하기

점점 재밌어질 거에요. 몇 개 글을 더 추가해서 잘 작동하는지 확인해봅시다. 2-3개 정도만 더 추가해보고 다음 내용으로 넘어갈게요.

### 필터링하기

쿼리셋의 중요한 기능은 데이터를 필터링하는 거에요. 예를 들어, 우리는 ola라는 User가 작성한 모든 글을 찾고 싶다고 해볼게요. 이런 경우 `Post.objects.all()`에서 `all` 대신, `filter`를 사용합니다. 쿼리셋 안에 있는 괄호 안에 우리가 원하는 조건(들)을 넣어줄 거에요. 지금 이 경우에는 `author`가 `me`인 조건을 넣어야겠죠. 이걸 장고로 표현한다면 `author=me`가 됩니다. 이제 이 조건이 반영된 코드를 볼까요. :

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

또는 모든 글들 중, `제목(title)`에 'title'이라는 글자가 들어간 글들만을 뽑아내서 보고 싶다면요?

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **주의하세요** `title`와 `contains` 사이에 있는 밑줄(`_`)이 2개입니다. 장고 ORM은 필드 이름("title")과 연산자과 필터("contains")를 밑줄 2개를 사용해 구분합니다. 밑줄 1개만 입력한다면, "FieldError: Cannot resolve keyword title_contains"라는 오류가 뜰 거에요.

우리는 출판된 글 목록을 볼 수 있어요. 이를 위해 `출판 날짜(published_date)`가 과거인 글들을 필터링하면 가져오면 되겠죠.

{% filename %}명령줄{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

안타깝게도, 파이썬 콘솔에서 추가한 게시물은 아직 보이지 않네요. 하지만 바꿀 수 있어요! 먼저 게시하려는 게시물의 인스턴스를 얻어야 해요. :

{% filename %}명령줄{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

그리고 `publish` 메서드를 사용해서 출판합시다:

{% filename %}명령줄{% endfilename %}

```python
>>> post.publish()
```

이제 (위쪽 화살표 버튼 3번을 누르고 `enter`를 눌러) 다시 게시된 글의 목록을 가져와 봅시다.

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### 정렬하기

퀘리셋은 객체 목록을 정렬도 할 수 있어요. 이제 `created_date` 필드를 정렬해봅시다. :

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

`-`을 맨 앞에 붙여주면 내림차순으로 정렬도 가능해요. :

{% filename %}명령줄{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### 메서드체이닝을 활용한 복잡한 쿼리

보다싶이, `Post.objects` 의 몇몇 함수는 쿼리셋을 반환해요. 쿼리셋에서도 동일한 함수를 호출할 수 있어요, 그리고새 쿼리셋을 반환한답니다. 쿼리셋들을 함께 **연결(chaining)**할 수도 있어요.

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

이 방법은 정말 강력해 복잡한 쿼리도 작성할 수 있게 해준답니다.

좋아요! 이제 다음 내용으로 넘어갈 때로군요! 다음 명령을 입력해, 쉘을 종료하세요. :

{% filename %}명령줄{% endfilename %}

```python
>>> exit()
$
```