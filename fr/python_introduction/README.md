# Introduction à Python

> Note : ce chapitre est en partie inspiré d'un autre tutoriel réalisé par les Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Allons écrire du code !

## Le prompt Python

Pour commencer à jouer avec Python, nous avons besoin d'ouvrir une *ligne de commande* sur votre ordinateur. Normalement, vous savez déjà comment le faire -- vous l'avez appris dans le chapitre [Introduction à la ligne de commande][1].

 [1]: ../intro_to_command_line/README.md

Dès que vous êtes prête, suivez les instructions suivantes.

Afin d'ouvrir une console Python, tapez `python` sous Windows ou `python3` sous Mac OS/Linux et appuyez sur `entrée`.

```python
$ python3
Python 3.4.3 (...)
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## Votre première commande Python !

Après avoir lancé la commande Python, votre prompt (ou invite de commandes) s'est changé en `>>>`. Cela signifie que maintenant, les seules commandes que nous pouvons taper sont dans le langage Python. Vous n'avez pas besoin de taper `>>>` - Python fait ça pour vous.

Quand vous voudrez sortir de la console Python, tapez `exit()` ou utilisez le raccourci `Ctrl + Z` pour Windows ou `Ctrl + D` pour Mac/Linux. Après ça, vous ne verrez plus le `>>>`.

Pour le moment, nous ne voulons pas quitter la console Python car nous nous aimerions mieux la connaitre. Démarrons avec quelque chose de vraiment simple. Par exemple, faisons un peu de math : tapez `2 + 3` et appuyez sur `entrée`.

```python
>>> 2 + 3
5
```

Pas mal ! Vous voyez comment la réponse est sortie ? Python sait faire des maths ! Vous pouvez essayer d'autres commandes comme : - `4 * 5` - `5 - 1` - `40 / 2`

Amusez-vous un peu avec ça, et revenez ici après :).

Comme vous pouvez le constater, Python est une très bonne calculette. Comme vous vous en doutez, il est aussi capable de faire autre chose ...

## Chaînes de caractères (Strings)

Et si nous essayions avec votre nom ? Tapez votre prénom entre guillemets, comme cela :

```python
>>> "Ola"
'Ola'
```

Vous venez de créer votre première chaîne de caractères ! C'est une suite de caractères qui peut être traitée par un ordinateur. Une chaîne de caractères doit toujours commencer et terminer par le même caractère. Cela peut être un guillemet simple (`'`) ou un guillemet double (`"`), ça n'a pas d'importance. Cela permet à Python de savoir que tout ce qui se trouve à l'intérieur de ces guillemets est une chaîne de caractères.

Il est possible d'assembler des chaînes de caractères comme ceci :

```python
>>> "Salut  " + "Ola"
'Salut Ola'
```

Vous pouvez aussi multiplier une chaîne de caractères par un nombre :

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Si vous avez besoin de mettre une apostrophe dans votre chaîne de caractères, vous avez deux possibilités.

Vous pouvez utiliser des guillemets doubles :

```python
>>> "J'aime la mousse au chocolat"
"J'aime la mousse au chocolat"
```

ou échapper l’apostrophe avec une barre oblique inversée (un backslash, `&#92;`) :

```python
>>> 'J\'aime la mousse au chocolat'
"J'aime la mousse au chocolat"
```

Pas mal, non ? Pour voir votre nom en majuscules, tapez juste :

```python
>>> "Ola".upper()
'OLA'
```

Vous venez d'utiliser la **fonction** `upper` sur votre chaîne de caractères ! Une fonction (comme `upper()`) est un ensemble d'instructions que Python va effectuer sur un objet donné (`"Ola"`) lorsque vous l’appellerez.

Si vous voulez savoir combien il y a de lettres dans votre nom, il y a une fonction pour ça !

```python
>>> len("Ola")
3
```

Vous avez peut-être remarqué que parfois, on appelle la fonction avec `.` en la plaçant après la chaîne de caractères (comme `"Ola".upper()`) alors qu'à d'autres moment, on appelle d'abord la fonction puis la chaîne de caractères entre parenthèses ? Il s'avère que dans certains cas, les fonctions appartiennent à des objets (c'est le cas de `upper()`) et qu'elles ne peuvent être appliquées qu'à des chaînes de caractères. Dans ce cas, on appelle la fonction une **méthode**. D'autres fois, les fonctions n’appartiennent à rien de particulier et peuvent être utilisées sur différents types d'objets (c'est le cas de `len()`). C'est pour ça que nous passons `"Ola"` comme argument à la fonction `len`.

