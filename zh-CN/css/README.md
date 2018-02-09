# CSS – make it pretty!

我们的博客看起来仍然很丑吧？是时候来让它变得更好看了！为此，我们将引入CSS。

## 什么是 CSS？

层叠样式表 (Cascading Style Sheets) 是一种语言，用于描述使用标记语言 (如 HTML) 编写的网站的外观和格式。我们可以用它来给我们的网页“化妆” ;)。

但我们不会想要再重头来编写css的代码吧？我们将继续使用一些网上已有的免费资源。毕竟重造轮子并不好玩。

## 让我们用 Bootstrap 吧！

Bootstrap是最受欢迎的前端框架之一，可以被用来开发美观的网站

它最先是由 Twitter 的员工开发的。现在由来自世界各地的志愿者开发。

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

最后我们来看看这些我们叫做**静态文件**的东西。 静态文件包含CSS和图像文件。 其内容并不取决于发出的请求而是每个用户都相同的

### Django的静态文件放在哪儿呢？

Django 已经知道到哪儿为内置的 "admin" 应用找到静态文件。现在我们只需为我们自己的应用增加一些静态文件，`博客`.

我们在blog应用的目录下创建一个名为`static`的文件夹，创建后目录结构如下：

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Django会自动找出你项目文件夹中所有名为“static”的文件夹。它能够把里面的内容作为静态文件来使用。

## 你的第一个 CSS 文件！

为了给你的网页添加你自己的样式，我们先来创建一个CSS文件吧 创建一个新的目录称为 `css` 里面你 `static` 的目录。 然后在`css`文件夹里新建一个文件命名为`blog.css`。 准备好了吗？

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

是时候来写一些CSS了！首先用你的代码编辑器打开`blog/static/css/blog.css`。

在这里，我们不会太深入的去学习CSS的相关知识。如果你想了解更多内容，可以参考本页末尾提供的CSS免费课程的建议。

但我们至少还会涉及到一些CSS的代码。 让我们试试改变网页标题的颜色？ 为了理解颜色，计算机使用了一些特殊的代码。 这些代码是由`#`开始，后面跟着六位A到F的字母或0到9的数字。 例如，蓝色的代码是`#0000FF`。 你可以在这个网站找到不同颜色的代码：http://www.colorpicker.com/。 你也可以使用一些[预定义颜色](http://www.w3schools.com/colors/colors_names.asp)，比如`red`和`green`.

在你的`blog/static/css/blog.css`文件中添加下面的代码:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a`是CSS选择器。 这样，我们可以把样式应用到`h1`中的任意`a`元素中。 所以，如果我们有这样的代码`<h1><a href="">link</a></h1>`，通过`h1 a`描述的样式就将会生效。 在这段样式代码中我们把它的颜色设为`#FCA205`, 这代表着橙色。 当然，你可以改成你自己喜欢的颜色。

在CSS文件中我们指明了HTML文件里各种元素的样式。 我们识别元素的第一种方法是使用元素的名称。 你可能还记得那些HTML部分中的标签。 诸如`a`，`h1`和`body`等都是元素的名称。 We also identify elements by the attribute `class` or the attribute `id`. class和id是你自己给该元素的命名。 class定义多个元素，而id则指定特定的元素。 例如，下面的标签使用了 `a` 作为标签名,`external_link` 为 class 名, id 名则是 `link_to_wiki_page`.

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

你可以通过[w3schools的CSS选择器部分](http://www.w3schools.com/cssref/css_selectors.asp)了解更多内容。

然后，我们需要让HTML文件知道我们增加了一些CSS样式。打开文件`blog/templates/blog/post_list.html`并把这行代码放在HTML文件的开头。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

我们只是在这里加载静态文件。:) 接下来，我们在`<head>`和`</head>`之间，把下面这一行写到Bootstrap的文件链接之后。

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

哎呦不错哦，也许我们还可以给我们的网站一点空间，增加一下左边的边距？一起来试试吧！

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

As mentioned above, CSS has a concept of classes. These allow you to name a part of the HTML code and apply styles only to this part, without affecting other parts. This can be super helpful! Maybe you have two divs that are doing something different (like your header and your post). A class can help you make them look different.

继续命名部分HTML 代码。添加一个称为 `page-header` 的类到您的 `div`中，其中包含您的标头，像这样：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

和现在将包含一篇博客文章的类`post`添加到您的 `div` 。

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

现在，我们将向不同的选择器添加声明块。 选择器以 `.` 开始，关联到类。 There are many great tutorials and explanations about CSS on the Web that can help you understand the following code. 至于现在，就简单地复制粘贴到你的 `blog/static/css/blog.css` 文件中吧。

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

Woohoo! Looks awesome, right? Look at the code we just pasted to find the places where we added classes in the HTML and used them in the CSS. Where would you make the change if you wanted the date to be turquoise?

Don't be afraid to tinker with this CSS a little bit and try to change some things. Playing with the CSS can help you understand what the different things are doing. If you break something, don't worry – you can always undo it!

We really recommend taking this free online [Codeacademy HTML & CSS course](https://www.codecademy.com/tracks/web). It can help you learn all about making your websites prettier with CSS.

准备好下一章了吗？:)