# HTML 入門

テンプレートとは何でしょうか？

テンプレートは、異なる情報を統一された形式で示すために繰り返し使われるファイルです。例えば、テンプレートは手紙を書く際に役立ちます。それぞれの手紙のメッセージは様々で、宛先も別々かもしれませんが、どの手紙も同じフォーマットを共有できるのです。

Djangoのテンプレートのフォーマットは、HTMLと呼ばれる言語 (最初のチャプター**「インターネットのしくみ」**で触れたHTMLのことです) で書かれています。

## HTMLとは？

HTMLは、ChromeやFirefox、Safariなどのウェブブラウザで解読され、利用者にウェブページを表示するためのコードです。

HTMLは、「HyperText Markup Language」の頭文字を取ったものです。 **HyperText**はWebページ間を結びつけるハイパーリンクをサポートするテキスト形式という意味です。 **Markup**とは、一つの書類について、コードで修飾を付けて、何かに(この場合、ブラウザに) どう解釈するかを伝えることを意味します。 HTMLコードは、 `<`で始まり、 `>`で終わる**タグ**で構成されています。 これらのタグが、markup修飾の**要素**なのです。

## 最初のテンプレート

テンプレートを作るとは、テンプレートのファイルを作ることです。すべてはファイルですよね。皆さんは、たぶん、このことに、もう気づいていると思います。

テンプレートは、`blog/templates/blog`ディレクトリに保存されています。 それでは、最初に、自分のblogディレクトリの中に`templates`という名前のディレクトリを作成してください。 次に、自分のtemplatesディレクトリの中に`blog`という名前のディレクトリを作ります。

    blog
    └───templates
        └───blog
    

（なぜ、両方とも`blog`という名前の付いたディレクトリを2つ作成する必要があるのか不思議に思う人もいるかもしれません。あとで分かると思いますが、簡単に言うと、これは、もっと複雑なことをやろうとした時に、それが楽にできるようにしてくれる便利な命名法なのです。）

それでは、`blog/templates/blog`ディレクトリの中に、`post_list.html`ファイル(とりあえず何も書かれていないファイルにしておきます)を作成しましょう。

あなたのウェブサイトを見てみてください: http://127.0.0.1:8000/

> もし、`TemplateDoesNotExist`が引き続き表示されるようなら、自分のサーバーを再起動してみてください。 コマンドラインから、Ctrl+C(ControlとCのキーを同時に)を押してサーバーを止め、`python manage.py runserver`コマンドを動かして再度サーバーを動かします。

![図 11.1](images/step1.png)

もうエラーはありません。おめでとうございます! :)　しかし、あなたのウェブサイトは空白ページ以外は何も表示しいません。テンプレートが空白だからです。これを直していく必要があります。

この新しく作ったファイルをコードエディタで開いて、次の内容を書き加えます。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

さあ、あなたのウェブサイトはどう見えるでしょうか？以下を開いて確認してみましょう: http://127.0.0.1:8000/

![図 11.2](images/step3.png)

動いています。よくできました! :)

