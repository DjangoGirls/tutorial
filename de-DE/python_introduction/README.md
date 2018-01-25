# Einführung in Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Fangen wir an, schreiben wir Code!

## Der Python-Prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Um Python zu starten, musst du an die *Kommandozeile* deines Computers. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Also öffne die Konsole, dann fangen wir an.

Wir wollen eine Python Konsole öffnen, also tippe in Windows `python` ein oder in Mac OS/Linux `python3` und drücke `Enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Dein erster Python-Befehl!

Nach Eingabe von python3 in der Konsole ändert sich das Prompt-Zeichen zu `>>>`. Für uns bedeutet das, dass wir ab nun nur noch Python-Code eingeben können. You don't have to type in `>>>` – Python will do that for you.

Wenn du die Python-Konsole wieder verlassen möchtest, gib einfach `exit()` ein oder nutze das Tastatur-Kürzel `Strg + Z` unter Windows bzw. `Strg + D`, wenn du einen Mac hast oder Linux verwendest. Dann bist Du wieder in der normalen Konsole und der Python-Prompt `>>>` ist weg.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3 
5
```

Nice! See how the answer popped out? Python knows math! You could try other commands like:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Spiel ein wenig herum, dann machen wir weiter. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Strings

Strings sind Zeichenketten. Das ist eine Folge von Buchstaben, die von Anführungszeichen umgeben sind. Gib einfach mal deinen Namen ein (bei mir "Ola"):

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Nun hast du deinen ersten String erzeugt! Dies ist eine Folge von Zeichen (also nicht nur Buchstaben, wie ich oben schrieb, sondern Zeichen aller Art), die von einem Computer verarbeitet werden können. Ein String muss stets mit dem gleichen Zeichen beginnen und enden. Dies kann entweder ein einzelnes Gänsefüßchen sein (`'`) oder ein doppeltes (`"`) (da gibt es keinen Unterschied!). Die Anführungszeichen zeigen Python nur an, dass alles innerhalb ein String ist.

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

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Nun fragst du dich sicher, warum du manchmal eine Funktion mit einem `.` am Ende des Strings (wie bei `"Ola".upper()`) schreibst und manchmal eine Funktion direkt aufrufst und den String dahinter in Klammern setzt? Im ersten Fall gehören solche Funktionen, wie `upper()`, zu Objekten (hier: ein String) und funktionieren auch nur bei diesen. In solchen Fällen bezeichnen wir eine Funktion als **Methode**. Andere Funktionen sind dagegen allgemeiner und können auf unterschiedliche Datentypen angewendet werden, wie beispielsweise `len()`. Daher übergeben wir `"Ola"` als Parameter an die `len` Funktion.

### Zusammenfassung

Ok, genug über Strings. Bisher haben wir Folgendes kennengelernt:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Das sind Grundlagen jeder Programmiersprache, die Du lernen wirst. Bist Du bereit für mehr? Bestimmt!

## Fehler

Probieren wir etwas Neues: Errors. Können wir die Länge einer Zahl auf die gleiche Weise ermitteln, wie die Länge eines Namens? Gib dazu `len(304023)` ein und drücke auf Enter:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Ha, unser erster Fehler! Dieser sagt, dass Objekte vom Typ "int" (Integers, das sind ganze Zahlen) keine Länge haben. Was also nun? Vielleicht sollten wir unsere Zahl als String schreiben? Denn bei Strings funktioniert es ja, wie wir wissen.

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ja, das funktioniert! Hier haben wir die `str`-Funktion innerhalb der `len`-Funktion aufgerufen. `str()` konvertiert alles zu einem String.

- Die `str`-Funktion wandelt den übergebenen Wert in einen **String** um
- Die `int`-Funktion wandelt den übergebenen Wert in einen **Integer** um

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variablen

Ein wichtiger Bestandteil beim Programmieren sind Variablen. Eine Variable ist einfach ein Name für etwas, das wir später unter genau diesem Namen wieder verwenden können. Programmiererinnen nutzen Variablen, um Daten zu speichern, den Code lesbar zu halten und um sich nicht immer alles merken zu müssen.

