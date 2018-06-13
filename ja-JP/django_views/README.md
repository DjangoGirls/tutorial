# Django views – time to create!

それでは前の章の続きをやりましょう。確かビューの作成がまだだったので、エラーになっていましたね！:)

*ビュー* はアプリのロジックを書いていくところです。 ビューは要求に応じて `model` から情報を取得し `template` に渡します。 テンプレートは、次の章で作ります。 ビューは、Pythonで記述されているだけです。**Introduction to Python** の章でやったことよりも、ちょっと複雑なだけですよ。

ビューは、`views.py` に記述します。私たちの場合 `blog/views.py` に書くことになります。

## blog/views.py

では、早速 blog/views.py を開いてみましょう。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

まだ何もないですね。

`#` で始まる行は、コメントです。この行に書いたものはPythonは無視します。

それでは、次のようなちょっとした *ビュー* を作ってみましょう。

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

よく見てみましょうか。まず `post_list` という関数（ `def` から始まる部分のことです）を、記述しています。この `post_list` は `request` を引数に取り、`render` 関数を `return` しています。`render` 関数は `blog/post_list.html` というテンプレートファイルを使って、引数で受け取った `request` の内容を出力しています。

ファイルを保存したら、どんな風に表示されるか、ブラウザで http://127.0.0.1:8000/ を確認してみましょう。

今度は別のエラーになりましたね。なんと書いてあるでしょうか。

![エラー](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Djangoのビューについてもっと知りたいのなら、英語で書かれていますが、オフィシャルドキュメントを是非読んでみてください https://docs.djangoproject.com/en/1.11/topics/http/views/