# Homework: Adding security to your website

You might have noticed that you didn't have to use your password, apart from back when we used the admin interface. You might also have noticed that this means that anyone can add or edit posts in your blog. I don't know about you, but I don't want just anyone to post on my blog. So lets do something about it.

## Authorizing add/edit of posts

First lets make things secure. We will protect our `post_new`, `post_edit` and `post_publish` views so that only logged-in users can access them. Django ships with some nice helpers for that using, the kind of advanced topic, _decorators_. Don't worry about the technicalities now, you can read up on these later. The decorator to use is shipped in Django in the module `django.contrib.auth.decorators` and is called `login_required`.

So edit your `blog/views.py` and add these lines at the top along with the rest of the imports:

```
from django.contrib.auth.decorators import login_required
```

Then add a line before each of the `post_new`, `post_edit` and `post_publish` views (decorating them) like the following:

```
@login_required
def post_new(request):
    [...]
```

Thats it! Now try to access `http://localhost:8000/post/new/`, notice the difference?

> If you just got the empty form, you are probably still logged in from the chapter on the admin-interface. Go to `http://localhost:8000/admin/logout/` to log out, then goto `http://localhost:8000/post/new` again.

You should get one of the beloved errors. This one is quite interesting actually: The decorator we added before will redirect you to the login page. But that isn't available yet, so it raises a "Page not found (404)".

Don't forget to add the decorator from above to `post_edit` and `post_publish` too.

Horray, we reached part of the goal! Other people can't just create posts on our blog anymore. Unfortunately we can't create posts anymore too. So lets fix that next.

## Login users

Now we could try to do lots of magic stuff to implement users and passwords and authentication but doing this kind of stuff correctly is rather complicated. As Django is "batteries included", someone has done the hard work for us, so we will make further use of the authentication stuff provided.

In your `mysite/urls.py` add a url `url(r'^accounts/login/$', 'django.contrib.auth.views.login')`. So the file should now look similar to this:

```
from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r'', include('blog.urls')),
)
```

Then we need a template for the login page, so create a directory `mysite/templates/registration` and a file inside named `login.html`:

```
{% extends "mysite/base.html" %}

{% block content %}

{% if form.errors %}
<p>Your username and password didn't match. Please try again.</p>
{% endif %}

<form method="post" action="{% url 'django.contrib.auth.views.login' %}">
{% csrf_token %}
<table>
<tr>
    <td>{{ form.username.label_tag }}</td>
    <td>{{ form.username }}</td>
</tr>
<tr>
    <td>{{ form.password.label_tag }}</td>
    <td>{{ form.password }}</td>
</tr>
</table>

<input type="submit" value="login" />
<input type="hidden" name="next" value="{{ next }}" />
</form>

{% endblock %}
```

You will see that this also makes use of our base-template for the overall look and feel of your blog.

The nice thing here is that this _just works[TM]_. We don't have to deal with handling of the forms submission nor with passwords and securing them. Only one thing is left here, we should add a setting to `mysite/settings.py`:

```
LOGIN_REDIRECT_URL = '/'
```

Now when the login is accessed directly, it will redirect successful login to the top level index.

## Improving the layout

So now we made sure that only authorized users (ie. us) can add, edit or publish posts. But still everyone gets to view the buttons to add or edit posts, lets hide these for users that aren't logged in. For this we need to edit the templates, so lets start with the base template from `mysite/templates/mysite/base.html`:

```
    <body>
        <div class="page-header">
            {% if user.is_authenticated %}
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <a href="{% url 'post_draft_list' %}" class="top-menu"><span class="glyphicon glyphicon-edit"></span></a>
            {% else %}
            <a href="{% url 'django.contrib.auth.views.login' %}" class="top-menu"><span class="glyphicon glyphicon-lock"></span></a>
            {% endif %}
            <h1><a href="{% url 'blog.views.post_list' %}">Django Girls</a></h1>
        </div>
        <div class="content">
            <div class="row">
                <div class="col-md-8">
                {% block content %}
                {% endblock %}
                </div>
            </div>
        </div>
    </body>
```

You might recognize the pattern here. There is an if-condition inside the template that checks for authenticated users to show the edit buttons. Otherwise it shows a login button.

*Homework*: Edit the template `blog/templates/blog/post_detail.html` to only show the edit buttons for authenticated users.

## More on authenticated users

Lets add some nice sugar to our templates while we are at it. First we will add some stuff to show that we are logged in. Edit `mysite/templates/mysite/base.html` like this:

```
        <div class="page-header">
            {% if user.is_authenticated %}
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <a href="{% url 'post_draft_list' %}" class="top-menu"><span class="glyphicon glyphicon-edit"></span></a>
            <p class="top-menu">Hello {{ user.username }}<small>(<a href="{% url 'django.contrib.auth.views.logout' %}">Log out</a>)</p>
            {% else %}
            <a href="{% url 'django.contrib.auth.views.login' %}" class="top-menu"><span class="glyphicon glyphicon-lock"></span></a>
            {% endif %}
            <h1><a href="{% url 'blog.views.post_list' %}">Django Girls</a></h1>
        </div>
```

This adds a nice "Hello &lt;username&gt;" to remind us who we are and that we are authenticated. Also this adds a link to log out of the blog. But as you might notice this isn't working yet. Oh nooz, we broke the internetz! Lets fix it!

We decided to rely on django to handle login, lets see if Django can also handle logout for us. Check https://docs.djangoproject.com/en/1.6/topics/auth/default/ and see if you find something.

Done reading? You should by now think about adding a url (in `mysite/urls.py`) pointing to the `django.contrib.auth.views.logout` view. Like this:

```
from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/login/$', 'django.contrib.auth.views.login'),
    url(r'^accounts/logout/$', 'django.contrib.auth.views.logout', {'next_page': '/'}),
    url(r'', include('blog.urls')),
)
```

Thats it! If you followed all of the above until this point (and did the homework), you now have a blog where you

 - need a username and password to log in,
 - need to be logged in to add/edit/publish(/delete) posts
 - and can log out again
