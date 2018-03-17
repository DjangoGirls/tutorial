{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Einführung in Python

> Ein Teil dieses Kapitels basiert auf dem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Fangen wir an, schreiben wir Code!

## Der Python-Prompt

> Für Leser die sich bereits mit Python auskennen: Dieser Teil findet sich im [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Um Python zu starten, musst du an die *Kommandozeile* deines Computers. Wie das geht, weißt du bereits - denn du hast es im Kapitel [Einführung in die Kommandozeile](../intro_to_command_line/README.md) gelernt.

Also öffne die Konsole, dann fangen wir an.

Wir wollen eine Python Konsole öffnen, also tippe in Windows cmd `python` ein oder in Mac OS/Linux terminal `python3` und drücke `Enter`.

{% filename %}cloud 9{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Dein erster Python-Befehl!

Nach Eingabe von python3 in der Konsole ändert sich das Prompt-Zeichen zu `>>>`. Für uns bedeutet das, dass wir ab nun nur noch Python-Code eingeben können. Den Python-Prompt `>>>` musst du nicht jedesmal eingeben - dies macht Python für dich.

Wenn du die Python-Konsole wieder verlassen möchtest, gib einfach `exit()` ein oder nutze das Tastatur-Kürzel `Strg + Z` unter Windows bzw. `Strg + D`, wenn du einen Mac hast oder Linux verwendest. Dann bist Du wieder in der normalen Konsole und der Python-Prompt `>>>` ist weg.

Fürs Erste bleiben wir in der Python Konsole, wir wollen mehr darüber lernen. Last uns Anfangen mit ein wenig Mathematik, gebt `2 + 3` ein und drückt `enter`.

{% filename %}cloud 9{% endfilename %}

```python
>>> 2 + 3 
5
```

Cool! Schon ist das Ergebnis da. Python kann rechnen! Probier einfach einige andere Befehle aus, wie z.B.: 

- `4 * 5`
- `5 - 1`
- `40 / 2`

Um Potenzen zu berechnen, sagen wir mal 2 hoch 3, müssen wir folgende eingeben: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Spiel ein wenig herum, dann machen wir weiter. :)

Wie du siehst, kann Python richtig toll rechnen. Aber Python kann noch viel mehr ...

## Strings

Strings sind Zeichenketten. Das ist eine Folge von Buchstaben, die von Anführungszeichen umgeben sind. Gib einfach mal deinen Namen ein (bei mir "Ola"):

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Nun hast du deinen ersten String erzeugt! Dies ist eine Folge von Zeichen (also nicht nur Buchstaben, wie ich oben schrieb, sondern Zeichen aller Art), die von einem Computer verarbeitet werden können. Ein String muss stets mit dem gleichen Zeichen beginnen und enden. Dies kann entweder ein einzelnes Gänsefüßchen sein (`'`) oder ein doppeltes (`"`) (da gibt es keinen Unterschied!). Die Anführungszeichen zeigen Python nur an, dass alles dazwischen ein String ist.

Strings können zusammengesetzt werden. Versuch es einmal:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Du kannst Strings auch vervielfältigen:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Brauchst du ein Apostroph in einem String, so hast du zwei Möglichkeiten.

Du kannst für den String doppelte Anführungszeichen verwenden:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

oder du kannst den Apostroph mit einem Backslash (``) markieren:

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Toll, was? Um deinen Namen in Großbuchstaben anzuzeigen, gib einfach folgendes ein:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Hier hast du die `upper`-**Methode** auf den String verwendet! Eine Funktion (wie `upper()`) ist eine Abfolge von Anweisungen, die Python ausführt, wenn die Funktion bei einem gegebenen Objekt (hier `"Ola"`) aufgerufen wird.

Nehmen wir an, du möchtest die Zahl der Buchstaben in deinem Namen wissen. Auch dafür gibt es eine Methode!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Nun fragst du dich sicher, warum du manchmal eine Funktion mit einem `.` am Ende des Strings (wie bei `"Ola".upper()`) schreibst und manchmal eine Funktion direkt aufrufst und den String dahinter in Klammern setzt? Im ersten Fall gehören solche Funktionen, wie `upper()`, zu Objekten (hier: ein String) und funktionieren auch nur bei diesen. In solchen Fällen bezeichnen wir eine Funktion als **Methode**. Andere Funktionen sind dagegen allgemeiner und können auf unterschiedliche Datentypen angewendet werden, wie beispielsweise `len()`. Daher übergeben wir `"Ola"` als Parameter an die `len` Funktion.

### Zusammenfassung

Ok, genug über Strings. Bisher haben wir Folgendes kennengelernt:

- **Der Prompt** - Wenn wir beim Python-Prompt Anweisungen (oder Programm-Code) in Python eingeben, dann erhalten wir auch Ergebnisse in Python. Wir befinden uns in der Python Shell
- **Zahlen und Strings** - In Python nutzen wir Zahlen für Berechnungen und Strings für Text-Objekte
- **Operatoren** - wie + und &#42;, verarbeiten mehrere Werte und erzeugen als Ergebnis einen neuen Wert
- **Funktionen** - wie upper() und len(), tun etwas mit Objekten (in unserem Beispiel ändern sie diese, wie bei upper(), oder sie geben eine Eigenschaft zurück, wie bei len()).

Das sind Grundlagen jeder Programmiersprache, die Du lernen wirst. Bist Du bereit für mehr? Bestimmt!

## Fehler

Probieren wir etwas Neues: Errors. Können wir die Länge einer Zahl auf die gleiche Weise ermitteln, wie die Länge eines Namens? Gib dazu `len(304023)` ein und drücke auf Enter:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Wir haben unsere erste Fehlermeldung (Error) erhalten! Das {{ warning_icon }} Icon ist das Zeichen von Python, dass der eingegebene Code nicht den Programmierregeln von Python entspricht und damit nicht das tut, was wir erwarten würden. Fehler zu machen (selbst absichtlich) ist ein wesentlicher Teil um zu Lernen!

Unser erster Fehler sagt, dass Objekte vom Typ "int" (Integers, das sind ganze Zahlen) keine Länge haben. Was also nun? Vielleicht sollten wir unsere Zahl als String schreiben? Denn bei Strings funktioniert es ja, wie wir wissen.

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ja, das funktioniert! Hier haben wir die `str`-Funktion innerhalb der Funktion `len` aufgerufen. `str()` konvertiert alles zu einem String.

- Die `str`-Funktion wandelt den übergebenen Wert in einen **String** um
- Die `int`-Funktion wandelt den übergebenen Wert in einen **Integer** um

> Wichtig: Zwar können wir Zahlen in Text umwandeln, aber nicht immer auch Text in Zahlen - was beispielsweise sollte `int('hello')` ergeben?

## Variablen

Ein wichtiger Bestandteil beim Programmieren sind Variablen. Eine Variable ist einfach ein Name für etwas, das wir später unter genau diesem Namen wieder verwenden können. Programmiererinnen nutzen Variablen, um Daten zu speichern, den Code lesbar zu halten und um sich nicht immer alles merken zu müssen.

Lasst uns eine eine Variable mit der Bezeichnung `name` anlegen:

{% filename %}cloud 9{% endfilename %}

```python
>>> name = "Ola"
```

Wir geben ein: name ist gleich "Ola".

Du hast sicher schon bemerkt, dass Python diesmal kein Ergebnis zurückgegeben hat. Woher sollen wir nun wissen, dass es die Variable jetzt auch tatsächlich gibt? Zum Test geben wir `name` ein und drücken wieder auf Enter:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Hurra! Deine erste Variable :)! Nun kannst du auch stets ändern, was sie enthalten soll:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Du kannst die Variable auch in Funktionen verwenden:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Das ist toll, oder? Variable können alles sein, also auch Zahlen. Versuche Folgendes:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Was aber, wenn wir für eine Variable den falschen Namen verwenden? Uns einfach vertippen. Hast du schon eine leise Ahnung, was dann passiert? Probieren wir es aus!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Ein Fehler! Wie du siehst, kennt Python verschiedene Arten von Fehlern. In unserem Fall hier ist es ein **NameError**. Python liefert diesen Fehler immer dann, wenn du versuchst, eine Variable zu verwenden, die es noch gar nicht gibt. Wenn du einen solchen Fehler erhältst, prüfe einfach in deinem Code, ob du dich irgendwo vertippt hast.

Spiel einfach ein wenig rum und schaue, was alles so passiert.

## Die print-Funktion

Gib einmal Folgendes ein:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Wenn du in der zweiten Zeile `name` eintippst, dann gibt der Python-Interpreter die String-*Darstellung* (engl. 'representation') der Variable 'name' aus. In unserem Beispiel die Buchstaben M-a-r-i-a, umschlossen von einfachen Anführungszeichen ('). Wenn du hingegen `print(name)` schreibst, dann gibt Python den Inhalt der Variablen ohne die Anführungszeichen zurück, was etwas schöner aussieht.

Wie wir später sehen werden, ist `print()` auch recht nützlich, wenn wir etwas aus Funktionen heraus ausgeben möchten oder auch eine Ausgabe über mehrere Zeilen darstellen wollen.

## Listen

Außer Strings (Zeichenketten) und Integern (ganze Zahlen) hat Python noch viele andere Arten von Datentypen. Von denen wollen wir uns nun **Listen** anschauen. Listen sind genau das, was du wahrscheinlich schon vermutest: Es sind Objekte, die Listen von anderen Objekten enthalten. :)

Legen wir los und erzeugen eine Liste:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Ja, dies ist eine leere Liste. Für uns noch nicht sehr nützlich. Legen wir nun eine Liste von Lottozahlen an. Da wir uns nicht dauernd wiederholen wollen, ordnen wir diese Liste auch direkt einer Variablen zu:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

So, nun haben wir eine Liste mit Lottozahlen! Was aber können wir damit tun? Zuerst einmal wollen wir feststellen, wie viele Zahlen in ihr enthalten sind. Hast du schon eine Idee, wie dies geht? Klar, das weißt du ja bereits!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Genau! `len()` liefert die Anzahl von Objekten in einer Liste zurück. Praktisch, nicht wahr? Nun wollen wir die Liste sortieren:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Diese Anweisung gibt nichts zurück. Was passiert, ist, dass die Reihenfolge der Objekte in der Liste geändert werden. Um zu sehen, was passiert ist, müssen wir die Liste ausgeben:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Wie du siehst, sind die Zahlen in der Liste nun aufsteigend sortiert. Super!

Aber vielleicht wollten wir es genau andersherum haben? Nichts leichter als das!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Einfach, oder? Du kannst auch etwas zu deiner Liste hinzufügen:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Falls du nicht immer die gesamte Liste, sondern beispielsweise nur den ersten Eintrag sehen möchtest, kannst du dafür **Indizes** benützen. Ein Index gibt die Stelle innerhalb einer Liste an, die uns interessiert. Programmierer bevorzugen es, bei 0 mit dem Zählen anzufangen. Also hat das erste Objekt in deiner Liste den Index 0, das nächste die 1 und so weiter. Gib einmal Folgendes ein:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Wie Du siehst, kannst Du auf die einzelnen Objekte in Deiner Liste zugreifen, indem Du den Namen der Liste verwendest und anschließend den Index in eckigen Klammern anfügst.

Um etwas aus deiner Liste zu löschen, musst du **Indizes** und die `pop()`-Methode benutzen, wie wir es weiter oben gelernt haben (del ist eine Abkürzung für delete). Lass uns ein Beispiel versuchen und das festigen, was wir zuvor gelernt haben; wir werden die erste Nummer aus unserer Liste löschen.

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

Das hat doch super geklappt!

Probier einmal andere Indizes aus: 6, 7, 1000, -1, -6 oder -1000 und versuch dir das Ergebnis vorzustellen, bevor du den jeweiligen Index verwendest. Sind die Ergebnisse sinnvoll?

Eine Liste aller Methoden, die du auf Listen anwenden kannst, findest du in der Python-Dokumentation: https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Installing Python Code Editor](https://www.youtube.com/watch?v=ZX1CVvZLE6c) behandelt.

Ein Wörterbuch (von nun an mit dem englischen Begriff 'Dictionary' bezeichnet) verhält sich ähnlich wie eine Liste, jedoch greifen wir auf die enthaltenen Objekte nicht mit einem Index, sondern mit einem Schlüssel zu (auf englisch 'key', und auch hier verwenden wir im weiteren den englischen Begriff). Ein 'key' kann ein String oder eine Zahl sein. Ein leeres Dictionary legen wir wie folgt an:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Und schon hast du ein leeres Dictionary erstellt. Super!

Nun gib einmal Folgendes ein (verwende statt 'Ola' usw. deine eigenen Informationen):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Der key `name` verweist auf den value `'Ola'` (welches ein `string` Objekt ist),
- `country` verweist auf `'Poland'` (ebenfalls ein `string` Objekt),
- und `favorite_numbers` schließlich verweist auf `[7, 42, 92]` (eine `Liste` mit drei Zahlen drin).

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

When should you use a dictionary or a list? Well, that's a good point to ponder. Just have a solution in mind before looking at the answer in the next line.

- Du brauchst nur eine geordnete Folge von Elementen? Dann wähle eine Liste.
- Du brauchst eine Sammlung von Elementen, auf die du später einzeln, gezielt und effizient mit Hilfe eines Namens (d.h. keys) zugreifen kannst? Dann wähle ein Dictionary.

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

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, just type in the following command:

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

### Zusammenfassung

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Vergleichen

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

- x `>` y bedeutet: x ist größer als y
- x `<` y bedeutet: x ist kleiner als y
- x `<=` y bedeutet: x ist kleiner oder gleich y
- x `>=` y bedeutet: x ist größer oder gleich y

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

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

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

# Sichern!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Den Python-Interpreter beenden
- Einen Code-Editor unserer Wahl öffnen
- Code eingeben und diesen in einer Python-Datei sichern
- Und diesen dann laufen lassen!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Dies wird "Syntax Hervorhebung" ("syntax highlighting") genannt und ist ein wirklich sehr nützliches Werkzeug beim Coden. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Dies ist einer der Gründe, warum wir Code-Editoren verwenden. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

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

If you get stuck, just ask for help.

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
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py 
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Was passiert, wenn eine Bedingung nicht True ist?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    5 is indeed greater than 2
    

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
    Perfect, I can hear all the details
    

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

### Zusammenfassung

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Deine eigenen Funktionen!

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
    Hi there! How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

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

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

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

## Schleifen

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

## Zusammenfassung

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)