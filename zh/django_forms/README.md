# Django表单

我们最后一件关于我们的网站的事情就是创建一个漂亮的方式来增加和编辑博客文章。 Django的`管理`是很酷，但是它很难去自定义，变得更漂亮。 通过`forms`，我们可以拥有对我们界面绝对的权利—我们能够做几乎我们能想象到的所有事情！

Django表单的一个好处就是我们既可以从零开始自定义，也可以创建`ModelForm`，它将表单的结果保存到模型里。

这正是我们想做的：我们将为我们自己的`Post`模型创建一个表单。

就像所有Django的重要部分一样，表单有他们自己的文件`forms.py`。.

我们需要创建一个文件，把它的名字放在`blog`目录下。

```
    blog
       └── forms.py
```
    

好吧，让我们打开它，然后键入以下代码：

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```
    

首先我们需要导入Django表单（`from django import forms`）然后，显然是我们的`Post`模型（`from .models import Post</0）。).></p>

<p><code>PostForm`, 正如你所猜想的，是我们表单的名字。 我们需要告诉Django，这个表单是一个`ModelForm`（所以Django将会为我们变一些魔法）—`forms.ModelForm`对此负责。

下面，我们有`class Meta`，在这里我们告诉Django哪个模型会被用来创建这个表单（`model=Post`）。).

最后，我们可以说哪些字段会在我们的表单里出现。 在这个场景里，我们只想要`title`和`text`显示出来—`author`应该是当前登录的人（你！）然后`created_date`应该是我们创建文章时自动分配的（比如，在代码里），对吗？

就是这样！现在我们所有要做的就是在*视图*里使用表单，然后展现在在模板里。

所以下次我们将会创建：一个指向页面的链接，一个URL，一个视图和一个模板。

## 指向页面表单的链接

是时候打开`blog/templates/blog/base.html`了。我们将添加一个链接到`div`，命名为`page-header`：

```html
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```
    

请注意我们想要调用我们的新视图`post_new`.

添加了新的行后，你的html文件现在应该看起来像这样：

```html
    {% load staticfiles %}
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
                <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
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
    </html>
```
    

然后保存，刷新http://127.0.0.1:8000页面，你可以明显地看到一个熟悉的`NoReverseMatch`错误信息，是吧？

## URL

我们打开`blog/urls.py`然后添加一个新行：

```python
        url(r'^post/new/$', views.post_new, name='post_new'),
```
    

最终代码会看起来像这样：

```python
from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```
    

刷新网页后，我们看到一个`AttributeError`，因为我们没有实现`post_new`视图。让我们现在把它加上吧。

## post_new视图

现在打开`blog/views.py`文件，加入下面的各行到`from`行下：

```python
from .forms import PostForm
```
    

还有我们的*view*：

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```
    

为了创建一个新的`Post`表单，我们需要调用`PostForm()`，然后把它传递给模板。 我们会回到这个*视图*，但是现在，让我们为这个表单快速创建一个模板。

## 模板

我们需要在`blog/templates/blog`目录下创建一个文件`post_edit.html`。为了创建一个表单，我们需要几件事情：

*   要展示表单，我们只需要很简单地加上`{% raw %}{{ form.as_p }}{% endraw %}`.
*   上面的这行需要被HTML表单标签包裹：`<form method="POST">...</form>`
*   我们需要一个`Save`按钮。我们通过使用一个HTML按钮来完成：`<button type="submit">Save</button>`
*   最后在`<form ...>`标签后，我们需要加上`{% raw %}{% csrf_token %}{% endraw %}`。 这个非常重要，因为他会让你的表单变得更安全！ Django会提醒你，当你试图保存表单而你又恰巧忘了这一点：

![CSFR Forbidden page][1]

 [1]: images/csrf2.png

好，让我们看看HTML 在`post_edit.html`里应该看起来什么样：

```html
    {% extends 'blog/base.html' %}
    
    {% block content %}
        <h1>New post</h1>
        <form method="POST" class="post-form">{% csrf_token %}
            {{ form.as_p }}
            <button type="submit" class="save btn btn-default">Save</button>
        </form>
    {% endblock %}
```
    

