# テンプレート内の動的データ

ポスト内容を保存する為の Post モデルは、 models.py に定義しました。ポストの一覧を表示する post_list は views.py にあり、そこにテンプレートも加わりました。 これらを準備しましたが、実際のところ、ポストをどうやってHTMLファイルに出力すればいいのでしょうか？ 大まかなイメージとしては、データベースに保存された記事を取り出して、テンプレートのHTMLファイルの中に行儀よく並べれば良さそうですね。

正確には、*ビュー *が モデルとテンプレートの橋渡しをしてくれます。 私達が作業している `post_list ` *ビュー *の場合、表示したいデータを取り出して、テンプレートファイルに渡すことになります。 どのモデルのデータを、どのテンプレートに表示させるかを、 *ビュー*に 記述します。

それでは、実際にやってみましょう。

まず`blog/views.py`をエディタで開きます。今のところ `post_list`*ビュー* は、以下のようになっているでしょう。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

少し前に、別のファイルに用意したコードをどうやってインクルードするか説明したのですけれど、覚えていますか？ それでは `models.py` のモデルを、インクルードしてみましょう。 `from .models import Post` という行を追加してみます。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

`models` の前にあるドットは *カレントディレクトリ* 、もしくは *カレントアプリケーション *のことです。 ` views.py `と `models.py `は、同じディレクトリに置いてあります。 だから、こんな風に`.`とファイル名だけを使って、簡単に記述することが出来るのです。（ファイル名の拡張子`.py `は必要ないです） そして、モデルの名前を指定してインポートします(この場合のモデルは `Post `ですね)。

さて、次にすべきことは、実際に `Post `モデルからブログの記事を取り出すことですが、それには `クエリセット `が必要です。

## クエリセット

もう、クエリセットの働きについては、知っていますよね。[Django ORM（クエリセット）](../django_orm/README.md) チャプター で勉強しました。

公開したブログ記事を `published_date `で並べ替えをしたいですね。これも、クエリセットの章でやったので、大丈夫ですね？

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

それでは `blog/views.py`をエディタで開いて、このコードを`def post_list(request)`で始まる関数の中に加えましょう。`from django.utils import timezone`をまず追加するのを忘れないでくださいね。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

最後に残っているのは、クエリセットを参照している変数` posts `をテンプレートに渡す作業です。テンプレートでの表示については次の章でやりましょう。

作成したクエリセットは、*変数* `posts `で参照できることに、注意しましょう。この 変数 posts を使って、クエリセットのデータにアクセスします。これから先 posts というと、このクエリセットのことです。

`render `関数では、既にパラメータとして `request `とテンプレートファイル `'blog/post_list.html' `が渡されています。リクエストというのは、インターネットを介してユーザから受け取った全ての情報が詰まったものです。最後のパラメータに注目してください。 ` {} `こんな風に書かれていますね。この中に指定した情報を、テンプレートが表示してくれます。{} の中に引数を記述する時は、名前と値をセットにしなくてはなりません。 表示させたいのはクエリセットのデータなので、 `posts` を指定しましょう。 :) `{'posts': posts}`という具合に、記述します。 注意して欲しいのは、シングルクォートです。 `:`（コロン） で区切られた、前の方の posts は、 シングルクォート で囲まれて、 'posts' になっていますよね。こちらが名前で、後ろの方の posts は値、クエリセットのことです。

最終的に `blog/views.py `は、以下の様になるはずです。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

どうでしたか？次は、このクエリセットをテンプレートで表示させるところを、やってみましょう。

Djangoのクエリセットについて、もっと知りたければこちらも読んでみてくださいね。 https://docs.djangoproject.com/ja/2.2/ref/models/querysets/