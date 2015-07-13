# Introduction à Python

> Note: ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (http://django.carrots.pl/).

Allons écrire du code!

## Le prompt Python

Pour commencer à jouer avec Python, nous avons besoin d'ouvrir une *ligne de commande* sur votre ordinateur. Normalement, vous savez déjà comment le faire -- vous l'avez appris dans le chapitre [Introduction à la ligne de commande][1].

 [1]: /intro_to_command_line/README.html

Dès que vous êtes prêt⋅e, suivez les instructions suivantes.

Nous voulons ouvrir une console Python. Il faut donc taper `python3` et appuyer sur Entrée.

    $ python3
    Python 3.4.2 (...)
    Type "copyright", "credits" or "license" for more information.
    >>>
    

## Votre première commande Python!

Après avoir lancé la commande Python, votre prompt s'est changé en `>>>`. Cela signifie que maintenant, les seules commandes que nous pouvons taper sont dans le langage Python. Vous n'avez pas besoin de taper `>>>` - Python fait ça pour vous.

Quand vous voudrez sortir de la console Python, tapez `exit()` ou utilisez le raccourcit `Ctrl + Z` pour Windows ou `Ctrl + D` pour Mac/Linux. Après ça, vous ne verrez plus le `>>>`.

Mais pour l'instant, nous ne voulons pas sortir de la console Python. Nous voulons en apprendre un peu plus à son sujet. Commençons par essayer quelque chose de simple. Par exemple, essayez de taper un peu de maths, comme `2 + 3` et appuyez sur Entrée.

    >>> 2 + 3
    5
    

Pas mal! Vous voyez comment la réponse est sortie? Python sait faire des maths! Vous pouvez essayer d'autres commandes comme: - `4 * 5` - `5 - 1` - `40 / 2`

Amusez-vous un peu avec ça, et revenez ici après :).

Comme vous pouvez le constater, Python est une très bonne calculette. Si vous vous demandez ce qu'il peut faire d'autre...

## Chaînes de caractères (Strings)

On essaye votre nom? Tapez votre prénom entre guillemets comme ça:

    >>> "Ola"
    'Ola'
    

Vous venez de créer votre première chaîne de caractères! C'est une suite de caractères qui peut être traitée par un ordinateur. Une chaine de caractères doit toujours commencer et terminer par le même caractère. Ça peut être une guillement simple (`'`) ou une guillemet double (`"`). Ces guillements permettent à Python de savoir que tout ce qu'il y a à l'intérieur d'une chaîne de caractères.

On peut assembler des chaînes de caractères comme ça:

    >>> "Salut  " + "Ola"
    'Salut Ola'
    

Vous pouvez aussi multiplier une chaîne de caractères par un nombre:

    >>> "Ola" * 3
    'OlaOlaOla'
    

Si vous avez besoin de mettre une apostrophe dans votre chaîne de caractères, vous avez deux manières.

Vous pouvez utiliser des guillemets doubles:

    >>> "J'aime la mousse au chocolat"
    "J'aime la mousse au chocolat"
    

ou alors échapper l'apostrophe avec un antislash (``):

    >>> 'J\'aime la mousse au chocolat'
    "J'aime la mousse au chocolat"
    

Pas mal, non? Pour voir votre nom en majuscules, tapez juste:

    >>> "Ola".upper()
    'OLA'
    

Vous venez d'utiliser la **fonction** `upper` sur votre string! Une fonction (comme `upper()`) est un ensemble d'instructions que Python va effectuer sur un objet donné (`"Ola"`) quand vous l'appelez.

Si vous voulez savoir combien il y a de lettres dans votre nom, il y a une fonction pour ça!

    >>> len("Ola")
    3
    

