# Extend your application

We already conpleted all different steps in creation of our website: we know how to write a model, url, view and template. We also know how to make our website pretty.

Time to practice!

First thing neccesary in our blog is obviously a page that display one post, right?

We already have a `Post` model, so we don't need to add anything to `models.py`.

## Create a link in the template

We will start with adding a link inside `post_list.html` (in `blog/template/blog` directory) file. So far it should look like:

    <html>
        <head>
            <title>Django Girls blog</title>
        </head>
        <body>
            <div class="post">
                <h1>{{ post.title }}</h1>
                <p>{{ post.text|truncatechars:200 }}</p>
            </div>
        </body>
    </html>

We want to have a link to post detail page on post title. Let's change `<h1>{{ post.title }}</h1>` with link:

    <h1><a href="{% url 'blog.views.post_detail' pk=post.pk %}">{{ post.title }}</a></h1>

Time to explain mysterious `{% url 'blog.views.post_detail' pk=post.pk %}`. As you suspect `{% %}` notation means that we are using Django template tags. This time we will use one that will create an URL for us!

`blog.views.post_detail` is a path to a `post_detail` view we want to create. Please note: `blog` is a name of our application (in folder `blog`), `views` is from name of `views.py` file and last bit: `post_detail` is a name of view.

Now when we go to:

    http://127.0.0.1:8000/

we will have an error (as suspected, since we don't have url or view for `post_detail`). It will look like this:

![NoReverseMatch error](images/no_reverse_match.png)

Let's create an url in `urls.py` for our `post_detail` view!

### URL: http://127.0.0.1:8000/post/1/

We now want to create an URL to point Django to view called `post_detail`, that will show entire blog post. Add line `url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),` to `urls.py` file. It should look like this:

    from django.conf.urls import patterns, include, url

    from django.contrib import admin
    admin.autodiscover()

    urlpatterns = patterns('',
        url(r'^$', views.post_list),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
    )

That one looks scary, but no worries - we will explain it for you:
- it's starts with `^` again -- "the beginning"
- `post/` only means that after the beginning, URL should contain the word __post__ and __/__. So far so good.
- `(?P<pk>[0-9]+)` - this part is trickier. It means that Django will take everything that you'll place here and transfer it to a view as a variable called `pk`. `[0-9]` also tells us that it can only be a number, not a letter (so everything between 0 and 9). `+` menas that there need to be one or more digits there. So something like `http://127.0.0.1:8000/post//` is not valid, but `http://127.0.0.1:8000/post/1234567890/` is perfectly ok!
- `/` - then we need __/__ again
- `$` - "the end"!

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you look for a view called `post_detail` and transfer the information that `pk` equals `5`.

`pk` is shortcut from `primary key`. This name is vary often used in many Django projects. But you can name your variable as you like (remember: lowercase and `_` instead of whitespaces!). For example instead of `(?P<pk>[0-9]+)` we could have variable `post_id`, so this bit would look like: `(?P<post_id>[0-9]+)`.

Ok! Let's refresh a page:

    http://127.0.0.1:8000/

Boom! Yet another error! As expected!

![AttributeError](images/attribute_error.png)

Do you remember, what is a next step? Of course, adding a view!

## post_detail view

This time our view is given an extra parameter `pk`. Our view need to catch it, right? So we will define our function as `def post_detail(request, pk):`. Note that we need to use exactly the same name as the one we specified in urls (`pk`). Ommiting this variable is also incorrect!

Now, we want to get one and only one blog post. To do this we can use querysets like this:

    Post.objects.get(pk=pk)

But this code has a problem. If there is no `Post` with given `primary key` we will have super ugly error!

![DoesNotExist error](images/does_not_exist.png)

We don't want it! But, of course, Django comes with somthing that will handle that for us: `get_object_or_404`. In case there is no `Post` with given `pk` it will display much nicer page (called `Page Not Found 404` page).

![Page not found](images/404.png)

The good news is that you actually can create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

Ok, time to add a view to our `views.py` file!

We should open `blog/views.py` and add a following code:

    from django.shortcuts import render, get_object_or_404

Near other `from` lines. And at the end of the file we will ad our view:

    def post_detail(request, pk):
        post = get_object_or_404(Post, pk=pk)
        return render(request, 'blog/post_detail.html', {'post': post})

Yes. It is time to refresh a page:

    http://127.0.0.1:8000/

![Post list view](images/post_list.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist.png)

Oh no! Error once again. But we already know how to deal with it, right? We need to add a template!

We will create a file in `blog/template/blog` called `post_detail.html`.
