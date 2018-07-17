# Django views – time to create!

Nejdříve se musíme zbavit chyb, které jsme vytvořili v předchozí kapitole! :)

*View* je místo, kam píšeme "logiku" naší aplikace. Bude požadovat informace z `modelu` který jsi vytvořila dříve a předá je `šabloně`. Šablonu vytvoříme v příští kapitole. Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

View se dávají do souboru `views.py`. My si teď přidáme naše vlastní *view* do souboru `blog/views.py`.

## blog/views.py

OK, pojďme otevřít tento soubor a podívat se co tam je:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and `return` a function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Další chyba! Přečti si, co je špatně nyní:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/