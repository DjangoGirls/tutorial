# Django视图 - 是时候去创建！

是时候去解决我们在上一章所制造的Bug了：）

*view*是存放应用逻辑的地方。 它将从你之前创建的 `模型`中获取数据，并将它传递给 `模板`。 我们将在下一章创建 template 模板。 视图就是Python方法，只不过比我们在**Python简介**章节中所做的事情稍复杂。

视图都被置放在`views.py`文件中。我们将加入我们自己的*views*到`blog/views.py`文件。

## blog/views.py

好，让我们打开这个文件，看看里面有什么：

    from django.shortcuts import render
    
    # Create your views here.
    

这里没有太多的东西。一个最简单的*view*就长得这个样子。

    def post_list(request):
        return render(request, 'blog/post_list.html', {})
    

如你所见, 我们创建一个方法 (`def`) ，命名为 `post_list` ，它接受 `request` 参数作为输入， 并 `return` （返回）用 `render` 方法渲染模板 `blog/post_list.html` 而得到的结果.

保存文件，转到 http://127.0.0.1:8000/ 然后看看我们现在得到什么了。

另一个错误！读读现在发生了什么：

![错误][1]

 [1]: images/error.png

这个错误很直白：*TemplateDoesNotExist*。让我们修复这个bug，然后在下一个章节里创建一个模板！

> 阅读更多关于 Django views 的内容请参阅官方文档： https://docs.djangoproject.com/en/1.8/topics/http/views/
