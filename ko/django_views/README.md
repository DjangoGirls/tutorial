# Django 뷰 만들기

지난 장에서 만들었던 버그를 잡을 시간이 왔어요 :)

뷰(*view*) 는 어플리케이션의 "로직"을 넣는 곳이에요. 뷰는 앞 챕터에서 만들었던 `모델`에게서 필요한 정보를 받아와서 `템플릿`에 전달하는 역할을 합니다. 다음 장에서 템플릿을 만들어 볼 거에요. 뷰는 **파이썬 들어가기** 장에서 했던 것 보다 조금 복잡해 보이지만, 그래도 결국 파이썬의 메서드일 뿐이에요.

뷰는 `views.py` 파일 안에 있습니다. 우리는 *views* 를 `blog/views.py` 파일 안에 추가할 거에요.

## blog/views.py

좋아요. 이제 이 파일을 열고 안에 있는 내용을 살펴봅시다. :

```python
    from django.shortcuts import render
```
    # Create your views here.


여기에는 별 내용이 없네요. 가장 간단한 *view* 를 이렇게 만들어봅시다.

```python
    def post_list(request):
        return render(request, 'blog/post_list.html', {})
```

방금 우리는 `post_list`라는 메서드를 만들었습니다. (`def`가 메서드를 만들 때 사용하는 키워드였죠?) 그리고 이 메서드는 `요청(request)`을 넘겨받아 `render` 메서드를 호출합니다. render 메서드는 넘겨진 요청(request)과 `blog/post_list.html` 템플릿 받아 리턴된 내용이 브라우저에 보여지게 됩니다.

파일을 저장하고, http://127.0.0.1:8000/로 접속해 결과를 확인해보세요.

에러가 발생했어요! 이제 아래 내용을 읽어보세요. :

![오류][1]

 [1]: images/error.png

*TemplateDoesNotExist* 는 쉽게 해결할 수 있습니다. : 잘 따라왔다면 이러한 에러가 발생하는게 맞아요. 다음 장에서 이 버그를 해결하기 위해 템플릿 파일을 만들 거에요!

> Django 뷰에 대해 자세히 알고 싶으시면 공식 문서를 읽어 보세요. https://docs.djangoproject.com/en/1.8/topics/http/views/
