# 扩展您的应用

我们已经完成了所有创建网站的各项不同必须的步骤：我们知道如何写一个模型，url，视图和模板。我们同样知道如何让我们网站更漂亮。

现在来练习吧！

我们网站里的第一件事情就是，一个展现一篇博客的页面，对吗？

我们已经有了`Post`模型，所以我们不需要再添加任何内容到`models.py`文件中。.

## 创建一个模板链接，跳转到博文的内容页

我们将从在`blog/templates/blog/post_list.html`里添加一个链接开始。目前它应该看起来像这样：

```html
    {% extends 'blog/base.html' %}
    
    {% block content %}
        {% for post in posts %}
            <div class="post">
                <div class="date">
                    {{ post.published_date }}
                </div>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaks }}</p>
            </div>
        {% endfor %}
    {% endblock content %}
```
    
    

{% raw %}我们在博文列表的博文标题处添加一个链接用于跳转到该博文的详细页面。 让我们编辑 `<h1><a href="">{{ post.title }}</a></h1>` 使得它能链接到博文详情页面：。{% endraw %}

```html
    <h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```
    

{% raw %}是解释神秘的 `{% url 'post_detail' pk=post.pk %}` 时候了。 正如你所猜想的，`{% %}`标记意味着我们正在使用Django模板标签。 这一次我们将使用一个能为我们创建URL的！{% endraw %}

`blog.views.post_detail` 是我们想创建的 `post_detail` *view* 的路径。 请注意：`blog` 是我们应用的名字 (`blog`目录), `views` 是表单 `views.py` 文件的名字同时最后一个部分 - `post_detail` - 是 *view*的名字。.

现在当我们访问：http://127.0.0.1:8000/ 我们会得到一个错误（这是预料之中的，因为我们没有名为`post_detail` 的 URL 或 *视图*)。看起来会像这样:

![NoReverseMatch 错误][1]

 [1]: images/no_reverse_match2.png

## 创建文章详细页面的URL

让我们在`urls.py`里为我们的 `post_detail` *view* 创建一个URL!

我们希望我们的第一条文章详细页面显示在类似这样的**URL**： http://127.0.0.1:8000/post/1/

让我们在 `blog/urls.py` 文件中增加一个 URL 来指引 Django 到名为 `post_detail` 的 *view*，它将用来显示整篇博客文章。 增加这行 `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),` 到 `blog/urls.py` 文件。 文件应当如下所示：

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
]
```
    

`^post/(?P<pk>[0-9]+)/$` 部分看上去很骇人，请勿担心—我们来解释给你听： - 还是起始自 `^` — "开头部分" - `post/` 只是表示，紧接着开头，URL应当包含 **post** 和 **/**。 到目前为止，一切都好。 - `(?P<pk>[0-9]+)` - 这部分很棘手。 这表示Django会把所有你放到这里的东西转变成一个称作`pk`的变量并传递给视图。 `[0-9]`也告诉我们它只能由数字，而不是字母（所以是取值范围是介于0和9之间）。 `+` 意味着需要一个或更多的数字。 所以诸如`http://127.0.0.1:8000/post//`是无效的，但是像`http://127.0.0.1:8000/post/1234567890/`是完全OK的！ - `/` - 然后我们再次需要 **/** - `$` - "结尾"！

这意味着如果你键入`http://127.0.0.1:8000/post/5/`到你的浏览器里， Django 明白你在寻找一个叫做 `post_detail` 的 *视图*，然后传递`pk` 等于 `5` 到那个 *视图*.

`pk` 是 `primary key（主键）`的缩写。 在Django项目中常常用到这个名字。 但是你可以使用你想要的变量（记住：使用小写以及`_`而不是空格！）。 比如与其说 `(?P<pk>[0-9]+)` 我们可以有`post_id`, 所以这个就像： `(?P<post_id>[0-9]+)`.

好吧，我们已经向 `blog/urls.py` 添加了一个新的 URL 模式！让我们刷新页面： http://127.0.0.1:8000/ Duang！还有另一个错误！果然！

![属性错误][2]

 [2]: images/attribute_error2.png

你还记得下面应该怎么做吗？当然：添加一个视图！

## 增加文章详细页面的视图

这次我们的*视图*提供了一个额外的参数`pk`。 我们的*视图*需要能捕获它，对吗？ 所以我们将定义我们的函数为`def post_detail(request, pk):`。 注意我们需要使用我们在urls里指定的(`pk`)。 省略这个变量是不正确的，将会导致一个错误！

现在，我们想要有一个并且只有一个博客帖子。为了做到这一点，我们需要使用下面的请求集合：

```python
    Post.objects.get(pk=pk)
```
    

但是这段代码有一个问题。如果没有`Post`和给定`主键`（`pk`）我们将有一个非常丑陋的错误！

![对象不存在错误][3]

 [3]: images/does_not_exist2.png

我们不希望那样！ 但是，当然，Django已经为我们处理好了这些：`get_object_or_404`。 万一没有`Post`和给定的`pk`，它将展现更多有趣的页面（称作`Page Not Found 404`页面）。

![找不到页面][4]

 [4]: images/404_2.png

好消息是你实际上可以创建你自己 `Page not found` 的页面和使它漂亮如你所愿。但现在它不是超级重要的，所以我们将跳过它。

好吧，是时候将 *视图* 添加到我们的 `views.py` 文件了！

我们应该打开 `blog/views.py` 并添加以下代码：

```python
    from django.shortcuts import render, get_object_or_404
```
    

在 `from`附近 行。并在文件的末尾，我们将增加我们的 *view*：

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```
    

好了。是时候刷新页面了： http://127.0.0.1:8000/

![文章列表][5]

 [5]: images/post_list2.png

它工作了 ！但是，当您单击博客文章标题中的某个链接时，会发生什么呢？

![模板不存在的错误][6]

 [6]: images/template_does_not_exist2.png

哦不 ！另一个错误 ！但我们已经知道如何处理它，对吗？我们需要添加一个模板 ！

## 为文章详细页面增加模板

我们将在`blog/templates/blog` 中创建一个文件，叫做 `post_detail.html` .

它看起来会像这样：

```python
    {% extends 'blog/base.html' %}
    
    {% block content %}
        <div class="post">
            {% if post.published_date %}
                <div class="date">
                    {{ post.published_date }}
                </div>
            {% endif %}
            <h1>{{ post.title }}</h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endblock %}
```
    

现在，我们要扩展 `base.html`。 在`content` 块中，我们想要显示一篇文章的published_date （如果存在的话）， 标题和文本。 但我们应该讨论一些重要的东西，对不对吗？

{% raw %}`{% if ... %} ... {% endif %}` 是当我们想检查某样东西（还记得Python简介里的 if ... else ... 吗？）的时候的一种模板记号 。 在这个例子中，我们想要检查文章的 `published_date` 不是空的。{% endraw %}

好的，我们可以刷新我们的页面并查看是否 `Page not found` 是不是没有了。

![文章细节页面][7]

 [7]: images/post_detail2.png

耶 ！它工作了！

## 还有一件事：部署时刻！

你的网站如果还能在 PythonAnywhere 正常运转就好了，对吧？让我们再次部署。

```
    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
```
    

*   然后，在一个 [PythonAnywhere 的 Bash 终端][8]里运行：

 [8]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
```
    

*   最后，跳到 [Web 标签页][9] 并点击**重新载入**.

 [9]: https://www.pythonanywhere.com/web_app_setup/

就是这样！祝贺你：）
