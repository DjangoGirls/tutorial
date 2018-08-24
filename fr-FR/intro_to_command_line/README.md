# Introduction à l'interface en ligne de commande

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**Commençons par vous présenter un nouvel ami : la ligne de commande !**

Les étapes suivantes vont vous montrer comment utiliser la fenêtre noire que tous les bidouilleurs·euses utilisent. Elle est un peu effrayante à première vue, mais en fait, c'est un tout simplement un programme qui attend qu'on lui donne des commandes.

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## Qu'est-ce qu'une ligne de commande ?

Cette fenêtre, qu'on appelle aussi **ligne de commande** ou **interface en ligne de commande**, est une application textuelle qui permet de voir et de manipuler des fichiers sur votre ordinateur. It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. On l'appelle parfois aussi : *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Ouvrir l'interface en ligne de commande

Pour commencer à expérimenter, nous avons d'abord besoin d'ouvrir notre interface en ligne de commande.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Prompt

Vous devriez maintenant voir une fenêtre noire ou blanche qui attend vos commandes.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Sur Windows, c'est un signe `>`, comme ça :

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Chaque commande commence par ce signe, puis un espace. Mais vous n'avez pas besoin de le taper, votre ordinateur le fait pour vous. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## Votre première commande (YAY !)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Puis, appuyez sur la touche `entrée`. Voilà ce qui s'affiche chez moi :

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Comme vous pouvez le voir, l'ordinateur vient d'afficher votre nom d'utilisateur. Sympa, non? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Les bases

Les différents systèmes d'exploitation ont des commandes légèrement différentes, donc faites attention à suivre les instructions pour votre système d'exploitation. Allons-y !

### Dossier courant

Ce serait pratique de savoir dans quel répertoire nous nous trouvons. Pour le savoir, tapez la commande suivante et appuyez sur `entrée` :

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Remarque : "pwd" veut dire "print working directory" (afficher le dossier courant).

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

Vous verrez probablement quelque chose de similaire sur votre machine. Quand vous ouvrez une ligne de commande, vous démarrez habituellement dans le dossier personnel de votre utilisateur.

* * *

### Lister les fichiers et les dossiers

Du coup, que pouvons-nous trouver dans ce dossier personnel ? Pour le savoir, essayons ceci :

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
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### Changer le dossier courant

Maintenant, essayons d'aller sur notre bureau :

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Bureau
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Bureau
    

<!--endsec-->

Vérifions que ça a bien changé :

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

Et voilà !

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Créer un dossier

Que diriez-vous de créer un répertoire dédié aux exercices sur votre bureau ? Vous pouvez le faire de cette façon :

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir exercices
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir exercices
    

<!--endsec-->

Cette petite commande crée un dossier nommé `exercices` sur votre bureau. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Essayez donc. :)

> Pro tip : Si vous voulez éviter de taper les mêmes commandes plein de fois, essayez d'appuyer sur les touches `flèche haut` et `flèche bas` pour retrouver les dernières commandes que vous avez tapé.

* * *

### Un peu d'exercice !

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

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

Félicitations ! :)

* * *

### Nettoyage

Supprimons tout ce qu'on vient de faire, histoire d'éviter de laisser du bazar.

D'abord, revenons au Bureau :

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Vérifiez où vous êtes :

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

Maintenant, il est temps de supprimer notre dossier `exercices` :

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r exercices
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S exercices
    exercices, Are you sure <Y/N>? Y
    

<!--endsec-->

Et voilà. Pour être sure que le dossier a bien été supprimé, vérifiez :

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Sortir

C'est tout pour le moment ! Vous pouvez maintenant fermer la ligne de commande. Faisons-le à la manière des bidouilleurs⋅euses? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, non? :)

## Résumé

Voici un résumé de quelques commandes utiles :

| Commande (Windows) | Commande (Mac OS / Linux) | Description                 | Exemple                                           |
| ------------------ | ------------------------- | --------------------------- | ------------------------------------------------- |
| sortir             | sortir                    | ferme la fenêtre            | **sortir**                                        |
| cd                 | cd                        | change le dossier courant   | **cd test**                                       |
| cd                 | pwd                       | show the current directory  | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir                | ls                        | liste des fichiers/dossiers | **dir**                                           |
| copy               | cp                        | copie un fichier            | **copy c:\test\test.txt c:\windows\test.txt** |
| move               | mv                        | déplace un fichier          | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir              | mkdir                     | crée un nouveau dossier     | **mkdir testdirectory**                           |
| rmdir (or del)     | rm                        | delete a file               | **del c:\test\test.txt**                        |
| rmdir /S           | rm -r                     | delete a directory          | **rm -r testdirectory**                           |

Ce ne sont que quelques-unes des commandes que vous pouvez utiliser dans votre ligne de commande. Cette liste est suffisante pour réaliser ce tutoriel.

Si vous êtes curieuse, [ss64.com](http://ss64.com) contient une référence complète de toutes les commandes pour tous les systèmes d'exploitation.

## Vous êtes prête ?

Nous allons plonger dans Python !