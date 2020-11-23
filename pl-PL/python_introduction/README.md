{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Wprowadzenie do Pythona

> Fragmenty tego rozdziału oparte są na tutorialu Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Napiszmy jakiś kod!

## Wiersz polecenia Pythona

> Dla czytelniczek w domu: tę część uwzględnia wideo [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Aby rozpocząć zabawę z Pythonem, musisz otworzyć jego *wiersz polecenia* na swoim komputerze. Powinnaś już wiedzieć, jak to zrobić - nauczyłyśmy się tego w rozdziale [Wprowadzenie do interfejsu wiersza polecenia](../intro_to_command_line/README.md).

Gdy już będziesz gotowa, postępuj według instrukcji poniżej.

Chcemy otworzyć konsolę Pythona. Wpisz `python`, jeśli pracujesz na Windowsie, lub `python3`, jeśli pracujesz na MacOS/Linuxie i wciśnij `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Twoje pierwsze polecenie w Pythonie!

Po uruchomieniu Pythona wiersz polecenia wygląda tak: `>>>`. Jest to sygnał dla nas, że od tego momentu możemy używać wyłącznie instrukcji języka Python. Nie musisz wpisywać `>>>` - Python zrobi to za Ciebie.

Jeśli w którymkolwiek momencie zechcesz wyjść z konsoli Pythona, wpisz polecenie `exit()` albo użyj kombinacji klawiszy `Ctrl + Z` w Windows lub `Ctrl + D` w Macu/Linuksie. Wtedy już nie będziesz więcej widzieć `>>>`.

Teraz jeszcze nie chcemy wyjść z konsoli Pythona. Chcemy się jeszcze kilku rzeczy nauczyć. Zacznijmy od wpisania działania matematycznego, np. `2 + 3` i naciśnięcia `entera`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Nieźle! Widzisz, jak pojawiła się odpowiedź? Python zna się na matematyce! Powinnaś spróbować innych działań, np.:

- `4 * 5`
- `5 - 1`
- `40 / 2`

By wykonać potęgowanie, powiedzmy podnieść 2 do potęgi 3, musimy wpisać: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Pobaw się tym przez chwilę, a potem wróć tutaj. :)

Jak widzisz, Python jest świetnym kalkulatorem. Jeżeli zastanawiasz się, co możesz z nim jeszcze zrobić…

## Tekstowy typ danych (string)

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

Fajnie, co? Możesz także wyświetlić swoje imię wielkimi literami. Wpisz:

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

- **wiersz polecenia** - wpisywanie komend (kodu) w wierszu polecenia Pythona powoduje, że Python zwraca wyniki
- **liczby i stringi** - w Pythonie liczb używamy do działań matematycznych, a stringów do obiektów tekstowych
- **operatory** - takie jak `+` i `*`, łączą wartości produkując nowe
- ** funkcje** - takie jak `upper()` i `len()`, wykonują działania na obiektach.

Są to podstawy każdego języka programowania, jakiego przyjdzie Ci się uczyć. Gotowa na coś trudniejszego? Mamy nadzieję, że tak!

## Błędy

Spróbujmy czegoś nowego. Czy możemy sprawdzić długość liczby w taki sam sposób, jak długość naszego imienia? Wpisz `len(304023)` i wciśnij `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Dostałyśmy nasz pierwszy błąd! Ikona {{ warning_icon }} to sposób, w jaki będziemy Ciebie informować, że kod, który zaraz wykonasz, nie powinien zadziałać poprawnie. Popełnianie błędów (nawet intencjonalnie) to ważna część nauki!

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

Jak już zauważyłaś, Twój program nie wyświetlił niczego tak, jak to robił wcześniej. Zatem skąd wiemy, że zmienna faktycznie istnieje? Wpisz `imie` i wciśnij `enter`:

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

Super, co? Zmienne mogą być czymkolwiek - liczbami również! Spróbuj:

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

Poświęć chwilę czasu na zabawę i przekonaj się, co możesz z tym zrobić!

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

Kiedy wpisujesz po prostu `imie`, interpreter Pythona zwraca *odwzorowanie* stringa będącego wartością zmiennej 'imie', czyli litery M-a-r-i-a zamknięte w pojedynczym cudzysłowie''. Natomiast gdy napiszesz `print(imie)`, Python wypisze zawartość zmiennej na ekran, bez żadnego cudzysłowu, co wygląda lepiej.

Jak się później przekonamy, `print()` jest szczególnie użyteczny, gdy chcemy wypisać coś z wnętrza funkcji lub gdy zechcemy wypisać wartości w kilku wierszach.

## Listy

Oprócz stringów i liczb całkowitych, Python dysponuje szeregiem różnych typów obiektów. Teraz zapoznamy się z typem zwanym **listą**. Listy są dokładnie tym, co myślisz: obiektami, które są listami innych obiektów. :)

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

By skasować coś z twojej listy, musisz użyć **indeksów**, których nauczyłyśmy się powyżej i metody `pop()`. Spróbujmy zobaczyć, jak to działa na przykładzie i powtórzmy sobie to, czego się nauczyłyśmy wyżej. Usuńmy pierwszy element z naszej listy.

{% filename %}command-line{% endfilename %}

```python
>>> print(wyniki)
[59, 42, 30, 19, 12, 3, 199]
>>> print(wyniki[0])
59
>>> wyniki.pop(0)
59
>>> print(wyniki)
[42, 30, 19, 12, 3, 199]
```

Wszystko zadziałało zgodnie z planem!

Żeby było zabawniej, sprawdź inne indeksy: 6, 7, 1000, -1, -6 czy -1000. Sprawdż, czy jesteś w stanie przewidzieć rezultat przed użyciem instrukcji. Czy otrzymane rezultaty mają sens?

Wykaz wszystkich metod dostępnych dla list znajdziesz w odpowiednim rozdziale dokumentacji Pythona: https://docs.python.org/3/tutorial/datastructures.html

## Słowniki

> Dla czytelniczek w domu: ten rozdział jest również omówiony w wideo [Installing Python Code Editor](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Słownik przypomina nieco listę, jednak różni się tym, że dostęp do wartości uzyskujemy za pomocą klucza, a nie liczbowego indeksu. Kluczem może być dowolny ciąg znaków lub liczba. Pusty słownik tworzymy tak:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

To pokazuje, że właśnie stworzyłaś pusty słownik. Hura!

A teraz spróbuj wpisać poniższą instrukcję (spróbuj użyć własnych danych):

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka = {'imie' : 'Ola', 'kraj' : 'Polska', 'ulubione_liczby' : [7, 42, 92]}
```

Za pomocą tej instrukcji stworzyłaś właśnie zmienną o nazwie `uczestniczka` zawierającą trzy pary klucz-wartość:

- Klucz `imie` wskazuje na wartość `'Ola'` (obiekt typu `string`),
- `kraj` wskazuje na wartość `'Polska'` (kolejny `string`),
- zaś `ulubione_liczby` odnoszą się do `[7, 42, 92]` (obiekt typu `list` zawierający trzy liczby).

Za pomocą poniższej składni możesz sprawdzać wartości poszczególnych kluczy:

{% filename %}command-line{% endfilename %}

```python
>>> print(uczestniczka['imie'])
Ola
```

Widzisz, zupełnie jak w liście. Ale nie trzeba pamiętać numeru indeksu, wystarczy nazwa klucza.

A co się stanie, gdy poprosimy Pythona o wartość klucza, który nie istnieje? Masz pomysł? Spróbujmy tak zrobić i zobaczmy efekt!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Słowniki, podobnie jak listy, są *mutowalne*, co oznacza, że po ich utworzeniu można je nadal zmieniać. Możesz dodać do stworzonego już słownika nowe pary klucz-wartość, w taki sposób:

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka['ulubiony_jezyk'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(uczestniczka)
4
```

Mam nadzieję, że jak dotąd jest to zrozumiałe. :) Gotowa na dalszą zabawę ze słownikami? W następnej linijce czeka nas jeszcze więcej niesamowitości.

Za pomocą polecenia `pop()` możesz usunąć element ze słownika. Założmy, że chciałabyś usunąć wpis oznaczony kluczem `'ulubione_liczby'`. Wpisz następującą instrukcję:

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka.pop('ulubione_liczby')
[7, 42, 92]
>>> uczestniczka
{'kraj': 'Polska', 'ulubiony_jezyk': 'Python', 'imie': 'Ola'}
```

Jak widać z wyświetlonego rezultatu, para klucz-wartość odpowiadająca kluczowi 'ulubione_liczby' została usunięta.

Ponadto możesz także zmienić wartość odpowiadającą kluczowi, który już istnieje w słowniku. Napisz:

{% filename %}command-line{% endfilename %}

```python
>>> uczestniczka['kraj'] = 'Niemcy'
>>> uczestniczka
{'kraj': 'Niemcy', 'ulubiony_jezyk': 'Python', 'imie': 'Ola'}
```

Jak widać, wartość klucza `'kraj'` została zmieniona z `'Polska'` na `'Niemcy'`. :) Ekscytujące? Hura! Właśnie nauczyłaś się kolejnej niesamowitej rzeczy.

### Podsumowanie

Doskonale! Wiesz już sporo o programowaniu. W tej części nauczyłaś się o:

- **błędach** - umiesz już czytać ze zrozumieniem błędy pojawiające się, gdy Python nie rozumie polecenia, które mu wydałaś
- **zmiennych** - nazwach dla obiektów, dzięki którym programuje się łatwiej, a Twój kod jest czytelniejszy
- **listach** - listach obiektów uporządkowanych w określonej kolejności
- **słownikach** - zbiorach obiektów przechowywanych w postaci par klucz-wartość

Gotowa na następną część? :)

## Porównywanie rzeczy

> Dla czytelniczek w domu: tę część uwzględnia wideo [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Istotną częścią programowania jest porównywanie różnych rzeczy. Co najłatwiej porównać? Liczby! Zobaczmy, jak to działa:

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

Zastanawiasz się, dlaczego stawiamy dwa znaki równości `==` obok siebie, gdy sprawdzamy, czy liczby są równe? Pojedynczego znaku równości `=` używamy do nadawania wartości zmiennym. Zawsze, ale to **zawsze** musisz używać dwóch znaków równości `==`, gdy chcesz sprawdzić, czy dane elementy są równe. Możemy również stwierdzić, że dwie rzeczy nie są sobie równe. Aby to zrobić, używamy symbolu `!=`, tak jak to zostało pokazane na przykładzie powyżej.

Użyjmy Pythona do wykonania dwóch innych zadań:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` i `<` są zrozumiałe, ale co oznaczają `>=` i `<=`? Czytamy je w ten sposób:

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

- **and** - gdy używasz operatora `and`, oba porównania muszą być prawdziwe (True), żeby całe wyrażenie było prawdziwe
- **or** - gdy używasz operatora `or`, tylko jedno z obu porównań musi być prawdziwe, aby całe wyrażenie było prawdziwe

Znasz powiedzenie "porównywać jabłka z gruszkami"? Zobaczmy, jak działa jego odpowiednik w Pythonie:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Widać, że podobnie jak w powiedzeniu, Python nie jest w stanie porównać liczby (`int`) ze stringiem (`str`). Zamiast tego zwraca nam **TypeError** i mówi nam, że te dwa typy nie mogą być porównywane ze sobą.

## Obiekt logiczny (Boolean)

Przypadkiem się właśnie dowiedziałaś o istnieniu innego typu obiektów w Pythonie. Nazywa się on **Boolean**.

Są tylko dwa obiekty logiczne:

- True - prawda
- False - fałsz

Jednak żeby Python mógł to zrozumieć, powinnaś zawsze zapisywać je tak: True (pierwsza litera wielka, reszta to małe litery). **true, TRUE, tRUE nie zadziałają -- tylko True jest poprawne.** (to samo dotyczy False.)

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

> Dla czytelniczek w domu: tę część uwzględnia wideo [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).

Do tej pory pisałyśmy cały nasz kod Pythona w interpreterze, co zmusza nas do pisania linijka po linijce. Prawdziwe programy są zapisywane w plikach i uruchamiane przez **interpreter** lub **kompilator** naszego języka programowania. Dotąd uruchamiałyśmy nasze programy w **interpreterze** Pythona, wprowadzając za każdym razem najwyżej jedną linijkę kodu. Ale w następnych zadaniach będziemy potrzebowały dodać więcej niż jeden wiersz kodu, więc musimy szybko:

- wyjść z interpretera Pythona
- otworzyć wybrany przez nas edytor kodu
- Zapisać kod do nowego pliku Pythona
- Uruchomić go!

Aby wyjść z używanego przez nas interpretera Pythona, użyj funkcji `exit()`

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

W ten sposób znajdziesz się z powrotem w wierszu polecenia.

Wcześniej wybrałyśmy Edytor kodu z sekcji [Edytor kodu](../code_editor/README.md). Otwórzmy teraz edytor i napiszmy trochę kodu wewnątrz nowego pliku (lub jeśli używasz Chromebooka, stwórz nowy plik w chmurze IDE i otwórz plik, który będzie zawarty w edytorze kodu):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Oczywiście jesteś już całkiem kompetentną programistką Pythona, więc śmiało - dodaj tam więcej kodu, który poznałaś wcześniej.

Teraz musimy zapisać plik i nadać mu wymowną nazwę. Nazwijmy go **python_intro.py** i zapiszmy na Pulpicie. Możemy nazwać plik jak tylko nam się podoba, ale jedna rzecz jest istotna: na końcu nazwy musi być **.py**. Rozszerzenie **.py** informuje nasz komputer, że to jest **plik wykonywalny Pythona** i Python może go uruchomić.

> **Uwaga** Powinnaś zauważyć jedną z najfajniejszych rzeczy, jeśli chodzi o edytor kodu: kolory! Gdy pisałaś w konsoli Pythona, wszystko miało ten sam kolor. Teraz powinnaś zobaczyć, że funkcja `print` jest innego koloru niż string. Nazywa się to "podświetlanie składni" i jest naprawdę użyteczne podczas kodowania. Kolor wyrazów w edytorze będzie dla Ciebie wskazówką, np. łatwo rozpoznasz dzięki temu niezamknięty string albo literówkę w słowie kluczowym (tak jak `def` w funkcji). To jeden z powodów, dla których używamy edytora kodu. :)

