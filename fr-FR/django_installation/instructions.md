> Note : ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Ce chapitre est en partie inspiré du [tutoriel django-marcador](http://django-marcador.keimlink.de/) qui est sous licence Creative Commons Attribution-ShareAlike 4.0 International License. Le tutoriel django-marcador a été créé par Markus Zapke-Gründemann et al.

## L'environnement virtuel

Avant d'installer Django, nous allons vous faire installer un outil extrêmement utile qui vous aidera à maintenir votre environnement de développement propre. Nous vous recommandons fortement de ne pas sauter cette étape, même si elle n'est pas indispensable. En commençant avec la meilleure configuration possible vous éviterez beaucoup de problèmes par la suite !

Donc, commençons par créer un **environnement virtuel de programmation** (ou *virtualenv*). Chaque projet aura sa propre configuration en Python/Django grâce à virtualenv. Ce qui veut dire que si vous modifiez un site web, ça n'affectera pas les autres sites sur lesquels vous travaillez. Plutôt cool, non ?

Tout ce dont vous avez besoin, c'est de trouver un dossier où vous voulez créer votre `virtualenv` ; vous pouvez choisir votre répertoire "home" par exemple. Sous Windows, le home ressemble à `C:\Utilisateurs\Nom` (où `Nom` est votre login).

> **Note:** Sur Windows, assurez-vous que le chemin vers ce répertoire ne contienne pas d'accents ou autres caractères spéciaux; si c'est la cas, utilisez un répertoire différent, par exemple `C:\djangogirls`.

Dans ce tutoriel, nous allons utiliser un nouveau dossier `djangogirls` que vous allez créer dans votre dossier home :

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

Nous allons créer un virtualenv appelé `myvenv`. Pour cela, nous taperons une commande qui ressemblera à :

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Pour créer un nouveau `virtualenv`, vous devez ouvrir un terminal et exécuter `python -m venv myvenv`. Voici ce à quoi ça devrait ressembler:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Où `myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir un autre nom mais attention : il doit être en minuscules, sans espaces et sans accents ou caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Pour créer un `virtualenv` sous Linux ou OS X, tapez simplement la commande `python3 -m venv myvenv`. Ça ressemblera à ça :

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` est le nom de votre `virtualenv`. Vous pouvez choisir un autre nom, mais veillez à n'utiliser que des minuscules et à n'insérer ni espaces, ni caractères spéciaux. C'est aussi une bonne idée de choisir un nom plutôt court, car vous aller souvent l'utiliser!

> **Note:** sur certaines versions de Debian/Ubuntu vous pouvez avoir l'erreur suivante:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Dans ce cas, suivez les instructions ci-dessus et installez le paquet `python9-venv`: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
>     
> 
> **Note:** Sur certaines version de Debian/Ubuntu, initialiser l’environnement virtuel de cette façon donne l'erreur suivante:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Pour résoudre ce problème, utilisez plutôt la commande `virtualenv`.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **Note:** Si vous avez une erreur telle que :
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> alors exécutez plutôt :
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Travailler avec virtualenv

Les commandes listées ci-dessus permettent de créer un dossier appelé `myvenv` (ou le nom que vous avez choisi) qui contient notre environnement virtuel. Pour faire simple, c'est un dossier composé lui-même d'autres dossiers et de fichiers.

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Démarrez votre environnement virtuel en exécutant :

{% filename %}command-line{% endfilename %}

    C:\Utilisateurs\Nom\djangogirls> myvenv\Scripts\activate
    

> **Note:** sur Windows 10 vous pouvez avoir une erreur dans le PowerShell de Windows disant `execution of scripts is disabled on this system`. Dans ce cas ouvrez une autre console Windows PowerShell avec l'option "ouvrir en tant qu'administrateur". Puis essayer d'exécuter la commande suivante avant de démarrer votre environnement virtuel :
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Start your virtual environment by running:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

Remember to replace `myvenv` with your chosen `virtualenv` name!

> **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installation de Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installer des paquets avec un fichier "requirements"

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!