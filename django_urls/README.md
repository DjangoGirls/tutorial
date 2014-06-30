# Django urls

We're about to build our first webpage -- a homepage for your blog! But first, let's learn a little bit about Django urls.

## What is URL?

URL is nothing else like web address, you can see an URL every time you any website - it is visible in your browser's address bar:

![Url](images/url.png)

Every page on the internet needs its own URL. This way your application knows what it should show to the user who open an URL. In Django we use something called `URLconf` (URL configuration), which is a set of patterns that Django will try to match to received URL to find correct view.

## How URLs work in Django?

Let's open up a `mysite/urls.py` file and see how it looks:

    from django.conf.urls import patterns, include, url

    from django.contrib import admin
    admin.autodiscover()

    urlpatterns = patterns('',
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),

        url(r'^admin/', include(admin.site.urls)),
    )

As you can see, Django already put something for us here.

Lines that starts with `#` are comments - it means that those lines won't be executed by Python. Pretty handy, right?

Admin url, which you visited in previous chapter is already here:

    url(r'^admin/', include(admin.site.urls)),

It means that for every url that starts with `admin/` Django will find a corresponding view. In this case we're including a lot of admin urls so it isn't all packed into this small file -- it's more readable and cleaner.

## Regex

Do you wonder how Django matches URLs to views? Well, this part is tricky. Django uses `regex` -- regular expression. Regex has a a lot (a lot!) of rules that forms a search pattern. It is not so easy to understand so we won't worry about it today and you'll definitely get to know them in the future. Today we will only use the ones we need.

## Your first Django url!

Time to create our first urls! We want to build two of them:
1. http://127.0.0.1:8000/ - which will be a homepage of our blog and will display a list posts
- http://127.0.0.1:8000/post/__ID__/ - which will show only a post with given __ID__ (id is your post identifier, it's a unique identification of your post)

We want to keep `mysite/urls.py` file clean, so we will import urls from our `blog` application to main `mysite/urls.py` file.
Go ahead, delete comment lines and add a line that will import `blog.urls` into main url (`''`).

Your `mysite/urls.py` file should now look like this:

    from django.conf.urls import patterns, include, url

    from django.contrib import admin
    admin.autodiscover()

    urlpatterns = patterns('',
        url(r'^admin/', include(admin.site.urls)),
        url(r'', include('blog.urls')),
    )

Django will now redirect everything that comes into `http://127.0.0.1:8000/` to `blog.urls` and look for further instructions there.

## blog.urls

Create a new `mysite/blog/urls.py` empty file. All right! Add this two first lines:

    from django.conf.urls import patterns, include, url
    from . import views

Here we're just importing Django's methods and all of our `views` from `blog` application (we don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

    urlpatterns = patterns('',
        url(r'^$', views.post_list),
    )

As you can see, we're now assigning `view` called `post_list` to `^$` URL. But what `^$` means? It's regex magic :) Let's break it down:
- `^` in regex means "the beginning", from this sign we can start looking for our pattern
- `$` matches only "the end" of the string, which means that we will finish looking for our pattern here.

If you put this two signs together, it looks like we're looking for empty string! And that's correct, because in Django url resolvers, `http://127.0.0.1:8000/` is not a part of URL. This pattern will show Django that `views.post_list` is the right place to go if someone enter your website on `http://127.0.0.1:8000/` address.

Everything all right? Open http://127.0.0.1:8000/ in our browser to see results.

### http://127.0.0.1:8000/

There is no "It works" anymore, huh? Don't worry, it's just an error page, nothing to be scared of! They're actually pretty useful:

![Error](images/error1.png)

You can read that there is __no attribute 'post_list'__. Is *post_list* reminding you of anything? This is how we called our view! This means that everything is in place, we just didn't create our view yet. No worries, we will get there.

### http://127.0.0.1:8000/post/1/

Let's do one more URL. We know want to create an URL to point Django to view called `post_detail`, that will show entire blog post. Add second line:

    urlpatterns = patterns('',
        url(r'^$', views.post_list),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail),
    )

That one looks scary, but we can understand it:
- it's starts with `^` again -- "the beginning"
- `post/` only means that after the beginning, URL should contain the word __post__ and __/__. So far so good.
- `(?P<pk>[0-9]+)` - this part is trickier. It means that Django will take everything that you'll place here and transfer it to view as variable called `pk`. `[0-9]` also tells us that it can only be a number, not a letter.
- `/` - then we need __/__ again
- `$` - "the end"!

That means if you enter `http://127.0.0.1:8000/post/5/` into your browser, Django will understand that you look for a view called `post_detail` and transfer the information that `pk` equals `5`.



