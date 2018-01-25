# Introduction à Python

> Une partie de ce chapitre s’inspire du tutoriel des Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Allons écrire du code !

## Le prompt Python

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Pour commencer à jouer avec Python, nous avons besoin d'ouvrir une *ligne de commande* sur votre ordinateur. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Dès que vous êtes prête, suivez les instructions suivantes.

Afin d'ouvrir une console Python, tapez `python` sous Windows ou `python3` sous Mac OS/Linux et appuyez sur `entrée`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Votre première commande Python !

Après avoir lancé la commande Python, votre prompt (ou invite de commandes) s'est changé en `>>>`. Cela signifie que maintenant, les seules commandes que nous pouvons taper sont dans le langage Python. You don't have to type in `>>>` – Python will do that for you.

Quand vous voudrez sortir de la console Python, tapez `exit()` ou utilisez le raccourcit `Ctrl + Z` pour Windows ou `Ctrl + D` pour Mac/Linux. Après ça, vous ne verrez plus le `>>>`.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Pas mal, non ? Vous avez vu comment la réponse a surgi ? Python s'y connait en math ! Vous pouvez essayer d’autres commandes comme :

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Amusez-vous un peu avec ça, et revenez ici après. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Chaines de caractères (Strings)

Et si nous essayions avec votre nom ? Tapez votre prénom entre guillemets, comme cela :

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Vous venez de créer votre première chaine de caractères ! C'est une suite de caractères qui peut être traitée par un ordinateur. Une chaine de caractères doit toujours commencer et terminer par le même caractère. Çela peut être un guillemet simple (`'`) ou un guillemet double (`"`), ça n'a pas d'importance. Cela permet à Python de savoir que tout ce qui se trouve à l'intérieur de ces guillemets est une chaine de caractères.

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

Vous venez d'utiliser la **fonction** `upper` sur votre chaine de caractères! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Vous avez peut-être remarqué que parfois, on appelle la fonction avec `.` en la plaçant après la chaine de caractères (comme `"Ola".upper()`) alors qu'à d'autres moment, on appelle d'abord la fonction puis la chaine de caractères entre parenthèses ? Il s'avère que dans certains cas, les fonctions appartiennent à des objets (c'est le cas de `upper()`) et qu'elles ne peuvent être appliquées qu'à des chaines de caractères. Dans ce cas, on appelle la fonction une **méthode**. D'autres fois, les fonctions n’appartiennent à rien de particulier et peuvent être utilisées sur différents types d'objets (c'est le cas de `len()`). C'est pour ça que nous passons `"Ola"` comme argument à la fonction `len`.

### Résumé

OK, assez parlé de chaines de caractères. Jusque-là, nous avons découvert :

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Ce sont des bases présentes dans tous les langages de programmation que vous pouvez apprendre. Prête pour quelque chose de plus compliqué ? Allons-y !

## Les erreurs

Essayons quelque chose de nouveau. Pouvons-nous obtenir la longueur d’un nombre de la même façon que celle de notre nom ? Tapez `len(304023)` et appuyez sur `entrée` :

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Nous venons d'obtenir notre première erreur ! Elle nous dit que les objets de type "int" (integers, ce qui signifie nombre entier) n'ont pas de longueur. Que pouvons-nous faire, du coup ? Pourquoi ne pas essayer d'écrire notre nombre comme une chaine de caractères ? Après tout, les chaînes de caractères ont bien une taille, non ?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ça a marché ! Nous avons utilisé la fonction `str` à l'intérieur de la fonction `len`. La fonction `str()` convertit n'importe quoi en chaine de caractères.

- La fonction `str` convertit des choses en **chaines de caractères**
- La fonction `int` convertit des choses en **entiers**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variables

Il y existe un concept super important en programmation : les variables. Une variable, c'est juste un nom pour quelque chose que l'on aimerait utiliser plus tard. Les programmeurs⋅euses utilisent des variables pour stocker des données, rendre leur code plus lisible, et pour ne pas avoir à se rappeler de ce que sont les choses.

Disons que nous aimerions créer une variable appelée `name` :

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Vous avez peut-être remarqué que contrairement à tout à l'heure, le programme ne renvoie rien. Du coup, comment faire pour vérifier que la variable existe vraiment ? Tapez simplement `name` et appuyez sur `entrée` :

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Vous pouvez aussi l'utiliser dans des fonctions :

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Mais que ce passe-t-il si nous utilisons le mauvais nom ? Essayez de deviner ! C'est parti !

{% filename %}command-line{% endfilename %}

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

En plus des chaines de caractères et des entiers, Python possède tout un tas d'autres types d'objets. Nous allons maintenant vous présenter un type appelé **listes**. Les listes sont exactement ce que vous pensez qu’elles sont : des objets qui sont des listes d’autres objets. :)

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

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Si vous ne souhaitez afficher que le premier nombre, vous pouvez le faire en utilisant des **indices**. Un indice est un nombre qui dit où l'élément apparait dans la liste. Les programmeurs⋅euses préfèrent compter à partir de 0 : le premier objet dans notre liste a donc pour indice 0, le suivant 1 et ainsi de suite. Essayez ça :

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Comme vous pouvez le voir, nous pouvons accéder à différents objets dans la liste en utilisant le nom de la liste suivi de l'indice de l'objet entre crochets.

