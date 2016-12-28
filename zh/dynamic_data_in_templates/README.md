# 模板中的动态数据

我们已有的几件： `Post` 模型定义在 `models.py` 中，我们有 `post_list` `views.py` 和添加的模板中。 但实际上我们如何使我们的帖子出现在我们的 HTML 模板上呢？ 因为那是我们所想要的： 获取一些内容 （保存在数据库中的模型） 然后在我们的模板中很漂亮的展示，对吗？

这就是 *views* 应该做的： 连接模型和模板。 在我们的 `post_list` *视图* 中我们需要获取我们想要显示的模型，并将它们传递到模板中去。 所以基本上在 *视图* 中，我们决定什么 （模型） 将显示在模板中。

好吧，我们将如何实现它呢？

我们需要打开我们的 `blog/views.py`。到目前为止 `post_list` *view* 看起来像这样：

    from django.shortcuts import render
    
    def post_list(request):
        return render(request, 'blog/post_list.html', {})
    

还记得当我们谈论过导入在不同文件中编写的代码吗？ 现在是我们必须导入我们已经写在 `models.py` 里的模型的时候了。 我们将添加这行 `from .models import Post`，像这样：

    from django.shortcuts import render
    from .models import Post
    

`from` 后面的点号意味着 *当前目录* 或 *当前的应用程序*。 因为 `views.py` 和 `models.py` 是在同一目录中，我们只需要使用 `.` 和 文件的名称（无 `.py`) 。 然后我们导入模型（`Post`).

但接下来是什么呢？为了让实际的博客帖子从 `Post` 模型里获取，我们需要一种叫做 `QuerySet`的东西.

## QuerySet 查询集

您应该已经熟悉 Queryset 是如何工作的。我们在 [Django ORM (Queryset) 章节][1]谈论过它.

 [1]: ../django_orm/README.md

所以现在我们对已经发表并进行由 `published_date`排序的博客列表感兴趣，对吗？我们已经在 QuerySets 查询集一节里这么干过！

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

现在我们把这段代码插入 `blog/views.py` 文件，添加到函数 `def post_list(request)`里去：

    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post
    
    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {})
    

请注意我们为这里的 QuerySet查询集创建了一个 *变量*： `posts`。将此视为我们的 QuerySet 的名字。从现在开始我们可以通过这个名字引用它。

同时，代码中使用了 `timezone.now()` 函数，因此我们需要添加一个导入 `timezone`.

最后还没有完成的部分是传递 `posts` 查询集到模板中 （我们将在下一章中介绍如何显示它）。

在`render` 函数中我们已经有了 `请求` （因此我们通过互联网从用户接收的一切） 和模板文件 `'blog/post_list.html'` 参数。 最后一个参数，看起来像这样： `{}` ，我们可以在其中添加一些模板要使用的东西。 我们需要给它们起名字 （我们暂且沿用 `'posts'` :)）。 它应该看起来像这样： `{'posts': posts}`。 请注意，`:` 之前的部分是字符串；你需要将它用引号包围 `''`.

所以最后我们的 `blog/views.py` 文件应如下所示：

    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post
    
    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})
    

就是它 ！现在回到我们的模板并显示此QuerySet查询集！

如果你想了解更多关于QuerySert的内容，那么你可在这里得到帮助：https://docs.djangoproject.com/en/1.8/ref/models/querysets/
