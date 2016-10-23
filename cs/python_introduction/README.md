# Úvod do Pythonu

> Část této kapitoly je založena na kurzu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Pojďme napsat nějaký kód!

## Interaktivní režim Pythonu

Chceš-li si začít hrát s Pythonem, musíme otevřít *příkazový řádek* v počítači. Již bys měla vědět jak na to – naučily jsme se to v kapitole [Úvod do příkazového řádku][1].

 [1]: ../intro_to_command_line/README.md

Jakmile budeš připravena, postupuj podle níže uvedených pokynů.

Chceme otevřít Python konzoli, takže napiš `python` na Windows nebo `python3` na Mac a OS/Linuxu a zmáčkni `enter`.

```
    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
```  

## Tvůj první příkaz v Pythonu!

Po spuštění interaktivního režimu Python se výzva na řádku změní na `>>>`. Pro nás to znamená, že pro tuto chvíli můžeme používat pouze příkazy v jazyce Python. Není nutné zadávat `>>>` - Python to udělá za tebe.

Pokud chceš ukončit Python konzoli, kdykoliv stačí zadat `exit()` nebo použít zkratku `Ctrl + Z` na Windows a `Ctrl + D` pro Mac/Linux. Pak již neuvidíš `>>>`.

Pro tuto chvíli nechceme Python konzoli opustit. Chceme se o ní naučit více. Začněme s něčím opravdu jednoduchým. Například zkusme napsat nějakou matematiku. Napiš třeba `2 + 3` a zmáčkni `enter`.

```
    >>> 2 + 3
    5
```  

Hezké! Vidíš, jak se zobrazila odpověď? Python umí matematiku! Můžeš zkusit jiné příkazy typu: `4 * 5` ; `5-1` ; `40 / 2`

Chvíli si s tím hraj a pak se sem vrať zpátky :).

Jak vidíš, Python je skvělá kalkulačka. Pokud tě zajímá, co jiného můžeš dělat...

## Řetězce

A co tvé jméno? Zadej své jméno do uvozovek, jak vidíš níže:

```
    >>> "Ola"
    "Ola"
```  

Nyní jsi vytvořila svůj první řetězec! Je to posloupnost znaků, které mohou být zpracovány počítačem. Řetězec musí vždy začínat a končit stejným znakem. To může být jednoduchá (`'`) nebo dvojitá (`"`) uvozovka (neexistuje žádný rozdíl!) Uvozovkami Pythonu říkáš, že co je uvnitř, je řetězec.

Řetězce mohou být spojovány. Zkus toto:

```
    >>> "Ahoj " + "Ola"
    'Ahoj Ola'
```  

Také můžeš násobit řetězce s číslem:

```
    >>> "Ola" * 3
    'OlaOlaOla'
```  

Pokud budeš chtít dát apostrof dovnitř svého řetězce, máš dvě možnosti, jak to udělat.

Pomocí dvojité uvozovky:

```
    >>> "Runnin' down the hill"
    "Runnin' down the hill"
```  

