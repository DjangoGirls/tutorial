# Bevezetés a Pythonba

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Írjunk egy kis kódot!

## A Python parancssor

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Hogy elkezdhess a Pythonnal ismerkedni, szükséged lesz a *parancssorra*. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Ha kész vagy, kövesd az alábbi utasításokat.

Egy Python konzolt szeretnénk megnyitni. Gépeld be a `python` parancsot Windowson, vagy a `python3` parancsot, ha Mac vagy Linux van a gépeden, és nyomj `enter`t.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Az első Python parancsod!

Miután futtattad a Python parancsot, a parancssor megváltozott: `>>>`. Ez azt jelenti, hogy mostantól csak a Python nyelv parancsait használhatjuk. You don't have to type in `>>>` – Python will do that for you.

Ha bármikor szeretnél kilépni a Python konzolból, csak gépeld be, hogy `exit()`, vagy használd a `Ctrl + Z` billentyűkombinációt Windos-ra, vagy a `Ctrl + D`-t Mac-re/Linux-ra. Ezután már nem fogod látni a `>>>` jelet.

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

Szórakozz egy kicsit ezzel aztán gyere vissza ide. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Stringek

Mi a helyzet a neveddel? Gépeld be a neved időzéjelbe téve:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Épp most hoztad létre az első stringedet! Ez egy karakter-sorozat amit a számítógép fel tud dolgozni. A string kezdetét és végét ugyanazzal a karakterrel jelöljük. Ez lehet szimpla (`'`) vagy dupla (`"`) idézőjel (nincs különbség!) Az idézőjelek mondják meg a Pythonnak, hogy ami köztük van, az egy string.

A stringeket össze is lehet fűzni. Próbáld ki ezt:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Sokszorosítani is lehet őket:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Ha aposztrófot szeretnél a stringedbe tenni, kétféleképpen teheted meg.

Idézőjel segítségével:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

vagy pedig escape karakterrel (``) az aposztróf előtt:

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Jó, mi? Ha nagybetűkkel szeretnéd látni a neved, csak gépeld be ezt:

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

Érdekel, miért van az, hogy néha a függvényeket úgy hívjuk meg, hogy a string után egy `.` jön, majd a függvény neve (mint például `"Ola".upper()`), máskor pedig előbb a függvény neve jön, aztán a string a zárójelben? Nos, ez azért van mert néha a függvények objektumokhoz tartoznak, mint az `upper()`, amit csak azokon az objektumokon hívhatunk meg. Ebben az esetben a függvényt **metódusnak** (method) nevezzük. Máskor a függvény nem tartozik egy bizonyos típusú objektumhoz, hanem többféle típusú objektumon is meg lehet hívni, mint például a `len()`. Ezért volt az hogy az `"Ola"`-t paraméterként adtuk át a `len` függvénynek.

### Összefoglaló

Oké, elég a stringekből. Tehát ezidáig a következőkről tanultál:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Ezek volnának az alapjai minden programozási nyelvnek. Készen állsz valami bonyolultabbra? Rajta!

## Hibák

Nézzünk valami újat. Vajon megkaphatjuk-e egy szám hosszát ugyanúgy, mint a nevünk hosszát? Írd be, hogy `len(304023)`, majd üss `enter`-t:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Megkaptuk az első hibánkat! Azt mondja, az "int" típusú (integerek, egész számok) objektumoknak nincs hosszuk. Most akkor mit tehetünk? Talán leírhatjuk a számunkat stringként? A stringeknek van hosszuk, nem?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Működött! Használtuk a `str` függvényt a `len` függvény belsejében. A `str()` függvény stringgé alakít egy tetszőleges típusú objektumot.

- A `str` függvény **stringgé** alakítja a dolgokat
- Az `int` függvény **integerré** alakítja a dolgokat

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Változók

A programozásban nagyon fontos a változó fogalma. A változó egy név egy objektumra, amit majd később újra felhasználhatunk. A programozók arra használják a változókat, hogy adatokat tároljanak velük, hogy a kódjukat olvashatóbbá tegyék, és hogy ne kelljen megjegyezniük mindenről, hogy micsoda.

