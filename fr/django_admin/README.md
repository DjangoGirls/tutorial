# L'interface d'administration de Django

Pour ajouter, éditer et supprimer les posts que nous venons de modéliser, nous allons utiliser l'interface d'administration de Django.

Ouvrons le fichier `blog/admin.py` et remplaçons son contenu par ceci:

```
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```    

Comme vous pouvez le voir, nous importons le modèle « Post » que nous avons écrit dans le chapitre précédent. Afin que notre modèle soit visible dans l'interface d'administration, nous avons besoin d'enregistrer notre modèle à l'aide de `admin.site.register(Post)`.

Ok, allons voir notre modèle « Post ». N'oubliez pas de lancer le server web en tapant `python manage.py runserver` dans la console. À l'aide de votre navigateur, allez à l'adresse suivante:

```
http://127.0.0.1:8000/admin/
``` 

Vous verrez une page de login qui ressemble à celle-ci:

![Page de login][1]

 [1]: images/login_page2.png

Afin de pouvoir vous connecter, vous avez besoin de créer un *superuser ou superutilisateur*. C'est un utilisateur qui peut contrôler l'intégralité du site. Reprenez votre ligne de commande et taper `python manage.py createsuperuser` et appuyez sur entrée. Tapez votre nom d'utilisateur (en minuscules, sans espace), votre email et votre mot de passe lorsqu'on vous le demande. Ce qui apparaît dans votre console doit ressembler à ceci, au détail près que « username » et « email » doivent être ceux que vous avez entrés:

```
(myvenv) ~/djangogirls$ python manage.py createsuperuser
Username: admin
Email address: admin@admin.com
Password:
Password (again):
Superuser created successfully.
``` 

Retournez dans votre navigateur et connectez-vous en tant que superutilisateur grâce à l'utilisateur que vous venez de créer. Vous devriez accéder à l'interface d'administration de Django.

![Django admin][2]

 [2]: images/django_admin3.png

Allez dans la partie "Post" et bidouillez un peu. Ajoutez 5 à 6 posts par exemple. N'accordez pas d'importance à leur contenu: vous pouvez tout simplement copier-coller le texte de ce tutoriel dans vos posts pour gagner du temps :).

Ajoutez une date de publication à au moins deux ou trois posts sur tous ceux que vous venez de créer: nous en aurons besoin pour la suite.

![Django admin][3]

 [3]: images/edit_post3.png

Si vous voulez en savoir plus sur l'interface d'administration de Django, n'hésitez pas à consulter la documentation du framework: https://docs.djangoproject.com/en/1.7/ref/contrib/admin/

C'est probablement le bon moment de faire une pause et d'aller vous chercher un café (ou un thé) et quelque chose à grignoter: vous venez de créer votre premier modèle Django! Vous méritez bien une petite récompense!
