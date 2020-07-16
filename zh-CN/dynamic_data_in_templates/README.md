# 模板中的动态数据

我们已有的几件： `Post` 模型定义在 `models.py` 中，我们有 `post_list` `views.py` 和添加的模板中。 但实际上我们如何使我们的帖子出现在我们的 HTML 模板上呢？ Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

这就是 *views* 应该做的： 连接模型和模板。 In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

还记得当我们谈论过导入在不同文件中编写的代码吗？ Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). 然后我们导入模型（`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet 查询集

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

请注意我们为这里的 QuerySet查询集创建了一个 *变量*： `posts`。将此视为我们的 QuerySet 的名字。从现在开始我们可以通过这个名字引用它。

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. 我们需要给它们起名字 （我们暂且沿用 `'posts'`). :) 它应该看起来像这样： `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

所以最后我们的 `blog/views.py` 文件应如下所示：

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

就是它 ！现在回到我们的模板并显示此QuerySet查询集！

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/