### Résumé

OK, assez parlé de chaînes de caractères. Jusque-là, nous avons découvert :

*   **le prompt** - taper des commandes (du code) dans le prompt Python donne des réponses dans Python
*   **les nombres et les chaînes de caractères** - dans Python, les nombres sont utilisés pour faire des calculs, et les chaînes de caractères pour manipuler du texte
*   **opérateurs** - comme + et * qui combinent des valeurs pour en obtenir de nouvelles
*   **les fonctions** - comme upper() et len() qui effectuent des actions sur les objets.

Ce sont des bases présentes dans tous les langages de programmation que vous pouvez apprendre. Prête pour quelque chose de plus compliqué ? Allons-y !

## Les erreurs

Essayons quelque chose de nouveau. Pouvons-nous obtenir la longueur d’un nombre de la même façon que celle de notre nom ? Tapez `len(304023)` et appuyez sur `entrée` :

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Nous venons d'obtenir notre première erreur ! Elle nous dit que les objets de type "int" (integers, ce qui signifie nombre entier) n'ont pas de longueur. Que pouvons-nous faire, du coup ? Pourquoi ne pas essayer d'écrire notre nombre comme une chaîne de caractères ? Après tout, les chaînes de caractères ont bien une taille, non ?

```python
>>> len(str(304023))
6
```

Ça a marché ! Nous avons utilisé la fonction `str` à l'intérieur de la fonction `len`. La fonction `str()` convertit n'importe quoi en chaîne de caractères.

*   La fonction `str` convertit des choses en **chaînes de caractères**
*   La fonction `int` convertit des choses en **entiers**

> Important : il est possible de convertir des nombres en texte, mais il n'est pas toujours possible de convertir du texte en nombres. Parce que, bon, ça vaudrait quoi `int('salut')` ?

## Variables

Il existe un concept super important en programmation : les variables. Une variable, c'est juste un nom pour quelque chose que l'on aimerait utiliser plus tard. Les programmeurs⋅euses utilisent des variables pour stocker des données, rendre leur code plus lisible, et pour ne pas avoir à se rappeler de ce que sont les choses.

Disons que nous aimerions créer une variable appelée `name` :

```python
>>> name = "Ola"
```

Vous voyez ? C'est tout bête ! C'est simplement : name vaut Ola.

Vous avez peut-être remarqué que contrairement à tout à l'heure, le programme ne renvoie rien. Du coup, comment faire pour vérifier que la variable existe vraiment ? Tapez simplement `name` et appuyez sur `entrée` :

```python
>>> name
'Ola'
```

Youpi ! Votre première variable :) ! Vous pouvez toujours changer ce à quoi elle fait référence :

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Vous pouvez aussi l'utiliser dans des fonctions :

```python
>>> len(name)
5
```

Génial, non ? Et bien sûr, les variables peuvent être n'importe quoi, y compris des nombres ! Essayez ça :

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Mais que se passe-t-il si nous utilisons le mauvais nom ? Essayez de deviner ! C'est parti !

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Une erreur ! Comme vous pouvez le voir, Python a différents types d'erreurs, et celle-ci est une **NameError**. Python vous donne cette erreur quand vous essayez d'utiliser une variable qui n'a pas encore été définie. Si vous rencontrez cette erreur par la suite, vérifiez dans votre code que vous n'avez pas fait une faute de frappe dans une variable.

Jouez un peu avec les variables et essayez de voir ce que vous pouvez faire !

## La fonction print

Essayez ça :

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Quand vous tapez `name`, l'interpréteur Python répond avec la *représentation* de la chaîne de caractères associée à la variable "name", c'est à dire les lettres M-a-r-i-a, entourées par des guillemets simples. Quand vous dites `print(name)`, Python va "imprimer" le contenu de la variable sur l'écran, sans les guillemets, ce qui est plus sympa.

Comme nous le verrons plus tard, `print()` est aussi utile lorsque l'on veut afficher des choses depuis l'intérieur de fonctions ou des choses sur plusieurs lignes.

## Les listes

