{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Úvod do jazyka Python

> Časť tejto kapitoly je založená na tutoriáli Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Poďme napísať nejaký kód!

{% include "/python_introduction/prompt.md" %}

## Tvoj prvý príkaz v Pythone!

Po spustení príkazu python sa začiatok nášho príkazového riadku (nazývaný aj prompt) zmenil na `>>>`. Toto pre nás znamená, že odteraz by sme mali písať príkazy iba v jazyku Python. Ty sama nemusíš vždy písať `>>>`, Python to urobí za teba.

Ak chceš z pythonovej konzoly kedykoľvek odísť, napíš `exit()` alebo použi skratku `Ctrl + Z` vo Windowse a `Ctrl + D` v Macu/Linuxe. Potom už nebudeš vidieť `>>>`.

Zatiaľ ale z pythonovej konzoly odchádzať nechceme. Chceme sa o nej dozvedieť viac! Začnime tým, že napíšeme niečo jednoduché matematické ako `2 + 3` a stlačíme `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Pekne! Vidíš, ako vyskočilo riešenie? Python vie počítať! Môžeš skúsiť iné príkazy ako:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Aby sme vypočítali mocninu, povedzme 2 na tretiu, zadáme: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Trošku sa s tým pohraj a potom sa vráť späť . :)

Ako môžeš vidieť, Python je skvelá kalkulačka. A ak si zvedavá, čo všetko ešte dokáže...

## Reťazce

Čo tak napríklad tvoje meno? Napíš svoje meno v úvodzovkách:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Práve si vytvorila svoj prvý reťazec (string)! Je to postupnosť znakov, ktoré môžu byť spracované počítačom. Reťazec musí vždy začínať a končiť rovnakým znakom. Buď jednoduchými (`'`) alebo dvojitými (`"`) úvodzovkami (nie je medzi nimi žiadny rozdiel!). Úvodzovky naznačujú, že to, čo je medzi nimi, je reťazec.

Reťazce možno spájať dohromady. Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> "Ahoj " + "Ola"
'Ahoj Ola'
```

Reťazce môžeš tiež vynásobiť číslom:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Ak potrebuješ mať vo vnútri reťazca apostrof, máš dve možnosti, ako to spraviť.

Použitím dvojitých úvodzoviek:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

alebo pomocou spätného lomítka (`\`) - tomuto sa anglicky hovorí escaping:

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Fajn, nie? Ak chceš vidieť svoje meno napísané veľkými písmenami, zadaj:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Práve si na svojom reťazci použila **metódu** `upper`! Metóda (ako `upper()`) predstavuje postupnosť inštrukcií, ktoré Python vykoná na danom objekte (`"Ola"`), keď ju zavoláš.

Ak chceš vedieť, koľko má tvoje meno písmen, aj na to máme **funkciu**!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Rozmýšľaš, prečo občas voláme funkcie pomocou `.` na konci reťazca (napr. `"Ola".upper()`) a inokedy najprv zavoláme funkciu a reťazec dáme do zátvoriek? Ide o to, že v niektorých prípadoch funkcie patria k objektom, ako napríklad `upper()`, čo je funkcia, ktorá môže byť vykonaná len na reťazcoch. V takomto prípade sa tieto funkcie volajú **metódy**. Inokedy funkcie nepatria k žiadnemu konkrétnemu objektu a môžu byť použité na rôzne typy objektov, ako je to v prípade `len()`. Preto posielame reťazec `"Ola"` ako parameter funkcii `len`.

### Zhrnutie

OK, dosť už o reťazcoch. Zatiaľ sme sa niečo naučili o nasledovnom:

- **prompt** - píšeme príkazy (kód) do Python promptu, z čoho dostaneme výsledky zase v jazyku Python
- **čísla a reťazce** - v Pythone sú čísla použité pre počítanie a reťazce pre textové objekty
- **operátory** - ako `+` alebo `*`, z daných hodnôt vyrobia novú hodnotu
- **funkcie** - napr. `upper()` alebo `len()`, vykonávajú činnosti na objektoch.

Toto sú základy každého programovacieho jazyka. Si pripravená na niečo ťažšie? Stavíme sa, že áno!

## Chyby

Teraz skúsme niečo nové. Keď už vieme zistiť dĺžku reťazca, vieme to isté spraviť s číslom? Skús napísať `len(304023)` a stlač `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Dostali sme našu prvú chybu! Keď uvidíš ikonku {{ warning_icon }}, ber to ako znamenie, že kód, ktorý ideš spustiť, nebude bežať tak, ako by sa dalo očakávať. Robenie chýb (aj úmyselných) je dôležitá súčasť učenia sa!

Správa nám hovorí, že objekty typu "int" (integer, alebo slovensky celé číslo) nemajú dĺžku. Čo s tým? Možno by sme mohli naše číslo zapísať ako reťazec? Reťazce predsa dĺžku majú, nie?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Funguje to! Použili sme funkciu `str` vovnútri funkcie `len`. `str()` zmení všetko na reťazec.

- Funkcia `str` prevedie všetko na **reťazec**
- Funkcia `int` prevedie všetko na **int** (celé čísla)

> Dôležité: čísla vieme premeniť na text, ale text nevieme vždy previesť na číslo - veď čo by vôbec malo byť `int('ahoj')`?

## Premenné

Veľmi dôležitý koncept v programovaní je pojem premennej (variable). Premenná nie je nič iné ako priradenie názvu niečomu, aby sme to mohli použiť neskôr. Programátorky a programátori používajú premenné, aby v nich ukladali dáta, aby ich zdrojový kód bol prehľadnejší, a aby nemuseli všetko držať v hlave.

Povedzme, že chceme vytvoriť novú premennú s názvom `meno`:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Ola"
```

Napíšeme, že meno sa rovná Ola.

Asi si si všimla, že tentokrát program nič nevypísal. Ako teda vieme, že naša premenná naozaj existuje? Napíš `meno` a stlač `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> meno
'Ola'
```

Jupí! Tvoja prvá premenná! :) Vždy môžeš zmeniť, na čo ukazuje:

{% filename %}command-line{% endfilename %}

```python
>>> meno = "Sona"
>>> meno
'Sona'
```

Môžeš ju tiež použiť vo funkciách:

{% filename %}command-line{% endfilename %}

```python
>>> len(meno)
4
```

Super, nie? Premenné môžu obsahovať čokoľvek, aj čísla! Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ale čo by sa stalo, keby sme použili nesprávny názov? Uhádneš, čo sa stane? Vyskúšajme!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> mesto = "Tokio"
>>> mseto
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'mseto' is not defined
```

Chyba! Ako vidíš, Python má viacero druhov chýb a táto konkrétna sa volá **NameError**. Python ti ju vyhodí, pokiaľ sa pokúsiš použiť premennú, ktorá ešte nebola definovaná. Ak sa s touto chybou stretneš v budúcnosti, skontroluj si kód, či nemáš preklep v nejakom názve.

Pohraj sa s tým trošku a vyskúšaj si, čo všetko sa s tým dá urobiť!

## Funkcia print

Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> meno = 'Maria'
>>> meno
'Maria'
>>> print(meno)
Maria
```

Ak napíšeš len `meno`, pythonový interpreter ti odpovie reťazcovou *reprezentáciou* premennej "meno", čo sú písmená M-a-r-i-a, obklopené jednoduchými úvodzovkami ''. Keď povieš `print(meno)`, Python vypíše (print) obsah premennej na obrazovku bez úvodzoviek, čo vyzerá úhľadnejšie.

Ako uvidíme neskôr, funkcia `print()` tiež príde vhod, keď chceme vypisovať niečo zvnútra funkcie alebo keď chceme vypisovať veci na viacerých riadkoch.

## Zoznamy

Okrem reťazcov a celých čísel má Python všemožné typy objektov. Teraz sa zoznámime s typom, ktorý sa volá **zoznam** (list). Zoznamy sú presne to, čo by si povedala, že sú: objekty, ktoré sú zoznamami iných objektov. :)

Poď na to, vytvor zoznam:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Áno, tento zoznam je prázdny. To nám nie je na veľa, že? Vytvorme radšej zoznam s číslami do lotérie. A keďže sa nechceme stále opakovať, hneď ho aj uložíme do premennej:

{% filename %}command-line{% endfilename %}

```python
>>> loteria = [3, 42, 12, 19, 30, 59]
```

OK, máme zoznam! Čo s ním môžeme urobiť? Pozrime sa, koľko čísel máme v zozname. Tušíš, akú funkciu by sme na také niečo mohli použiť? Už ju poznáš!

{% filename %}command-line{% endfilename %}

```python
>>> len(loteria)
6
```

Presne! `len()` ti vráti počet objektov v zozname. Šikovné, nie? Teraz by sme ho možno mohli usporiadať:

{% filename %}command-line{% endfilename %}

```python
>>> loteria.sort()
```

Nič nám to nevrátilo, iba sa zmenilo poradie, v ktorom sa čísla vyskytujú v zozname. Vypíšme ho znova a pozrime sa, čo sa stalo:

{% filename %}command-line{% endfilename %}

```python
>>> print(loteria)
[3, 12, 19, 30, 42, 59]
```

Ako vidíš, čísla v tvojom zozname sú teraz zoradené od najnižšej po najvyššiu hodnotu. Gratulujeme!

Možno by sme chceli toto poradie otočiť? Urobme to!

{% filename %}command-line{% endfilename %}

```python
>>> loteria.reverse()
>>> print(loteria)
[59, 42, 30, 19, 12, 3]
```

Ak chceš do zoznamu niečo pridať, môžeš to urobiť zadaním tohto príkazu:

{% filename %}command-line{% endfilename %}

```python
>>> loteria.append(199)
>>> print(loteria)
[59, 42, 30, 19, 12, 3, 199]
```

Ak chceš zobraziť len prvé číslo, môžeš na to použiť **index**. Index je číslo, ktoré hovorí, kde v zozname sa položka nachádza. Programátorky a programátori radi počítajú od 0, takže prvý objekt v našom liste je na indexe 0, druhý na indexe 1 a tak ďalej. Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> print(loteria[0])
59
>>> print(loteria[1])
42
```

Ako môžeš vidieť, môžeš pristupovať k rôznym objektom vo svojom zozname pomocou názvu zoznamu a indexu daného objektu v hranatých zátvorkách.

Ak chceš niečo zo svojho zoznamu odstrániť, budeš potrebovať **indexy**, ako sme sa dozvedeli vyššie, a metódu `pop()`. Vyskúšajme si to na príklade a zopakujme si, čo sme sa už naučili - ideme vymazať prvé číslo v našom zozname.

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

Pre tú srandu vyskúšaj iné indexy, napr. 6, 7, 1000, -1, -6 či -1000. Skús, či sa ti podarí predpovedať, aký bude výsledok, ešte pred tým, ako príkaz spustíš. Dávajú ti výsledky zmysel?

Zoznam všetkých dostupných metód pre zoznamy nájdeš v tejto kapitole dokumentácie Pythonu: https://docs.python.org/3/tutorial/datastructures.html

## Slovníky

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná vo videu [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Slovník (dictionary, skrátene dict) je podobný zoznamu, ale k hodnotám pristupuješ pomocou kľúča namiesto číselného indexu. Kľúč môže byť hocijaký reťazec alebo číslo. Syntax na definovanie prázdneho slovníka je:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Toto ti hovorí, že si práve vytvorila prázdny slovník. Hurá!

Teraz skús napísať nasledujúci príkaz (skús nahradiť hodnoty vlastnými údajmi):

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka = {'meno': 'Ola', 'krajina': 'Polsko', 'oblubene_cisla': [7, 42, 92]}
```

Týmto príkazom si práve vytvorila premennú s názvom `ucastnicka` s tromi pármi kľúč-hodnota (key-value):

- Kľúč `meno` odkazuje na hodnotu `"Ola"` (objekt typu `reťazec`),
- `krajina` odkazuje na `"Polsko"` (ďalší `reťazec`),
- a `oblubene_cisla` ukazuje na `[7, 42, 92]` (`zoznam` s tromi číslami).

Obsah jednotlivých kľúčov môžeš skontrolovať použitím tejto syntaxe:

{% filename %}command-line{% endfilename %}

```python
>>> print(ucastnicka['meno'])
Ola
```

Vidíš, podobá sa to na zoznam. Akurát si nemusíš pamätať index - stačí názov.

Čo sa stane, ak si od Pythonu vypýtame hodnotu kľúča, ktorý neexistuje? Uhádneš? Vyskúšame a uvidíme!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> ucastnicka['vek']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'vek'
```

Aha, ďalšia chyba! Táto sa volá **KeyError**. Python je nápomocný a povie ti, že kľúč (key) `'vek'` v tomto slovníku neexistuje.

Kedy je dobré použiť slovník a kedy zoznam? No, to je dobrá otázka. Porozmýšľaj predtým, ako si pozrieš odpoveď v nasledujúcom riadku.

- Potrebuješ zoradenú postupnosť vecí? Vyber si zoznam.
- Potrebuješ priraďovať hodnoty kľúčom, aby si ich mohla efektívne (podľa kľúča) neskôr vyhľadať? Použi slovník.

Tak ako pri zoznamoch, aj pri slovníkoch funkcia `len()` vracia počet párov kľúč-hodnota v danom slovníku. Poď, zadaj tento príkaz:

{% filename %}command-line{% endfilename %}

```python
>>> len(ucastnicka)
3
```

Slovníky, podobne ako zoznamy, sú *mutable* (premenlivé), čo znamená, že ich možno zmeniť po tom, ako boli vytvorené. Do existujúceho slovníka môžeš pridať nový pár kľúč-hodnota takto:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['oblubeny_jazyk'] = 'Python'
```

Dúfam, že to dáva zmysel. :) Pripravená na trochu zábavy so slovníkmi? Čakajú nás ďalšie úžasné veci.

Na odstránenie položky zo slovníka môžeš tiež použiť metódu `pop()`. Napríklad, ak chceš odstrániť položku zodpovedajúcu kľúču `'oblubene_cisla'`, zadaj nasledujúci príkaz:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka.pop('oblubene_cisla')
[7, 42, 92]
>>> ucastnicka
{'meno': 'Ola', 'krajina': 'Polsko', 'oblubeny_jazyk': 'Python'}
```

Ako vidíš z výstupu, pár kľúč-hodnota zodpovedajúci kľúču 'oblubene_cisla' zmizol.

Taktiež môžeš zmeniť hodnotu priradenú k už vytvorenému kľúču v slovníku. Napíš:

{% filename %}command-line{% endfilename %}

```python
>>> ucastnicka['krajina'] = 'Nemecko'
>>> ucastnicka
{'krajina': 'Nemecko', 'oblubeny_jazyk': 'Python', 'meno': 'Ola'}
```

Ako vidíš, hodnota kľúča `"krajina"` sa zmenila z `"Polsko"` na `"Nemecko"`. :) Vzrušujúce? Hurá! Práve si sa naučila ďalšiu úžasnú vec.

### Zhrnutie

Skvelé! Teraz už vieš o programovaní dosť veľa. Pozrime sa, čo sme si vysvetlili v poslednej časti:

- **chyby** - teraz už vieš, ako čítať a rozumieť chybám, ktoré sa zobrazia, ak Python nerozumie príkazu, ktorý mu zadáš
- **premenné** - názvy objektov, ktoré ti uľahčujú písanie kódu a robia tiež kód zrozumiteľnejším
- **zoznamy** - zoznamy objektov uložených v určitom poradí
- **slovníky** - objekty uložené v pároch kľúč-hodnota

Tešíš sa na ďalšiu časť? :)

