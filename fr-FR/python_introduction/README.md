{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introduction à Python

> Une partie de ce chapitre s’inspire du tutoriel des Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Allons écrire du code !

## Le prompt Python

> Pour les lecteurs à la maison: cette partie est couverte dans la vidéo [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) .

Pour commencer à jouer avec Python, nous avons besoin d'ouvrir une *ligne de commande* sur votre ordinateur. Normalement, vous savez déjà comment le faire – vous l'avez appris dans le chapitre [Introduction à la ligne de commande](/intro_to_command_line/README. html).

Dès que vous êtes prête, suivez les instructions suivantes.

Afin d'ouvrir une console Python, tapez `python` sous Windows ou `python3` sous Mac OS/Linux et appuyez sur `entrée`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Votre première commande Python !

Après avoir lancé la commande Python, votre prompt (ou invite de commandes) a changé en `>>>`. Cela signifie que maintenant, les seules commandes que nous pouvons taper sont des commandes appartenant au langage Python. Vous n'avez pas besoin de taper `>>>` - Python fait ça pour vous.

Si vous voulez quitter la console Python, tapez `exit()` ou utilisez le raccourci `Ctrl + Z` pour Windows ou `Ctrl + D` pour Mac/Linux. Après ça, vous ne verrez plus le `>>>`.

Pour l'instant, nous ne voulons pas quitter la console Python. Nous voulons en savoir plus. Commençons par écrire quelques operations mathématiques, comme `2 + 3` suivi par la touche `entrée`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Pas mal, non ? Vous avez vu comment la réponse a surgi ? Python s'y connait en math ! Vous pouvez essayer d’autres commandes comme :

- `4 * 5`
- `5 - 1`
- `40 / 2`

Pour effectuer un calcul exponentiel, disons 2 à la puissance 3, nous tapons : {% filename %}ligne de commande{% endfilename %}

```python
>>> 2 ** 3
8
```

Amusez-vous un peu avec ça, et revenez ici après. :)

Comme vous pouvez le constater, Python est une très bonne calculette. Comme vous vous en doutez, il est aussi capable de faire autre chose…

## Chaines de caractères (Strings)

Et si nous essayions avec votre nom ? Tapez votre prénom entre guillemets, comme cela :

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Vous venez de créer votre première chaîne de caractères ! C'est une suite de caractères qui peut être traitée par un ordinateur. Une chaine de caractères doit toujours commencer et terminer par le même caractère. Çela peut être un guillemet simple (`'`) ou un guillemet double (`"`), ça n'a pas d'importance. Cela permet à Python de savoir que tout ce qui se trouve à l'intérieur de ces guillemets est une chaîne de caractères.

Il est possible d'assembler des chaines de caractères comme ceci :

{% filename %}command-line{% endfilename %}

```python
>>> "Salut  " + "Ola"
'Salut Ola'
```

Vous pouvez aussi multiplier une chaîne de caractères par un nombre :

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Si vous avez besoin de mettre une apostrophe dans votre chaine de caractères, vous avez deux possibilités.

Vous pouvez utiliser des guillemets doubles :

{% filename %}command-line{% endfilename %}

```python
>>> "J'aime la mousse au chocolat"
"J'aime la mousse au chocolat"
```

ou échapper l’apostrophe avec une barre oblique inversée (un backslash, ``) :

{% filename %}command-line{% endfilename %}

```python
>>> 'J\'aime la mousse au chocolat'
"J'aime la mousse au chocolat"
```

Pas mal, non ? Pour voir votre nom en majuscules, tapez juste :

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Vous venez d'utiliser la **fonction** `upper` sur votre chaine de caractères! Une méthode (comme `upper()`) est un ensemble d'instructions que Python va effectuer sur un objet donné (`"Ola"`) lorsque vous l’appellerez.

