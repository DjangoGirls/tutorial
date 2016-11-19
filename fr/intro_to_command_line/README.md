# Introduction à l'interface en ligne de commande

C'est un peu exaltant, non ? Dans quelques instants, vous allez écrire votre première ligne de code :)

**Commençons par vous présenter un nouvel ami : la ligne de commande !**

Les étapes suivantes vont vous montrer comment utiliser la fenêtre noire que tous les bidouilleurs·euses utilisent. Elle est un peu effrayante à première vue, mais en fait, c'est tout simplement un programme qui attend qu'on lui donne des commandes.

> **Note :** Il existe deux mots pour parler de dossier : dossier ou répertoire. Il se peut que nous utilisions les deux dans le tutoriel mais, pas de panique : ils signifient la même chose.

## Qu'est-ce qu'une ligne de commande ?

Cette fenêtre, qu'on appelle aussi **ligne de commande** ou **interface en ligne de commande**, est une application textuelle qui permet de voir et de manipuler des fichiers sur votre ordinateur. C'est un peu la même chose que l'Explorateur Windows ou Finder dans Mac, mais sans interface graphique. On l'appelle parfois aussi : *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Ouvrir l'interface en ligne de commande

Pour commencer à expérimenter, nous avons d'abord besoin d'ouvrir notre interface en ligne de commande.

### Windows

Aller dans Menu démarrer → Tous les programmes → Accessoires → Invite de commandes.

### Mac OS X

Applications → Utilitaires → Terminal.

### Linux

Vous la trouverez probablement dans Applications → Accessoires → Terminal, mais ça dépend de votre système. Si elle n'est pas là, demandez à Google :)

## Prompt

Vous devriez maintenant voir une fenêtre noire ou blanche qui attend vos commandes.

Si vous être sous Mac ou Linux, vous verrez probablement un `$`, comme ça :

    $


Sur Windows, c'est un signe `>`, comme ça :

    >


Chaque commande commence par ce signe, puis un espace. Mais vous n'avez pas besoin de le taper, votre ordinateur le fait pour vous :)

> Petite remarque : il se peut que vous voyiez quelque chose comme `C:\Users\ola>` ou `Olas-MacBookAir:~ola$` avant le signe de prompt. Pas de problème : c'est parfaitement normal. C'est juste parce que dans ce tutoriel, nous tentons de simplifier les choses autant que possible.

## Votre première commande (YAY !)

Commençons par quelque chose de simple. Tapez la commande suivante :

    $ whoami


ou

    > whoami


Puis, appuyez sur la touche `entrée`. Voilà ce qui s'affiche chez moi :

    $ whoami
    olasitarska


Comme vous pouvez le voir, l'ordinateur vient d'afficher votre nom d'utilisateur. Sympa, non ? ;)

> Essayez de taper chaque commande sans copier-coller. Ça aide à les retenir !

## Les bases

Les différents systèmes d'exploitation ont des commandes légèrement différentes, donc faites attention à suivre les instructions pour votre système d'exploitation. Allons-y !

### Dossier courant

Ce serait pratique de savoir dans quel répertoire nous nous trouvons. Pour le savoir, tapez la commande suivante et appuyez sur `entrée` :

    $ pwd
    /Users/olasitarska


Si vous êtes sous Windows :

    > cd
    C:\Users\olasitarska


Vous verrez probablement quelque chose de similaire sur votre machine. Quand vous ouvrez une ligne de commande, vous démarrez habituellement dans le dossier personnel de votre utilisateur.

> Remarque : "pwd" veut dire "print working directory" (afficher le dossier courant).

* * *

### Lister les fichiers et les dossiers

Du coup, que pouvons-nous trouver dans ce dossier personnel ? Pour le savoir, essayons ceci :

    $ ls
    Applications
    Bureau
    Musique
    Téléchargements
    ...


Windows :

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Bureau
    05/08/2014 07:28 PM <DIR>      Musique
    05/08/2014 07:28 PM <DIR>      Téléchargements
    ...


* * *

### Changer le dossier courant

Maintenant, essayons d'aller sur notre bureau :

    $ cd Bureau


Windows :

    > cd Bureau


