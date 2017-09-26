# 템플릿의 동적 데이터

블로그 글이 각각 다른 장소에 조각조각 나눠져있어요. `Post` 모델은 `post_list`파일에 정의되어 있고, `post_list` 모델은 `views.py` 파일에 정의되어 있습니다. 템플릿도 추가해야해요. 하지만 실제로 HTML 템플릿에서 글들이 어떻게 보여질까요? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

여기서 *views*가 모델과 템플릿을 연결하는 역할을 한다는 것을 알 수 있어요. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

이제 `blog/views.py` 파일을 열어봅시다. `post_list` *view* 파일이 아래처럼 보일꺼에요.

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

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## 쿼리셋(QuerySet)

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

우리는 `posts`쿼리셋을 나타내는 *변수*를 만든다는 점에 주의하세요. 이 변수는 퀴리셋의 이름으로 취급하며 이 이름으로 참조할 수도 있습니다.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/1.9/ref/models/querysets/