Si vous voulez savoir combien il y a de lettres dans votre nom, il y a une **fonction** pour ça !

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Vous avez peut-être remarqué que parfois, on appelle la fonction avec `.` en la plaçant après la chaine de caractères (comme `"Ola".upper()`) alors qu'à d'autres moment, on appelle d'abord la fonction puis la chaine de caractères entre parenthèses. Il s'avère que dans certains cas, les fonctions appartiennent à des objets (c'est le cas de `upper()`) et qu'elles ne peuvent être appliquées qu'à des chaines de caractères. Dans ce cas, on appelle la fonction une **méthode**. D'autres fois, les fonctions n’appartiennent à rien de particulier et peuvent être utilisées sur différents types d'objets (c'est le cas de `len()`). C'est pour ça que nous passons `"Ola"` comme argument à la fonction `len`.

### Résumé

OK, assez parlé de chaines de caractères. Jusque-là, nous avons découvert :

- **le prompt** – taper des commandes (du code) dans le prompt Python donne des réponses dans Python
- **les nombres et les chaines de caractères** – dans Python, les nombres sont utilisés pour faire des calculs, et les chaines de caractères pour manipuler du texte
- **opérateurs** – comme `+` et `*`, ils combinent des valeurs pour en produire une nouvelle
- **les fonctions** – comme `upper()` et `len()` qui effectuent des actions sur les objets.

Ce sont des bases présentes dans tous les langages de programmation existants. Prête pour quelque chose de plus compliqué ? Allons-y !

## Les erreurs

Essayons quelque chose de nouveau. Pouvons-nous obtenir la longueur d’un nombre de la même façon que celle de notre nom ? Tapez `len(304023)` et appuyez sur `entrée` :

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Nous avons eu notre première erreur! L'icône {{ warning_icon }} est notre façon de vous alerter que le code que vous êtes sur le point d'exécuter ne fonctionnera pas comme prévu. Faire des erreurs (même intentionnellement) est une partie importante de l'apprentissage!

L'erreur que nous venons d'avoir nous dit que les objets de type "int" (integers, ce qui signifie nombre entier) n'ont pas de longueur. Que pouvons-nous faire, du coup ? Pourquoi ne pas essayer d'écrire notre nombre comme une chaine de caractères ? Après tout, les chaînes de caractères ont bien une taille, non ?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ça a marché ! Nous avons utilisé la fonction `str` à l'intérieur de la fonction `len`. La fonction `str()` convertit n'importe quoi en chaine de caractères.

- La fonction `str` convertit des choses en **chaines de caractères**
- La fonction `int` convertit des choses en **entiers**

> Important : il est possible de convertir des nombres en texte, mais il n'est pas toujours possible de convertir du texte en nombres. Parce que, bon, ça vaudrait quoi `int('salut')` ?

## Variables

Il y existe un concept super important en programmation : les variables. Une variable, c'est juste un nom pour quelque chose que l'on aimerait utiliser plus tard. Les programmeurs⋅euses utilisent des variables pour stocker des données, rendre leur code plus lisible, et pour ne pas avoir à se rappeler de ce que sont les choses.

Disons que nous aimerions créer une variable appelée `name` :

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Nous tapons name égale Ola.

Vous avez peut-être remarqué que contrairement à tout à l'heure, le programme ne renvoie rien. Du coup, comment faire pour vérifier que la variable existe vraiment ? Tapez `name` et appuyez sur `entrée` :

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Youpi ! Votre première variable ! :) Vous pouvez toujours changer ce à quoi elle fait référence :

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Vous pouvez aussi l'utiliser avec des fonctions :

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Génial, non ? Et bien sûr, les variables peuvent être n'importe quoi, y compris des nombres ! Essayez ça :

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Mais que ce passe-t-il si nous utilisons le mauvais nom ? Essayez de deviner ! C'est parti !

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Une erreur ! Comme vous pouvez le voir, Python a différents types d'erreurs, et celle-ci est une **NameError**. Python vous donne cette erreur quand vous essayez d'utiliser une variable qui n'a pas encore été définie. Si vous rencontrez cette erreur par la suite, vérifiez dans votre code que vous n'avez pas fait une faute de frappe dans une variable.

