{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Úvod do jazyka Python

> Časť tejto kapitoly je založená na tutoriáli Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Poďme napísať nejaký kód!

## Python prompt

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) videu.

Aby sme mohli začať s Pythonom, musíte otvoriť *príkazový riadok* (angl. command line) na svojom počítači. Už by ste mali vedieť ako sa to robí -- naučili ste sa to v [ Úvode do príkazového riadku](../intro_to_command_line/README.md).

Ak ste hotoví, pokračujte s inštrukciami nižšie.

Chceme otvoriť Python konzolu, takže napíšte `python` na Windowse alebo `python3` na Mac OS alebo Linux a stlačte `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Váš prvý príkaz v Pythone!

Po spustení príkazu Python sa prompt zmenil na `>>>`. Pre nás to znamená, že odteraz by sme mali písať príkazy iba v jazyku Python. Nemusíte písať `>>>` - Python to urobí pre Vás.

If you want to exit the Python console at any point, type `exit()` or use the shortcut `Ctrl + Z` for Windows and `Ctrl + D` for Mac/Linux. Potom už nebudete vidieť toto: `>>>`.

Zatiaľ nechceme opustiť Python konzolu. Chceme sa o nej dozvedieť viac. Začnime tým, že skúsime matematiku, napr. ` 2 + 3 `a stlač `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Super! Vidíte ako vyskočilo riešenie? Python vie počítať! Môžete skúsiť aj ďalšie príkazy, ako:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Aby sme vypočítali mocninu, povedzme 2 na tretiu, zadáme: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Pobavte sa s tým trošku, potom sa vráťte späť . :)

Ako vidíte, Python je dobrá kalkulačka. A ak ste zvedaví, čo všetko ešte vie…

## Reťazce ("Stringy")

Čo tak tvoje meno? Napíš svoje meno v úvodzovkách:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" 
"Ola"
```

Práve si vytvorila svoj prvý reťazec! Je postupnosť znakov, ktoré môžu byť spracované počítačom. Reťazec musí vždy začínať a končíť s rovnakým znakom. Sú to jednoduché (`'`) alebo dvojité (`"`) úvodzovky (nie je medzi nimi žiadny rozdiel!). Úvodzovky naznačujú, že to čo je medzi nimi je reťazec (string).

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

Nice, huh? To see your name in uppercase letters, type:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper() 
'OLA'
```

Práve si použila `upper` **metódu** na reťazci! Metóda (ako `upper()`) je postupnosť inštrukcií, ktoré Python vykonáva na danom objekte (`"Ola"`), potom, čo ju zavoláš.

Ak chcete poznať počet písmen, ktoré sú obsiahnuté vo vašom mene, tak na to má Python **funkciu** tiež!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola") 
3
```

Ste zvedaví, prečo voláme niekedy funkciu s bodkou (`.`) na konci reťazca (ako `"Ola".upper()`) a niekedy najprv voláme funkciu a reťazec vložíme do zátvoriek? V niektorých prípadoch funkcie patria k objektom, ako napr. `upper()`, čo môže byt vykonaná len na reťazcoch. V takomto prípade sa tieto funkcie volajú **metódy**. Inokedy funkcie nepatria k žiadnemu konkrétnemu objektu a môžu byť použité na rôzne typy objektov, rovnako ako `len()`. Preto zadáme `"Ola"` ako parameter pre funkciu `len`.

### Zhrnutie

OK, dosť už reťazcoch. Zatiaľ ste sa naučili o:

- **prompt** - píšeme príkazy (kód) do Python promptu, z čoho dostaneme výsledky zase v jazyku Python
- **čísla a reťazce** - v Pythone sú čísla použité pre počítanie a reťazce pre textové objekty
- **operátory** - ako `+` alebo `*`, z daných hodnôt vyrobia novú hodnotu
- **funkcie** - napr. `upper()` alebo `len()`, vykonávajú činnosti na objektoch.

Toto sú základy každého programovacieho jazyka. Ste pripravení na niečo ťažšie? Stavíme sa, že áno!

## Chyby

