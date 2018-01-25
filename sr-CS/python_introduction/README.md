# Uvod u Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Hajde da pišemo nešto koda!

## Python prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Da biste se počeli igrati u Python-u, moramo otvoriti *komandnu liniju* na našem računaru. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Kada budete spremni, ispratiti sledeće instrukcije.

Želimo da otvorimo Python konzolu, tako da ćemo otkucati `python` na Windows-u ili `python3 ` na Mac-u ili Linux-u i pritisnuti `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Vaša prva Python komanda!

Nakon pokretanja Python komange, prompt se menja u `>>>`. To za nas znači da sada možemo koristiti samo komande u Python jeziku. You don't have to type in `>>>` – Python will do that for you.

Ako želite da izađete iz Python konzole, možete u bilo komtrenutku otkucati `exit()` ili korsititi prečicu `Ctrl + Z` za Windows, odnosno `Ctrl + D` za Mac/Linux. Onda nećete više videti `>>>`.

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

Zabavljajte se sa ovim malo i onda se vratite ovde. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Stringovi

Šta je sa vašim imenom? Ukucajte vaše ime između navodnika kao u primeru:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Upravo ste kreirali vaš prvi string! To je niz karaktera koji može biti obrađen od strane računara. String mora uvek počinjati i završavati se sa istim karaketerom. To može biti jedan navodnik (`'`) ili dvostruki (`"`) navodnici (nema razlike!). Navodnici govore Python-u da je ono što je unutar njih string.

Stringovi mogu biti povezani međusobno. Probajte ovo:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Možete i pomnožiti string nekim brojem:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Ako treba da stavite navodnik unutar stringa, to možete uraditi na dva načina.

Koristeći dvostruke navodnike:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

ili eskejpovanjem navodnika korišćenjem ubrnute kose crte (backslash) (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Lepo, zar ne? Da biste videli vaše ime sa svim velikim slovima, dovoljno je da ukucate:

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

Da li se pitate zašto nekada pozivate dunkciju sa `.` na kraju stringa (poput `"Ola".upper()`), a nekada prvo pozovete funkciju i string stavite u zagrade? U nekim slučajevima funkcija pripada objektima, poput `upper()`, i može se primeniti samo na stringovima. U ovom slučaju funkciju zovemo **metoda**. U nekim drugim situacijama funkcije ne pripadaju ničemu konkretnom i mogu se koristiti na raznim tipovima objekata, poput `len()`. Zato smo proslediti `"Ola"` kao parametar funkciji `len`.

### Kratak pregled

OK, dosta o stringovima. Do sada ste naučili o:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Ovo su osnove svakog programskog jezika koga ćete učiti. Spremni za nešto teže? Sigurni smo da jeste!

## Greške

Hajde da probamo nešto novo. Da li možemo dobiti dužinu broja na isti način kao što smo to radili za vaše ime? Otkucajte `len(304023)` i pritisnitet `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Dobili smo našu prvu grešku! Kaže da objekti tipa "int" (integeri, celi brojevi) nemaju dužinu. Šta možemo sada uraditi? Možda da napišemo naš broj kao string? Stringovi imaju dužinu, zar ne?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Radi! Koristili smo funkciju `str` unutar funkcije `len`. `str()` konvertuje sve u stringove.

- Funkcija `str` konvertuje stvari **stringove**
- Funkcija `int` konvertuje stvari u **integere**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Varijable

Jako bitan koncept u programiranju su varijable. Varijabla je ništa više nego naziv za nešto što ćemo moći koristiti kasnije. Programeri koriste varijable da čuvaju podatke, učine svoj kod čitljivijim i kako ne bi morali stalno pamtiti šta je koja stvar.

Hajde da, na primer, želimo kreirati novu varijablu koju ćemo zvati `naziv`:

{% filename %}command-line{% endfilename %}

```python
>>> ime= "Ola"
```

We type name equals Ola.

Kao što ste primetili, vaš program nije ništa vratio, kao što je ranije bio slučaj. Kako onda možemo znati da ta varijabla zaista postoji? Jednostavno unesite `ime` i pritisnite `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> ime
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> naziv= "Sonja"
>>> naziv
'Sonja'
```

Možete ih koristiti i unutar funkcija:

{% filename %}command-line{% endfilename %}

```python
>>> len(naziv)
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

Šta se dešava ako iskoristimo pogrešno ime? Da li možete pogoditi? Hajde da probamo!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Greška! Kao što možete videti, Python ima drugačije tipove grešaka i ova se zove **NameError**. Python će vam dati grešku ako probate koristiti varijablu koja nije još uvek definisana. Ako kasnije naiđete na ovu grešku, proverite vaš kod kako biste proverili da li ste pogrešno napisali neki naziv.

Poigrajte se malo sa ovim i vidite šta je sve moguće raditi!

## Print funkcija

Probajte ovo:

{% filename %}command-line{% endfilename %}

```python
>>> ime= 'Maria'
>>> ime
'Maria'
>>> print(ime)
Maria
```

Kada samo otkucate `ime`, Python interpreter odgovara sa string *reprezentacijom* varijable "ime", a do su slova M-a-r-i-a, okružena jednostrukim navodnicima. Kada napišemo `print(ime)`, Python će "odštampati" sadržaj varijable na ekran, bez navodnika, što je urednije.

Kao što ćete videte kasnije, `print()` se koristi i kada želimo da odštampano nešto unutar funkcija, ili kada želimo da odštampano nešto preko više linija.

## Liste

Pored stringova i integera, Python koristi još mnogo različitih tipova objekata. Sada ćemo da prikažemo **liste**. Liste su upravo ono što mislite da jesu: objekti koji su liste drugih objekata. :)