Jouez un peu avec les variables et essayez de voir ce que vous pouvez en faire !

## La fonction print

Essayez ça :

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Quand vous tapez `name`, l'interpréteur Python répond avec la *représentation* de la chaine de caractères associée à la variable "name", c'est à dire les lettres M-a-r-i-a, entourées par des guillemets simples. Quand vous dites `print(name)`, Python va "imprimer" le contenu de la variable sur l'écran, sans les guillemets, ce qui est plus sympa.

Comme nous le verrons plus tard, `print()` est aussi utile lorsque l'on veut afficher des choses depuis l'intérieur de fonctions ou des choses sur plusieurs lignes.

## Les listes

En plus des chaines de caractères et des entiers, Python possède tout un tas d'autres types d'objets. Nous allons maintenant vous présenter un type appelé **list** (liste). Les listes sont exactement ce que vous pensez : des objets qui sont des listes d’autres objets. :)

Allez-y, créez une liste :

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Oui, cette liste est vide. Pas très utile, non ? Créons maintenant une liste de numéros de loterie. Nous ne voulons pas nous répéter tout le temps, donc mettons-la dans une variable :

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Voilà, nous avons une liste ! Qu'est ce que nous pourrions en faire ? Commençons par voir combien de numéros de loterie il y a dans cette liste. Une idée de la fonction pour faire ça ? Vous la connaissez déjà !

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Hé oui ! `len()` peut aussi vous donner le nombre d'objets dans une liste. Pratique, non ? Peut-être qu'on peut aussi la trier :

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Ça ne renvoie rien : cette fonction a juste changé l'ordre dans lequel les nombres apparaissent dans la liste. Affichons-la encore pour voir ce qu'il s'est passé :

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Comme vous pouvez le voir, les nombres de la liste sont maintenant triés du plus petit au plus grand. Bravo !

Pouvons-nous inverser cet ordre ? Essayons!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Si vous voulez ajouter quelque chose à la liste, vous pouvez le faire en tapant cette commande :

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Si vous ne souhaitez afficher que le premier élément, vous pouvez le faire en utilisant des **indices**. Un indice est un nombre qui indique où se trouve un élément dans la liste. Les programmeurs⋅euses préfèrent compter à partir de 0 : le premier objet dans notre liste a donc pour indice 0, le suivant 1 et ainsi de suite. Essayez ça :

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Comme vous pouvez le voir, nous pouvons accéder à différents objets dans la liste en utilisant le nom de la liste suivi de l'indice de l'objet entre crochets.

Pour supprimer quelque chose de votre liste, vous devrez utiliser les **indices** comme nous l'avons appris ci-dessus et la méthode `pop()` . Essayons l'exemple suivant : supprimez le premier élément de votre liste.

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Ça marche à merveille !

Jouons encore un peu avec les indices ! Essayez-en des nouveaux : 6, 7, 1000, -1, -6 ou -1000. Est-ce que vous arrivez à prévoir le résultat avant de taper la commande ? Est-ce que ses résultats vous paraissent logiques ?

Vous pouvez trouver une liste complète des méthodes disponibles pour les listes dans ce chapitre de la documentation de Python : https://docs.python.org/3/tutorial/datastructures.html

## Dictionnaires