nebo použít escape sekvenci - před apostrof napsat zpětné lomítko (\`):

```
    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"
```

Pěkné, co? Chceš-li vidět své jméno velkými písmeny, jednoduše zadej:

```
    >>> "Ola".upper()
    'OLA'
```  

Právě jsi použila `upper` **funkci** na svém řetězci! Funkce (jako `upper()`) je sled instrukcí, které Python provádí na daném objektu (`"Ola"`) poté, co ji zavoláš.

Pokud chceš znát počet písmen ve svém jméně, tak pro to má Python také funkci!

```
    >>> len("Ola")
    3
```  

Zajímá tě, proč někdy voláš funkce s `.` na konci řetězce (jako `"Ola".upper()`) a někdy nejprve zavoláš funkci a vložíš řetězec do závorek? V některých případech funkce patří do objektů, jako `upper()`, což lze provést pouze u řetězců. V tomto případě nazýváme funkci **metodou**. Jindy, funkce nepatří k ničemu konkrétnímu a lze ji použít na různé typy objektů, stejně jako `len()`. To je důvod, proč předáváme `"Ola"` jako parametr pro funkci `len`.

### Shrnutí

OK, dost bylo řetězců. Co ses zatím naučila:

*   **interaktivní režim Pythonu** - zadávání příkazů (kódu) do Pythonového interaktivního režimu a zobrazení výsledku/odpovědi v Pythonu
*   **čísla a řetězce** - v Pythonu se čísla používají pro matematiku a řetězce pro textové objekty
*   **operátor** - jako + a * kombinuje hodnoty a vytvoří nové
*   **funkce** - jako upper() a len() provádí akce u objektů.

To jsou základy každého programovacího jazyka. Připravena na něco dalšího? Vsadíme se, že ano!

## Chyby

Pojďme zkusit něco nového. Můžeme zkusit zjistit délku čísla stejným způsobem, jakým jsme zjišťovali délku našeho jména? Zadej `len(304023)` a stiskni klávesu `Enter`:

```
    >>> len(304023)
    Traceback (most recent call last):   
    File "<stdin>",
    line 1, in <module>
    TypeError: object of type 'int' has no len()
```  

Zobrazila se ti naše první chyba! Ta říká, že objekty typu "int" (integers, celá čísla) nemají délku. Tak co můžeme udělat teď? Možná můžeme zkusit napsat naše číslo jako řetězec? Řetězce mají délky, že?

```
    >>> len(str(304023))
    6
```  

Funguje to! Použili jsme funkci `str` uvnitř funkce `len`. `str()` vše převádí na řetězec.

*   Funkce `str`převede věci do **řetězců**
*   Funkce `int` převede věci na **celá čísla**

> Důležité upozornění: můžeme převést čísla na text, ale nemůžeme jen tak převést text na čísla - co by se stalo, kdybychom se pokusily o toto: `int('hello')`?

## Proměnné

Důležitým konceptem v programování jsou proměnné. Proměnná není nic jiného než pojmenování něčeho, co budeme chtít použít později. Programátoři proměnné používají k ukládání dat, aby byl jejich kód čitelnější a nemuseli si pamatovat, co dané věci jsou.

Řekněme, že chceme vytvořit novou proměnnou s názvem `name`:

```
    >>> name = "Ola"
```  

Vidíš? Je to snadné! Jednoduše napíšeš: name se rovná Ola.

Jak sis jistě všimla, tvůj program nevrátil nic jako předtím. Jak tedy víme, že proměnná skutečně existuje? Jednoduše zadejte `name` a stiskni klávesu `Enter`:

```
    >>> name
    'Ola'
```  

Hurá! První proměnná :)! Kdykoli můžeš změnit to, na co daná proměnná ukazuje:

```
    >>> name = "Sonja"
    >>> name
    'Sonja'
```  

Můžeš ji také použít ve funkcích:

```
    >>> len(name)
    5
```  

Super, ne? Samozřejmě proměnná může obsahovat cokoliv, například také čísla! Zkus tohle:

```
    >>> a = 4
    >>> b = 6
    >>> a * b
    24
```  

Ale co když použijeme nesprávné jméno? Dokážeš odhadnout, co se stane? Pojďme to zkusit!

```
    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):   File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
```  

Chyba! Jak vidíš, Python má různé typy chyb a tato se nazývá **NameError**. Python ti vrátí tuto chybu, pokud se pokusíš použít proměnnou, která nebyla dosud definována. Pokud někdy dojde k této chybě, zkontroluj svůj kód, abys zjistila, jestli jsi nezadala nějaké jméno nesprávně.

Chvilku si s tím, ať vidíš, co se s tím dá dělat!

## Funkce print

Zkus toto:

```
    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria
```  

Zadáš-li jen `name`, interpretr Pythonu reaguje na řetězcovou *reprezentaci* proměnné "name", což jsou písmena M-a-r-i-a, obklopená jednoduchými uvozovkami ''. Když napíšeš `print(name)`, Python vypíše obsah proměnné na obrazovku bez uvozovek, což vypadá lépe.

Jak uvidíme později, funkce `print()` je také užitečná, když chceme vypsat věci uvnitř funkce nebo na více řádcích.

## Seznamy

Vedle řetězců a celých čísel má Python další druhy různých typů objektů. Teď se podíváme na jeden, který se nazývá **list**. Seznamy jsou přesně to, co si myslíš, že jsou: jsou to objekty, které obsahují seznam ostatních objektů :)

Nestyď se a vytvoř seznam:

```
    >>> []
    []
