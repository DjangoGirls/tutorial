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
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

ご覧のとおり、Djangoは既にこのようなものを置いてくれています。

三重クオート（ `'''` や `"""` ）で囲まれた行は、docstringとよばれるコメント行です。ファイル、クラス、またはメソッドの先頭に記述して、それが何をするかを説明するのに用います。 これはPythonによって実行されない行です。

前の章で訪れたadminのURLについてはすでに書いてありますね。

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

`admin/` で始まる全てのURLについて、Djangoが返すべき*view*をこの行で指定しています。 今回の場合、adminで始まるURLをたくさん作ることになりますが、その全てをこの小さいファイルに書くようなことはしません。この方がきれいで読みやすいですし。

## 正規表現

どうやってDjangoはビューとURLを紐づけるのかと思うかもしれません。 そうです、この部分はひとひねりしています。 Djangoは `regex`、正規表現を使います。 Regexは多くの（本当に多くの）検索パターンのルールを持っています。 正規表現は突きつめると高度な話になりますので、どのように動作しているのか詳しい仕組みまではここでは説明しません。

どのようにパターンが作られるかを理解したいなら、こちらにプロセスの例があります。探し求めているパターンを表現する限定したルールの一部分だけを説明するとこんな感じです：

* `^` テキストの先頭を示す
* `$` テキストの末尾を示す
* `\d` 数字を示す
* `+` 前のアイテムを1回以上繰り返すことを示す
* `()` パターンの一部を取得する

URL定義内で、ほかのものはすべて文字通り受け取られます。

`http://www.mysite.com/post/12345/` このようなウェブサイトのアドレスを想像してみてください。この `12345` の部分がポストした記事の番号です。

すべてのポストした記事の数を分けて記述することは非常に面倒です。 正規表現では、それらの数字を抽出し、URLに一致したパターンが作れます。それは、`^post/(\d+)/$` と表せます。 １つずつそれが何を示しているか紐解いてみましょう。

* **^post/** は `post/` で始まるURL（^のすぐ後）を示します。
* **(\d+)** は１つか複数の数字を示します。取り出したい番号のことです。
* **/** は別の文字列が続くことを示します。
* **$** は `/` で終わることを示します。URLの終わりを示します。

## Your first Django URL!

さあ最初のURLを作りましょう！'http://127.0.0.1:8000/' はブログの入口ページなので、投稿したブログポストのリストを表示したいところです。

`mysite/urls.py` ファイルは簡潔なままにしておきたいので、`mysite/urls.py` では`blog` アプリからURLをインポートするだけにしましょう。

まず、`blog.urls` をインポートする行を追加しましょう。`include` 関数を使ってインポートします。

`mysite/urls.py` ファイルはこのようになります：

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

これでDjangoは'http://127.0.0.1:8000/'に来たリクエストは `blog.urls` へリダイレクトするようになり、それ以降はそちらを参照するようになります。

Pythonで正規表現を書く時は、常に `r` の後に文字を書きます。 これは、文字列がPythonで意味しない特別な文字であり、正規表現では意味する文字を含む、ということを表します。

## blog.urls

`blog` ディレクトリの下に、新しく `urls.py` という空のファイルを作って下さい。そして最初の2行を以下のように書きます：

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

これはDjangoの `url` 関数と、`blog` アプリの全ての `views`（といっても、今は一つもありません。すぐに作りますけど！）をインポートするという意味です。

その後に、最初のURLパターンを追加します：

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

これは `^$` というパターンのURLを `post_list` という `view` に割り当てたことを意味します。 `^$` という正規表現は、空の文字列にマッチすることを表しています。ただそれだけです。 ご覧のとおり、Django URLリゾルバでは 'http://127.0.0.1:8000/' はURLの一部に含めません。 このパターンは、'http://127.0.0.1:8000/' というアドレスに訪れたら、`views.post_list` を表示させるという動作を導きます。

最後の `name='post_list'` は、ビューを識別するために使用する URL の名前です。 ここでは、ビューと同じ名前をつけていますが、全く違う名前をつけることもできます。 ここで名付けたURLはこのチュートリアルの後の方で使用するので、URLに対してきちんと名前をつけておきましょう。この名前はユニーク（一意）にしておく必要があります。また、シンプルにしておいた方が覚えやすいですよ。

では、http://127.0.0.1:8000/ を開いて結果を見てみましょう。残念ながら'web page not available'というメッセージが表示されます。 これはサーバ（ `runserver` ってタイプしたのを覚えていますか？）が動いていないからです。 なぜこうなったのかを知るためにサーバのコンソール画面を見てみましょう。

![エラー](images/error1.png)

エラーが表示されていますね。でも心配しないで。これはむしろ、結構便利なものなんですよ：ここでは、**'post_list' というアトリビュートがない**ことを知らせてくれています。 Djangoは、その名前の *ビュー* を探してこようとしますが、まだ作っていませんでした。 現時点では、`/admin/` も動作していないと思います。 なにもおかしいことはしていません。次の章ではビューを作っていきましょう。

> Django URLconfについて知りたい場合は、公式のドキュメントを見て下さい： https://docs.djangoproject.com/en/1.11/topics/http/urls/