En plus des chaînes de caractères et des entiers, Python possède tout un tas d'autres types d'objets. Nous allons maintenant vous présenter un type appelé **listes**. Les listes sont exactement ce que vous pensez qu’elles sont : des objets qui sont des listes d’autres objets :)

Allez-y, créez une liste :

```python
>>> []
[]
```  

Oui, cette liste est vide. Pas très utile, non ? Créons maintenant une liste de numéros de loterie. Nous ne voulons pas nous répéter tout le temps, donc mettons-la dans une variable :

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Voilà, nous avons une liste ! Qu'est ce que nous pourrions en faire ? Commençons par voir combien de numéros de loterie il y a dans cette liste. Une idée de la fonction pour faire ça ? Vous la connaissez déjà !

```python
>>> len(lottery)
6
```

Hé oui ! `len()` peut aussi vous donner le nombre d'objets dans une liste. Pratique, non ? Peut-être qu'on peut aussi la trier :

```python
>>> lottery.sort()
```

Ça ne renvoie rien : cette fonction a juste changé l'ordre dans lequel les nombres apparaissent dans la liste. Affichons-la encore pour voir ce qu'il s'est passé :

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Comme vous pouvez le voir, les nombres de la liste sont maintenant triés du plus petit au plus grand. Bravo !

Pouvons-nous inverser cet ordre ? Essayons!

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Facile, non ? Si vous voulez ajouter quelque chose à la liste, vous pouvez le faire en tapant cette commande :

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Si vous ne souhaitez afficher que le premier nombre, vous pouvez le faire en utilisant des **indices**. Un indice est un nombre qui dit où l'élément apparait dans la liste. Les programmeurs⋅euses préfèrent compter à partir de 0 : le premier objet dans notre liste a donc pour indice 0, le suivant 1 et ainsi de suite. Essayez ça :

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Comme vous pouvez le voir, nous pouvons accéder à différents objets dans la liste en utilisant le nom de la liste suivi de l'indice de l'objet entre crochets.

Pour supprimer un objet de votre liste, vous aurez besoin de son **indice** ainsi que de la commande `pop()`. Essayons l'exemple suivant : supprimez le premier numéro de votre liste.

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Ça marche à merveille !

Jouons encore un peu avec les indices ! Essayez-en des nouveaux : 6, 7, 1000, -1, -6 ou -1000. Est-ce que vous arrivez à prévoir le résultat avant de taper la commande ? Est-ce que ces résultats vous paraissent logiques ?

Vous pouvez trouver une liste complète des méthodes disponibles pour les listes dans ce chapitre de la documentation de Python : https://docs.python.org/3/tutorial/datastructures.html

## Dictionnaires

Un dictionnaire est un peu comme une liste. Cependant, nous utilisons des clefs plutôt que des indices pour accéder aux valeurs. Une clef peut être n'importe quelle chaîne de caractère ou n'importe quel nombre. La syntaxe pour définir un dictionnaire vide est la suivante :

```python
>>> {}
{}
```

C'est comme ça que l'on crée un dictionnaire vide. Hourra !

Maintenant, essayez d'écrire la commande suivante (et essayez aussi de changer le contenu) :

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Avec cette commande, vous venez de créer une variable nommée `participant` avec trois paires clef-valeur :

*   La clef `name` pointe vers la valeur `'Ola'` (un objet `chaîne de caractères`),
*   `country` pointe vers `'Poland'` (une autre `chaîne de caractères`),
*   et `favorite_numbers` pointe vers `[7, 42, 92]` (une `liste` contenant trois nombres).

Vous pouvez vérifier le contenu de chaque clef avec cette syntaxe :

```python
>>> print(participant['name'])
Ola
```

Vous voyez, c'est un peu comme une liste; Cependant, vous n'avez pas besoin de vous souvenir de l'indice, juste de son nom.

Que se passe-t-il lorsque nous demandons à Python la valeur correspondant à une clef qui n'existe pas ? Pouvez-vous le deviner ? Essayons voir !

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Oh, une autre erreur ! Celle-ci est une **KeyError**. Python nous donne un coup de main et nous dit que la clef `'age'` n'existe pas dans le dictionnaire.

Vous vous demandez peut-être quand est-ce qu'il faut utiliser un dictionnaire ou une liste ? C'est une bonne question. Réfléchissez-y un instant avant de regarder la réponse à la ligne suivante.