Mamy już zapisany plik, a więc czas go uruchomić! Wykorzystując wiadomości poznane w sekcji poświęconej wierszowi polecenia, użyj terminala, aby **zmienić aktualny katalog** na katalog Pulpitu.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Na Macu polecenie będzie wyglądać mniej-więcej tak:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

W Linuksie będzie tak (słowo "Desktop" może zostać przetłumaczone na polski jako "Pulpit"):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Pamiętaj, że słowo "Desktop" może zostać przetłumaczone na polski jako "Pulpit"):

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

W wierszu polecenia w systemie Windows będzie tak:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

A w Windows Powershell będzie tak:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Jeżeli utknęłaś, poproś o pomoc. To właśnie od tego są mentorzy!

Teraz użyj Pythona do uruchomienia kodu z pliku w następujący sposób:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Uwaga: w Windowsie 'python3' nie będzie rozpoznawany jako polecenie. W takim wypadku użyj 'python' by wykonać ten plik:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Super! Właśnie uruchomiłaś z pliku swój pierwszy program w Pythonie. Wspaniałe uczucie, co?

Teraz możemy przejść do niezwykle istotnego narzędzia w programowaniu:

## If… elif… else

Dużo różnych rzeczy w kodzie powinno być uruchamiane tylko wtedy, kiedy zostaną spełnione określone warunki. Dlatego Python posiada coś, co nazywa się **instrukcjami warunkowymi**.

