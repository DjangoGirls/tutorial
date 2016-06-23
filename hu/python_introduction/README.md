# Bevezetés a Pythonba

> Ez a fejezet részben a Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tutorialjain alapszik.

Írjunk egy kis kódot!

## A Python parancssor

Hogy elkezdhess a Pythonnal ismerkedni, szükséged lesz a *parancssorra*. Már tudod, hogyan kell -- megtanultad a [ Bevezetés a parancssor használatába][1] fejezetben.

 [1]: ../intro_to_command_line/README.md

Ha kész vagy, kövesd az alábbi utasításokat.

Egy Python konzolt szeretnénk megnyitni. Gépeld be a `python` parancsot Windowson, vagy a `python3` parancsot, ha Mac vagy Linux van a gépeden, és nyomj `enter`t.

    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Az első Python parancsod!

Miután futtattad a Python parancsot, a parancssor megváltozott: `>>>`. Ez azt jelenti, hogy mostantól csak a Python nyelv parancsait használhatjuk. Nem kell beírnod ezt: `>>>` - a Python megcsinálja helyetted.

Ha bármikor szeretnél kilépni a Python konzolból, csak gépeld be, hogy `exit()`, vagy használd a `Ctrl + Z` billentyűkombinációt Windos-ra, vagy a `Ctrl + D`-t Mac-re/Linux-ra. Ezután már nem fogod látni a `>>>` jelet.

Most épp nem szeretnénk kilépni a Python konzolból. Inkább többet szeretnénk tanulni róla. Kezdjünk valami nagyon egyszerűvel. Például kezdjünk valami matekkel, mint pl. `2 + 3` majd `enter`.

    >>> 2 + 3
    5
    

Szuper! Láttad, ahogy előugrott a válasz? A Python tud matekozni! Kipróbálhatsz más parancsokat is, mint például: - `4 * 5` - `5 - 1` - `40 / 2`

Szórakozz egy kicsit ezzel aztán gyere vissza ide :).

Amint látod, a Python jó számológép. Ha kíváncsi vagy, mire jó még...

## Stringek

Mi a helyzet a neveddel? Gépeld be a neved időzéjelbe téve:

    >>> "Ola"
    'Ola'
    

Épp most hoztad létre az első stringedet! Ez egy karakter-sorozat amit a számítógép fel tud dolgozni. A string kezdetét és végét ugyanazzal a karakterrel jelöljük. Ez lehet szimpla (`'`) vagy dupla (`"`) idézőjel (nincs különbség!) Az idézőjelek mondják meg a Pythonnak, hogy ami köztük van, az egy string.

A stringeket össze is lehet fűzni. Próbáld ki ezt:

    >>> "Hi there " + "Ola"
    'Hi there Ola'
    

Sokszorosítani is lehet őket:

    >>> "Ola" * 3
    'OlaOlaOla'
    

Ha aposztrófot szeretnél a stringedbe tenni, kétféleképpen teheted meg.

Idézőjel segítségével:

    >>> "Runnin' down the hill"
    "Runnin' down the hill"
    

vagy pedig escape karakterrel (``) az aposztróf előtt:

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"
    

Jó, mi? Ha nagybetűkkel szeretnéd látni a neved, csak gépeld be ezt:

    >>> "Ola".upper()
    'OLA'
    

Épp most használtad az `upper` **functiont** (függvényt) a stringeden! A függvény, (mint például az `upper()`), egy utasítássorozat, amit a Python végrehajt egy adott objektumon (`"Ola"`), amikor a függvényt meghívod.

Ha szeretnéd tudni, hogy hány betűből áll a neved, arra is van függvény!

    >>> len("Ola")
    3
    

Érdekel, miért van az, hogy néha a függvényeket úgy hívjuk meg, hogy a string után egy `.` jön, majd a függvény neve (mint például `"Ola".upper()`), máskor pedig előbb a függvény neve jön, aztán a string a zárójelben? Nos, ez azért van mert néha a függvények objektumokhoz tartoznak, mint az `upper()`, amit csak azokon az objektumokon hívhatunk meg. Ebben az esetben a függvényt **metódusnak** (method) nevezzük. Máskor a függvény nem tartozik egy bizonyos típusú objektumhoz, hanem többféle típusú objektumon is meg lehet hívni, mint például a `len()`. Ezért volt az hogy az `"Ola"`-t paraméterként adtuk át a `len` függvénynek.

