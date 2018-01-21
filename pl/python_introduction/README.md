# Wprowadzenie do Pythona

> Fragmenty tego rozdziału oparte są na tutorialu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Napiszmy jakiś kod!

## Wiersz poleceń Pythona

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Aby rozpocząć zabawę z Pythonem, musisz otworzyć jego *wiersz poleceń* na swoim komputerze. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Gdy już będziesz gotowa, postępuj według instrukcji poniżej.

Chcemy otworzyć konsolę Pythona. Wpisz `python`, jeśli pracujesz na Windowsie, lub `python3`, jeśli pracujesz na MacOS/Linuxie. Wciśnij `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Twoje pierwsze polecenie w Pythonie!

Po uruchomieniu Pythona wiersz poleceń wygląda tak: `>>>`. Jest to sygnał dla nas, że od tego momentu możemy używać wyłącznie instrukcji języka Python. You don't have to type in `>>>` – Python will do that for you.

Jeśli w którymkolwiek momencie zechcesz wyjść z konsoli Pythona, po prostu wpisz polecenie `exit()` albo użyj kombinacji klawiszy `Ctrl + Z` w Windows lub `Ctrl + D` w Macu/Linuksie. Nie będziesz już więcej widzieć promptu `>>>`.

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

Pobaw się tym przez chwilę, a potem wróć tutaj. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

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

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Zastanawiasz się, dlaczego czasami wywołujemy funkcję z `.` na końcu stringu (jak tutaj: `"Ola".upper()`), a czasami najpierw wywołujemy funkcję, a dopiero potem umieszczamy string w nawiasach? Ano, w niektórych przypadkach funkcje są związane z obiektami. Tak jak `upper()`, która może być użyta wyłącznie na stringach. Taką funkcję nazywamy wówczas **metodą**. Są również funkcje, które nie są powiązane z niczym konkretnym i mogą być używane na różnych typach obiektów, jak na przykład `len()`. Dlatego przekazujemy `"Ola"` jako parametr dla funkcji `len`.

### Podsumowanie

OK, wystarczy już stringów. Jak dotąd nauczyłaś się o:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Są to podstawy każdego języka programowania, jakiego przyjdzie Ci się uczyć. Gotowa na coś trudniejszego? Mamy nadzieję, że tak!

## Błędy

Spróbujmy czegoś nowego. Czy możemy sprawdzić długość liczby w taki sam sposób jak długość naszego imienia? Wpisz `len(304023)` i wciśnij `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Nasz pierwszy błąd! Komunikat mówi nam, że obiekty typu "int" (liczby całkowite, ang. integer) nie mają długości. Zatem co możemy zrobić? Może mogłybyśmy przekazać naszą liczbę jako string? Stringi mają ustaloną długość, zgadza się?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Działa! Użyłyśmy funkcji `str` wewnątrz funkcji `len`. Funkcja `str()` konwertuje wszystko do postaci stringów.

- Funkcja `str` przekształca wartości na **stringi**
- Funkcja `int` przekształca wartości na **liczby**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Zmienne

Ważnym zagadnieniem w programowaniu są zmienne. Zmienna to nic innego jak nazwa nadana jakiejś wartości, którą potem możemy się posługiwać. Programiści używają zmiennych do przechowywania danych, dzięki czemu ich kod jest bardziej czytelny i nie muszą każdorazowo zastanawiać się, co jest czym.

Przypuśćmy, że chcemy stworzyć nową zmienną zwaną `imie`:

{% filename %}command-line{% endfilename %}

```python
>>> imie = "Ola"
```

We type name equals Ola.

