# Introduction à l'interface en ligne de commande

C'est un peu exaltant, non? Dans quelques instants, vous allez écrire votre première ligne de code :)

**Commençons par vous présenter un nouvel ami: la ligne de commande!**

Les étapes suivantes vont vous montrer comment utiliser la fenêtre noire que tous les bidouilleurs·euses utilisent. Elle est un peu effrayante à première vue, mais en fait, c'est un programme qui attend qu'on lui donne des commandes.

## Qu'est-ce qu'une ligne de commande?

Cette fenêtre, qu'on appelle aussi **ligne de commande** ou **interface en ligne de commande**, est une application textuelle qui permet de voir et de manipuler des fichiers sur votre ordinateur (comme l'explorateur Windows ou Finder sur Mac, mais sans interface graphique). On l'appelle parfois aussi: *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Ouvrir l'interface en ligne de commande

Pour commencer à expérimenter, on a d'abord besoin d'ouvrir notre interface en ligne de commande.

### Windows

Aller dans Menu démarrer → Tous les programmes → Accessoires → Invite de commandes.

### Mac OS X

Applications → Utilitaires → Terminal.

### Linux

Vous la trouverez probablement dans Applications → Accessoires → Terminal, mais ça dépend de votre système. Si elle n'est pas là, demandez à Google :)

## Prompt

Vous devriez maintenant voir une fenêtre noire ou blanche qui attend vos commandes.

Si vous être sous Max ou Linux, vous verrez probablement un `$`, comme ça:

    $


Sur Windows, c'est un signe `>`, comme ça:

    >


Chaque commande commence par ce signe, puis un espace. Mais vous n'avez pas besoin de le taper, votre ordinateur le fait pour vous :)

> Petite remarque: il se peut que vous voyiez quelque chose comme `C:\Users\ola>` ou `Olas-MacBookAir:~ola$` avant le signe de prompt et c'est parfaitement normal. C'est juste parce que dans ce tutoriel, on tente de simplifier les choses autant que possible.

## Votre première commande (YAY!)

Commençons par quelque chose de simple. Tapez la commande suivante:

    $ whoami


ou

    > whoami


Et puis appuyez sur Entrée. Chez nous, ça donne ça:

    $ whoami
    olasitarska


Vous pouvez constater que l'ordinateur vient juste de vous montrer votre nom d'utilisateur. Pas mal, hein? :)

> Essayez de taper chaque commande sans copier-coller. Ça aide à retenir!

## Les bases

Les différents systèmes d'exploitation ont des commandes légèrement différentes, donc faites attention à suivre les instructions pour votre système d'exploitation. On est parti?

### Dossier courant

Ce serait pas mal de savoir où on est, non? Voyons voir. Tapez cette commande et appuyez sur Entrée:

    $ pwd
    /Users/olasitarska


Si vous êtes sous Windows:

    > cd
    C:\Users\olasitarska


Vous verrez probablement quelque chose de similaire sur votre machine. Quand vous ouvrez une ligne de commande, vous démarrez habituellement dans le dossier personnel de votre utilisateur.

> Remarque: "pwd" veut dire "print working directory".

* * *

### Lister les fichiers et les dossiers

Du coup, y'a quoi dans ce dossier personnel? Ce serait pas mal de le savoir. Essayons ça:

    $ ls
    Applications
    Bureau
    Musique
    Téléchargements
    ...


Windows:

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Bureau
    05/08/2014 07:28 PM <DIR>      Musique
    05/08/2014 07:28 PM <DIR>      Téléchargements
    ...


* * *

### Changer le dossier courant

Et si on allait voir dans notre dossier Bureau?

    $ cd Bureau


Windows:

    > cd Bureau


Vérifions que ça a bien changé:

    $ pwd
    /Users/olasitarska/Bureau


Windows:

    > cd
    C:\Users\olasitarska\Bureau


Et voilà!

> Pro tip: si vous tapez `cd B` puis que vous appuyez sur la touche `tab`, la ligne de commande va automatiquement compléter le reste du nom, pour vous permettre d'aller plus vite. Si plusieurs dossiers commencent par un "B", appuyez sur `tab` deux fois pour avoir une liste des options.

* * *

### Créer un dossier

Et si on créait un dossier Django Girls sur votre bureau? Vous pouvez faire comme ça:

    $ mkdir djangogirls


Windows:

    > mkdir djangogirls


Cette petite commande crée un dossier nommé `djangogirls` sur votre bureau. Vous pouvez vérifier qu'il est bien là en regardant votre bureau, ou en lançant la commande `ls` ou `dir`! Essayez donc :)

> Pro tip: Si vous voulez éviter de taper les mêmes commandes plein de fois, essayer d'appuyer sur les touches `flèche haut` et `flèche bas` pour retrouver les dernières commandes que vous avez tapé.

* * *

### Un peu d'exercice!

Petit défi pour vous: dans votre nouveau dossier `djangogirls`, créez un dossier appelé `test`. Pour ça, utilisez les commands `cd` et `mkdir`.

#### Solutions:

    $ cd djangogirls
    $ mkdir test
    $ ls
    test


Windows:

    > cd djangogirls
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test


Félicitation! :)

* * *

### Nettoyage

Supprimons tout ce qu'on vient de faire, histoire d'éviter de laisser du bazar.

D'abord, revenons au Bureau:

    $ cd ..


Windows:

    > cd ..


Faire un `cd` vers `..` permet de changer le dossier courant vers le dossier parent (c'est à dire le dossier qui contient le dossier courant).

Vérifiez où vous êtes:

    $ pwd
    /Users/olasitarska/Bureau


Windows:

    > cd
    C:\Users\olasitarska\Bureau


Maintenant, supprimons le dossier `djangogirls`.

> **Attention**: Supprimer des fichiers avec `del`, `rmdir` ou `rm` est irrévocable, ce qui veut dire que *les fichiers supprimés sont perdus à jamais*! Du coup, faites très attention avec cette commande.

    $ rm -r djangogirls


Windows:

    > rmdir /S djangogirls
    djangogirls, Are you sure <Y/N>? Y


Et voilà. Pour être sûrs que le dossier a bien été supprimé, vérifions:

    $ ls


Windows:

    > dir


### Sortir

C'est tout pour le moment! Vous pouvez fermer maintenant fermer la ligne de commande. Faisons-le à la manière des bidouilleurs⋅euses. :)

    $ exit


Windows:

    > exit


Cool, non? :)

## Résumé

Voici un résumé de quelques commandes utiles:

| Commande (Windows) | Commande (Mac OS / Linux) | Description                 | Exemple                                           |
| ------------------ | ------------------------- | --------------------------- | ------------------------------------------------- |
| exit               | exit                      | ferme la fenêtre            | **exit**                                          |
| cd                 | cd                        | change le dossier courant   | **cd test**                                       |
| dir                | ls                        | liste des fichiers/dossiers | **dir**                                           |
| copy               | cp                        | copie un fichier            | **copy c:\test\test.txt c:\windows\test.txt** |
| move               | mv                        | déplace un fichier          | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir              | mkdir                     | crée un nouveau dossier     | **mkdir testdirectory**                           |
| del                | rm                        | supprime un dossier/fichier | **del c:\test\test.txt**                        |

Ce ne sont que quelques-unes des commandes que vous pouvez utiliser en ligne de commande, mais on aura pas besoin de plus aujourd'hui.

Si vous êtes curieux⋅se, [ss64.com][1] contient une référence complète de toutes les commandes pour tous les systèmes d'exploitation.

 [1]: http://ss64.com

## Vous êtes prêt·e·s?

Nous allons plonger dans Python!
