# Qu'est-ce que Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) est un framework web gratuit et libre écrit en Python. Un framework web est un ensemble de composants qui vous aide à développer des sites web plus rapidement et plus facilement.

Lorsque vous créez un site web, vous avez souvent besoin de la même chose : une manière de gérer l'authentification de vos utilisateurs (créer un compte, se connecter, se déconnecter), une partie dédiée à la gestion de votre site, des formulaires, une manière de mettre en ligne des fichiers, etc.

La bonne nouvelle, c'est que d'autres gens se sont aussi rendus compte de ce problème et ont décidé de s'allier avec des développeurs·ses pour le résoudre. Ensemble, ces personnes ont créé différents frameworks, dont Django, pour fournir un set de composants de base qui peuvent être utilisés lors de la création d'un site web.

Les frameworks existent pour vous éviter de réinventer la roue à chaque fois. Ils vous aident aussi à alléger la charge de travail liée à la création d'un site web.

## Pourquoi est-ce que vous auriez besoin d'un framework ?

Pour comprendre ce à quoi peut bien servir Django, nous avons besoin de nous intéresser aux multiples rôles des serveurs. Par exemple, la première chose qu'a besoin de savoir un serveur, c'est que vous aimeriez qu'il vous affiche une page web.

Imaginez une boîte aux lettres (un port) dont l'arrivée de lettres (une requête) serait surveillée. C'est le travail qu'effectue le serveur. Le serveur web lit la lettre qu'il a reçue et en réponse, retourne une page web. Généralement, lorsque vous voulez envoyer quelque chose, vous avez besoin de contenu. Django est quelque chose qui va vous aider à créer ce contenu.

## Que se passe-t-il quand quelqu'un demande un site web à votre serveur ?

Quand une requête arrive sur un serveur web, elle est transmise à Django dont le premier travail va être d'essayer de comprendre ce qui est exactement demandé. Il s'occupe tout d'abord de l'adresse de la page web et essaye de comprendre ce qu'il doit en faire. Ce travail est effectué par l' **urlresolver** de Django (l'adresse d'une page web est appelée URL, Uniform Resource Locator, ce qui nous aide à comprendre le nom *urlresolver*). Comme il n'est pas très malin, il prend une liste de modèles existants et essaye de trouver celui qui correspond à notre URL. Django lit sa liste de modèles du haut vers le bas et si jamais quelque chose correspond, il envoie la requête à la fonction associée (qui s'appelle une *vue (view)*).

Afin d'y voir un peu plus clair, imaginez une postière transportant une lettre. Elle descend la rue et vérifie à chaque maison si le numéro de celle-ci correspond à celui de la lettre. Si jamais les deux numéros correspondent, elle met la lettre dans la boîte aux lettres de cette maison. C'est à peu près comme cela que fonctionne l'urlresolver !

C'est dans la fonction *vue* que les choses intéressantes se passent : cela nous permet de jeter un œil dans la base de données pour obtenir des informations. Par exemple, peut-être que l'utilisateur vient de demander de changer quelque chose dans ces données ? Ce serait comme une lettre dont le contenu serait : "Merci de changer la description de mon emploi actuel". La *vue* va tout d'abord vérifier que l'utilisateur est bien autorisé à effectuer ce changement puis elle corrigera la description de l'emploi. Enfin, elle retournera un message de type : "C'est bon, j'ai terminé ! ". La *vue* créera une réponse et c'est Django qui se chargera de la transmettre au navigateur de l'utilisateur.

Bien sûr, ceci n'est qu'une description très simplifiée du processus. Vous n'avez pas besoin de connaitre tous les détails techniques pour le moment : cette vue d'ensemble suffira largement.

Maintenant, nous aurions la possibilité de vous assommer avec des détails complexes sur comment tout cela fonctionne. À la place, nous allons plutôt commencer à construire quelque chose ! Nous vous donnerons toutes les informations importantes au fur et à mesure que vous progresserez. Ce sera plus sympa, non ?