Jak już zauważyłaś, Twój program nie wyświetlił niczego tak, jak to robił wcześniej. Zatem skąd wiemy, że zmienna faktycznie istnieje? Po prostu wpisz `imie` i wciśnij `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> imie
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

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

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ale co by było, gdybyśmy użyły złej nazwy? Masz pomysł, co mogłoby się stać? Sprawdźmy!

{% filename %}command-line{% endfilename %}

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

If you want to add something to your list, you can do this by typing this command:

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

Wszystko zadziałało zgodnie z planem!

Żeby było zabawniej, sprawdź inne indeksy: 6, 7, 1000, -1, -6 czy -1000. Sprawdż, czy jesteś w stanie przewidzieć rezultat przed użyciem instrukcji. Czy otrzymane rezultaty mają sens?

Wykaz wszystkich metod dostępnych dla list znajdziesz w odpowiednim rozdziale dokumentacji Pythona: https://docs.python.org/3/tutorial/datastructures.html

## Słowniki

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

To pokazuje, że właśnie stworzyłaś pusty słownik. Hura!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka = {'imie' : 'Ola', 'kraj' : 'Polska', 'ulubione_liczby' : [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Klucz `imie` wskazuje na wartość `'Ola'` (obiekt typu `string`),
- `kraj` wskazuje na wartość `'Polska'` (kolejny `string`),
- zaś `ulubione_liczby` odnoszą się do `[7, 42, 92]` (obiekt typu `list` zawierający trzy liczby).

Za pomocą poniższej składni możesz sprawdzać wartości poszczególnych kluczy:

{% filename %}command-line{% endfilename %}

```python
>>> print(uczestniczka['imie'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

A co się stanie, gdy poprosimy Pythona o wartość klucza, który nie istnieje? Masz pomysł? Spróbujmy tak zrobić i zobaczmy efekt!

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka['wiek']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'wiek'
```

Spójrz, kolejny błąd! Tym razem **KeyError**. Python próbuje Ci pomóc i wskazuje, że klucz `'wiek'` nie istnieje w tym słowniku.

Kiedy powinniśmy używać słownika, a kiedy listy? To bardzo dobre pytanie! Zastanów się nad rozwiązaniem, zanim spojrzysz na odpowiedź poniżej.

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

You can use the `pop()` method to delete an item in the dictionary. Założmy, że chciałabyś usunąć wpis oznaczony kluczem `'ulubione_liczby'`. Po prostu wpisz następującą instrukcję:

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

Doskonale! Wiesz już sporo o programowaniu. W tej części nauczyłaś się o:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Gotowa na następną część? :)

## Porównywanie rzeczy

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

Zastanawiasz się, dlaczego stawiamy dwa znaki równości `==` obok siebie, gdy sprawdzamy, czy liczby są równe? Pojedynczego znaku równości `=` używamy do nadawania wartości zmiennym. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Możemy również stwierdzić, że dwie rzeczy nie są sobie równe. Aby to zrobić, używamy symbolu `!=`, tak jak to zostało pokazane na przykładzie powyżej.

Użyjmy Pythona do wykonania dwóch innych zadań:

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

Świetnie! A chcesz zrobić coś jeszcze? Spróbuj tak:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Możesz przekazać Pythonowi tyle liczb, ile Ci się podoba, a on zawsze zwróci Ci wynik! Prawda, że sprytne?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Znasz powiedzenie "porównywać jabłka z gruszkami"? Zobaczmy, jak działa jego odpowiednik w Pythonie:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Widać, że podobnie jak w powiedzeniu, Python nie jest w stanie porównać liczby (`int`) ze stringiem (`str`). Zamiast tego zwraca nam **TypeError** i mówi nam, że te dwa typy nie mogą być porównywane ze sobą.

## Obiekt logiczny (Boolean)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Wartości logiczne mogą także być zmiennymi! Zobacz tutaj:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Możesz też zrobić tak:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Poćwicz i pobaw się wartościami logicznymi wpisując następujące instrukcje:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Gratulacje! Wartości logiczne są jedną z najfajniejszych możliwości w programaniu, a Ty właśnie nauczyłaś się ich używać!

# Zapisujemy!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Do tej pory pisałyśmy cały nasz kod Pythona w interpreterze, co zmusza nas do pisania linijka po linijce. Prawdziwe programy są zapisywane w plikach i uruchamiane przez **interpreter** lub **kompilator** naszego języka programowania. Dotąd uruchamiałyśmy nasze programy w **interpreterze** Pythona, wprowadzając za każdym razem najwyżej jedną linijkę kodu. Ale w następnych zadaniach będziemy potrzebowały dodać więcej niż jeden wiersz kodu, więc musimy szybko:

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

W ten sposób znajdziesz się z powrotem w wierszu poleceń.

Nieco wcześniej, w sekcji [Edytor kodu](../code_editor/README.md), dokonałyśmy wyboru programu używanego przez nas do pisania kodu. Musimy go teraz otworzyć i zapisać kod w nowym pliku:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Oczywiście jesteś już całkiem kompetentną programistką Pythona, więc śmiało - dodaj tam więcej kodu, który poznałaś wcześniej.

Teraz musimy zapisać plik i nadać mu wymowną nazwę. Nazwijmy go **python_intro.py** i zapiszmy na Pulpicie. Możemy nazwać plik jak tylko nam się podoba, ale jedna rzecz jest istotna: na końcu nazwy musi być **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Nazywa się to "podświetlanie składni" i jest naprawdę użyteczne podczas kodowania. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). To jeden z powodów, dla których używamy edytora kodu. :)

Mamy już zapisany plik, a więc czas go uruchomić! Wykorzystując wiadomości poznane w sekcji poświęconej wierszowi poleceń, użyj terminala, aby **zmienić aktualny katalog** na katalog Pulpitu.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Macu polecenie będzie wyglądać mniej-więcej tak:

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

Jeżeli coś jest dla Ciebie niejasne, nie wahaj się poprosić o pomoc.

Teraz użyj Pythona do uruchomienia kodu z pliku w następujący sposób:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Super! Właśnie uruchomiłaś z pliku swój pierwszy program w Pythonie. Wspaniałe uczucie, co?

Teraz możemy przejść do niezwykle istotnego narzędzia w programowaniu:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Zastąp kod w pliku **python_intro.py** następującym:

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
    

Python oczekuje od nas dalszych instrukcji, które mają zostać wykonane w przypadku, gdy warunek `3 > 2` okaże się prawdziwy (czyli przyjmie wartość `True`). Sprawmy, żeby Python wypisał na ekranie "To działa!”. Zmień kod w pliku **python_intro.py** na poniższy:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('To działa!')
```

Zauważyłaś, że w kolejnym wierszu nasz kod posiada wcięcie 4 spacji? Musimy tak robić, aby Python wiedział, co ma uruchomić, gdy warunek jest prawdziwy. Możesz używać jednej spacji, ale prawie każdy programista Pythona stosuje 4 spacje, aby kod wyglądał czytelniej. Pojedynczy `tabulator` również będzie liczył się jako 4 spacje.

Zapisz plik i uruchom go jeszcze raz:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
To dziala!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### A co jeśli warunek nie jest prawdziwy?

W poprzednich przykładach kod był wykonywany wtedy, gdy warunki okazywały się prawdziwe (True). Ale Python posiada również wyrażenia `elif` i `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 jest jednak większe od 2')
else:
    print('5 nie jest większe od 2')
```

Po uruchomieniu wyświetli się:

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

i uruchommy go:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Sonja!
    

Widzisz co się tutaj wydarzyło? `elif` pozwala Ci na dodanie dodatkowego warunku, jeśli poprzedni warunek nie został spełniony.

Po początkowej instrukcji `if` możesz dodać tyle instrukcji `elif` ile tylko Ci się podoba. Na przykład:

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

Python zbada każdy warunek i wyświetli:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Idealnie, moge uslyszec wszystkie detale
    

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

### Podsumowanie

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Czas na ostatnią część tego rozdziału!

## Twoje własne funkcje!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Funkcja jest zestawem poleceń, które Python ma wykonać. Każda funkcja w Pythonie zaczyna się słowem `def`, posiada nazwę i może przyjmować parametry. Let's give it a go. Zastąp kod w pliku **python_intro.py** następującym:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hej!')
    print('Jak się masz?')

hi()
```

OK, nasza pierwsza funkcja gotowa!

Być może zastanawiasz się, czemu napisałyśmy nazwę funkcji na końcu pliku. Zrobiłyśmy tak, ponieważ Python odczytuje plik i wykonuje go od góry do dołu. Zatem w celu użycia naszej funkcji, musimy ponownie wpisać ją na dole.

Uruchommy to teraz i sprawdźmy, co się stanie:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej!
    Jak się masz?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

Jak widać, teraz nasza funkcja przyjmuje parametr, który nazwałyśmy `imie`:

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

Pamiętaj: Musiałyśmy dodać cztery dodatkowe spacje (razem osiem) przed funkcją `print`, ponieważ `if` musi dostać informację o tym, co powinno się wydarzyć, gdy warunek zostanie spełniony. Zobaczmy teraz jak to działa:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hej()
    TypeError: hej() missing 1 required positional argument: 'imie'
    

Ups, błąd. Na szczęście Python zwrócił nam dość przydatny komunikat. Mówi nam, że funkcja `hej()` (ta, którą stworzyliśmy) posiada jeden wymagany argument (zwany `imie`) i że zapomniałyśmy go przekazać przy wywoływaniu funkcji. Naprawmy to na końcu naszego pliku:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

I wykonajmy ponownIe:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Ola!
    

A gdybyśmy zmieniły imię?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

I wykonajmy:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hej nieznajoma!
    

Prawda, że fajnie? W ten sposób nie musisz powtarzać się za każdym razem, gdy zechcesz zmienić imię osoby, która ma zostać powitana. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hej ' + name + '!')

hi("Rachel")
```

Teraz wywołajmy ten kod:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Rachel!
    

Gratulacje! Właśnie nauczyłaś się pisać funkcje! :)

## Pętle

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

To już ostatnia cześć. Prawda, że szybko poszło? :)

