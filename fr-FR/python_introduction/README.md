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
    Python 3.6.1 (...)
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

Vous pouvez aussi multiplier une chaîne de caractères par un chiffre :

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

Génial, non ? Et bien sûr, les variables peuvent être n'importe quoi, y compris des chiffres ! Essayez ça :

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

Si vous ne souhaitez afficher que le premier élément, vous pouvez le faire en utilisant des **indices**. Un indice est un chiffre qui indique où se trouve un élément dans la liste. Les programmeurs⋅euses préfèrent compter à partir de 0 : le premier objet dans notre liste a donc pour indice 0, le suivant 1 et ainsi de suite. Essayez ça :

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

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- La clef `name` pointe vers la valeur `'Ola'` (un objet `chaine de caractères`),
- `country` pointe vers `'Poland'` (une autre `chaine de caractères`),
- et `favorite_numbers` pointe vers `[7, 42, 92]` (une `liste` contenant trois nombres).

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

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

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

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

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Comparer des choses

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers! Let's see how that works:

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

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

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

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Booléen

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Sauvegardez tout ça !

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Quitter l'interpréteur Python
- Ouvrir l'éditeur de code de notre choix
- Sauvegarder du code dans un nouveau fichier Python
- Le lancer !

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. C'est ce qu'on appelle « la coloration syntaxique ». C'est une fonctionnalité très utile lorsque l'on programme. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). C'est ce genre de fonctionnalités qui font que vous aimerez rapidement programmer avec un éditeur de code. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Remember that the word "Desktop" might be translated to your local language.)

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

If you get stuck, ask for help. That's exactly what the coaches are here for!

Now use Python to execute the code in the file like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('Ça marche !')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Ça marche !
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Et que se passe-t-il si une condition n’est pas vraie ?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 est effectivement plus grand que 2')
else:
    print("5 n'est pas plus grand que 2")
```

When this is run it will print out:

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

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

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

Python runs through each test in sequence and prints:

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

Time for the last part of this chapter!

## Vos propres fonctions !

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

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

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Congratulations! You just learned how to write functions! :)

## Les boucles

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

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
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Résumé

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)