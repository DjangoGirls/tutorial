# Template extending

Another nice thing Django prepared for you is __template extending__. What it means? It means that you can use the same parts of your HTML for different pages of your website.

This way you don't have to write it every time, you don't repeat yourself and if you want to change something, you don't have to do it in every template, just once!

## Create base template

Base template is the most basic template that you then use to extend it on every page of your website.

Create a `mysite/templates/mysite/base.html` file. You also need to create `templates` and `mysite` folders, but you probably have noticed this pattern already :)

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
                <h1><a href="">Django Girls Blog</a></h1>
            </div>

            <div class="content">
                <div class="row">
                    <div class="col-md-8">
                    {% for post in posts %}
                        <div class="post">
                            <small>published: {{ post.published_date }}</small>
                            <h1><a href="">{{ post.title }}</a></h1>
                            <p>{{ post.text }}</p>
                        </div>
                    {% endfor %}
                    </div>
                </div>
            </div>
        </body>
    </html>

Then in `base.html`, replace your whole `<body>` with this:

    <body>
        {% block content %}
        {% endblock %}
    </body>

What does it mean? You just created a `block`, which is a template tag that allows you to insert HTML in this place in templates that are extending `base.html`.

Now save it, and open your `post_list.html` again. Delete everything else than what's inside the body:

    <div class="page-header">
        <h1><a href="">Django Girls Blog</a></h1>
    </div>

    <div class="content">
        <div class="row">
            <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <small>published: {{ post.published_date }}</small>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text }}</p>
                </div>
            {% endfor %}
            </div>
        </div>
    </div>

And now add this line on the beginning:

    {% extends 'mysite/base.html' %}

It means that we're now extending `base.html` template in `post_list.html`. Only one thing left: put everything else between `{% block content %}` and `{% endblock content %}`. Like this:

    {% extends 'mysite/base.html' %}

    {% block content %}
        <div class="page-header">
            <h1><a href="">Django Girls Blog</a></h1>
        </div>

        <div class="content">
            <div class="row">
                <div class="col-md-8">
                {% for post in posts %}
                    <div class="post">
                        <small>published: {{ post.published_date }}</small>
                        <h1><a href="">{{ post.title }}</a></h1>
                        <p>{{ post.text }}</p>
                    </div>
                {% endfor %}
                </div>
            </div>
        </div>
    {% endblock content %}

That's it! Check if your website is still working properly :)



