{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# アプリケーションを拡張しよう

もう、ウェブサイトを作るのに必要な全ての章は終わりました。どのようにモデル、URL、ビュー、テンプレートを書いたら良いかわかっていますし、またウェブサイトを素敵にするやり方もわかります。

さあ練習しましょう！

ブログに最初に必要なものはおそらく、記事を表示するページですよね。

もう`Post`モデルが入っていますから、`models.py`は追加する必要はありません

## 投稿の詳細へのテンプレートリンクを作成する

`blog/templates/blog/post_list.html`ファイルにリンクを追加していきましょう。 コードエディタで開いたら、次のようになっていますよね： {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}投稿リストの投稿のタイトルから投稿の詳細ページへのリンクを作りたいです。 投稿の詳細ページにリンクするように`<h1><a href="">{{ post.title }}</a></h1>`を変更しましょう。{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}不思議な` {％ url 'post_detail' pk = post.pk ％}`を説明します。 気づいたかもしれませんが、`{% %}`という表記はDjangoのテンプレートタグを使用していることを意味しています。 今私たちはこれをURLを作るために使います！{% endraw %}

`post_detail`の部分は、Djangoが`blog/urls.py`に書かれた name=post_detail のURLを待ち受けることを表しています。

そして`pk=post.pk`についてはどうでしょうか？ `pk`はプライマリキーの略で、データベースの各レコードのユニークな名前です。 `Post`モデルでプライマリキーを指定しなかったので、Djangoは私たちのために1つのキーを作成し（デフォルトでは、各レコードごとに1ずつ増える数字で、たとえば1、2、3です）、各投稿に`pk`というフィールド名で追加します。 `Post`オブジェクトの他のフィールド（`title`、`author`など）にアクセスするのと同じ方法で、`post.pk`と書くことによってプライマリキーにアクセスします！

さて、私たちが http://127.0.0.1:8000/ に行くとエラーが出ます（知っての通り、URLも`post_detail`の*ビュー*もまだ作っていないので）。 このようになります：

![NoReverseMatch error](images/no_reverse_match2.png)

## 投稿の詳細へのURLを作成する

`post_detail` *ビュー*用に`urls.py`にURLを作成しましょう！

最初の投稿の詳細がこの**URL**で表示されるようにします：http://127.0.0.1:8000/post/1/

投稿の内容を表示する`post_detail`という*ビュー*をDjangoに示すように、`blog/urls.py`ファイルでURLを作りましょう。 `blog/urls.py`をコードエディタで開いて、`path('post/<int:pk>)/', views.post_detail, name='post_detail'),`という行を追加しましょう。ファイルは次のようになるでしょう。

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

`post/<int:pk>/` の部分はURLパターンを指定しています。それについて説明しましょう:

- `post/` はURLが **post** に続けて **/** で始まることを意味します。ここまでは順調ですね。
- `<int:pk>` – この部分はトリッキーです。これはDjangoは整数の値を期待し、その値が`pk`という名前の変数でビューに渡されることを意味しています。
- `/` – それからURLの最後に再び **/** が必要です。

つまり、ブラウザに`http://127.0.0.1:8000/post/5/`を入力すると、Djangoは`post_detail`という*ビュー*を探していると理解します。そして`pk`が`5`という情報をその*ビュー*に転送します。

よし、私たちは `blog/urls.py` に新しい URL パターンを追加しました！ ページを更新しましょう：http://127.0.0.1:8000/ ドーン！ サーバーが再び実行を停止しました。 コンソールを見てください - 予想通り、もう一つのエラーがあります！

![AttributeError](images/attribute_error2.png)

あなたは次のステップが何であるか覚えていますか？ ビューを追加する！ですね。

## 投稿の詳細ビューを追加する

今回は*ビュー*に追加のパラメータ`pk`が与えられます。 私たちの*ビュー*はそれを受け取る必要がありますね？ そこで関数を`def post_detail(request, pk):`として定義します。 urlsで指定した名前（`pk`）とまったく同じ名前を使用する必要があることに注意してください。 この変数を省略するのは正しくないのでエラーになってしまいます！

今、私たちは1つだけブログ投稿を取得したいと考えています。 これを行うには、次のようなクエリセットが使用できます。

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

しかし、このコードには問題があります。 与えられた`プライマリキー`（`pk`）を持つ`Post`が存在しない場合、とてもダサいエラーが発生します。

![DoesNotExist error](images/does_not_exist2.png)

私たちはそれを望んでいません！ しかし幸運にもDjangoにはそれを処理するものがあります：`get_object_or_404` です。 与えられた`pk`の`Post`がない場合、前よりもっとよい `Page Not Found 404` ページが表示されます。

![Page not found](images/404_2.png)

いい知らせとして実際には自分の`Page not found`ページを作って自分の好きなようにきれいにすることができます。しかしそれは今すごく重要ではないので、私たちはそれをスキップします。

よし、今こそ*ビュー*を`views.py`ファイルに追加するときです！

`blog/urls.py`では`views.post_detail`というビューを参照する`post_detail`という名前のURLルールを作成しました。 これは、Djangoが`blog/views.py`内の`post_detail`というビュー関数を待っていることを意味します。

`blog/views.py`をコードエディタで開き、他の`from`行の近くに次のコードを追加する必要があります。

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

ファイルの最後に*ビュー*を追加します：

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

ページを更新してみましょう：http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

出来ましたね！ しかし、ブログ投稿のタイトルのリンクをクリックするとどうなりますか？

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

あらいやだ！ 別のエラー！ しかし、私たちはすでにそれに対処する方法をすでに知っていますね。 そう！テンプレートを追加する必要があります！

## 投稿の詳細へのテンプレートリンクを作成する

`blog/templates/blog`に`post_detail.html`というファイルを作成し、コードエディタで開きます。

こんな感じですね。

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

もう一度`base.html`を拡張します。 `content`ブロックでは、投稿の公開日（存在する場合）、タイトル、およびテキストを表示します。 ここで重要なポイントについて見てみます。

{% raw %}`{% if ... %} ...  {％endif％}`は、何かをチェックしたいときに使用できるテンプレートタグです。 (`if ... else...` を**Python入門**のチャプターでやったのを覚えていますか？) この場合、私たちは投稿の`公開日（published_date）`が空でないかを確認したいです。{% endraw %}

これで、ページを更新して`TemplateDoesNotExist`がもうなくなったかどうか確認できます。

![Post detail page](images/post_detail2.png)

イェーイ！うまくできていますね！

# デプロイの時間です！

あなたのウェブサイトがまだPythonAnywhere上で動くとしたらいいでしょう？またデプロイしてみましょう。

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

それから、[PythonAnywhere Bash コンソール](https://www.pythonanywhere.com/consoles/)で：

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(`<your-pythonanywhere-username>`の部分を、自分の実際のPythonAnywhereのユーザー名に山カッコをはずして置き換えることを忘れずに)

## サーバー上の静的ファイルの更新

PythonAnywhereのようなサーバは、（CSSファイルのような）「静的ファイル」をPythonファイルとは違って扱うのが好きです。なぜなら、それらが高速に読み込まれるように最適化できるからです。 その結果、CSSファイルを変更するたびに、サーバー上で追加のコマンドを実行して、更新するように指示する必要があります。 コマンドは`collectstatic`です。

もし仮想環境（virtualenv）が有効になっていなければ有効化するところから始めましょう (PythonAnywhereではこれを行うために`workon`というコマンドを使用します。これはあなたが自身のコンピュータで使用している`source myenv/bin/activate`コマンドと同じようなものです) 。

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

`manage.py collectstatic`コマンドは、`manage.py migrate`のようなものです。 私たちはコードをいくつか変更してから、Djangoにサーバの静的ファイルのコレクションまたはデータベースに変更を*適用*するよう指示します。

いずれにしても、[「Web」ページ](https://www.pythonanywhere.com/web_app_setup/)（コンソールの右上のメニューボタンから）を開き、**Reload**をクリックする準備ができました。そしてそれから https://yourname.pythonanywhere.comページを見て結果を確認しましょう。

うまくいってるはずです！おめでとう :)