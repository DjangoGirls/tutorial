{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Einführung in Python

> Ein Teil dieses Kapitels basiert auf dem Tutorial der Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Fangen wir an, schreiben wir Code!

## Der Python-Prompt

> Für Leserinnen, die sich bereits mit Python auskennen: Dieser Teil befindet sich im [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) Video.

Um Python zu starten, musst du an die *Kommandozeile* deines Computers. Wie das geht, weißt du bereits - denn du hast es im Kapitel [Einführung in die Kommandozeile](../intro_to_command_line/README.md) gelernt.

Also öffne die Konsole, dann fangen wir an.

Wir wollen eine Python Konsole öffnen, also tippe unter Windows `python` oder im Mac OS/Linux Terminal `python3` und drücke `Enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Dein erster Python-Befehl!

Nach Eingabe von python3 in der Konsole ändert sich das Prompt-Zeichen zu `>>>`. Für uns bedeutet das, dass wir ab nun nur noch Python-Code eingeben können. Den Python-Prompt `>>>` musst du nicht jedesmal eingeben - dies macht Python für dich.

Wenn du die Python-Konsole wieder verlassen möchtest, gib `exit()` ein oder nutze das Tastatur-Kürzel `Strg + Z` unter Windows bzw. `Strg + D`, wenn du einen Mac hast oder Linux verwendest. Dann bist du wieder in der normalen Konsole und der Python-Prompt `>>>` ist weg.

Fürs Erste bleiben wir in der Python Konsole, wir wollen mehr darüber lernen. Lass uns mit ein wenig Mathematik anfangen, gib `2 + 3` ein und drück `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3 
5
```

Cool! Schon ist das Ergebnis da. Python kann rechnen! Probier einfach einige andere Befehle aus, wie z.B.: 

- `4 * 5`
- `5 - 1`
- `40 / 2`

Um Potenzen zu berechnen, sagen wir 2 hoch 3, müssen wir Folgendes eingeben: {% filename %}command-line{% endfilename %}

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

Nun hast du deinen ersten String erzeugt! Dies ist eine Folge von Zeichen (also nicht nur Buchstaben, wie ich oben schrieb, sondern Zeichen aller Art), die von einem Computer verarbeitet werden können. Ein String muss stets mit dem gleichen Zeichen beginnen und enden. Dies kann entweder ein einzelnes Gänsefüßchen sein (`'`) oder ein doppeltes (`"`), da gibt es keinen Unterschied! Die Anführungszeichen zeigen Python nur an, dass alles dazwischen ein String ist.

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

Brauchst du einen Apostroph in einem String, so hast du zwei Möglichkeiten.

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

Toll, was? Um deinen Namen in Großbuchstaben anzuzeigen, gib Folgendes ein:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Hier hast du die `upper`-**Methode** auf den String angewendet! Eine Methode (wie `upper()`) ist eine Abfolge von Anweisungen, die Python für ein gegebenes Objekt (hier `"Ola"`) ausführt, wenn sie aufgerufen wird.

Nehmen wir an, du möchtest die Zahl der Buchstaben in deinem Namen wissen. Auch dafür gibt es eine **Funktion**!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Nun fragst du dich sicher, warum du manchmal eine Methode mit einem `.` am Ende des Strings (wie bei `"Ola".upper()`) schreibst und manchmal eine Funktion direkt aufrufst und den String dahinter in Klammern setzt? Im ersten Fall gehören solche Methoden, wie `upper()`, zu Objekten (hier: ein String) und funktionieren auch nur bei diesen. In solchen Fällen bezeichnen wir eine Funktion als **Methode**. Andere Funktionen sind dagegen allgemeiner und können auf unterschiedliche Datentypen angewendet werden, wie beispielsweise `len()`. Daher übergeben wir `"Ola"` als Parameter an die `len` Funktion.

### Zusammenfassung

Ok, genug über Strings. Bisher haben wir Folgendes kennengelernt:

- **Der Prompt** - Wenn wir beim Python-Prompt Anweisungen (oder Programm-Code) in Python eingeben, dann erhalten wir auch Ergebnisse in Python. Man sagt zu dieser Python-Umgebung auch "Python-Shell".
- **Zahlen und Strings** - In Python nutzen wir Zahlen für Berechnungen und Strings für Text-Objekte.
- **Operatoren**, wie + und &#42;, verarbeiten mehrere Werte und erzeugen als Ergebnis einen neuen Wert.
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

Wir haben unsere erste Fehlermeldung (Error) erhalten! Mit dem Icon {{ warning_icon }} teilen wir dir in diesem Tutorial jeweils mit, dass der einzugebende Code nicht wie erwartet funktionieren wird. Fehler zu machen (selbst absichtlich) ist ein wesentlicher Teil beim Lernen!

Unser erster Fehler sagt, dass Objekte vom Typ "int" (Integers, das sind ganze Zahlen) keine Länge haben. Was also nun? Vielleicht sollten wir unsere Zahl als String schreiben? Denn bei Strings funktioniert es ja, wie wir wissen.

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ja, das funktioniert! Hier haben wir die `str`-Funktion innerhalb der Funktion `len` aufgerufen. `str()` konvertiert alles zu einem String.

- Die `str`-Funktion wandelt den übergebenen Wert in einen **String** um.
- Die `int`-Funktion wandelt den übergebenen Wert in einen **Integer** um.

> Wichtig: Zwar können wir Zahlen in Text umwandeln, aber nicht immer auch Text in Zahlen - was beispielsweise sollte `int('hello')` ergeben?

## Variablen

Ein wichtiger Bestandteil beim Programmieren sind Variablen. Eine Variable ist einfach ein Name für etwas, das wir später unter genau diesem Namen wieder verwenden können. Programmiererinnen nutzen Variablen, um Daten zu speichern, den Code lesbar zu halten und um sich nicht immer alles merken zu müssen.

Lass uns eine Variable mit der Bezeichnung `name` anlegen:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Wir geben ein: name ist gleich "Ola".

Du hast sicher schon bemerkt, dass Python diesmal kein Ergebnis zurückgegeben hat. Woher sollen wir nun wissen, dass es die Variable jetzt auch tatsächlich gibt? Gib `name` ein und drücke wieder auf `Enter`:

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

Das ist toll, oder? Variablen können alles enthalten, also auch Zahlen. Versuche Folgendes:

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

Diese Anweisung gibt nichts zurück, sie hat aber die Reihenfolge der Objekte in der Liste geändert. Um zu sehen, was passiert ist, müssen wir die Liste ausgeben:

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

Wie du siehst, kannst du auf die einzelnen Objekte in deiner Liste zugreifen, indem du den Namen der Liste verwendest und anschließend den Index in eckigen Klammern anfügst.

Um etwas aus deiner Liste zu löschen, musst du die **Indizes** wie gerade gelernt benutzen und die `pop()`-Methode. Lass uns ein Beispiel versuchen und das festigen, was wir zuvor gelernt haben; wir werden die erste Nummer aus unserer Liste löschen.

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

Du hast nun soeben die Variable mit dem Namen `participant` angelegt, die ein Dictionary mit drei key-value Paaren enthält (values, also Werte, sind die Objekte in einem Dictionary, - aber auch hier bleiben wir beim englischen Begriff):

- Der key `name` verweist auf den value `'Ola'` (welches ein `string` Objekt ist),
- `country` verweist auf `'Poland'` (ebenfalls ein `string` Objekt),
- und `favorite_numbers` schließlich verweist auf `[7, 42, 92]` (eine `Liste` mit drei Zahlen).

Auf die einzelnen Objekte in einem Dictionary kannst du wie folgt zugreifen:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Also ganz ähnlich wie bei einer Liste. Aber statt dir einen Index merken zu müssen, benutzt du bei einem Dictionary einfach einen key (hier: den String 'name').

Was aber geschieht, wenn wir Python nach dem Wert eines keys fragen, den es gar nicht gibt? Errätst du es schon? Probieren wir es einfach aus und schauen was passiert!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Ah, wieder ein Fehler! Diesmal ein **KeyError**. Python hilft uns auch hier und sagt uns, dass es den key `'age'` in diesem Dictionary gar nicht gibt.

Wenn du zwischen Dictionaries und Listen wählen kannst, wann sollte welche Datenstruktur verwendet werden? Das ist eine gute Frage, über die es sich nachzudenken lohnt; und vielleicht möchtest du dies kurz tun, bevor du weiterliest.

- Du brauchst nur eine geordnete Folge von Elementen? Dann wähle eine Liste.
- Du brauchst eine Sammlung von Elementen, auf die du später einzeln, gezielt und effizient mit Hilfe eines Namens (d.h. keys) zugreifen kannst? Dann wähle ein Dictionary.

Dictionaries sind, so wie auch Listen, *mutable*, d. h. nachträglich veränderbar. So kannst du bei Dictionaries später noch weitere key-value Paare hinzufügen:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Wie bei Listen können wir auch bei Dictionaries die `len()`-Funktion verwenden, um die Zahl der enthaltenen Einträge (das sind die key-value Paare) zu ermitteln. Probier es gleich aus und tippe dieses Kommando ein:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Wir hoffen, dass das Alles für dich bisher Sinn ergibt. :) Bist du bereit für mehr Spaß mit Dictionaries? Machen wir weiter.