## Porovnávanie vecí

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná vo videu [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Veľkú časť programovania predstavuje porovnávanie veci. Čo sa porovnáva najjednoduchšie? Čísla! Pozrime sa, ako to funguje:

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

Dali sme Pythonu na porovnanie zopár čísel. Ako vidíš, Python vie porovnávať nielen čísla, ale aj výsledky matematických výrazov ako `2 * 2` a výsledky funkcií ako `2`, ktorú vrátila funkcia `len([4, 5])`. Fajn, nie?

Zaujíma ťa, prečo sme použili dve znamenienka rovnosti `==` vedľa seba, aby sme porovnali, či sú čísla rovnaké? Jeden znak `=` používame na priraďovanie hodnôt premenným. Takže ak chceš skontrolovať, či sú veci rovnaké, musíš vždy, úplne **vždy** použiť dve `==`. Taktiež môžeme vyjadriť, že sa veci navzájom líšia. Na to použijeme symbol `!=`, ako bolo uvedené v príklade vyššie.

Dajme Pythonu dve ďalšie úlohy:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` a `<` sme už videli, ale čo znamenajú `>=` a `<=`? Môžeš ich čítať takto:

- x `>` y znamená: x je väčšie ako y
- x `<` y znamená: x je menšie ako y
- x `<=` y znamená: x je menšie alebo rovné y
- x `> =` y znamená: x je väčšie alebo rovné y

Skvelé! Ešte si dáme jeden príklad? Skús toto:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Môžeš dať Pythonu toľko čísel, koľko chceš, a on ti dá vždy odpoveď! Vcelku šikovné, nie?

- **and** - ak použiješ operátor `and`, obidve porovnávané veci musia byť pravdivé (True), aby príkaz bol pravdivý (True)
- **or** - ak použiješ operátor `or`, stačí, aby jedna z porovnávaných vecí bola pravdivá, aby bol celý príkaz pravda (True)

Už si počula výraz "porovnávať hrušky s jablkami"? Skúsme ekvivalent v Pythone:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Tu vidíš, že tak, ako nevieme porovnávať hrušky s jablkami, ani Python nevie porovnať číslo (`int`) s reťazcom (`str`). Namiesto toho vypíše chybu **TypeError** a povie nám, že tieto dva typy sa nedajú porovnať.

## Logické hodnoty

Mimochodom, práve si sa naučila nový typ objektu v Pythone. Volá sa **boolean** (logická hodnota).

Existujú iba dva typy boolean objektov:

- True (pravda)
- False (nepravda)

Aby ich Python spoznal, musíš vždy napísať "True" (s veľkým písmenom na začiatku a zvyšok malým písmom). **true, TRUE, tRUE nebudú fungovať -- iba True je správne.** (To isté platí aj pre 'False'.)

Premenné môžu tiež obsahovať booleany. Aha:

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

Precvič si to a zabav sa s booleanmi - skús spustiť tieto príkazy:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Gratulujeme! Booleany patria k tomu najzaujímavejšiemu v programovaní a ty si sa práve naučila, ako sa používajú!

# Ulož to!

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná vo videu [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Zatiaľ sme písali všetok kód v Pythone do konzoly interpretera, kde môžeme naraz zadať iba jeden riadok kódu. Bežné programy bývajú uložené v súboroch, ktoré spúšťa náš programovací jazyk buď pomocou **interpretera**, alebo **kompilátora**. Doteraz sme spúšťali naše programy riadok po riadku v **interpreteri** Pythonu. Na ďalšie úlohy budeme potrebovať viac ako jeden riadok kódu, takže teraz rýchlo musíme:

- Ukončiť interpreter Pythonu
- Otvoriť si náš zvolený editor kódu
- Uložiť v ňom trochu kódu do nového Python súboru
- Spustiť ho!

Ak chceš odísť z Python interpretera, ktorý sme doteraz používali, zadaj funkciu `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Tak sa dostaneš späť na príkazový riadok.

V jednej z [predošlých častí](../code_editor/README.md) sme si vybrali editor kódu. Teraz budeme chcieť tento editor otvoriť a napísať pár riadkov kódu do nového súboru (alebo ak používaš Chromebook, vytvoriť nový súbor v Cloud IDE a otvoriť ho, čo sa udeje v zabudovanom editore kódu):

{% filename %}editor{% endfilename %}

```python
print('Ahoj, Django Girls!')
```

Prirodzene, teraz si už poriadne skúsená Python vývojárka, takže pokojne napíš nejaký kód, ktorý si sa dnes naučila.

Teraz súbor musíme uložiť a dať mu nejaký zrozumiteľný názov. Nazvime ho **python_intro.py** a uložme ho na plochu. Súbor môžeš nazvať, akokoľvek chceš, ale dôležité je, aby jeho názov končil na **.py**. Prípona **.py** nášmu operačnému systému hovorí, že je to **spustiteľný pythonovský súbor** a Python ho vie spustiť.

> **Poznámka** Všimni si jednu z najlepších vecí na editoroch kódu: farby! V Python konzole bolo všetko jednou farbou, teraz by si ale mala vidieť, že funkcia `print` je napísaná inou farbou ako reťazec. Toto sa nazýva "zvýraznenie syntaxe" (syntax highlighting) a pri programovaní je to fakt užitočná vec. Farba výrazov ti môže niečo napovedať, ak máš niekde neuzavretý reťazec či preklep v názve špeciálnych slov (ako napríklad `def` vo funkcii, ktorú uvidíme neskôr). Toto je jeden z dôvodov, prečo používame editor kódu. :)

