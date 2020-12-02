# Django 뷰 만들기

지난 장에서 만들었던 버그를 잡을 시간이 왔어요! :)

뷰(*view*) 는 어플리케이션의 "로직"을 넣는 곳이에요. 뷰는 앞 챕터에서 만들었던 `모델`에게서 필요한 정보를 받아와서 `템플릿`에 전달하는 역할을 합니다. 다음 장에서 템플릿을 만들어 볼 거에요. 뷰는 **파이썬 들어가기** 장에서 했던 것 보다 조금 더 복잡해 보이는 파이썬 함수입니다.

뷰는 `views.py` 파일 안에 있습니다. 우리는 *views*를 `blog/views.py` 파일 안에 추가할 거에요.

## blog/views.py

좋아요. 이제 이 파일을 열고 안에 있는 내용을 살펴봅시다. :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# 이 곳에 views를 추가하세요.
```

해야할 게 그렇게 많지는 않아요.

`#`로 시작하는 줄은 주석이 됨을 기억하세요 – 이 라인은 파이썬에 의해 실행되지 않는 것을 의미합니다.

주석내 추천에 따라 *view* 를 생성해 봅시다. 최소한의 뷰를 아래와 같이 추가해봅시다.

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

방금 `post_list`라는 함수(`def`)를 만들었습니다. 이 함수는 `요청(request)`을 넘겨받아 `render`메서드를 호출합니다. 이 함수는 `render` 메서드를 호출하여 받은(return) `blog/post_list.html`템플릿을 보여줍니다.

파일을 저장하고, http://127.0.0.1:8000/로 접속해 결과를 확인해보세요.

에러가 발생했어요! 이제 아래 내용을 읽어보세요. :

![오류](images/error.png)

서버가 다시 실행했지만, 아직도 보여지지 않네요, 그렇죠? 걱정하지마세요, 이건 단순한 오류 페이지에요, 전혀 두려워하지 않아도 돼요! 콘솔에 에러 메세지가 나타나는 것은, 실제로 정말 유용하답니다! *TemplateDoesNotExist (템플릿이 존재하지 않습니다)*라고 읽을 수 있으니까요. 버그를 잡고 다음 장에서 템플릿을 만들어보아요!

> Django 뷰에 대해 자세히 알고 싶으시면 공식 문서를 읽어보세요. https://docs.djangoproject.com/en/2.2/topics/http/views/