Tegyük fel, hogy létrehoztál egy változót, aminek a neve `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Amint láthatod, a program nem adott vissza semmilyen eredményt, az eddigiekkel ellentétben. Honnan tudjuk így, hogy a változó létrejött? Egyszerűen írd be, hogy `name`, majd üss `enter`-t:

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

És függvényekben is használhatod:

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

De mi van akkor, ha rossz nevet használunk? Kitalálod? Próbáljuk ki!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Egy hiba! Amint látod a Pythonban különböző típusú hibák vannak, ezt például úgy hívják hogy **NameError**. A Python ezt a hibát dobja, ha olyan változóra hivatkozol, ami nem volt még létrehozva. Ha majd találkozol ezzel a hibával, mindig ellenőrizd a kódod, hogy nem írtál-e el egy nevet.

Játssz egy kicsit a változókkal, hogy lásd, mi mindenre vagy képes velük!

## A print függvény

Próbáld ki ezt:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Amikor beírod, hogy `name`, a Python interpreter a "name" változó szöveges *reprezentációjával* tér vissza, ami a M-a-r-i-a betűkből áll, idézőjelek között. Amikor azt írod: `print(name)`, a Python "kinyomtatja" a változó tartalmát a képernyőre, idézőjelek nélkül, ami sokkal elegánsabb.

Amint majd látni fogjuk, a `print()` hasznos lesz függvények belsejében is, vagy amikor több sorba szeretnénk nyomtatni.

## Listák

A stringek és az integerek mellett a Python még sok más típusú objektumot ismer. Most megmutatunk egy újat, amit úgy hívnak: **lista**. A lista olyan, amilyennek elképzeled: egy objektum, ami más objektumok listája. :)

Hozzunk létre egy listát:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Igen, ez egy üres lista. Nem túl hasznos, ugye? Most hozzunk létre egy listát a lottószámokkal. Nem akarjuk folyton ismételni magunkat, úgyhogy egyenesen egy változóba tesszük:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Igen, van egy listánk! Mit lehet vele csinálni? Nézzük meg, hány lottószám van a listában. Van tipped, melyik függvényt fogjuk erre használni? Biztos tudod!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Igen! A `len()` megadja, hogy hány objektum van a listában. Hasnzos, ugye? Most akkor rendezzük sorba a listát:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Ez nem ad vissza semmit, csak megváltoztatta a számok sorrendjét a listában. Írassuk ki a listát, hogy lássuk, mi történt:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Amint látod, a számok a listában most növekvő sorrendben vannak. Gratula!

Esetleg szeretnéd fordított sorrendbe rendezni? Csináljuk meg!

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

Ha például csak az első számot akarod látni, arra használhatod az **indexelést**. Az index egy szám ami megmondja, hányadikként fordul elő egy elem a listában. A programozók szeretik 0-tól kezdeni a számolást, ezért a lista első eleme a 0-dik indexű helyen van, a következő az 1-nél és így tovább. Próbáld ki ezt:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Amint látod, a listában előforduló különböző objektumokat elérhetjük a lista nevének, illetve az objektum indexének megjelölésével, ahol az indexet szögletes zárójelbe írjuk.

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

Működik, mint a varázslat!

Szórakozásból próbálj elérni különböző indexű elemeket: 6, 7, 1000, -1, -6 vagy -1000. Meg tudod-e mondani az eredményt előre? Értelmes-e az eredmény?

Ebben a Python dokumentációban megtalálod a listákra értelmezett összes metódust: https://docs.python.org/3/tutorial/datastructures.html

## Szótárak

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Épp most definiáltál egy üres szótárat. Hurrá!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- A `name` kulcs az `'Ola'` értékre mutat (ami egy `string` típusú objektum),
- `country` a `'Poland'`-ra mutat (szintén `string` típusú),
- és `favorite_numbers` a `[7, 42, 92]` objektumra mutat (ami egy `lista` benne három elemmel).

Lekérdezheted az egyes kulcsokhoz tartozó értékeket a következő szintaxist használva:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Vajon mi történik, ha olyan kulcshoz tartozó értéket kérdezünk le a Pythontól, ami nem létezik? Nézzük meg!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Jéé, egy újabb hiba! Ezúttal **KeyError**. A Python segítőkész, és megmondja, hogy az `'age'` kulcsnál nem található érték a szótárban.

Mikor használjunk szótárakat és mikor listákat? Nos, ez egy érdekes kérdés. Gondolkozz el egy kicsit, és próbáld meg magadtól kitalálni, mielőtt elolvasod az alábbi választ.

- Csak elemek rendezett sorozatára van szükséged? Használj listát.
- Kulcs és érték párokra van szükséged, amiket majd le tudsz kérdezni hatékonyan (kulcs alapján)? Használj szótárat.

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

You can use the `pop()` method to delete an item in the dictionary. Mondjuk ki akarod törölni a `'favorite_numbers'` kulcsnál található elemet. Csak írd be a következőt:

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

### Összefoglaló

Nagyszerű! Most már tudsz egy csomó mindent a programozásról. Ebben az utolsó részben a következőkről tanultál:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Felkészültél a következő részre? :)

## Dolgok összehasonlítása

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

Azon gondolkozol, miért kellett két egyenlőség jelet `==` tenni, amikor azt néztük, hogy két szám egyenlő-e? Az egyetlen `=` jelet arra használjuk, hogy a változóknak értéket adjunk. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Azt is ki tudjuk fejezni, hogy két dolog nem egyenlő. Erre a `!=` szimbólumot használjuk, amint az alábbi példában is.

Adj a Pythonnak két új parancsot:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y azt jelenti: x nagyobb, mint y
- x `<` y azt jelenti: x kisebb, mint y
- x `<=` y azt jelenti: x kisebb vagy egyenlő y-nal
- x `>=` y azt jelenti: x nagyobb vagy egyenlő y-nal

Nagyszerű! Szeretnél még egy példát? Próbáld ki ezt:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Annyi összehasonlítást kombinálhatsz össze, amennyit csak akarsz, és a Python kiszámolja az eredményt. Okos, ugye?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Hallottad már azt a kifejezést hogy "almákat narancsokkal összehasonlítani"? Nézzük meg ennek a python-beli megfelelőjét:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Láthatod, hogy ugyanúgy, mint a kifejezéseknél, a Python nem tudja összehasonlítani a számot (`int`) a stringgel (`str`). Ehelyett **TypeError** típusú hibát dob, azaz megmondja, hogy két különböző típust nem lehet egymással összehasonlítani.

## Boolean (Logikai)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

De a Python, hogy ezt megértsük, meg kell, hogy mindig írni, hogy "Valódi" (első betű nagybetű, a többi betű kisbetűvel). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

A Booleanok is lehetnek változók! Nézd:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Sőt, ezt is írhatod:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Gyakorold egy kicsit és játssz a Booleanokkal, pl próbáld ki a következő parancsokat:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Gratulálunk! A Booleanok a programozás egyik legmenőbb elemei, és te épp megtanultad használni őket!

# Mentsd el!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Egész mostanig a python interpreterbe írkáltuk a parancsokat, ami arra korlátoz minket hogy, egyszerre csak egy sort írjunk. A gyakorlatban a programokat fájlba mentjük, és utána futtatjuk a programnyelv **interpreter**-e vagy **compiler**-e révén. Mi mindeddig a Python **interpreter**-ével futtatuk a programjainkat, soronként. A következő feladatokhoz többsoros programokra is szükségünk lesz, úgyhogy gyorsan:

- Lépjünk ki a Python interpreterből
- Nyissunk meg egy kódszerkesztőt
- Mensünk el benne valami kódot egy python fájlba
- És futtassuk!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Ezzel visszatértünk a parancssorba.

Egy előző részben már kiválasztottuk a kedvenc [kódszerkesztő](../code_editor/README.md)nket. Most nyissuk meg az editort és az új üres fájlba írjuk bele:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Mostanra már tapasztalt Python programozó lettél, úgyhogy írj valami kódot, amit ma tanultál.

Most mentsük el a fájlt, és adjunk neki valami jellemző nevet. Nevezzünk **python_intro.py**-nak, és mentsük el a desktopra. Bárhogy nevezhetjük a fájlt, de a kiterjesztés fontos, hogy **.py** legyen. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Ezt úgy hívják: "syntax highlighting" (szintaxis-kiemelés), és kódoláshoz nagyon hasznos. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Ez az egyik oka annak, hogy kódszerkesztőt használuk. :)

Most hogy a fájl el van mentve, itt az ideje, hogy lefuttassuk. Felhaszálva a tudásodat a parancssoros részből, navigálj a terminálban a desktopra a **könyvtárváltás** parancs segítségével.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Mac-en a parancs valahogy így néz ki:

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

Ha megakadtál volna, kérj nyugodtan segítséget.

Most pedig futtasd le a Python kódot, így:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Rendben! Épp lefuttattad az első Python programodat fájlból. Jó érzés, ugye?

Most akkor továbbmehetünk egy újabb kulcsfontosságú programozási elemre:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Cseréld ki a **python_intro.py** fájlban lévő kódot erre:

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
    

A Python arra számít, hogy további utasításokat kap arra az esetre, ha a `3 > 2` teljesül, vagyis `True` lesz. Vegyük rá a Pythont, hogy kiírja: "It works!" ("Működik!"). Változtasd meg erre a **python_intro.py** fájlban lévő kódot:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Megfigyelted, hogy a következő sort 4 szóközzel indentáltuk? Erre azért van szükség, hogy a Python tudja, melyik kódrészletet kell lefuttatnia, ha a feltétel teljesül. Egy szóközt is használhatnál, de szinte az összes Python programozó 4 szóközt használ, hogy rendezetten nézzen ki a kód. Egy `tab` is 4 szóköznek számít.

Mentsd el, és futtasd le még egyszer:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Mi történik, ha egy feltétel nem teljesül (vagyis nem True)? 

A korábbi példákban a kód csak akkor futott le, ha a feltétel teljesült. De a Pythonnak van `elif` és `else` statementje is:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Ha ezt lefuttatod, a következőt kapod:

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

lefuttatva:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Látod, mi történt itt? Az `elif` arra jó, hogy plusz feltételeket írhass a kódodba, ami akkor fut le, ha a korábbi feltételek nem teljesülnek.

Az első `if` statement után annyi `elif` állítást írhatsz, amennyit csak akarsz. Például:

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

A Python sorban mindegyik feltételt megnézi, és kiírja:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comments

Hozzászólások vonalak kezdve `#`. te is írj, amit akarsz után `#` pedig Piton figyelmen kívül hagyja. Hozzászólások lehet, hogy a kód könnyebb a más emberek számára, hogy megértsék.

