# Djangoテンプレート

何かデータを表示しましょう！Djangoはそれをビルトインの **テンプレートタグ** で実現できます。

## テンプレートタグとは？

HTML中で本当はPythonのコードを書くことはできません。なぜならブラウザが理解できないからです。ブラウザはHTMLだけ分かります。HTMLはどちらかというと静的で、それに対してPythonはもっとずっと動的なことを私たちは知っています。

**Djangoテンプレートタグ** はHTMLにPyhtonのようなコードを埋め込むことができて、動的なウェブサイトがより早く簡単に作れます!

## ブログ一覧テンプレートの表示

前の章で、`posts` 変数でテンプレートに記事のリストを渡しました。今からHTMLで表示をしてみましょう。

Djangoテンプレートで変数を表示するためには、次のように変数の名前を二重中括弧で括ります。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

これを `blog/templates/blog/post_list.html` テンプレートでやってみましょう。 エディタでこのファイルを開き、2つめの `<div>` から3つめの `</div>` までをまるごと `{{ posts }}` に置き換えて下さい。 ファイルを保存してページをリロードすると：

![図 13.1](images/step1.png)

見たとおり、このようになります。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Djangoはposts変数をオブジェクトのリストと認識します。 **Python入門**でどうやってリストを表示できたか覚えていますか？ ループを使ってリストを表示しましたよね。 Djangoテンプレートではこう書きます：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

これをブログのテンプレートで使ってみましょう。

![図 13.2](images/step2.png)

動きましたね。 しかし、本当は**HTML入門**で作った静的な記事のように表示してほしいところです。 そこで、HTMLとテンプレートタグを混ぜてみましょう。 `body` タグの中を次のように書いてください：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}`{% for %}` と `{% endfor %}` の間に書いたものはリスト中の各オブジェクトの分だけ繰り返されます。ページをリロードしてみましょう。{% endraw %}

![図 13.3](images/step3.png)

post変数がさっきと違って、`{{ post.title }}` や `{{ post.text }}` になっていることに気づきましたか？ `Post` モデルで定義したそれぞれのフィールドにアクセスしています。 `|linebreaksbr` はpostのテキスト中の改行を段落に変換するフィルタに通すという意味です。

## もう一つ...

今の時点でのウェブサイトを公開して見てみませんか？もう一度PythonAnywhereでデプロイしてみましょう。デプロイのステップをおさらいします。

* まず、GithubにあなたのコードをPushしましょう

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* そしたら、[PythonAnywhere](https://www.pythonanywhere.com/consoles/)に戻って、**Bashコンソール**（か、新しいコンソール）に入って、次のようにコマンドを打ちましょう：

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

（忘れずに `<your-pythonanywhere-domain>` を自分のPythonAnywhereのサブドメイン名に置き換えましょう、<> は不要です。）

* 最後にPythonAnywhereの[「Web」ページ](https://www.pythonanywhere.com/web_app_setup/)を開いて、アプリを**リロード**（Reload）します。 （コンソールからPythonAnywhereの他のページにアクセスするには、右上のメニューボタンを使います。）更新された内容が、 https://subdomain.pythonanywhere.com に反映されているはずです。ブラウザで確認してみましょう！ PythonAnywhereサイトで表示されるブログの記事が、あなたのパソコンの中のローカルサーバーのものと違っていても大丈夫です。 ローカルコンピュータにあるデータベースと、PythonAnywhere上のデータベースは同期していません。

頑張りましたね！ さぁ、ここまでできたら、Django 管理画面から新しい投稿を追加してみましょう。（published_date 公開日の設定を忘れずに！）投稿を追加する時、PythonAnywhereのサイトの管理画面（https://subdomain.pythonanywhere.com/admin）であることを確認してください 。できたら、リロードして投稿したものが表示されるか見てみましょう。

うまく動きましたか？ここまでよく頑張りましたね！少しパソコンから離れて、休憩をとりましょう。^_^

![図 13.4](images/donut.png)