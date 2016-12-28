# Django urls

我们将要建立第一个网页：你博客的主页！但是首先，让我们先学习一点 Django 的 url 知识。

## 什么是 URL？

简单地说，URL 是一个网页地址。 每当你访问一个网站时，你都能在浏览器的地址栏里看到一个 URL。（是的！ `127.0.0.1:8000` 是一个URL！ 同时 `https://djangogirls.org` 也是一个 URL）：

![URL][1]

 [1]: images/url.png

每一个互联网的网页都需要自己的 URL。 这样当用户打开一个 URL 时，你的应用程序才知道应该展现什么内容。 在 Django 中，我们使用一种叫做 `URLconf` （URL 配置）的机制 。 URLconf 是一套模式，Django 会用它来把 URL 匹配成相对应的 View。

## URL 在 Django 中如何工作？

使用你喜欢的编辑器打开 `mysite/urls.py` 就能看到它长什么样子了：

    from django.conf.urls import include, url
    from django.contrib import admin
    
    urlpatterns = [
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),
    
        url(r'^admin/', include(admin.site.urls)),
    ]
    

正如你所看到的，Django 已经为我们放了一些东西在里面。

以 `#` 开头的行是注释，这些行都不会被Python运行。是不是很方便呢？

你在上一章节中学到的 admin 的 URL 已经在里面了：

    url(r'^admin/', include(admin.site.urls)),
    

这表示对于每一个以 `admin` 开头的 URL，Django 都会找到一个相对应的 *view*。 在这行代码中，我们包含了许多 admin URL 进来，所以这些 URL 不需要都被打包进这个小文件中。这使得代码更具可读性和简洁性。

## 正则表达式

你知道 Django 是如何将 URL 匹配到 view 的吗？ 好吧，这部分很棘手。 Django 使用了 `regex`，这是“正则表达式”的缩写。 正则表达式有很多（非常多！）规则用来形成一个搜索模式。 由于正则表达式是一个比较深入的话题，我们不会太深入讲解它的运行机制。

如果你还是想要了解怎样创建这些模式，下面有一个例子。我们只需要有限的规则的子集，就可以表达出想要的模式，比如：

    ^ 表示文本的开始
    $ 表示文本的结束
    \d 表示数字
    + 表示前面的元素应该重复至少一次
    () 用来捕捉模式中的一部分
    

其他定义在模式中的部分会保留原本的含义。

现在，想象你有一个网站，其中有一个 URL 类似这样：`http://www.mysite.com/post/12345/`。其中 `12345` 是帖子的编号。

为每一个帖子都写一个单独的视图是一件会让人恼火的事情。 用正则表达式，我们可以创建一种模式，用来匹配 URL 并提取出帖子编号：`^post/(\d+)/$`。 让我们一步一步将它分解，看看里面做了什么：


* **^post/** 告诉 Django 在 URL 的开头匹配 `post/` (后于 `^`)
* **(\d+)** 表示 URL 中会有一个数（一位或者多位数字），并且我们想提取出这个数
* **/** 告诉 Django 后面紧跟着一个 `/` 字符
* **$** 表示 URL 的末尾，即以 `/<1>` 结尾的 URL 才会被匹配到

## 你的第一个 Django url！

是时候创建第一个 URL 了！我们想用 'http://127.0.0.1:8000/' 作为博客的首页，并展示一个帖子列表。

我们也想保持 `mysite/urls.py` 文件简洁，所以我们从 `blog` 应用导出 urls 到主 `mysite/urls.py` 文件。
来吧，删除被注释掉的那行（以 `#` 开头的行），然后添加一行代码用于把 `blog.urls` 导入到主 url (`''`).
    
你的 `mysite/urls.py` 文件现在应该看起来像这样：
        
    from django.conf.urls import include, url
    from django.contrib import admin
            
    urlpatterns = [
        url(r'^admin/', include(admin.site.urls)),
        url(r'', include('blog.urls')),
    ]
            
        
现在，Django 会把访问 'http://127.0.0.1:8000/' 的请求转到 `blog.urls`，并看看那里面有没有进一步的指示。
        
写正则表达式时，记得把一个 `r` 放在字符串的前面。 这告诉 Python，这个字符串中的特殊字符是为正则表达式准备的，而不是为 Python 自身准备的。
        
## blog.urls
        
现在我们创建一个新的 `blog/urls.py` 空文件。好了！加入以下两行：
        
    from django.conf.urls import url
    from . import views

我们仅仅把 Django 的方法以及 `blog` 应用的全部 `views` 导入了进来。（目前什么都没有，但是不超过一分钟就能搞好！） 然后，我们可以加入第一个 URL 模式：
        
    urlpatterns = [
        url(r'^$', views.post_list, name='post_list'),
    ]
            
        
正如你所见，我们现在分配了一个叫作 `post_list` 的 `view` 到 `^$` 的 URL 上。 这个正则表达会会匹配 `^`（表示开头）并紧随 `$` （表示结尾），所以只有空字符串会被匹配到。 这是正确的，因为在 Django 的 URL 解析器中，'http://127.0.0.1:8000/' 并不是 URL 的一部分。（译注：即只有 'http://127.0.0.1:8000/' 后面的部分会被解析。如果后面的部分为空，即是空字符串被解析。） 这个模式告诉了 Django，如果有人访问 'http://127.0.0.1:8000' 地址，那么 `views.post_list` 是这个请求该去到的地方。
        
最后的部分，`name='post_list'` 是 URL 的名字，用来唯一标识对应的 view。 它可以跟 view 的名字一样，也可以完全不一样。 在项目后面的开发中，我们将会使用命名的 URL ，所以在应用中为每一个 URL 命名是重要的。我们应该尽量让 URL 的名字保持唯一并容易记住。
        
一切都搞定了？在浏览器里打开 http://127.0.0.1:8000/ ，看看结果。
        
![错误][2]
        
"It works" 不见了，啊？不要担心，这只是个错误页面，不要被吓到了。它们实际上是非常有用的：
        
你会发现有一个 **no attribute 'post_list'** （没有 'post_list' 属性）的错误。 *post_list* 提醒你什么东西了吗？ 这是我们的 view 的名字！ 这表示其他的一切正常，但是我们还没创建这个 *view* 。 不要担心，我们将会抵达那里。
        
> 如果你想知识更多关于 Django URLconf 的知识，去官方文档看一看：https://docs.djangoproject.com/en/1.8/topics/http/urls/

 [2]: images/error1.png
