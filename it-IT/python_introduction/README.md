{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introduzione a Python

> Parte di questo capitolo è tratto dal tutorial delle Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Scriviamo un po' di codice!

## La linea di comando di Python

> Per chi ci segue da casa: questa parte si trova nel video [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Per iniziare a giocare con Python, devi avviare sul tuo computer una *linea di comando*. Dovresti già sapere come farlo – l'hai imparato nel capitolo [Introduzione alla riga di comando](../intro_to_command_line/README.md).

Una volta pronta, segui le istruzioni riportate di seguito.

Vogliamo aprire una console Python, quindi digita `python` su Windows o `python3` su Mac OS/Linux e premi `invio`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Il tuo primo comando Python!

Dopo aver eseguito il comando Python, il prompt è cambiato in `>>>`. Questo ci informa che ora dovremo utilizzare comandi propri del linguaggio Python. Non devi digitare `>>>` - Python lo farà per te.

Se ad un certo punto vuoi uscire dalla console di Python, digita `exit()` oppure usa la scorciatoia `Ctrl + Z` per Windows e `Ctrl + D` per Mac/Linux. Dopo non vedrai più `>>>`.

Per il momento, non vogliamo uscire dalla console di Python. Vogliamo saperne di più. Iniziamo digitando qualche espressione matematica, come `2 + 3` e premiamo `invio`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Bello! Hai visto come le risposte spuntano fuori? Python conosce la matematica! Prova altri comandi come:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Per eseguire un calcolo esponenziale, per esempio 2 elevato alla potenza 3, digitiamo: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Giochicchia un po' con Python, e poi torna a leggere qui. :)

Come puoi vedere, Python è una buona calcolatrice. Ora ti starai sicuramente chiedendo cos'altro è capace di fare…

## Stringhe

Che ne dici di scrivere il tuo nome? Digitalo tra virgolette così:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Hai appena creato la tua prima stringa! Una stringa è una sequenza di caratteri che possono essere elaborati da un computer. La stringa deve sempre iniziare e finire con lo stesso carattere. Che può essere una virgoletta semplice (`'`) o doppia (`"`) (non c'è differenza!) Le virgolette dicono a Python che il contenuto al loro interno è una stringa.

Le stringhe possono essere legate assieme. Prova questo:

{% filename %}command-line{% endfilename %}

```python
>>> " Ciao " + "Ola"
'Ciao Ola'
```

Puoi anche moltiplicare le stringhe con un numero:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Se devi mettere un apostrofo nella tua stringa, hai due modi per farlo.

Utilizzando le virgolette doppie:

{% filename %}command-line{% endfilename %}

```python
>>> "L'ape Maja va"
"L'ape Maja va"
```

o facendo l'escape dell'apostrofo (cioè evitando che concluda la stringa) con una barra rovesciata (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'L\'ape Maja va'
"L'ape Maja va"
```

Bello, eh? Per vedere il tuo nome in maiuscolo, digita:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Hai appena applicato il **metodo** `upper` sulla tua stringa! Un metodo (come `upper()`) è una sequenza di istruzioni che Python deve compiere su un oggetto dato (la stringa `"Ola"`) nel momento in cui viene applicato.

Se vuoi sapere il numero di lettere nel tuo nome, per questo c'è una **funzione**!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Ti stai chiedendo la differenza fra il chiamare una funzione con un `.` alla fine di una stringa (come `"Ola".upper()`) ed il chiamare prima la funzione e poi mettere la stringa tra parentesi? Beh, ci sono funzioni che appartengono ad oggetti, come `upper()`, che può essere eseguita solo su stringhe. In questo caso, chiamiamo la funzione **metodo**. Altre volte, le funzioni non appartengono a niente di specifico e possono essere utilizzate su diversi tipi di oggetti, proprio come `len()`. Ecco perché stiamo passando `"Ola"` come parametro alla funzione `len`.

### Indice

OK, basta con le stringhe. Ecco fino ad ora quanto hai imparato:

- Il **prompt** -- Digitare i comandi (codice) nel prompt di Python restituisce risposte in Python
- **Numeri e stringhe** -- In Python i numeri vengono utilizzati per la matematica e le stringhe per oggetti testuali
- Gli **operatori** -- come `+` e `*`, combinano più valori per produrne uno nuovo
- **funzioni** -- come `upper()` e `len()`, eseguono azioni su oggetti.

Fin qui le basi del linguaggio di programmazione che stiamo imparando. Pronta per qualcosa di più complicato? Scommetto di sì!

## Errori

Proviamo una cosa diversa. Possiamo ottenere la lunghezza di un numero nella stessa forma in cui abbiamo potuto scoprire la lunghezza del nostro nome? Digita `len(304023)` e premi `Invio`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Abbiamo ottenuto il nostro primo errore! L'icona {{ warning_icon }} è il nostro modo per suggerirti che il codice che stai per eseguire non funzionerà come ti aspetti. Fare errori (anche intenzionali) è un elemento importante dell'apprendimento!

Il testo dice che gli oggetti di tipo "int" (interi, numeri interi) non hanno lunghezza. Quindi cosa possiamo fare ora? Forse possiamo scrivere il nostro numero come stringa? Le stringhe hanno una lunghezza, giusto?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ha funzionato! Abbiamo utilizzato la funzione `str` all'interno della funzione `len`. `str()` converte tutto in stringhe.

- La funzione `str` converte le cose in **stringhe**
- La funzione `int` converte le cose in **numeri interi**

> Importante: possiamo convertire i numeri in testo, ma non possiamo convertire il testo in numeri - cosa potrebbe essere `int('hello')`?

## Variabili

Un concetto importante nella programmazione è quello delle variabili. Una variabile non è altro che un nome per qualcosa, così puoi usarla più tardi. I programmatori usano le variabili per memorizzare dati, rendere il loro codice più leggibile in modo da non dover continuare a ricordare le cose.

Diciamo che vogliamo creare una nuova variabile chiamata `nome`:

{% filename %}command-line{% endfilename %}

```python
>>> nome = "Ola"
```

Praticamente, poniamo il valore della variabile <tt>nome</tt> uguale alla stringa "Ola".

Come hai notato, il tuo programma non ha dato nessun risultato come ha fatto prima. Allora come facciamo a sapere che la variabile esiste veramente? semplicemente digita `nome` e premi `Invio`:

{% filename %}command-line{% endfilename %}

```python
>>> nome
'Ola'
```

Urrà! La tua prima variabile! :) E puoi anche cambiare il valore a cui essa si riferisce:

{% filename %}command-line{% endfilename %}

```python
>>> nome = "Sonja"
>>> nome
'Sonja'
```

La puoi utilizzare anche nelle funzioni:

{% filename %}command-line{% endfilename %}

```python
>>> len(nome)
5
```

Awesome, right? Now, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

But what if we used the wrong name? Can you guess what would happen? Let's try!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Un errore! As you can see, Python has different types of errors and this one is called a **NameError**. Python will give you this error if you try to use a variable that hasn't been defined yet. If you encounter this error later, check your code to see if you've mistyped any names.

Play with this for a while and see what you can do!

## La funzione print

Try this:

{% filename %}command-line{% endfilename %}

```python
>>> nome = 'Maria'
>>> nome
'Maria'
>>> print(name)
Maria
```

When you just type `name`, the Python interpreter responds with the string *representation* of the variable 'name', which is the letters M-a-r-i-a, surrounded by single quotes, ''. When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.

## Liste

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called **list**. Lists are exactly what you think they are: objects which are lists of other objects. :)

Go ahead and create a list:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Sì, questa lista è vuota. Abbastanza inutile, vero? Creiamo una lista di numeri della lotteria. Non vogliamo ripetere la sequenza ogni volta, quindi metteremo anche la lista in una variabile:

{% filename %}command-line{% endfilename %}

```python
>>> lotteria = [3, 42, 12, 19, 30, 59]
```

All right, we have a list! What can we do with it? Let's see how many lottery numbers there are in a list. Do you have any idea which function you should use for that? You know this already!

{% filename %}command-line{% endfilename %}

```python
>>> len(lotteria)
8
```

Yes! `len()` can give you a number of objects in a list. Handy, right? Maybe we will sort it now:

{% filename %}command-line{% endfilename %}

```python
>>> lotteria.sort()
```

This doesn't return anything, it just changed the order in which the numbers appear in the list. Let's print it out again and see what happened:

{% filename %}command-line{% endfilename %}

```python
>>> print(lotteria)
[3, 12, 19, 30, 42, 59]
```

As you can see, the numbers in your list are now sorted from the lowest to highest value. Congrats!

Maybe we want to reverse that order? Let's do that!

{% filename %}command-line{% endfilename %}

```python
>>> lotteria.reverse()
>>> print(lotteria)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lotteria.append(199)
>>> print(lotteria)
[59, 42, 30, 19, 12, 3, 199]
```

If you want to show only the first number, you can do this by using **indexes**. An index is the number that says where in a list an item occurs. Programmers prefer to start counting at 0, so the first object in your list is at index 0, the next one is at 1, and so on. Try this:

{% filename %}command-line{% endfilename %}

```python
>>> print(lotteria[0])
59
>>> print(lotteria[1])
42
```

As you can see, you can access different objects in your list by using the list's name and the object's index inside of square brackets.

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

That worked like a charm!

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Dizionari

> Per chi ci segue da casa: questa parte si trova nel video [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

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
>>> partecipante = {'nome': 'Ola', 'paese': 'Polonia', 'numeri_preferiti': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- La chiave `nome` va a indicare il valore `'Ola'` (un oggetto `stringa`),
- `paese` indica `'Polonia'` (un'altra `stringa`),
- e `numeri_preferiti` indica `[7, 42, 92]` (una `lista` con tre numeri al suo interno).

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(partecipante['nome'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> partecipante['età']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'età'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

- Ha bisogno di una sequenza ordinata di elementi? Fai una lista.
- Hai bisogno di associare i valori alle chiavi, così che potrai cercarle agilmente (per chiave) dopo? Usa un dizionario.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> partecipante['linguaggio_preferito'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(partecipante)
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
>>> partecipante['paese'] = 'Germania'
>>> partecipante
{'paese': 'Germania', 'linguaggio_preferito': 'Python', 'nome': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Indice

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Confrontare le cose

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

- x `>` y significa: x è maggiore di y
- x `<` y significa: x è minore di y
- x `<=` y significa: x è minore o uguale a y
- x `>=` y significa: x è maggiore o uguale a y

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

## Booleano

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- Vero
- Falso

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

Esercitati e divertiti con i valori booleani provando a eseguire i seguenti comandi:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congratulazioni! I valori Booleani sono tra le cose più interessanti della programmazione e tu hai appena imparato ad utilizzarli!

# Salvalo!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Uscire dall'interprete di Python
- Aprire l'editor di codice che abbiamo scelto
- Salvare un po' di codice in un file python
- Eseguirlo!

Per uscire dall'interprete di Python che abbiamo utilizzato, digita la funzione `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Ciao, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Questa viene chiamata "sintassi evidenziata", ed è veramente utile quando si scrive codice. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Questo è uno dei motivi per cui usiamo un editor di codice. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Su un Mac, il comando sarà più o meno così:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Su Linux, sarà così:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Ricorda che la parola "Desktop" potrebbe essere tradotta nella tua lingua.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Nel prompt dei comandi di Windows, sarà così:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

If you get stuck, ask for help. That's exactly what the coaches are here for!

Ora usa Python per eseguire il codice nel file:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao, Django girls!
    

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
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funziona!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### E se una condizione non è Vera?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 è infatti maggiore di 2')
else:
    print('5 non è maggiore di 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 è infatti maggiore di 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
nome = 'Sonja'
if nome == 'Ola':
    print('Hey Ola!')
elif nome == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonimo!')
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
    Perfetto, posso apprezzare ogni dettaglio
    

## Commenti

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

### Indice

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Le funzioni personalizzate!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao():
    print('Ciao!')
    print('Come stai?')

ciao()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao!
    Come stai?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
    if nome == 'Ola':
        print('Ciao Ola!')
    elif nome == 'Sonja':
        print('Ciao Sonja!')
    else:
        print('Ciao anonimo!')

ciao()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: ciao() missing 1 required positional argument: 'nome'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
ciao("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Ola!
    

E se cambiamo il nome?

{% filename %}python_intro.py{% endfilename %}

```python
ciao("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Ciao anonimo!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
    print('Ciao ' + nome + '!')

ciao("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Rachel!
    

Complimenti! Hai appena imparato a scrivere le funzioni! :)

## Loop

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
ragazze = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
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
def ciao(nome):
    print('Ciao ' + nome + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
for name in girls:
    ciao(name)
    print('Prossima ragazza')
```

E quando lo eseguiamo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Rachel!
    Prossima ragazza
    Ciao Monica!
    Prossima ragazza
    Ciao Phoebe!
    Prossima ragazza
    Ciao Ola!
    Prossima ragazza
    Ciao You!
    Prossima ragazza
    

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

## Indice

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)