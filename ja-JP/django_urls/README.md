# Django urls

最初のウェブページを立てましょう、あなたのブログです。始めに、DjangoのURLについて少し学びましょう。

## URLとは？

URLは簡単に言えばWEB上のアドレスです。 サイトのURLは、ブラウザのアドレスバーで見ることができます。 （そう、 `127.0.0.1:8000` や `http://djangogirls.com` がURLです。）

![URL](images/url.png)

インターネット上のすべてのページには、独自のURLが必要です。 それによって、これから作るアプリケーションが、URLを指定してアクセスしてきたユーザに、何を見せたらいいのかわかるのです。 Djangoでは `URL_conf`（URL設定）と呼ばれるものを使います。 これは、要求されたURLに合わせてDjangoがどのviewを返したらいいか判断する仕組みのことです。

## How do URLs work in Django?

`mysite/urls.py` を開いて、中身をみてみると：

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

ご覧のとおり、Djangoは既にこのようなものを置いてくれています。

三重クオート（ `'''` や `"""` ）で囲まれた行は、docstringとよばれるコメント行です。ファイル、クラス、またはメソッドの先頭に記述して、それが何をするかを説明するのに用います。 これはPythonによって実行されない行です。

前の章で訪れたadminのURLについてはすでに書いてありますね。

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

`admin/` で始まる全てのURLについて、Djangoが返すべき*view*をこの行で指定しています。 今回の場合、adminで始まるURLをたくさん作ることになりますが、その全てをこの小さいファイルに書くようなことはしません。この方がきれいで読みやすいですし。

## あなたの初めてDjango URL!

さあ最初のURLを作りましょう！'http://127.0.0.1:8000/' をブログの入口ページにして、投稿したブログポストのリストを表示するようにしたいと思います。

`mysite/urls.py` ファイルは簡潔なままにしておきたいので、`mysite/urls.py` では`blog` アプリからURLをインポートするだけにしましょう。

まず、`blog.urls` をインポートする行を追加しましょう。`include` 関数を使ってインポートします。

`mysite/urls.py` ファイルはこのようになります：

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

これでDjangoは'http://127.0.0.1:8000/'に来たリクエストは `blog.urls` へリダイレクトするようになり、それ以降はそちらを参照するようになります。

## blog のURL

`blog` ディレクトリの下に、新しく `urls.py` という空のファイルを作って下さい。そして最初の2行を以下のように書きます：

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

これはDjangoの `url` 関数と、`blog` アプリの全ての `views`（といっても、今は一つもありません。すぐに作りますけど！）をインポートするという意味です。

その後、最初のURLパターンを追加します。

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

見てのとおり、`post_list` という名前の `ビュー` をルートURLに割り当てています。 このURLパターンは空の文字列に一致し、DjangoのURL名前解決はフルパスの前半にくっつくドメイン名（つまり、http://127.0.0.1:8000/ の部分）を無視します。 このパターンは誰かがあなたのWebサイトの 'http://127.0.0.1:8000/' というアドレスにアクセスしてきたら `views.post_list` が正しい行き先だということをDjangoに伝えます。

最後の `name='post_list'` は、ビューを識別するために使われるURL の名前です。 これはビューと同じ名前にすることもできますが、全然別の名前にすることもできます。 プロジェクトでは名前づけされたURLを後で使うことになるので、アプリのそれぞれのURLに名前をつけておくのは重要です。また、URLの名前はユニークで覚えやすいものにしておきましょう。

もし今 http://127.0.0.1:8000/ にアクセスしたら、'web page not available' のようなメッセージが出るでしょう。 これはサーバー（ `runserver` ってタイプしたのを覚えていますか？）が動いていないからです。 なぜこうなったのかを知るためにサーバーのコンソール画面を見てみましょう。

![Error](images/error1.png)

エラーが表示されていますね。でも心配しないで。これはむしろ、結構便利なものなんですよ：ここでは、**'post_list' という属性がない**ことを知らせてくれています。 That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/