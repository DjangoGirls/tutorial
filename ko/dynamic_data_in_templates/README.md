# 템플릿의 동적 데이터

블로그 글이 각각 다른 장소에 조각조각 나눠져있어요. `Post` 모델은 `models.py`파일에 정의되어 있고, `post_list` 모델은 `views.py` 파일에 정의되어 있습니다. 템플릿도 추가해야해요. 하지만 실제로 HTML 템플릿에서 글들이 어떻게 보여질까요? 보여주고자 하는 컨텐츠(데이터베이스 안에 저장되어 있는 모델들) 를 가져와서 우리의 템플릿에 넣어서 멋있게 보여줄 것입니다.

여기서 *views* 가 모델과 템플릿을 연결하는 역할을 한다는 것을 알 수 있어요. `post_list` *view* 에서 보여주고 템플릿에 넘기기 위해서 모델을 가져와야해요. 그래서 기본적으로 *view* 에서는 템플릿에서 무엇을 보여줄 지 (모델) 을 선택을 하지요.

자, 모두 했나요?

이제 `blog/views.py` 파일을 열어봅시다. `post_list` *view* 파일이 아래처럼 보일 거에요.

```python
    from django.shortcuts import render

    def post_list(request):
        return render(request, 'blog/post_list.html', {})
```

다른 파일들에 있는 코드를 가져오는 것에 대해서 이야기 했던거 기억나나요? 이제 `models.py` 파일에서 정의한 모델을 가져올 때입니다. 이제 `from .models import Post` 행을 추가해 봅시다. 아래와 같을 거에요. :

```python
    from django.shortcuts import render
    from .models import Post
```

`from` 다음에 있는 마침표(.)는 *현재 디렉토리* 또는* 현재 어플리케이션*을 의미합니다. `views.py`와 `models.py` 파일들이 같은 디렉토리에 있기 때문에 우리는 `.`와 (`.py` 확장자를 붙이지 않아도) 파일의 이름만으로도 쉽게 사용할 수 있습니다. 자 다음은 모델(`Post`)의 이름을 불러옵니다.).

그럼 그 다음은요? `Post` 모델에서 실제 블로그 글들을 가져와야 하는데 이때 필요한 특별한 것이 바로 `QuerySet`입니다.

## 쿼리셋(QuerySet)

여러분은 쿼리셋이 어떻게 동작하는지를 이미 친숙해져 있어야해요. 자세한 내용은 [Django ORM (쿼리셋)][1]에서 다루었어요.

 [1]: ../django_orm/README.md

자, 이제는 블로그 글 목록을 주의깊게 봅시다. 글 목록이 출판되고 `출판된 날짜(published_date)` 기준으로 정렬되면 좋겠죠? 사실 이미 쿼리셋 챕터에서 해놓어요!

```python
    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

이제 `blog/views.py` 파일의 `def post_list(request)` 함수에다 이 코드 조각을 넣어봅시다.

```python
    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {})
```

우리는 지금 `posts`쿼리셋을 나타내는 *변수* 를 만들고 있다는 것을 주의하세요. 이 변수는 퀴리셋의 이름으로 취급하며 이 이름으로 참조할 수도 있습니다.

위 코드에서 `timezone.now()` 함수를 쓰기 때문에 `timezone` 모듈 import가 필요합니다.

마지막 부족한 부분은 `posts` 쿼리셋을 처리해서 템플릿에 보내는 것입니다.(이 부분은 다음 장에서 다룰 거에요.)

`render`함수에서는 이미 요청 시 매개변수`request`와 템플릿 파일 'blog/post_list.html'를 가지고 있습니다. `{}` 와 같이 보이는 마지막 매개 변수는 템플릿을 사용하기 위해 무엇인가를 추가하는 장소입니다. 이름을 넣어줘야 합니다. (여기서는 `'posts'`이에요.) 이렇게 보일지도 모르겠어요. : `{'posts': posts}`. `:` 표시를 해 구분하는 것을 잊지 마세요. ; 양쪽에 작은 따옴표를 붙이는 것도요. `''`.

그래서 최종적으로 `blog/views.py` 파일이 아래처럼 될 거에요. :

```python
    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})
```

다 되었습니다! 이제 템플릿 파일로 돌아가서 이 쿼리셋을 보이게 해볼 차례에요.

쿼리셋에 대해서 좀 더 자세히 알고 싶다면 장고 공식 문서를 읽어보세요. : https://docs.djangoproject.com/en/1.8/ref/models/querysets/