```  

Ano, tento seznam je prázdný. Není moc užitečný, že? Pojďme vytvořit seznam čísel z loterie. Nechceme se stále opakovat, takže seznam uložíme také do proměnné:

```
    >>> lottery = [3, 42, 12, 19, 30, 59]
```  

Dobrá máme seznam! Co s ním můžeme dělat? Uvidíme, kolik čísel loterie je v seznamu. Máš nějakou představu, jakou funkci bys měla použít? Už to přeci víš!

```
    >>> len(lottery)
    6
```  

Ano! Funkce `len()` ti zjistí počet objektů v seznamu. Šikovné, že? Možná bychom je teď měli zkusit seřadit:

```
    >>> lottery.sort()
```  

Tato funkce nic nevrátí, jen změní pořadí čísel v seznamu. Pojďme ho znovu vypsat a uvidíme co se stalo:

```
    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]
```  

Jak můžeš vidět, čísla v seznamu jsou nyní seřazena od nejnižší k nejvyšší hodnotě. Gratulujeme!

Můžeme také zkusit obrátit pořadí? Udělejme to!

```
    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
```  

Snadné, že? Pokud chceš něco přidat do svého seznamu, můžeš to provést zadáním tohoto příkazu:

```
    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
```  

Pokud chceš zobrazit pouze první číslo, můžeš to udělat pomocí **indexů**. Index je číslo, které říká, kde se v seznamu položka najde. Programátoři preferují počítání od 0, takže první objekt v seznamu je v indexu 0, druhý je v indexu 1 a tak dále. Zkus toto:

```
    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
```  

Jak vidíš, pro přístup k různým objektům ve tvém seznamu použiješ jméno seznamu a index objektu uvnitř hranatých závorek.

Chceš-li odstranit něco ze svého seznamu, budeš muset použít **indexy**, jak jsme se dozvěděli výše, a příkaz `pop()`. Zkusme to, co jsme se naučily dříve; budeme odstraňovat první číslo našeho seznamu.

```
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(lottery[0])
    59
    >>> lottery.pop(0)
    >>> print(lottery)
    [42, 30, 19, 12, 3, 199]
```  

Funguje to všechno skvěle!

Pro další zábavu zkus nějaké jiné indexy: 6, 7, 1000, -1, -6 nebo -1000. Pokus se předpovědět výsledek před zadáním příkazu. Jsou výsledky správné?

Seznam všech dostupných metod pro seznam nalezneš v této kapitole Python dokumentace: https://docs.python.org/3/tutorial/datastructures.html

## Slovníky

Slovník je podobný seznamu, ale pro přístup k hodnotám se používá klíč místo indexu. Klíč může být jakýkoli řetězec nebo číslo. Syntaxe pro definování prázdného slovníku je:

```
    >>> {}
    {}
```  

Vidíš, že jsi právě vytvořila prázdný slovník. Hurá!

A teď zkus napsat následující příkaz (zkus nahradit vlastními informacemi):

```
    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```  

Tímto příkazem jsi právě vytvořila proměnnou s názvem `participant` s třemi dvojicemi klíčů hodnot:

*   Klíč `name` odkazuje na hodnotu `"Ola"` (`string/řetězcový` objekt),
*   klíč`country`, ukazuje na `"Polsko"` (další `řetězec`)),
*   a `favorite_numbers` ukazuje `[7, 42, 92]` (`list/seznam` obsahující 3 čísla).

Můžeš zkontrolovat obsah jednotlivých klíčů následující syntaxí:

```
    >>> print(participant['name'])
    Ola
```  

Je to podobné seznamu. Ale není nutné si pamatovat index - jen jméno.

Co se stane, když se zeptáme Pythonu na hodnotu klíče, který neexistuje? Zkus hádat! Pojďme to vyzkoušet a uvidíš!

```
    >>> participant['age']
    Traceback (most recent call last):  
    File "<stdin>", line 1, in <module>
    KeyError: 'age'