Zum Löschen von Elementen kannst du den `pop()`-Befehl verwenden. Nehmen wir an, du möchtest den Eintrag mit dem key `'favorite_numbers'` entfernen, dann tippe:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Wie du an der Ausgabe erkennst, ist nun das key-value Paar von 'favorite_numbers' gelöscht.

Ebenso kannst du auch den Wert eines bestehenden Eintrages ändern:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Wie du siehst, hast du nun im key-value Paar mit dem key `'country'` den Wert von `'Poland'` nach `'Germany'` geändert. :) Hurra! Schon wieder was gelernt.

### Zusammenfassung

Großartig! Inzwischen hast du schon einiges über Programmierung gelernt und die folgenden Dinge sind dir vertraut:

- **Errors** - Du weißt, wie sie zu lesen sind und dass Python sie dann ausgibt, wenn es eine Anweisung von dir nicht ausführen kann.
- **Variablen** - sind Namen für Objekte, die dir dabei helfen, deinen Code leichter zu schreiben und ihn dabei auch gut lesbar zu halten.
- **Listen** - können Objekte in einer geordneten Reihenfolge speichern.
- **Dictionaries** - speichern Objekte als key-value Paare.

Schon gespannt auf den nächsten Teil? :)

## Vergleichen

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) behandelt.

