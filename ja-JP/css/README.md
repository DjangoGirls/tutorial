# CSS – make it pretty!

ブログは作ったものの、まだなんかダサいですよね。かわいくしましょう！　そのためにはCSSを使います。

## CSSとは？

Cascading Style Sheets (CSS)とは、HTMLなどのマークアップ言語で書かれたWebサイトの見た目や書式を記述するための言語です。私達のWebページをメイクアップするものとして使います。

でも、またゼロから作りたくないですよね。プログラマーたちがすでに作って無料で公開しているツールを使いましょう。わざわざイチから作り直す必要はないですからね。

## Let's use Bootstrap!

Bootstrap は美しいWebサイトを開発するためのHTMLとCSSのフレームワークとしてとても有名です: http://getbootstrap.com/

これは、もともとTwitterのプログラマーが作成したもので、今は、世界中の有志のボランティアで開発されています。

## Bootstrapのインストール

Bootstrapをインストールするには .html ファイル (blog/templates/blog/post_list.html) の

<head>
  の中に、次のとおり書き加えます：</p> 
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"&gt;
&lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"&gt;
</code></pre>
  
  <p>
    これは、あなたのプロジェクトにファイルを追加しているわけではありません。インターネット上にあるファイルを指しているだけです。では、Webサイトを開いてページを再読み込みしてください。
  </p>
  
  <p>
    <img src="images/bootstrap1.png" alt="図 14.1" />
  </p>
  
  <p>
    これだけでずいぶん見た目が良くなりましたね！
  </p>
  
  <h2>
    Static files in Django
  </h2>
  
  <p>
    最後に、<strong>静的ファイル</strong>と呼ばれるものを詳しく見ていきましょう。 静的ファイルとは、CSSファイルや画像ファイルといった、動的な変更が発生しないファイルのことです。 そのため、これらのファイルはサーバーへのリクエストが行われる環境に依存せず、どのユーザに対しても内容は同じになります。
  </p>
  
  <h3>
    静的ファイルはプロジェクトのどこに置けばいいの？
  </h3>
  
  <p>
    Djangoは、ビルトインの "admin" アプリにより、静的ファイルをどこで探せばいいのかわかっています。私たちがやることは、<code>blog</code>アプリのための静的ファイルを追加することだけです。
  </p>
  
  <p>
    そのために、blogアプリの中に<code>static</code>というフォルダを作ります。
  </p>
  
  <pre><code>djangogirls
├── blog
│   ├── migrations
│   ├── static
│   └── templates
└── mysite
</code></pre>
  
  <p>
    Djangoは、全てのアプリのフォルダ内の "static" と名づけられた全てのフォルダを自動的に探して、その中身を静的ファイルとして使えるようにします。
  </p>
  
  <h2>
    Your first CSS file!
  </h2>
  
  <p>
    CSSファイルを作って、Webサイトにあなたのスタイル設定していきましょう。 <code>static</code>ディレクトリの中に<code>css</code>というディレクトリを作成しましょう。 そして、その<code>css</code>ディレクトリの中に<code>blog.css</code>という新規ファイルを作ります。 Ready?
  </p>
  
  <pre><code>djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