现在刷新！哇！你的表单显示出来了！

![新表单][2]

 [2]: images/new_form2.png

但是，请等一下！当你键入诸如`title`和`text`字段，然后视图保存它—下面会发生什么？

什么都没有！我们再一次回到了同一个页面，然而我们的文本已经消失了...同时没有新的文章被发布。所以错在哪里了呢？

答案是：没有错误。我们需要在我们的*视图*里做更多的工作.

## 保存表单

再一次打开`blog/views,py`。我们在看到`post_new`中的视图内容是:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```
    

当我们提交表单，我们都回到相同的视图，但是这个时候我们有一些更多的数据在 `request`，更具体地说在 `request.POST` (命名和博客后缀"post"无关，它只是用来帮我们"上传"数据)。 还记得在HTML文件里，我们的`<form>`定义有一个方法`method="POST"`？ 现在所有从表单来的东西都在`request.POST`. 你不应该重命名`POST`为其他任何东西（其他唯一有效的`method`值是`GET`，但是我们没有时间去解释它们两者的区别是什么）。

所以在我们的*视图*里，我们有了两种不同的情况去处理。 首先：当我们首次访问一个页面，我们想要得到一个空白的页面。 第二：当我们回到*视图*，要有我们所有我们刚刚键入的数据。 所以我们需要添加一个条件判断（我们为此使用`if`）。

```python
    if request.method == "POST":
        [...]
    else:
        form = PostForm()
```
    

现在去填写`[...]`。如果`method` 是 `POST`，那么我们要用表单里的数据构建`PostForm`，对吗？我们会这样做：

```python
    form = PostForm(request.POST)
```
    

很容易吧！下一件事情就是去检查表单是否正确（所有必填字段都要被设置并且不会保存任何不正确的值）。我们将使用`form.is_valid()`来实现.

我们检查表单是否正确，如果是我们就保存它！

```python
    if form.is_valid():
        post = form.save(commit=False)
        post.author = request.user
        post.published_date = timezone.now()
        post.save()
```
    

基本上，我们这里有两件事情：我们使用`form.save`保存表单，我们添加一个作者（因为 `PostForm` 中没有`author`字段，然而这个字段是必须的！）。 `commit=False`意味着我们还不想保存`Post`模型—我们想首先添加作者。 大多数情况下，当你使用`form.save()`时，不会使用`commit=False`，但是在这种情况下，我们需要这样做。 `post.save()`会保留更改（添加作者），并创建新的博客文章！

最后，如果我们能够立即去`post_detail`页面创建新的博客内容，那将很酷，对吗？为了做到这点，我们需要再导入一个：

```python
    from django.shortcuts import redirect
```
    

把它添加到你文件的最开始处。现在我们可以说：创建完新帖子我们就转去`post_detail`页面。

```python
    return redirect('blog.views.post_detail', pk=post.pk)
```
    

`blog.views.post_detail` 是我们想去的视图的名字。 还记得这个*视图* 需得具有一个 `pk` 变量吗? 为了把它传递给视图我们使用`pk=post.pk`, 其中 `post` 就是我们刚刚创立的博客帖子！

好吧，我们已经说了很多了，但可能我们想看到整个*视图*现在看起来什么样，对吗？

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```
    

让我们看看它是否正常工作。 转到页 http://127.0.0.1:8000//post/new/，添加 `title` 和 `text`，将它保存... 看！ 新博客文章已经加进来了，我们被重定向到`post_detail`页面！

你可能已经注意到在保存博客文章之前我们设置发布日期。稍后，我们讲介绍一个在 **Django Girls 教程：扩展**中介绍 *publish button* 。.

太棒了！

## 表单验证

现在，我们将给你展现Django表单是多么酷。 一篇博客文章需要有`title`和`title`字段。 在我们的`Post`模型中我们并没有说（和`发布日期`恰恰相反）这些字段不是必须的，所以Django，默认期望他们是有存储数据的。

尝试不带`title`和`text`内容保存表单。猜猜，会发生什么！

![表单验证][3]

 [3]: images/form_validation2.png

Django会处理验证我们表单里的所有字段都是正确的。这不是很棒？

