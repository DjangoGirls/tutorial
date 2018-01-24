# Úvod do Pythonu

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Pojďme napsat nějaký kód!

## Interaktivní režim Pythonu

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Chceš-li si začít hrát s Pythonem, musíme otevřít *příkazový řádek* v počítači. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Jakmile budeš připravena, postupuj podle níže uvedených pokynů.

Chceme otevřít Python konzoli, tak napiš `python` na Windows nebo `python3` na Mac a OS/Linuxu a zmáčkni `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Tvůj první příkaz v Pythonu!

Po spuštění interaktivního režimu Python, se výzva na řádku změní na `>>>`. Pro nás to znamená, že pro tuto chvíli můžeme používat pouze příkazy v jazyce Python. You don't have to type in `>>>` – Python will do that for you.

Pokud chceš ukončit Python konzoli, kdykoliv stačí zadat `exit()` nebo použít zkratku `Ctrl + Z` na Windows a `Ctrl + D` pro Mac/Linux. Pak již neuvidíš `>>>`.

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

Chvíli si s tím hraj a pak se sem vrať zpátky. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Řetězce

A co tvé jméno? Zadej své jméno do uvozovek, jak vidíš níže:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" 
"Ola"
```

Nyní jsi vytvořila svůj první řetězec! Je to posloupnost znaků, které mohou být zpracovány počítačem. Řetězec musí vždy začínat a končit stejným znakem. To může být jednoduchá (`'`) nebo dvojitá (`"`) uvozovka (neexistuje žádný rozdíl!) Uvozovkami Pythonu říkáš, že to co je uvnitř, je řetězec.

Řetězce mohou být spojovány. Zkus toto:

{% filename %}command-line{% endfilename %}

```python
>>> "Ahoj" + "Ola" 
'Ahoj Ola'
```

Také můžeš násobit řetězce s číslem:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3 
'OlaOlaOla'
```

Pokud budeš chtít dát apostrof dovnitř svého řetězce, máš dvě možnosti, jak to udělat.

Pomocí dvojité uvozovky:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill" 
"Runnin' down the hill"
```

nebo použít escape sekvenci - před apostrof napsat zpětné lomítko (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill' 
"Runnin' down the hill"
```

Pěkné, co? Chceš-li vidět své jméno velkými písmeny, jednoduše zadej:

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

Zajímá tě, proč někdy voláš funkce s `.` na konci řetězce (jako `"Ola".upper()`) a někdy nejprve zavoláš funkci a vložíš řetězec do závorek? V některých případech funkce patří do objektů, jako `upper()`, což lze provést pouze u řetězců. V tomto případě nazýváme funkci **metodou**. Jindy, funkce nepatří k ničemu konkrétnímu a lze ji použít na různé typy objektů, stejně jako `len()`. To je důvod, proč předáváme `"Ola"` jako parametr pro funkci `len`.

### Shrnutí

OK dost řetězců. Co jsi se zatím naučila:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

To jsou základy každého programovacího jazyka. Připravena na něco dalšího? Vsadíme se, že ano!

## Chyby

Pojďme zkusit něco nového. Můžeme zkusit zjistit délku čísla stejným způsobem, jakým jsme zjišťovali délku našeho jména? Zadej `len(304023)` a stiskni klávesu `Enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023) 
Traceback (most recent call last):   
File "<stdin>", 
line 1, in <module> 
TypeError: object of type 'int' has no len()
```

Zobrazila se ti naše první chyba! Ta říká, že objekty typu "int" (integers, celá čísla) nemají délku. Tak co můžeme udělat teď? Možná můžeme zkusit napsat naše číslo jako řetězec? Řetězce mají délky, že?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023)) 
6
```

Funguje to! Použili jsme funkci `str` uvnitř funkce `len`. `str()` vše převádí na řetězec.

- Funkce `str`převede věci do **řetězců**
- Funkce `int` převede věci na **celá čísla**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Proměnné

Důležitým konceptem v programování jsou proměnné. Proměnná není nic jiného než pojmenování něčeho co budeme chtít použít později. Programátoři proměnné používají k ukládání dat, aby jejich kód byl čitelnější a nemusejí si pamatovat co dané věci jsou.

Řekněme, že chceme vytvořit novou proměnnou s názvem `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Jak jsi si jistě všimla, tvůj program nic nevrátil jako to dělal před tím. Jak tedy víme, že proměnná skutečně existuje? Jednoduše zadejte `name` a stiskni klávesu `Enter`:

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

Můžeš ji také použít ve funkcích:

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

Ale co když použijeme nesprávné jméno? Dokážeš odhadnout, co se stane? Pojďme to zkusit!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo" 
>>> ctiy 
Traceback (most recent call last):   File "<stdin>", line 1, in <module> 
NameError: name 'ctiy' is not defined
```

