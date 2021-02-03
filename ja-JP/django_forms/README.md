# Djangoフォーム

私たちのWebサイトで最終的にやりたいことは、投稿を追加したり編集したりするためのよい方法を作ることです。 `Django admin`はかなりいいですが、カスタマイズしたりかわいくいい感じにするのはちょっと大変です。 `フォーム` によってインターフェイスを完璧にコントロールできるようになります。想像するほとんど全てのことができます！

Djangoフォームのよいところは、フォームをゼロから定義できたり、フォームの結果をモデルに保存できる`ModelForm`を作れたりするところです。

これはまさに私たちがやりたいことです：`Post`モデルのためのフォームを作ります。

Djangoの他の重要なパーツと同様に、フォームは自身のファイルがあります: `forms.py`

これは`blog`ディレクトリの下にforms.pyの名前で作る必要があります。

    blog
       └── forms.py
    

このファイルをエディタで開き、次のコードを入力してください。

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

最初にDjangoのformsをインポート（`from django import forms`）し、`Post`モデルもインポート（`from .models import Post`）する必要があります。

`PostForm`とは何かと思うかもしれませんが、これはフォームの名前です。 このフォームが `ModelForm` の一種だとDjangoに伝える必要があります (Djangoが私たちのためにいくつか魔法をかけられるように)。`forms.ModelForm`がその役割を果たします。

次に`class Meta`ですが、ここでDjangoにフォームを作るときにどのモデルを使えばいいか (`model = Post`) を伝えます。

最後にフォームのフィールドに何を置くか書きます。 今回は、私たちは`title`（タイトル）と `text`（本文）のみをフォームで使用します。 `author` は現在ログインしている人（あなた）です。 `created_date` は（コードによって）自動的に投稿を作った日時が設定されます。

ひとまずこれでおしまいです！あとはフォームを*ビュー*で使い、それをテンプレート内に表示しさえすればいいです。

もう一度、ページへのリンク、URL、ビューとテンプレートを作ります。

## フォームにおけるページへのリンク

`blog/templates/blog/base.html` をエディタで開きましょう。`page-header` と名付けた `div` 中に次のリンクを追加します：

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

新しいビュー` post_new `を呼び出すことに注意してください。 ` "glyphicon glyphicon-plus" `クラスは、使用しているBootstrapテーマによって提供され、プラス記号を表示します。

行を追加すると、このような html ファイルになります。

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

ファイルを保存して、ページ http://127.0.0.1:8000 をリロードすると見覚えのある `NoReverseMatch` エラーが表示されると思います。実際にそうなってますか？いいですね！

## URL

`blog/urls.py`をエディタで開き、次の行を追加します。

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

すると最終的なコードは次のようになります:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

サイトをリロードした後、`AttributeError`が出ます。`post_new`ビューの実装がないからです。ファイルに追加してみましょう。

## post_new ビュー

`blog/views.py`をエディタで開き、`from`の行の後に次の内容を追加してみましょう。

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

その後に*ビュー*を追加します。

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

`Post`フォームを新しく作るには、`PostForm()`を呼び出し、それをテンプレートに渡す必要があります。 あとでこの *ビュー* に戻ってきますが、今はフォームのためのテンプレートをすぐに作ってしまいましょう。

## テンプレート

`blog/templates/blog`ディレクトリに`post_edit.html`ファイルを作り、エディタで開きましょう。フォームを動かすにはいくつかやることがあります。

* フォームを表示する必要があります。 私たちは（例えば）{% raw %}`{{ form.as_p }}`{% endraw %} でこれを行うことができます。
* 上記の行は HTMLのformタグでラップする必要があります：`<form method="POST">...</form>`
* `Save` ボタンが必要です。これをHTMLのbuttonタグで行います：`<button type="submit">Save</button>`
* 最後に`<form ...>` タグの開始直後に、 `{% raw %}{% csrf_token %}{% endraw %}`を追加する必要があります。 フォームをセキュアにするためこれは非常に重要です！ これを忘れると、Djangoはフォームを保存しようとすると文句を言うでしょう：

![CSFR 禁止のページ](images/csrf2.png)

では、`post_edit.html` のHTMLがどのようになるか見てみましょう:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

更新をしてみましょう。やった！フォームが表示されます。

![New form](images/new_form2.png)