Zastąp kod w pliku **python_intro.py** następującym:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Gdybyśmy to teraz zapisały i uruchomiły, pojawiłby się błąd podobny do poniższego:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python oczekuje od nas dalszych instrukcji, które mają zostać wykonane w przypadku, gdy warunek `3 > 2` okaże się prawdziwy (czyli przyjmie wartość `True`). Sprawmy, żeby Python wypisał na ekranie "To działa!". Zmień kod w pliku **python_intro.py** na poniższy:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('To działa!')
```

Zauważyłaś, że w kolejnym wierszu nasz kod posiada wcięcie 4 spacji? Musimy tak robić, aby Python wiedział, co ma uruchomić, gdy warunek jest prawdziwy. Możesz używać jednej spacji, ale prawie każdy programista Pythona stosuje 4 spacje, aby kod wyglądał czytelniej. Pojedynczy tabulator również będzie liczył się jako 4 spacje, o ile Twój edytor tekstu został w taki sposób skonfigurowany. Jeżeli dokonałaś już wyboru, nie zmieniaj go! Jeżeli używasz już 4 spacji jako wcięć, wszystkie przyszłe wcięcia wykonuj też za pomocą 4 spacji - inaczej możesz wpaść w kłopoty.

Zapisz plik i uruchom go jeszcze raz:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
To dziala!
```