Súbor máme uložený, je čas ho spustiť! Pomocou poznatkov z kapitoly o príkazovom riadku **zmeň adresár** na plochu terminálovým príkazom.

<!--sec data-title="Change directory: macOS" data-id="python_OSX"
data-collapse=true ces-->

Na Macu bude príkaz vyzerať takto:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Na Linuxe bude takýto:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Pripomíname, že slovo "Desktop" alebo "Plocha" môže bude preložené.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Vo windowsovom Command Prompte to bude takto:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

A vo windowsovom PowerShelli to bude takto:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Ak sa zasekneš, neboj sa spýtať. Na to presne tu máš mentorky a mentorov!

Teraz použi Python na spustenie kódu v súbore:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj, Django Girls!
    

Poznámka: na Windowse "python3" ako príkaz neexistuje. Na spustenie súboru použi "python":

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Okej! Práve si spustila svoj prvý program v Pythone zo súboru. Skvelý pocit, nie?

Teraz sa môžeš posunúť na základný nástroj v programovaní:

## If … elif … else

Kopec vecí v kóde sa má spúšťať, len ak sú splnené určité podmienky. Práve na to používa Python príkaz **if**.

Nahraď kód v súbore **python_intro.py** týmto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Ak to uložíš a spustíš, dostaneš túto chybu:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python očakáva, že od nás dostane ďalšie inštrukcie, ktoré má vykonať, ak je podmienka `3 > 2` pravdivá (teda ak bude mať hodnotu `True`). Skúsme Pythonu povedať, aby vypísal "Funguje to!". Zmeň svoj kód v súbore **python_intro.py** takto:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('Funguje to!')
```

Všimla si si, ako sme odsadili druhý riadok o 4 medzery? To musíme urobiť preto, aby Python vedel, ktorú časť kódu má spustiť, ak je výsledok pravdivý. Môžeš použiť len jednu medzeru, ale takmer všetci programátori a programátorky v Pythone používajú 4 medzery, aby bol kód dobre čitateľný. Jedno stlačenie klávesy Tab sa tiež bude rátať ako 4 medzery, pokiaľ je tvoj editor tak nastavený. Keď sa pre jedno rozhodneš, zostaň pri tom! Ak si už začala odsádzať 4 medzerami, daj si záležať, aby aj ďalšie odsadenia boli 4 medzerami, inak ti to môže spôsobovať problémy.

Ulož to a spusti znova:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
Funguje to!
```