Legen wir eine Variable mit der Bezeichnung `name` an:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Du hast sicher schon bemerkt, dass Python diesmal kein Ergebnis zurückgegeben hat. Woher sollen wir nun wissen, dass es die Variable jetzt auch tatsächlich gibt? Zum Test geben wir `name` ein und drücken wieder auf Enter:

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

Du kannst sie auch in Funktionen verwenden:

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

Was aber, wenn wir für eine Variable den falschen Namen verwenden? Uns einfach vertippen. Hast du schon eine leise Ahnung, was dann passiert? Probieren wir es aus!

{% filename %}command-line{% endfilename %}

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

Außer Strings (Zeichenketten) und Integern (ganze Zahlen) hat Python noch einige andere Arten von Daten-Objekten. Von denen wollen wir uns nun **Listen** anschauen. Listen sind genau das, was du wahrscheinlich schon vermutest: Objekte, welche Listen von anderen Objekten enthalten. :)

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

Diese Anweisung gibt nichts zurück. Was passiert, ist, dass die Reihenfolge der Objekte in der Liste geändert werden. Nun wollen wir die Liste ausgeben um nachzusehen, was geschehen ist:

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

If you want to add something to your list, you can do this by typing this command:

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

Das hat doch super geklappt!

Probier einmal andere Indizes aus: 6, 7, 1000, -1, -6 oder -1000 und versuch dir das Ergebnis vorzustellen, bevor du den jeweiligen Index verwendest. Sind die Ergebnisse sinnvoll?

Eine Liste aller Methoden, die du auf Listen anwenden kannst, findest du in der Python-Dokumentation: https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Und schon hast du ein leeres Dictionary erstellt. Super!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Der key `name` verweist auf den value `'Ola'` (welches ein `string` Objekt ist),
- `country` verweist auf `'Poland'` (ebenfalls ein `string` Objekt),
- und `favorite_numbers` schließlich verweist auf `[7, 42, 92]` (eine `Liste` mit drei Zahlen drin).

Auf die einzelnen Objekte in einem Dictionary kannst du wie folgt zugreifen:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Was aber geschieht, wenn wir Python nach dem Wert eines keys fragen, den es gar nicht gibt? Errätst du es schon? Probieren wir es einfach aus und schauen was passiert!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Ah, wieder ein Fehler! Diesmal ein **KeyError**. Python hilft uns auch hier und sagt uns, dass es den key `'age'` in diesem Dictionary nicht gibt.

Wenn du zwischen Dictionaries und Listen wählen kannst, wann sollte welche Datenstruktur verwendet werden? Das ist eine gute Frage, über die es sich nachzudenken lohnt; und vielleicht möchtest du dies kurz tun, bevor du weiterliest.

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

You can use the `pop()` method to delete an item in the dictionary. Nehmen wir an, du möchtest den Eintrag mit dem key `'favorite_numbers'` entfernen:

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

Großartig! Inzwischen hast du schon einiges über Programmierung gelernt und die folgenden Dinge sind dir vertraut:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Schon gespannt auf den nächsten Teil? :)

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

Womöglich wunderst du dich aber über die beiden `==` Gleichheitszeichen zum Vergleich, ob zwei Zahlen den selben Wert haben? Ein einfaches Gleichheitszeichen `=` verwenden wir bereits, um Werte Variablen zuzuweisen. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Wir können auch festsetellen, ob Werte unterschiedlich sind. Dafür verwenden wir das Symbol `!=`, wie in obigen Beispiel.

Nun noch zwei weitere Vergleiche:

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

Sensationell! Lust auf mehr? Dann probier das:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Du kannst Python beliebig viele Vergleiche vornehmen lassen und wirst ein Ergebnis erhalten. Das ist wirklich cool, oder?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Die Redewendung "Äpfel mit Birnen zu vergleichen" hast du bestimmt schon einmal gehört. Machen wir dies doch einmal in Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Unterschiedliche Dinge, hier die Datentypen Zahlen (`int`) und Strings (`str`), lassen sich auch in Python nicht miteinander vergleichen. In solch einem Fall liefert uns Python einen **TypeError** und sagt uns, dass diese zwei Datentypen nicht miteinander verglichen werden können.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Boolsche Werte können auch mit Variablen bezeichnet werden:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Auch Folgendes geht:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Übe ein wenig, indem du mit Booleans rumspielst, zum Beispiel mit diesen Anweisungen:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Glückwunsch! Booleans sind echt eine der coolsten Features beim Programmieren und du hast gerade gelernt, damit umzugehen!

