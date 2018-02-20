# Uvod v Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Končno lahko začnemo s programiranjem!

## Pythonova ukazna vrstica

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Za začetek odpri *ukazno vrstico*. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Ko imaš odprto, sledi nadaljnim navodilom.

Odpreti želimo Pythonovo ukazno vrstico, zato v ukazno vrstico vpiši `python` v Windowsih oziroma `python3` na Mac OS/Linux in pritisni `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Prvi ukaz v programske jeziku Python!

Ko si uspešno zagnala pythonovo ukazno vrstico, se je začetek vrstice spremenil v `>>>`. To pomeni, da lahko začneš z vpisovanjem Pythonovih ukazov. You don't have to type in `>>>` – Python will do that for you.

Če želiš Pythonovo ukazno vrstico zapreti, vanjo vpiši `exit()`, ali pa pritisni `Ctrl + Z` na Windowsih oziroma `Ctrl + D` na Mac OS/Linux. Opazila boš, da se vrstica ne bo več začenjala z `>>>`.

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

Malo se še poigraj z računanjem, nato pa nadaljuj z branjem. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Nizi

Pythonu gredo dobro tudi imena. Vpiši svoje ime znotraj narekovajev:

{% filename %}command-line{% endfilename %}

```python
>>> "Ana"
'Ana'
```

Pravkar si naredila svoj prvi niz! To je zaporedje znakov, ki ga računalnik zna prebrati. Nizi se morajo vedno začeti in končati z enojnim `'` ali dvojnim `"` narekovajem (med njima ni razlike!). Narekovaji Pythonu povedo, da je tisto, kar je znotraj njih, niz.

Nize lahko združuješ. Takole:

{% filename %}command-line{% endfilename %}

```python
>>> "Pozdravljena " + "Ana"
'Pozdravljena Ana'
```

Lahko jih množiš s številko:

{% filename %}command-line{% endfilename %}

```python
>>> "Ana" * 3
'AnaAnaAna'
```

Če želiš, da je narekovaj del niza, lahko to narediš na dva načina.

Z uporabo dvojnih narekovajev:

{% filename %}command-line{% endfilename %}

```python
>>> "Spust'li smo eno črko."
"Spust'li smo eno črko."
```

ali pa z uporabo enojnih narekovajev in leve poševnice (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Spust\'li smo eno črko.'
'Spust'li smo eno črko.'
```

Super! Kako pa bi črke imena spremenila v velike tiskane?

{% filename %}command-line{% endfilename %}

```python
>>> "Ana".upper()
'ANA'
```

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ana")
3
```

Kot si opazila, smo funkcijo enkrat uporabili na koncu niza in prednjo postavili piko (`"Ana".upper()`), drugič pa smo niz dali kar v funkcijo (len("Ana")). Gre za to, da je, v nekaterih primerih, funkcija del objekta. `upper()` je recimo del objekta nizi. V takem primeri funkciji rečemo **meotda**. Po drugi strani pa je funkcija lahko povsem neodvisna in jo lahko uporabimo za katerikoli objekt. Tak primer je `len()`. Zato smo niz `"Ana"` prej lahko vstavili kar v funkcijo `len`.

### Povzetek

OK, zaenkrat vemo dovolj o nizih. Poglejmo, česa vsega smo se že naučili:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

To so osnove vsakega programskega jezika. Si pripravljena na kaj težjega? Seveda si!

## Napake

Misliš da bi se dalo, z ustrezno funkcijo, dobiti dolžino številke? Vpiši `len(304023)` in pritisni `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Python nam javi napako! Reče, da objekt "int" (integer, celo število) nima dolžine. Kaj pa zdaj? Kateri objekti, ki jih poznamo, pa imajo dolžino? Nizi. Seveda! Poskusimo pretvoriti število v niz.

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Zmaga! S pomočjo funkcije `str()`, smo pretvorili objekt število v objekt niz in nato s pomočjo `len()` izračunali dolžino niza. Funkcija `str()` pretvori v niz katerikoli objekt.

- Funkcija `str` pretvori poljuben objekt v objekt niz.
- Funkcija `int` pretvori poljuben objekt v objekt število (**integer** oziroma int)

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Spremenljivke

Pomemben del vsakega programskega jezika so spremenljivke. Spremenljivka ni nič drugega kot ime, ki ga daš neki vrednosti (številki, nizu,...) in ga kasneje uporabiš za priklic te vrednosti. Programerji spremenljivke uporabljamo za shranjevanje podatkov in boljšo preglednost kode.

Naredimo spremenljivko z imenom `ime`:

{% filename %}command-line{% endfilename %}

```python
>>> ime = "Ana"
```

We type name equals Ola.

Kot si opazila, program ničesar izpisal. Kako torej vemo, kakšno vrednost ima spremenljivka? Še enkrat napiši ime spremenljivke in pritisni `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> ime
'Ana'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> ime = "Anja"
>>> ime
'Anja'
```

Spremenljivke lahko podtikaš tudi funkcijam:

{% filename %}command-line{% endfilename %}

```python
>>> len(ime)
4
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Kaj pa se zgodi, če spremenljivko pokličemo z napačnim imenom? Poskusimo!

{% filename %}command-line{% endfilename %}

```python
>>> mesto = "Ljubljana"
>>> mseto
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'mseto' is not defined
```

Python javi napako! Kot vidiš, ima Python različne vrste napak. Tej, ki nam jo javilo, se reče **NameError**. Python ti bo to napako javil, če boš poklicala spremenljivko, ki ne obstaja. Če boš kdaj naletela na to napako, torej vedno preverila, če si se zatipkala ali zmotila.

Poskusi ustvariti še kakšno drugo spremenljivko, da se z njimi še bolje spoznaš!

## Funkcija print

Napiši tole:

{% filename %}command-line{% endfilename %}

```python
>>> ime = 'Micka'
>>> ime
'Micka'
>>> print(ime)
Micka
```

Ko napišeš `ime`, se bo Pythonov tolmač odzval z *vrednostjo* spremenljivke 'ime', ki je v tem primeru niz , sestavljen iz črk M-i-c-k-a. Ko pa napišeš print(ime), bo Python "sprintal" vsebino spremenljivke na ekran, brez narekovajev.

Kasneje bomo videli, da je funkcija `print()` uporabna tudi, ko želimo izpisate vrednosti znotraj funkcije ali ko želimo izpisate vrednosti v večih vrsticah.

## Seznami

Polek nizov in števil Python pozna še mnoge druge objekte. Seznanili se bomo z objektom, ki mu rečemo **seznam**. Že ime nam namigne, kaj seznam je: objekt, ki je seznam objektov. :)

