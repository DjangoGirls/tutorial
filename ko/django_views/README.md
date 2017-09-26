# Django views – time to create!

Time to get rid of the bug we created in the last chapter! :)

뷰(*view*) 는 어플리케이션의 "로직"을 넣는 곳이에요. 뷰는 앞 챕터에서 만들었던 `모델`에게서 필요한 정보를 받아와서 `템플릿`에 전달하는 역할을 합니다. 다음 장에서 템플릿을 만들어 볼 거에요. Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

뷰는 `views.py` 파일 안에 있습니다. 우리는 *views*를 `blog/views.py` 파일 안에 추가할 거에요.

## blog/views.py

좋아요. 이제 이 파일을 열고 안에 있는 내용을 살펴봅시다. :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

The simplest *view* can look like this:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

에러가 발생했어요! 이제 아래 내용을 읽어보세요. :

![오류](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/1.11/topics/http/views/