# Sichern!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Bisher haben wir den Python-Code nur im Interpreter eingegeben, wodurch wir immer nur eine Zeile Code auf einmal ausführen konnten. Richtige Programme dagegen werden in Dateien gespeichert und, je nach Programmiersprache, durch einen **Interpreter** ausgeführt oder durch einen **Compiler** übersetzt. Unseren bisherigen Code haben wir dagegen im Python-**Interpreter** Zeile für Zeile eingegeben und einzeln ausgeführt. Für die nächsten Beispiele brauchen wir mehr als eine Zeile, daher werden wir nun:

- Den Python-Interpreter beenden
- Einen Code-Editor unserer Wahl öffnen
- Code eingeben und diesen in einer Python-Datei sichern
- Und diesen dann laufen lassen!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
```

Nun siehst du wieder den normalen Kommandozeilen-Prompt.

Ein paar Kapitel zuvor hatten wir uns bereits einen [Code-Editor](../code_editor/README.md) ausgesucht. Diesen öffnest du nun und gibst Folgendes ein:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Da du nun schon einige Python-Erfahrung hast, schreibe ein wenig Code mit dem, was du bislang gelernt hast.

Als nächstes wollen wir diesen Code in einer Datei mit einem aussagekräftigen Namen speichern. Lass uns die Datei **python_intro.py** nennen und auf dem Desktop speichern. Wir können der Datei jeden Namen geben, den wir wollen, aber es ist wichtig sicherzustellen, dass die Datei auf **.py** endet. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Dies wird "Syntax Hervorhebung" ("syntax highlighting") genannt und ist ein wirklich sehr nützliches Werkzeug beim Coden. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Dies ist einer der Gründe, warum wir Code-Editoren verwenden. :)

Nun, da die Datei gesichert ist, wollen wir sie ausführen! Mit dem, was du bisher über die Kommandozeile (das mit dem Prompt) gelernt hast, öffnest du die Konsole und gehst in das Desktop-Verzeichnis.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Auf einem Mac sieht das etwa so aus:

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

Kommst du hier nicht weiter, frag jemanden um Hilfe.

Benutze jetzt Python, um den Code in der Datei auszuführen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Prima! Du hast soeben dein erstes Python-Programm aus einer Datei heraus ausgeführt. Großartig, oder?

Nun wollen wir uns einem wichtigen Teil der Programmierung zuwenden:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Nun ändere den Code in deiner **python_intro.py** Datei:

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
    

Python erwartet hier noch weiteren Programmcode, der ausgeführt werden soll, wenn die Bedingung `3 > 2` wahr ist (also `True` ergibt). Lassen wir Python “It works!” ausgeben. Dafür ändere erneut den Code in **python_intro.py**:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Du fragst dich nun, warum wir die angefügte Zeile mit 4 Leerzeichen eingerückt haben? Damit teilen wir Python mit, dass dieser Code ausgeführt werden soll, wenn die vorhergehende Bedingung True ergeben hat. Du könntest auch eine andere Anzahl von Leerzeichen wählen, aber Python-Programmier nutzen einheitlich 4 Leerzeichen, das sieht dann auch gut aus. Ein einzelnes `Tab` wird ebenso als 4 Leerzeichen gewertet.

Nun sichere die Datei und führe sie noch einmal aus:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py 
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Was passiert, wenn eine Bedingung nicht True ist?

In den vorigen Beispielen wurde Code ausgeführt, wenn eine vorhergehende Bedingung True ergab. Aber Python kennt auch `elif` und `else` Anweisungen:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Wenn dies ausgeführt wird, wird es anzeigen:

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

und ausgeführt erhalten wir:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hey Sonja!
    

Hast du bemerkt was passiert ist? `elif` lässt dich zusätzliche Bedingungen hinzufügen, die geprüft werden, falls die vorherige fehlschlägt.

Du kannst so viele `elif` Bedingungen nach der anfänglichen `if` Anweisung hinzufügen, wie du magst. Zum Beispiel:

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

Python läuft durch jeden Test der Reihe nach und gibt dann aus:

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

Und nun zum letzten Kapitel!

## Deine eigenen Funktionen!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Eine Funktion ist eine Folge von Anweisungen, die Python ausführen soll. Jede Funktion beginnt mit dem Keyword (auf deutsch 'Schlüsselwort', aber diese Übersetzung ist nicht gebräuchlich) `def`, gefolgt von einem Funktionsnamen und Parametern. Aber nicht alle Funktionen brauchen Parameter. Let's give it a go. Ändere den Code in der Datei **python_intro.py** wie folgt:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Und schon hast du deine erste Funktion erstellt!

Nun magst du dich fragen, warum wir am Ende der Datei den Namen der Funktion ein weiteres Mal geschrieben haben. Python liest die Datei und führt sie von oben nach unten aus. Um die Funktion also auch zu benutzen, müssen wir sie noch einmal unten hinschreiben.

Schauen wir, was passiert, wenn wir die Datei ausführen:

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

Wie du siehst geben wir der Funktion jetzt einen Parameter, den wir `name` nennen:

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

Denk daran: Die `print` Funktion ist 4 Leerzeichen innerhalb der `if`-Anweisung eingerückt. Das ist sinnvoll, da die Funktion ausgeführt wird, wenn die Bedingung eintritt. Mal sehen, wie das jetzt funktioniert:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Traceback (most recent call last): 
    File "python_intro.py", line 10, in <module>
       hi() 
    TypeError: hi() missing 1 required positional argument: 'name'
    

Hoppla, ein Fehler. Zum Glück gibt uns Python eine recht nützliche Fehlermeldung. Diese besagt, dass die Funktion `hi()` (welche wir definiert haben) ein erforderliches Argument hat (genannt `name`) und dass wir vergessen haben, dieses zu übermitteln, als wir die Funktion aufriefen. Lass uns das am unteren Ende der Datei schnell beheben:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Und wir führen sie erneut aus:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Ola!
    

Und wenn wir den Namen ändern?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Und ausgeführt:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Das ist genial, oder? Auf diese Weise musst du dich nicht jedesmal wiederholen, wenn du den Namen der Person änderst, die die Funktion grüßen soll. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Lass uns den Code aufrufen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Rachel!
    

Herzlichen Glückwunsch! Du hast gerade gelernt, wie du Funktionen schreibst! :)

## Schleifen

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Dies ist bereits der letzte Teil. Das ging doch schnell, oder? :)

Programmierer wiederholen sich nicht gerne. Beim Programmieren geht es darum, Dinge zu automatisieren, so dass wir nicht jede Person mit ihrem Namen manuell grüßen müssen, richtig? Dies ist der Punkt an dem Schleifen nützlich werden.

Erinnerst du dich noch an Listen? Lass uns eine Liste mit Mädchennamen erstellen:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Wir wollen alle mit ihrem Namen grüßen. Wir besitzen bereits die `hi`-Funktion, um dies zu tun, also lass sie uns in einer Schleife verwenden:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Hier ist der vollständige Code für die Datei:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Und wenn wir es ausführen:

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
    

Wie du sehen kannst, wird alles, was du innerhalb einer `for`-Anweisung eingerückt hast, für jedes Element der Liste `girls` wiederholt.

Du kannst auch `for` auf Nummern beziehen, wenn du die `range`-Funktion benutzt:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
     print(i)
```

Das würde ausgeben:

{% filename %}command-line{% endfilename %}

    1 
    2 
    3 
    4 
    5
    

`range` ist eine Funktion, die eine Liste von Nummern (eine nach der anderen) erschafft (die Nummern werden von dir als Parameter bereitgestellt).

Merk dir, dass die zweite dieser Nummern, die du als Parameter übergibst, nicht in der Liste enthalten ist, die von Python ausgegeben wird (das bedeutet, dass `range(1, 6)` von 1 bis 5 zählt, aber nicht die Nummer 6 enthält). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Zusammenfassung

Das ist alles. **You totally rock!** Das war ein heikles Kapitel, darum kannst du jetzt stolz auf dich sein. Wir sind definitiv stolz auf dich, dass du es so weit geschafft hast!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)