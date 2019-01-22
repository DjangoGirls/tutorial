Vous pouvez [passer cette section](http://tutorial.djangogirls.org/en/installation/#install-python) si vous n'utilisez pas un Chromebook. Sinon, votre installation sera un peu différente. Vous pouvez ignorer le reste des instructions d'installation.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 est un outil qui vous propose un éditeur de code et un accès à un ordinateur, fonctionnant sur Internet, sur lequel vous pouvez installer, écrire et exécuter des logiciels. Pour la durée du tutoriel, Cloud IDE agira comme votre *machine locale*. Vous lancerez toujours des commandes dans un terminal exactement comme vos camarades sous OS X, Ubuntu ou Windows, mais votre terminal sera connecté à un ordinateur distant que Cloud IDE aura configuré pour vous. Voici les instructions pour Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Vous pouvez choisir l'un des cloud IDE et suivre les instructions du cloud IDE.

#### PaizaCloud Cloud IDE

1. Allez sur [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Créez un compte
3. Cliquez *Nouveau Serveur*
4. Cliquez sur le bouton Terminal (sur le côté gauche de la fenêtre)

Maintenant vous devriez voir une interface avec une barre latérale et des boutons à gauche. Cliquez sur le bouton « Terminal » pour ouvrir la fenêtre de terminal. Vous devriez voir le résultat suivant :

{% filename %}Terminal{% endfilename %}

    $
    

Le terminal de PaizaCloud Cloud IDE attend vos instructions. Vous pouvez redimensionner ou maximiser la fenêtre pour la rendre un peu plus grand.

#### AWS Cloud9

1. Allez sur [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Créez un compte
3. Cliquez *Créer un environnement*

Maintenant, vous devriez voir une interface dotée d'une barre latérale, une grande fenêtre principale contenant du texte, ainsi qu'une petite fenêtre en bas ressemblant plus ou moins à ceci :

{% filename %}bash{% endfilename %}

    nomutilisateur:~/workspace $
    

Cette fenêtre en bas est votre terminal. Vous pouvez l'utiliser pour donner des instructions à l'ordinateur Cloud9. Vous pouvez changer la taille de la fenêtre et l'agrandir un peu.

### Environnement virtuel

Un environnement virtuel (aussi appelé virtualenv) est comme une boite privée dans laquelle on peut stocker du code relatif au projet sur lequel on travaille. Nous les utilisons pour garder distinctement les différents morceaux de code dont nous avons besoin pour nos différents projets, afin d'éviter tout mélange.

Dans votre terminal, au bas de l'interface Cloud 9, exécutez la commande suivante:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Si cela ne fonctionne toujours pas, demandez de l'aide à votre coach.

Ensuite, lancez :

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Créez un compte [GitHub](https://github.com).

### PythonAnywhere

Le tutoriel Django Girls inclut une section sur ce qu'on appelle Déploiement, qui est le procès de prendre le code alimentant votre nouvelle application web pour le déplacer sur un ordinateur accessible au public (appelé un serveur), afin que d'autres personnes puissent voir votre travail.

Cette partie est un peu étrange lorsqu'on fait le tutoriel sur un Chromebook, puisque nous utilisons déjà un ordinateur étant sur internet (par opposition à, disons, un laptop). Cependant, c'est toujours utile, puisque nous pouvons considérer notre espace Cloud 9 comme l'endroit où se trouve notre travail "en cours", et Python Anywhere comme l'endroit où mettre en valeur notre travail au fur et à mesure que nous progressons.

Créez ainsi un nouveau compte Python Anywhere à [www.pythonanywhere.com](https://www.pythonanywhere.com).