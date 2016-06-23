# Introduzione a Python

> Parte di questo capitolo è basato su esercitazioni di Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Scriviamo un pò codice!

## La linea di comando di Python

Per iniziare a giocare con Python, devi avviare sul tuo computer una *linea di comando*. Dovresti già sapere come farlo -- l'hai imparato nel capitolo [Introduzione a Command Line][1].

 [1]: ../intro_to_command_line/README.md

Una volta pronta, segui le istruzioni riportate di seguito.

Vogliamo aprire una console Python, quindi digita `python` su Windows o `python3` su Mac OS/Linux e premi `invio`.

    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Il tuo primo comando Python!

Dopo aver eseguito il comando Python, il prompt è cambiato in `>>>`. Significa che per ora dovremmo utilizzare comandi nel linguaggio Python. Non devi digitare `>>>` - Python lo farà per te.

Se ad un certo punto vuoi uscire dalla console di Python, digita `exit()` oppure usa la scorciatoia `Ctrl + Z` per Windows e `Ctrl + D` per Mac/Linux. Allora non vedrai più `>>>`.

Per ora non vogliamo uscire dalla console Python. Vogliamo saperne di più. Cominciamo con qualcosa davvero semplice. Per esempio, prova un po' di matematica, come `2 + 3` e premi `invio`.

    >>> 2 + 3
    5
    

Fantastico! Hai visto come è comparsa la risposta? Python conosce la matematica! potresti provare altri comandi come: - `4 * 5` - `5 - 1` - `40 / 2`

Divertiti con questo per un pò e dopo torna qui :).

Come puoi vedere, Python è una buona calcolatrice. Ora ti starai sicuramente chiedendo cos'altro è capace di fare...

## Stringhe

Che ne dici di scrivere il tuo nome? Digitalo tra virgolette così:

    >>> "Ola"
    'Ola'
    

Hai appena creato la tua prima stringa! Una stringa è una sequenza di caratteri che possono essere elaborati da un computer. La stringa deve sempre iniziare e finire con lo stesso carattere. Che può essere una virgoletta semplice (`'`) o doppia (`"`) (non c'è differenza!) Le virgolette dicono a Python che il contenuto al loro interno è una stringa.

Le stringhe possono essere legate assieme. Prova questo:

    >>> " Ciao " + "Ola"
    'Ciao Ola'
    

Puoi anche moltiplicare le stringhe con un numero:

    >>> "Ola" * 3
    'OlaOlaOla'
    

Se devi mettere un apostrofo nella tua stringa, hai due modi per farlo.

Utilizzando le virgolette doppie:

    >>> "Correre verso l'albero"
    "Correre verso l'albero"
    

o facendo l'escape dell'apostrofo (cioè trattandolo come un carattere qualunque) con una barra rovesciata ( \ ):

    >>> 'Correre verso l\'albero'
    "Correre verso l'albero"
    

Bello, eh? Per vedere il tuo nome in maiuscolo, digita:

    >>> "Ola".upper()
    'OLA'
    

Hai appena usato la funzione `upper` sulla tua stringa! Una funzione (come `upper()`) è una sequenza di istruzioni che Python deve eseguire su un determinato oggetto (`"Ola"`).

Se vuoi sapere il numero delle lettere presenti nel tuo nome, c'è una funzione anche per quello!

    >>> len("Ola")
    3
    

Ti stai chiedendo perché certe volte chiami una funzione con un `.` alla fine di una stringa (come `"Ola".upper()`) ed in altri casi chiami prima una funzione e poi metti la stringa tra parentesi? Beh, in alcuni casi, le funzioni appartengono ad oggetti, come `upper()`, che può essere eseguita solo su stringhe. In questo caso, chiamiamo la funzione **metodo**. Altre volte, le funzioni non appartengono a niente di specifico e possono essere utilizzate su diversi tipi di oggetti, proprio come `len()`. Ecco perché stiamo dando `"Ola"` come un parametro alla funzione `len`.

### Indice

OK, basta con le stringhe. Ecco fino ad ora quanto hai imparato:

*   **il prompt** - digitare i comandi (codice) nel prompt di Python restituisce risposte in Python
*   **numeri e stringhe** - in Python i numeri vengono utilizzati per la matematica e le stringhe per oggetti testuali
*   **operatori** - come + e *, combinano i valori per produrne di nuovi
*   **funzioni** - come upper() e len(), eseguono azioni su oggetti.

Queste sono le basi di ogni linguaggio di programmazione che impari. Pronta per qualcosa di più complicato? Scommetto che lo sei!

## Errori

Proviamo qualcosa di nuovo. Possiamo ottenere la lunghezza di un numero nella stessa forma in cui abbiamo potuto scoprire la lunghezza del nostro nome? Digita `len(304023)` e premi `Invio`:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

Abbiamo ottenuto il nostro primo errore! Ci dice che gli oggetti di tipo "int" (integers, numeri interi) non hanno lunghezza. Quindi cosa possiamo fare? Forse possiamo scrivere il nostro numero come una stringa? Le stringhe hanno una lunghezza, vero?

    >>> len(str(304023))
    6
    

Ha funzionato! Usiamo la funzione `str` all'interno della funzione `len`. `str()` converte tutto in stringhe.

*   La funzione `str` converte le cose in **stringhe**
*   La funzione `int` converte le cose in **numeri interi**

> Importante: possiamo convertire i numeri in testo, ma non possiamo convertire il testo in numeri - cosa potrebbe essere `int('hello')`?

## Variabili

Un concetto importante nella programmazione è quello delle variabili. Una variabile è un nome per un qualcosa che deve essere utilizzato sucessivamente. I programmatori usano queste variabili per archiviare dati, rendere il loro codice più leggibile e per non dover tenere a mente cosa sono queste cose.

Diciamo che vogliamo creare una nuova variabile chiamata `nome`:

    >>> nome = "Ola"
    

Vedi? È facile! è semplicemente: nome è uguale a Ola.

Come avrai notato, il programma non ha ritornato nulla, diversamente da prima. Quindi come facciamo a sapere che la variabile esiste? Digita `nome` e premi `enter`:

    >>> nome
    'Ola'
    

Evvai! La tua prima variabile :)! Puoi sempre modificare a cosa si riferisce:

    >>> nome = "Sonja"
    >>> nome
    'Sonja'
    