Poznámka: Pamätaj, že Windows nepozná príkaz "python3". Odteraz vždy pri spúšťaní súborov nahraď "python3" príkazom "python".

### Čo ak podmienka nie je pravdivá?

V predcházajúcich príkladoch sa náš kód vykonal, len keď podmienka bola pravdivá (True). Ale Python má aj príkazy `elif` a `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 je naozaj viac ako 2')
else:
    print('5 nie je viac ako 2')
```

Keď to spustíš, vypíše to:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 je naozaj viac ako 2
    

Ak by 2 bolo viac ako 5, spustil by sa druhý príkaz. Pozrime sa, ako funguje `elif`:

{% filename %}python_intro.py{% endfilename %}

```python
meno = 'Sona'
if meno == 'Ola':
    print('Cau Ola!')
elif meno == 'Sona':
    print('Cau Sona!')
else:
    print('Cau neznama!')
```

a po spustení:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Cau Sona!
    

Všimla si si, čo sa stalo? `elif` ti dovolí pridať dodatočné podmienky, ktoré sa spustia, ak predchádzajúce podmienky nie sú splnené.

Za prvý `if` môžeš dať `elifov` toľko, koľko len chceš. Napríklad:

{% filename %}python_intro.py{% endfilename %}

```python
hlasitost = 57
if hlasitost < 20:
    print("Je to pomerne tiche.")
elif 20 <= hlasitost < 40:
    print("Je to fajn ako hudba na pozadi")
elif 40 <= hlasitost < 60:
    print("Super, pocujem vsetky detaily")
elif 60 <= hlasitost < 80:
    print("Fajn na party")
elif 80 <= hlasitost < 100:
    print("Trochu hlasne!")
else:
    print("Bolia ma usi! :(")
```

