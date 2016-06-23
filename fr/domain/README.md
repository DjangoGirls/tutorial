# Nom de domaine

Heroku vous a donné un nom de domaine, mais il est long, difficile à retenir, et franchement moche... Ce serait quand même mieux d'avoir un nom de domaine plus court et plus facile à retenir, n'est-ce pas ?

C'est ce que nous allons voir dans ce chapitre : comment acheter un nom de domaine et le faire pointer vers Heroku !

## Où enregistrer son nom de domaine ?

Un nom de domaine coûte environ 15$ par an. Vous pouvez en trouver des plus ou moins cher : tout dépend de votre provider. Il existe de très nombreuses compagnies spécialisées dans l'enregistrement de nom de domaine : une simple recherche sur [Google][1] vous listera plusieurs centaines de possibilités.

 [1]: https://www.google.com/search?q=register%20domain

Notre petit favori est [I want my name][2]. Ils revendiquent un "management de nom de domaine sans peine", ce qui est vraiment le cas.

 [2]: https://iwantmyname.com/

## Comment enregistrer mon nom de domaine sur IWantMyName ?

Allez sur [iwantmyname][3] et tapez le nom de domaine que vous souhaiteriez enregistrer dans le champ de recherche.

 [3]: https://iwantmyname.com

![][4]

 [4]: images/1.png

Une liste des noms de domaines disponibles avec le nom que vous souhaiteriez va alors s'afficher. Comme vous pouvez le constater, un smiley joyeux indique que le nom de domaine est libre tandis qu'un smiley triste signifie qu'il est malheureusement déjà pris.

![][5]

 [5]: images/2.png

Nous avons décidé d'acheter `djangogirls.in` :

![][6]

 [6]: images/3.png

Allez dans votre panier et confirmez-le. Vous allez devoir vous créer un compte sur iwantmyname. Ensuite, vous allez pouvoir sortir votre carte bleue et acheter votre nom de domaine !

Une fois ces étapes franchies, cliquez sur `Domains` dans le menu et sélectionnez votre tout nouveau nom de domaine. Ensuite, trouvez et cliquez sur le lien `manage DNS records` :

![][7]

 [7]: images/4.png

Cherchez ce formulaire :

![][8]

 [8]: images/5.png

Remplissez le avec les informations suivantes : - Hostname: www - Type: CNAME - Value: votre nom de domaine chez Heroku (par exemple djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Cliquez sur le bouton "Add" puis le bouton "Save changes" en bas de la page.

Il va falloir attendre quelques heures avant que votre nom de domaine fonctionne, soyez patient⋅e !

## Configurer un nom de domaine dans Heroku

Vous allez avoir besoin de prévenir Heroku que vous souhaitez utiliser un nom de domaine perso.

Pour cela, allez dans le [Dashboard d'Heroku][10], connectez-vous avec votre compte et choisissez votre application. Ensuite, allez dans la partie configuration (settings) de votre application et ajoutez votre nom de domaine dans la section `Domains`. N'oubliez pas d'enregistrer les modifications.

 [10]: https://dashboard.heroku.com/apps

Et voilà, c'est tout !