La puoi utilizzare anche nelle funzioni:

    >>> len(nome)
    5
    

Fantastico, vero? Certo, le variabile possono essere qualsiasi cosa, così come i numeri! Prova questo:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

Ma cosa succede se utilizziamo il nome sbagliato? Riesci a immaginare cosa succederebbe? Proviamo!

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    

Un errore! Come puoi vedere, Python ha diversi tipi di errori e questo qui si chiama **NameError**. Python ti darà questo errore se provi ad utilizzare una variabile che non è stata ancora definita. Se incontri questo errore più tardi, controlla il tuo codice per vedere se hai digitato in modo errato i nomi.

Giocaci per un po' e vedi cosa puoi fare!

## La funzione print

Prova questo:

    >>> nome = 'Maria'
    >>> nome
    'Maria'
    >>> print(nome)
    Maria
    

Quando digiti `nome`, l'interprete di Python risponde con una stringa *rappresentazione* della variabile 'nome', che contiene le lettere M-a-r-i-a, circondate da singole virgolette, ''. Quando dici `print(nome)`, Python "stamperà" i contenuti della variabile sullo schermo, senza le virgolette, che è più pulito.

Come vedremo dopo, `print()` è anche utile quando vogliamo stampare le cose dall'interno delle funzioni, oppure quando vogliamo stampare le cose in molteplici righe.

## Liste

Oltre alle stringhe ed ai numeri interi, Python ha tanti tipi di oggetti. Ora ne introdurremo uno chiamato **lista**. Le liste sono fatte proprio come immagini: sono oggetti che sono liste di altri oggetti :)

Vai avanti e crea una lista:

    >>> []
    []
    

Si, questa lista è vuota. Non serve a molto, giusto? Creiamo una lista di numeri della lotteria. Non vogliamo ripetere tutto ogni volta, quindi metteremo la lista in una variabile:

    >>> lotteria = [3, 42, 12, 19, 30, 59]
    