### Összefoglaló

Oké, elég a stringekből. Tehát ezidáig a következőkről tanultál:

*   **a parancssor** - ha parancsokat (kódot) írunk be a Python parancssorba, a Python végrehajtja azokat
*   **számok és stringek** - a Pythonban a számokat matematikai műveletekhez, a stringeket szöveg objektumokhoz használjuk
*   **operátorok** - mint a + és a *, két értékből egy újat hoznak létre
*   **függvények** - mint az upper() és a len(), objektumokon hajtanak végre műveleteket.

Ezek volnának az alapjai minden programozási nyelvnek. Készen állsz valami bonyolultabbra? Rajta!

## Hibák

Nézzünk valami újat. Vajon megkaphatjuk-e egy szám hosszát ugyanúgy, mint a nevünk hosszát? Írd be, hogy `len(304023)`, majd üss `enter`-t:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

Megkaptuk az első hibánkat! Azt mondja, az "int" típusú (integerek, egész számok) objektumoknak nincs hosszuk. Most akkor mit tehetünk? Talán leírhatjuk a számunkat stringként? A stringeknek van hosszuk, nem?

    >>> len(str(304023))
    6
    

Működött! Használtuk a `str` függvényt a `len` függvény belsejében. A `str()` függvény stringgé alakít egy tetszőleges típusú objektumot.

*   A `str` függvény **stringgé** alakítja a dolgokat
*   Az `int` függvény **integerré** alakítja a dolgokat

> Fontos: számokat (integereket) stringgé bármikor alakíthatunk, de stringet számmá nem feltétlenül - mégis mi lenne az `int('hello')` eredménye?

## Változók

A programozásban nagyon fontos a változó fogalma. A változó egy név egy objektumra, amit majd később újra felhasználhatunk. A programozók arra használják a változókat, hogy adatokat tároljanak velük, hogy a kódjukat olvashatóbbá tegyék, és hogy ne kelljen megjegyezniük mindenről, hogy micsoda.

Tegyük fel, hogy létrehoztál egy változót, aminek a neve `name`:

    >>> name = "Ola"
    

Látod? Egyszerű! Csak ennyi: name egyenlő Ola.

Amint láthatod, a program nem adott vissza semmilyen eredményt, az eddigiekkel ellentétben. Honnan tudjuk így, hogy a változó létrejött? Egyszerűen írd be, hogy `name`, majd üss `enter`-t:

    >>> name
    'Ola'
    

Juppííí! Az első változód :)! És bármikor megváltoztathatod, hogy mit tartalmaz:

    >>> name = "Sonja"
    >>> name
    'Sonja'
    

És függvényekben is használhatod:

    >>> len(name)
    5
    

Szuper, ugye? Természetesen a változók bármilyen értéket felvehetnek, például szám-értékeket is. Próbáld ki:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

De mi van akkor, ha rossz nevet használunk? Kitalálod? Próbáljuk ki!

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    

Egy hiba! Amint látod a Pythonban különböző típusú hibák vannak, ezt például úgy hívják hogy **NameError**. A Python ezt a hibát dobja, ha olyan változóra hivatkozol, ami nem volt még létrehozva. Ha majd találkozol ezzel a hibával, mindig ellenőrizd a kódod, hogy nem írtál-e el egy nevet.

Játssz egy kicsit a változókkal, hogy lásd, mi mindenre vagy képes velük!

## A print függvény

Próbáld ki ezt:

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria
    

Amikor beírod, hogy `name`, a Python interpreter a "name" változó szöveges *reprezentációjával* tér vissza, ami a M-a-r-i-a betűkből áll, idézőjelek között. Amikor azt írod: `print(name)`, a Python "kinyomtatja" a változó tartalmát a képernyőre, idézőjelek nélkül, ami sokkal elegánsabb.

Amint majd látni fogjuk, a `print()` hasznos lesz függvények belsejében is, vagy amikor több sorba szeretnénk nyomtatni.

## Listák

A stringek és az integerek mellett a Python még sok más típusú objektumot ismer. Most megmutatunk egy újat, amit úgy hívnak: **lista**. A lista olyan, amilyennek elképzeled: egy objektum, ami más objektumok listája :)

Hozzunk létre egy listát:

    >>> []
    []
    