```  

Podívej, další chyba! Toto je **KeyError**. Python ti napomáhá a řekne ti, že klíč `"věk"` v tomto slovníku neexistuje.

Kdy použít slovník a kdy seznam? To je dobrý postřeh k zamyšlení. Kdy použít jakou variantu pochopíš, až si přečteš následující řádky.

*   Potřebuješ jen seřazenou sekvenci položek? Použij seznam.
*   Pokud potřebuješ přiřadit hodnotám klíče, abys je mohla později efektivně vyhledávat (klíčem)? Používej slovník.

Slovníky stejně jako seznamy jsou *mutable/proměnlivé*, což znamená, že je lze změnit po jejich vytvoření. Do slovníku můžeš přidat nové páry klíč/hodnota po jeho vytvoření:

```
    >>> participant['favorite_language'] = 'Python'
```  

Stejně jako u seznamů můžeš použít metodu `len()` na slovníky, vrací počet párů klíč/hodnota ve slovníku. Nestyď se a zadej příkaz:

```
    >>> len(participant)
    4
```  

Doufám, že ti to nyní dává větší smysl. :) Připravena na více zábavy se slovníky? Pojďme na další řádek a další úžasné věci.

Příkazem `pop()` odstraníš položky ve slovníku. Například pokud chceš odstranit záznam, kterému odpovídá klíč `"favorite_numbers"`, zadej následující příkaz:

```
    >>> participant.pop('favorite_numbers')
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```  

Jak vidíš, z výstupu byla odstraněna odpovídající dvojice klíč hodnota 'favorite_numbers'.

Kromě toho můžeš také změnit hodnotu přidruženou k již vytvořenému klíči ve slovníku. Napiš:

```
    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```  

Jak můžeš vidět, hodnota klíče `'country'` se změnila z `"Poland"` na `"Germany"`. :) Úžasné? Hurá! Právě jsi se naučila další úžasnou věc.

### Shrnutí

Skvělé! Nyní víš o programování hodně. V této poslední části jsi se naučila o:

*   **errors/chyby** - nyní víš jak číst a pochopit chyby, které ti Python zobrazí, pokud nerozumí příkazu, který jsi zadala
*   **proměnné/variables** - názvy pro objekty, které umožňují psát kód snadněji tak, aby byl čitelnější
*   **seznamy/lists** - seznamy objektů uložených v určitém pořadí
*   **slovníky/dictionaries** - objekty, které jsou uloženy jako dvojice klíč–hodnota

Jsi připravena na další část?

## Porovnávání věcí

Velká část programování zahrnuje porovnání věci. Co je nejjednodušší věc k porovnání? Čísla, samozřejmě. Podívejme se, jak to funguje:

```
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

Dali jsme Pythonu nějaká čísla na porovnání. Jak vidíš, Python může porovnávat nejen čísla, ale může také porovnat výsledky metod. Pěkný, co?

Zajímá tě, proč jsme daly dva symboly rovná se `==` vedle sebe pro porovnání, zda jsou čísla stejná? Jedno rovnítko `=` používáme pro přiřazení hodnoty do proměnné. Vždy, **vždy** musíte dát dvě rovnítka `==`, pokud chcete zkontrolovat, jestli se věci navzájem rovnají. Můžeme také zjišťovat, že se věci navzájem nerovnají. Pro takové porovnání můžeme použít symbol `!=`, jak je uvedeno v příkladu výše.

Dejme Pythonu dva další úkoly:

```
    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
```    

`>` a `<` jsou pro použití snadné, ale co `> =` a `< =` - víš, co se tím myslí? Podívejme se na to:

*   x `>` y znamená: x je větší než y
*   x `<` y znamená: x je menší než y
*   x `<=` y znamená: x je menší nebo rovno y
*   x `>=` y znamená: x je větší nebo rovno y

Úžasné! Chceš zkusit ještě něco? Zkuste tohle:

```
    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
```  

Pythonu můžeš dát porovnat tolik čísel kolik chceš a na vše ti dá odpověď! Je docela chytrý, že?

*   **and** - Pokud použiješ operátor `and`, obě strany musí být pravdivé, aby celý příkaz byl pravdivý
*   **or** - Pokud použiješ operátor `or`, stačí, aby jen jedna strana z porovnání byla pravdivá, aby celý příkaz byl pravdivý

Už jsi někdy slyšela výraz "srovnávat jablka a hrušky"? Zkusme v Pythonu ekvivalent:

```
    >>> 1 > 'django'
    Traceback (most recent call last):   
    File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
```  

Zde vidíš, že stejně jako nelze srovnávat "jablka a hrušky", Python není schopen porovnávat řetězce (`str`) a čísla (`int`). Místo toho zobrazí **TypeError** a říká nám, že tyto dva typy nelze srovnávat společně.