Abbiamo una lista! Cosa possiamo farne? Vediamo quanti numeri della lotteria ci sono nella lista. Hai idea di quale funzione potresti utilizzare per farlo? Lo abbiamo imparato insieme prima!

    >>> len(lotteria)
    6
    

Si! `len()` può darti il numero di oggetti in una lista. Utile, vero? Forse abbiamo risolto:

    >>> lotteria.sort()
    

Questo comando non dà nessun risultato, ha semplicemente cambiato l'ordine in cui i numeri appaiono nella lista. Stampiamo di nuovo la lista per vedere cosa è successo:

    >>> print(lotteria)
    [3, 12, 19, 30, 42, 59]
    

Come puoi vedere, adesso i numeri nella tua lista sono ordinati dal valore più basso a quello più alto. Congratulazioni!

Vogliamo invertire quell'ordine? Facciamolo!

    >>> lotteria.reverse()
    >>> print(lotteria)
    [59, 42, 30, 19, 12, 3]
    

Facile, vero? Se vuoi aggiungere qualcosa alla tua lista, puoi farlo digitando questo comando:

    >>> lotteria.append(199)
    >>> print(lotteria)
    [59, 42, 30, 19, 12, 3, 199]
    

Se vuoi mostrare solo il primo numero, puoi farlo usando gli **indici**. L'indice è il numero che dice la posizione esatta dell'elemento all'interno di una lista. I programmatori preferiscono iniziare a contare da 0, quindi il primo oggetto nella lista è all'indice 0, il successivo all'1, e così via. Prova questo:

    >>> print(lotteria[0])
    59
    >>> print(lotteria[1])
    42
    

Come puoi vedere, puoi accedere a diversi oggetti nella tua lista usando il nome della lista e l'indice dell'oggetto all'interno delle parentesi quadre.

Per eliminare qualcosa dalla lista dovrai usare **indexes** come abbiamo visto sopra, e lo statement `pop()`. Proviamo a fare qualcosa per rafforzare quanto imparato prima; elimineremo il primo numero della lista.

    >>> print(lotteria)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(lotteria[0])
    59
    >>> lotteria.pop(0)
    >>> print(lotteria)
    [42, 30, 19, 12, 3, 199]
    

Ha funzionato a meraviglia!

Prova altri indici: 6, 7, 1000, -1, -6 o -1000. Prova a prevedere il risultato ancora prima di eseguire il comando. Hanno senso i risultati?

Per saperne di più su i metodi disponibili per le liste puoi consultare questo capitolo della documentazione Python: https://docs.python.org/3/tutorial/datastructures.html

## Dizionari

Un dizionario (dictionary) è simile a una lista, ma accedi ai valori cercando una chiave invece di un indice. Una chiave può essere qualsiasi stringa o numero. La sintassi per definire un dizionario vuoto è:

    >>> {}
    {}
    

Questo dimostra che hai appena creato un dizionario vuoto. Evviva!

Ora, prova a scrivere il seguente comando (prova a sostituirlo con le tue informazioni):

    >>> partecipante = {'nome': 'Ola', 'paese': 'Polonia', 'numeri_preferiti': [7, 42, 92]}
    

Con questo comando hai appena creato una variabile chiamata `partecipante` con tre coppie di chiavi-valori:

*   La chiave `nome` va a indicare il valore `'Ola'` (un oggetto `stringa`),
*   `paese` indica `'Polonia'` (un'altra `stringa`),
*   e `numeri_preferiti` indica `[7, 42, 92]` (una `lista` con tre numeri al suo interno).

Puoi controllare il contenuto di chiavi individuali con questa sintassi:

    >>> print(partecipante['nome'])
    Ola
    

Vedi, assomiglia ad una lista. Ma non devi ricordare l'indice - solo il nome.

Cosa succede se chiediamo a Python il valore di una chiave che non esiste? Riesci a indovinarlo? Proviamo!

    >>> partecipante['età']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'età'
    

Guarda, un altro errore! Questo qua è un **KeyError**. Python è utile e ti dice che la chiave `'età'` non esiste in questo dizionario.

Quando usare un dizionario o una lista? Bella domanda. Prova a formulare una soluzione mentalmente prima di vedere la risposta nella prossima riga.

*   Ha bisogno di una sequenza ordinata di elementi? Fai una lista.
*   Hai bisogno di associare i valori alle chiavi, così che potrai cercarle agilmente (per chiave) dopo? Usa un dizionario.

I dizionari, come le liste, sono *mutable*, significa che possono essere cambiati dopo che sono stati creati. Si possono aggiugere nuove coppie chiave/valore ad un dizionario dopo averlo creato:

    >>> partecipante['linguaggio_preferito'] = 'Python'
    

Così come succede se applicato alle liste, il metodo `len()` restituisce il numero di coppie chiave/valore anche quando applicato a un dizionario. Vai e digita il comando:

    >>> len(partecipante)
    4
    

Spero che abbia senso per te. :) Pronta per divertirti con i dizionari? Vai alla prossima riga per realizzare altre cose fantastiche.

Puoi usare il comando `pop()` per cancellare un elemento nella directory. Se vuoi cancellare la voce che corrisponde alla chiave `'numeri_preferiti'`, digita il seguente comando:

    >>> partecipante.pop('numeri_preferiti')
    >>> partecipante
    {'paese': 'Polonia', 'linguaggio_preferito': 'Python', 'nome': 'Ola'}
    

Come puoi vedere dall'output, la coppia chiave-valore corrispondente alla chiave 'numeri_preferiti' è stato cancellata.

Puoi anche cambiare un valore associato ad una chiave già creata nel dizionario. Digita:

    >>> partecipante['paese'] = 'Germania'
    >>> partecipante
    {'paese': 'Germania', 'linguaggio_preferito': 'Python', 'nome': 'Ola'}
    

Come puoi vedere, il valore della chiave `'paese'` è stato cambiato da `'Polonia'` a `'Germania'`. :) Eccitante, vero? Evviva! Hai già imparato un'altra cosa fantastica.

### Indice

Fantastico! ora sai molto sulla programmazione. In questa ultima parte hai imparato:

*   **errori** - ora sai come leggere e capire gli errori che appaiono se Python non comprende un comando che gli hai dato
*   **variabili** - nomi per oggetti. Ti permettono di scrivere codice più semplice e di renderlo più leggibile
*   **liste** - liste di oggetti archiviati in un ordine particolare
*   **dizionari** - oggetti archiviati come coppie di chiave-valore

Sei emozionato/a per la prossima parte? :)

## Confrontare le cose

Larga parte della programmazione include il confrontare le cose. Qual è la cosa più semplice da confrontare? I numeri, senza dubbio. Vediamo come funziona:

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
    

Abbiamo dato a Python alcuni numeri da mettere a confronto. Come puoi vedere, Python può mettere a confronto non solo numeri, ma anche i risultati dei metodi. Forte, eh?

Ti sei chiesta perché abbiamo messo due simboli di uguale `==` uno vicino all'altro per confrontare i numeri? Usiamo un singolo `=` per assegnare valori alle variabili. Sempre, **sempre** devi mettere due `==` se vuoi controllare se le cose sono uguali. Possiamo affermare anche che le cose sono diverse tra di loro. Per dirlo, usiamo il simbolo `!=`, come mostrato nell'esempio sopra.

Dai a Python altri due compiti:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

`>` e `<` sono facili, ma cosa significano `>=` e `<=`? Leggili così:

*   x `>` y significa: x è maggiore di y
*   x `<` y significa: x è minore di y
*   x `<=` y significa: x è minore o uguale a y
*   x `>=` y significa: x è maggiore o uguale a y

Fantastico! Vuoi farne due o tre? prova questo:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
    

Puoi dare a Python tutti i numeri da confrontare che vuoi, ti darà sempre una risposta! Molto intelligente, vero?

*   **and** - se usi l'operatore `e`, entrambe le cose confrontate devono essere True in modo tale che l'intero comando sia True
*   **or** - se usi l'operatore `o`, solo una delle cose messe a confronto deve essere True in modo tale che l'intero comando sia True

Hai sentito parlare dell'espressione "comparare mele e arance"? Proviamo l'equivalente in Python:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