Teraz skúsme niečo nové. Je možné zistiť dĺžku nejakého čísla rovnako ako sme to robili s našim menom? Napíšte `len(304023)` a stlačte `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

We got our first error! The {{ warning_icon }} icon is our way of giving you a heads up that the code you are about to run won't work as expected. Making mistakes (even intentional ones) are an important part of learning!

It says that objects of type "int" (integers, whole numbers) have no length. So what can we do now? Maybe we can write our number as a string? Strings have a length, right?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funguje to! Použili sme funkciu `str` vo vnútri funkcie `len`. Funkcia `str()` prevedie všetko na reťazce.

- Funkcia `str` prevedie (konvertuje) všetko na **reťazce** (angl. string)
- Funkcia `int` prevedie všetko na **int** (celé čísla)

> Dôležité: je možné konvertovať čísla na reťazce, ale opačne sa to nedá vždy - inak čo by bolo napr. `int('hello')`?

## Premenné

Veľmi dôležitý pojem v programovaní je pojem premennej. Premenná je nič iné ako názov niečoho, čo môžeme použiť aj neskoršie v programe. Programátori používajú premenné aby v nich ukladali dáta, aby ich zdrojový kód bol prehľadnejší a aby nemuseli všetko držať v hlave.

Povedzme, že chceme vytvoriť novú premennú s názvom `meno`:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Ola"
```

Zadáme meno sa rovná Ola.

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Enter `name` and hit `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> meno
'Ola'
```

Hurá! Vaša prvá premenná! :) Vždy je možné zmeniť jej obsah:

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

Awesome, right? Now, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ale čo by sa stalo, keby sme použili zlý názov? Uhádnete, čo sa stane? Skúsme!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Okrem reťazcov a celých čísel, má Python všetky možné typy objektov. Teraz sa zoznámime s typom, ktorý sa volá **zoznam** (list). Zoznamy sú presne to, čo si myslíte, že sú: objekty, ktoré sú zoznamami iných objektov. :)

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

Ak chceš pridať niečo do svojho zoznamu, môžeš to urobiť zadaním tohto príkazu:

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

Aby ste odstránili niečo zo svojho zoznamu, budete potrebovať **indexy**, ako sme sa dozvedeli vyššie a príkaz `pop()`. Vyskúšajme to na príklade a zopakujme si, čo sme sa už naučili; zmažeme prvé číslo v našom zozname.

{% filename %}command-line{% endfilename %}

```python
>>> print(loteria)
[59, 42, 30, 19, 12, 3, 199]
>>> print(loteria[0])
59
>>> loteria.pop(0)
59
>>> print(loteria)
[42, 30, 19, 12, 3, 199]
```

Funguje to ako hodinky!

Pre zábavu vyskúšajte aj nejaké iné indexy: 6, 7, 1000, -1, -6 alebo -1000. Skúste predpovedať výsledok predtým ako príkaz použijete. Dávajú výsledky zmysel?

Zoznam všetkých dostupných metód pre zoznamy v tejto kapitole dokumentácie Pythonu: https://docs.python.org/3/tutorial/datastructures.html

## Slovníky

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) videu.

Slovník je podobný ako zoznam, ale k jeho hodnotám pristupujete vyhľadaním kľúča namiesto číselného indexu. Kľúč môže byť akýkoľvek reťazec alebo číslo. Syntax na definovanie prázdneho slovníka je:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

To znamená, že ste práve vytvorili prázdny slovník. Hurá!

Teraz skúste napísať nasledujúci príkaz (skúste ale nahradiť hodnoty vlastnými údajmi):

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka = {'meno': 'Ola', 'krajina': 'Slovensko', 'oblubene_cisla': [7, 42, 92]}
```

Týmto príkazom ste práve vytvorili premennú s názvom `ucastnicka` s tromi pármi kľúč-hodnota:

- Kľúč `meno` odkazuje na hodnotu `"Ola"` (objekt typu `reťazec/string`),
- `krajina` odkazuje na `"Slovensko"` (ďalší `reťazec`),
- a `oblubene_cisla` smeruje na `[7, 42, 92]` (`zoznam` s tromi číslami).

Obsah jednotlivých kľúčov môžete skontrolovať touto syntaxou:

{% filename %}command-line{% endfilename %}

```python
>>> print(ucastnicka['meno'])
Ola
```

Ako vidíte, podobá sa to na zoznam. Ale nemusíte si pamätať index - stačí meno.

Čo sa stane ak si od Pythonu vypýtame hodnotu kľúča, ktorý neexistuje? Uhádnete? Vyskúšajme to a uvidíme!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> ucastnicka['vek']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'vek'
```

Aha, ďalšia chyba! Táto sa volá **KeyError** (chyba kľúča). Python je nápomocný a povie vám, že kľúč `'vek'` v tomto slovníku neexistuje.

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