ちょっと待ってみて下さい。`title` と `text` フィールドに何か入力して保存するとどうなりますか？

何も起きません！もう一度同じページに戻りテキストはどこかに行ってしまいました… そして新しい投稿は追加されていません。何がいけなかったのでしょうか？

答えは: 何も間違ってない、です。*ビュー* でもう少し作業を行う必要があります.

## フォームを保存する

`blog/views.py` をもう一度エディタで開きます。現在の `post_new` ビューはこうなっています。

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

フォームを送信したとき、同じビューに戻されていましたが、このとき`request`、もっと詳しくいうと `request.POST` にデータが追加されています (このPOSTという名前は、ブログの投稿を表す "post" とは関係ありません。このデータは送られてきたもの、というコトと関係しています) 。 HTMLファイルの `<form>` タグで、`method="POST"` という変数があったのを覚えていますか？ これによってフォームのすべてのフィールドは今 `request.POST` にあります。 `POST` という名前を何か別のものに変えることはできません (他に唯一の有効な `method` の値は `GET` ですが、その違いを説明する時間がありません) 。

私たちの *ビュー* では、扱わなくてはならない２つの別々のシチュエーションがあります: １つ目は、最初にページにアクセスしてきた時で空白のフォームが必要な場合。２つ目はすべてのフォームデータが入力された状態で*ビュー*に戻ってくる場合です。 したがって条件分岐を追加する必要があります（そのために`if`を使います）：

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

ドット `[...]` の部分を埋めていきましょう。 `method`が`POST`の場合、フォームのデータを使って`PostForm`を構築します。 私たちはそれを次のようにします：

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

次にフォームの値が正しいかどうかをチェックします（すべての必須フィールドが設定され、不正な値が送信されないこと）。 `form.is_valid()` で行います。

フォームをチェックして、フォームの値が有効であれば保存できます。

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

基本的にここでは2つのことを行います。まず `form.save` でフォームを保存することと author を追加することです (`PostForm` 内に `author` フィールドがありませんし、このフィールドは必須です) 。 `commit=False` は `Post` モデルをまだ保存しないという意味です。保存前に author を追加したいので。 ほとんどの場合、`commit=False`なしで`form.save()`を使用しますが、この場合はそれを指定する必要があります。 `post.save()`は変更を保存し（作成者を追加しつつ）、新しいブログ投稿が作成されます！

最後に、新しく作成された投稿の `post_detail` ページを表示できれば良いですよね? そのために次のインポートを追加します:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

