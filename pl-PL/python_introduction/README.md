{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Wprowadzenie do Pythona

> Fragmenty tego rozdziału oparte są na tutorialu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Napiszmy jakiś kod!

## Wiersz poleceń Pythona

> Dla czytelniczek w domu: tą część uwzględnia wideo [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Aby rozpocząć zabawę z Pythonem, musisz otworzyć jego *wiersz poleceń* na swoim komputerze. Powinnaś już wiedzieć, jak to zrobić - nauczyłyśmy się tego w rozdziale [Wprowadzenie do interfejsu wiersza poleceń](../intro_to_command_line/README.md).

Gdy już będziesz gotowa, postępuj według instrukcji poniżej.

Chcemy otworzyć konsolę Pythona. Wpisz `python`, jeśli pracujesz na Windowsie, lub `python3`, jeśli pracujesz na MacOS/Linuxie i wciśnij `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Twoje pierwsze polecenie w Pythonie!

Po uruchomieniu Pythona wiersz poleceń wygląda tak: `>>>`. Jest to sygnał dla nas, że od tego momentu możemy używać wyłącznie instrukcji języka Python. Nie musisz wpisywać `>>>` - Python zrobi to za Ciebie.

Jeśli w którymkolwiek momencie zechcesz wyjść z konsoli Pythona, po prostu wpisz polecenie `exit()` albo użyj kombinacji klawiszy `Ctrl + Z` w Windows lub `Ctrl + D` w Macu/Linuksie. Wtedy już nie będziesz więcej widzieć `>>>`.

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

By wykonać potęgowanie, powiedzmy podnieść 2 do potęgi 3, musimy wpisać: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Pobaw się tym przez chwilę, a potem wróć tutaj. :)

Ja widzisz, Python jest świetnym kalkulatorem. Jeżeli zastanawiasz się, co możesz z ni jeszcze zrobić…

## Stringi

A jakby tak wpisać swoje własne imię? Wpisz swoje imię używając cudzysłowów, w ten sposób:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Właśnie stworzyłaś swój pierwszy string! Jest to ciąg znaków, który może być przetwarzany przez komputer. String musi zawsze zaczynać się i kończyć tym samym znakiem. Może to być apostrof (`'`) lub cudzysłów (`"`) - nie ma różnicy! Sygnalizują one Pythonowi, że wszystko, co znajduje się pomiędzy nimi, jest stringiem.

Stringi mogą być łączone. Spróbuj tak:

{% filename %}command-line{% endfilename %}

```python
>>> "Czesc " + "Ola"
'Czesc Ola'
```

Da się również mnożyć stringi za pomocą liczb:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Jeśli chciałabyś użyć apostrofu wewnątrz stringu, możesz to zrobić na dwa sposoby.

Za pomocą cudzysłowu:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

lub poprzedzając apostrof odwróconym ukośnikiem (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Fajnie, co? Możesz także wyświetlić swoje imię wielkimi literami. Wpisz po prostu:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Właśnie użyłaś **metody** `upper` na swoim stringu! Metoda (jak `upper()`) to sekwencja instrukcji, które Python wykonuje na podanym obiekcie (`"Ola"`) jak tylko ją wywołasz.

Jeżeli chcesz poznać liczbę liter, którą zawiera twoje imię, istnieje **funkcja** również do tego!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Zastanawiasz się, dlaczego czasami wywołujemy funkcję z `.` na końcu stringu (jak tutaj: `"Ola".upper()`), a czasami najpierw wywołujemy funkcję, a dopiero potem umieszczamy string w nawiasach? Ano, w niektórych przypadkach funkcje są związane z obiektami. Tak jak `upper()`, która może być użyta wyłącznie na stringach. Taką funkcję nazywamy wówczas **metodą**. Są również funkcje, które nie są powiązane z niczym konkretnym i mogą być używane na różnych typach obiektów, jak na przykład `len()`. Dlatego przekazujemy `"Ola"` jako parametr dla funkcji `len`.

### Podsumowanie

OK, wystarczy już stringów. Jak dotąd nauczyłaś się o:

- **wiersza poleceń** - wpisywanie komend (kodu) w wiersz poleceń Pythona powoduje, że Python zwraca wyniki
- **liczby i stringi** - w Pythonie liczb używamy do działań matematycznych, a stringów do obiektów tekstowych
- **operatory** - takie jak `+` i `*`, łączą wartości produkując nowe
- ** funkcje** - takie jak `upper()` i `len()`, wykonują działania na obiektach.

Są to podstawy każdego języka programowania, jakiego przyjdzie Ci się uczyć. Gotowa na coś trudniejszego? Mamy nadzieję, że tak!

## Błędy

Spróbujmy czegoś nowego. Czy możemy sprawdzić długość liczby w taki sam sposób jak długość naszego imienia? Wpisz `len(304023)` i wciśnij `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Dostałyśmy nasz pierwszy błąd! Ikona {{ warning_icon }} to sposób, w jaki będziemy Ciebie informować, że kod, który zaraz wykonasz nie powinien zadziałać poprawnie. Popełnianie błędów (nawet intencjonalnie) to ważna część nauki!

Komunikat mówi nam, że obiekty typu "int" (liczby całkowite, ang. integer) nie mają długości. Zatem co możemy zrobić? Może mogłybyśmy przekazać naszą liczbę jako string? Stringi mają ustaloną długość, zgadza się?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Działa! Użyłyśmy funkcji `str` wewnątrz funkcji `len`. Funkcja `str()` konwertuje wszystko do postaci stringów.

- Funkcja `str` przekształca wartości na **stringi**
- Funkcja `int` przekształca wartości na **liczby**

> Ważne: możemy zamienić liczby na tekst, ale nie zawsze możemy zamienić tekst na liczby - czym w ogóle powinien być wynik działania `int('hello')`?

## Zmienne

Ważnym zagadnieniem w programowaniu są zmienne. Zmienna to nic innego jak nazwa nadana jakiejś wartości, którą potem możemy się posługiwać. Programiści używają zmiennych do przechowywania danych, dzięki czemu ich kod jest bardziej czytelny i nie muszą każdorazowo zastanawiać się, co jest czym.

Przypuśćmy, że chcemy stworzyć nową zmienną zwaną `imie`:

{% filename %}command-line{% endfilename %}

```python
>>> imie = "Ola"
```

Napisałyśmy własnie, że imie równa się Ola.

Jak już zauważyłaś, Twój program nie wyświetlił niczego tak, jak to robił wcześniej. Zatem skąd wiemy, że zmienna faktycznie istnieje? Po prostu wpisz `imie` i wciśnij `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> imie
'Ola'
```

Jupi! Twoja pierwsza zmienna! :) Zawsze możesz zmienić, do czego się ona odnosi:

{% filename %}command-line{% endfilename %}

```python
>>> imie = "Sonja"
>>> imie
'Sonja'
```

Możesz także używać jej w funkcjach:

{% filename %}command-line{% endfilename %}

```python
>>> len(imie)
5
```

Super, co? Oczywiście zmienne mogą być czymkolwiek - liczbami również! Spróbuj:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ale co by było, gdybyśmy użyły złej nazwy? Masz pomysł, co mogłoby się stać? Sprawdźmy!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> miasto = "Tokyo"
>>> masto
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'masto' is not defined
```

Błąd! Jak widzisz, Python ma różne rodzaje błędów, a ten nosi nazwę **NameError**. Python zwróci Ci taki błąd, gdy będziesz próbowała używać nazwy, która nie została jeszcze utworzona. Gdybyś w przyszłości natrafiła na niego, sprawdź w swoim kodzie czy nie popełniłaś literówek w nazwach zmiennych.

Poświęć chwilę czasu na zabawę i przekonaj się co możesz z tym zrobić!

## Funkcja print

Spróbuj tego:

{% filename %}command-line{% endfilename %}

```python
>>> imie = 'Maria'
>>> imie
'Maria'
>>> print(imie)
Maria
```

Kiedy wpisujesz po prostu `imie`, interpreter Pythona zwraca *odwzorowanie* stringu będącego wartością zmiennej 'imie', czyli litery M-a-r-i-a zamknięte w pojedynczym cudzysłowie ''. Natomiast gdy napiszesz `print(imie)`, Python wypisze zawartość zmiennej na ekran, bez żadnego cudzysłowu, co wygląda lepiej.

Jak się później przekonamy, `print()` jest szczególnie użyteczny, gdy chcemy wypisać coś z wnętrza funkcji, lub gdy zechcemy wypisać wartości w kilku wierszach.

## Listy

Oprócz stringów i liczb całkowitych, Python dysponuje bogactwem różnych typów obiektów. Teraz zapoznamy się z typem zwanym **listą**. Listy są dokładnie tym, co myślisz: obiektami, które są listami innych obiektów. :)

Śmiało, stwórzmy listę:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Tak, lista jest pusta. Niespecjalnie przydatne, co? Stwórzmy listę numerów totolotka. Nie chcemy się powtarzać za każdym razem, więc tutaj również posłużymy się zmienną:

{% filename %}command-line{% endfilename %}

```python
>>> wyniki = [3, 42, 12, 19, 30, 59]
```

Dobrze, mamy listę! Co możemy z nią zrobić? Zobaczmy ile liczb znajduje się w tej liście. Masz pomysł, jakiej funkcji powinnaś użyć? Już z niej korzystałaś!

{% filename %}command-line{% endfilename %}

```python
>>> len(wyniki)
6
```

Tak! `len()` może zwrócić Ci liczbę obiektów zawartych w liście. Prawda że przydatne? To może teraz posortujmy listę:

{% filename %}command-line{% endfilename %}

```python
>>> wyniki.sort()
```

Polecenie to niczego nie zwraca, po prostu zmieniło kolejność liczb zawartych w liście. Wypiszmy jej zawartość jeszcze raz i zobaczmy co się stało:

{% filename %}command-line{% endfilename %}

```python
>>> print(wyniki)
[3, 12, 19, 30, 42, 59]
```

Jak widzisz, liczby na liście są teraz uporządkowane według wartości od najniższej do najwyższej. Gratulacje!

A gdybyśmy zapragnęły odwrócić kolejność? Zróbmy to!

{% filename %}command-line{% endfilename %}

```python
>>> wyniki.reverse()
>>> print(wyniki)
[59, 42, 30, 19, 12, 3]
```

Jeżeli chcesz dodać coś do swojej listy, możesz to zrobić wpisując polecenie:

{% filename %}command-line{% endfilename %}

```python
>>> wyniki.append(199)
>>> print(wyniki)
[59, 42, 30, 19, 12, 3, 199]
```

Jeśli chcesz wyświetlić tylko pierwszą liczbę, możesz to uczynić używając **indeksów**. Indeks jest numerem mówiącym nam, w którym miejscu listy znajduje się dany element. Programiści zaczynają liczenie od zera, zatem pierwszy element Twojej listy znajduje się w miejscu oznaczonym indeksem 0, następny z indeksem 1, i tak dalej. Spróbuj tego:

{% filename %}command-line{% endfilename %}

```python
>>> print(wyniki[0])
59
>>> print(wyniki[1])
42
```

Jak widzisz, możesz uzyskać dostęp do każdego z elementów Twojej listy za pomocą jej nazwy oraz numeru indeksu wewnątrz nawiasów kwadratowych.

By skasować coś z twojej listy, musisz użyć **indeksów**, których nauczyłyśmy się powyżej i metody `pop()`. Spróbujmy zobaczyć jak to działa na przykładzie i powtórzmy sobie to, czego się nauczyłyśmy wyżej. Usuńmy pierwszy element z naszej listy.

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

That worked like a charm!

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Słowniki

> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Installing Python Code Editor](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka = {'imie' : 'Ola', 'kraj' : 'Polska', 'ulubione_liczby' : [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Klucz `imie` wskazuje na wartość `'Ola'` (obiekt typu `string`),
- `kraj` wskazuje na wartość `'Polska'` (kolejny `string`),
- zaś `ulubione_liczby` odnoszą się do `[7, 42, 92]` (obiekt typu `list` zawierający trzy liczby).

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(uczestniczka['imie'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> uczestniczka['wiek']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'wiek'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Just have a solution in mind before looking at the answer in the next line.

- Potrzebujesz ułożyć elementy w określonej kolejności? Wybierz listę.
- Potrzebujesz powiązać wartości z kluczami, żeby mieć później łatwiejszy dostęp do nich (używając klucza)? Użyj słownika.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka['ulubiony_jezyk'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(uczestniczka)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, just type in the following command:

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
>>> uczestniczka['kraj'] = 'Niemcy'
>>> uczestniczka
{'kraj': 'Niemcy', 'ulubiony_jezyk': 'Python', 'imie': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### Podsumowanie

Awesome! You know a lot about programming now. In this last part you learned about:

- **błędach** - umiesz już czytać ze zrozumieniem błędy pojawiające się, gdy Python nie rozumie polecenia, które mu wydałaś
- **zmiennych** - nazwach dla obiektów, dzięki którym programuje się łatwiej, a Twój kod jest czytelniejszy
- **listach** - listach obiektów uporządkowanych w określonej kolejności
- **słownikach** - zbiorach obiektów przechowywanych w postaci par klucz-wartość

Excited for the next part? :)

## Porównywanie rzeczy

> Dla czytelniczek w domu: tą część uwzględnia wideo [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

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

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y oznacza: x jest większe od y
- x `<` y oznacza: x jest mniejsze od y
- x `<=` y oznacza: x jest mniejsze lub równe y
- x `>=` y oznacza: x jest większe lub równe y

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** - gdy używasz operatora `and`, oba porównania muszą być prawdziwe (True), żeby całe wyrażenie było prawdziwe
- **or** - gdy używasz operatora `or`, tylko jedno z obu porównań musi być prawdziwe, aby całe wyrażenie było prawdziwe

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Obiekt logiczny (Boolean)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Zapisujemy!

> Dla czytelniczek w domu: tą część uwzględnia wideo [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- wyjść z interpretera Pythona
- otworzyć wybrany przez nas edytor kodu
- Zapisać kod do nowego pliku Pythona
- Uruchomić go!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Uwaga** Powinnaś zauważyć jedną z najfajniejszych rzeczy, jeśli chodzi o edytor kodu: kolory! Gdy pisałaś w konsoli Pythona, wszystko miało ten sam kolor. Teraz powinnaś zobaczyć, że funkcja `print` jest innego koloru niż string. Nazywa się to "podświetlanie składni" i jest naprawdę użyteczne podczas kodowania. Kolor wyrazów w edytorze będzie dla Ciebie wskazówką, np. łatwo rozpoznasz dzięki temu niezamknięty string albo literówkę w słowie kluczowym (tak jak `def` w funkcji). To jeden z powodów, dla których używamy edytora kodu. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

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

If you get stuck, just ask for help.

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

## If…elif…else

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
    print('To działa!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
To dziala!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### A co jeśli warunek nie jest prawdziwy?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 jest jednak większe od 2')
else:
    print('5 nie jest większe od 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 jest jednak większe od 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hej Ola!')
elif name == 'Sonja':
    print('Hej Sonja!')
else:
    print('Hej anonimie!')
```

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Sonja!
    

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
    Idealnie, moge uslyszec wszystkie detale
    

## Komentarze

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

### Podsumowanie

In the last few exercises you learned about:

- **porównywać rzeczy** - w Pythonie do porównywania rzeczy możesz używać operatorów `>`, `>=`, `==`, `<=`, `<` oraz `and`, `or`
- **Boolean** - typ obiektu, który może przyjmować jedną z dwóch wartości: `True` (prawda) lub `False` (fałsz)
- **zapisywać pliki** - przechowywać kod w plikach, co pozwala nam uruchamiać bardziej rozbudowane programy.
- **if...elif...else** - wyrażenia, które pozwalają Ci uruchamiać kod tylko wtedy, gdy zostaną spełnione określone warunki.
- **komentarze** - linie, których Python nie wykona, a które pozwalają Ci dokumentować kod programu

Time for the last part of this chapter!

## Twoje własne funkcje!

> Dla czytelniczek w domu: tą część uwzględnia wideo [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hej!')
    print('Jak się masz?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej!
    Jak się masz?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- Jeżeli dostajesz `NameError`, znaczy to że prawdopodobnie niepoprawnie coś wpisałaś, więc powinnaś sprawdzić czy użyłaś tej samej nazwy tworząc funkcję w `def hi():` oraz gdy ją wykonujesz w `hi()`.
- Jeżeli dostajesz `IndentationError`, sprawdź czy obydwie linie z `print` mają tą samą liczbę spacji/tabów na początku linii: Python wymaga, by kod wewnątrz funkcji był odpowiednio wcięty. 
- Jeżeli nie ma żadnego wyniku działania, sprawdź czy ostanie `hi()` *nie* jest przypadkiem wcięte - jeżeli jest, to ta linia stała się również częścią funkcji, i nigdy nie zostanie wykonana. 

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
        print('Hej Ola!')
    elif name == 'Sonja':
        print('Hej Sonja!')
    else:
        print('Hej anonimie!')

hi()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hej()
    TypeError: hej() missing 1 required positional argument: 'imie'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hej nieznajoma!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hej ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Rachel!
    

Congratulations! You just learned how to write functions! :)

## Pętle

> Dla czytelniczek w domu: tą część uwzględnia wideo [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for imie in dziewczyny:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Witaj ' + name + '!')

dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
for imie in dziewczyny:
    hi(imie)
    print('Kolejna dziewczyna')
```

And when we run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Rachel!
    Kolejna dziewczyna
    Hej Monica!
    Kolejna dziewczyna
    Hej Phoebe!
    Kolejna dziewczyna
    Hej Ola!
    Kolejna dziewczyna
    Hej Ty!
    Kolejna dziewczyna
    

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

## Podsumowanie

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)