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

Go ahead, add a line that will import `blog.urls`. Note that we are using the `include` function here so you will need to add that import.

Your `mysite/urls.py` file should now look like this:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and looks for further instructions there.

## blog.urls

Create a new empty file named `urls.py` in the `blog` directory. All right! Add these first two lines:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/