# Úvod do jazyka Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Poďme napísať nejaký kód!

## Python prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Aby sme mohli začať s Pythonom, musíte otvoriť *príkazový riadok* (angl. command line) na svojom počítači. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Ak ste hotoví, pokračujte s inštrukciami nižšie.

We want to open up a Python console, so type in `python` on Windows or `python3` on Mac OS/Linux and hit `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Váš prvý príkaz v Pythone!

Po spustení príkazu Python sa prompt zmenil na `>>>`. Pre nás to znamená že odteraz by sme mali písať príkazy iba v jazyku Python. You don't have to type in `>>>` – Python will do that for you.

Ak by ste chceli kedykoľvek ukončiť konzolu Pythonu, len napíšte `exit()` alebo môžete použiť aj skratku `Ctrl + Z` vo Windowse alebo `Ctrl + D` pre Mac/Linux. Potom už nebudete vidieť toto: `>>>`.

Ale teraz ešte vôbec nechceme ukončiť konzolu Python. Chceme sa o ňom naučiť viac. Začínajme s niečím jednoduchým. For example, try typing some math, like `2 + 3` and hit `enter`.

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

Have fun with this for a little while and then get back here. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Reťazce

Čo tak vaše meno? Napíšte svoje meno v úvodzovkách:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" 
"Ola"
```

Práve ste vytvorili svoj prvý reťazec! Je postupnosť znakov, ktoré môžu byť spracované počítačom. Reťazec musí vždy začínať a končíť s rovnakým znakom. Sú to jednoduché (`'`) alebo dvojité (`"`) úvodzovky (nie je medzi nimi žiadny rozdiel!). Úvodzovky naznačujú, že to čo je medzi nimi je reťazec (string).

Reťazce možno spájať dohromady. Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> "Ahoj" + "Ola" 
'Ahoj Ola'
```

Reťazce môžete násobiť aj s číslom:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3 
'OlaOlaOla'
```

Ak potrebujete dať apostrof do vnútra reťazca, máte dva spôsoby, ako to urobiť.

Použitím dvojitých úvodzoviek:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill" 
"Runnin' down the hill"
```

alebo pomocou spätného lomítka - tento znak (ak je napísaný pred úvodzovkou) povie, že ona je súčasťou reťazca a nie koniec / začiatok reťazca (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill' 
"Runnin' down the hill"
```

Pekné, hm? Ak chcete vidieť svoje meno veľkými písmenami, jednoducho zadajte:

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

Ste zvedaví, prečo voláme niekedy funkciu s bodkou (`.`) na konci reťazca (ako `"Ola".upper()`) a niekedy najprv voláme funkciu a reťazec vložíme do zátvoriek? V niektorých prípadoch funkcie patria k objektom, ako napr. `upper()`, čo môže byt vykonaná len na reťazcoch. V takomto prípade sa tieto funkcie volajú **metódy**. Inokedy funkcie nepatria k žiadnemu konkrétnemu objektu a môžu byť použité na rôzne typy objektov, rovnako ako `len()`. Preto zadáme `"Ola"` ako parameter pre funkciu `len`.

### Zhrnutie

OK, dosť už reťazcoch. Zatiaľ ste sa naučili o:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Toto sú základy každého programovacieho jazyka. Ste pripravení na niečo ťažšie? Stavíme sa, že áno!

## Chyby

Teraz skúsme niečo nové. Je možné zistiť dĺžku nejakého čísla rovnako ako sme to robili s našim menom? Napíšte `len(304023)` a stlačte `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Dostali sme našu prvú chybovú hlášku! Hovorí nám, že objekty typu "int" (celé čísla, angl. integers) nemajú dĺžku. Tak čo môžeme teraz robiť? Možno by sme mohli napísať naše číslo ako reťazec? Reťazce majú dĺžku, pravda?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funguje to! Použili sme funkciu `str` vo vnútri funkcie `len`. Funkcia `str()` prevedie všetko na reťazce.

- Funkcia `str` prevedie (konvertuje) všetko na **reťazce** (angl. string)
- Funkcia `int` prevedie všetko na **int** (celé čísla)

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Premenné

Veľmi dôležitý pojem v programovaní je pojem premennej. Premenná je nič iné ako názov niečoho, čo môžeme použiť aj neskoršie v programe. Programátori používajú premenné aby v nich ukladali dáta, aby ich zdrojový kód bol prehľadnejší a aby nemuseli všetko držať v hlave.

Povedzme, že chceme vytvoriť novú premennú s názvom `meno`:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Ola"
```

