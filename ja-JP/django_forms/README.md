# Djangoのフォーム

私たちのWebサイトで最終的にやりたいことは、記事を追加したり編集したりするためのよい方法を作ることです。 `Django admin`はかなりいいですが、カスタマイズしたりかわいくいい感じにするのはちょっと大変です。 `フォーム`によってインターフェイスに対して完璧な力を持てるようになります。想像するほとんど全てのことができます！

Djangoフォームのよいところは、フォームをゼロから定義できたり、フォームの結果をモデルに保存できる`ModelForm`を作れるところです。

これはまさに私たちがやりたいことです：`Post`モデルのためのフォームを作ります。

Djangoの他の重要なパーツと同様に、フォームは自身のファイルがあります: `forms.py`

これは`blog`ディレクトリの下にforms.pyの名前で作る必要があります。

    blog
       └── forms.py
    

forms.pyファイルを開き、次のコードをタイプしてください。

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

最初にDjangoのformsをインポート (`from django import forms`) し、もちろん`Post`モデルもインポート (`from .models import Post`) する必要があります。

`PostForm`とは何かと思うかもしれませんが、これはフォームの名前です。 このフォームが `ModelForm` の一種だとDjangoに伝える必要があります (Djangoが私たちのためにいくつか魔法をかけられるように)。`forms.ModelForm`がその役割を果たします。

次に`class Meta`ですが、ここでDjangoにフォームを作るときにどのモデルを使えばいいか (`model = Post`) を伝えます。

最後にフォームのフィールドに何を置くか書きます。 このシナリオで、私たちは`title` と `text`の部分でタイトルと本文を公開します。 `author`は現在ログインしている人（あなた）です。 `created_date` は自動的に記事ポストを書いた時間が設定されます。

そしてそうです！今私たちがやりたいのはフォームを*view*で使い、それをテンプレート内に表示することです。

もう一度ファイルを作ります。：ページへのリンク、URL、ビューとテンプレートです。

## フォームにおけるページへのリンク

`blog/templates/blog/base.html`を開きましょう。`page-header`と名付けた`div`中に次のリンクを追加します:

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

ファイルを保存して、ページ http://127.0.0.1:8000 をリロードします。すでに見覚えのある `NoReverseMatch` エラーが表示されます？

## URL

blog/urls.pyを開き、次の内容を追加します。

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
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

`blog/views.py`を開きます。`from`の行の後に次の内容を追加してみましょう。

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

`blog/templates/blog`ディレクトリに`post_edit.html`ファイルを作りましょう。フォームを動かすにはいくつかやることがあります。

* フォームを表示する必要があります。 私たちは（例えば）{％ raw ％}`{{ form.as_p }}`{％ endraw ％}でこれを行うことができます。
* 上記の行は HTMLのformタグでラップする必要があります: `<form method="POST">...</form>`.
* `Save` ボタンが必要です。これをHTMLのbuttonタグで行います: `<button type="submit">Save</button>`.
* 最後に`<form ...>` タグを開いて、 `{% raw %}{% csrf_token %}{% endraw %}`を追加する必要があります。 フォームをセキュアにするためこれは非常に重要です！ これを忘れると、Djangoはフォームを保存しようとすると文句を言うでしょう：

![CSFR Forbidden page](images/csrf2.png)

では、`post_edit.html` のHTMLがどのようになるか見てみましょう:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

更新をしてみましょう。やった！フォームが表示されます。

![New form](images/new_form2.png)

ちょっと待ってみて下さい。`title` と `text` フィールドに何か入力して保存するとどうなりますか？

何もおきません！もう一度同じページ戻りテキストはどこかに行ってしまいました…… そして新しい投稿は追加されていません。何がいけなかったのでしょうか？

答えは: 何も間違ってない、です。*ビュー* でもう少し作業を行う必要があります.

## Formをsaveする

`Blog/views.py` をもう一度開きます。現在は `post_new` ビューはこうなっています。

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

フォームを送信したとき、同じビューに戻されていましたが、このとき`request`、もっと詳しくいうと `request.POST` にデータが追加されています (このPOSTという名前はブログ投稿 "post" とは関係ありません。このデータは送られてきたもの、というコトと関係しています) 。 HTMLファイル formの定義はPOSTメソッドを使うのを覚えていますか？ フォームの全てのフィールドがPOSTリクエストです。 POST の名前を他の名前に変更することはできません (それを変更する唯一の方法は method に GET を指定することですが、それがなぜ間違いであるかを話す時間がありません)

*view*には、処理する2つの状況があります。最初にページにアクセスしたときに空白のフォームが必要な場合、2番目に*view*と入力したすべてのフォームデータが表示されます。 それでは [...] の部分を埋めていきます):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

`[...]`のドットを記入してください。 `method`が`POST`の場合、フォームのデータを使って`PostForm`を構築します。 私たちはそれを次のようにします：

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

簡単ですね! 次にフォームの値が正しいかどうかをチェックします（すべての必須フィールドが設定され、全く誤った値が保存されていないことを）form.is_valid() を使うことでチェックできます.

フォームをチェックして、フォームの値が有効であれば保存できます。

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

基本的にここでは2つのことを行います。まず form.save でフォームを保存することと author を追加することです(まだ PostForm 内に author フィールドがありませんし、このフィールドは必須です). commit=False は Post モデルをまだセーブしません。ではauthorを追加します。commit=False を指定せず form.save() を実行します。 ほとんどの場合、`commit = False`なしで`form.save()`を使用しますが、この場合はそれを指定する必要があります。 `post.save()`は変更を保存し（作成者を追加する）、新しいブログ投稿が作成されます。

