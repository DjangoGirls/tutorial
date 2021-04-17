Vous pouvez [passer cette section](http://tutorial.djangogirls.org/en/installation/#install-python) si vous n'utilisez pas un Chromebook. Sinon, votre installation sera un peu différente. Vous pouvez ignorer le reste des instructions d'installation.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud 9 est un outil qui vous propose un éditeur de code et un accès à un ordinateur, fonctionnant sur Internet, sur lequel vous pouvez installer, écrire et exécuter des logiciels. Pour la durée du tutoriel, Cloud IDE agira comme votre *machine locale*. Vous lancerez toujours des commandes dans un terminal exactement comme vos camarades sous macOS, Ubuntu ou Windows, mais votre terminal sera connecté à un ordinateur distant que Cloud IDE aura configuré pour vous. Voici les instructions pour Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Vous pouvez choisir l'un des cloud IDE et suivre les instructions du cloud IDE.

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

1. Rendez-vous sur [Glitch.com](https://glitch.com/)
2. Créez un compte (https://glitch.com/signup) ou utilisez votre compte GitHub si vous en avez un. (Voir les instructions GitHub ci-dessous.)
3. Cliquez sur *New Project* et choisissez *hello-webpage*
4. Cliquez sur la liste déroulante Outils (en bas à gauche de la fenêtre), puis sur le bouton Terminal pour ouvrir l'onglet terminal qui contiendra une invite comme celle-ci :

{% filename %}Terminal{% endfilename %}

    app@nom-de-votre-projet-glitch:~
    

Lorsque vous utilisez Glitch.com comme environnement de développement Cloud (IDE), vous n'avez pas besoin de créer un environnement virtuel. À la place, créez manuellement les fichiers suivants :

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

Une fois ces fichiers créés, allez dans le Terminal et exécutez les commandes suivantes pour créer votre premier projet Django :

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

Afin de voir les messages d'erreur détaillés, vous pouvez activer les journaux de débogage Django pour votre application Glitch. Ajoutez simplement ce qui suit à la fin du fichier `mysite/settings.py`.

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

Cela va créer un fichier `debug.log` détaillant les opérations Django et tous les messages d'erreur qui pourraient apparaître, ce qui rendra la correction beaucoup plus facile si votre site Web ne fonctionne pas.

Le redémarrage initial du projet Glitch devrait échouer. (Si vous cliquez sur le bouton en haut de la liste déroulante `Show` puis cliquez sur `In a New Window`, vous recevrez un message d'erreur `DisallowedHost` .) Ne vous inquiétez pas à ce stade, le tutoriel corrigera cela dès que vous aurez mis à jour les paramètres Django de votre projet dans le fichier `mysite/settings.py` .

### Environnement virtuel

Un environnement virtuel (également appelé un virtualenv) est comme une boîte noire dans laquelle nous pouvons insérer du code informatique utile à un projet sur lequel nous travaillons. Nous les utilisons pour conserver séparément les différents morceaux de code que nous voulons dans nos différents projets afin que les choses ne se mélangent entre les projets.

Lancer :

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Notez que sur la dernière ligne, nous utilisons un tilde suivi d'un signe égal : `~=`).

### GitHub

Créez un compte [GitHub](https://github.com).

### PythonAnywhere

Le tutoriel Django Girls comprend une section sur ce qui est appelé le Déploiement, un processus qui permet de déplacer le code de votre application web vers un ordinateur public (appelé serveur) pour que d'autres personnes puissent voir votre travail.

Cette partie est un peu étrange quand on fait le tutoriel sur un Chromebook puisque nous utilisons déjà un ordinateur qui est visible sur Internet (par opposition, par exemple, à un ordinateur portable). Cependant, c'est toujours utile, car nous devons penser à notre espace de travail Cloud 9 comme un endroit pour notre travail "en cours" et Python Anywhere comme un endroit pour publier notre projet à mesure qu'il devient plus complet.

Donc, inscrivez-vous pour un nouveau compte Python Anywhere sur [www.pythonanywhere.com](https://www.pythonanywhere.com).