*   Vous avez besoin d'une suite ordonnée d'éléments ? Utilisez une liste.
*   Vous avez besoin d'associer des valeurs à des clefs, de manière à pouvoir les retrouver efficacement (par clef) par la suite ? Utilisez un dictionnaire.

Comme les listes, les dictionnaires sont *mutables*, ce qui signifie qu'ils peuvent être modifiés après leur création. Vous pouvez ajouter de nouvelles paires clé/valeur au dictionnaire après sa création, comme ceci :

```python
>>> participant['favorite_language'] = 'Python'
```

Comme pour les listes, la fonction `len()` permet d'obtenir le nombre de paires clef-valeur du dictionnaire. Essayez et tapez la commande suivante :

```python
>>> len(participant)
4
```

J'espère que c'est compréhensible pour l'instant :) Prête pour s'amuser un peu plus avec les dictionnaires ? Passez à la ligne suivante pour voir des trucs géniaux.

Vous pouvez utiliser la commande `pop()` pour supprimer un élément du dictionnaire. Par exemple, si vous voulez supprimer l'entrée correspondant à la clé `« favorite_numbers »`, tapez la commande suivante :

```python
>>> participant.pop('favorite_numbers')
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Comme vous pouvez le voir dans votre console, la paire clef-valeur correspondant à "favorite_numbers" a été supprimée.

De même, vous pouvez changer la valeur associée à une clef déjà créée dans le dictionnaire. Tapez ceci :

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Voilà, la valeur de la clé `"country"` a été modifiée de `"Poland"` à `"Germany"`. :) Ce n'est pas cool ça ? Yep ! Un autre truc génial d'appris !

### Résumé

C'est super ! Vous savez plein de choses sur la programmation maintenant. Dans cette partie, vous avez appris :

*   **les erreurs** - vous savez maintenant comment lire et comprendre les erreurs qui apparaissent quand Python ne comprend pas l'une de vos commandes
*   **les variables** - des noms pour les objets qui vous permettent de coder plus facilement et de rendre votre code plus lisible
*   **les listes** - des listes d'objets stockés dans un ordre particulier
*   **les dictionnaires** - des objets stockés sous forme de paires clef-valeur

On continue ? :)

## Comparer des choses

Comparer des choses est très important en programmation. Quelle serait la chose la plus facile à comparer ? Les nombres, bien sûr ! Voyons voir comment ça marche :

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
```

Nous avons donné à Python des nombres à comparer. Comme vous pouvez le voir, Python peut comparer des nombres, mais aussi des résultats de méthodes. Pas mal, non ?

Vous vous demandez probablement pourquoi nous avons mis deux signes `==` côte à côte pour savoir si deux nombres étaient égaux ? On utilise déjà `=` pour assigner des valeurs aux variables. Du coup, il faut toujours, oui **toujours**, mettre deux `==` si vous voulez savoir si deux choses sont égales. Nous pouvons aussi dire que certaines choses ne sont pas égales à d'autres Pour cela, nous utilisons le symbole `!=`, comme illustré dans l'exemple ci-dessus.

Donnons encore un peu de boulot à Python :

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` et `<` sont faciles, mais qu'est ce que `>=` et `<=` veulent dire ? Ils se lisent comment ça :

*   x `>` y veut dire : x est plus grand que y
*   x `<` y signifie: x est inférieure à y
*   x `<=` y signifie: x est inférieur ou égal à y
*   x `>=` y veut dire : x est supérieur ou égal à y

Super ! Un dernier ? Essayez ça :

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Vous pouvez donner à Python autant de nombres à comparer que vous le souhaitez et il vous donnera une réponse. Plutôt malin, non ?

*   **and** - si vous utilisez l'opérateur `and` (et), les deux comparaisons doivent être True (vraies) pour que la commande toute entière soit True
*   **or** - si vous utilisez l'opérateur `or` (ou), il suffit qu'une des deux comparaisons soit True (vraie) pour que la commande toute entière soit True

Vous connaissez l'expression "on ne compare pas les choux et les carottes" ? Essayons l'équivalent en Python :

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() > str()
```

Comme vous le voyez, Python n'est pas capable de comparer un nombre (`int`) et une chaîne de caractères (`str`). À la place, il nous montre une **TypeError** et nous dit que les deux types ne peuvent pas être comparés.

## Booléen

Au passage, vous venez de découvrir un nouveau type d'objets en Python. On l'appelle **Booléen**. C'est probablement le type le plus simple qui existe.