Vidíte? Je to jednoduché: meno rovná sa Ola.

Ako ste si to zbadali už, váš program nič nevrátil späť ako to robil v predchádzajúcich príkladoch. Tak ako vieme, či tá premenná existuje? Jednoducho napíšte `meno` a stlačte `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> meno
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Sonja"
>>> meno
'Sonja'
```

Môžete ju použiť aj vo funkciách:

{% filename %}command-line{% endfilename %}

```python
>>> len(meno)
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

Ale čo by sa stalo, keby sme použili zlý názov? Uhádnete, čo sa stane? Skúsme!

{% filename %}command-line{% endfilename %}

```python
>>> mesto = "Tokyo"
>>> mseto
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'mseto' is not defined
```

Chyba! Ako vidíte, Python má viacero chýb a táto jedna sa volá **NameError**. Python vám hodí túto chybu ak sa pokúsite použiť premennú ktorá ešte nebola definovaná. Ak sa stretnete s touto chybou v budúcnosti, vždy skontrolujte svoj kód, či nemáte preklep v niektorom názve.

Bavte sa s tým trošku, a potom uvidíme čo môžeme ešte urobiť!

## Funkcia print

Vyskúšajte toto:

{% filename %}command-line{% endfilename %}

```python
>>> meno = 'Maria'
>>> meno
'Maria'
>>> print(meno)
Maria
```

Ak zadáte len `meno`, Python interpreter odpovie reťazcovou *reprezentáciou* premennej 'meno', teda písmenami M-a-r-i-a medzi jednoduchými úvodzovkami, ''. Keď napíšete `print(meno)`, Python vypíše obsah premennej na obrazovku, bez úvodzoviek, čo vyzerá krajšie.

Ako uvidíme neskôr, funkcia `print()` je tiež užitočná, keď chceme tlačiť veci z funkcií, alebo ak chceme tlačiť veci na viacerých riadkoch.

## Zoznamy

Okrem reťazcov a celých čísel, má Python všetky možné typy objektov. Teraz sa zoznámime s typom, ktorý sa volá **zoznam** (list). Lists are exactly what you think they are: objects which are lists of other objects. :)

Poďme na to, vytvorte zoznam:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Áno, tento zoznam je prázdny. Nie veľmi užitočné, však? Vytvorme zoznam s číslami lotérie. Nechceme sa dokola opakovať, takže ho hneď aj priradíme do premennej:

{% filename %}command-line{% endfilename %}

```python
>>> loteria = [3, 42, 12, 19, 30, 59]
```

OK, máme zoznam! Čo s ním môžeme urobiť? Pozrime sa, koľko čísel lotérie máme v zozname. Máte predstavu, ktorú funkciu by sme mohli použiť? Toto už predsa viete!

{% filename %}command-line{% endfilename %}

```python
>>> len(loteria)
6
```

Áno! `len()` vám vráti počet objektov v zozname. Šikovné, nie? Možno by sme to teraz mohli usporiadať:

{% filename %}command-line{% endfilename %}

```python
>>> loteria.sort()
```

Nič nám to nevrátilo, iba sa zmenilo poradie poradie, v ktorom sa čísla zobrazia v zozname. Vytlačme to znova a pozrime sa, čo sa stalo:

{% filename %}command-line{% endfilename %}

```python
>>> print(loteria)
[3, 12, 19, 30, 42, 59]
```

Ako vidíte, čísla vo vašom zozname sú teraz zoradené od najnižšej po najvyššiu hodnotu. Gratulujeme!

Chceli by sme otočiť poradie? Urobme to!

{% filename %}command-line{% endfilename %}

```python
>>> loteria.reverse()
>>> print(loteria)
[59, 42, 30, 19, 12, 3]
```

Jednoduché, však? Ak chcete pridať niečo do svojho zoznamu, môžete tak urobiť zadaním tohto príkazu:

{% filename %}command-line{% endfilename %}

```python
>>> loteria.append(199)
>>> print(loteria)
[59, 42, 30, 19, 12, 3, 199]
```

Ak chcete zobraziť iba prvé číslo, môžete to urobiť pomocou **indexov**. Index je číslo, ktoré hovorí, kde v zozname sa položka nachádza. Programátori radi počítajú od nuly, takž eprvý objekt vo vašom zozname je na indexe 0, ďalší je na 1 a tak ďalej. Vyskúšajte toto:

{% filename %}command-line{% endfilename %}

```python
>>> print(loteria[0])
59
>>> print(loteria[1])
42
```

Ako vidíte, k rôznym objektom vo vašom zozname môžete pristupovať použitím názvu zoznamu a indexom objektu v hranatých zátvorkách.

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

Funguje to ako hodinky!

Pre zábavu vyskúšajte aj nejaké iné indexy: 6, 7, 1000, -1, -6 alebo -1000. Skúste predpovedať výsledok predtým ako príkaz použijete. Dávajú výsledky zmysel?

Zoznam všetkých dostupných metód pre zoznamy v tejto kapitole dokumentácie Pythonu: https://docs.python.org/3/tutorial/datastructures.html

## Slovníky

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

To znamená, že ste práve vytvorili prázdny slovník. Hurá!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka = {'meno': 'Ola', 'krajina': 'Slovensko', 'oblubene_cisla': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Kľúč `meno` odkazuje na hodnotu `"Ola"` (objekt typu `reťazec/string`),
- `country` points to `'Poland'` (another `string`),
- a `oblubene_cisla` smeruje na `[7, 42, 92]` (`zoznam` s tromi číslami).

Obsah jednotlivých kľúčov môžete skontrolovať touto syntaxou:

{% filename %}command-line{% endfilename %}

```python
>>> print(ucastnicka['meno'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Čo sa stane ak si od Pythonu vypýtame hodnotu kľúča, ktorý neexistuje? Uhádnete? Vyskúšajme to a uvidíme!

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['vek']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'vek'
```

Aha, ďalšia chyba! Táto sa volá **KeyError** (chyba kľúča). Python je nápomocný a povie vám, že kľúč `'vek'` v tomto slovníku neexistuje.

Kedy by používať slovník alebo zoznam? No, to je dobrá otázka. Porozmýšľaj predtým, ako si pozrieš odpoveď v nasledujúcom riadku.

- Potrebuješ zoradenú postupnosť položiek? Vyber si zoznam (list).
- Potrebuješ priraďovať hodnoty kľúčovým slovám, aby si si ich mohla efektívne (podľa kľúča) neskôr vyhľadať? Použi slovník (dictionary).

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['oblubeny_jazyk'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(ucastnicka)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Napríklad ak chceš odstrániť položku zodpovedajúcu kľúču `'oblubene_cisla'`, zadaj nasledujúci príkaz:

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
>>> ucastnicka['krajina'] = 'Nemecko'
>>> ucastnicka
{'krajina': 'Nemecko', 'oblubeny_jazyk': 'Python', 'meno': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Zhrnutie

Skvelé! Teraz už vieš o programovaní dosť veľa. Pozrime sa, čo sme si vysvetlili v poslednej časti:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Tešíš sa na ďalšiu časť? :)

## Porovnávanie vecí

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

Zaujíma ťa, prečo sme použili dve "rovná sa" `==` vedľa seba, aby sme porovnali, či sú čísla rovnaké? Jeden znak `=` používame na priraďovanie hodnôt premenným. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Taktiež môžeme zisťovať, či sa veci navzájom líšia. Na to použijeme symbol `!=`, ako bolo uvedené v príklade vyššie.

Zadaj Pythonu ešte dve úlohy:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` a `<` sú jasné, ale čo znamenajú `>=` a `<=`? Prečítať ich môžeš takto:

- x `>` y znamená: x je väčšie ako y
- x `<` y znamená: x je menšie ako y
- x `<=` y znamená: x je menšie alebo sa rovná y
- x `> =` y znamená: x je väčšie alebo sa rovná y

Skvelé! Chceš vyskúšať ešte jeden? Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Môžeš dať Pythonu toľko čísel, koľko chceš a on ti dá vždy odpoveď! Vcelku šikovné, nie?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Už ste počula výraz "porovnávať hrušky s jablkami"? Skúsme pythonský ekvivalent:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: int() > str()
```

Tu vidíš, že tak ako nevieme porovnávať hrušky s jablkami, ani Python neviem porovnať číslo (`int`) s reťazcom (`str`). Namiesto toho vypíše chybu **TypeError** a povie nám, ktoré dva typy sa nedajú porovnať.

## Logické hodnoty (Boolean)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**, and it is probably the easiest type there is.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Logické hodnoty môžu byť aj premenné. Aha:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Môžeš to urobiť aj takto:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Precvič si to a zabav sa s logickými premennými - skús spustiť tieto príkazy:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Gratulujeme! Logické hodnoty patria k tomu najužitočnejšiemu z programovania a ty si sa práve naučila, ako sa používajú!

# Ulož to!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Zatiaľ sme písali všetok pythonský kód do konzoly interpretera, čiže môžeme na jedenkrát zadať iba jeden riadok kódu. Normálne programy sú uložené v súboroch, ktoré spúšťa buď **interpreter** alebo **kompilátor**. Doteraz sme spúšťali naše programy riadok po riadku v **interpreteri** Pythonu. Na ďalšie úlohy budeme potrebovať viac ako jeden riadok kódu, takže teraz rýchlo musíme:

- Ukončiť interpreter Pythonu
- Otvoriť si zvolený editor kódu
- Uložiť v ňom nejaký kód do nového pythonského súboru
- Spustiť ho!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Tak sa dostaneš späť na príkazový riadok.

Už skôr si si vybrala editor kódu v kapitole [editor kódu](../code_editor/README.md). Teraz ho potrebujeme otvoriť a napísať v ňom do nového súboru nejaký kód:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Samozrejme, teraz si už vcelku skúsená Python developerka, takže kľudne napíš nejaký kód, ktorý si sa dnes naučila.

Teraz uložíme súbor a dáme mu nejaký zrozumiteľný názov. Nazvime ho **python_intro.py** a ulož ho plochu. Tento súbor môžeš nazvať akokoľvek chceš, ale dôležité je, aby jeho názov končil **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Toto sa nazýva "zvýraznenie syntaxe" a pri programovaní je to fakt užitočná vec. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

Súbor máme uložený, je čas ho spustiť! Pomocou poznatkov z kapitoly o príkazovom riadku, pomocou Terminálu **zmeň adresár** na plochu.

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Macu bude príkaz vyzerať takto:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Ak máš akékoľvek ťažkosti, stačí požiadať o pomoc.

Teraz použi Python na spustenie kódu v súbore:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Výborne! Práve si spustila svoj prvý pythonský program uložený v súbore. Skvelý pocit, však?

Teraz sa môžeš posunúť na ďalší základný nástroj v programovaní:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Nahraď kód v súbore **python_intro.py** týmto:

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
    

Python očakáva, že od nás dostane ďalšie inštrukcie, ktoré majú byť vykonané ak je podmienka `3 > 2` pravdivá (teda ak bude mať hodnotu `True`). Skúsme zariadiť, aby Python napísal "Funguje to!". Zmeň svoj kód v súbore **python_intro.py** takto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Všimla si si, ako sme odsadili druhý riadok o 4 medzery? To musíme urobiť preto, aby Python vedel, ktorú časť kódu má spustiť ak je výsledok pravdivý. Môžeš použiť len jednu medzeru, ale takmer všetci programátori v Pythone používajú 4 medzery, aby bol kód dobre čitateľný. Jeden `tab` sa tiež počíta ako 4 medzery.

Ulož to a spusti to znova:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funguje to!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Čo ak podmienka nie je pravdivá?

V predchádzajúcich príkladoch, bol kód vykonaný len vtedy, keď podmienky boli pravdivé. Ale Python má tiež príkazy `elif` a `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Keď to spustíš, vypíše to:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 je naozaj viac ako 2
    

Ak by 2 bolo väčšie ako 5, spustil by sa druhý príkaz. Jednoduché, nie? Pozrime sa, ako funguje `elif`:

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

a po spustení:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Sonja!
    

Všimla si si, čo sa stalo? `elif` ti dovolí pridať dodatočné podmienky, ktoré sa spustia, ak sú predchádzajúce nesplnené.

Za prvý `if` môžeš dať `elif` toľkokrát, koľko len chceš. Napríklad:

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

Python prejde všetkými podmienkami v poradí a vypíše:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Super, pocujem vsetky detaily
    

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

### Zhrnutie

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Teraz je čas na poslednú časť tejto kapitoly!

## Tvoje vlastné funkcie!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Funkcia je postupnosť inštrukcií, ktoré by mal Python spustiť. Každá funkcia v Pythone začína kľúčovým slovom `def`, má svoje meno a môže mať nejaké parametre. Začnime s niečím ľahkým. Nahraď kód v **python_intro.py** týmto:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

OK, naša prvá funkcia je pripravená!

Možno sa čuduješ prečo sme na koniec súboru napísali názov funkcie. To preto, lebo Python číta súbor a vykonáva kód od vrchu po spodok. Takže aby sme mohli našu funkciu použiť, musíme jej názov napísať opäť.

Spusťme to a pozrime sa, čo sa stane:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj!
    Ako sa mas?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Ako vidíš, dali sme našej funkcii parameter, ktorý sme nazvali `meno`:

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

Zapamätaj si: Funkcia `print` je odsadená o 4 medzery vo vnútri príkazu `if`. Je to preto, lebo funkcia sa spustí, len ak je splnená podmienka. Pozrime sa ako to funguje:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'meno'
    

Ups, chyba. Našťastie Python nám dáva vcelku užitočnú chybovú hlášku. Hovorí nám, že funkcia `hi()` (tá, čo sme definovali) má jeden povinný argument (s názvom `meno`) a že sme mu ju zabudli zadať pri volaní funkcie. Opravme to na konci súboru:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

A znova ho spusti:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Ola!
    

A čo ak zmeníme meno?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

A spustíme to:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Ahoj neznáma!
    

Úžasné, nie? Vďaka tomu nemusíš prepisovať dokola to isté zakaždým, keď chceš zmeniť meno osoby, ktorú má funkcia pozdraviť. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Teraz spusťme kód:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Katka!
    

Gratulujeme! Práve si sa naučila ako sa píšu funkcie! :)

## Cykly

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Toto je už posledná časť. Išlo to rýchlo, však? :)