Vous vous demandez pourquoi des fois on appelle des fonctions avec un `.` après la chaîne de caractères (comme `"Ola".upper()`) et des fois on appelle d'abord la fonction et on met la chaîne de caractères après, entre parenthèses? Et bien, dans certains cas, les fonctions appartiennent aux objets, comme `upper()`, qui ne peut être effectué que sur des chaînes de caractères. Dans ce cas, on appelle la fonction une **méthode**. D'autres fois, les fonctions n’appartiennent à rien de particulier et peuvent être utilisées sur différents types d'objets (c'est le cas de `len()`). C'est pour ça que nous passons `"Ola"` comme argument à la fonction `len`.

### Résumé

OK, assez parlé de chaînes de caractères. Jusque-là, nous découvert:

*   **le prompt** - taper des commandes (du code) dans le prompt Python donne des réponses dans Python
*   **les nombres et les chaînes de caractères** - dans Python, les nombres sont utilisés pour faire des calculs, et les chaînes de caractères pour manipuler du texte
*   **opérateurs** - comme + et *, ils combinent des valeurs pour en obtenir de nouvelles
*   **les fonctions** - comme upper() et len(), que effectuent des actions sur les objets.

Ce sont les bases de tous les langages de programmation que vous pouvez apprendre. Prêt⋅e pour quelque chose de plus compliqué? Allons-y!

## Les erreurs

Essayons quelque chose de nouveau. Est-ce qu'on peut avoir la longueur d'un nombre de la même manière qu'on peut avoir la longueur de votre nom? Tapez `len(304023)` et appuyez sur Entrée:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

On vient d'avoir notre première erreur! Ça dit que les objets de type "int" (integers, ça veut dire nombre entier) n'ont pas de longueur. Qu'est-ce qu'ont peut faire, du coup? Peut-être qu'on peut écrire notre nombre comme une chaîne de caractères. Les chaînes de caractères ont une taille, non?

    >>> len(str(304023))
    6
    

Ça a marché! On a utilisé la fonction `str` à l'intérieur de la fonction `len`. La fonction `str()` convertit n'importe quoi en chaîne de caractères.

*   La fonction `str` convertit des choses en **chaînes de caractères**
*   La fonction `int` convertit des choses en **entiers**

> Important: on peut convertir des nombres en texte, mais on ne peut pas toujours convertir du texte en nombres. Parce que, bon, ça vaudrait quoi `int('salut')`?

## Variables

Il y a un concept super important en programmation: les variables. Une variable, ce n'est jamais rien qu'un nom pour quelque chose qu'on peut utiliser plus tard. Les programmeurs⋅euses utilisent des variables pour stocker des données, rendre leur code plus lisible, et pour ne pas avoir à se rappeler de ce que sont les choses.

Disons qu'on souhaite créer une variable appelée `name`:

    >>> name = "Ola"
    

Vous voyez? C'est tout bête! C'est simplement: name est égal à Ola.

Vous avez peut-être remarqué que contrairement à tout à l'heure, le programme ne renvoie rien. Du coup, comment faire pour vérifier que la variable existe vraiment? Tapez simplement `name` et appuyez sur Entrée:

    >>> name
    'Ola'
    

Youpi! Votre première variable :)! Vous pouvez toujours changer ce à quoi elle fait référence:

    >>> name = "Sonja"
    >>> name
    'Sonja'
    

Vous pouvez aussi l'utiliser dans des fonctions:

    >>> len(name)
    5
    

Génial, non? Et bien sûr, les variables peuvent être n'importe quoi, y compris des nombres! Essayez ça:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

Mais qu'est-ce qui se passe si on utilise le mauvais nombre? Vous sauriez deviner? Essayons!

    >>> name = "Maria"
    >>> names
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'names' is not defined
    

Une erreur! Comme vous pouvez le voir, Python a différents types d'erreurs, et celle-ci est une **NameError**. Python vous donne cette erreur quand vous essayez d'utiliser une variable qui n'a pas encore été définie. Si vous rencontrez cette erreur par la suite, vérifier dans votre code que vous n'avez pas fait une faute de frappe dans une variable.

Jouez un peu avez ça, et voyez ce que vous arrivez à faire!

## La fonction print

Essayez ça:

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria
    

