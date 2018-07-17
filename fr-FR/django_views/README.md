# Django views – time to create!

Il est enfin temps de se débarrasser du bug que nous avons créé dans le chapitre précédent! :)

C'est dans la *vue* que nous allons ranger toute la partie "logique" de notre application. C'est elle qui va se charger d'aller chercher les informations liées à notre `modèle `que nous venons de créer et de les passer à un `template`. Nous allons créer ce template dans le chapitre suivant. Views are just Python functions that are a little bit more complicated than the ones we wrote in the **Introduction to Python** chapter.

Les vues sont placées dans le fichier `views.py`. Nous allons créer nos *vues* dans le fichier `blog/views.py`.

## blog/views.py

Ok, allons-y ! Ouvrons ce fichier pour voir ce qu'il contient :

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

Une autre erreur ! Voyons ce qu'elle nous dit :

![Erreur](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/