Programátori sa neradi opakujú. Programovanie je o automatizácii vecí, takže nechceme zdraviť každú osobu manuálne, nie? A vtedy nám prídu vhod cykly.

Ešte si spomínaš na zoznamy? Pripravme zoznam dievčat:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Chceme ich pozdraviť všetky menom. Na to máme funkciu `hi`, tak ju použime v cykle:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Tu je plný kód, ktorý napíšeme do súboru:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

A keď to spustíme:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Katka!
    Dalsie dievca
    Ahoj Monika!
    Dalsie dievca
    Ahoj Zuzka!
    Dalsie dievca
    Ahoj Ola!
    Dalsie dievca
    Ahoj Ty!
    Dalsie dievca
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

`for` môžeš pomocou funkcie `range` použiť aj na čísla:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Čo vypíše:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` je funkcia, ktorá vytvára zoznam čísel s postupnosťou čísel (krajné čísla funkcii poskytneš ako parametre).

Všimni si, že druhé číslo sa nenachádza vo výstupnom zozname (teda `range(1, 6)` počíta od 1 po 5, ale neobsahuje číslo 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Zhrnutie

To je všetko. **Si úplne geniálna!** Toto bola náročná kapitola, takže by si mala byť na seba pyšná. My sme rozhodne hrdí na teba, že si to zvládla až potiaľto!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Koláčik](images/cupcake.png)