> 因为我们最近使用过Django管理界面，系统目前认为我们已经登录了。 有几种情况可能导致我们被登出（关闭浏览器，重新启动数据库等等）。 如果你发现当你创建一个文章时得到了一个指向未登录用户错误的时候，前往管理页面`http://127.0.0.1:8000/admin`，再登录。 这会暂时解决问题。 有一个一劳永逸的方法在等着你，可以看看只要教程后的**Homework: add security to your website!** 章节。

![记录错误][4]

 [4]: images/post_create_error.png

## 编辑表单

现在我们知道如何添加一个新的表单。 但是如果我们想编辑一个现有的呢？ 这和我们刚才做的非常相似。 让我们快速创建一些重要的东西（如果你还不清楚他们，你应该问问你的教练或者看看前面的章节，因为我们已经覆盖了所有的这些步骤）。

打开 `blog/templates/blog/post_detail.html` 并添加以下行：

```html
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```
    

所以模板看起来像这样：

```html
    {% extends 'blog/base.html' %}
    
    {% block content %}
        <div class="post">
            {% if post.published_date %}
                <div class="date">
                    {{ post.published_date }}
                </div>
            {% endif %}
            <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
            <h1>{{ post.title }}</h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endblock %}
```
    

在`blog/urls.py`里我们添加这行：
    
```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```
    

我们将复用模板`blog/templates/blog/post_edit.html`，所以最后缺失的东西就是 *view*.

让我们打开`blog/views.py`，并在文件的最后加入：

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('blog.views.post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```
    

这看起来几乎完全和我们的`post_new`视图一样，对吗？ 但是不完全是。 第一件事：我们从urls里传递了一个额外的`pk`参数。 然后：我们得到了`Post`模型，我们想编辑`get_object_or_404(Post, pk=pk)`，然后当我们创建了一个表单我们用一个`实例`来传递这篇文章，当我们想保存它：

```python
    form = PostForm(request.POST, instance=post)
```
    

当我们只是打开这篇文章的表单来编辑时：

```python
    form = PostForm(instance=post)
```
    

好，让我们来试试它是否可以工作！让我们先去`post_detail`页面。在右上角应该有一个编辑按钮：

![编辑按钮][5]

 [5]: images/edit_button2.png

当你点击它的时候，你会看到我们博客文章的表单。

![编辑表单][6]

 [6]: images/edit_form2.png

随意修改标题和内容，然后保存更改！

祝贺你！你的应用程序正在变得越来越完整！

如果你需要更多关于Django表单的信息，你应该阅读文档： https://docs.djangoproject.com/en/1.8/topics/forms/

## 安全性

能够通过点击一条连接进行发布确实不错。 但是现在，任何访问你网站的人都能够发布一条新博客日志，这可能不是你想要的。 那让我们来让这个发布按钮只显示给你，对其他人则不显示。

在 `blog/templates/blog/base.html`中，找到我们 `page-header` `div` 和你早些时候在放那里锚点标记。看起来应该像这样：

```html
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```
    

我们要将另一个 `{% if %}` 标记到这, 这会使链接仅在以管理者身份登录的用户访问时显示。现在来说，管理员就是你！ 像这样修改 `<a>` 标记：

```html
    {% if user.is_authenticated %}
        <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
    {% endif %}
```
    

这个 `{% if %}` 会使得链接仅仅发送到哪些已经登陆的用户的浏览器。 这并不能完全保护发布新文章，不过这是很好的第一步。 我们将在扩展课程中包含更多安全部分。

你应已登录，如果你刷新页面，你不会看到有什么不同。不过，在新的浏览器或隐身窗口中加载页，你会看不到这个链接!

## 还有一件事：部署时刻！

我们来看看这一切能否运行在 PythonAnywhere 上。另一次部署的时间到了！

*   首先，提交你的新代码，然后将它推送到 Github 上


```
    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
```
    

*   然后，在一个 [PythonAnywhere 的 Bash 终端][7]里运行：

 [7]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
```
    

*   最后，跳到 [Web 标签页][8] 并点击**重新载入**.

 [8]: https://www.pythonanywhere.com/web_app_setup/

就是这样！祝贺你：）
