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
            <link rel="stylesheet" href="{% static 'css/blog.css' %}">
        </head>

        <body>
            <h1>Django Girls blog</h1>
            <h3>Posts:</h3>
            <ul>
                {% for post in posts %}
                    <li><a href="">{{ post }}</a> (published: {{ post.published_date }})</li>
                {% endfor %}
            </ul>
        </body>
    </html>

Then in `base.html`, replace your whole `<body>` with this:

    <body>
        {% block content %}
        {% endblock %}
    </body>

What does it mean? You just created a `block`, which is a template tag that allows you to insert HTML in this place in templates that are extending `base.html`.

Now save it, and open your `post_list.html` again. Delete everything else than what's inside the body:

    <h1>Django Girls blog</h1>
    <h3>Posts:</h3>
    <ul>
        {% for post in posts %}
            <li><a href="">{{ post }}</a> (published: {{ post.published_date }})</li>
        {% endfor %}
    </ul>

And now add this line on the beginning:

    {% extends 'mysite/base.html' %}

It means that we're now extending `base.html` template in `post_list.html`. Only one thing left: put everything else between `{% block content %}` and `{% endblock content %}`. Like this:

    {% extends 'mysite/base.html' %}

    {% block content %}
        <h1>Django Girls blog</h1>
        <h3>Posts:</h3>
        <ul>
            {% for post in posts %}
                <li><a href="">{{ post }}</a> (published: {{ post.published_date }})</li>
            {% endfor %}
        </ul>
    {% endblock content %}

That's it! Check if your website is still working properly :)