Igen, ez egy üres lista. Nem túl hasznos, ugye? Most hozzunk létre egy listát a lottószámokkal. Nem akarjuk folyton ismételni magunkat, úgyhogy egyenesen egy változóba tesszük:

    >>> lottery = [3, 42, 12, 19, 30, 59]
    

Igen, van egy listánk! Mit lehet vele csinálni? Nézzük meg, hány lottószám van a listában. Van tipped, melyik függvényt fogjuk erre használni? Biztos tudod!

    >>> len(lottery)
    6
    

Igen! A `len()` megadja, hogy hány objektum van a listában. Hasnzos, ugye? Most akkor rendezzük sorba a listát:

    >>> lottery.sort()
    

Ez nem ad vissza semmit, csak megváltoztatta a számok sorrendjét a listában. Írassuk ki a listát, hogy lássuk, mi történt:

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]
    

Amint látod, a számok a listában most növekvő sorrendben vannak. Gratula!

Esetleg szeretnéd fordított sorrendbe rendezni? Csináljuk meg!

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
    

Könnyű, ugye? Ha hozzá akarsz adni valamit a listához, a következő paranccsal teheted:

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    

Ha például csak az első számot akarod látni, arra használhatod az **indexelést**. Az index egy szám ami megmondja, hányadikként fordul elő egy elem a listában. A programozók szeretik 0-tól kezdeni a számolást, ezért a lista első eleme a 0-dik indexű helyen van, a következő az 1-nél és így tovább. Próbáld ki ezt:

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
    

Amint látod, a listában előforduló különböző objektumokat elérhetjük a lista nevének, illetve az objektum indexének megjelölésével, ahol az indexet szögletes zárójelbe írjuk.

Ahhoz, hogy valamit kitöröljünk a listából, szükségünk van az **index** fogalmára, amint azt az előbb tanultuk, valamint a `pop()` parancsra. Nézzünk egy példát hogy megerősítsük az eddig tanultakat; ki fogjuk törölni az első elemet a listánkból.

    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(lottery[0])
    59
    >>> lottery.pop(0)
    >>> print(lottery)
    [42, 30, 19, 12, 3, 199]
    

Működik, mint a varázslat!

Szórakozásból próbálj elérni különböző indexű elemeket: 6, 7, 1000, -1, -6 vagy -1000. Meg tudod-e mondani az eredményt előre? Értelmes-e az eredmény?

Ebben a Python dokumentációban megtalálod a listákra értelmezett összes metódust: https://docs.python.org/3/tutorial/datastructures.html

## Szótárak

A szótár hasonló a listához, de a szótár elemeit nem indexekkel hanem kulcsokkal (key) érjük el. A kulcs lehet bármilyen string vagy szám. Az üres szótár létrehozására szolgáló utasítás a következő:

    >>> {}
    {}
    

Épp most definiáltál egy üres szótárat. Hurrá!

Most pedig próbáld ki a következő parancsot (és próbáld meg használni a saját adataidat):

    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
    

Ezzel a paranccsal létrehoztál egy szótár-változót aminek a neve `participant`, és ami tartalmaz három kulcs-érték (key-value) párt:

*   A `name` kulcs az `'Ola'` értékre mutat (ami egy `string` típusú objektum),
*   `country` a `'Poland'`-ra mutat (szintén `string` típusú),
*   és `favorite_numbers` a `[7, 42, 92]` objektumra mutat (ami egy `lista` benne három elemmel).

Lekérdezheted az egyes kulcsokhoz tartozó értékeket a következő szintaxist használva:

    >>> print(participant['name'])
    Ola
    

Látod, nagyon hasonlít a listákhoz. Csak épp nem kell indexeket megjegyezned - csupán neveket.

Vajon mi történik, ha olyan kulcshoz tartozó értéket kérdezünk le a Pythontól, ami nem létezik? Nézzük meg!

    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'
    

Jéé, egy újabb hiba! Ezúttal **KeyError**. A Python segítőkész, és megmondja, hogy az `'age'` kulcsnál nem található érték a szótárban.

Mikor használjunk szótárakat és mikor listákat? Nos, ez egy érdekes kérdés. Gondolkozz el egy kicsit, és próbáld meg magadtól kitalálni, mielőtt elolvasod az alábbi választ.

*   Csak elemek rendezett sorozatára van szükséged? Használj listát.
*   Kulcs és érték párokra van szükséged, amiket majd le tudsz kérdezni hatékonyan (kulcs alapján)? Használj szótárat.

