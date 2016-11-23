# Django模板

是时候把数据展示出来了！Django提供了一个非常有用的内置来实现\---|-**模板标签**

## 什么是模板标签呢？

正如你在前面章节中所了解的那样， 我们并不能将python代码嵌入到HTML中。 因为浏览器不能识别python代码， 它只能解析HTML。 我们知道，HTML是静态页面，而python则显得更加动态。

**Django模板标签**允许我们将Python之类的内容翻译成HTML，所以你可以更快更简单的建立动态网站。哈哈！

## 展现文章列表模板

在之前的章节，我们给我们的模板一系列文章在`post`变量里。现在我们将在HTML里展现它。

为了用模板标签在HTML中显示变量， 我们会使用两个大括号， 并将变量包含在里面，正如这样

```html
    {{ posts }}
```
    

在你的 `blog/templates/blog/post_list.html` 文件中进行如下的操作。 将所有 `<div>` to the third `</div>` 中的 to the third 用 `{{ posts }}` 代替。 并保存文件，刷新页面后去看看我们做的那些改变。

![图 13.1][1]

 [1]: images/step1.png

如你所见，我们得到如下：

```
    [<Post: My second post>, <Post: My first post>]
```
    

这意味着Django视它为对象的列表。 还记得在 **Python入门介绍** 里我们怎么展现列表的吗？ 是的， 我们可以使用循环！ 在dajngo模板中使用循环去遍历它们。如下所示：

```html
    {% for post in posts %}
        {{ post }}
    {% endfor %}
```    


在你的模板里试试这个。

![图 13.2][2]

 [2]: images/step2.png

它工作了！ 但是想让他们展现的像我们之前在**HTML介绍**章节里创建的静态文章一样 你可以混合HTML和模板标签。 我们的`body`将长得像这样：

```html
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
```
    

{% raw %}所有的在`{% for %}` 和 `{% endfor %}` 之间的内容将会被Django对象列表中的每个对象所代替。刷新页面去看看：{% endraw %}

![图 13.3][3]

 [3]: images/step3.png

你注意到这次我们使用了一个明显不同的标记`{{ post.title }}` 或 `{{ post.text }}`？ 我们正在访问定义在`Post`模型中的每一个域。 此外，`|linebreaksbr`通过一个过滤器，使得行间隔编程段落。

## 还有一件事

如果我们将我们的网站放在互联网上运行，那将是一件很不错的事情，难道不是吗？ 让我们试着再次部署到 PythonAnywhere。简单部署步骤如下... ...

*   首先，我们将我们的代码放到Github

```
    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
```
    

*   然后，重新登陆 [PythonAnywhere][4] 并进入**Bash 控制台** (或重开一个)，并运行:

 [4]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ git pull
    [...]
```
    

*   最后， 我们返回 [Web tab][5] 重新加载我们的应用程序， 此时我们应该可以看到更新后的程序运行情况了。

 [5]: https://www.pythonanywhere.com/web_app_setup/

祝贺你！现在往前走，尝试在你的Django管理中添加一篇新文章（记得添加发布日期！），然后刷新你的页面看看是否文章正常显示了。

这一定是个让人沉醉的作品？为此我们应当骄傲， 在计算机学科的一点儿进步，都是自我的一次突破 :)。

![图 13.4][6]

 [6]: images/donut.png