## Logic hodnoty/Booleany

Mimochodem právě jste se dozvěděly o novém typu objektu v Pythonu. Říká se mu **boolean** a je to asi nejjednodušší typ.

Existují pouze dva logické objekty: - True - False

Aby Python pochopil, že se jedná o tento typ, je potřeba vždy psát jako True (první písmeno velké, zbytek malý). **true, TRUE, tRUE nebude fungovat – jedině True je správně.** (Totéž samozřejmě platí pro False.)

Pravdivostní hodnoty mohou být také v proměnné! Viz zde:

```
    >>> a = True
    >>> a
    True
```  

Rovněž to můžete provést takto:

```
    >>> a = 2 > 5
    >>> a
    False
```  

Zkoušej a bav se s logickými hodnotami. Zkus spustit následující příkazy:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Gratulujeme! Logické hodnoty jsou jedny z nejbezvadnějších vlastností v programování a vy jste se je právě naučily používat!

# Ulož to!

Zatím jsme psaly všechny naše programy v konzoli v interaktivním režimu Pythonu, který nás omezuje na jeden řádek kódu v jednu chvíli. Normální programy jsou uloženy v souborech a spouští je **konzole** nebo **překladač** programovacího jazyku. Zatím jsme spouštěly naše programy po jednom řádku v **konzoli, v interaktivním režimu** Python. Pro příštích několik úkolů budeme potřebovat více než jeden řádek kódu, takže rychle musíme:

*   Ukončit interaktivní režim Pythonu
*   Otevřít náš zvolený editor kódu
*   Uložit nějaký kód do nového pythonovského souboru
*   Spustit ho!

Chceš-li opustit interaktivní režim Pythonu, který jsme dosud používaly, jednoduše zadejte ~ ~ ~ exit() ~ ~ ~ funkci:

```
    >>> exit()
    $
```  

Tak se dostaneš zpět do příkazové řádky.

Dříve sis vybrala editor kódu v části [editor kódu][2]. Nyní potřebujeme editor otevřít a napsat vlastní kód do nového souboru:

 [2]: ../code_editor/README.md

```python
    print('Hello, Django girls!')
```

> **Poznámka:** Měla bys objevit jednu z nejúžasnější věcí na editorech kódu: barvy! V interaktivním režimu Pythonu mělo vše stejnou barvu, ale nyní bys měla vidět, že funkce `print` je jinou barvou než řetězec uvnitř. To se nazývá "zvýrazňování syntaxe" a je to opravdu užitečná funkce při kódování. Barvy ti napoví, že máš neuzavřený řetězce nebo překlep v názvu slova (jako `def` ve funkci, kterou uvidíš níže). To je jeden z důvodů, proč používáme editory kódu :)

Samozřejmě teď jsi již pěkně ostřílená python programátorka, tak neváhej napsat nějaký kód, který ses dnes naučila.

Teď potřebujeme uložit vytvořený soubor a dát mu popisný název. Pojďme ho nazvat **python_intro.py** a uložit jej na plochu. Soubor můžeš pojmenovat jakkoliv chceš, ale důležitá věc je, aby ses ujistila, že soubor končí na **.py**. Přípona **.py** říká našemu operačnímu systému, že jde o **spustitelný soubor Pythonu** a Python ho může spustit.

Pokud máš soubor uložen, je čas jej spustit! Pomocí dovedností, které jsi se naučila v sekci příkazová řádka, **změň adresář**  pomocí terminálu na plochu.

Na Macu bude příkaz vypadat přibližně takto:

```
    $ cd /Users/<your_name>/Desktop
```

Na Linuxu to bude vypadat takto (slovo "Desktop" (Plocha) může být přeloženo do tvého jazyka):

```
    $ cd /home/<your_name>/Desktop
```

A na Windows to bude vypadat takto:

```
    > cd C:\Users\<your_name>\Desktop
```

Pokud nevíš jak dál, stačí požádat o pomoc kouče.

Nyní pomocí Pythonu spustíš kód v souboru takto:

```
    $ python3 python_intro.py
    Hello, Django girls!
```

V pořádku! Právě jsi spustila svůj první program v Pythonu, který byl uložen do souboru. Cítíš se úžasně?