Definirajmo torej naš prvi seznamček:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Prazen je. To ni ravno navdušujoče. Naredi raje seznam loterijskih številk. Pisanje si zmanjšaj tako, da ga shraniš v spremenljivko:

{% filename %}command-line{% endfilename %}

```python
>>> loterija = [3, 42, 12, 19, 30, 59]
```

Tako, naredila si svoj prvi omembe vreden seznam. Kaj pa zdaj? Za začetek preveri, koliko je dolg. Kako se že to naredi? :)

{% filename %}command-line{% endfilename %}

```python
>>> len(loterija)
6
```

Tako je! `len()` zna ugotoviti tudi dolžino seznama. To se izkaže za zelo uporabno. Razporedimo sedaj števila v seznamu po vrsti:

{% filename %}command-line{% endfilename %}

```python
>>> loterija.sort()
```

Ta metoda ne vrne ničesar. Spremeni pa vrsti red števil v seznamu. Izpiši seznam, da se prepričaš, če je Python naredil prav.

{% filename %}command-line{% endfilename %}

```python
>>> print(loterija)
[3, 12, 19, 30, 42, 59]
```

Kot vidiš so števila res razporejena od najmanjšega proti največjemu. Čestitke!

Kaj pa, če bi želeli vrstni red obrniti? Poskusimo!

{% filename %}command-line{% endfilename %}

```python
>>> loterija.reverse()
>>> print(loterija)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> loterija.append(199)
>>> print(loterija)
[59, 42, 30, 19, 12, 3, 199]
```

Če želiš dobiti iz seznama nek določen element, lahko to narediš s pomočjo **indeksov**. Indeks pove, na katerem mestu v seznamu se nek element nahaja. Pri je malce neobičajno le to, da se štetje mest začne z indeksom 0 in ne 1 kot si verjetno pričakovala. Napiši tole:

{% filename %}command-line{% endfilename %}

```python
>>> print(loterija[0])
59
>>> print(loterija[1])
42
```

Do poljubnega elementa torej dostopamo z imenom seznama in želenim indeksom znotraj oglatih oklepajev.

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

Deluje! :)

Za zabavo lahko preizkusiš še indekse: 6, 7, 1000, -1, -6 ali -1000. Poskusi predvideti rezultat, še preden ti ga pove Python. So rezultati smiselni?

Vse metode, ki jih Python ima za sezname, si lahko ogledaš v Pythonovi dokumentaciji: https://docs.python.org/3/tutorial/datastructures.html