Uwaga: pamiętaj, na Windowsie 'python3' nie jest rozpoznawane jako polecenie. Od tego momentu zamieniaj 'python3' na 'python' by wykonać plik.

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
    

Gdyby 2 było większą liczbą niż 5, wtedy zostałaby wykonana druga instrukcja. Zobaczmy, jak działa `elif`:

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

Po początkowej instrukcji `if` możesz dodać tyle instrukcji `elif`, ile tylko Ci się podoba. Na przykład:

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
    "Perfect, I can hear all the details"
    

## Komentarze

Komentarze to linie zaczynające się od `#`. Możesz napisać cokolwiek będziesz chciała za `#`, a Python to zignoruje. Komentarze mogą spowodować, że Twój kod będzie łatwiejszy do zrozumienia przez innych.

Zobaczmy, jak to wygląda:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Nie musisz pisać komentarza dla każdej linijki kodu, ale pamiętaj, że są one pomocne, by wytłumaczyć, czemu program coś robi lub by dodać podsumowanie, gdy program robi coś skomplikowanego.

### Podsumowanie

W ostatnich kilku ćwiczeniach nauczyłaś się:

- **porównywać rzeczy** - w Pythonie do porównywania rzeczy możesz używać operatorów `>`, `>=`, `==`, `<=`, `<` oraz `and`, `or`
- **Boolean** - typ obiektu, który może przyjmować jedną z dwóch wartości: `True` (prawda) lub `False` (fałsz)
- **zapisywać pliki** - przechowywać kod w plikach, co pozwala nam uruchamiać bardziej rozbudowane programy.
- **if...elif...else** - wyrażenia, które pozwalają Ci uruchamiać kod tylko wtedy, gdy zostaną spełnione określone warunki.
- **komentarze** - linie, których Python nie wykona, a które pozwalają Ci dokumentować kod programu

