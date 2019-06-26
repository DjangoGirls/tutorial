# Django views - este timpul să le creăm!

Este timp să corectăm eroare pe care am creat-o în ultim capitol :)

*view* este loc unde noi punem toata logica aplicației. El va solicita informație de la `model` pe care l-am creat mai înainte și va transmite `template`-ului. O să creăm template în capitolul următor. View-urile sunt doar funțiile Python care sunt puțin mai complicate decât cele pe care le-am scris în capitolul **Introducere în Python**.

View-urile sunt plasate în fișierul `views.py`. O să adăugăm *views* în fișier `blog/views.py`.

## blog/views.py

OK, hai să deschidem fișierul dat în editorul de cod și să vedem ce este în el:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Nu prea multe lucruri aici.

Țineți minte că liniile care încep cu `#` sunt comentarii – acesta înseamnă ca ele nu vor fi interpretate de Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Another error! Read what's going on now:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/