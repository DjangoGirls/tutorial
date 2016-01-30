# L'interface d'administration de Django

Pour ajouter, éditer et supprimer les posts que nous venons de modéliser, nous allons utiliser l'interface d'administration de Django.

Ouvrons le fichier `blog/admin.py` et remplaçons son contenu par ceci :

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```    

Comme vous pouvez le voir, nous importons le modèle « Post » que nous avons écrit dans le chapitre précédent. Afin que notre modèle soit visible dans l'interface d'administration, nous avons besoin d'enregistrer notre modèle à l'aide de `admin.site.register(Post)`.

Voilà, il est temps de jeter un œil à notre modèle Post. N'oubliez pas d'exécuter `python manage.py runserver` dans votre console afin de lancer le serveur web. Dans votre navigateur, entrez l'adresse http://127.0.0.1:8000/admin/. Si tout va bien, vous verrez une page comme celle-ci:

![Page de login][1]

 [1]: images/login_page2.png

Afin de vous connecter, vous allez devoir créer un *superuser*, c'est à dire un utilisateur qui contrôlera l'intégralité du site. Retournez à votre ligne de commande : tapez `python manage.py createsuperuser` puis appuyez sur entrée. Tapez votre nom d'utilisateur (en minuscules, sans espace), votre email et votre mot de passe. Vous ne voyez pas le mot de passe que vous êtes en train de taper ? C'est tout à fait normal, ne vous inquiétez pas ! Tapez simplement votre mot de passe et appuyez sur `entrée` pour continuer. La sortie que vous allez obtenir doit ressembler à celle-ci. Notez que le nom d'utilisateur et l'adresse email doivent correspondre aux informations que vous venez d'entrer.

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Retournez dans votre navigateur et connectez-vous en tant que superutilisateur grâce à l'utilisateur que vous venez de créer. Vous devriez accéder à l'interface d'administration de Django.

![Django admin][2]

 [2]: images/django_admin3.png

Allez voir vos posts et expérimentez un peu avec. Ajoutez 5 ou 6 posts. Ne vous occupez pas du contenu - vous pouvez juste copier du texte de ce tutoriel pour aller plus vite :).

Sur vos 5 posts, faites en sorte qu'au moins 2 ou 3 posts possèdent une date de publication. Prenez garde à ne pas en donner à tous vos posts car nous allons avoir besoin de ces deux différents cas plus tard.

![Django admin][3]

 [3]: images/edit_post3.png

Si jamais vous voulez en savoir un peu plus sur l'interface d'administration de Django, vous pouvez lire la documentation qui lui est associée : https://docs.djangoproject.com/fr/1.8/ref/contrib/admin/

Il est probablement temps d'aller recharger vos batteries avec un café, un thé ou un truc à grignoter. Vous venez de créer votre modèle Django : vous méritez bien une petite pause !