A szótárak, ugyanúgy mint a listák, *módosíthatók*, ami azt jelenti, hogy az objektumot meg lehet változtatni létrehozás után. Hozzá lehet adni egy kulcs-érték párt a szótárhoz a létrehozása után, pl:

    >>> participant['favorite_language'] = 'Python'
    

Ugyanúgy, mint a listáknál, a `len()` metódus visszaadja a szótár hosszát, azaz a kulcs-érték párok számát. Rajta, próbáld ki a következő parancsot:

    >>> len(participant)
    4
    

Remélem most már világos :) Készen állsz az újabb mókára a szótárakkal? Ugorj a következő sorhoz, és láss lenyűgöző dolgokat.

Használd a `pop()` parancsot, hogy kitörölj egy elemet a szótárból. Mondjuk ki akarod törölni a `'favorite_numbers'` kulcsnál található elemet. Csak írd be a következőt:

    >>> participant.pop('favorite_numbers')
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
    

Amint azt a kimenetből látod, a 'favorite_numbers' kulcshoz tartozó elem eltűnt a szótárból.

Az előbbihez hasonlóan, meg is tudod változtatni egy kulcsnál a hozzá tartozó értéket a szótárban. Írd ezt:

    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
    

Amint látod, a `'country'` kulcsnál levő érték megváltozott `'Poland'`-ról `'Germany'`-ra. :) Izgalmas, ugye? Hurrá! Most ismét tanultál egy nagyszerű dolgot.

### Összefoglaló

Nagyszerű! Most már tudsz egy csomó mindent a programozásról. Ebben az utolsó részben a következőkről tanultál:

*   **hibák** - tudod, hogyan olvasd és értsd meg a hibákat, amiket a Python ad, amikor nem tudja értelmezni a parancsodat
*   **változók** - nevek az objektumokhoz, hogy a kód könnyebben írható és könnyebben olvasható legyen
*   **listák** - lista meghatározott sorrendben lévő objektumokból
*   **szótárak** - objektumok, amiket kulcs-érték párokként tárolunk

Felkészültél a következő részre? :)

## Dolgok összehasonlítása

A számítástechnikában nagyon fontos, hogy össze tudjunk hasonlítani dolgokat. Mik a legegyszerűbb dolgok, amiket össze tudunk hasonlítani? Hát a számok. Nézzük meg ez hogy működik:

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
    

Adtunk a Pythonnak néhány számot, hogy összehasonlítsa azokat. Amint látod, a Python nem csak számokat, de műveleti eredményeket is össze tud hasonlítani. Jó, ugye?

Azon gondolkozol, miért kellett két egyenlőség jelet `==` tenni, amikor azt néztük, hogy két szám egyenlő-e? Az egyetlen `=` jelet arra használjuk, hogy a változóknak értéket adjunk. Mindig, de **mindig** két `==` jelet kell használni ha két dolog egyenlőségét akarod tesztelni. Azt is ki tudjuk fejezni, hogy két dolog nem egyenlő. Erre a `!=` szimbólumot használjuk, amint az alábbi példában is.

Adj a Pythonnak két új parancsot:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

A `>` és a `<` egyszerűek, de vajon a `>=` és a `<=` mit jelentenek? Ezeket úgy kell olvasni, hogy:

*   x `>` y azt jelenti: x nagyobb, mint y
*   x `<` y azt jelenti: x kisebb, mint y
*   x `<=` y azt jelenti: x kisebb vagy egyenlő y-nal
*   x `>=` y azt jelenti: x nagyobb vagy egyenlő y-nal

Nagyszerű! Szeretnél még egy példát? Próbáld ki ezt:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
    

Annyi összehasonlítást kombinálhatsz össze, amennyit csak akarsz, és a Python kiszámolja az eredményt. Okos, ugye?

*   **and** (azaz: és) - amikor az `and` operátort használod, a kifejezés mindkét oldalán igaz értéknek kell állnia ahhoz, hogy az eredmény igaz legyen
*   **or** (azaz: vagy) - amikor az `or` operátort használod, elég csak az egyik oldalon igaz értéknek állnia ahhoz, hogy az eredmény igaz legyen

Hallottad már azt a kifejezést hogy "almákat narancsokkal összehasonlítani"? Nézzük meg ennek a python-beli megfelelőjét:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