ファイルの先頭に追加してください。これで新しく作成された投稿の `post_detail` ページに移動する処理を書けます。

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` は移動したいビューの名前です。 この *ビュー* では `pk` 変数が必須であることを覚えていますか? ビューにそれを渡すため、`pk=post.pk`を使います。この `post` は新しく作られたブログの投稿です！

ふー、たくさんのことを話してきましたが、そろそろ *ビュー* の全体がどんな感じか見てみたい頃じゃないでしょうか？

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

では動作確認してみましょう。 http://127.0.0.1:8000/post/new/ に行き、 `title` と `text` を追加し、保存すると…… じゃじゃーん！ 新しいブログ投稿が追加され、post_detail にリダイレクトされます！

投稿を保存する前に公開日をセットしていることに気づいたかもしれません。後ほど、**Django Girls Tutorial: Extensions**にて *公開ボタン* を導入します。

素晴らしい！

> 最近までDjango adminを使ってきたので、システム上で今まだログイン状態かと思います。 いくつかの状況ではログアウト状態になることがあります(ブラウザを閉じる、DBを再起動するなど..)。 投稿を作成するときに、ログインユーザーがわからないというエラーが発生した場合は、管理ページhttp://127.0.0.1:8000/admin にアクセスして再度ログインしてください。 その問題は一時的に解決します。 メインチュートリアルの後 **Homework: add security to your website!** の章に恒久的な対策がありますので宿題として取り組んでみてください。

![ログインエラー](images/post_create_error.png)

## フォームのバリデーション(検証)

ここではDjangoのフォームのクールなところを紹介します。 ブログの投稿は `title` と `text` のフィールドが必要です。 `Post` モデルではこれらのフィールドがなくてもよいとは書いておらず (`published_date` とは対照的に)、Djangoはその場合、それらのフィールドには何らかの値が設定されることを期待します。

`title` と `text` を入力せずに保存してみましょう。何が起こるでしょうか?

![フォームのバリデーション(検証)](images/form_validation2.png)

Djangoはフォームのすべてのフィールドが正しいことを検証してくれます。気が利くでしょう?

## フォームの編集

今や、私たちはどのように新しい投稿を追加するか知っています。 しかし既存のデータを編集するためはどうすれば良いのでしょうか? それは先ほど行ったことと非常に似ています。 すぐにいくつかの重要なものを作成してみましょう。 （もしわからない場合、コーチに尋ねるか、もしくはすでに手順をカバーしているので、前の章を見てください）

`blog/templates/blog/post_detail.html` をエディタで開いて次の行を追加します

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

テンプレートは次のようになります:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

`blog/urls.py`をエディタで開き、次の行を追加します。

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

テンプレート `blog/templates/blog/post_edit.html` を再利用します。そして残るは*ビュー*です。

`blog/views.py` をエディタで開いて次の内容をファイルの最後に追加します：

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

`post_new` とほとんど同じに見えますか? しかし完全に同じではありません。 まず `urls` から追加の `pk` パラメータを渡します。 次に編集したい`Post` モデルを `get_object_or_404(Post, pk=pk)` で取得し、フォームを作るときは以下の2つのケースのように、その投稿を`instance（インスタンス）`として渡します。フォームを保存するときは…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…この投稿を編集するために、ただフォームを開く場合は:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

よし、ちゃんと動くか試してみましょう！`post_detail` ページにいきましょう。そこの右上に [編集] ボタンがあるはずです：

![編集ボタン](images/edit_button2.png)

クリックするとブログ投稿のフォームが表示されると思います：

![編集フォーム](images/edit_form2.png)

あとはお気軽にタイトルやテキストを変更して保存してください！

おめでとう！アプリケーションが完成しました。

Djangoのフォームについてもっと知りたい場合、Djangoのドキュメントを読んでください。https://docs.djangoproject.com/ja/2.2/topics/forms/

## セキュリティ

リンクをクリックするだけで新しい投稿を作成できることは素晴らしいことです！ しかし、今、あなたのサイトにアクセスした人は誰でも新しいブログ投稿を作成することができます。それはおそらくあなたが望むものではありません。 ボタンはあなたのためには表示されますが、他の人には表示されないようにしましょう。

`blog/templates/blog/base.html` をエディタで開き、`page-header` と名付けた `div` とそこに以前に入力したアンカータグを見つけます。 これは次のようになっています。

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

これに`{% if %}`タグを追加し、管理者でログインしているユーザーのみにリンクを表示します。 今は、あなただけです！ `<a>` タグを以下のように変更します：

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

この`{% if %}`は、ページをリクエストしているユーザーがログインしている場合にのみ、リンクがブラウザに送信されるようにします。 これは新しい投稿の作成を完全に保護するものではありませんが、それは良い第一歩です。 私たちは拡張レッスンでより多くのセキュリティをカバーします。

詳細ページに追加した編集アイコンを覚えていますか？ 他の人が既存の投稿を編集できないように、同じ変更を追加したいと思います。

`blog/templates/blog/post_detail.html` をエディタで開いて次の行を見つけてください：

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

以下のように変更してください：

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

あなたはログインしている可能性が高いので、ページを更新しても、何も変わらないかもしれません。 ただし、別のブラウザやシークレットウィンドウ（Windows Edgeでは「InPrivate」と呼ばれます）でページを読み込むと、リンクが表示されず、アイコンも表示されないでしょう！

## もう一つ: デプロイの時間です!

ではPythonAnywhere上で動作するかを確認しましょう。再度デプロイします。

* まず、Githubにあなたの新しく書いたコードをCommitして、Pushしてみましょう。

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* それから、[PythonAnywhereのbashコンソール](https://www.pythonanywhere.com/consoles/)で：

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(`<your-pythonanywhere-domain>`の部分を、自分の実際のPythonAnywhereのサブドメイン名に山カッコをはずして置き換えることを忘れずに)

* 最後に、[Webページ](https://www.pythonanywhere.com/web_app_setup/) に飛んで（コンソールの右上のメニューボタンを使ってもいいですね）それから **Reload** を押しましょう。 変更を見るためにあなたのブログ https://subdomain.pythonanywhere.com を再読み込みしましょう。

And that should be it. Congrats! :)