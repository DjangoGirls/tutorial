# 템플릿의 동적 데이터

블로그 글은 각각 다른 장소에 조각조각 나눠져있어요. `Post`모델은 `models.py`파일에, `post_list`모델은 `views.py`파일에 있어요. 그리고 앞으로 템플릿도 추가해야 합니다. 하지만 실제로 HTML 템플릿에서 글들이 어떻게 보여질까요? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

여기서 *views*가 모델과 템플릿을 연결하는 역할을 한다는 것을 알 수 있어요. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. 그래서 기본적으로 *view*에서는 템플릿에서 무엇을 보여줄 지 (모델)을 선택해야죠.

OK, so how will we achieve this?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

다른 파일들에 있는 코드를 가져오는 것에 대해서 이야기 했던거 기억나나요? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

`from` 다음에 있는 마침표(.)는 *현재 디렉토* 또는* 현재 어플리케이션*을 의미합니다. `views.py` 및 `models.py` 같은 디렉터리에 있습니다. `.`와 파일 이름만으로 (`.py`없이) 사용할 수 있어요. 자 다음은 모델(`Post`)의 이름을 불러옵니다).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## 쿼리셋(QuerySet)

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

자, 이제는 블로그 글 목록에 관심을 가져봅시다. 글 목록이 출판되고 `출판된 날짜(published_date)`기준으로 정렬되면 좋겠죠? 사실 이미 쿼리셋 장에서 배운 내용입니다.

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

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