Python prejde všetkými podmienkami poporade a vypíše:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Super, pocujem vsetky detaily
    

## Komentáre

Komentáre (comments) sú riadky, ktoré sa začínajú znakom `#`. Po `#` môžeš napísať hocičo, Python to bude ignorovať. Komentáre môžu spraviť tvoj kód čitateľnejším pre iných ludí.

Pozrime sa, ako to vyzerá:

{% filename %}python_intro.py{% endfilename %}

```python
# Zmen hlasitost, ak je prilis silna alebo slaba
if hlasitost < 20 or hlasitost > 80:
    hlasitost = 50
    print("Lepsie!")
```

Nemusíš písať komentár pre každý riadok kódu, čo napíšeš, ale je užitočné vysvetliť, prečo tvoj kód niečo robǐ, alebo stručne zhrnúť, čo sa deje, keď robí niečo zložité.

### Zhrnutie

V posledných pár cvičeniach si sa naučila:

- **porovnávať veci** - v Pythone môžeš porovnávať veci pomocou znamienok `>`, `>=`, `==`, `<=`, `<` a operátorov `and`, `or`
- **boolean** - typ objektu, ktorý môže mať len jednu z dvoch hodnôt: `True` (pravda) alebo `False` (nepravda)
- **ukladať súbory** - ukladanie kódu v súboroch, vďaka čomu môžeme spúšťať väčšie programy
- **if... elif... else** - príkazy, ktoré ti umožňujú spustiť kód, iba ak sú splnené určité podmienky.
- **komentáre** - riadky, ktoré Python nebude spúšťať, vďaka ktorým môžeš svoj kód zdokumentovať

