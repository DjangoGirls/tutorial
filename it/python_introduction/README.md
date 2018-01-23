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

Dopo aver eseguito il comando Python, il prompt è cambiato in `>>>`. Significa che per ora dovremmo utilizzare comandi nel linguaggio Python. You don't have to type in `>>>` – Python will do that for you.

Se ad un certo punto vuoi uscire dalla console di Python, digita `exit()` oppure usa la scorciatoia `Ctrl + Z` per Windows e `Ctrl + D` per Mac/Linux. Allora non vedrai più `>>>`.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Bello! Hai visto come le risposte spuntano fuori? Python conosce la matematica! Prova altri comandi come:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Divertiti con questo per un pò e dopo torna qui. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

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
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

o facendo l'escape dell'apostrofo (cioè trattandolo come un carattere qualunque) con una barra rovesciata (``):

{% filename %}command-line{% endfilename %}

```python
>>> "Correre"\"giù dalla collina"
"Correre giù dalla collina"
```

Bello, eh? Per vedere il tuo nome in maiuscolo, digita:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Hai appena usato il **metodo** `upper` sulla tua stringa! Un metodo (come `upper()`) è una sequenza di istruzioni che Python deve compiere su un oggetto dato (`"Ola"`) ogni volta che viene chiamato.

Se vuoi sapere quante il numero di lettere del tuo nome, c'è una **funzione** anche per quello!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Ti stai chiedendo perché certe volte chiami una funzione con un `.` alla fine di una stringa (come `"Ola".upper()`) ed in altri casi chiami prima una funzione e poi metti la stringa tra parentesi? Beh, in alcuni casi, le funzioni appartengono ad oggetti, come `upper()`, che può essere eseguita solo su stringhe. In questo caso, chiamiamo la funzione **metodo**. Altre volte, le funzioni non appartengono a niente di specifico e possono essere utilizzate su diversi tipi di oggetti, proprio come `len()`. Ecco perché stiamo dando `"Ola"` come un parametro alla funzione `len`.

### Indice

OK, basta con le stringhe. Ecco fino ad ora quanto hai imparato:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Queste sono le basi di ogni linguaggio di programmazione che impari. Pronta per qualcosa di più complicato? Scommetto che lo sei!

## Errori

Proviamo qualcosa di nuovo. Possiamo ottenere la lunghezza di un numero nella stessa forma in cui abbiamo potuto scoprire la lunghezza del nostro nome? Digita `len(304023)` e premi `Invio`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Abbiamo ottenuto il nostro primo errore! Ci dice che gli oggetti di tipo "int" (integers, numeri interi) non hanno lunghezza. Quindi cosa possiamo fare? Forse possiamo scrivere il nostro numero come una stringa? Le stringhe hanno una lunghezza, vero?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ha funzionato! Usiamo la funzione `str` all'interno della funzione `len`. `str()` converte tutto in stringhe.

- La funzione `str` converte le cose in **stringhe**
- La funzione `int` converte le cose in **numeri interi**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variabili

Un concetto importante nella programmazione è quello delle variabili. Una variabile è un nome per un qualcosa che deve essere utilizzato sucessivamente. I programmatori usano queste variabili per archiviare dati, rendere il loro codice più leggibile e per non dover tenere a mente cosa sono queste cose.

Diciamo che vogliamo creare una nuova variabile chiamata `nome`:

{% filename %}command-line{% endfilename %}

```python
>>> nome = "Ola"
```

We type name equals Ola.

