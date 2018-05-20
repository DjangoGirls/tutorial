# Djangoテンプレート

何かデータを表示しましょう！Djangoはそれをビルトインの**テンプレートタグ**で実現できます。

## テンプレートタグとは？

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## ブログ一覧テンプレート

前の章で、`posts` 変数でテンプレートに記事のリストを渡しました。今からHTMLで表示をしてみましょう。

Djangoテンプレートで変数を表示するためには、次のように変数の名前を二重中括弧で括ります。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

これを `blog/templates/blog/post_list.html` に書いてみて下さい。 ２つめと３つ目の

<div>
</div>タグをまるごと {{posts}} に置き換えて下さい。 ファイルを保存してページをリロードしますと：

![図 13.1](images/step1.png)

見たとおり、このようになります。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Djangoはオブジェクトのリストと認識します。 Introduction to Pythonを思い出して下さい。 ループを使ってリストを表示しましたよね。 Djangoテンプレートではこう書きます:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

これをブログのテンプレートで使ってみましょう。

![図 13.2](images/step2.png)

動きましたね。 But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. bodyタグの中を次のように書いてください: bodyはこのようにします。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% for %}と{% endfor %}の間にリストの中のオブジェクトごとに表示したい内容を書くとオブジェクトの数だけ繰り返し書かれます。ページをリロードしてみましょう。

![図 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? Post モデルで定義したそれぞれのフィールドにアクセスしています。 Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## もう一つ...

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* まず、GitHubでコードをpushします。

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* そしたら、Pythonanywhereに戻って、Bashコンソール（か、新しいコンソール）に入って、動かしましょう：

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* 最後にブラウザのタブを開いてアプリをリロードします。更新が反映されています！ If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

おめでとうございます！よくできました! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![図 13.4](images/donut.png)