Prišiel čas na poslednú časť tejto kapitoly!

## Tvoje vlastné funkcie!

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná vo videu [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Pamätáš si funkcie ako napríklad `len()`, ktoré môžeš v Pythone spúšťať? Máme pre teba dobrú správu - teraz sa naučíš, ako napísať vlastnú funkciu!

Funkcia je postupnosť inštrukcií, ktoré by mal Python spustiť. Každá funkcia v Pythone začína kľúčovým slovom `def`, má svoje meno a môže mať nejaké parametre. Vyskúšajme si to. Nahraď kód v **python_intro.py** týmto:

{% filename %}python_intro.py{% endfilename %}

```python
def ahoj():
    print('Ahoj!')
    print('Ako sa mas?')

ahoj()
```

OK, naša prvá funkcia je hotová!

Možno sa čuduješ, prečo sme na koniec súboru napísali názov funkcie. Keď sme napísali `def ahoj():` a za tým odsadené riadky, písali sme inštrukcie, čo má funkcia `ahoj()` robiť. Python tieto inštrukcie prečíta a zapamätá si ich, ale funkciu zatiaľ nespustí. Aby sme Pythonu povedali, že funkciu má spustiť, musíme ju zavolať (call) pomocou `ahoj()`. Python číta a spúšťa obsah nášho súboru zhora nadol, takže funkciu musíme najprv definovať a až potom zavolať.

Poďme to spustiť a pozrime sa, čo sa stane:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj!
    Ako sa mas?
    

Poznámka: Ak to nefunguje, žiadne strachy! Výstup ti pomôže zistiť prečo:

- Ak sa ti zjaví `NameError`, znamená to, že si niečo chybne napísala, takže by si si mala overiť, že si použila rovnaký názov, keď si funkciu vytvárala pomocou `def ahoj()` a keď si ju zavolala pomocou `ahoj()`.
- Ak sa ti zjaví `IndentationError`, uisti sa, že oba `print` riadky majú rovnaký počet medzier od začiatku riadku: Python vyžaduje, aby všetky riadky boli pedantne zarovnané.
- Ak nevidíš žiaden výstup, tak sa pozri, či posledné `ahoj()` *nie je* odsadené - ak je, tento riadok sa stal súčasťou funkcie a nikdy sa nespustí.

Poďme vytvoriť našu prvú funkciu s parametrami. Použijeme predchádzajúci príklad - funkciu, ktorá hovorí "ahoj" osobe, ktorá ju spustí - s menom:

{% filename %}python_intro.py{% endfilename %}

```python
def ahoj(meno):
```

Ako vidíš, dali sme našej funkcii parameter, ktorý sme nazvali `meno`:

{% filename %}python_intro.py{% endfilename %}

```python
def ahoj(meno):
    if meno == 'Ola':
        print('Ahoj Ola!')
    elif meno == 'Sona':
        print('Ahoj Sona!')
    else:
        print('Ahoj neznama!')

ahoj()
```

Pamätaj: Funkcia `print` je odsadená o 4 medzery vo vnútri príkazu `if`. Je to preto, lebo funkcia sa spustí, len ak je splnená podmienka. Pozrime sa, ako to funguje:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      ahoj()
    TypeError: ahoj() missing 1 required positional argument: 'meno'
    

Ups, chyba. Našťastie, Python nám dáva veľmi užitočnú chybovú hlášku. Hovorí nám, že funkcia `ahoj()` (tá, čo sme definovali) má jeden povinný argument (s názvom `meno`) a že sme mu ju zabudli zadať pri volaní funkcie. Opravme to na konci súboru:

{% filename %}python_intro.py{% endfilename %}

```python
ahoj("Ola")
```

A znova ho spustime:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Ola!
    

A čo ak zmeníme meno?

{% filename %}python_intro.py{% endfilename %}

```python
ahoj("Sona")
```

A spustíme to:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Sona!
    

No a čo si myslíš, čo sa stane, ak tam napíšeš iné meno? (Nie Ola, ani Sona.) Vyskúšaj a uvidíš, či bol tvoj predpoklad správny. Malo by ti to vypísať toto:

{% filename %}command-line{% endfilename %}

    Ahoj neznama!
    

Nie je to super? Vďaka tomu nemusíš písať dookola to isté zakaždým, keď chceš zmeniť meno človeka, ktorého má funkcia pozdraviť. A to je presne dôvod, prečo potrebujeme funkcie - aby sme sa nemuseli v kóde opakovať!

Skúsme to trochu inak. Existuje viac mien ako len dve a písať samostatnú podmienku pre každé jedno by bolo ťažké, nie? Nahraď obsah svojho súboru týmto:

{% filename %}python_intro.py{% endfilename %}

```python
def ahoj(meno):
    print('Ahoj ' + meno + '!')

ahoj("Kika")
```

Teraz tento kód spustime:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Kika!
    

Gratulujeme! Práve si sa naučila, ako sa píšu funkcie! :)

