# Django templates

Time to display some data! Django gives us some helpful, built-in __template tags__ for that.

## What are template tags?

You see, in HTML, you can't really put Python code, because browsers don't understand it. They only know HTML. We know, that HTML is rather static, while Python is much more dynamic.

__Django template tags__ allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Yikes!

## Display post list template

In previous chapter we gave our template a list of posts in a `posts` variable. Now we will display it in HTML.

To print a variable in Django template, we use double curly brackets with variable name inside, like this:

    {{ posts }}

Try this in your `post_list.html` template, save file and refresh page to see results:

![Figure 13.1](images/step1.png)

As you can see, all we've got is this:

    [<Post: My second post>, <Post: My first post>]

This means that Django understand it is a list of objects. Remember from Introduction to Python how we can display lists? Yes, with for loops! In Django template, you do them this way:

    {% for post in posts %}
        {{ post }}
    {% endfor %}

Try this in your template.

![Figure 13.2](images/step2.png)

It works! But we want them to be display in a way we created earlier, like the static posts we put there before. You can mix HTML and template tags. Our `body` will look like that:

    <div>
        <h1><a href="">Django Girls Blog</a></h1>
    </div>

    {% for post in posts %}
        <div>
            <small>published: {{ post.published_date }}</small>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text }}</p>
        </div>
    {% endfor %}

Everything you put between {% for %} and {% endfor %} will be repeated for each object in the list. Refresh your page:

![Figure 13.3](images/step3.png)

Congrats! Now go ahead and try add a new post in your Django admin, then refresh your page to see if post appeared there.

Works like a charm? We're proud! Treat yourself something sweet, you have earned it :)

![Figure 13.4](images/donut.png)
