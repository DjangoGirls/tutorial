# Úvod do jazyka Python

> Časť tejto kapitoly je založená na tutoriáli Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Poďme napísať nejaký kód!

## Python prompt

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) videu.

Aby sme mohli začať s Pythonom, musíte otvoriť *príkazový riadok* (angl. command line) na svojom počítači. Už by ste mali vedieť ako sa to robí -- naučili ste sa to v [ Úvode do príkazového riadku](../intro_to_command_line/README.md).

Ak ste hotoví, pokračujte s inštrukciami nižšie.

Chceme otvoriť Python konzolu, takže napíšte `python` na Windowse alebo `python3` na Mac alebo OS/Linux a stlačte `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Váš prvý príkaz v Pythone!

Po spustení príkazu Python sa prompt zmenil na `>>>`. Pre nás to znamená že odteraz by sme mali písať príkazy iba v jazyku Python. Nemusíte písať `>>>` - Python to urobí pre Vás.

Ak by ste chceli kedykoľvek ukončiť konzolu Pythonu, len napíšte `exit()` alebo môžete použiť aj skratku `Ctrl + Z` vo Windowse alebo `Ctrl + D` pre Mac/Linux. Potom už nebudete vidieť toto: `>>>`.

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

Bavte sa s tým trošku, potom sa vráťte späť k nám. :)

Ako vidíte, Python je dobrá kalkulačka. A ak ste zvedaví, čo všetko vie ešte…

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

> Dôležité: je možné konvertovať čísla na reťazce, ale opačne sa to nedá vždy - inak čo by bolo napr. `int('hello')`?

## Premenné

Veľmi dôležitý pojem v programovaní je pojem premennej. Premenná je nič iné ako názov niečoho, čo môžeme použiť aj neskoršie v programe. Programátori používajú premenné aby v nich ukladali dáta, aby ich zdrojový kód bol prehľadnejší a aby nemuseli všetko držať v hlave.

Povedzme, že chceme vytvoriť novú premennú s názvom `meno`:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Ola"
```

Zadáme meno sa rovná Ola.

Ako ste si to zbadali už, váš program nič nevrátil späť ako to robil v predchádzajúcich príkladoch. Tak ako vieme, či tá premenná existuje? Jednoducho napíšte `meno` a stlačte `enter`:

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

Úžasné, že? Samozrejme premenné môžu byť hocičo, takže aj čísla! Skúste toto:

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

Hrajte sa s tým trošku, a potom uvidíme čo môžeme ešte urobiť!

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

