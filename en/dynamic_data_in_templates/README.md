# Dynamic data in templates

We have different pieces in place: the `Post` model is defined in `models.py`, we have `post_list` in `views.py` and the template added. But how will we actually make our posts appear in our HTML template? Because that is what we want to do. Take some content (models saved in the database) and display it nicely in our template, right?

This is exactly what *views* are supposed to do: connect models and templates. In our `post_list` *view* we will need to take models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve it?

We need to open our `blog/views.py`. So far `post_list` *view* looks like this:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Remember when we talked about including code written in different files? Now it is the moment when we have to include the model we have written in `models.py`. We will add this line `from .models import Post` like this:

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about it in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

Also, the code uses the `timezone.now()` function, so we need to add an import for `timezone`.

The last missing part is passing the `posts` QuerySet to the template. Don't worry we will cover how to display it in a next chapter.

In the `render` function we already have parameter with `request` (so everything we receive from the user via the Internet) and a template file `'blog/post_list.html'`. The last parameter, which looks like this: `{}` is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now :)). It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes `''`.

So finally our `blog/views.py` file should look like this:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/1.9/ref/models/querysets/
