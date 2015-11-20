# Comment marche l'Internet

> Ce chapitre est inspiré par la présentation "How the Internet works" par Jessica McKellar (http://web.mit.edu/jesstess/www/).

Vous utilisez sûrement Internet tous les jours. Mais savez-vous ce qu'il se passe vraiment quand vous tapez une adresse comme http://djangogirls.org dans votre navigateur et appuyez sur 'Entrée' ?

Avant tout, il faut savoir qu'un site web n'est rien de plus qu'un tas de fichiers sauvegardés sur un disque dur. Exactement comme vos vidéos, vos musiques ou vos photos. Cependant, les sites web ont quelque chose d'unique : ils contiennent du code informatique appelé HTML.

Si vous n'avez pas l'habitude de la programmation, il peut être difficile de comprendre le HTML au début, mais vos navigateurs web (comme Chrome, Safari, Firefox, etc.) adorent ça. Les navigateurs web sont conçus pour comprendre ce code, pour suivre les instructions qu'il contient et présenter les fichiers de votre site web exactement comme vous voulez qu'ils soient présentés.

Comme pour n'importe quel autre fichier, il faut stocker les fichiers HTML sur un disque dur quelque part. Pour Internet, on utilise des ordinateurs spéciaux, très puissants, appelés *serveurs*. Ils n'ont pas d'écran, de clavier ou de souris, car leur rôle est de stocker des données, et de les servir. C'est pour ça qu'on les appelle des *serveurs* — parce qu'ils sont là pour vous *servir* des données.

Bon, d'accord. Mais vous avez envie de savoir à quoi Internet ressemble, n'est-ce-pas ?

On vous a fait un dessin ! Internet ressemble à ça:

![Figure 1.1][1]

 [1]: images/internet_1.png

C'est le bazar, non ? En fait, c'est un réseau de machines connectées entre elles (les *serveurs* dont on parlait plus tôt). Des centaines de milliers de machines ! Beaucoup, beaucoup de kilomètres de câbles, partout dans le monde ! Vous pouvez aller voir une carte des câbles sous-marins (http://submarinecablemap.com/) pour voir à quel point le réseau est compliqué. Voici une capture d'écran du site:

![Figure 1.2][2]

 [2]: images/internet_3.png

Fascinant, non ? Mais, il n'est évidemment pas possible de tirer un câble de chaque machine connecté à Internet vers chaque autre. Du coup, pour atteindre une machine (par exemple, celle où http://djangogirls.org est sauvegardé), on doit faire passer une requête par plein d'autres machines.

Ça ressemble à ça :

![Figure 1.3][3]

 [3]: images/internet_2.png

C'est un peu comme si, quand vous tapez http://djangogirls.org, vous envoyiez une lettre que dit "Chères Django Girls, je voudrais voir le site djangogirls.org. Pouvez-vous me l'envoyer ?"

Votre lettre part vers le bureau de post le plus proche. Ensuite, il file vers un autre, qui est plus proche de votre destinataire. Puis un autre, et encore une autre, jusqu'à sa destination. Pour Internet, c'est pareil. La seule différence, c'est que si vous envoyez plusieurs lettres (*des paquets de données*) vers le même endroit, chaque lettre peut emprunter une route différente, et voir différents bureaux de post (*routeurs*), selon la manière dont chaque bureau de poste distribue chaque lettre.

![Figure 1.4][4]

 [4]: images/internet_4.png

Oui, c'est aussi simple que ça. Vous envoyez des messages et attendez une réponse. Alors, bien sûr, le papier et le crayon sont remplacés par des octets de données, mais l'idée est la même.

À la place des adresses postales (nom de rue, ville, code postal), nous utilisons des adresses IP. Votre ordinateur commence par demander au DNS (Domaine Name System) de traduire djangogirls.org en une adresse IP. Ça marche un peu comme un de ces vieux annuaires où on peut chercher le nom d'une personne et trouver son numéro de téléphone et son adresse.

Quand vous envoyez une lettre, elle a besoin de certaines choses pour transiter correctement, comme une adresse, un timbre, etc. Vous devez aussi utiliser une langue que votre destinataire comprend. C'est la même chose pour les *paquets de données* que vous envoyez pour voir un site web&nbsp;: vous utilisez un protocole appelé HTTP (Hypertext Tranfer Protocol).

Donc, finalement, pour avoir un site web il faut qu'il soit sur un *serveur* (c'est une machine). Le *serveur* attend qu'on lui envoie une *requête* (une lettre qui demande au serveur d'envoyer le site web) et renvoie le site web (dans une autre lettre).

Puisqu'on est dans un tutoriel sur Django, vous devez vous demander ce que Django fait. Quand vous envoyez une réponse, vous ne renvoyez pas toujours la même réponse à tout le monde. C'est bien mieux quand les lettres sont personnalisées, surtout quand elles s'adressent à quelqu'un qui vient de vous écrire, non? Et bien Django vous aide à écrire les lettres personnalisées et intéressantes. :)

Assez parlé, il est temps de créer !