Quand vous tapez `name`, l'interpréteur Python répond avec la *représentation* de la chaîne de caractères associée à la variable "name", c'est à dire les lettres M-a-r-i-a, entourées par des guillemets simples. Quand vous dites `print(name)`, Python va "imprimer" le contenu de la variable sur l'écran, sans les guillemets, ce qui est plus joli.

Comme on le verra plus tard, `print()` est aussi utile quand on veut afficher des choses depuis l'intérieur de fonctions, ou quand on veut afficher des choses sur plusieurs lignes.

## Les listes

À part les chaînes de caractères et les entiers, Python a tout un tas d'autres types d'objets. On va maintenant vous présenter un type appelé **listes**. Les listes sont exactement ce que vous pensez qu'elles sont: ce sont des objets qui sont des listes d'autres objets :)

Allez-y, créez une liste:

    >>> []
    []
    

Oui, cette liste est vide. Pas très utile, hey? Créons maintenant une liste de numéro de loterie. Nous ne voulons pas nous répéter tout le donc, donc mettons la dans une variable:

    >>> lottery = [3, 42, 12, 19, 30, 59]
    

Voilà, nous avons une liste! Qu'est ce qu'on peut faire avec? Voyons combien de numéros de loterie il y a dans cette liste. Une idée de la fonction pour faire ça? On la connait déjà!

    >>> len(lottery)
    6
    

Hé oui! `len()` peut aussi vous donner le nombre d'objets dans une liste. Pratique, non? Peut-être qu'on peut aussi la trier:

    >>> lottery.sort()
    

Ça ne renvoie rien, ça a juste changé l'ordre dans lequel les nombres apparaissent dans la liste. Affichons-la encore pour voir ce qu'il s'est passé:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]
    

Comme vous pouvez le voir, les nombres de la liste sont maintenant triés sur plus petit au plus grand. Bravo!

Est-ce qu'on peut inverser l'ordre? Faisons ça!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
    

Facile, non? Si vous voulez ajouter quelque chose à la liste, vous pouvez le faire en tapant cette commande:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    

Si vous voulez ne montrer que le premier nombre, vous pouvez le faire en utilisant des **indices**. Un indice est un nombre qui dit où l'élément apparait dans la liste. Les ordinateurs comptent à partir de 0, donc le premier objet de la liste est à l'indice 0, le suivant à l'indice 1, et ainsi de suite. Essayez ça:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
    

Comme vous pouvez le voir, on peut accéder à différents objets dans la liste en utilisant le nom de la liste suivi de l'indice de l'objet entre crochets.

Pour voir, essayez d'autres indices: 6, 7, 1000, -1, -6 ou -1000. Est-ce que vous arrivez à prévoir le résultat avant de taper la commande? Est-ce que les résultats vous paraissent logiques?

Vous pouvez trouver une liste complète des méthodes disponibles pour les listes dans ce chapitre de la documentation de Python: https://docs.python.org/3/tutorial/datastructures.html

## Dictionnaires

Un dictionnaire est un peu comme une liste, mais on accède aux valeurs en utilisant une clef plutôt qu'un indice. Une clef peut être n'importe quelle chaîne de caractère ou n'importe quel nombre. La syntaxe pour définir un dictionnaire vide est:

    >>> {}
    {}
    

C'est comme ça que l'on crée un dictionnaire vide. Hourra!

Maintenant, essayer d'écrire la commande suivante (et mettez vos propres informations):

    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
    

Avec cette commande, vous venez de créer une variable nommée `participant` avec trois paires clef-valeur:

*   La clef `name` pointe vers la valeur `'Ola'` (un object `chaîne de caractère`),
*   `country` pointe vers `'Poland'` (une autre ` chaîne de caractères`),
*   et `favorite_numbers` pointe vers `[7, 42, 92]` (une `liste` contenant trois nombres).

Vous pouvez vérifier le contenu de chaque clef avec cette syntaxe:

    >>> print(participant['name'])
    Ola
    

Vous voyez, c'est un peu comme une liste. Sauf que l'on a pas besoin de se souvenir de l'indice, juste du nom.

