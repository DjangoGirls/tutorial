# Template extending

Another nice thing Django has for you is __template extending__. What does this mean? It means that you can use the same parts of your HTML for different pages of your website.

This way you don't have to repeat yourself in every file, when you want to use the same information/layout.  And if you want to change something, you don't have to do it in every template, just once!

## Create base template

A base template is the most basic template that you extend on every page of your website.

Let's create a `base.html` file in `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html

Then open it up and copy everything from `post_list.html` to `base.html` file, like this:

    {% load staticfiles %}
    <html>
        <head>
            <title>Django Girls blog</title>
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <link href='http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>
        <body>
            <div class="page-header">
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-8">
                    {% for post in posts %}
                        <div class="post">
                            <p>published: {{ post.published_date }}</p>
                            <h1><a href="">{{ post.title }}</a></h1>
                            <p>{{ post.text|linebreaks }}</p>
                        </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
        </body>
    </html>

Then in `base.html`, replace your whole `<body>` (everything between `<body>` and `</body>`) with this:

    <body>
        <div class="page-header">
            <h1><a href="/">Django Girls Blog</a></h1>
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

We basically replaced everything between `{% for post in posts %}{% endfor %}` with:

    {% block content %}
    {% endblock %}

What does it mean? You just created a `block`, which is a template tag that allows you to insert HTML in this block in other templates that extend `base.html`. We will show you how to do this in a moment.

Now save it, and open your `blog/templates/blog/post_list.html` again. Delete everything else other than what's inside the body and then also delete `<div class="page-header"></div>`, so the file will look like this:

    {% for post in posts %}
        <div class="post">
            <p>published: {{ post.published_date }}</p>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}

And now add this line to the beginning of the file:

    {% extends 'blog/base.html' %}

It means that we're now extending the `base.html` template in `post_list.html`. Only one thing left: put everything (except the line we just added) between `{% block content %}` and `{% endblock content %}`. Like this:

    {% extends 'blog/base.html' %}

    {% block content %}
        {% for post in posts %}
            <div class="post">
                <p>published: {{ post.published_date }}</p>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaks }}</p>
            </div>
        {% endfor %}
    {% endblock content %}

That's it! Check if your website is still working properly :)

> If you have an error `TemplateDoesNotExists` that says that there is no `blog/base.html` file and you have `runserver` running in the console, try to stop it (by pressing Ctrl+C - Control and C buttons together) and restart it by running a `python manage.py runserver` command.