Láthatod, hogy ugyanúgy, mint a kifejezéseknél, a Python nem tudja összehasonlítani a számot (`int`) a stringgel (`str`). Ehelyett **TypeError** típusú hibát dob, azaz megmondja, hogy két különböző típust nem lehet egymással összehasonlítani.

## Boolean (Logikai)

Véletlenül épp megismerkedtél egy újabb Python típussal. Úgy hívják: **Boolean** -- és valószínűleg ez a legegyszerűbb típus ami létezik.

Egy Boolean objektum két lehetséges értéket vehet fel: - Igaz - Hamis

De ahhoz, hogy a Python megértse, pontosan így kell írni: 'True' (az első betű nagybetű, a többi kisbetű). **true, TRUE, tRUE mind nem jók -- csak az True helyes.** (És ugyanígy a 'False' esetében)

A Booleanok is lehetnek változók! Nézd:

    >>> a = True
    >>> a
    True
    

Sőt, ezt is írhatod:

    >>> a = 2 > 5
    >>> a
    False
    

Gyakorold egy kicsit és játssz a Booleanokkal, pl próbáld ki a következő parancsokat:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Gratulálunk! A Booleanok a programozás egyik legmenőbb elemei, és te épp megtanultad használni őket!

# Mentsd el!

Egész mostanig a python interpreterbe írkáltuk a parancsokat, ami arra korlátoz minket hogy, egyszerre csak egy sort írjunk. A gyakorlatban a programokat fájlba mentjük, és utána futtatjuk a programnyelv **interpreter**-e vagy **compiler**-e révén. Mi mindeddig a Python **interpreter**-ével futtatuk a programjainkat, soronként. A következő feladatokhoz többsoros programokra is szükségünk lesz, úgyhogy gyorsan:

*   Lépjünk ki a Python interpreterből
*   Nyissunk meg egy kódszerkesztőt
*   Mensünk el benne valami kódot egy python fájlba
*   És futtassuk!

Ahhoz hogy kilépjünk a Python interpreterből, egyszerűen írjuk be, hogy ~~~ exit()~~~:

    >>> exit()
    $
    

Ezzel visszatértünk a parancssorba.

Egy előző részben már kiválasztottuk a kedvenc [kódszerkesztő][2]nket. Most nyissuk meg az editort és az új üres fájlba írjuk bele:

 [2]: ../code_editor/README.md

```python
    print('Hello, Django girls!')
```

> **Megj.** Vegyük észre a kód editorok legnagyszerűbb tulajdonságát: a színeket! A Python konzolban minden egyszínű volt, most a `print` függvény más színű, mint a string. Ezt úgy hívják: "syntax highlighting" (szintaxis-kiemelés), és kódoláshoz nagyon hasznos. A kód színe mindenféle utalásokat hordoz magában, pl. egy lezáratlan string vagy egy elírás egy kulcsszó nevében (pl. a `def` a függvényeknél, amint látni fogjuk mindjárt). Ez az egyik oka annak, hogy kódszerkesztőt használuk :)

Mostanra már tapasztalt Python programozó lettél, úgyhogy írj valami kódot, amit ma tanultál.

Most mentsük el a fájlt, és adjunk neki valami jellemző nevet. Nevezzünk **python_intro.py**-nak, és mentsük el a desktopra. Bárhogy nevezhetjük a fájlt, de a kiterjesztés fontos, hogy **.py** legyen. A **.py** kiterjesztés megmondja az operációs rendszerünknek, hogy **python futtatható programfájl**-lal van dolga.

Most hogy a fájl el van mentve, itt az ideje, hogy lefuttassuk. Felhaszálva a tudásodat a parancssoros részből, navigálj a terminálban a desktopra a **könyvtárváltás** parancs segítségével.

Mac-en a parancs valahogy így néz ki:

    $ cd /Users/<your_name>/Desktop
    

Linuxon így (A "Desktop" lehet, hogy le van fordítva a te nyelvedre):

    $ cd /home/<your_name>/Desktop
    

És Windowson így néz ki:

    > cd C:\Users\<your_name>\Desktop
    

Ha megakadtál volna, kérj nyugodtan segítséget.

Most pedig futtasd le a Python kódot, így:

    $ python3 python_intro.py
    Hello, Django girls!
    

Rendben! Épp lefuttattad az első Python programodat fájlból. Jó érzés, ugye?