Hajde da napravimo listu:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Da, ovo je prazna lista. Nije nešto korisnika, zar ne? Hajde da kreiramo listu brojeva za lutriju. Ne želimo da se ponavljamo više puta, pa ćemo je staviti u varijablu:

{% filename %}command-line{% endfilename %}

```python
>>> lutrija= [3, 42, 12, 19, 30, 59]
```

Dobro, sada imamo listu! Šta da radimo sa njom? Hajde da vidimo koliko ima brojeva u listi. Da li imate ideju koja bi se funkcija mogla koristiti za to? To već znate!

{% filename %}command-line{% endfilename %}

```python
>>> len(lutrija)
6
```

Da! `len()` nam može dati broj objekata u listu. Korisno, zar ne? Možda bismo je sada mogli sortirati:

{% filename %}command-line{% endfilename %}

```python
>>> lutrija.sort()
```

Ovo ništa ne vraća, nego samo manje raspored u kom se brojevi pojavljuju u listi. Hajde da opet odštampano ovu listu i vidimo šta će se desiti:

{% filename %}command-line{% endfilename %}

```python
>>> print(lutrija)
[3, 12, 19, 30, 42, 59]
```

Kao što možete videti, brojevi su sortirani od najmanje do najveće vrednosti. Čestitamo!

Možda želimo da obrnemo ovaj raspored? Hajde da uradimo to!

{% filename %}command-line{% endfilename %}

```python
>>> lutrija.reverse()
>>> print(lutrija)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lutrija.append(199)
>>> print(lutrija)
[59, 42, 30, 19, 12, 3, 199]
```

Ako želite da prikažete samo prvi broj, možete to uraditi koristeći **indekse**. Indeks je broj koji pokazuje gde se u listi nalazi neki element. Programeri više vole da počnu brojati od 0, tako da prvi objekat u listi ima indeks 0, sledeći 1 itd. Probajte ovo:

{% filename %}command-line{% endfilename %}

```python
>>> print(lutrija[0])
59
>>> print(lutrija[1])
42
```

Možete videti da možete pristupiti različitim objektima u listi koristeći naziv liste i indeks objekta koga navodite unutar uglastih zagrada.

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

Ovo odlično radi!

Za malo dodatne zabave, isprobajte neke druge indekse: 6, 7, 1000, -1, -6 ili -1000. Da li možete pogoditi rezultat pre nego što isprobate komande. Da li rezultati imaju smisla?

Možete naći listu svih dostupnihh metoda listi u sledećem poglavlju Python dokumentacije: https://docs.python.org/3/tutorial/datastructures.html