Lássuk, hogy néz ki:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Összefoglaló

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Elérkeztünk a fejezet utolsó részéhez!

## A saját függvényeidhez!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A függvény utasítások sorozata, amit a Python lefuttat. Minden Python függvény a `def` kulcsszóval kezdődik, van neve, és lehetnek paraméterei. Let's give it a go. Cseréld ki a **python_intro.py** kódját erre:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Oké, kész is az első függvény!

Talán elgondolkodtál, miért írtuk a függvény nevét a fájl aljára. Erre azért van szükség, mert a Python felülről lefelé olvassa be és futtatja le a fájlt. Tehát ahhoz, hogy használni tudjuk a függvényünket, újra le kell írnunk a fájl alján.

Futtassuk le, és nézzük meg, mi történik:

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

Ahogy láthattad, a függvény most kapott egy paramétert, amit `name`-nek hívunk:

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

Fontos: a `print` függvény 4 szóközzel van indentálva az `if` statementen belül. Erre azért van szükség, hogy ez a függvény a feltétel teljesülése esetén fusson le. Nézzük, hogy működik:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Hoppá, egy hiba. Szerencsére a Python elég hasznos hibaüzeneteket ad nekünk. Azt mondja, a `hi()` függvénynek (vagyis annak, amit az előbb definiáltunk) egy kötelező paramétere van (amit `name`-nek hívnak), és ezt elfelejtettük beadni, amikor meghívtuk a függvényt. Javítsuk ki a fájl alján:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