Come avrai notato, il programma non ha ritornato nulla, diversamente da prima. Quindi come facciamo a sapere che la variabile esiste? Digita `name` e premi `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> nome
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

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

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ma cosa succede se utilizziamo il nome sbagliato? Riesci a immaginare cosa succederebbe? Proviamo!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Un errore! Come puoi vedere, Python ha diversi tipi di errori e questo qui si chiama **NameError**. Python ti darà questo errore se provi ad utilizzare una variabile che non è stata ancora definita. Se incontri questo errore più tardi, controlla il tuo codice per vedere se hai digitato in modo errato i nomi.

Giocaci per un po' e vedi cosa puoi fare!

## La funzione print

Prova questo:

{% filename %}command-line{% endfilename %}

```python
>>> nome = 'Maria'
>>> nome
'Maria'
>>> print(name)
Maria
```

Quando digiti `name`, l'interprete di Python risponde con una stringa *rappresentazione* della variabile 'nome', che contiene le lettere M-a-r-i-a, circondate da singole virgolette, ''. Quando dici `print(nome)`, Python "stamperà" i contenuti della variabile sullo schermo, senza le virgolette, che è più pulito.

Come vedremo dopo, `print()` è anche utile quando vogliamo stampare le cose dall'interno delle funzioni, oppure quando vogliamo stampare le cose in molteplici righe.

## Liste

Oltre alle stringhe ed ai numeri interi, Python ha tanti tipi di oggetti. Ora ne introdurremo uno chiamato **lista**. Le liste sono fatte proprio come immagini: sono oggetti che sono liste di altri oggetti. :)

Vai avanti e crea una lista:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Si, questa lista è vuota. Non serve a molto, giusto? Creiamo una lista di numeri della lotteria. Non vogliamo ripetere tutto ogni volta, quindi metteremo la lista in una variabile:

{% filename %}command-line{% endfilename %}

```python
>>> lotteria = [3, 42, 12, 19, 30, 59]
```

Abbiamo una lista! Cosa possiamo farne? Vediamo quanti numeri della lotteria ci sono nella lista. Hai idea di quale funzione potresti utilizzare per farlo? Lo abbiamo imparato insieme prima!

{% filename %}command-line{% endfilename %}

```python
>>> len(lotteria)
8
```

Si! `len()` può darti il numero di oggetti in una lista. Utile, vero? Forse abbiamo risolto:

{% filename %}command-line{% endfilename %}

```python
>>> lotteria.sort()
```

Questo comando non dà nessun risultato, ha semplicemente cambiato l'ordine in cui i numeri appaiono nella lista. Stampiamo di nuovo la lista per vedere cosa è successo:

{% filename %}command-line{% endfilename %}

```python
>>> print(lotteria)
[3, 12, 19, 30, 42, 59]
```

Come puoi vedere, adesso i numeri nella tua lista sono ordinati dal valore più basso a quello più alto. Congratulazioni!

Vogliamo invertire quell'ordine? Facciamolo!

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

Se vuoi mostrare solo il primo numero, puoi farlo usando gli **indici**. L'indice è il numero che dice la posizione esatta dell'elemento all'interno di una lista. I programmatori preferiscono iniziare a contare da 0, quindi il primo oggetto nella lista è all'indice 0, il successivo all'1, e così via. Prova questo:

{% filename %}command-line{% endfilename %}

```python
>>> print(lotteria[0])
59
>>> print(lotteria[1])
42
```

Come puoi vedere, puoi accedere a diversi oggetti nella tua lista usando il nome della lista e l'indice dell'oggetto all'interno delle parentesi quadre.

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

Ha funzionato a meraviglia!

Prova altri indici: 6, 7, 1000, -1, -6 o -1000. Prova a prevedere il risultato ancora prima di eseguire il comando. Hanno senso i risultati?

Per saperne di più su i metodi disponibili per le liste puoi consultare questo capitolo della documentazione Python: https://docs.python.org/3/tutorial/datastructures.html

## Dizionari

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Questo dimostra che hai appena creato un dizionario vuoto. Evviva!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> partecipante = {'nome': 'Ola', 'paese': 'Polonia', 'numeri_preferiti': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- La chiave `nome` va a indicare il valore `'Ola'` (un oggetto `stringa`),
- `paese` indica `'Polonia'` (un'altra `stringa`),
- e `numeri_preferiti` indica `[7, 42, 92]` (una `lista` con tre numeri al suo interno).

Puoi controllare il contenuto di chiavi individuali con questa sintassi:

{% filename %}command-line{% endfilename %}

```python
>>> print(partecipante['nome'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Cosa succede se chiediamo a Python il valore di una chiave che non esiste? Riesci a indovinarlo? Proviamo!

{% filename %}command-line{% endfilename %}

```python
>>> partecipante['età']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'età'
```

Guarda, un altro errore! Questo qua è un **KeyError**. Python è utile e ti dice che la chiave `'età'` non esiste in questo dizionario.

Quando usare un dizionario o una lista? Bella domanda. Prova a formulare una soluzione mentalmente prima di vedere la risposta nella prossima riga.

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

You can use the `pop()` method to delete an item in the dictionary. Se vuoi cancellare la voce che corrisponde alla chiave `'numeri_preferiti'`, digita il seguente comando:

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

Fantastico! ora sai molto sulla programmazione. In questa ultima parte hai imparato:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Sei emozionato/a per la prossima parte? :)

## Confrontare le cose

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

Ti sei chiesta perché abbiamo messo due simboli di uguale `==` uno vicino all'altro per confrontare i numeri? Usiamo un singolo `=` per assegnare valori alle variabili. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Possiamo affermare anche che le cose sono diverse tra di loro. Per dirlo, usiamo il simbolo `!=`, come mostrato nell'esempio sopra.

Dai a Python altri due compiti:

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

Fantastico! Vuoi farne due o tre? prova questo:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Puoi dare a Python tutti i numeri da confrontare che vuoi, ti darà sempre una risposta! Molto intelligente, vero?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Hai sentito parlare dell'espressione "comparare mele e arance"? Proviamo l'equivalente in Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Dall'espressione puoi capire che Python non è in grado di mettere a confronto un numero (`int`) e una stringa (`str`). Ci mostra invece un **TypeError** e ci dice che i due tipi non possono essere messi a confronto.

## Booleano

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

I Boolean possono anche essere variabili! Guarda qui:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Lo puoi fare anche in questa forma:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Fai pratica e divertiti con i Boolean provando ad eseguire i seguenti comandi:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congratulazioni! I valori Boolean sono tra le cose più interessanti della programmazione e tu hai appena imparato ad utilizzarli!

# Salvalo!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Finora abbiamo scritto il codice python nell'interprete, che ci permette di inserire una linea di codice per volta. I programmi vengono salvati in file ed eseguiti dall'**interpreter** del nostro linguaggio di programmazione o dal **compiler**. Fino ad ora abbiamo eseguito i nostri programmi una riga per volta nell' **interprete** di Python. Avremo bisogno di più di una riga di codice per i prossimi compiti, quindi dovremo fare queste cose velocemente:

- Uscire dall'interprete di Python
- Aprire l'editor di codice che abbiamo scelto
- Salvare un po' di codice in un file python
- Eseguirlo!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Questo ti immetterà nel prompt dei comandi.

Prima, abbiamo preso un editore di codice dalla sezione [code editor](../code_editor/README.md). Dovremo aprire l'editor ora e scrivere un po' di codice in un nuovo file:

{% filename %}editor{% endfilename %}

```python
print('Ciao, Django girls!')
```

Ovviamente a questo punto sei una programmatrice Python senior, quindi sentiti libera di scrivere un po' del codice che hai imparato oggi.

Ora dobbiamo salvare il file e dargli un nome descrittivo. Chiama il file **python_intro.py** e salvalo sulla tua scrivania. Puoi chiamare il file come vuoi, ma è importante assicurarsi che finisca con **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Questa viene chiamata "sintassi evidenziata", ed è veramente utile quando si scrive codice. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Questo è uno dei motivi per cui usiamo un editor di codice. :)