Ein großer Teil beim Programmieren besteht darin, Dinge zu vergleichen. Was lässt sich am besten vergleichen? Zahlen! Schauen wir uns mal an, wie das funktioniert:

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

Hier haben wir Python einige Zahlen zum Vergleichen gegeben. Wie du siehst, kann Python nicht nur die Zahlen vergleichen, sondern auch die Ergebnisse von Berechnungen. Cool, nicht wahr?

Womöglich wunderst du dich aber über die beiden `==` Gleichheitszeichen zum Vergleich, ob zwei Zahlen den selben Wert haben? Ein einfaches Gleichheitszeichen `=` verwenden wir bereits, um Variablen bestimmte Werte zuzuweisen. Da beim Programmieren alle Anweisungen eindeutig sein müssen, benötigst du in Python daher **stets** zwei `==` Zeichen, um Dinge auf Gleichheit zu testen. Wir können auch feststellen, ob Werte unterschiedlich sind. Dafür verwenden wir das Symbol `!=`, wie im obigen Beispiel.

Nun noch zwei weitere Vergleiche:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` und `<` sind klar, was aber sollen `>=` und `<=` bedeuten? Vergleiche liest du folgendermaßen:

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

- **and** - wenn Du den `and`-Operator verwendest, müssen beide Vergleiche True (d.h. wahr) ergeben, damit das Gesamtergebnis auch True ist
- **or** - wenn Du den `or`-Operator verwendest, genügt es, wenn einer der beiden Vergleiche True ergibt, damit das Gesamtergebnis True ergibt

Die Redewendung "Äpfel mit Birnen zu vergleichen" hast du bestimmt schon einmal gehört. Machen wir dies doch einmal in Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Unterschiedliche Dinge, hier die Datentypen Zahlen (`int`) und Strings (`str`), lassen sich auch in Python nicht miteinander vergleichen. In solch einem Fall liefert uns Python einen **TypeError** und sagt uns, dass diese zwei Datentypen nicht miteinander verglichen werden können.

## Boolean

Du hast gerade einen neuen Typ von Python-Objekten kennen gelernt. Er heisst **Boolean**.

Es gibt zwei Boolean-Objekte:

- True (wahr)
- False (falsch)

Damit Python diese beiden Werte versteht, musst du sie auch genau so schreiben (den ersten Buchstaben groß, alle weiteren klein). **true, TRUE und tRUE funktionieren nicht – nur True ist korrekt.** (Dasselbe gilt auch für False.)

Auch Booleans können Variablen zugewiesen werden:

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

# Speicher es!

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) behandelt.

Bisher haben wir den Python-Code nur im Interpreter eingegeben, wodurch wir immer nur eine Zeile Code auf einmal ausführen konnten. Richtige Programme dagegen werden in Dateien gespeichert und, je nach Programmiersprache, durch einen **Interpreter** ausgeführt oder durch einen **Compiler** übersetzt. Unseren bisherigen Code haben wir dagegen im Python-**Interpreter** Zeile für Zeile eingegeben und einzeln ausgeführt. Für die nächsten Beispiele brauchen wir mehr als eine Zeile, daher werden wir nun:

- Den Python-Interpreter beenden
- Einen Code-Editor unserer Wahl öffnen
- Code eingeben und diesen in einer Python-Datei sichern
- Und diesen dann laufen lassen!

Um den Python-Interpreter zu beenden, nutze die `exit()`-Funktion

{% filename %}command-line{% endfilename %}

```python
>>> exit()
```

Nun siehst du wieder den normalen Kommandozeilen-Prompt.

Im Kapitel [Code-Editor](../code_editor/README.md) haben wir uns bereits einen Code-Editor ausgesucht. Nun öffnen wir den Code-Editor und schreiben folgenden Code in eine neue Datei (wenn du ein Chromebook benutzt, dann erstelle eine neue Datei in der Cloud-IDE, öffne sie und du befindest dich automatisch im integrierten Code-Editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Da du nun schon einige Python-Erfahrung hast, schreibe ein wenig Code mit dem, was du bislang gelernt hast.

Als nächstes wollen wir diesen Code in einer Datei mit einem aussagekräftigen Namen speichern. Lass uns die Datei **python_intro.py** nennen und auf dem Desktop speichern. Wir können der Datei jeden Namen geben, den wir wollen, aber es ist wichtig sicherzustellen, dass der Dateiname auf **.py** endet. Die Erweiterung **.py** gibt unserem Betriebssystem an, dass dies ein **Python executable file** ist und Python diese ausführen kann.

> **Hinweis:** Du wirst eines der coolsten Eigenschaften von Code-Editoren bemerken: Farben! In der Python-Konsole hatte alles die gleiche Farbe. Der Code-Editor dagegen sollte dir nun die `print`-Funktion in einer anderen Farbe anzeigen als der von ihr auszugebende Text. Dies wird "Syntax Hervorhebung" ("syntax highlighting") genannt und ist ein wirklich sehr nützliches Werkzeug beim Programmieren. Die Farbe von Dingen gibt dir Hinweise auf z.B. nicht geschlossene Zeichenfolgen oder Tippfehler in einem Schlüsselwort (wie das `def` in einer Funktion, das wir weiter unten sehen werden). Dies ist einer der Gründe, warum wir Code-Editoren verwenden. :)

Nun, da die Datei gesichert ist, wollen wir sie ausführen! Nutze, was du bisher über die Kommandozeile (das mit dem Prompt) gelernt hast, um in der Konsole in das Desktop-Verzeichnis zu wechseln.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Auf einem Mac sieht das etwa so aus:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Unter Linux ist es ähnlich:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Denk daran, dass das "Desktop"-Verzeichnis bei dir "Schreibtisch" heißen kann.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

In der Eingabeaufforderung von Windows wird's so sein:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Und in der Powershell von Windows so:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Wenn du nicht weiterkommst, frag' um Hilfe. Denn genau dafür sind die Coaches da!

Benutze jetzt Python, um den Code in der Datei auszuführen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hello, Django girls!
    

Hinweis: Unter Windows gibt es den 'python3'-Befehl nicht. Verwende stattdessen 'python', um die Datei auszuführen:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Prima! Du hast soeben dein erstes Python-Programm aus einer Datei heraus ausgeführt. Großartig, oder?

Nun wollen wir uns einem wichtigen Teil der Programmierung zuwenden:

## Wenn ... sonst-wenn ... sonst (If … elif … else)

Oft sollen manche Programmteile nur ausgeführt werden, wenn bestimmte Vorbedingungen erfüllt sind. Dafür gibt es in Python sogenannte **if-Anweisungen**.

Nun ändere den Code in deiner **python_intro.py** Datei:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Würden wir das nun speichern und anschließend ausführen, würden wir einen Fehler erhalten:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python erwartet hier noch weiteren Programmcode, der ausgeführt werden soll, wenn die Bedingung `3 > 2` wahr ist (also `True` ergibt). Versuchen wir, Python “It works!” ausgeben zu lassen. Ändere den Code in **python_intro.py** zu:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Du fragst dich nun, warum wir die angefügte Zeile mit 4 Leerzeichen eingerückt haben? Damit teilen wir Python mit, dass dieser Code ausgeführt werden soll, wenn die vorhergehende Bedingung True ergeben hat. Du könntest auch eine andere Anzahl von Leerzeichen wählen, aber fast alle Python-Programmier nutzen 4 Leerzeichen, damit's gut aussieht. Ein einfaches Tab zählt auch wie 4 Leerzeichen, sofern dies in deinem Editor so eingestellt ist. Wenn du dich einmal entschieden hast, bleib dabei! Wenn du mit 4 Leerzeichen angefangen hast, solltest du alle weiteren Einrückungen auch mit 4 Leerzeichen machen, anderweitig könnte das Probleme verursachen.

Nun sichere die Datei und führe sie noch einmal aus:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py 
It works!
```