Il n'y a que deux objets Booléens : - True (vrai) - False (faux)

Pour que Python comprenne qu'il s'agit d'un Boléen, il faut toujours l'écrire True (première lettre en majuscule, les autres en minuscule). **true, TRUE, tRUE ne marchent pas -- seul True est correct.** (Et c'est aussi vrai pour False.)

Les Booléens aussi peuvent être des variables ! regardez :

```python
>>> a = True
>>> a
True
```

Vous pouvez aussi faire ça :

```python
>>> a = 2 > 5
>>> a
False
```

Entrainez-vous et amusez-vous avec les Booleéns en essayant de lancer les commandes suivantes :

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Bravo ! Les Booléens sont l'une des fonctionnalités les plus cools en programmation et vous venez juste d'apprendre comment les utiliser !

# Sauvegardez tout ça !

Pour l'instant, nous avons écrit tout notre code Python directement dans l'interpréteur, ce qui nous limite à une ligne à la fois. Les programmes normaux sont sauvegardés dans des fichiers et sont exécutés par **l'interpréteur** ou le **compilateur** de notre langage de programmation. Jusque-là, c'était ligne par ligne dans **l'interpréteur**. Nous allons avoir besoin de bien plus qu'une ligne de code par la suite alors, vous allez rapidement avoir besoin de :

*   Quitter l'interpréteur Python
*   Ouvrir l'éditeur de code de notre choix
*   Sauvegarder du code dans un nouveau fichier Python
*   Le lancer !

Pour quitter l'interpréteur Python que nous sommes en train d'utiliser, il suffit de taper la fonction `exit()` :

```python
>>> exit()
$
```

Cela vous ramènera dans la ligne de commande de votre système d'exploitation.

Tout à l'heure, dans la section [L'éditeur de texte][2], nous avons choisi un éditeur de texte. Ouvrez-le et écrivez le code suivant dans un nouveau fichier :

 [2]: ../code_editor/README.md

```python
print('Hello, Django girls!')
```

> **Note :** Vous avez probablement constaté que votre code se pare de multiples couleurs : ça fait partie des choses qui rendent la programmation dans un éditeur de texte bien plus agréable. Votre console Python n'avait pas cette fonctionnalité : tout était donc de la même couleur. Dans votre éditeur de texte, vous devriez voir que la fonction `print` possède différentes couleurs. C'est ce qu'on appelle « la coloration syntaxique ». C'est une fonctionnalité très utile lorsque l'on programme. La couleur des choses va vous permettre de détecter des problèmes : une chaîne de caractères non fermée, une faute dans un mot (ce sera par exemple le cas dans la fonction `def` que vous verrez un peu plus bas). C'est ce genre de fonctionnalités qui font que vous aimerez rapidement programmer avec un éditeur de code :)

Vous avez maintenant pas mal de connaissances en Python : n'hésitez pas à écrire du code avec ce que vous avez appris aujourd'hui !

Sauvegardons maintenant le fichier en lui donnant un nom descriptif. On n'a qu'à l'appeler **python_intro.py** et le sauvegarder sur le bureau. Vous pouvez donner le nom que vous souhaitez à ce fichier mais il est important qu'il se termine par **.py**. L'extension **.py** permet de signaler à votre système d'exploitation que ce fichier est un **fichier exécutable Python** et que Python peut le lancer.

Une fois que le fichier est sauvegardé, vous pouvez le lancer ! En utilisant les compétences que vous avez apprises dans la section sur la ligne de commande, utilisez le terminal pour **changer le dossier courant** vers le bureau.

Sur Mac, ça ressemblera à :

    $ cd /Users/<your_name>/Desktop


Sous Linux, comme ça (il se peut que le mot Bureau soit dans une autre langue) :

    $ cd /home/<your_name>/Desktop


Et sous Windows, ce sera comme ça :

    > cd C:\Users\<your_name>\Desktop


Si vous êtes bloquée, n'hésitez pas à appeler à l'aide.

Maintenant, utilisez Python pour exécuter le code contenu dans votre fichier :

    $ python3 python_intro.py
    Hello, Django girls!


Super ! Vous venez de lancer votre premier programme python à partir d'un fichier. Cool non ?

Et maintenant, passons à un autre outil essentiel de la programmation :

## If...elif...else