Chyba! Jak vidíš, Python má různé typy chyb a tato se nazývá **NameError**. Python ti vrátí tuto chybu pokud se pokusíš použít proměnnou, která nebyla dosud definována. Pokud někdy dojde k této chybě, zkontrolujte svůj kód, aby jsi zjistila jestli jsi nesprávně nezadala nějaké jméno.

Hraj si s tím chvilku ať vidíš co se s tím dá dělat!

## Funkce print

Zkuste toto:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria' 
>>> name 
'Maria' 
>>> print(name) 
Maria
```

Zadáš-li jen `name`, interpretr Pythonu reaguje na řetězcovou *reprezentaci* proměnné "name", což jsou písmena M-a-r-i-a, obklopená jednoduchými uvozovkami ''. Když napíšeš `print(name)`, Python vypíše obsah proměnné na obrazovku bez uvozovek, což vypadá lépe.

Jak uvidíme později, funkce `print()` je také užitečná, když chceme vypsat věci uvnitř funkce, nebo když chceme tisknout věci na více řádcích.

## Seznamy

Vedle řetězců a celých čísel má Python další druhy různých typů objektů. Teď se podíváme na jeden co se nazývá **list**. Seznamy jsou přesně to, co si myslíš, že jsou: jsou to objekty, které obsahují seznam ostatních objektů. :)

Nestyď se a vytvoř seznam:

{% filename %}command-line{% endfilename %}

```python
>>> [] 
[]
```

Ano, tento seznam je prázdný. Není velmi užitečný, že? Pojďme vytvořit seznam čísel z loterie. Nechceme se stále opakovat, takže seznam uložíme také do proměnné:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Dobrá máme seznam! Co s ním můžeme dělat? Uvidíme, kolik čísel loterie je v seznamu. Máš nějakou představu, jakou funkci bys měla použít? Už to přeci víš!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery) 
6
```

Ano! Funkce `len()` ti zjistí počet objektů v seznamu. Šikovné, že? Možná by jsme je teď měli zkusit seřadit:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Tato funkce nic nevrátí, jen změní pořadí čísel v seznamu. Pojďme ho znovu vypsat a uvidíme co se stalo:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery) 
[3, 12, 19, 30, 42, 59]
```

Jak můžeš vidět, čísla v seznamu jsou nyní seřazeny od nejnižší do nejvyšší hodnoty. Gratulujeme!

Také můžeme zkusit obrátit pořadí? Udělejme to!

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

Pokud chceš zobrazit pouze první číslo, můžeš to udělat pomocí **indexů**. Index je číslo, které říká, kde v seznamu položky najde. Programátoři preferují počítání od 0, takže první objekt v seznamu je v indexu 0, další je v 1 a tak dále. Zkuste toto:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0]) 
59 
>>> print(lottery[1]) 
42
```

Jak můžeš vidět, pro přístup k různým objektům ve tvém seznamu použiješ jméno seznamu a index objektu uvnitř hranatých závorek.

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

Funguje to všechno skvěle!

Pro další zábavu, zkus nějaké jiné indexy: 6, 7, 1000, -1, -6 nebo -1000. Pokus se předpovědět výsledek před zadáním příkazu. Jsou výsledky správné?

Seznam všech dostupných metod pro seznam nalezneš v této kapitole Python dokumentace: https://docs.python.org/3/tutorial/datastructures.html

## Slovníky

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {} 
{}
```

Vidíš, že jsi právě vytvořila prázdný slovník. Hurá!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Klíč `name` odkazuje na hodnotu `"Ola"` (`string/řetězcový` objekt),
- Klíč`country`, ukazuje na `"Polsko"` (další `řetězec`),
- a `favorite_numbers` ukazuje `[7, 42, 92]` (`list/seznam` obsahující 3 čísla).

Můžeš zkontrolovat obsah jednotlivých klíčů následující syntaxí:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name']) 
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Co se stane, když se zeptáme Pythonu na hodnotu klíče, který neexistuje? Můžeš hádat? Pojďme to vyzkoušet a uvidíš!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age'] 
Traceback (most recent call last):  
File "<stdin>", line 1, in <module> 
KeyError: 'age'
```

Podívej, další chyba! Toto je **KeyError**. Python ti napomáhá a řekne ti, že klíč `"věk"` neexistuje v tomto slovníku.

Kdy použít slovník a kdy seznam? To je dobrý postřeh k zamyšlení. Kdy použít jakou variantu pochopíš, až si přečteš následující řádky.

- Potřebuješ jen seřazenou sekvenci položek? Použij seznam.
- Pokud potřebuješ přiřadit hodnotám klíče, aby jsi je mohla později efektivně vyhledávat (klíčem)? Používej slovník.

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