És futtassuk le újra:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

És ha megváltoztatjuk a nevet?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Futtasd le:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Ez fantasztikus, nem? Így nem kell állandóan ismételned magad, ha meg szeretnéd változtatni az ember nevét, akinek a függvény köszön. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Most hívjuk meg a kódot:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Gratulálunk! Megtanultad, hogy kell függvényeket írni :)

## Ciklusok (loopok)

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Ez már tényleg az utolsó rész. Gyors volt, nem igaz? :)

A programozók nem szeretik ismételni magukat. A programozás arról szól, hogy dolgokat automatizáljunk, így nem kell minden alkalommal kézzel beírni mindenkinek a nevét, akit üdvözölni akarunk. Ilyenkor jönnek jól a ciklusok.

Még emlékszel a listákra? Írjunk egy listát lányokból:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Mindegyiküket üdvözölni szeretnénk. Ehhez már megvan a `hi` függvényünk, tegyük bele egy loopba:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Itt a teljes kód, ami a fájlban lesz:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

És amikor futtatjuk:

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
    

Amint láthattad, minden, amit indentálva a `for` statementbe tettél, megismétlődik a `girls` lista minden elemével.

A `for`-t számokon is használhatod, a `range` függvénnyel:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Ezt kapjuk:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

A `range` függvény létrehoz egy egymás után következő számokból álló listát (ezeket a számokat te adod meg paraméterként).

Figyeld meg, hogy a két szám közül a második már nincs benne a listában, amit a Python visszaad (vagyis a `range(1, 6)` 1-től 5-ig számol, de nem tartalmazza a 6-ot). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Összefoglaló

Meg is vagyunk. **Szuper vagy!** Ez egy nehéz fejezet volt, büszke lehetsz magadra. Mi nagyon büszkék vagyunk rád, amiért idáig eljutottál!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)