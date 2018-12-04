# Vues Django - C'est l'heure de créer !

Il est enfin temps de se débarrasser du bug que nous avons créé dans le chapitre précédent! :)

C'est dans la *vue* que nous allons ranger toute la partie "logique" de notre application. C'est elle qui va se charger d'aller chercher les informations liées à notre `modèle `que nous venons de créer et de les passer à un `template`. Nous allons créer ce template dans le chapitre suivant. Concrètement, les vues ne sont que des fonctions Python un peu plus élaborées que celles que nous avons créées dans la partie **Introduction à Python**.

Les vues sont placées dans le fichier `views.py`. Nous allons créer nos *vues* dans le fichier `blog/views.py`.

## blog/views.py

Ok, allons-y ! Ouvrons ce fichier dans notre éditeur de code pour voir ce qu'il contient :

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Pas beaucoup de choses pour l'instant.

N’oubliez pas que les lignes commençant par `#` sont des commentaires, ce qui signifie qu'elles ne sont pas exécutées par Python.

Nous allons créer une *vue* comme l’indique le commentaire. Ajoutez la vue minimale suivante :

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Une autre erreur ! Voyons ce qu'elle nous dit :

![Erreur](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/