You can use the `pop()` method to delete an item in the dictionary. Například pokud chceš odstranit záznam, kterému odpovídá klíč `"favorite_numbers"`, zadej následující příkaz:

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

### Shrnutí

Skvělé! Nyní víš o programování hodně. V této poslední části jsi se naučila o:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Jsi připravena na další část? :)

## Porovnávání věcí

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2 
True 
>>> 3 < 1 
False >>> 5 > 2 * 2 
True 
>>> 1 == 1 
True 
>>> 5 != 2 
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

Zajímá tě, proč jsme dali dva symboly rovná se `==` vedle sebe, pro porovnání zda-li jsou čísla stejná? Jedno rovná se `=` používáme pro přiřazení hodnoty do proměnné. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Můžeme také zjišťovat, že se věci navzájem nerovnají. Pro takové porovnání můžeme použít symbol `!=`, jak je uvedeno v příkladu výše.

Dejme Pythonu dva další úkoly:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2 
True 
>>> 3 <= 2 
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y znamená: x je větší než y
- x `<` y znamená: x je menší než y
- x `<=` y znamená: x je menší nebo rovno y
- x `>=` y znamená: x je větší nebo rovno y

Úžasné! Chceš zkusit ještě něco? Zkuste tohle:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3 
True 
>>> 3 > 2 and 2 < 1 
False 
>>> 3 > 2 or 2 < 1 
True
```

Pythonu můžeš dát porovnat tolik čísel kolik chceš a na vše ti dá odpověď! Je docela chytrý, že?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Už jsi někdy slyšela výraz "srovnávat jablka a hrušky"? Zkusme v Pythonu ekvivalent:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Zde vidíš, že stejně jako nelze srovnávat "jablka a hrušky", Python není schopen porovnávat řetězce (`str`) a čísla (`int`). Místo toho zobrazí **TypeError** a říká nám, že tyto dva typy nelze srovnávat společně.

## Logic hodnoty/Booleany

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Pravdivostní hodnoty mohou být také v proměnné! Viz zde:

{% filename %}command-line{% endfilename %}

```python
>>> a = True 
>>> a 
True
```

Rovněž to můžete provést takto:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5 
>>> a 
False
```

Zkoušej a bav se s logickými hodnotami. Zkus spustit následující příkazy:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Gratulujeme! Logické hodnoty jsou jedny z nejbezvdnějších vlastností v programování, a právě jste se je naučili používat!

# Ulož to!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Zatím jsme psali všechny naše programy v konzoli v interaktivním režimu Pythonu, který nás omezuje na jeden řádek kódu v jednu chvíli. Normální programy jsou uloženy v souborech a spouští je **konzole** nebo **překladač** programovacího jazyku. Zatím jsme spouštěli naše programy po jednom řádku v **konzoli, v interaktivním režimu** Python. Pro příštích několik úkolů budeme potřebovat více než jeden řádek kódu, takže rychle musíme:

- Ukončit interaktivní režim Pythonu
- Otevřít tvůj zvolený editor kódu
- Ulož nějaký kód do nového pythnovského souboru
- Spusť ho!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Tak se dostaneš zpět do příkazové řádky.

Dříve jsi si vybrala editor kódu v části [editor kódu](../code_editor/README.md). Nyní potřebujeme otevřít editor a napsat vlastní kód do nového souboru:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Samozřejmě teď jsi již pěkně ostřílená python programátorka, tak neváhej napsat nějaký kód, který jsi se dnes naučila.

Teď potřebujeme uložit vytvořený soubor a dát mu popisný název. Pojďme ho nazvat **python_intro.py** a uložte jej na plochu. Soubor můžeš pojmenovat jakkoliv chceš, ale důležitá věc je, aby jsi se ujistila, že soubor končí na **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. To se nazývá "zvýrazňování syntaxe" a je to opravdu užitečná funkce při kódování. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). To je jeden z důvodů, proč používáme editory kódu. :)

Pokud máš soubor uložen je čas jej spustit! Pomocí dovedností, které jsi se naučila v sekci příkazová řádka, pomocí terminálu **změň adresář** na plochu.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Macu bude příkaz vypadat přibližně takto:

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

Pokud nevíš jak dál, stačí požádat o pomoc kouče.

Nyní pomocí Pythonu spustíš kód v souboru takto:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

V pořádku! Právě jsi spustila svůj první program v Pythonu, který byl uložen do souboru. Cítíš se úžasně?

Nyní můžeme přejít k základním nástrojům pro programování:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Nahraďte kód v souboru **python_intro.py** tímto:

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
    