Jak już wspomniałyśmy, programiści są leniwi i nie lubią się powtarzać. W programowaniu chodzi o automatyzowanie różnych rzeczy, więc nie chcemy witać ręcznie każdej osoby po imieniu, prawda? I tu właśnie przydają nam się pętle.

Pamiętasz jeszcze listy? Zróbmy listę dziewczyn:

{% filename %}python_intro.py{% endfilename %}

```python
dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
```

Chcemy powitać po imieniu każdą z nich. Mamy do tego funkcję `hej`, zatem użyjmy jej wewnątrz pętli:

{% filename %}python_intro.py{% endfilename %}

```python
for imie in dziewczyny:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Oto kompletny kod, który umieścimy w pliku:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Witaj ' + name + '!')

dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
for imie in dziewczyny:
    hi(imie)
    print('Kolejna dziewczyna')
```

A gdy go uruchomimy:

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
    

Jak widzisz, cokolwiek umieścisz wewnątrz wyrażenia `for` wraz z wcięciem - zostanie powtórzone dla każdego elementu listy `dziewczyny`.

Możesz także użyć `for` na liczbach, używając metody `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Co wypisze nam na ekranie:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` jest funkcją, która tworzy listę liczb jedna po drugiej (liczby te podajesz jako parametry).

Zwróć uwagę, że druga z tych liczb nie jest częścią listy stworzonej przez Pythona (to znaczy, że `range(1, 6)` liczy od 1 do 5, ale nie zawiera liczby 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Podsumowanie

To już wszystko. **Wspaniale Ci idzie!** To nie było wcale takie łatwe, możesz zatem być z siebie dumna. My zdecydowanie jesteśmy z Ciebie dumne, że dotarłaś do tego miejsca!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Babeczka](images/cupcake.png)