## Slovarji

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Uspešno si naredila prazen slovar! :)

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> udeleženec = {'ime': 'Ana', 'država': 'Slovenija', 'najljubša_števila': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Ključ `ime` ima vrednost `'Ana'` (`niz`),
- `država` ima vrednost `'Slovenija'` (ponovno `niz`),
- ključ `najljubša_števila` pa vrednost `[7, 42, 92]` (`seznam` s tremi elementi).

Vrednost ključev lahko ugotoviš tudi na sledeč način:

{% filename %}command-line{% endfilename %}

```python
>>> print(udeleženec['ime'])
Ana
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Kaj pa se zgodi, če od Pythona želimo vrednost ključa, ki ga ni? Kaj misliš? Poskusi!

{% filename %}command-line{% endfilename %}

```python
>>> udeleženec['ime']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Pridelali smo napako! Tej se reče **KeyError**. Python je prijazen in nam pove tudi, da je do take napake prišlo pri ključu `'ime'`.

Kdaj uporabiti slovar in kdaj seznam? To je dobro vprašanje. :) Razmisli o tem sama, nato pa poglej spodaj napisane odgovore.

- So tvoji podatki urejeni (po abecedi, velikosti ipd.). Izberi seznam.
- Imajo tvoji podatki edinstveno lastnost (ključ), po kateri jih lahko razlikuješ med seboj? Uporabi slovar.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> udeleženec['najljubši_jezik'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(udeleženec)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Če želiš recimo izbrisati ključ `'najljubša_števila'`, napiši sledeče:

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
>>> udeleženec['država'] = 'Avstrija'
>>> udeleženec
{'država': 'Avstrija', 'najljubši_jezik': 'Python', 'ime': 'Ana'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Povzetek

Odlično ti gre! Zdaj veš že zelo veliko o programiranju. Povzemimo zadnja dognanja:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Odlično! Gremo hitro naprej. :)

## Primerjanje

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

Te zanima, zakaj smo uporabili dvojni enačaj `==`, ko smo ugotavljali, če sta dve števili enaki? Razlog je preprost. Enojni enačaj `=` uporabljamo že za definiranje spremenljivk. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Podobno lahko za ugotavljanje, če dve stvari nista enaki, uporabimo znak `!=`.

Poskusi še tole:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y pomeni: x je večje od y
- x `<` y pomeni: x je manjše od y
- x `<=` y pomeni: x je manjše ali enako y
- x `>=` y means: x je večje ali enako y

Odlično! Naredi še par primerov. Recimo:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Python zna torej primerjati poljubno mnogo števil. Kako pa mu to uspe?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Si že slišala za izraz "primerjanje jabolk in pomaranč"? Si? Python tudi! Zanj takšno primerjanje enako sledečemu:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Podobno napako smo že videli v prvi polovici tega poglavja. Python ne zna primerjati števil (int) in nizov (string), zato javi **TypeError** in nam pove, da teh dveh tipov med seboj ne moremo primerjati.

## Logika

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Boolean lahko uporabimo tudi pri spremenljivkah! Takole:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Lahko pa tudi tako:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Z objektom Boolean se lahko še bolje spoznaš tako da preizkusiš sledeče ukaze:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Čestitke! Pravkar si spoznala enega izmed najbolj uporabnih pripomočkov pri programiranju - Boolean!

# Shranjevanje!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Dosedaj smo programsko kodo pisali kar direktno v tolmač, kar pa nas je precej omejevalo, saj smo lahko vnašali le eno vrstico kode naenkrat. Običajno programe najprej shranimo v datoteko, nato pa jih izvedeta **tolmač** ali **prevajalnik** programskega jezika, ki ga uporabljamo (v našem primeru je to Python). Zaenkrat smo programe izvajali s pomočjo Pythonovega **tolmača**, po eno vrstico naenkrat. V nadaljevanju bomo potrebovali več kot le eno vrstico kode, zato naredi naslednje:

- Zapri tolmač
- Odpri poljuben urejevalnik programske kode
- Ustvari novo python datoteko in vanjo napiši nekaj kode
- Zaženi!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Zdaj si ponovno v običajni ukazni vrstici.

Odpri urejevalnik, ki si ga izbrala v poglavju [urejevalniki programske kode](../code_editor/README.md). Ustvari novo datoteko in vanjo prepiši sledečo kodo:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Z urejevalnikom se lahko malce spoznaš, tako da vanj prepišeš nekaj kode od prej.

Datoteko bomo zdaj shranili in ji dali pametno ime. Poimenuj jo recimo **python_intro.py**in jo shrani na namizje. Datoteko lahko seveda poimenuješ povsem poljubno, važno je le, da se ime konča z **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Tako obarvanje nam lahko zelo pomaga. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Barve so vsekakor eden izmed razlogov, zakaj uporabljamo urejevalnike. :)

Zdaj lahko datoteko zaženeš! Za začetek uporabi svoje znanje ukazne vrstice in **spremeni imenik** v namizje.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Mac-u, ukaz zgleda približno takole:

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

Če se ti kje zatakne, povprašaj za pomoč mentorja.