Hinweis: Denk daran, dass Windows den 'python3'-Befehl nicht kennt. Falls du auf Windows arbeitest, verwende ab jetzt immer 'python', wenn in dieser Anleitung 'python3' steht.

### Was passiert, wenn eine Bedingung nicht wahr (not True) ist?

In den vorigen Beispielen wurde Code ausgeführt, wenn eine vorhergehende Bedingung True (wahr) ergab. Aber Python kennt auch `elif`- und `else`-Anweisungen:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 ist wirklich größer als 2')
else:
    print('5 ist nicht größer als 2')
```

Wenn dies ausgeführt wird, wird es anzeigen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    5 ist wirklich größer als 2
    

Wenn 2 größer als 5 wäre, würde die zweite Anweisung (die nach dem else) ausgeführt. Schauen wir uns nun an, wie `elif` funktioniert:

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
    

Hast du bemerkt, was passiert ist? `elif` lässt dich zusätzliche Bedingungen hinzufügen, die geprüft werden, falls die vorherige fehlschlägt.

Du kannst so viele `elif`-Bedingungen nach der anfänglichen `if`-Anweisung hinzufügen, wie du magst. Zum Beispiel:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57  # "volume" ist Englisch für "Lautstärke"
if volume < 20:
    print("Das ist etwas leise.")
elif 20 <= volume < 40:
    print("Das ist gut für Hintergrund-Musik.")
elif 40 <= volume < 60:
    print("Perfekt, ich kann alle Details hören.")
elif 60 <= volume < 80:
    print("Gut für Partys.")
elif 80 <= volume < 100:
    print("Etwas laut!")
else:
    print("Mir tun die Ohren weh! :(")
```

