# CSS - 让它更好看！

我们的博客看起来仍然很丑吧？是时候来让它变得更好看了！为此，我们将引入CSS。

## 什么是 CSS？

层叠样式表(Cascading Style Sheets)是一种语言，用来描述使用标记语言(如HTML)写成的网站的外观和格式。把它当做我们网站的化妆 ;)。

但我们不想总是从零开始，对吧？ 我们将会再一次采用程序们编写并发布到互联网上的免费玩意。 重新发明轮子十分无趣，你懂的。

## 让我们用 Bootstrap 吧！

Bootstrap是最流行的HTML和CSS框架之一，它可以用来开发炫酷的网站:https://getbootstrap.com/

起初，它由Twitter的程序员编写，现在由来自世界各地的志愿者写的。

## 安装 Boostrap

若要安装Bootstrap，您需要将它添加到你的 `.html` 文件的 `<head>` 中：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}
```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

这不会向你的项目添加任何文件。它只是指向在互联网上存在的文件。只需要继续打开您的网站并刷新页面。你瞧！

![图 14.1][1]

 [1]: images/bootstrap1.png

已经变得更好看了！

## Django 中的静态文件

最后我们来看看这些我们叫做**静态文件**的东西。 静态文件是指你所有的CSS文件和图片文件，这些文件不是动态的，对所有用户都是一样，不会因为请求内容而发生变化。

### Django的静态文件放在哪儿呢？

Django已经知道到何处找到内建“admin”应用的静态文件。现在我们只需要给我们的`blog`应用添加一些静态文件。


我们在blog应用的目录下创建一个名为`static`的文件夹，创建后目录结构如下：

```
    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite
```


Django会自动找到你应用文件夹目录下所有名字叫“static”的文件夹，并能够使用其中的静态文件。

## 你的第一个 CSS 文件！

现在让我们创建一个 CSS 文件，为了在您的 web 页中添加你自己的风格。 在`static` 的目录下创建一个新的目录称为 `css` 。 然后，在这个 `css` 目录里创建一个新的文件，称为 `blog.css` 。 准备好了吗？

```
    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
```


是时候来写一些CSS了！首先用你的代码编辑器打开`blog/static/css/blog.css`。

在这里我们不会太深入学习自定义和关于 CSS的内容 ，因为这些内容很容易而且您可以在本教程结束后自行学习。这页的最后会推荐一个免费课程来学习更多相关的内容。

但至少要做一点吧。 也许我们可以改变我们标题的颜色？ 计算机使用特殊的编码来了解颜色。 它们以 `#`开始，后面跟着 6 个字母 （A 到 F) 或数字 (0-9)。例如，蓝色的的编码是`#0000FF` 你在这里可以发现许多颜色的编码： http://www.colorpicker.com/。 你也可以使用 [预先定义的颜色][3]，如 `red` 和 `green`。

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

在你的`blog/static/css/blog.css`文件中添加下面的代码:

```css
    h1 a {
        color: #FCA205;
    }
```


`h1 a`是CSS选择器。 这意味着我们要将我们的样式应用于在 `h1` 元素的任何 `a` 元素 。所以，当我们的代码中有类似`<h1><a href="">link</a></h1>`的代码， 上述的样式就会被应用。在这种情况下，我们会告诉它要改变其颜色为 `#FCA205`，它是橙色的。 当然，你可以把自己的颜色放在这里！

在 CSS 文件中，我们决定HTML 文件中元素的样式。我们标识元素的第一种方式是用元素名。你可能把来自于HTML段落的这些元素名当做了标签记忆。 例如`a`，`h1`，`body`，这些都是元素名。我们也用属性去标识元素，如 `class` 或属性 `id` 。 类和 id 是你自己给该元素的命名。 类定义元素组，并指向特定元素的 id。 例如，可以使用标记名称 `a`、 类 `external_link` 或 id `link_to_wiki_page` 标识以下标签：


```html
    <a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```


可以在 [CSS Selectors in w3schools][4]了解更多.

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

我们还需要告诉我们的 HTML 模板，我们添加了一些 CSS。打开 `blog/templates/blog/post_list.html` 文件并在文件最开始的地方添加以下代码：

```html
    {% load staticfiles %}
```


我们刚刚加载了静态文件到这里（译者注：这里实际上是为模板引入staticfiles相关的辅助方法）：）。 然后，在`<head>` 和 `</head >`之间，在Bootstrap的CSS文件的引导之后添加以下行：

```html
    <link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

浏览器按照给定文件的顺序读取文件，所以我们需要确保代码在正确的位置，否则我们文件中的代码可能会覆盖Bootstrap文件中的代码。我们只是告诉我们的模板我们的 CSS 文件所在的位置。

现在，您的文件应该像这样：

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


好的保存该文件并刷新网站 ！

![图 14.2][5]

 [5]: images/color2.png

干得好 ！我想，也许我们也给我们的网站一点空间并增加左边缘。让我们来试试这个 ！

```css
    body {
        padding-left: 15px;
    }
```


将它添加到你的 css 代码，保存该文件并查看它如何工作 ！

![图 14.3][6]

 [6]: images/margin2.png

也许我们可以在我们的头中自定义字体吗？粘贴到你的 `< head >` 在 `blog/templates/blog/post_list.html` 文件中：

```html
    <link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```


这行将从谷歌的字体 （https://www.google.com/fonts） 中导入称为 *龙虾*的字体 。

现在添加一行 `font-family: 'Lobster';` 到CSS文件 `blog/static/css/blog.css` 的 `h1 a` 声明块中(花括弧 `{` 与 `}` 之间的代码)，然后刷新页面：

```css
    h1 a {
        color: #FCA205;
        font-family: 'Lobster';
    }
```


![图 14.3][7]

 [7]: images/font.png

太棒了！

如上文所述，CSS 有一个概念叫做类，其中基本上允许您命名的 HTML 代码的一部分并只对这部分应用样式，不会影响其他部分。 它是超级有用的如果你有两个 div，但他们有些很多不一样 （如您的标题和你的帖子）。类可以帮你让它们看起来不同。

继续命名部分HTML 代码。添加一个称为 `page-header` 的类到您的 `div`中，其中包含您的标题，像这样：

```html
    <div class="page-header">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
```


和现在将包含一篇博客文章的类`post`添加到您的 `div` 。

```html
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
```


现在，我们将向不同的选择器添加声明块。 选择器以 `.` 开始，关联到类。 网络上有很多很棒的CSS教程以及相关解释，帮助您理解下面的代码。 至于现在，就简单地复制粘贴到你的 `blog/static/css/blog.css` 文件中吧。

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
        float: right;
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

```html
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
```


保存这些文件并刷新您的网站。

![图 14.4][8]

 [8]: images/final.png

呜呼 ！看起来棒极了，是吧？看看我们刚在HTML粘贴加入的类以及在CSS中使用的代码。如果你想要时间变成绿松石色，你该在哪里做改变呢？

不要害怕摆弄这个 CSS，并试图去改变一些东西。调整CSS可以帮你搞明白不同的东西怎样工作。如果你做错了什么东西，别担心，您总是可以撤消它 ！

我们非常建议在线免费学习这个 [Codeacademy HTML 和 CSS 课程][2] 。它可以帮你学到一切你需要知道的有关如何通过CSS使你的网站更漂亮。

 [2]: https://www.codecademy.com/tracks/web

准备好下一章了吗？:)