S pomočjo Python-a našo datoteko izvršimo takole:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Odlično! Pravkar si zagnala svoj prvi program.

Zdaj se lahko spoznamo z enim izmed bistvenih programerskih orodij:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Kodo, ki je v datoteki **python_intro.py** zamenjaj s tole:

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
    

Težava je v tem, da nismo povedali, kaj naj se zgodi, če je pogoj `3 > 2` resničen (enak `True`). Naredimo zdaj program, ki bo izpisal "It works!". Spremeni kodo v datoteki **python_intro.py**:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Si opazila, da smo vrstico po if stavku zamaknili? To moraš narediti vedno, zato da Python ve, kaj pognati, če je pogoj resničen. Narediš lahko le en presledek, vendar je koda bolj pregledna, če jih narediš več. S tipko `tab` recimo narediš 4 presledke.

Datoteko shrani in ponovno poženi:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Kaj pa, če pogoj ni resničen?

Dosedaj smo se pogovarjali le o kodi, ki se izvede, če pogoj velja. Če pa pogoj ni resničen ali drugačen, si lahko pomagamo s stavkoma `elif` in `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Zgornji program bo izpisal:

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

program izpiše:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

`elif` torej doda še dodaten pogoj, ki se preveri, če je prejšnji pogoj neresničen.

Po začetnem `if` stavku, lahko dodaš lahko poljubno število `elif` stavkov. Recimo:

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

Python začne po vrsti preverjati pogoje, se ustavi, ko pride do resničnega in izvede ustrezno kodo, ki temu pogoju sledi:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

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

### Povzetek

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Čas je za zadnje podpoglavje!

## Funkcije

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Funkcija je zaporedje ukazov, ki jih Python izvede, ko mu podamo ime funkcije. Vsaka funkcija se začne z besedo `def`, ima svoje ime in določene argumente. Let's give it a go. Kodo v datoteki **python_intro.py** zamenjaj s sledečo:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Super, naredila si svojo prvo funkcijo!

Verjetno se sprašuješ, zakaj smo na koncu datoteke napisali ime funkcije. To smo naredili zato, ker Python prebere celo datoteko in nato izvede vso kodo. S stavkom def torej funkcijo le definiramo, s klicem hi(), pa zahtevamo, da naj jo Python izvede.

Poženi zdaj ta programček in si oglej rezultat:

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

Kot vidiš, smo funkciji dodali argument `name`:

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

Ne pozabi: Funkcija `print`, ki sledi `if` stavku v zgornji kodi, je zamaknjena. S tem Pythonu povemo, da je ta koda znotraj if stavka in se izvede le, ko je izpolnjen nek pogoj. Zaženi zdaj program:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Dobimo napako. Na srečo nam Python dokaj natančno pove, v čem je težava. Pove nam, da naša funkcija `hi()` potrebuje argument, mi pa smo ga pozabili dodati, ko smo funkcijo klicali. Popravimo to napako:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Program ponovno poženi:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

Kaj pa, če za argument damo kakšno drugo ime?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Poženi:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Funkcije so zelo uporabna stvar, saj nam lahko, če jih pravilno uporabimo, precej zmanjšajo količino kode. Če ne bi uporabili funkcije, bi v našem primeru morali vsakič, ko dobimo ime osebe, sami vedno znova napisati tisti print stavek. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Poženi program:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Čestitke! Pisanje funkcij zdaj obvladaš! :)

## Zanke

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Prišli smo do zadnjega dela tega poglavja.

Kot smo že omenili, programerji ne maramo večkrat pisati podobne kode. Konec koncev je smisel programiranja ravno to, da računalnik naredi čimveč sam. Pri pisanju krajše kode, nam pomagajo zanke.

Se še spomniš seznamov? Naredimo seznam deklet:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Vsako izmed njih želimo pozdraviti po imenu. Uporabili bomo zanko, znotraj nje pa že napisano funkcijo `hi`:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Tole je celotna koda:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Ko program zaženemo, dobimo nekaj takega:

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
    

Koda, ki je znotraj `for` zanke, se torej res ponovi za vsak element seznama `girls`.

`for` zanko pa lahko narediš tudi s pomočjo funkcije `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Rezultat:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` je funkcija, ki ustvari seznam zaporednih števil (do posamičnega števila lahko dostopamo preko spremenljivke i).

Iz zgornjega primera se vidi tudi, da druga številka, ki jo podamo funkciji range, ni vključena v seznam števil. `range(1, 6)` torej naredi seznam števil od (vključno) 1 do (vključno) 5. That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Povzetek

To je to. **Obvladaš!** Lahko si ponosna nase, saj je bilo to poglavje kar zahtevno. Veseli smo, predelala že tako velik del tega vodiča!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)