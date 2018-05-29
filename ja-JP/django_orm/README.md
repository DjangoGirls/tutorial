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

今、Djangoのインタラクティブコンソールが起動しています。Pythonプロンプトしかないように見えますが、ちゃんとDjangoも動いています。勿論このコンソール画面では、Pythonのコマンドは何でも使えます。

### All objects

最初に、ポストデータを全部表示させてみましょう。次のコマンドで、ポストのデータを全部表示させることが出来ます。

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

さっきDjangoの管理画面から作ったポストのリストが表示されました。だけど、次はこのコンソール画面から、新たにポストを作ってみたいですよね。それはどうすればいいのでしょうか。

### Create object

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

作成しておいたスーパーユーザがいますね。このユーザを取り出してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

ola という`ユーザ名`の `User` モデルのインスタンスを、`取り出せた`でしょう？よかった！勿論、ご自身で作ったスーパーユーザのユーザ名に変更してコマンドを入力してくださいね。

さあ、遂にコンソール画面から、最初のポストを作成出来ますね。

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

出来ていますね！リストにはポストが1つ以上あります。

### Add more posts

楽しくなってきたでしょう？理解を深めるためにもう少しポストを作っておきましょう。2〜3個記事を追加したら、次に進みましょう。

### Filter objects

クエリセットの大部分は、抽出機能だと言えるでしょう。 ユーザolaさんのポストを全部確認してみましょうか。 全部のポストを取り出すのではなく、olaさんのポストだけを取り出したい場合は、`Post.objects.all()` の `all` を `filter` に変更します。 In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. このようになりますね。

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** title と contains の間に、アンダーバーが2個続いていますが、 Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

We can also reverse the ordering by adding `-` at the beginning:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Chaining QuerySets

You can also combine QuerySets by **chaining** them together:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

This is really powerful and lets you write quite complex queries.

Cool! You're now ready for the next part! To close the shell, type this:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```