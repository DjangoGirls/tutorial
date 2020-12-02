# 템플릿의 동적 데이터

블로그 글은 각각 다른 장소에 조각조각 나눠져있어요. `Post`모델은 `models.py`파일에, `post_list`모델은 `views.py`파일에 있어요. 그리고 앞으로 템플릿도 추가해야 합니다. 하지만 실제로 HTML 템플릿에서 글들이 어떻게 보여질까요? 보여주고자 하는 컨텐츠(데이터베이스 안에 저장되어 있는 모델들) 를 가져와서 우리의 템플릿에 넣어서 멋있게 보여줄 것입니다.

여기서 *views*가 모델과 템플릿을 연결하는 역할을 한다는 것을 알 수 있어요. `post_list` *view*에서 보여주고 템플릿에 넘기기 위해서 모델을 가져와야해요. 그래서 기본적으로 *view*에서는 템플릿에서 무엇을 보여줄 지 (모델)을 선택해야죠.

자, 모두 했나요?

이제 `blog/views.py` 파일을 열어봅시다. `post_list` *view* 파일이 아래처럼 보일꺼에요.

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

다른 파일들에 있는 코드를 가져오는 것에 대해서 이야기 했던거 기억나나요? 이제 `models.py` 파일에서 정의한 모델을 가져올 때입니다. 이제 `from .models import Post` 행을 추가해 봅시다. 아래처럼 보이게 될 것입니다.:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

`from` 다음에 있는 마침표(.)는 *현재 디렉토* 또는* 현재 어플리케이션*을 의미합니다. `views.py` 및 `models.py` 같은 디렉터리에 있습니다. `.`와 파일 이름만으로 (`.py`없이) 사용할 수 있어요. 자 다음은 모델(`Post`)의 이름을 불러옵니다).

그럼 그 다음은? `Post` 모델에서 실제 블로그 글들을 가져와야 하는데 이때 필요한 특별한 무엇인가가 `QuerySet`입니다.

## 쿼리셋(QuerySet)

여러분은 쿼리셋이 어떻게 동작하는지를 이미 친숙해져있어야 합니다. [Django ORM (쿼리셋)](../django_orm/README.md)에서 배운 내용입니다.

자, 이제는 블로그 글 목록에 관심을 가져봅시다. 글 목록이 출판되고 `출판된 날짜(published_date)`기준으로 정렬되면 좋겠죠? 사실 이미 쿼리셋 장에서 배운 내용입니다.

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

코드 편집기에서 `blog/views.py` 파일을 열어보야요,그리고 `def post_list(request)` 함수를 작성해요 --하지만 먼저 `from django.utils import timezone`을 추가해야하는 것을 잊지 말아요:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

블로그 게시글 목록에 쿼리셋을 보여주려면, 두 가지 작업이 더 남았어요.

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

우리는 `posts`쿼리셋을 나타내는 *변수*를 만든다는 점에 주의하세요. 이 변수는 퀴리셋의 이름으로 취급하며 이 이름으로 참조할 수도 있습니다.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. 이름을 넣어줘야 합니다. (여기서는 `'posts'`라고 하죠). :) 이렇게 보일지도 모르겠어요: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

그래서 최종적으로는 `blog/views.py` 파일이 아래처럼 될 것입니다. :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

다 되었습니다! 이제 템플릿 파일로 돌아가서 이 쿼리셋을 나타나도록 하는 것을 해볼 때입니다.

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/