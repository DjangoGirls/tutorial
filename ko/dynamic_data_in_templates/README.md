# 템플릿 동적 데이터

블로그 글은 각각 다른 장소에 조각조각 나눠져있어요. `Post`모델은 `post_list`파일에, `post_list`모델은 `views.py`파일에 있어요. 그리고 앞으로 템플릿도 추가해야 합니다. HTML 템플릿에서 글 목록을 어떻게 보여줄까요? 이번 장에서는 콘텐츠(데이터베이스 안에 저장되어 있는 모델)를 가져와 템플릿에 넣어 보여주는 것을 해볼 거에요.

**뷰(view)**는 모델과 템플릿을 연결하는 역할을 합니다. `post_list`를 **뷰**에서 보여주고, 이를 템플릿에 전달하기 위해서는, 모델을 가져와야 합니다. 일반적으로 **뷰**가 템플릿에서 모델을 선택하도록 만들어야 합니다.

자, 모두 준비됐나요?

`blog/views.py`파일을 열어봅시다. `post_list` **뷰** 내용을 봅시다.

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

다른 파일에 있는 코드를 가져오는 방법, 기억나나요? `models.py`파일에 정의된 모델을 가져올 거에요. `from .models import Post`을 추가하세요.

```python
from django.shortcuts import render
from .models import Post
```

`from` 다음에 있는 마침표(.)는 현재 *디렉터리* 또는 *애플리케이션*을 의미합니다. 동일한 디렉터리 내 `views.py`, `models.py`파일이 있기 때문에 `. 파일명` (`.py`확장자를 붙이지 않아도)으로 내용을 가져올 수 있습니다. 이제 `Post`모델을 불러봅시다.

`Post`모델에서 블로그 글을 가져오기 위해서는 `쿼리셋(QuerySet)`이 필요합니다.

## 쿼리셋(QuerySet)

여러분은 이미 쿼리셋에 익숙해야 해요. 자세한 내용은 [Django ORM (QuerySets)][1] 장에서 다루었어요.

 [1]: ../django_orm/README.md

자, 블로그 글 목록을 살펴봅시다. 글 목록을 게시일 `published_date`기준으로 정렬해볼까요? 이미 [Django ORM과 QuerySets][1] 장에서 해본 내용이에요.

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

다음으로 `blog/views.py`파일 내 `def post_list(request)`함수에 아래 코드 내용을 넣어봅시다.

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
  posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
  return render(request, 'blog/post_list.html', {})
```

우리는 `posts`라는 *변수*를 만들고 있다는 것을 기억하세요. 이 변수는 퀴리셋의 이름입니다.

위 코드에서 `timezone.now()`함수를 쓰기 때문에 `timezone` 모듈을 불러와야(`import`) 합니다.

다음 장에서 `posts`쿼리셋을 템플릿에 보내는 방법을 배울 거에요.

`render`함수에는 매개변수 `request`(사용자가 요청하는 모든 것)와 'blog/post_list.html' 템플릿이 있습니다. `{}`이 보일 텐데, 이곳에 템플릿을 사용하기 위해 매개변수를 추가할 거에요. (이 매개변수를`'posts'`라고 할거에요)`{'posts': posts}`이렇게 작성할거에요. `:`이전에 문자열이 와야하고, 작은 따옴표`''`를 양쪽에 붙이는 것을 잊지마세요.

따라서 `blog/views.py`코드는 아래 코드처럼 보일 겁니다.

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

여기까지에요! 템플릿 파일로 돌아가 쿼리셋을 보이게 만들어 봅시다.

쿼리셋에 대해 더 알고 싶다면 [장고 공식 문서](https://docs.djangoproject.com/en/1.8/ref/models/querysets/
)를 읽어보세요.
