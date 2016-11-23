# 장고 뷰 만들기

지난 장에서 만들었던 버그를 잡을 시간이 왔어요 :)

뷰(*view*) 는 애플리케이션의 "로직"을 넣는 곳이에요. 뷰는 이전 장에서 만들었던 `모델`에서 필요한 정보를 받아와서 `템플릿`에 전달하는 역할을 합니다. 다음 장에서 템플릿을 만들어 볼 거에요. 뷰는 [**Python 시작하기**](http://tutorial.djangogirls.org/ko/python_introduction/) 장에서 했던 것보다 어려워보이지만, 파이썬 메서드일 뿐이에요.

뷰는 `views.py` 파일 안에 있습니다. 우리는 *views*를 `blog/views.py`파일 안에 추가할 거에요.

## blog/views.py

좋아요. 이제 이 파일을 열고 안에 있는 내용을 살펴봅시다:

```python
from django.shortcuts import render

# Create your views here.
```

별 내용이 없네요. 간단한 *view*를 만들어봅시다.

```python
  def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

방금 `post_list`메서드를 만들었습니다. (`def'는 메서드를 만들 때 사용했죠?) 이 메서드는 `요청(request)`을 넘겨받아 `render`메서드를 호출합니다. `render`메서드는 `요청(request)``을 받아 `blog/post_list.html`템플릿을 호출하고 받은(return) 내용을 브라우저에 보여줍니다.

파일을 저장하고, http://127.0.0.1:8000/로 접속해 확인해보세요.

에러가 발생했네요! 아래 내용을 읽어보세요.

![오류][1]

 [1]: images/error.png

*TemplateDoesNotExist*는 쉽게 해결할 수 있습니다. 잘 따라왔다면 방금 에러가 보이는게 맞아요. 다음 장에서 버그를 해결하기 위해 템플릿 파일을 만들 거에요!

> 장고 뷰에 대해 더 알고 싶다면 [장고 공식 문서](https://docs.djangoproject.com/en/1.8/topics/http/views/)를 읽어보세요.
