# テンプレート内の動的データ

ポスト内容を保存する為の Post モデルは、 models.py に定義しました。ポストの一覧を表示する post_list は views.py にあり、そこにテンプレートも加わりました。 これらを準備しましたが、実際のところ、ポストをどうやってHTMLファイルに出力すればいいのでしょうか？ 大まかなイメージとしては、データベースに保存された記事を取り出して、テンプレートのHTMLファイルの中に行儀よく並べれば良さそうですね。

正確には、*ビュー *が モデルとテンプレートの橋渡しをしてくれます。 私達が作業している `post_list ` *ビュー *の場合、表示したいデータを取り出して、テンプレートファイルに渡すことになります。 どのモデルのデータを、どのテンプレートに表示させるかを、 *ビュー*に 記述します。

それでは、実際にやってみましょう。

まず` blog/views.py `を開きます。今のところ `post_list `*ビュー *は、以下のようになっているでしょう。

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

`models` の前にあるドットは *カレントディレクトリ* 、もしくは *カレントアプリケーション *のことです。 ` views.py `と `models.py `は、同じディレクトリに置いてあります。 This means we can use `.` and the name of the file (without `.py`). そして、モデルの名前を指定してインポートします(この場合のモデルは Post ですね).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## クエリセット

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

作成したクエリセットは、 変数 posts で参照できることに、注意しましょう。この 変数 posts を使って、クエリセットのデータにアクセスします。これから先 posts というと、このクエリセットのことです。

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. 表示させたいのはクエリセットのデータなので、 posts を指定しましょう). :) こんな風に、記述することになります。 {'posts': posts}. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

最終的に blog/views.py は、以下の様になるはずです。

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/1.11/ref/models/querysets/