Quand on code, il y a plein choses qui ne doivent être exécutées que dans certaines conditions. Pour cela, Python possède ce qu'on appelle l'instruction **if** (si).

Remplacez le code dans votre fichier **python_intro.py** avec ceci :

```python
if 3 > 2:
```

Si nous sauvegardons ce fichier et que nous le lançons, nous obtiendrons l'erreur suivante :

```python
$ python3 python_intro.py
File "python_intro.py", line 2
         ^
SyntaxError: unexpected EOF while parsing
```

Python s'attend à ce que nous lui donnions des instructions sur ce qu'il faut exécuter lorsque la condition `3 > 2` est vraie (ou plutôt, `True`). Essayons de lui faire afficher "Ça marche !". Remplacez le code dans **python_intro.py** par ceci :

```python
if 3 > 2:
    print('It works!')
```

Avez-vous remarqué que nous avions décalé la ligne suivante de quatre espaces ? C'est ce que l'on appelle indenter. Nous avons besoin d'indenter pour que Python sache quel code exécuter si le résultat est vrai. Un seul espace suffirait, mais à peu près tous⋅tes les programmeurs⋅euses Python pensent que 4 espaces sont plus clairs. Une seule `tab` (tabulation) compte également comme 4 espaces.

Sauvegardez le fichier et relancez le :

    $ python3 python_intro.py
    Ça marche !


### Et que se passe-t-il si une condition n’est pas vraie ?

Dans les exemples précédents, le code était exécuté quand la condition était vraie. Cependant, Python possède aussi des instructions `elif` (sinon si) et `else` (sinon) :

```python
if 5 > 2:
    print('5 est effectivement plus grand que 2')
else:
    print("5 n'est pas plus grand que 2")
```

Lorsque vous exécuterez le code, ceci s'affichera :

    $ python3 python_intro.py
    5 est effectivement plus grand que 2


Et si 2 était plus grand que 5, la seconde commande serait exécutée. Facile, non ? Voyons comment `elif` fonctionne :

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

    $ python3 python_intro.py
    Hey Sonja!


Que s'est-il passé ? `elif` vous permet d'ajouter d'autres conditions à exécuter si les précédentes échouent.

Vous pouvez ajouter autant de `elif` que vous le souhaitez après le premier `if`. Voici un exemple :

```python
volume = 57
if volume < 20:
    print("C'est plutôt calme.")
elif 20 <= volume < 40:
    print("Une jolie musique de fond.")
elif 40 <= volume < 60:
    print("Parfait, je peux entendre tous les détails du morceau.")
elif 60 <= volume < 80:
    print("Parfait pour faire la fête !")
elif 80 <= volume < 100:
    print("Un peu trop fort !")
else:
    print("Au secours ! Mes oreilles ! :(")
```

Python va tester les différentes conditions puis il affichera ceci :

    $ python3 python_intro.py
    Parfait, je peux entendre tous les détails du morceau.


### Résumé

Avec ces trois derniers exercices, vous avez appris :

*   **Comment comparer des choses** - en Python, vous pouvez comparer des choses avec `>`, `>=`, `==`, `<=`, `<` et avec les opérateurs `and`, `or`
*   **Booléen** - un type d'objet qui n'a que deux valeurs possibles : `True` et `False`
*   **Comment sauvegarder des fichiers** - stocker votre code dans des fichiers pour pouvoir écrire des programmes plus longs.
*   **if...elif...else** - des instructions que vous permettent de n'exécuter du code que dans certaines conditions.

Il est temps d'attaquer la dernière partie de ce chapitre !

## Vos propres fonctions !

Vous vous souvenez des fonctions comme `len()` que vous pouvez exécuter en Python ? Et bien, bonne nouvelle : vous allez apprendre à écrire vos propres fonctions!

Une fonction est un ensemble d'instructions que Python va exécuter. Chaque fonction en Python commence par le mot-clef `def`. On lui donne un nom, et elle peut avoir des paramètres. Commençons par quelque chose de facile. Remplacer le code de **python_intro.py** par ceci :

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Voilà, notre première fonction est prête !

Vous vous demandez peut-être pourquoi nous avons écrit le nom de la fonction à la fin du fichier. C'est parce que Python lit le fichier et l'exécute du haut vers le bas. Donc pour pouvoir utiliser notre fonction, nous devons la réécrire en bas.

Lançons notre code pour voir ce qui se passe :

    $ python3 python_intro.py
    Hi there!
    How are you?


