{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# アプリケーションを拡張しよう

もう、ウェブサイトを作るのに必要な全ての章は終わりました。どのようにモデル、URL、ビュー、テンプレートを書いたら良いかわかっていますし、またウェブサイトの作り方もわかります。

さあ練習しましょう！

ブログに最初に必要なものはおそらく、記事を表示するページですよね。

もう`Post`モデルが入っていますから、`models.py`は追加する必要はありません

## 投稿の詳細へのテンプレートリンクを作成する

`blog/templates/blog/post_list.html`ファイルに次のようにリンクを追加しましょう： {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{％raw％}投稿リストの投稿のタイトルから投稿の詳細ページへのリンクが必要です。 投稿の詳細ページにリンクするように`<h1><a href="">{{ post.title }}</a></h1>` {% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{％raw％}` {％url 'post_detail' pk = post.pk％} </ code>を説明します。 <code> {％％} </ code>という表記は、Djangoのテンプレートタグを使用していることを意味しています。 次にURLを作成するものを使用します！</p>

<p><code> post_detail </ code>の部分は、Djangoが<code> blog / urls.py </ code>にname = post_detailのURLを指定していることを意味します</p>

<p>pk = post.pkの部分は、 pkは主キーの略で、データベースの各レコードの一意の名前です。 Postモデルでプライマリキーを指定しなかったので、Djangoは私たちのために1つのキーを作成します（デフォルトでは、レコードごとに1、2、3と数字が増えます）。 私たちの記事はPostオブジェクトの他のフィールド（タイトル、作者など）にアクセスするのと同じ方法で、post.pkを書くことによって主キーにアクセスします！</p>

<p>さて、私たちがhttp://127.0.0.1:8000/に行くと、（<code> post_detail </ code>のURLまたは<em> view </ em>をまだ持っていないので、 >）。 それは次のようになります：</p>

<p><img src="images/no_reverse_match2.png" alt="NoReverseMatch error" /></p>

<h2>投稿の詳細へのURLを作成する</h2>

<p><code> post_detail </ code> <em>ビュー</ em>用に<code> urls.py </ code>にURLを作成しましょう！</p>

<p>最初の投稿の詳細がこの<strong> URL </ strong>に表示されるようにします：http://127.0.0.1:8000/post/1/</p>

<p>Djangoが<code> post_detail </ code>という名前の<em>表示</ em>を指すように<code> blog / urls.py </ code>ファイルにURLを作ってください。 <code> blog / urlsに<code> url（r '^ post /（？P＆lt; pk＆gt; \ d +）/ $'、views.post_detail、name = 'post_detail'）、</ code>行を追加します。 py </ code>ファイルにコピーします。 ファイルは次のようになるでしょう。</p>

<p>{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}</p>

<pre><code class="python">from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
`</pre> 

この部分` ^ post /（？P <pk> \ d +）/ $ </ code>は難しく見えますが、心配する必要はありません。</p>

<ul>
<li><code> ^ </ code>は「文字列の開始」を意味します。</li>
<li><code> post / </ code>というのは、最初の後に<strong>post</ strong>と<strong> / </ strong>という単語が含まれることを意味します。 ここまでは順調ですね。</li>
<li><code>(?P<pk>\d+)` -この部分はトリッキーです。 これは、Djangoがあなたがここに置いたすべてを、` pk </ code>という変数としてビューに転送することを意味します。 （これは<code> blog / templates / blog / post_list.html </ code>でプライマリキー変数に与えた名前と一致します）！<code> \ d </ code> 数字で、文字ではありません（0と9の間のすべてです）。 
<code> + </ code>は、そこに1つ以上の数字が必要であることを意味します。 したがって、<code> http://127.0.0.1:8000/post// </ code>のようなものは無効ですが、<code> http://127.0.0.1:8000/post/1234567890/ </ code>は 完全にOK！</li>
<li>
<code> / </ code>  - もう一度<strong> / </ strong>を入力する必要があります。</li>
<li><code>$` -「終わり」!を意味します。</li> </ul> 

つまり、ブラウザに` http://127.0.0.1:8000/post/5/ </ code>を入力すると、Djangoは<em>view</ em>を探していると理解します。<code> post_detail </ code>に移動し、<code> pk </ code>が<code> 5 </ code>と同じ情報をその<em>view</ em>に転送します。</p>

<p>[Ok] を我々 は <code>blog/urls.py` に新しい URL パターンを追加しました! ページを更新しましょう：http://127.0.0.1:8000/ Boom！ サーバーが再び実行を停止しました。 コンソールを見てください - 予想通り、もう一つのエラーがあります！

![AttributeError](images/attribute_error2.png)

あなたは次のステップが何であるか覚えていますか？ もちろん：ビューを追加する！ですね。

## 投稿の詳細ビューを追加する

今回は* view </ em>に追加のパラメータ` pk </ code>が与えられます。 私たちの<em>view</ em>はそれを捕らえる必要がありますか？ そこで関数を<code> def post_detail（request、pk）：</ code>として定義します。 urls（<code> pk </ code>）で指定した名前とまったく同じ名前を使用する必要があることに注意してください。 この変数を省略すると、エラーが発生します。</p>

<p>今、私たちは1つだけのブログ投稿を取得したいと考えています。 これを行うには、次のようにクエリーセットを使用できます。</p>

<p>{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}</p>

<pre><code class="python">Post.objects.get(pk=pk)
`</pre> 

しかし、このコードには問題があります。 与えられた`主キー</ code>（<code> pk </ code>）で<code> Post </ code>が存在しない場合、非常に醜いエラーが発生します。</p>

<p><img src="images/does_not_exist2.png" alt="DoesNotExist error" /></p>

<p>私たちはそれを望んでいません！ しかしもちろん、Djangoには、それを処理するものがあります：<code> get_object_or_404 </ code>。 与えられた<code> pk </ code>に<code> Post </ code>がない場合、<code> Page Not Found 404 </ code>のページが表示されます。</p>

<p><img src="images/404_2.png" alt="Page not found" /></p>

<p>自分用の<code>Page not found</ code>ページを作成することもできます。 しかし、それは現在非常に重要ではないので、私たちはそれをスキップします。</p>

<p><code> views.py </ code>ファイルに<em>view</ em>を追加してください。</p>

<p><code> blog / urls.py </ code>では<code> views.post_detail </ code>というビューを参照する<code> post_detail </ code>という名前のURLルールを作成しました。 これは、Djangoが<code> blog / views.py </ code>内の<code> post_detail </ code>というビュー機能を使うことを意味します。</p>

<p><code> blog / views.py </ code>を開き、他の<code>from</ code>行の近くに次のコードを追加する必要があります。</p>

<p>{% filename %}blog/views.py{% endfilename %}</p>

<pre><code class="python">from django.shortcuts import render, get_object_or_404
`</pre> 

ファイルの最後に*view</ em>を追加します：</p> 

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

ページを更新してみましょう：http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

出来ましたね！ しかし、あなたはブログのポストタイトルのリンクをクリックするとどうなりますか？

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

あらいやだ！ 別のエラー！ しかし、私たちはすでにそれに対処する方法をすでに知っていますね。 そう！テンプレートを追加する必要があります！

## 投稿の詳細へのテンプレートリンクを作成する

We will create a file in `blog/templates/blog` called `post_detail.html`.

It will look like this:

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)