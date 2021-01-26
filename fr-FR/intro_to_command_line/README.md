# Introduction à l'interface en ligne de commande

> Pour les lectrices à la maison : ce chapitre est traité dans la vidéo [Votre nouvel ami : la ligne de commande](https://www.youtube.com/watch?v=jvZLWhkzX-8).

C'est un peu exaltant, non ? Dans quelques instants, vous allez écrire votre première ligne de code! :)

**Commençons par vous présenter un nouvel ami : la ligne de commande !**

Les étapes suivantes vont vous montrer comment utiliser la fenêtre noire que tous les bidouilleurs·euses utilisent. Elle est un peu effrayante à première vue, mais en fait, c'est tout simplement un programme qui attend qu'on lui donne des commandes.

> **Note :** Il existe deux mots pour parler de dossier : dossier ou répertoire. Il se peut que nous utilisions les deux dans le tutoriel mais, pas de panique : ils signifient la même chose.

## Qu'est-ce qu'une ligne de commande ?

Cette fenêtre, qu'on appelle aussi **ligne de commande** ou **interface en ligne de commande**, est une application textuelle qui permet de voir et de manipuler des fichiers sur votre ordinateur. C'est un peu la même chose que l'Explorateur Windows ou Finder dans Mac, mais sans interface graphique. On l'appelle parfois aussi : *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Ouvrir l'interface en ligne de commande

Pour commencer à expérimenter, nous avons d'abord besoin d'ouvrir notre interface en ligne de commande.

{% include "/intro_to_command_line/open_instructions.md" %}

## Invite de commande

Vous devriez maintenant voir une fenêtre noire ou blanche qui attend vos commandes.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Si vous êtes sous Mac ou Linux, vous verrez probablement un `$`, comme ça :

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Si vous êtes sous Windows, vous verrez probablement un `>`, comme ça :

{% filename %}command-line{% endfilename %}

    >
    

Jetez un coup d'œil à la section Linux ci-dessus : c'est à cela que la ligne de commande ressemblera une fois que vous serez sur PythonAnywhere.

<!--endsec-->

Chaque commande que vous taperez sera automatiquement précédée par un `$` ou `>` et une espace. Vous ne devez pas les rentrer vous-même, votre ordinateur le fera pour vous. :)

> Petite remarque : il se peut que vous voyiez quelque chose comme `C:\Users\ola>` ou `Olas-MacBookAir:~ola$` avant le signe de prompt. Pas de problème : c'est parfaitement normal.

La partie jusque et y compris le `$` ou le `>` est appelée *l’invite de commande*, ou *prompt* (en anglais) pour faire court. Elle vous invite à entrer une commande.

Dans le tutoriel, lorsque nous voulons que vous tapiez une commande, nous allons inclure le `$` ou `>` et parfois d'autres information juste avant, à sa gauche. Ignorez cette partie à gauche et tapez uniquement la commande, qui commence après l’invite.

## Votre première commande (YAY !)

Commençons en tapant cette commande :

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Puis appuyez sur la touche `entrée`. Voilà ce qui s'affiche chez moi :

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Comme vous pouvez le voir, l'ordinateur vient d'afficher votre nom d'utilisateur. Sympa, non ? ;)

> Essayez de taper chaque commande sans copier-coller. Ça aide à les retenir !

## Les bases

Les différents systèmes d'exploitation ont des commandes légèrement différentes, donc faites attention à suivre les instructions pour votre système d'exploitation. Allons-y !

### Dossier courant

Ce serait pratique de savoir dans quel répertoire nous nous trouvons. Pour le savoir, tapez la commande suivante et appuyez sur `entrée` :

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Remarque : « pwd » veut dire « print working directory » (afficher le dossier courant).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With PowerShell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Vous verrez probablement quelque chose de similaire sur votre machine. Quand vous ouvrez une ligne de commande, vous démarrez habituellement dans le dossier personnel de votre utilisateur.

* * *

### En savoir plus sur une commande

De nombreuses commandes que vous pouvez taper à l’invite de commande ont une aide intégrée que vous pouvez afficher et lire ! Par exemple, pour en savoir plus sur le répertoire actuel :

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

macOS et Linux ont une commande `man`, qui donne des informations sur les commandes. Essayez `man pwd` et regardez ce qui s'affiche, ou ajoutez `man` devant une autre commande pour voir sa documentation. La sortie de `man` est normalement paginée. Utilisez la barre d’espace pour passer à la page suivante et `q` pour quitter l’aide.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

Ajouter un `/ ?` à la fin de la commande devrait également permettre d'afficher la page d’aide. Vous devrez peut-être faire défiler votre fenêtre de commande vers le haut pour tout voir. Essayez `cd / ?`.

<!--endsec-->

### Lister les fichiers et les dossiers

