# 在範本中的動態資料 (Dynamic data in templates)

我們把不同的東西安排妥當了︰`Post` 模型定義在 `models.py`，我們定義 `post_list` 在 `views.py`，且新增範本 (template) 了。 但我們究竟將如何使我們的文章出現在我們的 HTML 範本 (template) 上？ Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

這就是 *views* 應該做的：連接模型 (models) 和範本 (templates)。 In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

還記得當我們談到導入 (including) 程式碼編寫在不同檔案中嗎？ Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). 然後，我們將導入 (import) 模型的名稱 (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## 查詢集 (QuerySet)

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

請注意，我們為我們的 QuerySet 建立了一個*變數 (variable)*︰`posts`，並將它視為我們的 QuerySet 的名稱，從現在開始我們可以透過這個名字引用它。

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. 我們需要給它們名字（現在我們將沿用 `'posts'`). :) 它應該看起來像這樣︰`{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

所以，最後我們的 `blog/views.py` 檔應像這樣︰

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

就這些！現在回到我們的範本並顯示這個 QuerySet！

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/