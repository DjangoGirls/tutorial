# CSS — 让网页更美观

我们的博客看起来仍然很丑吧？是时候来让它变得更好看了！为此，我们将引入CSS。

## 什么是 CSS？

层叠样式表(Cascading Style Sheets)是一种语言，用于描述使用标记语言(如 HTML)编写的网站的外观和格式。我们可以用它来给我们的网页“化妆”。:)

但我们不想总是从零开始，对吧？我们将再一次使用一些网上已有的免费资源。毕竟重造轮子并不好玩。

## 让我们用 Bootstrap 吧！

Bootstrap 是目前最受欢迎的前端框架之一，可以被用来开发美观的网站:https://getbootstrap.com/

它最先是由 Twitter 的员工开发的，现在由来自世界各地的志愿者开发。

## 安装 Boostrap

为了成功安装Bootstrap，你需要把以下代码写在你的`.html`文件的`<head>`部分中：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

这不会将任何文件添加到你的项目中。它只是指向在互联网上已经存在的文件。接着，你只需要打开你的网站并刷新页面。你瞧！

![图 14.1](images/bootstrap1.png)

已经变得更好看了！

## Django 中的静态文件

最后我们来看看这些我们叫做**静态文件**的东西。  静态文件是指你所有的CSS文件和图片文件，这些文件不是动态的，对所有用户都是一样，不会因为请求内容而发生变化。

### Django的静态文件放在哪儿呢？

Django已经知道到何处找到内建“admin”应用的静态文件。现在我们只需要给我们的`blog`应用添加一些静态文件。

我们在blog应用的目录下创建一个名为`static`的文件夹，创建后目录结构如下：

```
    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
```

Django会自动找到你应用文件夹目录下所有名字叫“static”的文件夹，并能够使用其中的静态文件。

## 你的第一个 CSS 文件！

为了给你的网页添加你自己的样式，我们先来创建一个CSS文件吧。在`static` 的目录下创建一个新的文件夹称为 `css` 。然后在`css`文件夹里新建一个文件命名为`blog.css`。 准备好了吗？

```
    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
```

是时候来写一些CSS了！首先用你的代码编辑器打开`blog/static/css/blog.css`。

在这里我们不会太深入学习自定义和关于 CSS的内容 ，因为这些内容很容易而且您可以在本教程结束后自行学习。这页的最后会推荐一个免费课程来学习更多相关的内容。

但我们至少还会涉及到一些CSS的代码。 让我们试试改变网页标题的颜色？ 为了理解颜色，计算机使用了一些特殊的编码。 这些编码是以`#`开始，后面跟着六位字母 （A 到 F) 或数字 (0-9)。 例如，蓝色的编码是`#0000FF`。你在这里可以发现许多颜色的编码： http://www.colorpicker.com/。 你也可以使用 [预先定义的颜色](http://www.w3schools.com/cssref/css_colornames.asp)，如 `red` 和 `green`。


在你的`blog/static/css/blog.css`文件中添加下面的代码:

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
}
```

`h1 a`是CSS选择器。 这样，我们可以把样式应用到`h1`元素中的任意`a`元素。 所以，当我们的代码中有类似`<h1><a href="">link</a></h1>`的代码， 上述的样式就会被应用。 在这段样式代码中我们把它的颜色设为`#FCA205`, 这代表着橙色。 当然，你可以把自己的颜色放在这里！

在CSS文件中，我们指明了HTML文件里各种元素的样式。 我们识别元素的第一种方法是使用元素名。 你可能还记得HTML部分中的那些标签。 诸如`a`，`h1`和`body`等都是元素名。 我们也可以用`class`属性和`id`属性来定义元素。 class和id是你自己给该元素定义的名称。 class定义一组元素，而id则指定特定的元素。 例如，下面的标签使用了 `a` 作为标签名,`external_link` 为 class 名, id 名则是 `link_to_wiki_page`.


