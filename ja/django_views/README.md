# Django views – time to create!

それでは前の章の続きをやりましょう。確かビューの作成がまだだったので、エラーになっていましたね! :)

私たちは*view*にアプリケーションのロジックを置きます。 それは前に作成した `モデル` から情報を取得し、それを `テンプレート` に引き渡します。 テンプレートは次の章で作成します。 Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

ビューは、`views.py` ファイルに記述します。私たちの場合 *ビュー* を `blog/views.py` に書くことになります。

## blog/views.py

OK それでは早速そのファイル（blog/views.py)を開いてみましょう。

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

今度は別のエラーです。何と書いてあるか読んでみましょう。

![エラー](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Djangoのビューについてもっと知りたいのなら、英語で書かれていますが、オフィシャルドキュメントを是非読んでみてください https://docs.djangoproject.com/en/1.11/topics/http/views/