Nyní můžeme přejít k základním nástrojům pro programování:

## If...elif...else

Spousty věcí v kódu chceme provádět, jen pokud jsou splněny určité podmínky. To je důvod, proč Python má něco, čemu se říká **if statements**.

Nahraďte kód v souboru **python_intro.py** tímto:

```python
    if 3 > 2:
```

Pokud jsi soubor uložila a spustila, pravděpodobně uvidíš následující chybu:

```
    $ python3 python_intro.py
    File "python_intro.py", line 2
              ^
    SyntaxError: unexpected EOF while parsing
```

Python očekává, že mu dáš další pokyny, které mají být provedeny, pokud bude podmínka `3 > 2` splněna (`True`). Řekněme tedy Pythonu, ať vypíše "Funguje to!". Změň svůj kód v souboru **python_intro.py** na tento:

```python
    if 3 > 2:
         print('It works!')
```

Všimla sis, jak jsme odsadily poslední řádek kódu o 4 mezery? Musíme to udělat, podle toho Python pozná, jakou část kódu má spustit, pokud vyhodnotí předchozí výraz jako pravdivý. Můžete udělat jen jednu mezeru, ale téměř všichni programátoři v Pythonu dělají 4, aby kód vypadal upraveně a čitelně. Jeden `Tab` bude také počítán jako 4 mezery.

Ulož a spusť:

```
    $ python3 python_intro.py
    It works!
```

### Co když podmínka není pravdivá?

V předchozích příkladech byl kód proveden pouze v případě, že podmínky byly splněny. Python má také příkazy `elif` a `else`:

```python
    if 5 > 2:
         print('5 is indeed greater than 2')
    else:
         print('5 is not greater than 2')
```

Pokud je výraz pravdivý, po spuštění se vytiskne:

```
    $ python3 python_intro.py
    5 is not greater than 2
```

Kdyby 2 bylo větší než 5, spustil by se první příkaz. Jak snadné! Podívejme se, jak funguje `elif`:

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

```
    $ python3 python_intro.py
    Hey Sonja!
```

Viděla jsi co se tam stalo? `elif` umožňuje přidat další podmínky, které se spustí, pokud se předchozí podmínky nezdaří.

Můžeš po počátečním `if` přidat tolik `elif` příkazů, kolik se ti zlíbí. Například:

```python
    volume = 57
    if volume < 20:
         print("Je to dost potichu.")
    elif 20 <= volume < 40:
         print("Jako hudba v pozadí dobré.")
    elif 40 <= volume < 60:
         print("Skvělé, slyším všechny detaily.")
    elif 60 <= volume < 80:
         print("Dobré na party.")
    elif 80 <= volume < 100:
         print("Trochu moc nahlas!")
    else:
        print("Krvácí mi uši!")  
```

Python prochází a testuje každou položku v posloupnosti a vypíše:

```
    $ python3 python_intro.py
      Skvělé, slyším všechny detaily.
```

### Shrnutí

V posledních třech cvičeních ses dozvěděla o:

*   **Porovnání věcí** - v Pythonu můžeš porovnat věci pomocí operátorů `>`, `> =`, `==` `< =`, `<` a `and`, `or`
*   **Logické hodnoty / Booleany** - typy, které mohou mít pouze jednu ze dvou hodnot: `True` nebo `False`
*   **Ukládání do souborů** - pokud uložíme kód do souboru, můžeme spouštět velké programy
*   **if...elif...else** - příkazy, které umožňují spouštět kód pouze v případě, kdy jsou splněny určité podmínky.

Čas na poslední část této kapitoly!

## Vlastní funkce!

Pamatuješ na funkci `len()`, kterou jsi spouštěla v Pythonu? Máme pro tebe dobrou zprávu. Nyní se dozvíš, jak napsat své vlastní funkce!

Funkce je sled instrukcí, které by měl Python provést. Každá funkce v Pythonu začíná klíčovým slovem `def`, dále je uveden název a funkce může mít také nějaké parametry. Začněme u té nejlehčí. Nahraď kód v **python_intro.py** následujícím:

```python
    def hi():
         print('Hi there!')
         print('How are you?')

    hi()
```

Naše první funkce je připravena!

Asi se divíš, proč jsme napsaly název funkce v dolní části souboru. To je proto, že Python přečte soubor a spustí ho od shora dolů. Pokud chceš využívat svou funkci, musíš její název znovu napsat dole (tím ji zavoláš/spustíš).