Vérifions que ça a bien changé :

    $ pwd
    /Users/olasitarska/Bureau


Windows :

    > cd
    C:\Users\olasitarska\Bureau


Et voilà !

> Pro tip : si vous tapez `cd B` puis que vous appuyez sur la touche `tabulation`, la ligne de commande va automatiquement compléter le reste du nom. Cela va vous permettre d'aller plus vite et d'éviter des fautes de frappe. Si plusieurs dossiers commencent par un « B », appuyez sur `tabulation` deux fois pour avoir une liste des options.

* * *

### Créer un dossier

Que diriez-vous de créer un répertoire dédié aux exercices sur votre bureau ? Vous pouvez le faire de cette façon :

    $ mkdir exercices


Windows :

    > mkdir exercices


Cette petite commande crée un dossier nommé `exercices` sur votre bureau. Vous pouvez vérifier qu'il est bien là en regardant votre bureau, ou en lançant la commande `ls` ou `dir` ! Essayez donc :)

> Pro tip : Si vous voulez éviter de taper les mêmes commandes plein de fois, essayez d'appuyer sur les touches `flèche haut` et `flèche bas` pour retrouver les dernières commandes que vous avez tapé.

* * *

### Un peu d'exercice !

Petit défi pour vous : dans votre nouveau dossier `exercices`, créez un dossier appelé `test`. Pour ça, utilisez les commandes `cd` et `mkdir`.

#### Solutions :

    $ cd exercices
    $ mkdir test
    $ ls
    test


Windows :

    > cd exercices
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test


Félicitations ! :)

* * *

### Nettoyage

Supprimons tout ce qu'on vient de faire, histoire d'éviter de laisser du bazar.

D'abord, revenons au Bureau :

    $ cd ..


Windows :

    > cd ..



Grâce à `..` et la commande `cd`, vous pouvez aller directement dans le dossier parent de votre répertoire courant (c'est à dire le dossier qui contient le dossier dans lequel vous étiez).

Vérifiez où vous êtes :

    $ pwd
    /Users/olasitarska/Bureau


Windows :

    > cd
    C:\Users\olasitarska\Bureau


Maintenant, il est temps de supprimer notre dossier `exercices` :

> **Attention** : Supprimer des fichiers avec `del`, `rmdir` ou `rm` est irrévocable, ce qui veut dire que *les fichiers supprimés sont perdus à jamais* ! Du coup, faites très attention avec cette commande.

    $ rm -r exercices


Windows :

    > rmdir /S exercices
    exercices, Are you sure <Y/N>? Y


Et voilà. Pour être sure que le dossier a bien été supprimé, vérifiez :

    $ ls


Windows :

    > dir


### Sortir

C'est tout pour le moment ! Vous pouvez maintenant fermer la ligne de commande. Faisons-le à la manière des bidouilleurs⋅euses. :)

    $ exit


Windows :

    > exit


Cool, non ? :)

## Résumé

Voici un résumé de quelques commandes utiles :

| Commande (Windows) | Commande (Mac OS / Linux) | Description                 | Exemple                                           |
| ------------------ | ------------------------- | --------------------------- | ------------------------------------------------- |
| exit               | exit                      | ferme la fenêtre            | **exit**                                          |
| cd                 | cd                        | change le dossier courant   | **cd test**                                       |
| dir                | ls                        | liste des fichiers/dossiers | **dir**                                           |
| copy               | cp                        | copie un fichier            | **copy c:\test\test.txt c:\windows\test.txt** |
| move               | mv                        | déplace un fichier          | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir              | mkdir                     | crée un nouveau dossier     | **mkdir testdirectory**                           |
| del                | rm                        | supprime un dossier/fichier | **del c:\test\test.txt**                        |

Ce ne sont que quelques-unes des commandes que vous pouvez utiliser dans votre ligne de commande. Cette liste est suffisante pour réaliser ce tutoriel.

Si vous êtes curieuse, [ss64.com][1] contient une référence complète de toutes les commandes pour tous les systèmes d'exploitation.

 [1]: http://ss64.com

## Vous êtes prête ?

Nous allons plonger dans Python !