Qu'est ce que se passe quand on demande à Python la valeur correspondant à une clef qui n'existe pas? Pouvez vous le deviner? Essayons voir!

    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'
    

Oh, une autre erreur! Celle-ci est une **KeyError**. Python se rend utile et nous dit que la clef `'age'` n'existe pas dans le dictionnaire.

Quand faut-il utiliser un dictionnaire ou une liste? C'est une bonne question. Réfléchissez-y un instant avant de regarder la réponse à la ligne suivante.

*   Vous avez besoin d'une suite ordonnée d'éléments? Utilisez une liste.
*   Vous avez besoin d'associer des valeurs à des clefs, de manière à pouvoir les retrouver efficacement (par clef) par la suite? Utilisez un dictionnaire.

Comme les listes, les dictionnaires sont *mutables*, ce qui signifie qu'ils peuvent être modifiés après leur création. Vous pouvez ajouter de nouvelles paires clé/valeur au dictionnaire après sa création, comme ceci:

    >>> participant['favorite_language'] = 'Python'
    

Comme pour les listes, la fonction `len()` permet d'obtenir le nombre de paires clef-valeur du dictionnaire. Essayez, tapez la commande suivante:

    >>> len(participant)
    4
    

J'espère que c'est compréhensible pour l'instant :) Prêt⋅e pour s'amuser un peu plus avec les dictionnaires? Passez à la ligne suivante pour voir des trucs géniaux.

Vous pouvez utiliser la commande `del` pour supprimer un élément du dictionnaire. Par exemple, si vous voulez supprimer l'entrée correspondant à la clé `« favorite_numbers »`, tapez la commande suivante:

    >>> del participant['favorite_numbers']
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
    

Comme vous pouvez le voir dans la sortie, la paire clef-valeur correspondant à "favorite_numbers" a été supprimée.

En outre, vous pouvez changer la valeur associée à une clef déjà créée dans le dictionnaire. Tapez:

    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
    

Voilà, la valeur de la clé `"country"` a été modifiée de `"Poland"` à `"Germany"`. :) Ce n'est pas cool, ça? Yep! Un autre truc génial d'appris!

### Résumé

C'est super! Vous savez plein de trucs sur la programmation maintenant. Dans cette partie, vous avez appris:

*   **les erreurs** - vous savez maintenant comment lire et comprendre les erreurs qui apparaissent quand Python ne comprend pas une de vos commandes
*   **les variables** - des noms pour les objets qui vous permettent de coder plus facilement et de rendre votre code plus lisible
*   **les listes** - des listes d'objets stockés dans un ordre particulier
*   **les dictionnaires** - des objets stockés sous forme de paires clef-valeur

Embalé⋅e pour la partie suivant? :)

## Comparer des choses

Comparer des choses, c'est vachement important en programmation. Quelle est la chose la plus facile à comparer? Les nombres! Voyons voir comment ça marche:

    >>> 5 > 2
    True
    >>> 3 < 1
    False
    >>> 5 > 2 * 2
    True
    >>> 1 == 1
    True
    

On a donné à Python des nombres à comparer. Comme vous pouvez voir, Python peut comparer des nombres, mais aussi des résultats de méthodes. Pas mal, non?

Vous vous demander pourquoi on a mis deux signes `==` côte à côte pour savoir si deux nombres sont égaux? On utilise déjà `=` pour assigner des valeurs aux variables. Du coup, il faut toujours, oui **toujours**, mettre deux `==` si vous voulez savoir si deux choses sont égales.

Donnons encore un peu de boulot à Python:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

`>` et `<` sont faciles, mais qu'est ce que `>=` et `<=` veulent dire? Ils se lisent comment ça:

*   x `>` u veut dire: x est plus grand que y
*   x `<` y veut dire: x est plus petit que y
*   x `<=` y veut dire: x est plus petit ou égal à y
*   x `>=` y veut dire: x est plus grand ou égal à y

Super! Un dernier? Essayez ça:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
    

Vous pouvez donner à Python autant de nombres à comparer, et il vous donnera la réponse. Plutôt malin, non?

