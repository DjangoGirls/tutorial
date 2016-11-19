# 模板扩展

另一个有趣的事情Django已经为你做好了就是**模板扩展**。这是什么意思呢？它意味着你可以使用你的HTML相同代码为你网站不同的网页共享。

通过这种方法，当你想使用同样的信息或布局，或者你想改变某些模板内容时，你不必在每个文件中都重复着相同的代码。你仅仅只需要改变一个文件，而不是所有的。

## 创建一个基础模板

一个基础模板是最重要的模板，你扩展到你网站的每一页。

让我们创建一个`base.html`文件到`blog/templates/blog/`:

```
    blog
    └───templates
        └───blog
                base.html
                post_list.html
```
    

然后将它打开，从`post_list.html`中复制所有东西到`base.html`文件，就像这样：

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
    

然后在`base.html`中，替换你所有的 `<body>`(所有的在`<body>` 和 `</body>`之间的内容)像这样：

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
    

用如下内容替换所有在 `{% for post in posts %}{% endfor %}`之间的代码：

```html
    {% block content %}
    {% endblock %}
```
    

这是什么意思呢？ 你刚刚创建了一个`block（块）`，这个模板标签允许你在其中插入扩展自`base.html`的模板的HTML代码。 我们一会儿将给你展示这个如何使用。

现在保存它，然后再次打开你的`blog/templates/blog/post_list.html`。 删除一切body外的代码，然后删除 `<div class="page-header"></div>`，此时文件会看起来像这样：

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
    

然后现在将这行加到文件的开始：

```html
    {% extends 'blog/base.html' %}
```
    

{% raw %}这意味着我们在 `post_list.html`模板文件中扩展了 `base.html` 模板的内容。 还有一件事：将所有(除了我们刚刚加入的那行) 内容置于`{% block content %}`和 `{% endblock content %}`之间。。 像这样:{% endraw %}

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
    {% endblock content %}
```
    

好了，就是它了！检查你的网站还能正常工作：）

> 如果你有任何错误 `TemplateDoesNotExists` 这意味着没有 `blog/base.html` 文件，你需要 `runserver` 运行在控制台，尝试去关掉它（通过按下Ctrl+C -Control和C按钮一切）然后重新运行`python manage.py runserver` 命令行。
