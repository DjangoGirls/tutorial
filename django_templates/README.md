# Django templates

Time to display some data! Django gives us some helpful, built-in __template tags__ for that.

## What are template tags?

You see, in HTML, you can't really put Python code, because browsers don't understand it. They only know HTML. We know, that HTML is rather static, while Python is much more dynamic.

__Django template tags__ allow us to transfer Python-like things into HTML, so you can build dynamic websites faster and easier. Yikes!

## Display post list template

In previous chapter we gave our template a list of posts in a `posts` variable. Now we will display it in HTML.

To print a variable in Django template, we use double curly brackets with variable name inside, like this:

    {{ posts }}

Try this in your `post_list.html` template.
