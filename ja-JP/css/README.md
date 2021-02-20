# CSSでカワイくしよう!

ブログは作ったものの、まだなんかダサいですよね。かわいくしましょう！　そのためにはCSSを使います。

## CSSとは？

Cascading Style Sheets (CSS)とは、HTMLなどのマークアップ言語で書かれたWebサイトの見た目や書式を記述するための言語です。私達のWebページをメイクアップするものとして使います。

でも、またゼロから作りたくないですよね。プログラマーたちがすでに作って無料で公開しているツールを使いましょう。わざわざイチから作り直す必要はないですからね。

## Bootstrapを使いましょう！

Bootstrap は美しいWebサイトを開発するためのHTMLとCSSのフレームワークとしてとても有名です: http://getbootstrap.com/

これは、もともとTwitterのプログラマーが作成したもので、今は、世界中の有志のボランティアで開発されています。

## Bootstrapのインストール

Bootstrap をインストールするため、`.html` ファイル (blog/templates/blog/post_list.html) をコードエディタで開き `<head>` の中にこれを追加しましょう:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
```

これは、あなたのプロジェクトにファイルを追加しているわけではありません。インターネット上にあるファイルを指しているだけです。では、Webサイトを開いてページを再読み込みしてください。

![図 14.1](images/bootstrap1.png)

これだけでずいぶん見た目が良くなりましたね！

## Djangoの静的ファイル

最後に、**静的ファイル**と呼ばれるものを詳しく見ていきましょう。 静的ファイルとは、CSSファイルや画像ファイルといった、動的な変更が発生しないファイルのことです。 そのため、これらのファイルはリクエストに依存せず、どのユーザに対しても中身は同じになります。

### 静的ファイルはプロジェクトのどこに置けばいいの？

Djangoは、ビルトインの "admin" アプリにより、静的ファイルをどこで探せばいいのかわかっています。私たちがやることは、`blog` アプリのための静的ファイルを追加することだけです。

そのために、blogアプリの中に `static` というフォルダを作ります。

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Djangoは、全てのアプリのフォルダ内の "static" と名づけられた全てのフォルダを自動的に探して、その中身を静的ファイルとして使えるようにします。

## 最初のCSSファイル！

CSSファイルを作って、Webサイトにあなたのスタイルを設定していきましょう。 `static` ディレクトリの中に `css` というディレクトリを作成しましょう。 そして、その `css` ディレクトリの中に `blog.css` という新規ファイルを作ります。 準備OK？

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

ついにCSSを書くときが来ました！　コードエディタで `blog/static/css/blog.css` ファイルを開きましょう。

ここではCSSのカスタマイズや学習方法については詳しく説明しません。さらに知りたい場合は、このページの最後に無料のCSSの学習コースを紹介していますので、そちらを参考にしてください。

ただ、せめて少しはここでやってみましょう。 ヘッダーの色を変えてみるのもいいかもしれませんね。 色を理解するために、コンピュータは特殊なコードを使います。 コードは、`#` で始まり、6種類のアルファベット（A-F）や数字（0-9）が続きます。 たとえば、青色のコードは `#0000FF` です。 カラーコードのサンプルはこのサイト http://www.colorpicker.com/ で確認できます。 `red` や `green` といった[定義済みの色](http://www.w3schools.com/colors/colors_names.asp)を利用することもできます.

`blog/static/css/blog.css` ファイルに、次のコードを追加しましょう。

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` はCSSセレクタと呼ばれるものです。 これは、`h1`要素内の`a`要素にスタイルを適用していることを意味します。 `h2 a`セレクタは、`h2`要素に対して同じことを行います。 よって `<h1><a href="">link</a></h1>`となっているとき、 `h1 a` スタイルが適用されます。 この場合、その要素を `#C25100` に、つまり濃いオレンジ色にしようとしています。 あるいは、あなたの好きな色を設定することができますが、それが白い背景に対して良いコントラストを持つことを確認しましょう！

CSSファイルには、HTMLファイルの各要素のスタイルを指定していきます。 まずは要素名でもって、その要素を識別します。 HTMLのタグ名は覚えがあるでしょう。 例えば `a`, `h1`, `body` などが要素名の例です。 また、`class` 属性や、`id` 属性によって要素を識別することができます。 classやidは、あなたが自分で要素につけることができる名前です。 classは要素のグループを定義して、idは特定の要素を指定します。 For example, you could identify the following element by using the element name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