Dall'espressione puoi capire che Python non è in grado di mettere a confronto un numero (`int`) e una stringa (`str`). Ci mostra invece un **TypeError** e ci dice che i due tipi non possono essere messi a confronto.

## Booleano

Accidentalmente, hai appena imparato un nuovo tipo di oggetto in Python. Si chiama **Boolean** e probabilmente è il tipo più facile che ci sia.

Ci sono solo due oggetti Boolean:
- True
- False

Ma perché Python possa capirlo, bisogna sempre scrivere True (prima lettera maiuscola, le altre minuscole). **true, TRUE, tRUE non funzionano -- solo True è corretto.** (Lo stesso vale per False, ovviamente.)

I Boolean possono anche essere variabili! Guarda qui:

    >>> a = True
    >>> a
    True
    

Lo puoi fare anche in questa forma:

    >>> a = 2 > 5
    >>> a
    False
    

Fai pratica e divertiti con i Boolean provando ad eseguire i seguenti comandi:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Congratulazioni! I valori Boolean sono tra le cose più interessanti della programmazione e tu hai appena imparato ad utilizzarli!

# Salvalo!

Finora abbiamo scritto il codice python nell'interprete, che ci permette di inserire una linea di codice per volta. I programmi vengono salvati in file ed eseguiti dall'**interpreter** del nostro linguaggio di programmazione o dal **compiler**. Fino ad ora abbiamo eseguito i nostri programmi una riga per volta nell' **interprete** di Python. Avremo bisogno di più di una riga di codice per i prossimi compiti, quindi dovremo fare queste cose velocemente:

*   Uscire dall'interprete di Python
*   Aprire l'editor di codice che abbiamo scelto
*   Salvare un po' di codice in un file python
*   Eseguirlo!

Per uscire dall'interprete di Python che è quello che stavamo utilizzando, digita la funzione ```exit()``` :

    >>> exit()
    $
    

Questo ti immetterà nel prompt dei comandi.

Prima, abbiamo preso un editore di codice dalla sezione [code editor][2]. Dovremo aprire l'editor ora e scrivere un po' di codice in un nuovo file:

 [2]: ../code_editor/README.md

```python
print('Ciao, Django girls!')
```

> **Nota** Dovresti notare una delle cose più belle degli editori di codice: i colori! Nella console Python ogni cosa era dello stesso colore, mentre ora dovresti visualizzare la funzione `print` di un colore differente rispetto alla stringa che la segue. Questa viene chiamata "sintassi evidenziata", ed è veramente utile quando si scrive codice. Il colore serve come suggerimento, ad esempio per una stringa che non è chiusa, o un errore di digitazione di una keyword (come la `def` per le funzioni, che vedremo più avanti). Questo è uno dei motivi per cui usiamo un editor di codice :)

Ovviamente a questo punto sei una programmatrice Python senior, quindi sentiti libera di scrivere un po' del codice che hai imparato oggi.

Ora dobbiamo salvare il file e dargli un nome descrittivo. Chiama il file **python_intro.py** e salvalo sulla tua scrivania. Puoi chiamare il file come vuoi, ma è importante assicurarsi che finisca con **.py**. L'estensione **.py** dice al Sistema Operativo che questo è un **file eseguibile python** e che Python può eseguirlo.

È ora di eseguire il file! Usando le nozioni che hai imparato nella sezione command line, usa il terminal per **cambiare cartella** alla scrivania.

Su un Mac, il comando assomiglierà a questo:

    $ cd /Users/<your_name>/Desktop
    

Su Linux, sarà come questo (la parola "Desktop" potrebbe essere tradotta nella tua lingua):

    $ cd /home/<your_name>/Desktop
    

E su windows, sara come questo:

    > cd C:\Users\<your_name>\Desktop
    

Se rimani bloccata, chiedi aiuto.

Ora usa Python per eseguire il codice nel file:

    $ python3 python_intro.py
    Ciao, Django girls!
    

Perfetto! Hai appena eseguito il tuo primo programma Python salvato su un file. Grande, no?

Ora puoi continuare con uno strumento essenziale nella programmazione:

## If...elif...else