Slovníky, rovnako ako zoznamy sú *premenlivé*, čo znamená, že ich môžeme zmeniť po ich vytvorení. Po vytvorení môžeš do slovníka pridať nové dvojice kľúč/hodnota takto:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['oblubeny_jazyk'] = 'Python'
```

Tak ako pri zoznamoch, použitím metódy `len()` na slovníkoch dostaneš počet párov kľúč-hodnota v slovníku. Poďme na to, zadaj tento príkaz:

{% filename %}command-line{% endfilename %}

```python
>>> len(ucastnicka)
4
```

Dúfam, že to dáva zmysel. :) Pripravená na trochu zábavy so slovníkmi? Tak šup na ďalší riadok za úžasnými vecami.

Na odstránenie položky zo slovníka môžeš použiť metódu `pop()`. Napríklad ak chceš odstrániť položku zodpovedajúcu kľúču `'oblubene_cisla'`, zadaj nasledujúci príkaz:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
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

Veľkú časť programovania predstavuje porovnávanie veci. Čo je najjednoduchšia vec na porovnanie? Čísla, samozrejme. Pozrime sa, ako to funguje:

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

Dali sme Pythonu pár čísiel na porovnanie. Ako vidíš, Python vie porovnávať nielen čísla, ale vie porovnávať aj výsledky metód. Pekné, nie?

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

{% filename %}command-line{% endfilename %}

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

Aby ich Python spoznal, musíš vždy napísať 'True' (s veľkým písmenom na začiatku a zvyšok malým písmom). **true, TRUE, tRUE nebudú fungovať -- iba True je správne.** (Samozrejme, to isté platí aj pre 'False'.)

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

Pre opustenie interpretera Pythonu, ktorý sme doteraz používali, zadaj jednoducho funkciu `exit()`

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

Na Linuxe to bude takto (slovo "Desktop" bude možno preložené):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Vo Windowse v Command Prompt, to bude takto:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

A vo Windows Powershell bude príkaz vyzerať takto:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Ak máš akékoľvek ťažkosti, stačí požiadať o pomoc.

Teraz použi Python na spustenie kódu v súbore:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Poznámka na Windowse python3 príkaz neexistuje. Použi python na spustenie súboru:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Výborne! Práve si spustila svoj prvý pythonský program uložený v súbore. Skvelý pocit, však?

Teraz sa môžeš posunúť na ďalší základný nástroj v programovaní:

## If … elif … else

Kopec vecí v kóde sa má spúšťať len ak sú splnené nejaké podmienky. Práve na to používa Python príkaz **if**.

Nahraď kód v súbore **python_intro.py** týmto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Ak to uložíš a spustíš, dostaneš túto chybu:

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

Poznámka: Zapamätaj si že Windows nepozná príkaz "python3". Od teraz a naďalej, nahraď "python3" príkazom "python"pri spúšťaní súborov.

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
    print('Ahoj Ola!')
elif name == 'Sonja':
    print('Ahoj Sonja!')
else:
    print('Ahoj neznama!')
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
    

## Komentáre

Komentáre su riadky, ktoré sa začínajú s `#`. Po `#` môžeš napísať hocičo, Python to bude ignorovať. Komentáre urobia tvoj kód čitateľnejším pre iných ludí.

Pozrime sa ako to vyzerá:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Nemusíš písať komentár pre každý riadok kódu čo napíšeš, ale je užitočné vysvetliť prečo tvoj kód niečo robǐ, alebo stručne popísať keď robí niečo zložité.

### Zhrnutie

V posledných troch cvičeniach si sa naučila:

- **porovnávať veci** - v Pythone môžeš porovnávať veci pomocou znamienok `>`, `>=`, `==`, `<=`, `<` a operátorov `and`, `or`
- **Booleovské/logické premenné** - typ objektu, ktorý môže mať len jednu z dvoch hodnôt: `True` (pravda) alebo `False` (nepravda)
- **Ukladať súbory** - ukladanie kódu v súboroch, takže môžete spúšťať väčšie programy.
- **if... elif... else** - príkazy, ktoré ti umožňujú spustiť kód, iba ak sú splnené určité podmienky.
- **comments** - lines that Python won't run which let you document your code

Teraz je čas na poslednú časť tejto kapitoly!

## Tvoje vlastné funkcie!

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) videu.

Pamätáš si funkcie ako napríklad `len()`, ktoré môžeš v Pythone spúšťať? Máme pre teba dobrú správu - teraz sa naučíš ako napísať vlastnú funkciu!

Funkcia je postupnosť inštrukcií, ktoré by mal Python spustiť. Každá funkcia v Pythone začína kľúčovým slovom `def`, má svoje meno a môže mať nejaké parametre. Skusme to. Nahraď kód v **python_intro.py** týmto:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Ahoj!')
    print('Ako sa mas?')

