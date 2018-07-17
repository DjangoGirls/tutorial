# Django views – time to create!

是時候來排除我們在上一章節中造成的錯誤 (bug) 了! :)

*view* 是我們放應用程式的 "邏輯" 的地方。 它將要求你之前建立的 `模型(model)` 提供資訊，並將它傳遞給 `範本(template)`。 在下一章，我們將建立一個範本。 Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

Views 都放在 `views.py` 檔中，我們將會新增我們 *views* 到 `blog/views.py` 檔。

## blog/views.py

OK，讓我們打開這個檔，看看裡面有什麼？

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

另一個錯誤！讀看看現在發生什麼：

![錯誤 (Error)](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/