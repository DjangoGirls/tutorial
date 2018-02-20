Vous pouvez [passer cette section](http://tutorial.djangogirls.org/en/installation/#install-python) si vous n'utilisez pas un Chromebook. Si c'est le cas, votre expérience sera un peu différente. Vous pouvez ignorer le reste des instructions d'installation.

### Cloud 9

Cloud 9 est un outil qui vous donne un éditeur de code et un accès à un ordinateur, fonctionnant sur Internet, sur lequel vous pouvez installer, écrire et exécuter des logiciels. Pour la durée du tutoriel, Cloud 9 agira comme votre *machine locale*. Vous lancerez toujours des commandes dans un terminal exactement comme vos camarades sous OS X, Ubuntu ou Windows, mais votre terminal sera connecté à un ordinateur autre part que Cloud 9 a configuré pour vous.

1. Installez Cloud 9 depuis le [Chrome Web Store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Allez à [c9.io](https://c9.io)
3. Créez un compte
4. Cliquer sur *Créer un espace de travail*
5. Appelez-le *django-girls*
6. Select the *Blank* (second from the right on the bottom row with orange logo)

Maintenant, vous pouvez voir une interface avec une barre latérale, une grande fenêtre principale avec certains texte, et d'une petite fenêtre en bas qui ressemble à quelque chose comme ceci:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Environnement virtuel

Un environnement virtuel (également appelé un virtualenv) est comme un privé de la boîte, nous pouvons des trucs utiles code informatique dans un projet que nous travaillons. Nous les utilisons pour gardez les différents morceaux de code que nous voulons pour nos différents projets distincts pour les choses ne se mélangent entre les projets.

Dans votre terminal, au bas de la Cloud 9 interface, exécutez la commande suivante:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Si cela ne fonctionne toujours pas, demandez à votre entraîneur de l'aide.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### Github

Créez un compte [Github](https://github.com).

### PythonAnywhere

Le Django Filles didacticiel comprend une section sur ce qui est appelé le Déploiement, qui est le processus de la prise du code que les pouvoirs de votre application web et de le déplacer vers un ordinateur public (appelé serveur) afin que les autres les gens peuvent voir votre travail.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).