## Cykly

> Pre čitateľky a čitateľov doma: Táto kapitola je spracovaná vo videu [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

Toto je už posledná časť. Išlo to rýchlo, však? :)

Programátori a programátorky sa neradi opakujú. Programovanie je o automatizácii vecí, takže nechceme zdraviť každú osobu manuálne, však? A tu nám prídu vhod cykly (loops).

Ešte si spomínaš na zoznamy? Spravme si zoznam dievčat:

{% filename %}python_intro.py{% endfilename %}

```python
dievcata = ['Katka', 'Kika', 'Zuza', 'Ola', 'Ty']
```

Chceme ich pozdraviť všetky menom. Na to máme funkciu `ahoj`, tak ju použime v cykle:

{% filename %}python_intro.py{% endfilename %}

```python
for meno in dievcata:
```

Príkaz `for` sa správa podobne ako `if`; kód pod oboma z nich musí byť odsadený o štyri medzery.

Tu je celý kód, ktorý napíšeme do súboru:

{% filename %}python_intro.py{% endfilename %}

```python
def ahoj(meno):
    print('Ahoj ' + meno + '!')

dievcata = ['Katka', 'Kika', 'Zuza', 'Ola', 'Ty']
for meno in dievcata:
    ahoj(meno)
    print('Dalsie dievca')
```

