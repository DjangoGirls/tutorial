Vous pouvez [passer cette section](http://tutorial.djangogirls.org/en/installation/#install-python) si vous n'utilisez pas un Chromebook. Sinon, votre installation sera un peu différente. Vous pouvez ignorer le reste des instructions d'installation.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud 9 est un outil qui vous propose un éditeur de code et un accès à un ordinateur, fonctionnant sur Internet, sur lequel vous pouvez installer, écrire et exécuter des logiciels. Pour la durée du tutoriel, Cloud IDE agira comme votre *machine locale*. Vous lancerez toujours des commandes dans un terminal exactement comme vos camarades sous OS X, Ubuntu ou Windows, mais votre terminal sera connecté à un ordinateur distant que Cloud IDE aura configuré pour vous. Voici les instructions pour Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Vous pouvez choisir l'un des cloud IDE et suivre les instructions du cloud IDE.

#### PaizaCloud Cloud IDE

1. Allez sur [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Créez un compte
3. Cliquez *Nouveau Serveur*
4. Cliquez sur le bouton Terminal (sur le côté gauche de la fenêtre)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Allez à [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Créez un compte
3. Cliquez *Créer un environnement*

Maintenant, vous devriez voir une interface dotée d'une barre latérale, une grande fenêtre principale contenant du texte, ainsi qu'une petite fenêtre en bas ressemblant plus ou moins à ceci :

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Environnement virtuel

Un environnement virtuel (aussi appelé virtualenv) est comme une boite privée dans laquelle on peut stocker du code relatif au projet sur lequel on travaille. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Si cela ne fonctionne toujours pas, demandez de l'aide à votre coach.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(prenez note du fait que nous utilisons sur la dernière ligne un tilde suivi du signe égal : ~= ).

### GitHub

Créez un compte [GitHub](https://github.com).

### PythonAnywhere

Le tutoriel Django Girls inclut une section sur ce qu'on appelle Déploiement, qui est le procès de prendre le code alimentant votre nouvelle application web pour le déplacer sur un ordinateur accessible au public (appelé un serveur), afin que d'autres personnes puissent voir votre travail.

Cette partie est un peu étrange lorsqu'on fait le tutoriel sur un Chromebook, puisque nous utilisons déjà un ordinateur étant sur internet (par opposition à, disons, un laptop). Cependant, c'est toujours utile, puisque nous pouvons considérer notre espace Cloud 9 comme l'endroit où se trouve notre travail "en cours", et Python Anywhere comme l'endroit où mettre en valeur notre travail au fur et à mesure que nous progressons.

Créez ainsi un nouveau compte Python Anywhere à [www.pythonanywhere.com](https://www.pythonanywhere.com).