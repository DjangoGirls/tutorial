# Djangoビュー – 今こそ作りましょう！

それでは前の章の続きをやりましょう。確かビューの作成がまだだったので、エラーになっていましたね！:)

*ビュー* はアプリのロジックを書いていくところです。 ビューは、以前あなたが作った `モデル` に情報を要求し、それを `テンプレート` に渡します。 テンプレートは、次の章で作ります。 ビューはただのPythonの関数です。**Python入門**の章で書いたものよりもちょっと複雑なだけですよ。

ビューは、`views.py` に記述します。私たちの場合 `blog/views.py` に書くことになります。

## blog/views.py

では、早速 blog/views.py をコードエディタで開いてみましょう：

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

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

ファイルを保存したら、どんな風に表示されるか、ブラウザで http://127.0.0.1:8000/ を確認してみましょう。

今度は別のエラーになりましたね。なんと書いてあるでしょうか。

![エラー](images/error.png)

サーバーは実行されていることはわかるのですが、正しく表示されないのはなぜでしょう？ 心配しないで！ただのエラーページです！ コンソールでのエラーメッセージと同じように、これは実際にかなり便利です。 *TemplateDoesNotExist* と書いてありますね。 それでは次の章でテンプレートを作って、エラーを解決しましょう！

> Djangoのビューについてもっと知りたいのなら、オフィシャルドキュメントを是非読んでみてください。 https://docs.djangoproject.com/ja/2.0/topics/http/views/