- Potrebuješ zoradenú postupnosť položiek? Vyber si zoznam (list).
- Potrebuješ priraďovať hodnoty kľúčovým slovám, aby si si ich mohla efektívne (podľa kľúča) neskôr vyhľadať? Použi slovník (dictionary).

Slovníky, rovnako ako zoznamy sú *premenlivé*, čo znamená, že ich môžeme zmeniť po ich vytvorení. Po vytvorení môžeš do slovníka pridať nové dvojice kľúč/hodnota takto:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['oblubeny_jazyk'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(ucastnicka)
4
```

Dúfam, že to dáva zmysel. :) Pripravená na trochu zábavy so slovníkmi? Tak šup na ďalší riadok za úžasnými vecami.

Na odstránenie položky zo slovníka môžeš použiť metódu `pop()`. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka.pop('oblubene_cisla')
[7, 42, 92]
>>> ucastnicka
{'meno': 'Ola', 'krajina': 'Slovensko', 'oblubeny_jazyk': 'Python'}
```

Ako vidíš z výstupu, pár kľúč-hodnota zodpovedajúci kľúču 'oblubene_cisla' bol vymazaný.

Taktiež môžeš zmeniť hodnotu priradenú k už vytvorenému kľúču v slovníku. Napíš:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['krajina'] = 'Nemecko'
>>> ucastnicka
{'krajina': 'Nemecko', 'oblubeny_jazyk': 'Python', 'meno': 'Ola'}
```

Ako vidíš, hodnota kľúča `"krajina"` sa zmenila z `"Poľsko"` na `"Nemecko"`. :) Vzrušujúce? Hurá! Práve si sa naučila ďalšiu úžasnú vec.

### Zhrnutie

Skvelé! Teraz už vieš o programovaní dosť veľa. Pozrime sa, čo sme si vysvetlili v poslednej časti:

- **chyby** (angl. error) - teraz už vieš ako čítať a rozumieť chybám, ktoré sa zobrazia, ak Python nerozumie príkazu, ktorý mu zadáš
- **premenné** - názvy objektov, ktoré ti uľahčujú písanie kódu a robia tiež kód zrozumiteľnejším
- **zoznamy** (angl. list) - zoznam objektov uložených v určitom poradí
- **slovníky** (angl. dictionary) - objekty uložené v pároch kľúč-hodnota

Tešíš sa na ďalšiu časť? :)

## Porovnávanie vecí

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) videu.

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
>>> len([1, 2, 3]) > len([4, 5])
True
```

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare values of mathematical expressions like `2 * 2` and function results like the `2` returned by `len([4, 5])`. Nice, huh?

Zaujíma ťa, prečo sme použili dve "rovná sa" `==` vedľa seba, aby sme porovnali, či sú čísla rovnaké? Jeden znak `=` používame na priraďovanie hodnôt premenným. Takže, ak chceš skontrolovať, či sú veci rovnaké, musíš vždy, úplne **vždy** použiť dve `==`. Taktiež môžeme zisťovať, či sa veci navzájom líšia. Na to použijeme symbol `!=`, ako bolo uvedené v príklade vyššie.

Zadaj Pythonu ešte dve úlohy:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` a `<` sme už videli, ale čo znamenajú `>=` a `<=`? Prečítať ich môžeš takto:

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

- **and** - ak použiješ operátor `and`, obidve porovnávané veci musia byť pravdivé (True), aby príkaz bol pravdivý (True)
- **or** - ak použiješ operátor `or`, stačí aby jedna z porovnávaných vecí bola pravdivá, aby bol celý príkaz pravda (True)

Už ste počula výraz "porovnávať hrušky s jablkami"? Skúsme pythonský ekvivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Tu vidíš, že tak ako nevieme porovnávať hrušky s jablkami, ani Python neviem porovnať číslo (`int`) s reťazcom (`str`). Namiesto toho vypíše chybu **TypeError** a povie nám, ktoré dva typy sa nedajú porovnať.

## Logické hodnoty (Boolean)

Mimochodom práve si sa naučila nový typ objektu v Pythone. Volá sa **Boolean**.

Existujú iba dva typy Booleovských objektov:- True (Pravda)- False (Nepravda):

- True
- False

Aby ich Python spoznal, musíš vždy napísať 'True' (s veľkým písmenom na začiatku a zvyšok malým písmom). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

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

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) videu.

Zatiaľ sme písali všetok pythonský kód do konzoly interpretera, čiže môžeme na jedenkrát zadať iba jeden riadok kódu. Normálne programy sú uložené v súboroch, ktoré spúšťa buď **interpreter** alebo **kompilátor**. Doteraz sme spúšťali naše programy riadok po riadku v **interpreteri** Pythonu. Na ďalšie úlohy budeme potrebovať viac ako jeden riadok kódu, takže teraz rýchlo musíme:

- Ukončiť interpreter Pythonu
- Otvoriť si zvolený editor kódu
- Uložiť v ňom nejaký kód do nového pythonského súboru
- Spustiť ho!

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Tak sa dostaneš späť na príkazový riadok.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Samozrejme, teraz si už vcelku skúsená Python developerka, takže kľudne napíš nejaký kód, ktorý si sa dnes naučila.

Teraz uložíme súbor a dáme mu nejaký zrozumiteľný názov. Nazvime ho **python_intro.py** a ulož ho plochu. Tento súbor môžeš nazvať akokoľvek chceš, ale dôležité je, aby jeho názov končil **.py**. Prípona **.py** nášmu operačnému systému hovorí, že je to **súbor spustiteľný Pythonom** a môže ho spustiť Pythonom.

> **Poznámka** Všimni si jednu z najúžasnejších vecí editorov kódu: farby! V pythonskej konzole bolo všetko napísané jednou farbou, teraz však vidíš, že funkcia `print` je napísaná inou farbou ako reťazec. Toto sa nazýva "zvýraznenie syntaxe" a pri programovaní je to fakt užitočná vec. Farba výrazov ti môže pomôcť, ak máš neuzavretý reťazec či preklep v názve špeciálnych slov (ako napríklad `def` vo funkcii, ktorú uvidíme neskôr). Toto je jedným z dôvodov, prečo používame editor kódu. :)

Súbor máme uložený, je čas ho spustiť! Pomocou poznatkov z kapitoly o príkazovom riadku, pomocou Terminálu **zmeň adresár** na plochu.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Macu bude príkaz vyzerať takto:

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
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funguje to!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Čo ak podmienka nie je pravdivá?

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
    5 je naozaj viac ako 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Ahoj Ola!')
elif name == 'Sonja':
    print('Ahoj Sonja!')
else:
    print('Ahoj neznama!')
```

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Sonja!
    

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
    Super, pocujem vsetky detaily
    

## Komentáre

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

- **porovnávať veci** - v Pythone môžeš porovnávať veci pomocou znamienok `>`, `>=`, `==`, `<=`, `<` a operátorov `and`, `or`
- **Booleovské/logické premenné** - typ objektu, ktorý môže mať len jednu z dvoch hodnôt: `True` (pravda) alebo `False` (nepravda)
- **Ukladať súbory** - ukladanie kódu v súboroch, takže môžete spúšťať väčšie programy.
- **if... elif... else** - príkazy, ktoré ti umožňujú spustiť kód, iba ak sú splnené určité podmienky.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Tvoje vlastné funkcie!

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) videu.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Ahoj!')
    print('Ako sa mas?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj!
    Ako sa mas?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- Ak sa ti zjaví `NameError`, to znamená, že si niečo chybne napísala, takže by si mala overiť, že si použila rovnaké meno, keď si vytvárala pomocou `def hi()` a keď si ju zavolala pomocou `hi()`.
- Ak sa ti zjaví `IndentationError`, uisti sa, že oba `print` riadky, majú rovnaký počet medzier od začiatku riadku: python vyžaduje aby všetky riadky boli pedatne zarovnané.
- Ak nevidíš žiaden výstup, tak sa pozri či posledné `hi()` *nie je* odsadené - ak je, ten riadok sa stal súčasťou funkcie a nikdy nedojde k jeho spusteniu.

Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(meno):
    if meno == 'Ola':
        print('Ahoj Ola!')
    elif meno == 'Sonja':
        print('Ahoj Sonja!')
    else:
        print('Ahoj neznama!')

hi()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'meno'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Ahoj neznáma!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(meno):
    print('Ahoj ' + meno + '!')

hi("Katka")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Katka!
    

Congratulations! You just learned how to write functions! :)

## Cykly

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) videu.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
dievcata = ['Katka', 'Monika', 'Zuzka', 'Ola', 'Ty']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for meno in dievcata:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(meno):
    print('Ahoj ' + meno + '!')

dievcata = ['Katka', 'Monika', 'Zuzka', 'Ola', 'Ty']
for meno in dievcata:
    hi(meno)
    print('Dalsie dievca')
```

And when we run it:

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

## Zhrnutie

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)