```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```


你可以通过[w3schools的CSS选择器部分]( http://www.w3schools.com/cssref/css_selectors.asp)了解更多内容。

然后，我们需要让HTML文件知道我们增加了一些CSS样式。打开文件`blog/templates/blog/post_list.html`并把这行代码放在HTML文件的开头。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
    {% load staticfiles %}
```


我们刚刚加载了静态文件到这里（译者注：这里实际上是为模板引入staticfiles相关的辅助方法）：）。 然后，在`<head>` 和 `</head >`之间，在Bootstrap的CSS文件的引导之后添加以下行：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

浏览器按照给定的顺序读取文件，所以我们需要确保这行代码写在正确的位置。 否则，我们在CSS文件中代码可能被Bootstrap文件中的代码覆盖。 这样，HTML文件就知道我们的CSS文件的位置了。

现在你的HTML文件应该看起来像这样：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>published: {{ post.published_date }}</p>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

OK, 保存文件再刷新下网页吧！

![图 14.2](images/color2.png)

哎呦不错哦，也许我们还可以给我们的网页增加一点空白，比如增加一下左边的边距？来试试吧！

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

把它添加到你的CSS文件中，保存文件，然后看看你的网页发生了什么变化吧！

![图 14.3](images/margin2.png)

接着我们可以试试自定义标题中的字体。把这段代码粘贴到你 `blog/templates/blog/post_list.html`文件中的`<head>`部分：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

跟以前一样，我们需要确保代码的正确顺序。把这一行代码放在链接到`blog/static/css/blog.css`的代码之前。它会从 Google Fonts (https://www.google.com/fonts) 引入一个叫作 *Lobster* 的字体。

在CSS文件`blog/static/css/blog.css`中找到`h1 a`所声明的代码块（即`{`和`}`之间的代码）。 然后在大括号之间加上`font-family: 'Lobster';`。然后刷新页面看看效果吧：

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![图 14.3](images/font.png)

太棒了！

上文提到过，CSS 能通过类 (class) 来控制 HTML 页面的显示。 这样，你就可以给一部分 HTML 代码命名，然后为其增添样式。而且这并不会影响到其他部分的显示。 这功能超级有用！ 当你有两个不同的 div 代码块（例如：一个是标题，一个是文章）。 类 (class) 的运用就能使这两个代码块拥有不同的样式。

继续为你的 HTML 代码命名吧。在包含标题的`div`块中添加名为`page-header`的类，就像这样：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

然后在包含文章的`div`块中添加名为`post`的类。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

现在，我们将把声明块放入不同的选择器中。 选择器以 `.` 开始，后面紧跟着类名。 网络上有很多很棒的CSS教程以及相关解释，帮助您理解下面的代码。 至于现在，就简单地把以下代码复制粘贴到你的 `blog/static/css/blog.css` 文件中吧。

{% filename %}blog/static/css/blog.css{% endfilename %}
```css
.page-header {
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
```

然后将文章的HTML代码用类声明包裹起来。替换以下内容：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

在 `blog/templates/blog/post_list.html` 是这样的：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

保存这些文件并刷新您的网站。

![图 14.4](images/final.png)

瞧！ 看起来很棒吧？ 看看我们刚刚复制的代码，然后分别找到我们在 HTML 中添加的类，和这些类在 CSS 中的声明组。 如果你想要把日期 (data) 的颜色改为绿松石色 (turquoise)，需要修改哪里的代码呢？

不要害怕，试着去修改一点CSS代码吧。 调整CSS可以帮你搞明白不同的东西怎样工作。如果你做错了什么东西，别担心，您总是可以撤消它 ！

我们为你推荐这个免费的在线课程[Codeacademy HTML 和 CSS 课程](https://www.codecademy.com/tracks/web)。 它可以帮助您了解所有CSS的知识，来使你的网页更加美观。

准备好进入下一章了吗？:)