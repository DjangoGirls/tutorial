# Django views – time to create!

지난 장에서 만들었던 버그를 잡을 시간이 왔어요! :)

뷰(*view*) 는 어플리케이션의 "로직"을 넣는 곳이에요. 뷰는 앞 챕터에서 만들었던 `모델`에게서 필요한 정보를 받아와서 `템플릿`에 전달하는 역할을 합니다. 다음 장에서 템플릿을 만들어 볼 거에요. 뷰는 **파이썬 들어가기** 장에서 했던 것 보다 조금 더 복잡해 보이는 파이썬 함수입니다.

뷰는 `views.py` 파일 안에 있습니다. 우리는 *views*를 `blog/views.py` 파일 안에 추가할 거에요.

## blog/views.py

OK, let's open up this file in our code editor and see what's in there:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# 이 곳에 views를 추가하세요.
```

해야할 게 그렇게 많지는 않아요.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

에러가 발생했어요! 이제 아래 내용을 읽어보세요. :

![Error](images/error.png)

서버가 사디 실행했지만, 아직도 보여지지 않네요, 그렇죠? 걱정하지마세요, 이건 단순한 오류 페이지에요, 전혀 두려워하지 않아도 돼요! 콘솔에 에러 메세지가 나타나는 것은, 실제로 정말 유용하답니다! *TemplateDoesNotExist (템플릿이 존재하지 않습니다)*라고 읽을 수 있으니까요. 버그를 잡고 다음 장에서 템플릿을 만들어보아요!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/