Most akkor továbbmehetünk egy újabb kulcsfontosságú programozási elemre:

## If...elif...else

Sokszor előfordul a programozásban, hogy egyes kódrészleteknek csak akkor kell lefutniuk, ha bizonyos feltételek teljesülnek. Ezért vannak a Pythonban az **if statement**ek (if állítások).

Cseréld ki a **python_intro.py** fájlban lévő kódot erre:

```python
    if 3 > 2:
```

Ha ezt elmented és lefuttatod, ezt a hibaüzenetet fogod látni:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

A Python arra számít, hogy további utasításokat kap arra az esetre, ha a `3 > 2` teljesül, vagyis `True` lesz. Vegyük rá a Pythont, hogy kiírja: "It works!" ("Működik!"). Változtasd meg erre a **python_intro.py** fájlban lévő kódot:

```python
    if 3 > 2:
        print('It works!')
```

Megfigyelted, hogy a következő sort 4 szóközzel indentáltuk? Erre azért van szükség, hogy a Python tudja, melyik kódrészletet kell lefuttatnia, ha a feltétel teljesül. Egy szóközt is használhatnál, de szinte az összes Python programozó 4 szóközt használ, hogy rendezetten nézzen ki a kód. Egy `tab` is 4 szóköznek számít.

Mentsd el, és futtasd le még egyszer:

    $ python3 python_intro.py
    It works!
    

### Mi történik, ha egy feltétel nem teljesül (vagyis nem True)? 

A korábbi példákban a kód csak akkor futott le, ha a feltétel teljesült. De a Pythonnak van `elif` és `else` statementje is:

```python
    if 5 > 2:
        print('5 is indeed greater than 2')
    else:
        print('5 is not greater than 2')
```

Ha ezt lefuttatod, a következőt kapod:

    $ python3 python_intro.py
    5 is indeed greater than 2
    

Ha a 2 nagyobb lenne, mint az 5, a második parancs futott volna le. Egyszerű, igaz? Nézzük, hogy működik az `elif`:

```python
    name = 'Sonja'
    if name == 'Ola':
        print('Hey Ola!')
    elif name == 'Sonja':
        print('Hey Sonja!')
    else:
        print('Hey anonymous!')
```

lefuttatva:

    $ python3 python_intro.py
    Hey Sonja!
    

Látod, mi történt itt? Az `elif` arra jó, hogy plusz feltételeket írhass a kódodba, ami akkor fut le, ha a korábbi feltételek nem teljesülnek.

