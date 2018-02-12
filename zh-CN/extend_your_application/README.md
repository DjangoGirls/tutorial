# 扩展您的应用

我们已经完成了所有创建网站的各项不同必须的步骤：我们知道如何写一个模型，url，视图和模板。我们同样知道如何让我们网站更漂亮。

现在来练习吧！

我们网站里的第一件事情就是，一个展现一篇博客的页面，对吗？

我们已经有了`Post`模型，所以我们不需要再添加任何内容到`models.py`文件中.

## 创建一个模板链接，跳转到博文的内容页

We will start with adding a link inside `blog/templates/blog/post_list.html` file. So far it should look like this: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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

{% raw %}我们在博文列表的博文标题处添加一个链接用于跳转到该博文的详细页面。 让我们编辑 `<h1><a href="">{{ post.title }}</a></h1>` 使得它能链接到博文详情页面：。{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}是解释神秘的 `{% url 'post_detail' pk=post.pk %}` 时候了。 正如你所猜想的，`{% %}`标记意味着我们正在使用Django模板标签。 这一次我们将使用一个能为我们创建URL的！{% endraw %}

The `post_detail` part means that Django will be expecting a URL in `blog/urls.py` with name=post_detail

And how about `pk=post.pk`? `pk` is short for primary key, which is a unique name for each record in a database. Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a number that increases by one for each record, i.e. 1, 2, 3) and adds it as a field named `pk` to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Now when we go to http://127.0.0.1:8000/ we will have an error (as expected, since we do not yet have a URL or a *view* for `post_detail`). It will look like this:

![NoReverseMatch 错误](images/no_reverse_match2.png)

## 创建文章详细页面的URL

让我们在`urls.py`里为我们的 `post_detail` *view* 创建一个URL!

我们希望我们的第一条文章详细页面显示在类似这样的**URL**： http://127.0.0.1:8000/post/1/

让我们在 `blog/urls.py` 文件中增加一个 URL 来指引 Django 到名为 `post_detail` 的 *view*，它将用来显示整篇博客文章。 Add the line `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` to the `blog/urls.py` file. 文件应当如下所示：

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

This part `^post/(?P<pk>\d+)/$` looks scary, but no worries – we will explain it for you:

- it starts with `^` again – "the beginning".
- `post/` just means that after the beginning, the URL should contain the word **post** and a **/**. So far so good.
- `(?P<pk>\d+)` – this part is trickier. 这表示Django会把所有你放到这里的东西转变成一个称作`pk`的变量并传递给视图。 (Note that this matches the name we gave the primary key variable back in `blog/templates/blog/post_list.html`!) `\d` also tells us that it can only be a digit, not a letter (so everything between 0 and 9). `+` 意味着需要一个或更多的数字。 So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly OK!
- `/` – then we need a **/** again.
- `$` – "the end"!

这意味着如果你键入`http://127.0.0.1:8000/post/5/`到你的浏览器里， Django 明白你在寻找一个叫做 `post_detail` 的 *视图*，然后传递`pk` 等于 `5` 到那个 *视图*.

OK, we've added a new URL pattern to `blog/urls.py`! Let's refresh the page: http://127.0.0.1:8000/ Boom! The server has stopped running again. Have a look at the console – as expected, there's yet another error!

![属性错误](images/attribute_error2.png)

你还记得下面应该怎么做吗？当然：添加一个视图！

## 增加文章详细页面的视图

This time our *view* is given an extra parameter, `pk`. 我们的*视图*需要能捕获它，对吗？ 所以我们将定义我们的函数为`def post_detail(request, pk):`。 注意我们需要使用我们在urls里指定的(`pk`)。 省略这个变量是不正确的，将会导致一个错误！

Now, we want to get one and only one blog post. To do this, we can use querysets, like this:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

But this code has a problem. If there is no `Post` with the given `primary key` (`pk`) we will have a super ugly error!

![对象不存在错误](images/does_not_exist2.png)

我们不希望那样！ 但是，当然，Django已经为我们处理好了这些：`get_object_or_404`。 In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![找不到页面](images/404_2.png)

好消息是你实际上可以创建你自己 `Page not found` 的页面和使它漂亮如你所愿。但现在它不是超级重要的，所以我们将跳过它。

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

好了。是时候刷新页面了： http://127.0.0.1:8000/

![文章列表](images/post_list2.png)

它工作了 ！但是，当您单击博客文章标题中的某个链接时，会发生什么呢？

![模板不存在的错误](images/template_does_not_exist2.png)

哦不 ！另一个错误 ！但我们已经知道如何处理它，对吗？我们需要添加一个模板 ！

## Create a template for the post details

我们将在`blog/templates/blog` 中创建一个文件，叫做 `post_detail.html`.

它看起来会像这样：

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

现在，我们要扩展 `base.html`。 在`content` 块中，我们想要显示一篇文章的published_date （如果存在的话）， 标题和文本。 但我们应该讨论一些重要的东西，对不对吗？

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![文章细节页面](images/post_detail2.png)

耶 ！它工作了！

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

然后，在一个 [PythonAnywhere 的 Bash 终端](https://www.pythonanywhere.com/consoles/)里运行：

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