To delete something from your list you will need to use **indexes** as we learned above and the `pop()` method. Let's try an example and reinforce what we learned previously; we will be deleting the first number of our list.

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

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

C'est comme ça que l'on crée un dictionnaire vide. Hourra !

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- La clef `name` pointe vers la valeur `'Ola'` (un objet `chaine de caractères`),
- `country` pointe vers `'Poland'` (une autre `chaine de caractères`),
- et `favorite_numbers` pointe vers `[7, 42, 92]` (une `liste` contenant trois nombres).

Vous pouvez vérifier le contenu de chaque clef avec cette syntaxe :

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Que ce passe-t-il lorsque nous demandons à Python la valeur correspondant à une clef qui n'existe pas ? Pouvez-vous le deviner ? Essayons voir !

{% filename %}command-line{% endfilename %}

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

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Par exemple, si vous voulez supprimer l'entrée correspondant à la clé `« favorite_numbers »`, tapez la commande suivante :

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see from the output, the key–value pair corresponding to the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already-created key in the dictionary. Type this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Résumé

C'est super ! Vous savez plein de choses sur la programmation maintenant. Dans cette partie, vous avez appris :

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

On continue ? :)

## Comparer des choses

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

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
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

Vous vous demandez probablement pourquoi nous avons mis deux signes `==` côte à côte pour savoir si deux nombres étaient égaux ? On utilise déjà `=` pour assigner des valeurs aux variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Nous pouvons aussi dire que certaines choses ne sont pas égales à d'autres Pour cela, nous utilisons le symbole `! =`, comme illustré dans l'exemple ci-dessus.

Donnons encore un peu de boulot à Python :

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

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

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Vous connaissez l'expression "on ne compare pas les choux et les carottes" ? Essayons l'équivalent en Python :

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Comme vous le voyez, Python n'est pas capable de comparer un nombre (`int`) et une chaine de caractères (`str`). À la place, il nous montre une **TypeError** et nous dit que les deux types ne peuvent pas être comparés.

## Booléen

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Les Booléens aussi peuvent être des variables ! regardez :

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

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Pour l'instant, nous avons écrit tout notre code Python directement dans l'interpréteur, ce qui nous limite à une ligne à la fois. Les programmes normaux sont sauvegardés dans des fichiers et sont exécutés par **l'interpréteur** ou le **compilateur** de notre langage de programmation. Jusque-là, c'était ligne par ligne dans **l'interpréteur**. Nous allons avoir besoin de bien plus qu'une ligne de code par la suite alors, vous allez rapidement avoir besoin de :

- Quitter l'interpréteur Python
- Ouvrir l'éditeur de code de notre choix
- Sauvegarder du code dans un nouveau fichier Python
- Le lancer !

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Cela vous ramènera dans la ligne de commande de votre système d'exploitation.

Tout à l'heure, dans la section [L'éditeur de texte](../code_editor/README.md), nous avons choisi un éditeur de texte. Nous avons maintenant besoin de l'ouvrir et d'écrire du code dans un nouveau fichier :

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Vous avez maintenant pas mal de connaissances en Python : n'hésitez pas à écrire du code avec ce que vous avez appris aujourd'hui !

Sauvegardons maintenant le fichier en lui donnant un nom descriptif. On n'a qu'à l'appeler **python_intro.py** et le sauvegarder sur le bureau. Vous pouvez donner le nom que vous souhaitez à ce fichier mais il est important qu'il se termine par **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. C'est ce qu'on appelle « la coloration syntaxique ». C'est une fonctionnalité très utile lorsque l'on programme. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). C'est ce genre de fonctionnalités qui font que vous aimerez rapidement programmer avec un éditeur de code. :)