hi()
```

OK, naša prvá funkcia je pripravená!

Možno sa čuduješ prečo sme na koniec súboru napísali názov funkcie. To preto, lebo Python číta súbor a vykonáva kód od vrchu po spodok. Takže aby sme mohli našu funkciu použiť, musíme jej názov napísať opäť.

Spusťme to a pozrime sa, čo sa stane:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj!
    Ako sa mas?
    

Poznámka: Ak nefunguje, nepanikár! Výstup ti pomôže zistiť dôvod, prečo:

- Ak sa ti zjaví `NameError`, to znamená, že si niečo chybne napísala, takže by si mala overiť, že si použila rovnaké meno, keď si vytvárala pomocou `def hi()` a keď si ju zavolala pomocou `hi()`.
- Ak sa ti zjaví `IndentationError`, uisti sa, že oba `print` riadky, majú rovnaký počet medzier od začiatku riadku: python vyžaduje aby všetky riadky boli pedatne zarovnané.
- Ak nevidíš žiaden výstup, tak sa pozri či posledné `hi()` *nie je* odsadené - ak je, ten riadok sa stal súčasťou funkcie a nikdy nedojde k jeho spusteniu.

Poďme vytvoriť našu prvú funkciu s parametrami. Použijeme predchádzajúci príklad - funkcia, ktorá hovorí "ahoj" osobe, ktorá ju spustí - s menom:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Ako vidíš, dali sme našej funkcii parameter, ktorý sme nazvali `meno`:

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
    

No a čo si myslíš, čo sa stane, ak tam napíšeš iné meno? (Nie Ola ani Sonja). Vyskúšaj a uvidíš, či bol tvoj predpoklad správny. Malo by ti vypísať toto:

{% filename %}command-line{% endfilename %}

    Ahoj neznáma!
    

Úžasné, nie? Vďaka tomu nemusíš prepisovať dokola to isté zakaždým, keď chceš zmeniť meno osoby, ktorú má funkcia pozdraviť. A to je presne dôvod, prečo potrebujeme funkcie - aby sme nemuseli opakovať svoj kód!

Urobme to teda trochu rozumnejšie - existujú viac ako dve mená a písať podmienku pre každé by bolo trochu náročné, však?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(meno):
    print('Ahoj ' + meno + '!')

hi("Katka")
```

Teraz spusťme kód:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Katka!
    

Gratulujeme! Práve si sa naučila ako sa píšu funkcie! :)

## Cykly

> Pre čitateľov doma: Táto kapitola je spracovaná v [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) videu.

Toto je už posledná časť. Išlo to rýchlo, však? :)

Programátori sa neradi opakujú. Programovanie je o automatizácii vecí, takže nechceme zdraviť každú osobu manuálne, nie? A vtedy nám prídu vhod cykly.

Ešte si spomínaš na zoznamy? Pripravme zoznam dievčat:

{% filename %}python_intro.py{% endfilename %}

```python
dievcata = ['Katka', 'Monika', 'Zuzka', 'Ola', 'Ty']
```

Chceme ich pozdraviť všetky menom. Na to máme funkciu `hi`, tak ju použime v cykle:

{% filename %}python_intro.py{% endfilename %}

```python
for meno in dievcata:
```

Príkaz `for` sa správa podobne ako `if`; kód pod oboma z nich musí byť odsadený o štyri medzery.

Tu je plný kód, ktorý napíšeme do súboru:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(meno):
    print('Ahoj ' + meno + '!')

dievcata = ['Katka', 'Monika', 'Zuzka', 'Ola', 'Ty']
for meno in dievcata:
    hi(meno)
    print('Dalsie dievca')
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
    

Ako vidíš, všetko, čo dáš do príkazu `for` s oddsadením sa bude opakovať pre každý prvok zoznamu `dievcata`.

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

Všimni si, že druhé číslo sa nenachádza vo výstupnom zozname (teda `range(1, 6)` počíta od 1 po 5, ale neobsahuje číslo 6). To je preto, lebo "range" je jednostranne otvorený, čo znamená, že obsahuje prvú hodnotu, ale nie poslednú.

## Zhrnutie

To je všetko. **Si úplne geniálna!** Toto bola náročná kapitola, takže by si mala byť na seba pyšná. My sme rozhodne hrdí na teba, že si to zvládla až potiaľto!

Oficiálnu a plnú verziu tutoriálu najdeš na https://docs.python.org/3/tutorial/. Tam najdeš podrobnejšie a úplné informácie o jazyku. Nech sa darí :)

Teraz na chvíľu si daj pauzu - natiahni sa trochu, poprechádzaj sa, nechaj svoje oči oddýchnuť si - a potom prejdeme na ďalšiu kapitolu. :)

![Koláčik](images/cupcake.png)