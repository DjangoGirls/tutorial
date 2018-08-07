# Qu'est-ce que Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) est un framework web gratuit et open-source écrit en Python. Un framework web est un ensemble de composants qui vous aide à développer des sites web plus rapidement et plus facilement.

Lorsque vous créez un site web, vous avez souvent besoin de la même chose : une manière de gérer l'authentification de vos utilisateurs (créer un compte, se connecter, se déconnecter), une partie dédiée à la gestion de votre site, des formulaires, une manière de mettre en ligne des fichiers, etc.

Heureusement pour vous, d'autres personnes ont réalisé depuis longtemps que les développeurs web font face aux mêmes problèmes lors de la construction d'un nouveau site, donc ils travaillent ensemble et créent un framework (Django étant un) qui vous donne des composants prêts à l'emploi.

Les frameworks existent pour vous éviter d'avoir à réinventer la roue et aider à réduire les frais généraux lorsque vous construisez de nouveaux sites.

## Pourquoi est-ce que vous auriez besoin d'un framework ?

Pour comprendre ce qu'est exactement Django, nous devons regarder de plus près le serveur. La première chose est que le serveur doit savoir que vous voulez vous servir une page Web.

Imaginez une boîte aux lettres (un port) dont l'arrivée de lettres (une requête) serait surveillée. C'est le travail qu'effectue le serveur. Le serveur Web lit la lettre et renvoie une page Web en réponse. Généralement, lorsque vous voulez envoyer quelque chose, vous avez besoin de contenu. Django est un outil qui va vous aider à créer ce contenu.

## Que se passe-t-il quand quelqu'un demande un site web à votre serveur ?

Lorsqu'une requête arrive sur un serveur web, elle est transmise à Django dont le premier travail va être de comprendre ce qui est demandé. Il s'occupe tout d'abord de l'adresse de page Web et essaie de savoir quoi faire. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). Ce n'est pas très intelligent - il faut une liste de modèles et essaie de faire correspondre l'URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Afin d'y voir un peu plus clair, imaginez une postière transportant une lettre. Elle descend la rue et vérifie à chaque maison si le numéro de celle-ci correspond à celui de la lettre. Si jamais les deux numéros correspondent, elle met la lettre dans la boîte aux lettres de cette maison. C'est à peu près comme cela que fonctionne l'urlresolver !

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Par exemple, peut-être que l'utilisateur vient de demander de changer quelque chose dans ces données ? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Bien sûr, ceci n'est qu'une description très simplifiée du processus. Vous n'avez pas besoin de connaitre tous les détails techniques pour le moment : cette vue d'ensemble suffira largement.

Maintenant, nous aurions la possibilité de vous assommer avec des détails complexes sur comment tout cela fonctionne. À la place, nous allons plutôt commencer à construire quelque chose ! Nous vous donnerons toutes les informations importantes au fur et à mesure que vous progresserez. Ce sera plus sympa, non ?