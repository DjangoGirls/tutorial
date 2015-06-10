# Django urls

We're about to build our first webpage -- a homepage for your blog! But first, let's learn a little bit about Django urls.

## What is a URL?

A URL is simply a web address, you can see a URL every time you visit any website - it is visible in your browser's address bar (yes! `127.0.0.1:8000` is a URL! And http://djangogirls.com is also a URL):

![Url](images/url.png)

Every page on the Internet needs its own URL. This way your application knows what it should show to a user who opens a URL. In Django we use something called `URLconf` (URL configuration), which is a set of patterns that Django will try to match with the received URL to find the correct view.

## How do URLs work in Django?

Let's open up the `mysite/urls.py` file in your code editor of choice and see what it looks like:

```python:mysite/urls.py
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
```

As you can see, Django already put something here for us.

Lines that start with `#` are comments - it means that those lines won't be run by Python. Pretty handy, right?

The admin URL, which you visited in previous chapter is already here:

```python:mysite/urls.py
url(r'^admin/', include(admin.site.urls)),
```

It means that for every URL that starts with `admin/` Django will find a corresponding *view*. In this case we're including a lot of admin URLs so it isn't all packed into this small file -- it's more readable and cleaner.

## Regex

Do you wonder how Django matches URLs to views? Well, this part is tricky. Django uses `regex` -- regular expressions. Regex has a lot (a lot!) of rules that form a search pattern. Since regexes are an advanced topic, we will not go in detail over how they work.

If you still wish to understand how we created the patterns, here is an example of the process - we will only need a limited subset of the rules to express the pattern we are looking for, namely:

```
^ for beginning of the text
$ for end of text
\d for a digit
+ to indicate that the previous item should be repeated at least once
() to capture part of the pattern
```

Anything else in the url definition will be taken literally.

Now imagine you have a website with the address like that: `http://www.mysite.com/post/12345/`, where `12345` is the number of your post.

Writing separate views for all the post numbers would be really annoying. With regular expression we can create a pattern that will match the url and extract the number for us: `^post/(\d+)/$`. Let's break it down piece by piece to see what we are doing here:

* **^post/** is telling Django to take anything that has `post/` at the beginning of the url (right after `^`)
* **(\d+)** means that there will be a number (one or more digits) and that we want the number captured and extracted
* **/** tells django that another `/` character should follow
* **$** then indicates the end of the URL meaning that only strings ending with the `/` will match this pattern



## Your first Django url!

Time to create our first URL! We want 'http://127.0.0.1:8000/' to be a homepage of our blog and display a list of posts.

We also want to keep the `mysite/urls.py` file clean, so we will import urls from our `blog` application to the main `mysite/urls.py` file.

Go ahead, delete the commented lines (lines starting with `#`) and add a line that will import `blog.urls` into the main url (`''`).

Your `mysite/urls.py` file should now look like this:

```python:mysite/urls.py
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

Django will now redirect everything that comes into 'http://127.0.0.1:8000/' to `blog.urls` and look for further instructions there.

When writing regular expressions in Python it is always done with `r` in front of the string - this is just a helpful hint to Python that the string may contain special characters that are not meant for Python itself but are instead part of the regular expression.


## blog.urls

Create a new `blog/urls.py` empty file. All right! Add these two first lines:

```python:blog/urls.py
from django.conf.urls import url
from . import views
```

Here we're just importing Django's methods and all of our `views` from `blog` application (we don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

```python:blog/urls.py
urlpatterns = [
    url(r'^$', views.post_list),
]
```

As you can see, we're now assigning a `view` called `post_list` to `^$` URL. This regular expression will match `^` (a beginning) followed by `$` (an end) - so only an empty string will match. And that's correct, because in Django url resolvers, 'http://127.0.0.1:8000/' is not a part of URL. This pattern will show Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

Everything all right? Open http://127.0.0.1:8000/ in your browser to see the result.

![Error](images/error1.png)

There is no "It works" anymore, huh? Don't worry, it's just an error page, nothing to be scared of! They're actually pretty useful:

You can read that there is __no attribute 'post_list'__. Is *post_list* reminding you of anything? This is how we called our view! This means that everything is in place, we just didn't create our *view* yet. No worries, we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/1.8/topics/http/urls/