Czas na ostatnią część tego rozdziału!

## Twoje własne funkcje!

> Dla czytelniczek w domu: tę część uwzględnia wideo [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).

Pamiętasz funkcje takie jak `len()`, które możesz uruchamiać w Pythonie? Dobra wiadomość: teraz nauczysz się pisać swoje własne funkcje!

Funkcja jest zestawem poleceń, które Python ma wykonać. Każda funkcja w Pythonie zaczyna się słowem kluczowym `def`, posiada nazwę i może przyjmować parametry. Spróbujmy! Zastąp kod w pliku **python_intro.py** następującym:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hej!')
    print('Jak się masz?')

hi()
```

OK, nasza pierwsza funkcja gotowa!

Być może zastanawiasz się, czemu napisałyśmy nazwę funkcji na końcu pliku. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

Uruchommy to teraz i sprawdźmy, co się stanie:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej!
    Jak się masz?
    

Uwaga: Jeżeli to nie zadziała, nie panikuj! Wynik działania pozwoli Ci ustalić dlaczego:

- Jeżeli dostajesz `NameError`, znaczy to że prawdopodobnie niepoprawnie coś wpisałaś, więc powinnaś sprawdzić czy użyłaś tej samej nazwy tworząc funkcję w `def hi():` oraz gdy ją wykonujesz w `hi()`.
- Jeżeli dostajesz `IndentationError`, sprawdź czy obydwie linie z `print` mają tę samą liczbę spacji/tabów na początku linii: Python wymaga, by kod wewnątrz funkcji był odpowiednio wcięty. 
- Jeżeli nie ma żadnego wyniku działania, sprawdź czy ostanie `hi()` *nie* jest przypadkiem wcięte - jeżeli jest, to ta linia stała się również częścią funkcji i nigdy nie zostanie wykonana. 

Zbudujmy naszą pierwszą funkcję z parametrami. Posłużymy się wcześniejszym przykładem - funkcją, która wita każdego, kto ją uruchomi, wraz z imieniem:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(imie):
```