Python läuft durch jeden Test der Reihe nach und gibt dann aus:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Perfekt, ich kann alle Details hören.
    

## Kommentare

Kommentare sind Zeilen, die mit `#` beginnen. Du kannst nach dem `#` schreiben, was auch immer du willst, und Python wird es ignorieren. Kommentare können deinen Code für andere Leute einfacher zu verstehen machen.

Schauen wir, wie das aussieht:

{% filename %}python_intro.py{% endfilename %}

```python
# Ändert die Lautstärke, wenn sie zu leise oder zu laut ist
if volume < 20 or volume > 80:
    volume = 50
    print("So ist's besser!")
```

Du musst nicht für jede Codezeile einen Kommentar schreiben, aber Kommentare sind nützlich um zu erklären, wieso dein Code etwas macht, oder um zusammenzufassen, wenn er etwas Komplexes tut.

### Zusammenfassung

In den letzten paar Übungen hast du gelernt:

- **Vergleiche vorzunehmen** – in Python kannst du Vergleiche mit den folgenden Operatoren `>`, `>=`, `==`, `<=`, `<` sowie `and` und `or` vornehmen
- **Boolsche Datentypen** zu verwenden – dies sind Objekte, die nur zwei Werte annehmen können: `True` bzw. `False`
- **Dateien zu speichern** – also Programmcode in Dateien abzulegen, so dass du auch umfangreichere Programme schreiben kannst.
- **if … elif … else** – Anweisungen, die dir erlauben, bestimmte Programmteile nur auszuführen, wenn bestimmte Bedingungen erfüllt sind.
- **Kommentare** – Zeilen, die Python nicht ausführt und die dir ermöglichen deinen Code zu dokumentieren