## Rečnici

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Ovo pokazuje da smo napravili prazan rečnik. Jej!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> ucesnik= {'ime': 'Ola', 'zemlja': 'Poljska', 'omiljeni_brojevi': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Ključ `ime` pokazuje na vrednost `'Ola'` (što je `string` objekat),
- `zemlja` pokazuje na vrednost `'Poljska'` (još jedan`string`),
- i `omiljeni_brojevi` pokazuje na `[7, 42, 92]` (`listu` sa brojevima unutar nje).

Sintaksa za proveru sadržaja pojedinim ključeva je sledeća:

{% filename %}command-line{% endfilename %}

```python
>>> print(ucesnik['ime'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Šta se dešava ako pitamo Python za vrednost ključa koja ne postoji? Možete li pogoditi. Hajde da isprobamo i vidimo!

{% filename %}command-line{% endfilename %}

```python
>>> ucesnik['godine']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'godine'
```

Pogledajte, još jedna greška! Ovo je**KeyError**. Python je uslužan i govori nam da ključ `'godine'` ne postoji za dati rečnik.

Kada treba koristiti rečnik, a kada listu? Pa, to jeste dobro pitanje o kome treba razmišljati. Samo smislite neki odgovor pre nego što pogledate sledeću liniju.

- Da li vam treba uređena sekvrenca elemenata? Koristite listu.
- Da li vam je potrebno da pridružite vrednosti ključevima, tako da ih kasnije možete efikasno (po ključu) tražiti? Koristite rečnik.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> ucesnik['omiljeni_jezik'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(ucesnik)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Recimo, ako želite da obrišete element koji odgovara ključu `'omiljeni_brojevi'`, samo otkucajte sledeću komandu:

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
>>> ucesnik['zemlja'] = 'Nemacka'
>>> ucesnik
{'zemlja': 'Nemacka', 'omiljeni_jezik': 'Python', 'ime': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Kratak pregled

Strava! Sada znate puno o programiranju. U ovom delu ste naučili o:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Uzbuđeni zbog sledećeg dela? :)

## Poređenje stvari

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

Da li se pitate zašto smo stavili dva znaka jednakosti `==` jedan pored drugog kako bismo ispitali da li su dva broja jednaka? Jedan znak `=` koristimo da varijablama dodelimo vrednost. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Takođe možemo reći i da su dve stvari međusobno različite. Za to koristimo simbol `!=`, kao što je prikazano u primeru gore.

Dajmo Python-u još dva zadatka:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y znači: x je veće od y
- x `<` y znači: x je manje od y
- x `<=` y znači: x je manje ili jednako y
- x `>=` y znači: x je veće ili jednako y

Strava! Hoćete još jedan? Probajte ovo:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Možete dati Python-u kolliko god želite brojeva da poredi i uvek će vam dati odgovor? Prilično pametno, zar ne?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Da li ste nekada čuli za izraz "porediti jabuke i kruške"? Hajde da isprobamo ekvivalent tome u Python-u:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Ovde možete videti da baš kao u izreci, Python ne može porediti broj (`int`) i string (`str`). Umesto toga, pokazuje **TypeError** i kaže nam da se dva tipa ne mogu porediti međusobno.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleani takođe mogu biti varijable! Pogledajte:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Možete uraditi i sledeće:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Provežbajte i zabavite se malo sa Booleanima pokuševajući izvršiti sledeće komande:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Čestitamo! Booleani su jedna od najinteresantnijih mogućnosti u programiranju i upravo ste naučili kako da ih koristite!

# Sačuvajte!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Do sada smo sav kod pisali u interpreteru, što nas ograničava na unos samo jedne linije u jednom trenutku. Obični programi se čuvaju u fajlovima i izvržavaju od strane **interpretera** programskog jezika ili **kompajlera**. Do sada smo naše programe izvršavali kao jednu liniju u jedinici vremena u Python **interpreteru**. Za naredne zadatake će nam trebati više od jedne linije koda, tako da bi na brzinu trebalo da:

- Zatvorite Python interpreter
- Otvorite editor koda po vašem izboru
- Snimite neki kod u novi python fajl
- Pokrenite ga!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Ovo će vas vratiti na komand prompt.

Ranije smo odabrali editor koda iz [editori koda](../code_editor/README.md) sekcije. Sada treba da otvorimo tah editor i unesemo neki kod u novi fajl:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Očigledno, sada ste već iskusni Python developer, pa slobodno napišite nešto koda od onoga što ste naučili danas.

Sada treba da sačuvamo fajl i damo mu neko opisno ime. Hajde da fajl nazovemo **python_intro.py** i snimimo ga na desktop. Fajl možemo nazvati kako god želimo, ali je bitno da osiguramo da se fajl završava na **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Ovo se naziva "naglašavanje sintakse" i jako je korisno za kodiranje. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Ovo je jeda od razloga zašto koristimo editore koda. :)

Nakon što je fajl sačuvan, vreme je da ga pokrenemo! Koristeći veštine koje ste naučili u delu koji se bavi komandnom linijom, pokrenite terminal i **promenite direktorijum** na desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Mac-u komanda izgleda poput:

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

Ako zapnete, pitajte za pomoć.

Sada upotrebite Python da pokrenete kod u fajlu:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Odlično! Upravo ste pokrenuli svoj prvi Python program koji je sačuvan u fajlu. Jeste li oduševljeni?

Sada možete da pređete na jedan od osnovnih alata u programiranju:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Zamenite kod u vašem **python_intro.py** fajlu sa:

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
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### What if a condition isn't True?

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

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

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

### Kratak pregled

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Your own functions!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

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

As you can see, we now gave our function a parameter that we called `name`:

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

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Congratulations! You just learned how to write functions! :)

## Loops

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

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

## Kratak pregled

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)