Python očekává, že mu dáš další pokyny, které mají být provedeny pokud bude podmínka `3 > 2` splněna (`True`). Řekněme tedy Pythonu, ať vypíše "Funguje to!". Změň svůj kód v souboru **python_intro.py** na tento:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Všimla sis, jak jsme odsadili poslední řádek kódu o 4 mezery? Musíme to udělat, podle toho Python pozná, jakou část kódu má spustit pokud vyhodnotí předchozí výraz jako true. Můžete udělat jen jednu mezeru, ale téměř všichni programátoři v Pythonu dělají 4, aby kód vypadal upraveně a čitelně. Jeden `Tab` bude také počítán jako 4 mezery.

Ulož a spusť:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py 
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Co když podmínka není pravdivá?

V předchozích příkladech byl kód proveden pouze v případě, že podmínky byly splněny. Python má také příkazy `elif` a `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Pokud je výraz pravdivý po spuštění se vytiskne:

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

a spusť:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Viděla jsi co se tam stalo? `elif` umožňuje přidat další podmínky, které se spustí pokud se předchozí podmínky nezdaří.

Můžeš přidat tolik `elif` příkazů, kolik se ti zlíbí po počátečním `if`. Například:

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

Python prochází a testuje každou položku v posloupnosti a vypíše:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
     dokonalé, můžete slyšet všechny detaily
    

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

### Shrnutí

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Čas na poslední část této kapitoly!

## Vlastní funkce!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Funkce je sled instrukcí, které by měl Python provést. Každá funkce v Pythonu začíná s klíčovým slovem `def`, dále je uveden název a funkce může mít také nějaké parametry. Let's give it a go. Nahraď kód v **python_intro.py** následujícím:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Naše první funkce je připravena!

Asi se divíš, proč jsme napsali název funkce v dolní části souboru. To je proto, že Python přečte soubor a spustí ho od shora dolů. Pokud chceš využívat svou funkci, musíš její název znovu napsat dole (tím jí zavoláš/spustíš).

Tak to teď zkus a uvidíš co se stane:

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

Jak vidíš, nyní jsme přidali naší funkci parametr, `name`:

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

Pamatuj si: Funkce `print` je odsazená čtyři mezery v příkazu `if`. To je proto, aby se funkce spustila, pokud je splněna podmínka. Podívej se, jak to funguje nyní:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Traceback (most recent call last): 
    File "python_intro.py", line 10, in <module>
       hi() 
    TypeError: hi() missing 1 required positional argument: 'name'
    

Jejda chyba. Naštěstí Python nám vypsal docela užitečné chybovou zprávu. Jak můžeš vidět nyní funkce `hi()` (kterou jsme definovali) má jeden povinný parametr `(s názvem name)` a zapomněli jsme ho předat při volání funkce. Pojďme to opravit v následující části:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

A znovu jej spusťte:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Ola!
    

Pokud změníme jméno?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

S SpuStíme:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

To je paráda, co? Nemusíš se opakovat a měnit touto cestou jméno pokaždé, když chceš aby funkce pozdravila jinou osobu. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Pojďme zavolat náš nový kód:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py 
    Hi Rachel!
    

Blahopřejeme! Právě jste se naučili, jak psát funkce! :)

## Smyčky/Loops

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Nyní pojďme na poslední část. To bylo rychlé, co? :)

Programátoři se neradi opakují. Programování je o automatizaci věci, takže nechceme zdravit každého člověka podle jeho jména, manuálně, že? Zde se budou smyčky hodit.

Ještě si vzpomínáš na seznamy? Udělejme seznam dívek:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Chceme pozdravit všechny s použitím jejich jména. Máme funkci `hi` která to umí udělat. Tak ji použijeme ve smyčce:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Zde je celý kód, který umístíme do souboru:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

A když ho spustíme:

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
    

Jak můžeš vidět, vše co jsi vložila dovnitř příkazu `for` s odsazením, se zopakuje pro každý element seznamu `girls`.

Ve funkci `for` můžeš také použít čísla pomocí funkce `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
     print(i)
```

Což ti vypíše:

{% filename %}command-line{% endfilename %}

    1 
    2
    3 
    4 
    5
    

`range` je funkce, která vytvoří seznam s posloupností čísel (tyto čísla zadáváš jako parametry funkce).

Všimni si, že druhé z těchto dvou čísel není zahrnuto v seznamu, který je výstupem Pythonu (`range (1, 6)` počítá od 1 do 5, ale nezahrnuje číslo 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Shrnutí

A je to. **Jsi naprosto skvělá!** To byla složitá kapitola, takže měla bys být na sebe hrdá. My jsme na tebe velmi hrdí za to, že jsi se dostala tak daleko!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Hrnek](images/cupcake.png)