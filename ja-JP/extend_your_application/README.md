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
<li><code>/` – then we need a **/** again.</li> 

- `$` – "the end"!</ul> 

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you are looking for a *view* called `post_detail` and transfer the information that `pk` equals `5` to that *view*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![AttributeError](images/attribute_error2.png)

Do you remember what the next step is? Of course: adding a view!

## Add a post's detail view

This time our *view* is given an extra parameter, `pk`. Our *view* needs to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in urls (`pk`). Omitting this variable is incorrect and will result in an error!

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![DoesNotExist error](images/does_not_exist2.png)

We don't want that! But, of course, Django comes with something that will handle that for us: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Create a template for the post details

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