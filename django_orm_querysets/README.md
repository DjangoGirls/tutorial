# Django Querysets

We have different pieces in place: `Post` model is defined in `models.py`, we have `post_list` in `views.py` and the template added. But how actually we will make our posts to appear in our `HTML` template? Because that is what we want: take a content (models saved in database) and display it nicely in our template, right?

This is exactly what `views` suppose to do: connect models and templates. In our `post_list` we will need to take models we want to display and pass them to the template. So basically in a view we decide what (model) will be displayed in a template.

Ok, so how we will achieve it?

We need to open our `blog/views.py`. So far `post_list` view looks like this:

    from django.shortcuts import render

    def post_list(request):
        return render(request, 'blog/post_list.html', {})

Remember when we talked about including code written in different files? Now is a moment when we need to include the model we have written in `models.py`. We will add this line `from .models import Post` like this:

    from django.shortcuts import render
    from .models import Post

Dot after `from` means *current folder* or *current application*. Since `views.py` and `models.py` are in the same directory we can simply use `.` and the name of the file (without `.py`). The we import the name of the model (`Post`).

But what next? To take actual blog posts from Post models we need something called `Queryset`.

## Queryset

So now we are interested in a list of blog posts, right? But all we have is model `Post`. Queryset will give us a collection we are looking for. All we need to do to get all posts is:

    Post.objects.all()

And we have our first queryset! Now we can take each element of it and display it or do something else with it.

But before we will pass queryset to the template and display blog posts we will do some magic and we will select only posts that are published (they have a `published_date` set).

Here comes a `filter`. We will use it instead of `all` in a previous line of code. In parentesis we will state what condition need to be met to end up in our queryset. In our situation it is `published_date` that is not empty. The way to write it in Django is: `published_date__isnull=False` (`null` in programming means *empty*).

    Post.objects.filter(published_date__isnull=False)

Finally, it would be good to have our posts ordered by publish date, right? We can do that with `order_by`. In parentesis we will type (in quotation marks `''`) a name of the field (`published_date`). Our final queryset looks like this:

    Post.objects.filter(published_date__isnull=False).order_by('published_date')

Time to put this piece of code inside `post_list`, right?

    from django.shortcuts import render
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {})

Please note that we create an *alias* or a *container* for our queryset `posts`. Treat it as a name of our queryset. From now on we can refer to it by this name.
The last missing part is to pass the `posts` queryset to the template (we will cover how to display it in a next chapter).

In `render` function we already have parameter with `request` (so everything we receive from the user via internet) and a template file `'blog/post_list.html'`. The last parameter, which looks like this now: `{}` is a place in which we can pass some things to template. We need to give them names (we will stick with `'posts'` right now :)). It should look like this: `{'posts': posts}`.

So finally our `views.py` file should look like this:

    from django.shortcuts import render
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})

That's it! Time to go back to our template and display this queryset!

If you want to read a little bit more about querysets in Django you should look here: https://docs.djangoproject.com/en/dev/ref/models/querysets/




