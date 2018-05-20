# HTML 入門

テンプレートとは何でしょうか？

テンプレートは、異なる情報を統一された形式で示すために繰り返し使われるファイルです。例えば、テンプレートは手紙を書く際に役立ちます。それぞれの手紙のメッセージは様々で、宛先も別々かもしれませんが、どの手紙も同じフォーマットを共有できるのです。

Djangoのテンプレートのフォーマットは、HTML(**第1章「インターネットはどう動くのか」**で触れたHTMLのことです) と呼ばれる言語で書かれています。

## HTMLとは？

HTMLは、ChromeやFirefox、Safariなどのウェブブラウザで解読され、利用者にウェブページを表示するためのコードです。

HTMLは、「Hypertext Markup Lnaguage」の頭文字を取ったものです。 **HyperText**とは、これが別々のウェブページ同士を関連づけるために使われるテキスト形式だ、ということを意味しています。 **Markup**とは、一つの書類について、コードで修飾を付けて、何かに(この場合、ブラウザに) どう解釈するかを伝えることを意味します。 HTMLコードは、 `<`で始まり、 `>`で終わる**タグ**で構成されています。 これらのタグが、markup修飾の**要素**なのです。

## 最初のテンプレート

テンプレートを作るとは、テンプレートのファイルを作ることです。すべてはファイルですよね。皆さんは、たぶん、このことに、もう気づいていると思います。

テンプレートは、`blog/templates/blog`ディレクトリに保存されています。 それでは、最初に、自分のblogディレクトリの中に`templates`という名前のディレクトリを作成してください。 次に、自分のtemplatesディレクトリの中に`blog`という名前のディレクトリを作ります。

    blog
    └───templates
        └───blog
    

(なぜ、両方とも`blog`という名前の付いたディレクトリを2つ作成する必要があるのか不思議に思う人もいるかもしれません。あとで分かると思いますが、簡単に言うと、これは、もっと複雑なことをやろうとした時に、それが楽にできるようにしてくれる便利な命名法なのです。)

それでは、`blog/templates/blog`ディレクトリの中に、`post_list.html`ファイル(とりあえず何も書かれていないファイルにしておきます)を作成しましょう。

あなたのウェブサイトを見てみてください: http://127.0.0.1:8000/

> もし、`TemplateDoesNotExist`が引き続き表示されるようなら、自分のサーバーを再起動してみてください。 コマンドラインから、Ctrl+C(ControlとCのキーを同時に)を押してサーバーを止め、`python manage.py runserver`コマンドを動かして再度サーバーを動かします。

![図 11.1](images/step1.png)

もうエラーはありませんか！おめでとうございます:)。しかし、あなたのウェブサイトは実際には空白のページ以外は何も表示しなていないでしょう。テンプレートも空白だからです。それを直していく必要があります。

あなたのテンプレートファイルに、次の内容を書き加えます。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

さあ、あなたのウェブサイトはどう見えるでしょうか？以下を開いて確認してみましょう: http://127.0.0.1:8000/

![図 11.2](images/step3.png)

うまく動いています！よくできました:)

* どんなウェブページでも、最も基本的なタグである`<html>`から始まり、そして常に、`</html>`で終わります。 みなさん見てとれるように、ウェブサイトの全てのコンテンツは、開始タグの`<html>`と閉じタグ`</html>`の間にあります。
* `<p>`は、段落要素のためのタグです; `</p>` でそれぞれの段落を閉じます。

## Head and body

それぞれのHTMLページは**head**と**body**という要素によって2つにわけられています.

* **head**は文書についての情報を含む要素で、画面には表示されません。

* **body**はWebページの一部として表示されるすべてを含む要素です。

`<head>`でページの設定をブラウザに伝え、`<body>`でページの内容を伝えます。

例えば、ウェブページのタイトル要素は`<head>`の中に書きます。こんな感じですね。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

ファイルを保存し、ページを更新してください。

![図 11.3](images/step4.png)

ブラウザは、どうやって、"Ola's blog"があなたのウェブサイトのタイトルだと理解したのか分かりましたか？ ブラウザは、`<title>Ola's blog</title>`の意味を解釈して、あなたのブラウザのタイトルバーに文を配置したのです(この文はブックマークなどにも利用されます)。

各々の開始タグは*閉じタグ*とセットで、閉じタグには`/`が付いていて、タグの要素は*入れ子*になっていることに気がついたことと思います(つまり、ある特定のタグを閉じるには、その中にある全てのタグも閉じられていないとだめなのです)。

箱の中にものを詰め込むのと同じですね。 大きな箱、 `<html></html>`があります; その中に`<body></body>`があり、さらにもっと小さな`<p></p>`が入っているのです。

こうした*閉じ*タグと、*入れ子*のルールを守らくてはいけません - そうしないと、ブラウザはタグを適切に解釈することができず、あなたのウェブページが正しく表示されなくなるのです。

## テンプレートのカスタマイズ

それでは、少し遊んで、テンプレートを作り変えてみましょう！次にようにいくつか便利なタグがあります。

* `<h1>ヘッダー</h1>` 最も重要性の高い見出し
* `<h2>サブのヘッダー</h2>` その次のレベルの見出し
* `<h3>サブのサブのヘッダー</h3>`... など`<h6>`まで
* `<p>文章の段落</p>`
* `<em>文章</em>`で文章を強調する
* `<strong>文章</strong>`でさらに文章を強調する
* `<br>`は改行(brタグの中には何も書いてはいけません。閉じタグも無しです)
* `<a href="https://djangogirls.org">リンク</a>` はリンクを生成します
* `<ul><li>第１の項目</li><li>第２の項目</li></ul>` でリストを作成する、こんな感じに！
* `<div></div>`はページ内の区切りを定義

いろんな要素をまとめたテンプレートの例がこれです。コピーして`blog/templates/blog/post_list.html`に貼り付けてみましょう:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. こんにちは！ よろしくお願いします！ </p>
        </div>

        <div>
            <p>公開日: 2014/06/14, 12:14</p>
            <h2><a href="">2番目の投稿</a></h2>
            <p> こんにちは！ よろしくお願いします！ </p>
        </div>
    </body>
</html>
```

ここで3つの `div` セクションを作成しました。

* 最初の `div` 要素には、私たちのブログのタイトルが含まれています。見出しとリンクです。
* その他の２つの`div`要素には、このブログにポストされた記事が公開日とともに記載されています。`h2`はクリック可能な記事のタイトルです。２つの`p`(段落) は、１つが日付で、１つがブログにポストされた記事です。

その結果、次のような結果が得られます。

![図 11.4](images/step6.png)

や～っ。 ところが今のところ、私たちのテンプレートは、常に完全に**同じ情報**だけしか表示できません。一方で、以前は、テンプレートを使えば、**異なる**情報を**同じ形式**で表示できるようになるとお伝えしていたのですが。

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## One more thing: deploy!

It'd be good to see all this out and live on the Internet, right? Let's do another PythonAnywhere deploy:

### Commit, and push your code up to Github

First off, let's see what files have changed since we last deployed (run these commands locally, not on PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Also remember (from chapter 3) that `.` means the current directory.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **Files tab** and view your code on PythonAnywhere.

* Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)