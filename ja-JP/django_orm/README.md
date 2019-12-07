# DjangoのORMとクエリセット

この章では、Djangoのデータベース接続方法と、データの格納について学びます。やってみましょう！

## クエリセットとは？

クエリセットが何かと言うと、モデルのオブジェクトのリストのことです。クエリセットを使って、データベースからデータを読み込んだり、抽出したり、並べ替えたりできます。

実際に動かしてみるのが一番わかりやすいので、試してみましょう。

## Django shell

コンソール画面を開いて（PythonAnywhereのコンソールではないですよ）、次のコマンドを入力してみましょう。

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

次のような表示に切り替わるでしょう。

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

今、Djangoのインタラクティブコンソールが起動しています。Pythonプロンプトのようにだけ見えますが、ちゃんとDjangoも動いています :) このコンソール画面では、Pythonのコマンドは何でも使えます。

### すべてのオブジェクト

最初に、投稿のデータを全部表示させてみましょう。次のコマンドで、投稿のデータを全部表示させることが出来ます。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

ごめんなさい、エラーになってしまいましたね。Postがないというエラーです。その通りなんです。最初にインポートをしなくてはならないのに、忘れていました。

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

こんな風に書くだけで、`blog.models` から `Post` モデルをインポート出来ます。それでは、もう一度試してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

さっきDjangoの管理画面から作った投稿のリストが表示されました。だけど、次はこのコンソール画面から、新たに投稿を作ってみたいですよね。それはどうすればいいのでしょうか。

### オブジェクトの作成

データベースに、新しいPostを作成するには、次のようにします。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

いい感じなのですが、1つだけマズイことをしているんです。author に `me` を渡していますが、これは `User` モデルのインスタンスでないといけませんよね。それは、どうやればいいと思います？

そうです、さっきと同じです。Userモデルも先にインポートしておきましょう。

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

どんなユーザが、データベースに登録されてましたっけ？覗いてみましょうか。

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

作成しておいたスーパーユーザがいますね。このユーザを取り出してみましょう（この行をご自身で作ったスーパーユーザのユーザ名に変更して取り出してくださいね）。

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

ola という `ユーザ名` の `User` モデルのインスタンスを、`取り出せ` たでしょう？よかった！

さあ、遂にコンソール画面から、投稿を作成出来ますね。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

どうでしょうか？ちゃんと出来ているか、確認しておきましょうね。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

出来ていますね！リストに新しい投稿が1つ追加されています。

### さらに投稿を追加しましょう

楽しくなってきたでしょう？理解を深めるためにもう少し投稿を作っておきましょう。2〜3個記事を追加したら、次に進みましょう。

### オブジェクトの抽出

クエリセットの大部分は、抽出機能だと言えるでしょう。 ユーザolaさんの投稿を全部確認してみましょうか。 全部の投稿を取り出すのではなく、olaさんの投稿だけを取り出したい場合は、`Post.objects.all()` の `all` を `filter` に変更します。 取り出されるブログの投稿が満たす条件を、カッコ()の中に指定します。 今回の例では、`author` が `me` と等しいという条件です。 Djangoでの表し方は、`author=me` となります。 このようになりますね。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

もしかすると `title` フィールドに title という単語が含まれている投稿だけを取り出したくなるかもしれませんね。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** `title` と `contains` の間に、アンダーバー (`_`) が2個続いていますが、 これはDjangoのORMの構文です。フィールド名のtitleと、照合タイプのcontainsを、2つのアンダーバーで連結させています。 もしアンダーバーが1個だけだと、title_contains というフィールド名だと判断されてしまい、エラーになります。("FieldError: Cannot resolve keyword title_contains")

また、公開済みの全ての投稿を取り出すことも出来ます。それには、`published_date` が現在以前の全ての投稿を取り出します。

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

そうでした、残念なことに、コンソールから追加した投稿はまだ公開されていませんね。じゃあ、投稿を公開してみるとしましょう。まず公開する投稿を決めましょう。

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

そして、`publish` メソッドを呼び出します。

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

じゃあ、もう一度公開済みの投稿を取り出しましょう。(上方向キーを3回押せば、さっきのコマンドを呼び出せるでしょう。コマンドを表示出来たら、`Enter` キーを押してみましょう)

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### オブジェクトの並び替え

クエリセットは、オブジェクトのリストの並べ替えもやってくれます。試しに `created_date` フィールドで並べ替えてみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

逆順、つまり新しく追加した順に並べ替えることも出来ます。それには、`-`（ハイフン）を使います。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### メソッドチェーンによる複雑なクエリ

ご覧のように、`Post.objects`の一部のメソッドはクエリセットを返します。 逆に同じメソッドをクエリセットについて呼び出すこともでき、そうすると新しいクエリセットが返ります。 よって、**つなげる**ことで、メソッドの返すクエリセットを組み合わせることができます：

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

クエリセットをつなげるのは本当に強力です。つなげていくことでとても複雑なクエリも書くことが出来ます。

いいですね！次の章への準備は万端ですね！このプロンプトを閉じるには、以下のようにします。

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```