</code></pre>
  
  <p>
    ついにCSSを書くときが来ました！　コードエディタで<code>blog/static/css/blog.css</code>ファイルを開きましょう。
  </p>
  
  <p>
    ここではCSSのカスタマイズや学習方法については詳しく説明しません。さらに知りたい場合は、このページの最後に無料のCSSの学習コースを紹介していますので、そちらを参考にしてください。
  </p>
  
  <p>
    ただ、せめて少しはここでやってみましょう。 ヘッダーの色を変えてみるのもいいかもしれませんね。 色を理解するために、コンピュータは特殊なコードを使います。 コードは、<code>#</code>で始まり、6種類のアルファベット（A-F）や数字（0-9）が続きます。 たとえば、青色のコードは <code>#0000FF</code> です。 カラーコードのサンプルはこのサイトで確認できます：http://www.colorpicker.com/ <code>red</code>や<code>green</code>といった<a href="http://www.w3schools.com/colors/colors_names.asp">定義済みの色</a>を利用することもできます.
  </p>
  
  <p>
    <code>blog/static/css/blog.css</code>ファイルに、次のコードを追加しましょう。
  </p>
  
  <p>
    {% filename %}blog/static/css/blog.css{% endfilename %}
  </p>
  
  <pre><code class="css">h1 a {
    color: #FCA205;
}
</code></pre>
  
  <p>
    <code>h1 a</code>はCSSセレクタと呼ばれるものです。 <code>h1</code> 要素の中にある <code>a</code> 要素にスタイルを適用します、という意味になります。 よって <code>&lt;h1&gt;&lt;a href=""&gt;link&lt;/a&gt;&lt;/h1&gt;</code>となっているとき、 <code>h1 a</code> スタイルが適用されます。 この場合、その要素を<code>#FCA205</code>に、つまりオレンジ色にしようとしています。 もちろん、あなたの好きな色に変えられます！
  </p>
  
  <p>
    CSSファイルには、HTMLファイルの各要素のスタイルを指定していきます。 まずは要素名でもって、その要素を識別します。 HTMLのタグ名は覚えがあるでしょう。 例えば <code>a</code>, <code>h1</code>, <code>body</code> などが要素名となります。 また、<code>class</code> 属性や、<code>id</code> 属性によって要素を識別することができます。 classやidは、あなたが自分で要素につけることができる名前です。 classは要素のグループを定義して、idは特定の要素を指定します。 例えば、次のタグは、タグ名<code>a</code>、class名<code>external_link</code>、id名<code> link_to_wiki_page</code>、どれを使ってもCSSによって識別されます。
  </p>
  
  <pre><code class="html">&lt;a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page"&gt;
