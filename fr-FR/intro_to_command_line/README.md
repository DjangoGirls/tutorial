# Introduction à l'interface en ligne de commande

> Pour les lectrices à la maison : ce chapitre est traité dans la vidéo [Votre nouvel ami : la ligne de commande](https://www.youtube.com/watch?v=jvZLWhkzX-8).

C'est un peu exaltant, non ? Dans quelques instants, vous allez écrire votre première ligne de code! :)

**Commençons par vous présenter un nouvel ami : la ligne de commande !**

Les étapes suivantes vont vous montrer comment utiliser la fenêtre noire que tous les bidouilleurs·euses utilisent. Elle est un peu effrayante à première vue, mais en fait, c'est tout simplement un programme qui attend qu'on lui donne des commandes.

> **Note :** Il existe deux mots pour parler de dossier : dossier ou répertoire. Il se peut que nous utilisions les deux dans le tutoriel mais, pas de panique : ils signifient la même chose.

## Qu'est-ce qu'une ligne de commande ?

Cette fenêtre, qu'on appelle aussi **ligne de commande** ou **interface en ligne de commande**, est une application textuelle qui permet de voir et de manipuler des fichiers sur votre ordinateur. C'est un peu la même chose que l'Explorateur Windows ou Finder dans Mac, mais sans interface graphique. On l'appelle parfois aussi : *cmd*, *CLI*, *prompt*, *console* ou *terminal*.

## Ouvrir l'interface en ligne de commande

Pour commencer, il faut d’abord ouvrir notre interface en ligne de commande. {% include "/ intro_to_command_line/open_instructions.md" %}

## Prompt

Vous devriez maintenant voir une fenêtre noire ou blanche qui attend vos commandes.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Si vous êtes sous Mac ou Linux, vous verrez probablement un `$`, comme ça :

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Si vous êtes sous Windows, vous verrez probablement un `>`, comme ça :

{% filename %}command-line{% endfilename %}

    >
    

Donnez un coup d'oeil à la section Linux ci-dessus : c'est à cela que la ligne de commande ressemblera une fois que vous serez sur PythonAnywhere.

<!--endsec-->

Chaque commande que vous taperez sera automatiquement précédée par un `$` ou `>` et un espace. Vous ne devez pas les rentrer vous même, votre ordinateur le fera pour vous :-)

> Petite remarque : il se peut que vous voyiez quelque chose comme `C:\Users\ola>` ou `Olas-MacBookAir:~ola$` avant le signe de prompt. Pas de problème : c'est parfaitement normal.

La partie jusques et y compris le `$` ou le `>` est appelée *l’invite de commande*, ou *prompt* pour faire court. Elle vous invite à entrer une commande.

Dans le tutoriel, lorsque nous voulons que vous tapiez une commande, nous allons inclure le `$` ou `>` et parfois d'autres information juste avant, à sa gauche. Ignorez cette partie à gauche et tapez uniquement la commande, qui commence après l’invite.

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

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Les bases

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Dossier courant

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Note: 'pwd' stands for 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

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

### Change current directory

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Bureau
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

Note that the directory name "Desktop" might be translated to the language of your Linux account. If that's the case, you'll need to replace `Desktop` with the translated name; for example, `Schreibtisch` for German.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Check if it's really changed:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Here it is!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### Create directory

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> PRO tip: If you don't want to type the same commands over and over, try pressing the `up arrow` and `down arrow` on your keyboard to cycle through recently used commands.

* * *

### Exercice !

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### Solutions :

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Congrats! :)

* * *

### Clean up

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Now time to delete the `practice` directory:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## Résumé

Here is a summary of some useful commands:

| Commande (Windows) | Commande (Mac OS / Linux) | Description                 | Exemple                                            |
| ------------------ | ------------------------- | --------------------------- | -------------------------------------------------- |
| sortir             | sortir                    | ferme la fenêtre            | **sortir**                                         |
| cd                 | cd                        | change le dossier courant   | **cd test**                                        |
| cd                 | pwd                       | show the current directory  | **cd** (Windows) or **pwd** (Mac OS / Linux)       |
| dir                | ls                        | liste des fichiers/dossiers | **dir**                                            |
| copy               | cp                        | copie un fichier            | **copy c:\test\test.txt c:\windows\test.txt**  |
| move               | mv                        | déplace un fichier          | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir              | mkdir                     | crée un nouveau dossier     | **mkdir testdirectory**                            |
| rmdir (or del)     | rm                        | delete a file               | **del c:\test\test.txt**                         |
| rmdir /S           | rm -r                     | delete a directory          | **rm -r testdirectory**                            |
| [CMD] /?           | man [CMD]                 | get help for a command      | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Vous êtes prête ?

Let's dive into Python!