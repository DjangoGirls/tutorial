# Django Querysets

We have different pieces in place: the `Post` model is defined in `models.py`, we have `post_list` in `views.py` and the template added. But how will we actually make our posts appear in our HTML template? Because that is what we want: take some content (models saved in the database) and display it nicely in our template, right?

This is exactly what *views* are supposed to do: connect models and templates. In our `post_list` *view* we will need to take models we want to display and pass them to the template. So basically in a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve it?

We need to open our `blog/views.py`. So far `post_list` *view* looks like this:

    from django.shortcuts import render

    def post_list(request):
        return render(request, 'blog/post_list.html', {})

Remember when we talked about including code written in different files? Now it is the moment when we have to include the model we have written in `models.py`. We will add this line `from .models import Post` like this:

    from django.shortcuts import render
    from .models import Post

Dot after `from` means *current directory* or *current application*. Since `views.py` and `models.py` are in the same directory we can simply use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from `Post` model we need something called `Queryset`.

## Queryset

So now we are interested in a list of blog posts, right? But all we have is the `Post` model. A Queryset will give us a collection we are looking for. All we need to do is use:

    Post.objects.all()

which returns all blog posts!

And we have our first queryset! Now we can take each element out of it and display it or do something else with it.

But before we pass this queryset to the template and display blog posts we will do some magic and select only posts that are published (they have a `published_date` set).

This is where we introduce a `filter`. We will use it instead of `all` in `Post.objects.all()`. In parentheses we will state what condition(s) needs to be met by a blog post to end up in our queryset. In our situation it is `published_date` that is not empty. The way to write it in Django is: `published_date__isnull=False` (`null` in programming means *empty*). Now our piece of code looks like:

    Post.objects.filter(published_date__isnull=False)

Finally, it would be good to have our posts ordered by publish date, right? We can do that with `order_by`. In parentheses we will type (in quotation marks `''`) the name of a field (`published_date`) to order by. Our final queryset looks like this:

    Post.objects.filter(published_date__isnull=False).order_by('published_date')

Now we put this piece of code inside the `post_list` file, by adding it to the function `def post_list(request)`:

    from django.shortcuts import render
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {})

Please note that we create a *variable* for our queryset: `posts`. Treat this as the name of our queryset. From now on we can refer to it by this name.
The last missing part is passing the `posts` queryset to the template (we will cover how to display it in a next chapter).

In the `render` function we already have parameter with `request` (so everything we receive from the user via the Internet) and a template file `'blog/post_list.html'`. The last parameter, which looks like this: `{}` is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now :)). It should look like this: `{'posts': posts}`. Please note that the part before `:` is wrapped with quotes `''`.

So finally our `blog/views.py` file should look like this:

    from django.shortcuts import render
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__isnull=False).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})

That's it! Time to go back to our template and display this queryset!

If you want to read a little bit more about querysets in Django you should look here: https://docs.djangoproject.com/en/1.6/ref/models/querysets/