* The line `<!DOCTYPE html>` is not a HTML tag. It only declares the document type. Here, it informs the browser that document type is [HTML5](https://html.spec.whatwg.org/#the-doctype). This is always the beginning of any HTML5 file.
* The most basic tag, `<html>`, is always the beginning of html content and `</html>` is always the end. As you can see, the whole content of the website goes between the beginning tag `<html>` and closing tag `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## HeadとBody

それぞれのHTMLページは**head**と**body**という要素によって2つにわけられています.

* **head**は文書についての情報を含む要素で、画面には表示されません。

* **body**はWebページの一部として表示されるすべてを含む要素です。

`<head>`でページの設定をブラウザに伝え、`<body>`でページの内容を伝えます。

例えば、ウェブページのタイトル要素は`<head>`の中に書きます。こんな感じですね。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

こうした*閉じ*タグと、*入れ子*のルールを守らなくてはいけません - そうしないと、ブラウザはタグを適切に解釈することができず、あなたのウェブページが正しく表示されなくなるのです。

## テンプレートのカスタマイズ

それでは、ちょっぴり楽しくテンプレートを作り変えてみましょう！次のようないくつか便利なタグがあります。

* `<h1>ヘッダー</h1>` 最も重要性の高い見出し
* `<h2>サブのヘッダー</h2>` その次のレベルの見出し
* `<h3>サブのサブのヘッダー</h3>`... など`<h6>`まで
* `<p>文章の段落</p>`
* `<em>文章</em>`で文章を強調する
* `<strong>文章</strong>`でさらに文章を強調する
* `<br>`は改行(brタグの中には何も書いてはいけません。閉じタグも無しです)
* `<a href="https://djangogirls.org">リンク</a>` はリンクを生成します
* `<ul><li>第１の項目</li><li>第２の項目</li></ul>` でリストを作成する、こんな感じに！
* `<div></div>`はページ内のセクションを定義
* `<nav></nav>` defines a set of navigation links
* `<article></article>` specifies independent, self-contained content
* `<section></section>` defines a section in a document
* `<header></header>` specifies a header for a document or section
* `<main></main>` specifies the main content of a document
* `<aside></aside>` defines some content aside from the content it is placed in (like a sidebar)
* `<footer></footer>` defines a footer for a document or section
* `<time></time>` defines a specific time (or datetime)

いろんな要素をまとめたテンプレートの例がこれです。コピーして`blog/templates/blog/post_list.html`に貼り付けてみましょう:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. こんにちは！ よろしくお願いします！ Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. こんにちは！ よろしくお願いします！ Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

We've created one `header` section and two `article` section here.

* The `header` element contains the title of our blog – it's a heading and a link
* Another two `article` elements contain our blog posts with a published date in `time` element, `h2` with a post title that is clickable and a `p` (paragraph) of text for our blog post.

その結果、次のような結果が得られます。

![図 11.4](images/step6.png)

いぇーい！ ところが今のところ、私たちのテンプレートは、常に完全に**同じ情報**だけしか表示できません。一方で、以前は、テンプレートを使えば、**異なる**情報を**同じ形式**で表示できるようになるとお伝えしていたのですが。

本当にやりたいことは、Djangoのadminに追加された本物の記事を表示することです。そして、それが次にやるべきことなのです。

## もう一つ: デプロイしましょう！

ここまでやったことを公開して、インターネットで動かしてみると楽しいですよね。PythonAnywhereでデプロイしてみましょう。

### Githubに自分のコードをPushしてみよう

まずは、最後に実行したときから、どのファイルを変更したか見てみましょう(以下のコマンドを、PythonAnywhereではなく、自分のパソコンで実行してください。)。

{% filename %}command-line{% endfilename %}

    $ git status
    

`djangogirls` ディレクトリにいることを確認して、 `git` に対してこのディレクトリ内の変更を全て反映させるよう指示してください:

{% filename %}command-line{% endfilename %}

    $ git add .
    

全てのファイルをアップロードする前に、`git`が何をアップロードするのかチェックしておきましょう(`git`がアップロードする全ファイルは緑で表示されます):

{% filename %}command-line{% endfilename %}

    $ git status
    

ほぼ完了です。どこを変更したかを履歴に保存するよう指示してみましょう。 何を変更したのか説明するコミットメッセージを残しましょう。 この時、どんな内容を好みで打ち込んでも構いませんが、何をしたかを具体的に書き込んでおけば、将来、作業内容を思い出す助けになるでしょう。

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **注意** コミットメッセージでダブルクォーテーションを使用していることを確認してください。

ここまで終われば、GitHubに変更部分をアップロード(push) しましょう。

{% filename %}command-line{% endfilename %}

    $ git push
    

### 新しいコードをPythonAnywhereにpullして、自分のウェブアプリを再度実行させる

* [PythonAnywhereのコンソールページ](https://www.pythonanywhere.com/consoles/)を開き、**Bash コンソール**に移動してください (または新たなBash コンソールを開始してください)。それから次を実行してください。

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

`<your-pythonanywhere-domain>`を、山カッコ<>をつけずに、実際のPythonAnywhereのサブドメイン名に置き換える必要があります。 通常、サブドメイン名はPythonAnywhereユーザー名ですが、場合によっては多少異なることがあります（ユーザー名に大文字が含まれている場合など）。 このコマンドが機能しない場合は、`ls`（ファイルを一覧にする）コマンドを使用して、実際のサブドメイン名とフォルダ名を見つけ、そこに `cd` します。

では、自分のコードがダウンロードされたことを確認しましょう。 それをチェックしたい場合は、**「Files」ページ** に移動して、自分のコードをPythonAnywhereの中で見てみましょう（コンソールページのメニューボタンからPythonAnywhereの他のページにアクセスできます）。

* 最後に、[「Web」ページ](https://www.pythonanywhere.com/web_app_setup/)へ移動して、自分のアプリの**Reload**ボタンをクリックします。

あなたのアプリが更新され、動いています！ウェブサイトを開いて、再読込してみましょう。どう変わったのか、見えるはずです。:)