Molte cose dovrebbero essere eseguite soltanto quando si incontrano certe condizioni. È per questo che Python ha gli **if statements**.

Sostituisci il codice nel file **python_intro.py** con questo:

```python
if 3 > 2:
```

Se salviamo questo codice e lo eseguiamo, incontriamo un errore come questo:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python si aspetta che gli vengano fornite ulteriori istruzioni che saranno eseguite se la condizione `3 > 2` risulterà vera (o `True` se vogliamo). Proviamo a fare in modo che Python stampi "Funziona!". Modifica il tuo codice nel tuo file **python_intro.py** con questo:

```python
if 3 > 2:
     print('Funziona!')
```

Vedi come abbiamo indentato la riga successiva usando 4 spazi? Si deve fare così in modo tale che Python sappia quale codice eseguire se il risultato è True. Puoi fare uno spazio, ma circa tutti i programmatori di Python ne fanno 4 per far vedere le cose più ordinate. Anche un signolo `tab` conta come 4 spazi.

Salvalo ed eseguilo di nuovo:

    $ python3 python_intro.py
    Funziona!
    

### E se una condizione non è Vera?

In esempi precedenti, il codice è stato eseguito solo quando le condizioni erano True. Ma Python ha anche gli `elif` e `else` statements:

```python
if 5 > 2:
     print('5 è infatti maggiore di 2') 
else:
     print('5 non è maggiore di 2')
```

Quando viene lanciato, mostrerà:

    $ python3 python_intro.py
    5 è infatti maggiore di 2
    

Se 2 fosse un numero maggiore di 5, allora andrebbe in esecuzione il secondo comando. Facile, vero? Andiamo a vedere come funziona `elif`:

```python
nome = 'Sonja'
if nome == 'Ola':
    print('Ciao Ola!')
elif nome == 'Sonja':
    print('Ciao Sonja!')
else:
    print('Ciao anonimo!')
```

ed eseguito:

    $ python3 python_intro.py
    Ciao Sonja!
    

Hai visto cosa è successo? `elif` ti consente di aggiungere condizioni supplementari che verranno eseguite se nessuna delle condizioni precedenti viene soddisfatta.

Allo statement iniziale `if` puoi far seguire tutti gli statement `elif` che vuoi. Per esempio:

```python
volume = 57
if volume < 20:
    print("Piuttosto basso.")
elif 20 <= volume < 40:
    print("Adatto per musica di sottofondo")
elif 40 <= volume < 60:
    print("Perfetto, posso apprezzare ogni dettaglio")
elif 60 <= volume < 80:
    print("Ideale per le feste")
elif 80 <= volume < 100:
    print("Un po' altino!")
else:
    print("Oddio, le mie orecchie! :(")
```

Python esegue ogni singolo test in sequenza e scrive:

    $ python3 python_intro.py
    Perfetto, posso apprezzare ogni dettaglio
    

### Indice

Nei tre esercizi precedenti hai imparato:

*   come **confrontare le cose** - in Python puoi mettere a confronto le cose usando `>`, `>=`, `==`, `<=`, `<` e gli operatori `e`, `o`
*   i **Boolean** - una tipologia di oggetto che può avere solo uno di questi due valori: `True` o `False`
*   come **Salvare file** - archiviare codice nei file in modo da poter eseguire programmi più lunghi.
*   **if...elif...else** - affermazioni che ti permettono di eseguire codice solo quando vengono incontrate certe condizioni.

È ora dell'ultima parte del capitolo!

## Le funzioni personalizzate!

Ti ricordi quelle funzioni che puoi eseguire in Python come `len()`? Beh, buone notizie, ora imparerai a scrivere delle funzioni tutte tue!

Una funzione è una sequenza di istruzioni che Python dovrebbe eseguire. Ogni funzione in Python inizia con la parola chiave `def`, viene assegnato un nome e può avere alcuni parametri. Iniziamo con una facile. Sostituisci il codice nel file **python_intro.py** con il seguente:

```python
def ciao():
    print('Ciao!')
    print('Come stai?')

ciao()
```

Okay, la nostra prima funzione è pronta!

