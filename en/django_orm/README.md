# Django ORM and QuerySets

In this chapter you'll learn how Django connects to the database and stores data in it. Let's dive in!


## What is a QuerySet?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

It's easiest to learn by example. Let's try this, shall we?


## Django shell

Open up your local console (not on PythonAnywhere) and type this command:

{% filename %}command-line{% endfilename %}
```
(myvenv) ~/djangogirls$ python manage.py shell
```

The effect should be like this:

{% filename %}command-line{% endfilename %}
```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :)  You can use all the Python commands here too.


### All objects

Let's try to display all of our blog posts first. You can do that with the following command:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'BlogPost' is not defined
```

Oops! An error showed up. It tells us that there is no BlogPost. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}
```python
>>> from blog.models import BlogPost
```

We import the model `BlogPost` from `blog.models`. Let's try displaying all blog posts again:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.all()
<QuerySet [<BlogPost: my post title>, <BlogPost: another post title>]>
```

This is a list of the blog posts we created earlier! We created these blog posts using the Django admin interface. But now we want to create new blog posts using Python, so how do we do that?


### Create object

This is how you create a new BlogPost object in database:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.create(author=me, title='Sample title', text='Test')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Let's import User model first:

{% filename %}command-line{% endfilename %}
```python
>>> from django.contrib.auth.models import User
```

What users do we have in our database? Try this:

{% filename %}command-line{% endfilename %}
```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}
```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

Now we can finally create our blog post:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.create(author=me, title='Sample title', text='Test')
<BlogPost: Sample title>
```

Hurray! Wanna check if it worked?

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.all()
<QuerySet [<BlogPost: my post title>, <BlogPost: another post title>, <BlogPost: Sample title>]>
```

There it is, one more blog post in the list!


### Add more blog posts

You can now have a little fun and add more blog posts to see how it works. Add two or three more and then go ahead to the next part.


### Filter objects

A big part of QuerySets is the ability to filter them. Let's say we want to find all blog posts that user ola authored. We will use `filter` instead of `all` in `BlogPost.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Now our piece of code looks like this:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.filter(author=me)
<QuerySet [<BlogPost: Sample title>, <BlogPost: BlogPost number 2>, <BlogPost: My 3rd post!>, <BlogPost: 4th title of post>]>
```

Or maybe we want to see all the blog posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.filter(title__contains='title')
<QuerySet [<BlogPost: Sample title>, <BlogPost: 4th title of post>]>
```

> **Note** There are two underscore characters (`_`) between `title` and `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published blog posts. We do this by filtering all the blog posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}
```python
>>> from django.utils import timezone
>>> BlogPost.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the blog post we added from the Python console is not published yet. But we can change that! First get an instance of a blog post we want to publish:

{% filename %}command-line{% endfilename %}
```python
>>> blogpost = BlogPost.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}
```python
>>> blogpost.publish()
```

Now try to get list of published blog posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.filter(published_date__lte=timezone.now())
<QuerySet [<BlogPost: Sample title>]>
```


### Ordering objects

QuerySets also allow you to order the list of objects. Let's try to order them by `created_date` field:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.order_by('created_date')
<QuerySet [<BlogPost: Sample title>, <BlogPost: BlogPost number 2>, <BlogPost: My 3rd post!>, <BlogPost: 4th title of post>]>
```

We can also reverse the ordering by adding `-` at the beginning:

{% filename %}command-line{% endfilename %}
```python
>>> BlogPost.objects.order_by('-created_date')
<QuerySet [<BlogPost: 4th title of post>,  <BlogPost: My 3rd post!>, <BlogPost: BlogPost number 2>, <BlogPost: Sample title>]>
```


### Complex queries through method-chaining

As you saw, some methods on `BlogPost.objects` return a QuerySet.
The same methods can in turn also be called on a QuerySet,
and will then return a new QuerySet.
Thus,
you can combine their effect by **chaining** them together:

```python
>>> BlogPost.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<BlogPost: BlogPost number 2>, <BlogPost: My 3rd post!>, <BlogPost: 4th title of post>, <BlogPost: Sample title>]>
```

This is really powerful and lets you write quite complex queries.

Cool! You're now ready for the next part! To close the shell, type this:

{% filename %}command-line{% endfilename %}
```python
>>> exit()
$
```