A keď to spustíme:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Ahoj Katka!
    Dalsie dievca
    Ahoj Kika!
    Dalsie dievca
    Ahoj Zuza!
    Dalsie dievca
    Ahoj Ola!
    Dalsie dievca
    Ahoj Ty!
    Dalsie dievca
    

Ako vidíš, všetko, čo dáš do príkazu `for` s tým, že to odsadíš, sa zopakuje pre každý prvok zoznamu `dievcata`.

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
    

`range` je funkcia, ktorá vytvára zoznam s postupnosťou čísel (krajné čísla funkcii poskytneš ako parametre).

Všimni si, že druhé číslo sa nenachádza vo výstupnom zozname (teda `range(1, 6)` počíta od 1 po 5, ale neobsahuje číslo 6). To preto, lebo "range" je jednostranne otvorený, čo znamená, že obsahuje prvú hodnotu, ale nie poslednú.

## Zhrnutie

To je všetko. **Si úplne super!** Toto bola náročná kapitola, takže by si mala byť na seba pyšná. My sme na teba rozhodne hrdí, že si to zvládla až potiaľto!

Oficiálnu verziu tutoriálu najdeš na https://docs.python.org/3/tutorial/. Prevedie ťa jazykom podrobnejšie. Nech sa darí! :)

Teraz na chvíľu si daj pauzu - natiahni sa trochu, poprechádzaj sa, nech si tvoje oči oddýchnu - a potom prejdeme na ďalšiu kapitolu. :)

![Koláčik](images/cupcake.png)