Jak widać, teraz nasza funkcja przyjmuje parametr, który nazwałyśmy `imie`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(imie):
    if imie == 'Ola':
        print('Hej Ola!')
    elif imie == 'Sonja':
        print('Hej Sonja!')
    else:
        print('Hej nieznajoma!')

hi()
```

Pamiętaj: musiałyśmy dodać cztery dodatkowe spacje (razem osiem) przed funkcją `print`, ponieważ `if` musi dostać informację o tym, co powinno się wydarzyć, gdy warunek zostanie spełniony. Zobaczmy teraz, jak to działa:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'imie'
    

Ups, błąd. Na szczęście Python zwrócił nam dość przydatny komunikat. Mówi nam, że funkcja `hi()` (ta, którą stworzyłyśmy) posiada jeden wymagany argument (zwany `imie`) i że zapomniałyśmy go przekazać przy wywoływaniu funkcji. Naprawmy to na końcu naszego pliku:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

I wykonajmy ponownie:

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
    

A jak myślisz - co się stanie, jak wprowadzimy tam inne imię (jeszcze inne niż Ola i Sonja)? Spróbuj i przekonaj się, czy miałaś rację. Powinno się wyświetlić coś takiego:

{% filename %}command-line{% endfilename %}

    Hej nieznajoma!
    

Prawda, że fajnie? W ten sposób nie musisz powtarzać się za każdym razem, gdy zechcesz zmienić imię osoby, która ma zostać powitana. To właśnie dlatego funkcje są nam potrzebne - żeby nie powtarzać kodu!

Zróbmy coś mądrzejszego - mamy więcej niż dwa imiona, a podanie warunku dla każdego byłoby trudne, prawda? Zastąp zawartość pliku następującym kodem:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(imie):
    print('Hej ' + imie + '!')

hi("Rachel")
```

Teraz wywołajmy ten kod:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hej Rachel!
    

Gratulacje! Właśnie nauczyłaś się pisać funkcje! :)

## Pętle

> Dla czytelniczek w domu: tę część uwzględnia wideo [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

To już ostatnia część. Prawda, że szybko poszło? :)

Jak już wspomniałyśmy, programiści są leniwi i nie lubią się powtarzać. W programowaniu chodzi o automatyzowanie różnych rzeczy, więc nie chcemy witać ręcznie każdej osoby po imieniu, prawda? I tu właśnie przydają nam się pętle.

Pamiętasz jeszcze listy? Zróbmy listę dziewczyn:

{% filename %}python_intro.py{% endfilename %}

```python
dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
```

Chcemy powitać po imieniu każdą z nich. Mamy do tego funkcję `hi`, zatem użyjmy jej wewnątrz pętli:

{% filename %}python_intro.py{% endfilename %}

```python
for imie in dziewczyny:
```

Wyrażenie `for` zachowuje się podobnie jak `if`, a więc kod pod nimi musi być wcięty 4 spacjami.

Oto kompletny kod, który umieścimy w pliku:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(imie):
    print('Witaj ' + imie + '!')

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

Zwróć uwagę, że druga z tych liczb nie jest częścią listy stworzonej przez Pythona (to znaczy, że `range(1, 6)` liczy od 1 do 5, ale nie zawiera liczby 6). Dzieje się tak, bo "range" ma przedział jednostronnie otwarty, co oznacza, że zawiera pierwszą wartość z przedziału, ale nie zawiera ostatniej.

## Podsumowanie

To już wszystko. **Wspaniale Ci idzie!** To nie było wcale takie łatwe, możesz zatem być z siebie dumna. My zdecydowanie jesteśmy z Ciebie dumne, że dotarłaś do tego miejsca!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

Jak myślisz, może czas na małą przerwę? Rozciągnij się, rozprostuj nogi, daj odpocząć oczom zanim przejdziesz do kolejnego rozdziału. :)

![Babeczka](images/cupcake.png)