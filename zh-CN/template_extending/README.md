# 模板扩展

另一个有趣的事情Django已经为你做好了就是**模板扩展**。这是什么意思呢？它意味着你可以使用你的HTML相同代码为你网站不同的网页共享。

模板帮助你，当你想使用相同的信息或者展示在多余一个地方的时候。 你不需要重复在每个文件中 并且如果你想改变内容，你不需要在每个木板中修改，只需要一次

## 创建一个基本模板

一个基础模板是最重要的模板，你扩展到你网站的每一页。

让我们创建一个`base.html`文件到`blog/templates/blog/`:

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

然后在`base.html`中，替换你所有的 `<body>`(所有的在`<body>` 和 `</body>`之间的内容)像这样：

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

{% raw %}You might notice this replaced everything from `{% for post in posts %}` to `{% endfor %}` with: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

But why? 你刚才创建了`block<0>  你使用template 标记<code>{% block %}` 来标记一个区域，这个区域是html格式 这个HTML将要从别的模板中扩展过来 (`base.html`). 我们一会儿将给你展示这个如何使用。

Now save `base.html` and open your `blog/templates/blog/post_list.html` again in the code editor. {% raw %}你需要一掉任何在 `{% for post in posts %}`之下和 `{% endfor %}`之上的内容. When you're done, the file will look like this:{% endraw %}

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

我们需要使用这个在你的模板中在所有的conent模块。 现在需要添加block 标记在文件中

{% raw %}你希望你的block标记和你的 `base.html` 文件中的标记匹配. 你也希望include这个代码在你的内容block中。 为了做这个，把你需要的内容写入`{% block content %}` 和`{% endblock %}`中。 像这样:{% endraw %}

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

Only one thing left. We need to connect these two templates together. This is what extending templates is all about! We'll do this by adding an extends tag to the beginning of the file. Like this:

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

> 如果你得到error `TemplateDoesNotExist`, 这个意味着这里没有`blog/base.html`文件，你需要运行`runserver` 在终端中。 Try to stop it (by pressing Ctrl+C – the Control and C keys together) and restart it by running a `python manage.py runserver` command.