Az első `if` statement után annyi `elif` állítást írhatsz, amennyit csak akarsz. Például:

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
        print("My ears are hurting!:(")! :(")
```

A Python sorban mindegyik feltételt megnézi, és kiírja:

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

### Összefoglaló

Az előző három feladatban ezekről tanultál:

*   **dolgok összehasonlítása** - Pythonban a `>`, `>=`, `==`, `<=`, `<` jelekkel, és az `and`, `or` operátorokkal hasonlíthatsz össze dolgokat
*   **Boolean** - egy olyan fajta objektum, ami csak két értéket vehet fel: `True` vagy `False`
*   **Fájlok elmentése** - a kódot fájlokban is tárolhatod, így hosszabb programokat is lefuttathatsz.
*   **if...elif...else** - állítások, amik arra jók, hogy a kód csak bizonyos feltételek teljesülése esetén fusson le.

Elérkeztünk a fejezet utolsó részéhez!

## A saját függvényeidhez!

Emlékszel például a `len()` fügvényre, amit lefuttathatsz Pythonban? Jó hírünk van - most megtanulod, hogyan írhatsz saját függvényeket!

A függvény utasítások sorozata, amit a Python lefuttat. Minden Python függvény a `def` kulcsszóval kezdődik, van neve, és lehetnek paraméterei. Kezdjük egy könnyűvel. Cseréld ki a **python_intro.py** kódját erre:

```python
    def hi():
        print('Hi there!')
        print('How are you?')
    
    hi()
```

Oké, kész is az első függvény!

Talán elgondolkodtál, miért írtuk a függvény nevét a fájl aljára. Erre azért van szükség, mert a Python felülről lefelé olvassa be és futtatja le a fájlt. Tehát ahhoz, hogy használni tudjuk a függvényünket, újra le kell írnunk a fájl alján.

Futtassuk le, és nézzük meg, mi történik:

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Ez könnyű volt! Most írjuk meg az első olyan függvényt, aminek vannak paraméterei. Az előző példát fogjuk használni - egy függvény, ami köszön annak, aki futtatja, de most nevet is adunk hozzá:

```python
    def hi(name):
```

Ahogy láthattad, a függvény most kapott egy paramétert, amit `name`-nek hívunk:

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

Fontos: a `print` függvény 4 szóközzel van indentálva az `if` statementen belül. Erre azért van szükség, hogy ez a függvény a feltétel teljesülése esetén fusson le. Nézzük, hogy működik:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Hoppá, egy hiba. Szerencsére a Python elég hasznos hibaüzeneteket ad nekünk. Azt mondja, a `hi()` függvénynek (vagyis annak, amit az előbb definiáltunk) egy kötelező paramétere van (amit `name`-nek hívnak), és ezt elfelejtettük beadni, amikor meghívtuk a függvényt. Javítsuk ki a fájl alján:

```python
    hi("Ola")
```

És futtassuk le újra:

    $ python3 python_intro.py
    Hi Ola!
    

És ha megváltoztatjuk a nevet?

```python
    hi("Sonja")
```

Futtasd le:

    $ python3 python_intro.py
    Hi Sonja!
    

Mit gondolsz, mi fog történni, ha egy harmadik nevet írsz be? Próbáld ki, és nézd meg, jól gondoltad-e. Ezt kell kapnod:

    Hi anonymous!
    

Ez fantasztikus, nem? Így nem kell állandóan ismételned magad, ha meg szeretnéd változtatni az ember nevét, akinek a függvény köszön. Pont emiatt van szükségünk függvényekre - soha ne ismételd meg a kódodat!

Most csináljunk valami okosabbat - több mint két név van a világon, és nehéz lenne mindegyikhez egy külön feltételt írni, nem?

```python
    def hi(name):
        print('Hi ' + name + '!')
    
    hi("Rachel")
```

Most hívjuk meg a kódot:

    $ python3 python_intro.py
    Hi Rachel!
    

Gratulálunk! Megtanultad, hogy kell függvényeket írni :)

## Ciklusok (loopok)

Ez már tényleg az utolsó rész. Gyors volt, nem igaz? :)

A programozók nem szeretik ismételni magukat. A programozás arról szól, hogy dolgokat automatizáljunk, így nem kell minden alkalommal kézzel beírni mindenkinek a nevét, akit üdvözölni akarunk. Ilyenkor jönnek jól a ciklusok.

Még emlékszel a listákra? Írjunk egy listát lányokból:

```python
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Mindegyiküket üdvözölni szeretnénk. Ehhez már megvan a `hi` függvényünk, tegyük bele egy loopba:

```python
    for name in girls:
```

A ~~~for~~~ statement hasonlóan működik, mint az ~~~if~~~statement; mindkettő alatt 4 szóközzel kell indentálni a következő sort.

Itt a teljes kód, ami a fájlban lesz:

```python
    def hi(name):
        print('Hi ' + name + '!')
    
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    for name in girls:
        hi(name)
        print('Next girl')
```

És amikor futtatjuk:

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
    

Amint láthattad, minden, amit indentálva a `for` statementbe tettél, megismétlődik a `girls` lista minden elemével.

A `for`-t számokon is használhatod, a `range` függvénnyel:

    for i in range(1, 6):
        print(i)
    

Ezt kapjuk:

    1
    2
    3
    4
    5
    

A `range` függvény létrehoz egy egymás után következő számokból álló listát (ezeket a számokat te adod meg paraméterként).

Figyeld meg, hogy a két szám közül a második már nincs benne a listában, amit a Python visszaad (vagyis a `range(1, 6)` 1-től 5-ig számol, de nem tartalmazza a 6-ot). Ez azért van, mert a "range" félig nyitott, ez pedig azt jelenti, hogy az első értéket tartalmazza, de az utolsót már nem.

## Összefoglaló

Meg is vagyunk. **Szuper vagy!** Ez egy nehéz fejezet volt, büszke lehetsz magadra. Mi nagyon büszkék vagyunk rád, amiért idáig eljutottál!

Most talán tarthatnál egy kis szünetet - nyújtózkodj, sétálj egy kicsit, pihentesd a szemeidet - mielőtt továbbmennénk a következő fejezetre. :)

![Cupcake][3]

 [3]: images/cupcake.png