> Pour les lectrices autodidactes : cette partie est traitée dans la vidéo [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Un dictionnaire est un peu comme une liste. Cependant, nous utilisons des clefs plutôt que des indices numériques pour accéder aux valeurs. Une clef peut être n'importe quelle chaîne de caractères ou n'importe quel nombre. La syntaxe pour définir un dictionnaire vide est la suivante :

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Cela montre que vous venez de créer un dictionnaire vide. Hurray !

Maintenant, essayez d'écrire la commande suivante (et essayez aussi de remplacer le contenu par vos informations) :

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Avec cette commande, vous venez de créer une variable nommée `participant` avec trois paires clef–valeur :

- La clef `name` pointe vers la valeur `'Ola'` (un objet `chaine de caractères`),
- `country` pointe vers `'Poland'` (une autre `chaine de caractères`),
- et `favorite_numbers` pointe vers `[7, 42, 92]` (une `liste` contenant trois nombres).

Vous pouvez vérifier le contenu de chaque clef avec cette syntaxe :

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Vous voyez, c'est un peu comme une liste; Cependant, vous n'avez pas besoin de vous souvenir de l'indice, juste de son nom.

Que ce passe-t-il lorsque nous demandons à Python la valeur correspondant à une clef qui n'existe pas ? Pouvez-vous le deviner ? Essayons voir !

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Oh, une autre erreur ! Celle-ci est une **KeyError**. Python nous donne un coup de main et nous dit que la clef `'age'` n'existe pas dans le dictionnaire.

Vous vous demandez peut-être quand est-ce qu'il faut utiliser un dictionnaire ou une liste ? C'est une bonne question. Réfléchissez-y un instant avant de regarder la réponse à la ligne suivante.

- Vous avez besoin d'une suite ordonnée d'éléments ? Utilisez une liste.
- Vous avez besoin d'associer des valeurs à des clefs, de manière à pouvoir les retrouver efficacement (par clef) par la suite ? Utilisez un dictionnaire.

Comme les listes, les dictionnaires sont *mutables*, ce qui signifie qu'ils peuvent être modifiés après leur création. Vous pouvez ajouter de nouvelles paires clé–valeur au dictionnaire après sa création, comme ceci :

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

J'espère que c'est compréhensible pour l'instant :) Prête pour s'amuser un peu plus avec les dictionnaires ? Passez à la ligne suivante pour voir des trucs géniaux.

Vous pouvez utiliser la méthode `pop()` pour supprimer un élément du dictionnaire. Par exemple, si vous voulez supprimer l'entrée correspondant à la clé `« favorite_numbers »`, tapez la commande suivante :

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Comme vous pouvez le voir dans votre console, la paire clef–valeur correspondant à "favorite_numbers" a été supprimée.

De même, vous pouvez changer la valeur associée à une clef déjà créée dans le dictionnaire. Tapez ceci :

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Voilà, la valeur de la clé `"country"` a été modifiée de `"Poland"` à `"Germany"`. :) Ce n'est pas cool ça ? Yep ! Un autre truc génial d'appris.

### Résumé

C'est super ! Vous savez plein de choses sur la programmation maintenant. Dans cette partie, vous avez appris :

- **les erreurs** – vous savez maintenant comment lire et comprendre les erreurs qui apparaissent quand Python ne comprend pas l'une de vos commandes
- **les variables** – des noms pour les objets qui vous permettent de coder plus facilement et de rendre votre code plus lisible
- **les listes** – des listes d'objets stockés dans un ordre particulier
- **les dictionnaires** – des objets stockés sous forme de paires clef–valeur

On continue ? :)

## Comparer des choses