C'était facile ! Construisons maintenant notre première fonction avec des paramètres. Dans l'exemple précédent, nous avions une fonction qui disait "Hi there!" à la personne qui la lançait. Faisons une fonction identique, mais ajoutons un nom cette fois :

```python
def hi(name):
```

Comme vous le voyez, nous avons donné à notre fonction un paramètre appelé `name` :

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

Rappelez-vous : la fonction `print` est indentée de quatre espaces dans le bloc `if`, car elle est exécutée uniquement quand la condition est satisfaite. Voyons comment ça marche :

```python
$ python3 python_intro.py
Traceback (most recent call last):
File "python_intro.py", line 10, in <module>
  hi()
TypeError: hi() missing 1 required positional argument: 'name'
```

Oups, une erreur. Heureusement, Python nous donne un message d'erreur assez utile. Il nous dit que la fonction `hi()` (celle que nous avons définie) a besoin d'un argument (que nous avons appelé `name`). Nous avons oublier de passer cet argument lorsque nous avons appelé notre fonction. Corrigeons la dernière ligne du fichier :

```python
hi("Ola")
```

Et exécutez votre code à nouveau :

    $ python3 python_intro.py
    Hi Ola!


Et que se passe-t-il quand on change de nom ?

```python
hi("Sonja")
```

Exécutez votre code à nouveau :

    $ python3 python_intro.py
    Hi Sonja!


Maintenant, que pensez-vous qu'il se passera lorsque nous écrirons un autre nom (ni Ola, ni Sonja) ? Faites un essai et regardez si vous avez raison. Ceci devrait s'afficher :

    Hi anonymous!


Super, non ? Avec ça, vous n'avez pas besoin de vous répéter lorsque vous voulez changer le nom de la personne à saluer. C'est pour cette raison que nous avons besoin de fonctions : vous ne voulez pas avoir à répéter votre code !

Faisons maintenant quelque chose de plus malin : comme vous le savez, il existe plus de deux prénoms. Cependant, ce serait un peu pénible de devoir écrire une condition pour chacun d'entre eux, n'est-ce pas ?

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Exécutons à nouveau notre code :

    $ python3 python_intro.py
    Hi Rachel!


Félicitations ! Vous venez juste d’apprendre à écrire des fonctions ! :)

## Les boucles

C’est déjà la dernière partie. C’était rapide, non ? :)

Les programmeurs⋅euses n'aiment pas devoir se répéter. L'essence de la programmation est d'automatiser les choses : nous aimerions pouvoir saluer automatiquement chaque personne. Pour cela, nous allons utiliser des boucles.

Vous vous souvenez des listes ? Faisons une liste de Django Girls :

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Nous voulons saluer chacune d'entre elles par son nom. Nous avons déjà la fonction `hi` pour faire ça, utilisons donc une boucle :

```python
for name in girls:
```

L'instruction `for` se comporte un peu comme `if`. Le code qui suit doit donc être indenté de quatre espaces.

Voilà le code complet à mettre dans votre fichier :

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Exécutez votre code :

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


Comme vous le voyez, tout ce que nous avons mis dans un `for` avec une indentation est répété pour chaque élément de la liste `girls`.

Vous pouvez aussi utiliser `for` sur des nombres grâce à la fonction `range`:

```python
for i in range(1, 6):
    print(i)
```

Ce qui affiche :

    1
    2
    3
    4
    5


`range` est une fonction qui crée une liste de nombres qui se suivent (c'est vous qui définissez l’intervalle à l'aide de paramètres).

Vous pouvez remarquer que le second de ces nombres n'est pas inclus dans la liste que Python nous donne (ce qui signifie que `range(1, 6)` compte de 1 à 5, mais n'inclut pas 6). C'est lié au fait que "range" est à moitié ouvert. Cela signifie qu'il inclut la première valeur mais pas la dernière.

## Résumé

Et voilà ! **Vous êtes géniale !** Ce chapitre était un peu compliqué et vous devriez être fière de vous ! En tout cas, nous sommes super fières de vous !

N'hésitez pas à prendre une pause : étirez-vous, marchez un peu ou reposez-vous les yeux. Une fois que vous avez un peu rechargé vos batteries, vous pouvez attaquer le chapitre suivant :)

![Cupcake][3]

 [3]: images/cupcake.png