CSSセレクタについては[CSS Selectors in w3schools](http://www.w3schools.com/cssref/css_selectors.asp)を見てください。

さて、CSSを追加したことをHTMLテンプレートに教えないといけません。`blog/templates/blog/post_list.html` を開いて、先頭にこの行を追加しましょう：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

これで、このテンプレートに静的ファイルを読み込むことができました^^。そして、`<head>` と `</head>` の中にあるBootstrap CSSファイルのリンクの下に、この行を追加しましょう：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

ブラウザは上から書いた順番でファイルを読み込むので、記述する箇所はよく確かめる必要があります。 順番が逆になると、私たちが書いたファイルがBootstrapのファイルに上書きされてしまうかもしれません。 これで、テンプレートにCSSファイルがある場所を教えました。

ファイルは次のようになっているはずです：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        {% for post in posts %}
            <article>
                <time>published: {{ post.published_date }}</time>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </article>
        {% endfor %}
    </body>
</html>
```

保存して、サイトを更新してください。

![図 14.2](images/color2.png)

素晴らしいですね！あとは、左サイドの余白幅を少し広げて、余裕を持たせてあげたらもっと良くなると思いませんか？やってみましょう！

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

これをCSSに追加して、保存してください。どのように変化したか、さぁ見てみましょう！

![図 14.3](images/margin2.png)

ヘッダーのフォントを変えてみませんか？ファイル `blog/templates/blog/post_list.html` の `<head>` タグの中に次の一行を貼り付けましょう。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

まずは、このリンクが `blog/static/css/blog.css` より前にあることを確かめましょう。この１行は *Lobster* というフォントをGoogle Fonts (https://www.google.com/fonts) から読み込むということを意味しています。

`blog/static/css/blog.css` ファイルの中の、 `h1 a` という宣言ブロックを見つけてください（コードは `{` と `}` で囲まれています）。 そして、そのカッコの中に `font-family: 'Lobster';` と１行追加して、webサイトを更新してみましょう：

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![図 14.3](images/font.png)

素晴らしいです！

前述のように、CSSはクラスの概念を持っています。 それにより、HTMLコードの一部に名前を指定し、他の部分に影響を与えずにこの部分にだけスタイルを適用することができます。 なんて便利なんでしょう！ 例えば、２つのdiv要素（ヘッダーと記事など）があったとして、これらのそれぞれに違うスタイルを適用することができます。 クラスを利用すると、違う見た目にできるのです。

Go ahead and name some parts of the HTML code. Replace the `header` that contains your header with the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

And now add a class `post` to your `article` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

そして、さまざまなセレクタに宣言ブロックを追加します。 `.` で始まるセレクタはクラスに関連します。 Web上にはCSSに関する多くのチュートリアルがあり、それらは以下に示すコードを理解する手助けになるはずです。 今のところは、`blog/static/css/blog.css` のファイルに以下の内容をコピー＆ペーストしましょう：

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    margin-bottom: 40px;
    padding: 20px 20px 20px 40px;
}

.page-header h1,
.page-header h1 a,
.page-header h1 a:visited,
.page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

h1,
h2,
h3,
h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea,
.post-form input {
    width: 100%;
}

.top-menu,
.top-menu:hover,
.top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a,
.post h2 a:visited {
    color: #000000;
}

.post > .date,
.post > .actions {
    float: right;
}

.btn-default,
.btn-default:visited {
    color: #C25100;
    background: none;
    border-color: #C25100;
}

.btn-default:hover {
    color: #FFFFFF;
    background-color: #C25100;
}
```

では、投稿を表示しているHTMLコードをクラス宣言で囲みましょう。 `blog/templates/blog/post_list.html` 中のこの部分を

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

これで置き換えて下さい：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<main class="container">
    <div class="row">
        <div class="col">
            {% for post in posts %}
                <article class="post">
                    <time class="date">
                        {{ post.published_date }}
                    </time>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </article>
            {% endfor %}
        </div>
    </div>
</main>
```

ファイルを保存してWebサイトを更新してみましょう。

![図 14.4](images/final.png)

やったー！ ほら凄いでしょ？ 貼り付けたコードを見て、HTMLにクラスを追加した場所やそのクラスがCSSの中で使われている場所を探してみましょう。 日付の色をターコイズブルーにするには、どこを変更すればいいでしょうか？

CSSをいじって表示が壊れることを恐れないで、どんどん変更を加えてみてください。 CSSで遊んでみることで、何がどうなっているかを理解できてきます。 たとえ何かを壊してしまっても、心配しないで！すぐに元に戻すことができます。

[freeCodeCamp](https://learn.freecodecamp.org/)で無料のオンラインコース「Basic HTML & HTML5」と「Basic CSS」を受講することをおすすめします。 これらで学ぶと、HTMLとCSSであなたのWebサイトをよりカワイくできるでしょう。

さて、次の章にいく準備はできましたか？^皿^