Tak to teď zkus a uvidíš, co se stane:

```
    $ python3 python_intro.py
    Hi there!
    How are you?
```

To bylo snadné! Napišme naši první funkci s parametry. Použijeme předchozí příklad - napíšeme funkci, která nás pozdraví podle toho, jaké zadáme jméno při jejím spuštění:

```python
    def hi(name):
```

Jak vidíš, nyní jsme přidaly naší funkci parametr, `name`:

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

```
    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
       hi()
    TypeError: hi() missing 1 required positional argument: 'name'
```

Jejda, chyba. Naštěstí nám Python vypsal docela užitečnou chybovou zprávu. Jak vidíš, funkce `hi()` (kterou jsme definovaly) má jeden povinný parametr `(s názvem name)`, který jsme zapomněly při volání funkce předat. Pojďme to opravit v následující části:

```python
    hi("Ola")
```

A znovu jej spusť:

```
    $ python3 python_intro.py
    Hi Ola!
```

A co když změníme jméno?

```python
    hi("Sonja")
```

Spustíme:

```
    $ python3 python_intro.py
    Hi Sonja!
```

C myslíš, že se stane, když tam napíšeš jiné jméno než Ola nebo Sonja? Zkus to a uvidíme, jestli máš pravdu. Mělo by to vypsat toto:

```
    Hi anonymous!
```

To je paráda, co? Nemusíš se opakovat a měnit takto jméno pokaždé, když chceš, aby funkce pozdravila jinou osobu. To je přesně důvod, proč potřebujeme funkce: abychom nikdy neopakovaly náš kód!

Udělejme to ještě chytřeji – existuje více jmen než dvě a psaní podmínky pro každé jméno by bylo těžké, že?

```python
    def hi(name):
         print('Hi ' + name + '!')

    hi("Rachel")
```

Pojďme zavolat náš nový kód:

```
    $ python3 python_intro.py
    Hi Rachel!
```

Blahopřejeme! Právě ses naučila, jak psát funkce :)

## Smyčky/Loops

Nyní pojďme na poslední část. To bylo rychlé, co? :)

Programátoři se neradi opakují. Programování je o automatizaci věci, takže nechceme zdravit každého člověka podle jeho jména manuálně, že? Zde se budou smyčky hodit.

Ještě si vzpomínáš na seznamy? Udělejme seznam dívek:

```python
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Chceme pozdravit všechny s použitím jejich jména. Máme funkci `hi`, která to umí udělat. Tak ji použijeme ve smyčce:

```python
    for name in girls:
```

Příkaz ~ ~ ~ for ~ ~ ~ se chová podobně jako příkaz ~ ~ ~ if ~ ~ ~, v následujícím kódu musíme oba řádky odsadit o čtyři mezery.

Zde je celý kód, který umístíme do souboru:

```python
    def hi(name):
         print('Hi ' + name + '!')

    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    for name in girls:
         hi(name)
         print('Next girl')
```

A když ho spustíme:

```
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
```

Jak vidíš, vše, co jsi vložila dovnitř příkazu `for` s odsazením, se zopakuje pro každý prvek seznamu `girls`.

Ve funkci `for` můžeš také použít čísla pomocí funkce `range`:

```python
    for i in range(1, 6):
         print(i)
```

Což ti vypíše:

```
    1
    2
    3
    4
    5
```

`range` je funkce, která vytvoří seznam s posloupností čísel (tato čísla zadáváš jako parametry funkce).

Všimni si, že druhé z těchto dvou čísel není zahrnuto v seznamu, který je výstupem Pythonu (`range (1, 6)` počítá od 1 do 5, ale nezahrnuje číslo 6). To je proto, že "range" je z poloviny otevřený, čímž myslíme, že obsahuje první hodnotu, ale ne poslední.

## Shrnutí

A je to. **Jsi naprosto skvělá!** To byla složitá kapitola, takže bys na sebe měla být hrdá. My jsme na tebe velmi hrdí za to, že ses dostala tak daleko!

Můžeš si jít krátce odpočinout - protáhnout se, projít se, zavřít oči - než se pustíme do další kapitoly. :)

![Hrnek][3]

 [3]: images/cupcake.png