Ti starai chiedendo perché abbiamo scritto il nome della funzione alla fine del file. Perché Python legge il file e lo esegue dall'alto verso il basso. Quindi per poter utilizzare la nostra funzione, dobbiamo riscriverla alla fine.

Eseguiamolo e vediamo cosa succede:

    $ python3 python_intro.py
    Ciao!
    Come stai?
    

È stato facile! Costruiamo la nostra prima funzione con parametri. Useremo l'esempio precedente - una funzione che dice 'ciao' alla persona che lo esegue - aggiungendo il nome:

```python
def ciao(nome):
```

Come puoi vedere, abbiamo dato alla nostra funzione un parametro chiamato `nome`:

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

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      ciao()
    TypeError: ciao() missing 1 required positional argument: 'nome'
    

Ops, un errore. Fortunatamente, Python ci fornisce un messaggio di errore che ci può servire. Ci dice che la funzione `ciao()` (quella che abbiamo definito) ha un argomento richiesto (chiamato `nome`) e che ci siamo dimenticati di metterlo quando abbiamo chiamato la funzione. Sistemiamolo alla fine del file:

```python
ciao("Ola")
```

Ed eseguiamo di nuovo:

    $ python3 python_intro.py
    Ciao Ola!
    

E se cambiamo il nome?

```python
ciao("Sonja")
```

Ed eseguilo:

    $ python3 python_intro.py
    Ciao Sonja!
    

Ora, cosa pensi che succederà se scrivi un altro nome? (non Ola o Sonja) Provaci e vedi se la tua ipotesi è giusta. Dovrebbe stampare questo:

    Ciao anonimo!
    

Fantastico, vero? In questo modo non devi ripetere tutto ogni volta che vuoi modificare il nome della persona che la funzione dovrebbe salutare. Ed è esattamente per questo che abbiamo bisogno delle funzioni - non vuoi ripetere il tuo codice!

Facciamo una cosa più intelligente -- ci sono più di due nomi, e scrivere una condizione per ognuno sarebbe complicato, vero?

```python
def ciao(nome):
    print('Ciao ' + nome + '!')

ciao("Rachel")
```

Ora chiamiamo il codice:

    $ python3 python_intro.py
    Ciao Rachel!
    

Congratulazioni! Hai appena imparato a scrivere delle funzioni :)

## Loop

È l'ultima parte. Abbiamo fatto in fretta, vero? :)

I programmatori non amano ripetere ciò che scrivono. La programmazione mira a automatizzare le cose, non vorremo mica salutare ognuno col suo nome manualmente? Ecco un caso in cui i loop ci tornano comodi.

Ti ricordi ancora delle liste? Facciamo una lista di ragazze:

```python
ragazze = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
```

Vogliamo salutare tutte loro per nome. Abbiamo la funzione `ciao` per farlo, quindi usiamola in loop:

```python
for nome in ragazze:
```

Lo statement `for` si comporta in modo simile allo statement `if`; il codice sottostante deve essere rientrato di quattro spazi.

Qua c'è l'intero codice che sarà nel file:

```python
def ciao(nome):
    print('Ciao ' + nome + '!') 

ragazze = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Tu']
for nome in ragazze:
    ciao(nome)
    print('Prossima ragazza')
```

E quando lo eseguiamo:

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

```python
for i in range(1, 6):
    print(i)
```

Che stamperà:

    1
    2
    3
    4
    5
    

`range` è una funzione che crea una lista di numeri che si seguono uno dopo l'altro (questi numeri vengono forniti da te come parametri).

Nota che il secondo di questi due numeri non è incluso nella lista prodotta da Python ( ciò significa che `range(1, 6)` conta da 1 a 5, ma non include il numero 6). Questo perché "range" è mezzo-aperto e con ciò intendiamo che include il primo valore, man non l'ultimo.

## Indice

È tutto. **Sei grande!** Questo capitolo non era affatto facile, puoi essere orgogliosa di te stessa. Noi siamo fierissimi di te per avercela fatta fino a qui!

Potresti desiderare di fare brevemente qualcos'altro - stiracchiati, fai due passi, riposa gli occhi - prima di continuare con il prossimo capitolo. :)

![Cupcake](images/cupcake.png)
