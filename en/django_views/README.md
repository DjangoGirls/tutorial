# Django views - time to create!

Time to get rid of the bug we created in the last chapter :)

A *view* is a place where we put the "logic" of our application. It will request information from the `model` you created before and pass it to a `template`. We'll create a template in the next chapter. Views are just Python functions that are a little bit more complicated than the ones we wrote in the __Introduction to Python__ chapter.

Views are placed in the `views.py` file. We will add our *views* to the `blog/views.py` file.

## blog/views.py

OK, let's open up this file and see what's in there:

```python
from django.shortcuts import render

# Create your views here.
```


Not too much stuff here yet. The simplest *view* can look like this.

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```


As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we have got.

Another error! Read what's going on now:

![Error](images/error.png)

This one is easy: *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/1.8/topics/http/views/
