# テンプレートを拡張しよう

Djangoのまた別の素敵なところは**テンプレート拡張**です。これは何を意味するのでしょうか？それはHTMLの共通部分をウェブサイトの異なるページで使えるということです。

テンプレートは同じ情報やレイアウトを複数の場所で利用したいときに役立ちます。 各ファイル内で繰り返す必要はありません。 さらにもし何か変更したい場合、各テンプレートを変更する必要はなく、1回変更すればいいだけです！

## 基本テンプレートを作成する

基本テンプレートはあなたのウェブサイトの各ページを拡張するための最も基本的なテンプレートです。

`blog/templates/blog/`以下に`base.html`ファイルを作ってみましょう。

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Then open it up in the code editor and copy everything from `post_list.html` to `base.html` file, like this:

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
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <div class="date">
                            {{ post.published_date }}
                        </div>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text|linebreaksbr }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    </body>
</html>
```

それから`base.html`内の`<body>`全体(`<body>`と`</body>`の間のすべて)を次で置き換えます。

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <div class="page-header">
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
```

{% raw %}`{% for post in posts %}` から `{% endfor %}` が以下のように置き換えられたことに気づいたでしょうか。 {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

でも何のために？ あなたはただ`block`を作っただけです！ `{% block %}` テンプレートタグを、これからHTMLを挿入しようとする場所に使いました。 そのHTMLはこのテンプレート (`base.html`) を拡張した別のテンプレートからやってきます。 どうやって行うかはすぐに示します。

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %} `{% for post in posts %}` の上と `{% endfor %}` の下すべてを削除しましょう。 それが終わったら以下のようになっていると思います。{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <div class="date">
            {{ post.published_date }}
        </div>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

これをcontentブロックに対応するテンプレートのパーツとして使いたいです。このファイルにblockタグを追加する時です！

{% raw %}追加するblockタグは `base.html` ファイル中のタグにマッチしてほしいですよね。 また、blockタグにはcontentブロックに属するすべてのコードを含めたいですよね。 そうするには、すべてを `{% block content %}` と `{% endblock %}` の間に入れてあげればよいです。 このように:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
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

あとやることは一つだけです。これら二つのテンプレートをくっつけてあげる必要があります。これがテンプレートを拡張するということのすべてです！そうするにはこのファイルの先頭にextendsタグを追加します。次のように：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

That's it! Save the file, and check if your website is still working properly. :)

> もし `TemplateDoesNotExist` というエラーが出ていたら、 `blog/base.html` ファイルがないという意味で、コンソールで `runserver` が実行されたままになっていると思います。 これを止め(Ctrl+C - ControlとCのキーを同時押し)、それから `python manage.py runserver`コマンドを入力して再度サーバーを動かしてみてください。