Une fois que le fichier est sauvegardé, vous pouvez le lancer ! En utilisant les compétences que vous avez apprises dans la section sur la ligne de commande, utilisez le terminal pour **changer le dossier courant** vers le bureau.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Sur Mac, ça ressemblera à :

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Si vous êtes bloquée, n'hésitez pas à appeler à l'aide.

Maintenant, utilisez Python pour exécuter le code contenu dans votre fichier :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Super ! Vous venez de lancer votre premier programme python à partir d'un fichier. Cool non ?

Et maintenant, passons à un autre outil essentiel de la programmation :

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Remplacez le code dans votre fichier **python_intro.py** avec ceci :

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}command-line{% endfilename %}

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

Avez-vous remarqué que nous avions décalé la ligne suivante de quatre espaces ? C'est ce que l'on appelle indenter. Nous avons besoin d'indenter pour que Python sache quel code exécuter si le résultat est vrai. Un seul espace suffirait, mais à peu près tous⋅tes les programmeurs⋅euses Python pensent que 4 espaces sont plus clairs. Une seule `tab` (tabulation) compte également comme 4 espaces.

Sauvegardez le fichier et relancez le :

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Ça marche !
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Et que se passe-t-il si une condition n’est pas vraie ?

Dans les exemples précédents, le code était exécuté quand la condition était vraie. Cependant, Python possède aussi des instructions `elif` (sinon si) et `else` (sinon) :

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
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

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
    

## Comments

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Résumé

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Il est temps d'attaquer la dernière partie de ce chapitre !

## Vos propres fonctions !

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Une fonction est un ensemble d'instructions que Python va exécuter. Chaque fonction en Python commence par le mot-clef `def`. On lui donne un nom, et elle peut avoir des paramètres. Let's give it a go. Remplacer le code de **python_intro.py** par ceci :

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Voilà, notre première fonction est prête !

Vous vous demandez peut-être pourquoi nous avons écrit le nom de la fonction à la fin du fichier. C'est parce que Python lit le fichier et l'exécute du haut vers le bas. Donc pour pouvoir utiliser notre fonction, nous devons la réécrire en bas.

Lançons notre code pour voir ce qui se passe :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

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

Rappelez-vous : la fonction `print` est indentée de quatre espaces dans le bloc `if`, car elle est exécutée uniquement quand la condition est satisfaite. Voyons comment ça marche :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oups, une erreur. Heureusement, Python nous donne un message d'erreur assez utile. Il nous dit que la fonction `hi()` (celle que nous avons définie) a besoin d'un argument (que nous avons appelé `name`). Nous avons oublier de passer cet argument lorsque nous avons appelé notre fonction. Corrigeons la dernière ligne du fichier :

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Et relançons le :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

Et que se passe-t-il quand on change de nom ?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Et qu'on le lance :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Super, non ? Avec ça, vous n'avez pas besoin de vous répéter lorsque vous voulez changer le nom de la personne à saluer. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

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
    

Bravo ! Vous venez d'apprendre à écrire des fonctions! :)

## Les boucles

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

C’est déjà la dernière partie. C’était rapide, non ? :)

Les programmeurs⋅euses n'aiment pas devoir se répéter. L'essence de la programmation est d'automatiser les choses : nous aimerions pouvoir saluer automatiquement chaque personne. Pour cela, nous allons utiliser des boucles.

Vous vous souvenez des listes ? Faisons une liste de Django Girls :

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Nous voulons saluer chacune d'entre elles par son nom. Nous avons déjà la fonction `hi` pour faire ça, utilisons donc une boucle :

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

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
    

Comme vous le voyez, tout ce que nous avons mis dans un `for` avec une indentation est répété pour chaque élément de la liste `girls`.

Vous pouvez aussi utiliser `for` sur des nombres grâce à la fonction `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Ce qui affiche :

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` est une fonction qui crée une liste de nombres qui se suivent (c'est vous qui définissez l’intervalle à l'aide de paramètres).

Vous pouvez remarquer que le second de ces nombres n'est pas inclus dans la liste que Python nous donne (ce qui signifie que `range(1, 6)` compte de 1 à 5, mais n'inclue pas 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Résumé

Et voilà ! **Vous êtes géniale !** Ce chapitre était un peu compliqué et vous devriez être fière de vous ! En tout cas, nous sommes super fière de vous !

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)