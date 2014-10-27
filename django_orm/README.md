# Django ORM and QuerySets

In this chapter you'll learn how Django connects to the database and stores data in it. Let's dive in!

## What is a QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySet allows you to read the data from database, filter it and order it.

It's easiest to learn by example. Let's try this, shall we?

## Django shell

Open up your console and type this command:

    > $ python manage.py shell

The effect should be like this:

    (InteractiveConsole)
    >>>

You're now in Django's interactive console. It's just like Python prompt but with some additional Django magic :). You can use all the Python commands here too, of course.

### All objects

Let's try to display all of our posts first. You can do that with the following command:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined

Oops! An error showed up. It tells us that there is no Post. It's correct -- we forgot to import it first!

    >>> from blog.models import Post

This is simple: we import model `Post` from `blog.models`. Let's try displaying all posts again:

    >>> Post.objects.all()
    []

It's an empty list. That seems to be correct, right? We didn't add any posts yet! Let's fix that.

### Create object

This is how you create a Post object in database:

    >>> Post.objects.create(author=user, title='Sample title', text='Test')

But we have one missing ingredient here: `user`. We need to pass an instance of `User` model as an author. How to do that?

Let's import User model first:

    >>> from django.contrib.auth.models import User

What users do we have in our database? Try this:

    >>> User.objects.all()
    []

No users! lets create a user:

    >>> User.objects.create(username='ola')
    <User: ola>

What users do we now have in our database? Try this:

    >>> User.objects.all()
    [<User: ola>]

Cool! Let's get an instance of the user now:

    user = User.objects.get(username='ola')

As you can see, we now `get` a `User` with a `username` that equals to 'ola'. Neat! Of course, you have to adjust it to your username.

Now we can finally create our first post:

    >>> Post.objects.create(author = user, title = 'Sample title', text = 'Test')

Hurray! Wanna check if it worked?

    >>> Post.objects.all()
    [<Post: Sample title>]

### Add more posts

You can now have a little fun and add more posts to see how it works. Add 2-3 more and go ahead to the next part.

### Filter objects

A big part of QuerySets is an ability to filter them. Let's say, we want to find all posts that are authored by User ola. We will use `filter` instead of `all` in `Post.objects.all()`. In parentheses we will state what condition(s) needs to be met by a blog post to end up in our queryset. In our situation it is `author` that is equal to `user`. The way to write it in Django is: `author=user`. Now our piece of code looks like this:

    >>> Post.objects.filter(author=user)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]

Or maybe we want to see all the posts that contain a word 'title' in the `title` field?

    >>> Post.objects.filter(title__contains='title')
    [<Post: Sample title>, <Post: 4th title of post>]

You can also get a list of all published posts. We do it by filtering all the posts that have `published_date`:

    >>> Post.objects.filter(published_date__isnull=False)
    []

Unfortunately, none of our posts are published yet. We can change that! First get an instance of a post we want to publish:

    >>> post = Post.objects.get(id=1)

And then publish it with our `publish` method!

    >>> post.publish()

Now try to get list of published posts again (press the up arrow button 3 times and hit Enter):

    >>> Post.objects.filter(published_date__isnull=False)
    [<Post: Sample title>]

### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

    >>> Post.objects.order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]

We can also reverse the ordering by adding `-` at the beginning:

    >>> Post.objects.order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]

Cool! You're now ready for the next part! To close the shell, type this:

    >>> exit()
    $
