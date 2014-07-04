# Django models

What we want to create now is something that will store all posts in our blog. But to be able to do that we need to talk a little bit about things called `objects` and `database`.

## Objects

There is a concept in programming called `Object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions we can model things and define how they interact with each other.

So what is an object? It is a number of properties and actions. It sounds weird, but we will give you an example.

If we want to model a cat we will create an object `Cat` that has some properties, i.e. `color`, `age`, `mood` (i.e. good, bad, sleepy ;)), `owner` (that is a `Person` object or maybe, in case of a strayed cat, this property is empty).

And then the `Cat` has some actions: `purr`, `scratch` or `feed` (in which we will give the cat some `CatFood`, which could be a separate object with properties, i.e. `taste`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    is_hungry()
    scratch()
    feed(cat_food)


    CatFood
    --------
    taste

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

How will we model blog posts then? Since we want to build a blog, right?

We need to answer a question: what is a blog post? What properties should it have?

Well, for sure our blog post needs some text with content and a title, right? It also would be nice to know who wrote it - we need an author then. Finally, we also want to know when the post was created and published.

    Post
    --------
    title
    text
    author
    created_date
    published_date

What kind of things could be done with a blog post? It would be nice to have some `method` that publishes the post, right?

So we will need `publish` method.

Since we already know what we want to achieve, we can start modelling it in Django!

## Django model

Knowing what an object is, we can create a Django model for our blog post.

A model in Django is a special kind of object - it is saved in the `database`. And the database is something that stores data for us.

### Creating an application

To keep everything tidy, we will create a separate application inside our `mysite` project. It is very nice to have everything organized from the very beginning. To create an application we need to run in console/command-line (we should be in `mysite` folder where `manage.py` file is) `python manage.py startapp blog`.

    (blog) ~/mysite python manage.py startapp blog

You will notice that a new `blog` folder is created and it contains a number of files now. Now our folders and files in our project should look like this:

    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   ├── wsgi.py
    ├── manage.py
    └── blog
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py

After creating an application we also need to tell Django that it should use it. We do that in the file `mysite/setting.py`. We need to find `INSTALLED_APPS` and add a line `blog` just above `)`. We should also add `mysite` application (which was created for us when we started a new project in last chapter). So the final product should look like this:

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'blog',
        'mysite',
    )

### Creating a blog post model

In a file `models.py` we define all objects called `Models` - this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it and write code like this:

    from django.db import models
    from django.utils import timezone
    from django.contrib.auth.models import User

    class Post(models.Model):
        author = models.ForeignKey(User)
        title = models.CharField(max_length=200)
        text = models.TextField()
        created_date = models.DateTimeField(
                default=timezone.now())
        published_date = models.DateTimeField(
                blank=True, null=True)

        def publish(self):
            self.published_date = timezone.now()
            self.save()

        def __unicode__(self):
            return self.title

It is scary, right? But no worries, we will explain what these lines mean!

All lines started with `from` or `import` are lines that adds some bits from other files. So instead of copying and pasting the same things in every file, we can include some parts with `from ... import ...`.

`class Post(models.Model):` - this line defines our model.

- `class` is a special keyword that indicates that we are defining an object.
- `Post` is the name of our model, we can call it differently (but we have to avoid special characters and whitespaces). Always start a name with uppercase.
- `models.Model` means that the Post is a Django Model, so it will be saved in the database.

Now we define properties we where talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define a type of field (is it a text? a number? a relation to another object, i.e. a User? date?).

- `models.CharField` - this is how you define text with limited number of characters.
- `models.TextField` - this is for long texts without a limit. It will be ideal for a blog post content, right?
- `models.DateTimeField` - this is a date
- `models.ForeignKey` - this is a link to another model

We will not explain every bit of code here, since it would take too much time. You should take a look at Django's documentation, if you need to know more about Model fields (properties) and how to define things other than things described above (https://docs.djangoproject.com/en/dev/ref/models/fields/#field-types).

What about `def publish(self):`? It is exactly our `publish` method we were talking about. `def` means that this is a function/method. `publish` is a name of the method. You can change it, if you want. The rule is that we use lowercase and underscores instead of whitespaces (i.e. if you want to have method that calculates average price you could call it `calculate_average_price`).

Methods very often `return` something. There is an example of that in the `__unicode__` method. In this scenario, when we call `__unicode__()` we will get a text (**string**) with a Post title.

If something is still not clear about models, feel free to ask you coach! We know, it is very complicated, especially when you learn what objects and functions (method) are at the same time. But hopefully, it looks sligthly less magic for you now!

### Create a database for your models

Last step here is to add our new model to our database. It is as easy as typing `python manage.py syncdb`. It will look like this:

    (blog) ~/mysite python manage.py syncdb
    Creating tables ...
    Creating table blog_post
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

It would be nice to see this Post model, right? Jump to the next chapter to see how your Post look like!



