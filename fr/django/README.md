# Django?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) est un framework web gratuit et libre écrit en Python. C'est un framework web, c'est-à-dire un ensemble de composants qui vous aide à développer des sites web plus rapidement et plus facilement.

Quand vous construisez un site web, vous avez toujours besoin des mêmes composants de base: quelque chose pour que les utilisateurs puissent se connecter (s'inscrire, se connecter, se déconnecter), une partie administration, des formulaires, un moyen d'uploader des fichiers, etc.

La bonne nouvelle, c'est que d'autres personnes se sont aussi rendues compte de ce problème. Elles se sont alliées avec des développeurs et ont créé différents frameworks, dont Django, pour fournir un set de composants de base qui fonctionnent et qui peuvent être utilisés lors de la création d'un site web.

Les frameworks existent pour vous éviter de réinventer la roue à chaque fois. Ils vous aident aussi à mettre facilement en place tous les éléments dont vous pourriez avoir besoin avant de vous lancer dans la création de votre site.

## Pourquoi est-ce que vous auriez besoin d'un framework?

Pour comprendre ce qu'est exactement Django, nous avons besoin de nous intéresser aux différents rôles des serveurs. La première chose qu'a besoin de savoir un serveur, c'est que vous aimeriez qu'il vous affiche une page web.

Imaginez que vous ayez une boîte aux lettres (port) qui serait surveillée afin de recevoir des lettres (requêtes). C'est ce que fait un serveur. Le serveur web lit la lettre qu'il a reçue et en réponse, retourne une page web. Généralement, lorsque vous voulez envoyer quelque chose, vous avez besoin de contenu. Django est quelque chose qui va vous aider à créer ce contenu.

## Qu'est-ce qui se passe quand quelqu'un demande un site web sur votre serveur?

Quand une requête arrive sur un serveur web, elle est transmise à django dont le premier travail va être d'essayer de comprendre ce qui est exactement demandé. Il s'occupe tout d'abord de l'adresse de la page web et essaye de comprendre ce qu'il doit en faire. Ce travail est effectué par l' **urlresolver** de Django (l'adresse d'une page web est appelée URL, Uniform Resource Locator, ce qui nous aide à comprendre le nom *urlresolver*). Comme il n'est pas très malin, il prend une liste de modèles existants et essaye de trouver celui qui correspond à notre URL. Django lit sa liste de modèles du haut vers le bas et si jamais quelque chose correspond, il envoie la requête à la fonction associée (qui s'appelle une *vue (view)*).

Ce serait comme une postière qui descendrait la rue avec une lettre et qui vérifierait à chaque maison si le numéro de celle-ci correspond à celui inscrit sur l'enveloppe. Dès que c'est le cas, elle dépose l'enveloppe dans la boîte aux lettres correspondante. C'est de cette manière que fonctionne l'urlresolver!

C'est dans la fonction *vue* que les choses intéressantes se passent: c'est à ce moment qu'on regarde dans la base de données à la recherche d'informations dont on a besoin. Par exemple, peut-être que l'utilisateur vient de demander de changer quelque chose dans ces données? Ce serait comme une lettre dont le contenu serait: "Merci de changer la description de mon emploi actuel". La *vue* va tout d'abord vérifier que l'utilisateur est bien autorisé à effectuer ce changement puis elle corrigera la description de l'emploi. Enfin, elle retournera un message de type: "C'est bon, j'ai terminé! ". La *vue* créera une réponse et c'est Django qui se chargera de la transmettre au navigateur de l'utilisateur.

Bien sûr, ceci n'est qu'une description très simplifiée du processus. Vous n'avez pas besoin de connaître tous les détails techniques pour le moment: cette vue d'ensemble suffira largement.

Maintenant, nous aurions la possibilité de vous assommer de détails compliqués sur comment tout cela fonctionne. À la place, nous allons plutôt commencer à construire quelque chose! Nous vous donnerons toutes les informations importantes au fur et à mesure que vous progresserez. Ce sera plus sympa, non?
