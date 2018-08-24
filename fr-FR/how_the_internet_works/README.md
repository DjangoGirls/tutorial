# Comment fonctionne Internet

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Exactement comme vos vidéos, vos musiques ou vos photos. Cependant, les sites web ont quelque chose d'unique : ils contiennent du code informatique appelé HTML.

Si vous n'avez pas l'habitude de la programmation, il peut être difficile de comprendre HTML au début, mais vos navigateurs web (comme Chrome, Safari, Firefox, etc.) adorent ça. Les navigateurs web sont conçus pour comprendre ce code, pour suivre les instructions qu'il contient et présenter les fichiers de votre site web exactement comme vous voulez qu'ils soient présentés.

Comme pour n'importe quel autre fichier, il faut stocker les fichiers HTML sur un disque dur quelque part. Pour Internet, on utilise des ordinateurs spéciaux, très puissants, appelés *serveurs*. Ils n'ont pas d'écran, de clavier ou de souris, car leur rôle est de stocker des données, et de les servir. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

Nous vous avons fait un dessin ! Voilà à quoi ça ressemble :

![Figure 1.1](images/internet_1.png)

C'est le bazar, non ? In fact it is a network of connected machines (the above-mentioned *servers*). Des centaines de milliers de machines ! Des millions de kilomètres de câbles, partout dans le monde ! Vous pouvez aller voir une carte des câbles sous-marins (http://submarinecablemap.com/) pour voir à quel point le réseau est compliqué. Voici une capture d'écran du site :

![Figure 1.2](images/internet_3.png)

Fascinant, non ? But it is not possible to have a wire between every machine connected to the Internet. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Ça ressemble ça :

![Figure 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Votre lettre part vers le bureau de poste le plus proche. Ensuite, il file vers un autre, qui est plus proche de votre destinataire. Puis un autre, et encore un autre, jusqu'à sa destination. Une chose à retenir : si vous envoyez beaucoup de lettres (*data packets*) au même endroit, il se pourrait qu'elles transitent par des postes différentes (*routers*). Cela dépend de la manière dont elles sont distribuées à chaque bureau de poste.

![Figure 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

À la place des adresses postales (nom de rue, ville, code postal), nous utilisons des adresses IP. Votre ordinateur commence par demander au DNS (Domaine Name System) de traduire djangogirls.org en une adresse IP. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Vous devez aussi utiliser une langue que votre destinataire comprend. C'est la même chose pour les paquets de données que vous envoyez pour voir un site web. Vous utilisez un protocole appelé HTTP (Hypertext Tranfer Protocol).

Donc, au final, pour avoir un site web il faut qu'il soit sur un *serveur* (c'est une machine). Lorsque le *serveur* reçoit une *requête/0> (dans une lettre), il envoie votre site Web (dans une autre lettre).</p> 

Since this is a Django tutorial, you might ask what Django does. Quand vous envoyez une réponse, vous ne renvoyez pas toujours la même réponse à tout le monde. C'est bien mieux quand les lettres sont personnalisées, surtout quand elles s'adressent à quelqu'un qui vient de vous écrire, non ? Et bien Django vous aide à écrire les lettres personnalisées et intéressantes. :)

Enough talk – time to create!