E' ora di eseguire il file! Usando le nozioni che hai imparato nella sezione command line, usa il terminal per **cambiare cartella** alla scrivania.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Su un Mac, il comando assomiglierà a questo:

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

Se rimani bloccata, chiedi aiuto.

Ora usa Python per eseguire il codice nel file:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Perfetto! Hai appena eseguito il tuo primo programma Python salvato su un file. Grande, no?

Ora puoi continuare con uno strumento essenziale nella programmazione:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Sostituisci il codice nel file **python_intro.py** con questo:

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
    

Python si aspetta che gli vengano fornite ulteriori istruzioni che saranno eseguite se la condizione `3 > 2` risulterà vera (o `True` se vogliamo). Proviamo a fare in modo che Python stampi "Funziona!". Modifica il tuo codice nel tuo file **python_intro.py** con questo:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Vedi come abbiamo indentato la riga successiva usando 4 spazi? Si deve fare così in modo tale che Python sappia quale codice eseguire se il risultato è True. Puoi mettere uno spazio, ma la maggior parte dei programmatori di Python ne mettono 4 per rendere le cose più ordinate. Anche un signolo `tab` conta come 4 spazi.

Salvalo ed eseguilo di nuovo:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funziona!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### E se una condizione non è Vera?

In esempi precedenti, il codice è stato eseguito solo quando le condizioni erano True. Ma Python ha anche gli `elif` e `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 è infatti maggiore di 2')
else:
    print('5 non è maggiore di 2')
```

Quando viene lanciato, mostrerà:

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

