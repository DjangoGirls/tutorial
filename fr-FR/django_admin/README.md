# Django admin

Pour ajouter, modifier et supprimer les posts que nous venons de créer, nous allons utiliser l'interface Django admin.

Ouvrons le fichier `blog/admin.py` et remplaçons son contenu par ceci :

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Comme vous pouvez le voir, nous importons le modèle « Post » que nous avons écrit dans le chapitre précédent. Afin que notre modèle soit visible dans l'interface d'administration, nous avons besoin d'enregistrer notre modèle à l'aide de `admin.site.register(Post)`.

Voilà, il est temps de jeter un œil à notre modèle Post. N'oubliez pas d'exécuter `python manage.py runserver` dans votre console afin de lancer le serveur web. Retourner sur votre navigateur et taper l'adresse http://127.0.0.1:8000/admin/. Vous verrez une page de login qui ressemble à celle-ci :

![Page de login](images/login_page2.png)

Afin de vous connecter, vous allez devoir créer un *superuser*, c'est à dire un utilisateur qui contrôlera l'intégralité du site. Retournez à votre ligne de commande : tapez `python manage.py createsuperuser` puis appuyez sur entrée.

> Conseil : pour pouvoir taper de nouvelles commandes pendant que le serveur tourne, ouvrez une nouvelle console et activez à nouveau votre virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Allez aux Posts et expérimentez un peu avec. Ajoutez cinq ou six articles de blog. Ne vous inquiétez pas du contenu - vous pouvez simplement copier du texte de ce tutoriel pour gagner du temps. :)

Assurez-vous qu'au moins deux ou trois messages (mais pas tous) ont une date de publication. Ce sera utile plus tard.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

Cela peut être un bon moment pour prendre un café (ou un thé) ou quelque chose à manger pour vous redynamiser. Vous avez créé le premier modèle Django - vous méritez une petite pause!