Zeit für den letzten Teil dieses Kapitels!

## Deine eigenen Funktionen!

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) behandelt.

Erinnerst du dich an Funktionen wie `len()`, die du in Python aufrufen kannst? Prima! Du wirst nun lernen, eigene Funktionen zu schreiben!

Eine Funktion ist eine Folge von Anweisungen, die Python ausführen soll. Jede Funktions-Definition beginnt mit dem Schlüsselwort (engl. "Keyword") `def`, bekommt einen Namen und kann Argumente (manchmal auch "Parameter" genannt) haben. Probieren wir's aus! Ersetze den Code in der Datei **python_intro.py** mit dem folgenden:

{% filename %}python_intro.py{% endfilename %}

```python
def hallo():
    print("Halli-hallo!")
    print("Wie geht's?")

hallo()
```

Und schon hast du deine erste Funktion erstellt!

Nun fragst du dich vielleicht, warum wir am Ende der Datei den Namen der Funktion nochmal hingeschrieben haben. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

Schauen wir, was passiert, wenn wir die Datei ausführen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Halli-hallo!
    Wie geht's?
    

Falls das nicht funktionert hat, keine Panik! Die Ausgabe wird dir dabei helfen, herauszufinden wieso:

- Wenn du einen `NameError` erhältst, hast du dich vermutlich irgendwo im Code vertippt. Prüfe also, ob du bei der Funktionsdefinition `def hallo():` und beim Funktionsaufruf `hallo()` den Funktionsnamen gleich geschrieben hast.
- Wenn du einen `IndentationError` bekommst, prüfe, ob beide `print`-Zeilen die gleichen Whitespaces am Zeilenanfang haben: Python will den ganzen Code in einer Funktion hübsch ausgerichtet haben.
- Wenn du gar keine Ausgabe erhältst, stelle sicher, dass `hallo()` am Datei-Ende *nicht* eingerückt ist. Wenn es eingerückt ist, ist dieser Aufruf selbst Teil der Funktion und sie wird gar nicht ausgeführt.

Als Nächstes bauen wir Funktionen mit sogenannten Argumenten. Wir werden das gerade gebaute Beispiel benutzen – eine Funktion, die die ausführende Person begrüßt – aber diesmal mit Namen:

{% filename %}python_intro.py{% endfilename %}

```python
def hallo(name):
```

Wie du siehst, geben wir der Funktion jetzt einen Parameter, den wir `name` nennen:

{% filename %}python_intro.py{% endfilename %}

```python
def hallo(name):
    if name == 'Ola':
        print('Hallo Ola!')
    elif name == 'Sonja':
        print('Hallo Sonja!')
    else:
        print('Hallo Unbekannte(r)!')

hallo()
```

Denk daran: Die `print`-Funktion ist 4 Leerzeichen innerhalb der `if`-Anweisung eingerückt. Das ist sinnvoll, da die Funktion ausgeführt wird, wenn die Bedingung eintritt. Mal sehen, wie das jetzt funktioniert:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py 
    Traceback (most recent call last): 
    File "python_intro.py", line 10, in <module>
       hallo() 
    TypeError: hallo() missing 1 required positional argument: 'name'
    

Hoppla, ein Fehler. Zum Glück gibt uns Python eine recht nützliche Fehlermeldung. Diese besagt, dass die Funktion `hallo()` (welche wir definiert haben) ein erforderliches Argument (namens `name`) hat und dass wir vergessen haben, dieses beim Funktionsaufruf mitzugeben. Lass uns das am unteren Ende der Datei schnell beheben:

{% filename %}python_intro.py{% endfilename %}

```python
hallo("Ola")
```

Und wir führen sie erneut aus:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hallo Ola!
    

Und wenn wir den Namen ändern?

{% filename %}python_intro.py{% endfilename %}