Du coup, que pouvons-nous trouver dans ce dossier personnel ? Voyons voir :

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Bureau
    Musique
    Téléchargements
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Bureau
    05/08/2014 07:28 PM <DIR>      Musique
    05/08/2014 07:28 PM <DIR>      Téléchargements
    ...
    

> Note: In PowerShell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Changer le dossier courant

Maintenant, essayons d'aller sur notre Bureau :

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Bureau
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Bureau
    

Notez que le nom du répertoire « Bureau » pourrait être traduit dans la langue de votre compte Linux. Si c'est le cas, vous devrez remplacer `Bureau` par sa traduction. Par exemple, `Schreibtisch` pour l’allemand ou <0>Desktop</0> pour l'anglais.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Bureau
    

<!--endsec-->

Vérifions que ça a bien changé :

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Bureau
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Bureau
    

<!--endsec-->

Et voilà !

> Pro tip : si vous tapez `cd B` puis que vous appuyez sur la touche `tabulation`, la ligne de commande va automatiquement compléter le reste du nom. Cela va vous permettre d'aller plus vite et d'éviter des fautes de frappe. Si plusieurs dossiers commencent par un « B », appuyez sur la touche `tabulation` deux fois pour avoir une liste des options.

* * *

### Créer un dossier

Que diriez-vous de créer un répertoire dédié aux exercices sur votre bureau ? Vous pouvez le faire de cette façon :

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir exercices
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir exercices
    

<!--endsec-->

Cette petite commande crée un dossier nommé `exercices` sur votre bureau. Vous pouvez vérifier qu'il est bien là en regardant votre Bureau, ou en lançant la commande `ls` ou `dir` ! Essayez donc. :)

> Pro tip : Si vous voulez éviter de taper les mêmes commandes plein de fois, essayez d'appuyer sur les touches `flèche haut` et `flèche bas` pour retrouver les dernières commandes que vous avez tapées.

* * *

### Exercice !

Un petit défi pour vous : dans votre nouveau dossier `exercices`, créez un dossier appelé `test`. (Pour ça, utilisez les commandes `cd` et `mkdir`.)

#### Solutions :

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd exercices
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd exercices
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Félicitations ! :)

* * *

### Nettoyage

Supprimons tout ce qu'on vient de faire, histoire d'éviter de laisser du bazar.

D'abord, revenons au Bureau :

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Grâce à `...` et la commande `cd`, vous pouvez aller directement dans le dossier parent de votre répertoire courant (c'est-à-dire le dossier qui contient le dossier dans lequel vous étiez).

Vérifiez où vous êtes :

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Bureau
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Bureau
    

<!--endsec-->

Maintenant, il est temps de supprimer le dossier `exercices` :

> **Attention** : Supprimer des fichiers avec `del`, `rmdir` ou `rm` est irrévocable, ce qui veut dire que *les fichiers supprimés sont perdus à jamais* ! Du coup, faites très attention avec cette commande.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r exercices
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S exercices
    exercices, Are you sure <Y/N>? Y
    

<!--endsec-->

Et voilà ! Pour être sure que le dossier a bien été supprimé, vérifions :

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Sortir

C'est tout pour le moment ! Vous pouvez maintenant fermer la ligne de commande. Faisons-le à la manière des bidouilleurs⋅euses, d’accord ? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, non ? :)

## Résumé

Voici un résumé de quelques commandes utiles :

| Commande (Windows) | Commande (macOS / Linux) | Description                      | Exemple                                           |
| ------------------ | ------------------------ | -------------------------------- | ------------------------------------------------- |
| exit               | exit                     | ferme la fenêtre                 | **exit**                                          |
| cd                 | cd                       | change le dossier courant        | **cd test**                                       |
| cd                 | pwd                      | montre le dossier courant        | **cd** (Windows) ou **pwd** (macOS / Linux)       |
| dir                | ls                       | liste des fichiers/dossiers      | **dir**                                           |
| copy               | cp                       | copie un fichier                 | **copy c:\test\test.txt c:\windows\test.txt** |
| move               | mv                       | déplace un fichier               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir              | mkdir                    | crée un nouveau dossier          | **mkdir testdirectory**                           |
| rmdir (or del)     | rm                       | supprime un fichier              | **del c:\test\test.txt**                        |
| rmdir /S           | rm -r                    | supprime un répertoire           | **rm -r testdirectory**                           |
| [CMD] /?           | man [CMD]                | affiche l'aide pour une commande | **cd /?** (Windows) ou **man cd** (macOS / Linux) |

Ce ne sont que quelques-unes des commandes que vous pouvez utiliser dans votre ligne de commande. Cette liste est suffisante pour réaliser ce tutoriel.

Si vous êtes curieuse, [ss64.com](http://ss64.com) contient une référence complète de toutes les commandes pour tous les systèmes d'exploitation.

## Vous êtes prête ?

Plongeons dans Python !