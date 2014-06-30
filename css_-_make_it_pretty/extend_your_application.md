# Extend your application

Here we will explain how to add another url, view, template (post_detail)


### URL: http://127.0.0.1:8000/post/1/

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