ed eseguito:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Hai visto cosa è successo? `elif` ti consente di aggiungere condizioni supplementari che verranno eseguite se nessuna delle condizioni precedenti viene soddisfatta.

Allo statement iniziale `if` puoi far seguire tutti gli statement `elif` che vuoi. Per esempio:

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

Python esegue ogni singolo test in sequenza e scrive:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfetto, posso apprezzare ogni dettaglio
    

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

### Indice

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

E' ora dell'ultima parte del capitolo!

## Le funzioni personalizzate!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Una funzione è una sequenza di istruzioni che Python dovrebbe eseguire. Ogni funzione in Python inizia con la parola chiave `def`, viene assegnato un nome e può avere alcuni parametri. Let's give it a go. Sostituisci il codice nel file **python_intro.py** con il seguente:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao():
    print('Ciao!')
    print('Come stai?')

ciao()
```

Okay, la nostra prima funzione è pronta!

Ti starai chiedendo perché abbiamo scritto il nome della funzione alla fine del file. Perché Python legge il file e lo esegue dall'alto verso il basso. Quindi per poter utilizzare la nostra funzione, dobbiamo riscriverla alla fine.

Eseguiamolo e vediamo cosa succede:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao!
    Come stai?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
```

Come puoi vedere, abbiamo dato alla nostra funzione un parametro chiamato `nome`:

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

Ricorda: La funzione `print` è rientrata di 4 spazi rispetto allo statement `if`. Infatti, la funzione viene eseguita quando la condizione viene soddisfatta. Vediamo ora come funziona:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: ciao() missing 1 required positional argument: 'nome'
    

Ops, un errore. Fortunatamente, Python ci fornisce un messaggio di errore che ci può servire. Ci dice che la funzione `ciao()` (quella che abbiamo definito) ha un argomento richiesto (chiamato `nome`) e che ci siamo dimenticati di metterlo quando abbiamo chiamato la funzione. Sistemiamolo alla fine del file:

{% filename %}python_intro.py{% endfilename %}

```python
ciao("Ola")
```

Ed eseguiamo di nuovo:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Ola!
    

E se cambiamo il nome?

{% filename %}python_intro.py{% endfilename %}

```python
ciao("Sonja")
```

E mEttilo in EsEcuzionE:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Ciao anonimo!
    

Fantastico, vero? In questo modo non devi ripetere tutto ogni volta che vuoi modificare il nome della persona che la funzione dovrebbe salutare. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
    print('Ciao ' + nome + '!')

ciao("Rachel")
```

Ora chiamiamo il codice:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ciao Rachel!
    

Congratulazioni! Hai appena imparato come scrivere funzioni! :)

## Loop

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

È l'ultima parte. Abbiamo fatto in fretta, vero? :)

I programmatori non amano ripetere ciò che scrivono. La programmazione mira a automatizzare le cose, non vorremo mica salutare ognuno col suo nome manualmente? Ecco un caso in cui i loop ci tornano comodi.

Ti ricordi ancora delle liste? Facciamo una lista di ragazze:

{% filename %}python_intro.py{% endfilename %}

```python
ragazze = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
```

Vogliamo salutare tutte loro per nome. Abbiamo la funzione `ciao` per farlo, quindi usiamola in loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

L'istruzione ```for``` ha un comportamento simile all'istruzione ```if``` il codice sotto entrambe deve essere indentato di quattro spazi.

Qua c'è l'intero codice che sarà nel file:

{% filename %}python_intro.py{% endfilename %}

```python
def ciao(nome):
    print('Ciao ' + nome + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
for name in girls:
    ciao(name)
    print('Prossima ragazza')
```

E quando lo mEttiamo in EsEcuzionE:

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
    

Come puoi vedere, tutto quello che metti all'interno di un `for` statement con una spaziatura si ripeterà per ogni elemento della lista `girls`.

Puoi anche utilizzare `for` su numeri usando la funzione `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Che stamperà:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` è una funzione che crea una lista di numeri che si seguono uno dopo l'altro (questi numeri vengono forniti da te come parametri).

Nota che il secondo di questi due numeri non è incluso nella lista prodotta da Python ( ciò significa che `range(1, 6)` conta da 1 a 5, ma non include il numero 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Indice

È tutto. **Sei grande!** Questo capitolo non era affatto facile, puoi essere orgogliosa di te stessa. Noi siamo fierissimi di te per avercela fatta fino a qui!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)