最後に、新しく作成された記事の post_detail ページを表示できれば良いですよね? そのために次のインポートを追加します:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

ファイルの先頭に追加します。これでようやく、新しく作成されたポストのための post_detail ページに移動する処理を書けます。

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

blog.views.post_detail は新しく作成されたポストのために post_detail ページに移動するためのビューです。 この view では pk 変数が必須であることを覚えていますか? post では新しいブログ記事が作成されます。

OK, たくさんのことを説明しました。全体の view は以下のようになります。

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

では動作確認してみます。 http://127.0.0.1:8000/post/new/ に行き、 title と text を追加し、保存します。 新しいブログ記事が追加され、post_detail にリダイレクトされます！

おそらくあなたは日付が設定されていないことに気づいたことでしょう。それについては Django Girls Tutorial: Extensions 内の publish button をみてください。

素晴らしい！

> Djangoの管理インターフェースを使用しているので、システムは現在ログインしています。 いくつかの状況ではログアウト状態になることがあります(ブラウザを閉じる、DBを再起動するなど..)。 投稿を作成するときに、ログインユーザーがわからないというエラーが発生した場合は、管理ページhttp://127.0.0.1:8000/adminにアクセスして再度ログインしてください。 その問題は一時的に解決します。 メインチュートリアルの後 Homework: add security to your website! の章に恒久的な対策がありますので宿題として取り組んでみてください。

![Logged in error](images/post_create_error.png)

## フォームのバリデーション(検証)

ここではDjangoのフォームのクールなところを紹介します。 ブログのポストは title と text のフィールドが必要です。 Post モデルでは、これらのフィールドがなくてもよいとは書いておらず(デフォルトの値が設定されている published_date とは対照的に)、Djangoではその場合、それらのフィールドには何らかの値が設定されないとエラーが起こるようになっています。

title と text を入力せずに保存してみましょう。何が起こるでしょうか?

![フォームのバリデーション(検証)](images/form_validation2.png)

Djangoはフォームのすべてのフィールドが正しいことを検証してくれます。気が利くでしょう?

## フォームの編集

今、私たちは新しいフォームを追加する方法を知っています。 しかし既存のデータを編集するためはどうすれば良いのでしょうか? それは先ほど行ったことと非常に似ています。 すぐにいくつかの重要なものを作成してみましょう。 （もしわからない場合、コーチに尋ねるか、もしくはすでに手順をカバーしているので、前の章を見てください）

blog/templates/blog/post_detail.html を開いて次の行を追加します

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

blog/urls.py には次の行を追加します:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

テンプレート blog/templates/blog/post_edit.html を再利用します。そしてviewを追加します.

blog/views.py を開いて次をファイルの最後に追加します:

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

post_view とほとんど同じに見えますか? しかし完全に同じではありません。 まずURLから pk パラメータを渡します。次に Post モデルを get_object_or_404(Post, pk=pk) で取得します。 その後フォームを保存する際、この記事をインスタンスとしてフォームを作成します。

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

そしてこの記事でフォームを開き編集します。

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Ok, 動作確認しましょう。 post_detail ページにいきます。そこの右上に [編集] ボタンがあるはずです:

![Edit button](images/edit_button2.png)

クリックするとブログの記事にフォームが表示されます:

![フォームの編集](images/edit_form2.png)

あとはタイトルやテキストを変更して保存してください。

おめでとう！アプリケーションが完成しました。

Djangoのフォームについてもっと知りたい場合、Django Projectのドキュメントを読んでください: https://docs.djangoproject.com/ja/2.0/topics/forms/

## セキュリティ

リンクをクリックするだけで新しい投稿を作成できることは素晴らしいことです！ しかし、今、あなたのサイトにアクセスした人は誰でも新しいブログ投稿を作成することができます。それはおそらくあなたが望むものではありません。 ボタンはあなたのためには表示されますが、他の人には表示されないようにしましょう。

` blog / templates / blog / base.html `で、` page-header ` ` div `とそれ以前に入力したアンカータグを見つけます。 これは次のようになります。

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

これに`{% if %}`タグを追加すると、管理者にログインしているユーザーのみにリンクを表示します。 今は、あなただけです！ これで、`<button>` タグは以下のようになります：

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

この`{% if %}`は、ページをリクエストしているユーザーがログインしている場合にのみ、リンクがブラウザに送信されるようにします。 これは新しい投稿の作成を完全に保護するものではありませんが、それは良い第一歩です。 私たちは拡張レッスンでより多くのセキュリティをカバーします。

詳細ページに追加した編集アイコンを覚えていますか？ 同じ変更を追加したいので、他の人が既存の投稿を編集することはできません。

`blog/templates/blog/post_detail.html` を開いて次の行を追加します:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

これに変更してください：

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

あなたがログインしている可能性が高いので、ページを更新すると、別のものは表示されません。 ただし、別のブラウザやシークレットウィンドウ（Windows Edgeでは「InPrivate」と呼ばれます）にページを読み込むと、リンクが表示されず、アイコンも表示されません。

## もう一つ: deployの時間です!

ではPythonAnywhere上で動作するかを確認しましょう。再度デプロイします。

* まず、Githubにあなたの新しく書いたコードをCommitして、Pushしてみましょう。

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* そうすると、PythonAnywhereのbashコンソールで見ると：

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(`<your-pythonanywhere-username>`の部分を、自分の実際のPythonAnywhereのユーザー名に角カッコをはずして置き換えることを忘れずに)

* 最後に、Webタブに行って、リロードします.

そしてdeployします! おめでとうございます :)