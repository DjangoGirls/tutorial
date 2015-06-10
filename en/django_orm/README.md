# Django ORM and QuerySets

In this chapter you'll learn how Django connects to the database and stores data in it. Let's dive in!


## What is a QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySet allows you to read the data from database, filter it and order it.

It's easiest to learn by example. Let's try this, shall we?


## Django shell

Open up your local console (not on PythonAnywhere) and type this command:

```:command-line
(myvenv) ~/djangogirls$ python manage.py shell
```

The effect should be like this:

```python:command-line
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like Python prompt but with some additional Django magic :). You can use all the Python commands here too, of course.


### All objects

Let's try to display all of our posts first. You can do that with the following command:

```python:command-line
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct -- we forgot to import it first!

```python:command-line
>>> from blog.models import Post
```

This is simple: we import model `Post` from `blog.models`. Let's try displaying all posts again:

```python:command-line
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>]
```

It's a list of the posts we created earlier! We created these posts using the Django admin interface. However, now we want to create new posts using python, so how do we do that?


### Create object

This is how you create a new Post object in database:

```python:command-line
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How to do that?

Let's import User model first:

```python:command-line
>>> from django.contrib.auth.models import User
```

What users do we have in our database? Try this:

```python:command-line
>>> User.objects.all()
[<User: ola>]
```

It's the superuser we created earlier! Let's get an instance of the user now:

```python:command-line
me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals to 'ola'. Neat! Of course, you have to adjust it to your username.

Now we can finally create our post:

```python:command-line
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Hurray! Wanna check if it worked?

```python:command-line
>>> Post.objects.all()
[<Post: my post title>, <Post: another post title>, <Post: Sample title>]
```

There it is, one more post in the list!


### Add more posts

You can now have a little fun and add more posts to see how it works. Add 2-3 more and go ahead to the next part.


### Filter objects

A big part of QuerySets is an ability to filter them. Let's say, we want to find all posts that are authored by User ola. We will use `filter` instead of `all` in `Post.objects.all()`. In parentheses we will state what condition(s) needs to be met by a blog post to end up in our queryset. In our situation it is `author` that is equal to `me`. The way to write it in Django is: `author=me`. Now our piece of code looks like this:

```python:command-line
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

Or maybe we want to see all the posts that contain a word 'title' in the `title` field?

```python:command-line
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **Note** There are two underscore characters (`_`) between `title` and `contains`. Django's ORM uses this syntax to separate field names ("title") and operations or filters ("contains"). If you only use one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do it by filtering all the posts that have `published_date` set in the past:

```python:command-line
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unfortunately, the post we added from the Python console is not published yet. We can change that! First get an instance of a post we want to publish:

```python:command-line
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method!

```python:command-line
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow button 3 times and hit Enter):

```python:command-line
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```


### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

```python:command-line
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

We can also reverse the ordering by adding `-` at the beginning:

```python:command-line
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

Cool! You're now ready for the next part! To close the shell, type this:

```python:command-line
>>> exit()
$
```
