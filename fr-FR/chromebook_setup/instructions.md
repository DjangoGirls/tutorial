Vous pouvez [passer cette section](http://tutorial.djangogirls.org/en/installation/#install-python) si vous n'utilisez pas un Chromebook. Sinon, votre installation sera un peu différente. Vous pouvez ignorer le reste des instructions d'installation.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud 9 est un outil qui vous propose un éditeur de code et un accès à un ordinateur, fonctionnant sur Internet, sur lequel vous pouvez installer, écrire et exécuter des logiciels. Pour la durée du tutoriel, Cloud IDE agira comme votre *machine locale*. Vous lancerez toujours des commandes dans un terminal exactement comme vos camarades sous macOS, Ubuntu ou Windows, mais votre terminal sera connecté à un ordinateur distant que Cloud IDE aura configuré pour vous. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Vous pouvez choisir l'un des cloud IDE et suivre les instructions du cloud IDE.

#### PaizaCloud Cloud IDE

1. Allez sur [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Créez un compte
3. Cliquez sur *Nouveau Serveur* et choisissez l'application Django
4. Cliquez sur le bouton Terminal (sur le côté gauche de la fenêtre)

Maintenant vous devriez voir une interface avec une barre latérale et des boutons à gauche. Cliquez sur le bouton « Terminal » pour ouvrir la fenêtre de terminal. Vous devriez voir le résultat suivant :

{% filename %}Terminal{% endfilename %}

    $
    

Le terminal de PaizaCloud Cloud IDE attend vos instructions. Vous pouvez redimensionner ou maximiser la fenêtre pour la rendre un peu plus grand.

#### AWS Cloud9

Cloud 9 requiert actuellement que vous vous connectiez avec AWS et que vous renseigniez votre carte de crédit.

1. Installez Cloud 9 depuis le [Chrome Web Store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Allez à [c9.io](https://c9.io) et cliquez sur *Mise en route avec AWS Cloud9*
3. Créez un compte AWS (requiert votre carte de crédit, mais il existe un forfait gratuit)
4. Dans le tableau de bord AWS, entrez *Cloud9* dans la barre de recherche et cliquez dessus
5. Dans le tableau de bord Cloud 9, cliquez sur *Créer un environnement*
6. Appelez-le *django-girls*
7. Lors de la configuration des paramètres, sélectionnez *Créer une nouvelle instance pour l'environnement (EC2)* pour "Type d'environnement" et le "Type d'instance" *t2.micro* (il devrait être indiqué comme disponible gratuitement). Le paramètre d'économie par défaut suffira. Vous pouvez garder les autres paramètres par défaut.
8. Cliquez sur *Étape suivante*
9. Cliquez sur *Créer un environnement*

Maintenant, vous pouvez voir une interface avec une barre latérale, une grande fenêtre principale avec du texte et une petite fenêtre en bas qui ressemble à quelque chose comme ceci:

{% filename %}bash{% endfilename %}

    nomutilisateur:~/workspace $
    

Cette fenêtre en bas est votre terminal. Vous pouvez l'utiliser pour donner des instructions à l'ordinateur Cloud9. Vous pouvez changer la taille de la fenêtre et l'agrandir un peu.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
3. Click *New Project* and choose *hello-webpage*
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Environnement virtuel

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).