```python
hallo("Sonja")
```

Und ausgeführt:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hallo Sonja!
    

Nun, was denkst du, wird passieren, wenn du einen anderen Namen dort hinein schreibst? (Weder Ola noch Sonja.) Probier es aus und schau, ob du richtig liegst. Es sollte das Folgende herauskommen:

{% filename %}command-line{% endfilename %}

    Hallo Unbekannte(r)!
    

Das ist genial, oder? Auf diese Weise musst du dich nicht jedesmal wiederholen, wenn du den Namen der Person änderst, die die Funktion grüßen soll. Und das ist genau der Grund, warum wir Funktionen brauchen – du willst auf keinem Fall deinen Code wiederholen!

Lass uns noch etwas Schlaueres probieren – es gibt schließlich mehr als zwei Namen und für jeden eine eigene Bedingung aufzuschreiben, wäre ziemlich aufwendig, oder? Ersetze also deinen Code in der Datei durch den folgenden:

{% filename %}python_intro.py{% endfilename %}

```python
def hallo(name):
    print('Hallo ' + name + '!')

hallo("Rachel")
```

Lass uns den Code aufrufen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hallo Rachel!
    

Herzlichen Glückwunsch! Du hast gerade gelernt, wie du Funktionen schreibst! :)

## Schleifen

> Für die Leser zu Hause: Dieses Kapitel wird im Video [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) behandelt.

Dies ist bereits der letzte Teil. Das ging doch schnell, oder? :)

Programmierer wiederholen sich nicht gerne. Beim Programmieren geht es darum, Dinge zu automatisieren. Wir wollen also nicht jede Person mit ihrem Namen manuell grüßen müssen, oder? Für so etwas kommen Schleifen gelegen.

Erinnerst du dich noch an Listen? Lass uns eine Liste mit Mädchennamen erstellen:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Wir wollen alle mit ihrem Namen grüßen. Wir besitzen bereits die `hallo`-Funktion, um dies zu tun, also lass sie uns in einer Schleife verwenden:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

Die `for`-Anweisung verhält sich ähnlich wie die `if`-Anweisung; Code unter beiden muss 4 Leerzeichen eingerückt werden.

Hier ist der vollständige Code für die Datei:

{% filename %}python_intro.py{% endfilename %}

```python
def hallo(name):
    print('Hallo ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'du']
for name in girls:
    hallo(name)
    print('Nächstes Mädchen')
```

Und wenn wir es ausführen:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hallo Rachel!
    Nächstes Mädchen
    Hallo Monica!
    Nächstes Mädchen
    Hallo Phoebe!
    Nächstes Mädchen
    Hallo Ola!
    Nächstes Mädchen
    Hallo du!
    Nächstes Mädchen
    

Wie du sehen kannst, wird alles, was du innerhalb einer `for`-Anweisung eingerückt hast, für jedes Element der Liste `girls` wiederholt.

Du kannst auch `for` auf Ganzzahlen beziehen, wenn du die `range`-Funktion benutzt:

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
    

`range` ist eine Funktion, die eine Liste von aufeinander folgenden Zahlen erschafft (die Randwerte werden von dir als Argumente bereitgestellt).

Beachte, dass der zweite der Werte, die du als Argumente übergibst, nicht in der Liste enthalten ist, die von Python ausgegeben wird. (Das bedeutet, dass `range(1, 6)` von 1 bis 5 zählt, aber nicht die Zahl 6 enthält). Das liegt daran, dass "range" halboffen ist, was wiederum bedeutet, dass es den ersten Wert enthält, aber nicht den letzten.

## Zusammenfassung

Das ist alles. **Du rockst total!** Das war ein kniffliges Kapitel, du darfst also ruhig stolz auf dich sein. Wir sind definitiv stolz auf dich und darauf, dass du es so weit geschafft hast!

Besuche https://docs.python.org/3/tutorial/ , wenn du zum offiziellen und vollständigen Python-Tutorial willst. Dort gibt's (bislang jedoch noch nicht auf Deutsch) eine gründlichere und umfassendere Einführung in diese Programmiersprache. :)

Bevor du zum nächsten Kapitel übergehst, mach kurz 'was anderes – streck dich, lauf etwas 'rum, ruh' deine Augen aus. :)

![Cupcake](images/cupcake.png)