</code></pre>
  
  <p>
    CSSセレクタについては<a href="http://www.w3schools.com/cssref/css_selectors.asp">CSS Selectors in w3schools</a>を見てください。
  </p>
  
  <p>
    さて、CSSを追加したことをHTMLテンプレートに教えないといけません。<code>blog/templates/blog/post_list.html</code>を開いて、先頭にこの行を追加しましょう：
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">{% load staticfiles %}
</code></pre>
  
  <p>
    これで、このテンプレートに静的ファイルを読み込むことができました^^。そして、<code>&lt;head&gt;</code> と <code>&lt;/head&gt;</code> の中にあるBootstrap CSSファイルのリンクの下に、この行を追加しましょう：
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;link rel="stylesheet" href="{% static 'css/blog.css' %}"&gt;
</code></pre>
  
  <p>
    ブラウザは上から書いた順番でファイルを読み込むので、記述する箇所はよく確かめる必要があります。 順番が逆になると、私たちが書いたファイルがBootstrapのファイルに上書きされてしまうかもしれません。 このようにCSSファイルがどこにあるか示します。
  </p>
  
  <p>
    ファイルは次のようになっているはずです:
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">{% load staticfiles %}
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Django Girls blog&lt;/title&gt;
        &lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"&gt;
        &lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"&gt;
        &lt;link rel="stylesheet" href="{% static 'css/blog.css' %}"&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div&gt;
            &lt;h1&gt;&lt;a href="/"&gt;Django Girls Blog&lt;/a&gt;&lt;/h1&gt;
        &lt;/div&gt;

        {% for post in posts %}
            &lt;div&gt;
                &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
                &lt;h1&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h1&gt;
                &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
            &lt;/div&gt;
        {% endfor %}
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
  
  <p>
    保存して、サイトを更新してください。
  </p>
  
  <p>
    <img src="images/color2.png" alt="図 14.2" />
  </p>
  
  <p>
    素晴らしいですね！あとは、左サイドの余白幅を少し広げて、余裕を持たせてあげたらもっと良くなると思いませんか？やってみましょう。
  </p>
  
  <p>
    {% filename %}blog/static/css/blog.css{% endfilename %}
  </p>
  
  <pre><code class="css">body {
    padding-left: 15px;
}
</code></pre>
  
  <p>
    これをCSSに追加して、保存してください。どのように変化したか、さぁ見てみましょう！
  </p>
  
  <p>
    <img src="images/margin2.png" alt="図 14.3" />
  </p>
  
  <p>
    ヘッダーのフォントを変えてみませんか？ファイル <code>blog/templates/blog/post_list.html</code> の<code>&lt;head&gt;</code> タグの中に次の一行を貼り付けましょう。
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css"&gt;
</code></pre>
  
  <p>
    まずは、このリンクが <code>blog/static/css/blog.css</code> より前にあることを確かめましょう。この１行は <em>Lobster</em> というフォントをGoogle Fonts (https://www.google.com/fonts)から読み込むということを意味しています。
  </p>
  
  <p>
    <code>blog/static/css/blog.css</code> ファイルの中の、 <code>h1 a</code>という宣言ブロックを見つけてください（コードは<code>{</code> と <code>}</code>で囲まれています）。 そして、そのカッコの中に <code>font-family: 'Lobster';</code> と１行追加して、webサイトを更新してみましょう：
  </p>
  
  <p>
    {% filename %}blog/static/css/blog.css{% endfilename %}
  </p>
  
  <pre><code class="css">h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
</code></pre>
  
  <p>
    <img src="images/font.png" alt="図 14.3" />
  </p>
  
  <p>
    素晴らしいです！
  </p>
  
  <p>
    前述のように、CSS は、クラスの概念を持っています。 これらは、HTMLコードの一部の名前を指定し、他の部分に影響を与えずにこの部分にだけスタイルを適用することができます。 なんて便利なんでしょう！ 例えば、２つのdiv要素（ヘッダーと本文など）があったとして、これらのそれぞれに違うスタイルを適用することができます。 クラスを利用すると、違う見た目にできるのです。
  </p>
  
  <p>
    先に進んで、HTMLコードの一部に名前をつけましょう。ヘッダーに含まれる<code>div</code> 要素に、<code>page-header</code> というクラス名をつけましょう：
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;div class="page-header"&gt;
    &lt;h1&gt;&lt;a href="/"&gt;Django Girls Blog&lt;/a&gt;&lt;/h1&gt;
&lt;/div&gt;
</code></pre>
  
  <p>
    さらにブログ投稿を含む<code>div</code> 要素に<code>post</code> というクラス名をつけましょう。
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;div class="post"&gt;
    &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
    &lt;h1&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h1&gt;
    &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
&lt;/div&gt;
</code></pre>
  
  <p>
    そして、別のセレクタに宣言ブロックを追加します。 <code>.</code>で始まるセレクタはクラスに関連します。 Web上にはCSSに関する多くのチュートリアルがあり、それらは以下に示すコードを理解する手助けになるはずです。 今のところは、<code>blog/static/css/blog.css</code>のファイルに以下の内容をコピー＆ペーストしましょう：
  </p>
  
  <p>
    {% filename %}blog/static/css/blog.css{% endfilename %}
  </p>
  
  <pre><code class="css">.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
</code></pre>
  
  <p>
    そして、これをクラス宣言で投稿を表示しているHTMLコードで囲みます。 <code>blog/templates/blog/post_list.html</code> 中のこの部分を
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">{% for post in posts %}
    &lt;div class="post"&gt;
        &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
        &lt;h1&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h1&gt;
        &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
    &lt;/div&gt;
{% endfor %}
</code></pre>
  
  <p>
    これで置き換えて下さい：
  </p>
  
  <p>
    {% filename %}blog/templates/blog/post_list.html{% endfilename %}
  </p>
  
  <pre><code class="html">&lt;div class="content container"&gt;
    &lt;div class="row"&gt;
        &lt;div class="col-md-8"&gt;
            {% for post in posts %}
                &lt;div class="post"&gt;
                    &lt;div class="date"&gt;
                        &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
                    &lt;/div&gt;
                    &lt;h1&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h1&gt;
                    &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
                &lt;/div&gt;
            {% endfor %}
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre>
  
  <p>
    それらのファイルを保存してwebサイトを更新してみましょう。
  </p>
  
  <p>
    <img src="images/final.png" alt="図 14.4" />
  </p>
  
  <p>
    やったー！ ほら凄いでしょ？ 貼り付けたコードを見て、HTMLでクラスを追加してCSSで使用した場所を見つけてみましょう。 日付の色をターコイズブルーにするには、どこを変更すればいいでしょう？
  </p>
  
  <p>
    Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!
  </p>
  
  <p>
    We really recommend taking this free online <a href="https://www.codecademy.com/tracks/web">Codeacademy HTML & CSS course</a>. It can help you learn all about making your websites prettier with CSS.
  </p>
  
  <p>
    さて、次の章にいく準備はできましたか？^皿^
  </p>