> Pour les lectrices autodidactes : cette partie est traitée dans la vidéo [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Comparer des choses est très important en programmation. Quelle serait la chose la plus facile à comparer ? Les nombres, bien sûr ! Allons voir comment ça marche :

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
>>> len([1, 2, 3]) > len([4, 5])
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare values of mathematical expressions like `2 * 2` and function results like the `2` returned by `len([4, 5])`. Nice, huh?

Vous vous demandez probablement pourquoi nous avons mis deux signes `==` côte à côte pour savoir si deux nombres étaient égaux ? On utilise déjà `=` pour assigner des valeurs aux variables. Du coup, il faut toujours, oui **toujours**, mettre deux `==` si vous voulez savoir si deux choses sont égales. Nous pouvons aussi dire que certaines choses ne sont pas égales à d'autres. Pour cela, nous utilisons le symbole `! =`, comme illustré dans l'exemple ci-dessus.

Donnons encore un peu de boulot à Python :

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` et `<` sont faciles, mais qu'est ce que `>=` et `<=` veulent dire ? Ils se lisent comment ça :

- x `>` y veut dire : x est plus grand que y
- x `<` y signifie: x est inférieure à y
- x `< =` y signifie: x est inférieur ou égal à y
- x `>=` y veut dire : x est supérieur ou égal à y

Super ! Un dernier ? Essayez ça :

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Vous pouvez donner à Python autant de nombres à comparer que vous le souhaitez et il vous donnera une réponse. Plutôt malin, non ?

- **and** – si vous utilisez l'opérateur `and` (et), les deux comparaisons doivent être True (vraies) pour que la commande toute entière soit True
- **or** – si vous utilisez l'opérateur `or` (ou), il suffit qu'une des deux comparaisons soit True (vraie) pour que la commande toute entière soit True

Vous connaissez l'expression "on ne compare pas les choux et les carottes" ? Essayons l'équivalent en Python :

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Comme vous le voyez, Python n'est pas capable de comparer un nombre (`int`) et une chaine de caractères (`str`). À la place, il nous montre une **TypeError** et nous dit que les deux types ne peuvent pas être comparés.

## Booléen

Vous venez d'apprendre un nouveau type d'objet en Python. Il s'appelle **Boolean**.

Il n'y a que deux objets Booléens :

- True (vrai)
- False (faux)

Pour que Python comprenne qu'il s'agit d'un Boléen, il faut toujours l'écrire 'True' (première lettre en majuscule, les autres en minuscule). **true, TRUE, tRUE ne marchent pas -- seul True est correct.** (Et c'est aussi vrai pour False.)

Les Booléens aussi peuvent être des variables ! Regardez :

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Vous pouvez aussi faire ça :

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Entraînez-vous et amusez-vous avec les Booleéns en essayant de lancer les commandes suivantes :

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Bravo ! Les Booléens sont l'une des fonctionnalités les plus cools en programmation et vous venez juste d'apprendre comment les utiliser !

# Sauvegardez tout ça !

> Pour les lectrices autodidactes : cette partie est traitée dans la vidéo [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Pour l'instant, nous avons écrit tout notre code Python directement dans l'interpréteur, ce qui nous limite à une ligne de code à la fois. Les programmes sont typiquement sauvegardés dans des fichiers et sont exécutés par **l'interpréteur** ou le **compilateur** de notre langage de programmation. Jusqu'à présent, nous avons lancé nos programmes une ligne à la fois dans **l'interprèteur** Python. Nous aurons besoin de plus d'une ligne de code pour les prochaines tâches, donc nous aurons rapidement besoin de :

- Quitter l'interpréteur Python ;
- Ouvrir l'éditeur de code de notre choix ;
- Sauvegarder du code dans un nouveau fichier Python ;
- Le lancer !

Pour quitter l'interpréteur Python que nous sommes en train d'utiliser, il suffit de taper la fonction `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Cela vous ramènera dans la ligne de commande de votre système d'exploitation.

Tout à l'heure, nous avions choisi un éditeur de code de la section [code editor](../code_editor/README.md). Nous allons maintenant ouvrir l'éditeur et écrire du code dans un nouveau fichier (ou, si vous utilisez un Chromebook, créez un nouveau fichier dans le cloud IDE et ouvrez le fichier, qui sera dans l'éditeur de code inclus) :

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Vous avez maintenant pas mal de connaissances en Python : n'hésitez pas à écrire du code avec ce que vous avez appris aujourd'hui !

Maintenant, nous devons sauvegarder le fichier et lui donner un nom descriptif. Appelons le fichier **python_intro.py** et sauvegardons-le sur votre bureau. Vous pouvez donner le nom que vous souhaitez à ce fichier mais il est important qu'il se termine par **.py**. L'extension **.py** permet de signaler à votre système d'exploitation que ce fichier est un **fichier exécutable Python** et que Python peut le lancer.

> **Note :** Vous avez probablement constaté que votre code se pare de multiples couleurs : ça fait partie des choses qui rendent la programmation dans un éditeur de texte bien plus agréable ! Votre console Python n'avait pas cette fonctionnalité : tout était donc de la même couleur. Dans votre éditeur de texte, vous devriez voir que la fonction `print`, par exemple, n'a pas la même couleur d'une chaîne de caractères. C'est ce qu'on appelle « la coloration syntaxique ». C'est une fonctionnalité très utile lorsque l'on programme. La couleur des choses va vous permettre de détecter des problèmes : une chaine de caractères non fermée, une faute dans un mot (ce sera par exemple le cas dans la fonction `def` que vous verrez un peu plus tard). C'est ce genre de fonctionnalités qui font que vous aimerez rapidement programmer avec un éditeur de code. :)

Une fois que le fichier est sauvegardé, vous pouvez le lancer ! En utilisant les compétences que vous avez apprises dans la section sur la ligne de commande, utilisez le terminal pour **changer le dossier courant** vers le bureau.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Sur Mac, ça ressemblera à :

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Sur Linux, ce sera comme ça :

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(N'oubliez pas que le mot "Bureau" peut être traduit dans votre langue locale.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Dans l'invite de commande Windows, ce sera comme ceci :

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Et sur Windows Powershell, ce sera comme ça :

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Si vous êtes coincées, demandez de l'aide. C'est exactement pour ça que les coaches sont là !

Maintenant, utilisez Python pour exécuter le code contenu dans votre fichier :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: sur Windows 'python3' n'est pas reconnu comme une commande. Au lieu de cela, utilisez 'python' pour exécuter le fichier :

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Super ! Vous venez de lancer votre premier programme python à partir d'un fichier. Cool non ?

Et maintenant, passons à un autre outil essentiel de la programmation :

## If … elif … else

Quand on code, il y a plein de choses qui ne doivent être exécutées que dans certaines conditions. Pour cela, Python possède ce qu'on appelle l'instruction **if** (si).

Remplacez le code dans votre fichier **python_intro.py** avec ceci :

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Si nous sauvegardons ce fichier et que nous l'exécutons, nous obtiendrons l'erreur suivante :

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python s'attend à ce que nous lui donnions des instructions sur ce qu'il faut exécuter lorsque la condition `3 > 2` est vraie (ou plutôt, `True`). Essayons de lui faire afficher "Ça marche !". Remplacez le code dans **python_intro.py** par ceci :

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('Ça marche !')
```

Avez-vous remarqué que nous avions décalé la ligne suivante de quatre espaces ? C'est ce que l'on appelle indenter. Nous avons besoin d'indenter pour que Python sache quel code exécuter si le résultat est vrai. Un seul espace suffirait, mais à peu près tous⋅tes les programmeurs⋅euses Python pensent que 4 espaces sont plus clairs. La touche de tabulation (Tab) devrait ajouter automatiquement 4 espaces, mais cela peut dépendre du paramétrage de votre éditeur de texte. Lorsque vous avez fait votre choix, ne le changez pas ! Si vous avez déjà indenté avec 4 espaces, faites de même dans le reste du fichier - sinon vous risquez de rencontrer des problèmes.

Sauvegardez le fichier et relancez le :

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Ça marche !
```

Note: N'oubliez pas que sur Windows, 'python3' n'est pas reconnu comme une commande. À partir de maintenant, remplacez 'python3' par 'python' pour exécuter le fichier.

### Et que se passe-t-il si une condition n’est pas vraie ?

Dans les exemples précédents, Python a exécuté du code parce que celui-ci se trouvait sous une condition qui était vraie. Cependant, Python possède aussi des instructions `elif` (sinon si) et `else` (sinon) :

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 est effectivement plus grand que 2')
else:
    print("5 n'est pas plus grand que 2")
```

Lorsque vous exécuterez le code, ceci s'affichera :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 est effectivement plus grand que 2
    

Et si 2 était plus grand que 5, la seconde commande serait exécutée. Voyons comment `elif` fonctionne :

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

Exécutons le code :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Que s'est-il passé ? `elif` vous permet d'ajouter d'autres conditions à exécuter si les précédentes échouent.

Vous pouvez ajouter autant de `elif` que vous le souhaitez après le premier `if`. Voici un exemple :

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python va tester les différentes conditions puis il affichera ceci :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Parfait, je peux entendre tous les détails du morceau.
    

## Commentaires

Les commentaires sont des lignes commençant par `#`. Vous pouvez écrire ce que vous voulez après le `#` et Python va l'ignorer. Les commentaires peuvent rendre votre code plus facile à comprendre pour d'autres personnes.

Voyons à quoi cela ressemble :

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Vous n'avez pas besoin d'écrire un commentaire pour chaque ligne de code, mais il est utile parfois d'expliquer pourquoi votre code fait une certaine chose, ou de fournir un résumé pour les parties les plus complexes.

### Résumé

Avec ces derniers exercices, vous avez appris :

- **Comment comparer des choses** – en Python, vous pouvez comparer des choses avec `>`, `>=`, `==`, `<=`, `<` et avec les opérateurs `and`, `or`
- **Booléen** – un type d'objet qui n'a que deux valeurs possibles : `True` et `False`
- **Comment sauvegarder des fichiers** – stocker votre code dans des fichiers pour pouvoir écrire des programmes plus longs.
- **if … elif … else** – des instructions que vous permettent de n'exécuter du code que dans certaines conditions.
- **commentaires** – lignes que Python n'exécutera pas et qui vous permettent de documenter votre code.

Il est temps d'attaquer la dernière partie de ce chapitre !

## Vos propres fonctions !

> Pour les lectrices autodidactes : cette partie est traitée dans la vidéo [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Vous vous souvenez des fonctions comme `len()` que vous pouvez exécuter en Python ? Et bien, bonne nouvelle : vous allez apprendre à écrire vos propres fonctions!

Une fonction est un ensemble d'instructions que Python va exécuter. Chaque fonction en Python commence par le mot-clef `def`. On lui donne un nom, et elle peut avoir des paramètres. Essayons ! Remplacer le code de **python_intro.py** par ceci :

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Voilà, notre première fonction est prête !

Vous vous demandez peut-être pourquoi nous avons écrit le nom de la fonction à la fin du fichier. Quand nous écrivons `def hi():` et les lignes indentées qui suivent, nous écrivons les instructions disant ce que la fonction `hi` doit faire. Python va lire et mémoriser ces instructions, mais ne va pas exécuter la fonction tout de suite. Pour dire à Python que nous voulons exécuter la fonction, nous devons appeler la fonction avec `hi()`. Python lit le fichier et l’exécute de haut en bas, donc nous devons définir la fonction dans le fichier avant de l’appeler.

Lançons notre code pour voir ce qui se passe :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note : si cela n'a pas fonctionné, ne paniquez pas ! Le message d'erreur vous aidera à comprendre pourquoi :

- Si vous obtenez un `NameError`, cela est du probablement à une faute de frappe, donc vous devriez vérifier d'avoir utilisé le même nom lors de la création de la fonction avec `def hi():` et lors de l'appel avec `hi()`.
- Si vous obtenez un `IndentationError`, vérifiez que les deux `print` sont à la même distance du début de leur ligne: python veut que tout le code à l'intérieur de la fonction soit bien aligné.
- Si vous n'obtenez rien du tout, vérifiez que le `hi()` à la fin *n'est pas indenté*. Si c'est le cas, cette ligne est considérée par Python comme faisant partie de la fonction, et elle ne sera donc jamais exécutée.

Construisons maintenant notre première fonction avec des paramètres. Dans l'exemple précédent, nous avions une fonction que disait "Hi there!" à la personne qui la lançait. Faisons une fonction identique, mais ajoutons un nom cette fois-ci :

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Comme vous le voyez, nous avons donné à notre fonction un paramètre appelé `name` :

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Rappelez-vous : la fonction `print` est indentée de quatre espaces dans le bloc `if`, car elle est exécutée uniquement quand la condition est remplie. Voyons comment ça marche :

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oups, une erreur. Heureusement, Python nous donne un message d'erreur assez utile. Il nous dit que la fonction `hi()` (celle que nous avons définie) a besoin d'un argument (que nous avons appelé `name`). Nous avons oublié de passer cet argument lorsque nous avons appelé notre fonction. Corrigeons la dernière ligne du fichier :

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Et exécutez votre code à nouveau :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

Et que se passe-t-il quand on change de nom ?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Exécutez votre code à nouveau :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Maintenant, que pensez-vous qu'il se passera lorsque nous écrivrons un autre nom (ni Ola, ni Sonja) ? Faites un essai et regardez si vous avez raison. Ceci devrait s'afficher :

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Super, non ? Avec ça, vous n'avez pas besoin de répéter de lignes de code lorsque vous voulez changer le nom de la personne à saluer. C'est pour cette raison que nous avons besoin de fonctions : vous ne voulez pas avoir à répéter votre code !

Faisons quelque chose de plus intelligent – il existe bien plus que deux noms, et écrire une condition pour chacun d'entre eux serait difficile, non ? Remplacez le contenu de votre fichier avec les suivants :

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Exécutons à nouveau notre code :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Félicitations ! Vous venez juste d’apprendre à écrire des fonctions ! :)

## Les boucles

> Pour les lectrices autodidactes : cette partie est traitée dans la vidéo [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

C’est déjà la dernière partie. C’était rapide, non ? :)

Les programmeurs⋅euses n'aiment pas devoir se répéter. L'essence de la programmation est d'automatiser les choses. Pour reprendre l'exemple précédent, nous aimerions pouvoir saluer automatiquement chaque personne. Pour cela, nous allons utiliser des boucles.

Vous vous souvenez des listes ? Faisons une liste de filles :

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Nous voulons saluer chacune d'entre elles par son nom. Nous avons déjà la fonction `hi` pour faire ça, utilisons-la donc dans une boucle :

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

L'instruction `for` se comporte un peu comme `if`. Le code qui suit doit donc être indenté de quatre espaces.

Voilà le code complet à mettre dans votre fichier :

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Exécutez votre code :

{% filename %}command-line{% endfilename %}

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
    

Comme vous pouvez le constater, tout ce que vous mettez dans la déclaration `for` avec une indentation sera répété pour chaque élément de la liste `filles`.

Vous pouvez aussi utiliser `for` sur des nombres grâce à la fonction `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Cela va afficher :

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` est une fonction qui crée une liste de nombres qui se suivent (c'est vous qui définissez l’intervalle à l'aide de paramètres).

Vous pouvez remarquer que le second de ces nombres n'est pas inclus dans la liste que Python nous donne (ce qui signifie que `range(1, 6)` compte de 1 à 5, mais n'inclue pas 6). Cela est du au fait que "range" est semi-ouvert, c'est-à-dire qu'il prend en compte la première valeur mais pas la dernière.

## Résumé

Et voilà ! **Vos assurez un max !** C'était un chapitre difficile, donc vous pouvez être fières de vous. De notre côté, nous sommes fières de vous, pour être parvenu-e si loin dans le cours. Bravo !

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

N'hésitez pas à prendre une pause : étirez-vous, marchez un peu ou reposez-vous les yeux. Une fois que vous avez un peu rechargé vos batteries, vous pouvez attaquer le chapitre suivant :)

![Cupcake](images/cupcake.png)