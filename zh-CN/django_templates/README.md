# Django模板

是时候把数据展示出来了！Django提供了一个非常有用的内置来实现\----**模板标签**

## 什么是模板标签呢？

You see, in HTML, you can't really write Python code, because browsers don't understand it. They know only HTML. We know that HTML is rather static, while Python is much more dynamic.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## 展现文章列表模板

在之前的章节，我们给我们的模板一系列文章在`post`变量里。现在我们将在HTML里展现它。

为了用模板标签在HTML中显示变量， 我们会使用两个大括号， 并将变量包含在里面，正如这样

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

在你的 `blog/templates/blog/post_list.html` 文件中进行如下的操作。 Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. 并保存文件，刷新页面后去看看我们做的那些改变。

![图 13.1](images/step1.png)

如你所见，我们得到如下：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

这意味着Django视它为对象的列表。 还记得在 **Python入门介绍** 里我们怎么展现列表的吗？ 是的， 我们可以使用循环！ 在dajngo模板中使用循环去遍历它们。如下所示：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

在你的模板里试试这个。

![图 13.2](images/step2.png)

它工作了！ But we want the posts to be displayed like the static posts we created earlier in the **Introduction to HTML** chapter. 你可以混合HTML和模板标签。 我们的`body`将长得像这样：

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}所有的在`{% for %}` 和 `{% endfor %}` 之间的内容将会被Django对象列表中的每个对象所代替。刷新页面去看看：{% endraw %}

![图 13.3](images/step3.png)

Have you noticed that we used a slightly different notation this time (`{{ post.title }}` or `{{ post.text }}`)? 我们正在访问定义在`Post`模型中的每一个域。 Also, the `|linebreaksbr` is piping the posts' text through a filter to convert line-breaks into paragraphs.

## 还有一件事

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* 然后，重新登陆 [PythonAnywhere](https://www.pythonanywhere.com/consoles/) 并进入**Bash 控制台** (或重开一个)，并运行:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)