*   **et** - si vous utilisez l'opérateur `and`, les deux comparaisons doivent être True (vraies) pour que la commande tout entier soit True
*   **ou** - si vous utilisez l'opérateur `or`, il suffit qu'une des deux comparaisons soit True (vraie) pour que la commande tout entier soit True

Vous connaissez l'expression "on ne compare pas les choux et les carottes"? Essayons l'équivalent en Python:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

Voilà, Python n'est pas capable de comparer un nombre (`int`) et une chaîne de caractères (`str`). À la place, il nous montre une **TypeError** et nous dit que les deux types ne peuvent pas être comparés.

## Booléen

Au passage, vous venez de découvrir un nouveau type d'objets en Python. On l'appelle **Booléen**, et c'est probablement le type le plus simple que existe.

Il n'y a que deux objets Booléens: True et False

Pour que Python le comprenne, il faut toujours l'écrire True (première lettre en majuscule, les autres en minuscule). **true, TRUE, tRUE ne marchent pas -- seul True est correct.** (Et c'est aussi vrai pour False.)

Les Booléens aussi peuvent être des variables! Voyez:

    >>> a = True
    >>> a
    True
    

Vous pouvez aussi faire ça:

    >>> a = 2 > 5
    >>> a
    False
    

Entrainez-vous et amusez-vous avec les Booleéns en essayant de lancer les commandes suivantes:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1!= 2`

Bravo! Les Booléens sont une des fonctionnalités les plus cools en programmation, et vous venez d'apprendre comment les utiliser!

# Sauvegardez tout ça!

Pour l'instant, on a écrit tout notre code python directement dans l'interpréteur, ce qui nous limite à une ligne à la fois. Les programmes normaux sont sauvegardés dans des fichiers et sont exécutés par **l'interpréteur** ou le **compilateur** de notre langage de programmation. Jusque-là, c'était ligne par ligne dans **l'interpréteur**. On va avoir besoin de plus qu'une ligne de code pour la suite, alors on va avoir besoin de:

*   Quitter l'interpréteur Python
*   Ouvrir l'éditeur de code de notre choix
*   Sauvegarder du code dans un nouveau fichier python
*   Le lancer!

Pour quitter l'interpréteur Python que nous sommes en train d'utiliser, il suffit de taper la fonction ~ ~ ~ exit() ~ ~ ~:

    >>> exit()
    $
    

Ça vous ramènera dans la ligne de commande du système d'exploitation.

Tout à l'heure, dans la section [L'éditeur de texte][2], nous avons choisi un éditeur de texte. Nous avons maintenant besoin de l'ouvrir et d'écrire du code dans un nouveau fichier:

 [2]: code_editor/README.md

    print('Hello, Django girls!')
    

Alors forcément, vous avez maintenant pas mal de connaissances en python, donc n'hésitez pas à écrire du code avec ce que vous avez appris aujourd'hui.

Sauvegardons maintenant le fichier en lui donnant un nom descriptif. On n'a qu'à l'appeler **python_intro.py** et le sauvegarder sur le bureau. On peut lui n'importe quel nom, tant qu'on s'assure que le nom de fichier se termine par **.py**, ça permet à l'ordinateur de savoir que c'est un **fichier exécutable python** et que Python peut l'exécuter.

Une fois que le fichier est sauvegardé, on peut le lancer! En utilisant les compétences que vous avez apprises dans la section sur la ligne de commande, utilisez le terminal pour **changer le dossier courant** vers le bureau.

Sur Mac, ça ressemblera à:

    cd /Users/<your_name>/Desktop
    

Sous Linux, comme ça (il se peut que le mot Bureau soit dans une autre langue):

    cd /home/<your_name>/Bureau
    

Et sous Windows, ce sera comme ça:

    cd C:\Users\<your_name>\Desktop
    

Si vous êtes bloqué⋅e, n'hésitez pas à appeler à l'aide.

Une fois que c'est bon, utilisez Python pour exécuter le fichier comme ça:

    $ python3 python_intro.py
    Hello, Django girls!
    

Okay! Vous venez de lancer votre premier programme python à partir d'un fichier. Vous vous sentez génial⋅e?

Et maintenant, passons à un autre outil essentiel de la programmation:

## If...elif...else

Quand on code, il y a plein choses qui ne doivent être exécutées que dans certaines conditions. Pour ça, Python a quelque chose qui s'appelle le l'instruction **if**.

Remplacer le code dans votre fichier **python_intro.py** par ça:

    if 3 > 2:
    

Si on sauvegardait ça et qu'on le lançait tel quel, on aurait l'erreur suivante:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python s'attend à se qu'on lui donne des instructions sur ce qu'il faut exécuter quand la condition `3 > 2` est vraie (ou plutôt, `True`). Faisons-lui afficher "Ça marche!". Remplacez le code dans **python_intro.py** par ça:

    if 3 > 2:
        print('Ça marche!')
    

Vous remarquez comme on a décalé la seconde ligne de code de 4 espaces sur la gauche? On appelle ça indenter. On a besoin de le faire pour que Python sache quel code lancer si la condition est vraie. Un seul espace suffirait, mais à peu près tous⋅tes les programmeur⋅se⋅s Python pensent que 4, c'est plus clair. Une tabulation compte aussi comme 4 espaces.

Sauvegardez le fichier et relancez le:

    $ python3 python_intro.py
    Ça marche!
    

### Et sinon?

Dans le dernier exemple, le code était exécuté quand la condition est vraie. Mais Python a aussi des instructions `elif` et `else`:

    if 5 > 2:
        print('5 est effectivement plus grand que 2')
    else:
        print("5 n'est pas plus grand que 2")
    

Quand on lance ça, ça affiche:

    $ python3 python_intro.py
    5 est effectivement plus grand que 2
    

Et si 2 était plus grand que 5, la seconde commande serait exécutée. Facile, non? Voyons voir comment `elif` marche:

    name = 'Sonja'
    if name == 'Ola':
        print('Hey Ola!')
    elif name == 'Sonja':
        print('Hey Sonja!')
    else:
        print('Hey anonymous!')
    

On l'exécute:

    $ python3 python_intro.py
    Hey Sonja!
    

Vous voyez ce qu'il s'est passé?

### Résumé

Avec ces trois derniers exercices, vous avez appris:

*   **comparer des choses** - en Python, vous pouvez comparer des choses avec `>`, `>=`, `==`, `<=`, `<` et avec les opérateurs `and`, `or`
*   **Booléen** - un type d'objet qui n'a que deux valeurs possibles: `True` et `False`
*   **Sauvegarder des fichiers** - stocker votre code dans des fichiers pour pouvoir écrire des programmes plus longs.
*   **if...elif...else** - des instructions que vous permettent de n'exécuter du code que dans certaines conditions.

Il est temps d'attaquer la dernière partie de ce chapitre!

## Vos propres fonctions!

Vous vous souvenez des fonctions comme `len()` que vous pouvez exécuter en Python? Et bien, bonne nouvelle, vous allez apprendre comment écrire vos propres fonctions!

Une fonction est un ensemble d'instructions que Python va exécuter. Chaque fonction en Python commence par le mot-clef `def`. On lui donne un nom, et elle peut avoir des paramètres. On va commencer par quelque chose de facile. Remplacer le code de **python_intro.py** avec ça:

    def hi():
        print('Hi there!')
        print('How are you?')
    
    hi()
    

Voilà, notre première fonction est prête!

Vous vous demandez peut-être pourquoi nous avons écrit le nom de la fonction à la fin du fichier. C'est parce que Python lit le fichier et l'exécute de haut en bas. Donc pour pouvoir utiliser notre fonction, nous devons la réécrire en bas.

Lançons le pour voir ce qui se passe:

    $ python3 python_intro.py
    Hi there!
    How are you?
    

C'était facile! Construisons maintenant notre première fonction avec des paramètres. Dans l'exemple précédent, on avait une fonction que dit "Salut" à la personne qui la lance. Faisons pareil, mais avec un nom:

    def hi(name):
    

Comme vous le voyez, on a donné à notre fonction un paramètre appelé `name`:

    def hi(name):
        if name == 'Ola':
            print('Hi Ola!')
        elif name == 'Sonja':
            print('Hi Sonja!')
        else:
            print('Hi anonymous!')
    
    hi()
    

Comme vous voyez, on a dur mettre deux indentations avant la fonction `print`, parce que le `if` a besoin de savoir ce qui doit se passer quand la condition est vraie. Voyons voir comment ça marche:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oups, une erreur. Heureusement, Python nous donne un message d'erreur assez utile. Il nous dit que la fonction `hi()` (celle qu'on a définie) a besoin d'un argument (qu'on a appelé `name`) et que nous avons oublier de le passer quand nous avons appelé la fonction. Corrigeons la dernière ligne du fichier:

    hi("Ola")
    

et relançons le:

    $ python3 python_intro.py
    Hi Ola!
    

Ey si on change le nom?

    hi("Sonja")
    

et qu'on le lance:

    $ python3 python_intro.py
    Hi Sonja!
    

Et maintenant, qu'est-ce qui se passera si on met un autre nom (Ni Ola ni Sonja)? Essayez et voyez si vous arriver à deviner. Ça devrait afficher ça:

    Hi anonymous!
    

Super, non? Avec ça, vous n'avez pas besoin de vous repéter quand vous voulez changer le nom de la personne à saluer. Et c'est exactement pour ça qu'on a besoin de fonctions: parce qu'on ne veut jamais avoir à répéter du code!

Faisons maintenant quelque chose de plus malin -- il existe plus de deux noms, et ce serait un peu dur d'écrire une condition pour chacune, non?

    def hi(name):
        print('Hi ' + name + '!')
    
    hi("Rachel")
    

Appelons le code:

    $ python3 python_intro.py
    Hi Rachel!
    

Bravo! Vous venez d'apprendre à écrire des fonctions :)!

## Les boucles

Et voici la dernière partie. Ça a été vite, non? :)

On l'a déjà dit: les programmeur⋅euse⋅s sont fénéant⋅e⋅s, et n'aiment pas se répéter. Programmer, c'est automatiser des choses: on ne veut pas avoir à saluer chaque personne par son nom manuellement, non? C'est là que les boucles interviennent.

Vous vous souvenez des listes? Faisons une liste de Django Girls:

    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    

Nous voulons saluer chacune d'entre elles par son nom. Nous avons déjà la fonction `hi` pour faire ça, utilisons donc une boucle:

    for name in girls:
    

L'instruction ~~~for~~~ se comporte un peu comme ~~~if~~~, le code qui suit doit être indenté de quatre espaces.

Voilà le code complet à mettre dans le fichier:

    def hi(name):
        print('Hi ' + name + '!')
    
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    for name in girls:
        hi(name)
        print('Next girl')
    

Et quand on le lance:

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl
    

Comme vous le voyez, tout ce qu'on met dans un `for` avec une indentation est repété pour chaque élément de la liste `girls`.

Vous pouvez aussi utiliser `for` sur des nombres grâce à la fonction `range`:

    for i in range(1, 6):
        print(i)
    

Ce qui affiche:

    1
    2
    3
    4
    5
    

`range` est une fonction qui crée une liste de nombres qui se suivent (c'est vous qui donnez l'intervale via les paramètres).

Remarquez que le second de ces nombres n'est pas inclus dans la liste que Python nous donne (ce qui signifie que `range(1, 6)` compte de 1 à 5, mais n'inclue pas 6).

## Résumé

Et voilà! **Vous roxez du poney!** Ça n'était pas si facile que ça, vous pouvez être fière de vous. En tout cas, nous, on est fiers de vous pour être arrivée jusque ici!

Allez donc vous chercher un cupcake avant de passer au chapitre suivant :)

![Cupcake][3]

 [3]: images/cupcake.png
