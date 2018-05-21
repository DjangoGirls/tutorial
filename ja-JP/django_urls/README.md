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

すべてのポストした記事の数を分けて記述することは非常に面倒です。 正規表現では、それらの数字を抽出し、URLに一致したパターンが作れます。それは、`^post/(\d+)/$` と表せます。 Let's break this down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the URL (right after `^`)
* (\d+)は１つか複数の数字を示します。取り出したい番号のことです。
* **/** tells Django that another `/` character should follow
* $は/で終わる後に示します。URLの終わりを示します。

## Your first Django URL!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be the home page of our blog and to display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import URLs from our `blog` application to the main `mysite/urls.py` file.

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Mysite/urls.pyファイルはこのようになります：

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

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

Writing regular expressions in Python is always done with `r` in front of the string. これは文字列がPythonで意味しない特別な文字であり、正規表現では意味する文字を含むというヒントになります。

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

その後、最初のURLパターンを追加します。

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) – so only an empty string will match. 正規表現での^は「文字列の開始」を意味します。ここからパターンマッチを始めます。 $は「文字列の終端」を意味していて、ここでパターンマッチを終わります。 この2つの記号を並べたパターンがマッチするのは、そう、空の文字列です。といっても、DjangoのURL名前解決では'http://127.0.0.1:8000/'は除いてパターンマッチするので、このパターンは'http://127.0.0.1:8000/'自体を意味します。つまり、'http://127.0.0.1:8000/'というURLにアクセスしてきたユーザに対して`views.post_list`を返すように指定していることになります。

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![エラー](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> Django URLconfについて知りたい場合は、公式のドキュメントを見て下さい： https://docs.djangoproject.com/en/1.11/topics/http/urls/