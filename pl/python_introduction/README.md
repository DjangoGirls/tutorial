# Wprowadzenie do Pythona

> Fragment tego rozdziału jest oparty o tutoriale Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Napiszmy jakiś kod!

## Wiersz poleceń Pythona

Aby rozpocząć zabawę z Pythonem, musisz otworzyć jego *wiersz poleceń* na swoim komputerze. Już umiesz to robić - nauczyłaś się tego w rozdziale [Wprowadzenie do interfejsu wiersza poleceń][1].

 [1]: ../intro_to_command_line/README.md

Gdy już będziesz gotowa, postępuj według instrukcji poniżej.

Chcemy otworzyć konsolę Pythona. Wpisz `python`, jeśli pracujesz na Windowsie, lub `python3`, jeśli pracujesz na MacOS/Linuxie. Wciśnij `enter`.

    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>


## Twoje pierwsze polecenie w Pythonie!

Po uruchomieniu Pythona wiersz poleceń wygląda tak: `>>>`. Jest to sygnał dla nas, że od tego momentu możemy używać wyłącznie instrukcji języka Python. Nie musisz za każdym razem wpisywać `>>>` - Python zrobi to za Ciebie.

Jeśli w którymkolwiek momencie zechcesz wyjść z konsoli Pythona, po prostu wpisz polecenie `exit()` albo użyj kombinacji klawiszy `Ctrl + Z` w Windows lub `Ctrl + D` w Macu/Linuksie. Nie będziesz już więcej widzieć promptu `>>>`.

Teraz jednak nie chcemy wychodzić z konsoli Pythona. Chcemy za jej pomocą nauczyć się czegoś nowego. Zaczniemy od czegoś bardzo prostego. Spróbuj wpisać jakieś działanie matematyczne, np. `2 + 3`, i wciśnij `enter`.

    >>> 2 + 3
    5


Świetnie! Zauważyłaś, że na ekranie pojawiła się podpowiedź? Python umie liczyć! Spróbuj użyć innych poleceń takich jak: - `4 * 5` - `5 - 1` - `40 / 2`

Pobaw się tym przez chwilę, a potem wróć tutaj :).

Jak widzisz, całkiem niezły kalkulator z tego Pythona. A jeśli zastanawiasz się, co jeszcze można z nim zrobić...

## Stringi

A jakby tak wpisać swoje własne imię? Wpisz swoje imię używając cudzysłowów, w ten sposób:

    >>> "Ola"
    'Ola'


Właśnie stworzyłaś swój pierwszy string! Jest to ciąg znaków, który może być przetwarzany przez komputer. String musi zawsze zaczynać się i kończyć tym samym znakiem. Może to być apostrof (`'`) lub cudzysłów (`"`) - nie ma różnicy! Sygnalizują one Pythonowi, że wszystko, co znajduje się pomiędzy nimi, jest stringiem.

Stringi mogą być łączone. Spróbuj tak:

    >>> "Czesc " + "Ola"
    'Czesc Ola'


Da się również mnożyć stringi za pomocą liczb:

    >>> "Ola" * 3
    'OlaOlaOla'


Jeśli chciałabyś użyć apostrofu wewnątrz stringu, możesz to zrobić na dwa sposoby.

Za pomocą cudzysłowu:

    >>> "Runnin' down the hill"
    "Runnin' down the hill"


lub poprzedzając apostrof odwróconym ukośnikiem (\'):

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"


Fajnie, co? Możesz także wyświetlić swoje imię wielkimi literami. Wpisz po prostu:

    >>> "Ola".upper()
    'OLA'


Właśnie użyłaś **funkcji** `upper` na swoim stringu! Funkcja (na przykład taka jak `upper()`) jest zestawem poleceń, które Python musi wykonać na danym obiekcie (`"Ola"`) gdy tylko ją wywołasz.

A gdybyś chciała sprawdzić z ilu liter składa się Twoje imię to również możesz skorzystać z funkcji!

    >>> len("Ola")
    3


Zastanawiasz się, dlaczego czasami wywołujemy funkcję z `.` na końcu stringu (jak tutaj: `"Ola".upper()`), a czasami najpierw wywołujemy funkcję, a dopiero potem umieszczamy string w nawiasach? Ano, w niektórych przypadkach funkcje są związane z obiektami. Tak jak `upper()`, która może być użyta wyłącznie na stringach. Taką funkcję nazywamy wówczas **metodą**. Są również funkcje, które nie są powiązane z niczym konkretnym i mogą być używane na różnych typach obiektów, jak na przykład `len()`. Dlatego przekazujemy `"Ola"` jako parametr dla funkcji `len`.

### Podsumowanie

OK, wystarczy już stringów. Jak dotąd nauczyłaś się o:

*   **wierszu poleceń** - wpisywanie instrukcji (kodu) w wierszu poleceń Pythona powoduje wyświetlenie odpowiedzi przez Pythona
*   **liczbach i stringach** - Python używa liczb w działaniach matematycznych oraz stringów dla obiektów tekstowych
*   **operatorach** - takich jak + czy *, które tworzą nową wartość z tych już istniejących
*   **funkcjach** - takich jak upper() czy len(), wykonywania działań na obiektach.

Są to podstawy każdego języka programowania, jakiego przyjdzie Ci się uczyć. Gotowa na coś trudniejszego? Mamy nadzieję, że tak!

## Błędy

Spróbujmy czegoś nowego. Czy możemy sprawdzić długość liczby w taki sam sposób jak długość naszego imienia? Wpisz `len(304023)` i wciśnij `enter`:

    >>> len(304023)
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()


Nasz pierwszy błąd! Komunikat mówi nam, że obiekty typu "int" (liczby całkowite, ang. integer) nie mają długości. Zatem co możemy zrobić? Może mogłybyśmy przekazać naszą liczbę jako string? Stringi mają ustaloną długość, zgadza się?

    >>> len(str(304023))
    6


Działa! Użyłyśmy funkcji `str` wewnątrz funkcji `len`. Funkcja `str()` konwertuje wszystko do postaci stringów.

*   Funkcja `str` przekształca wartości na **stringi**
*   Funkcja `int` przekształca wartości na **liczby**

> Ważne: możemy konwertować liczby do postaci tekstowej, ale nie da się na odwrót - swoją drogą, jaki byłby wynik polecenia `int('hello')` ?

## Zmienne

Ważnym zagadnieniem w programowaniu są zmienne. Zmienna to nic innego jak nazwa nadana jakiejś wartości, którą potem możemy się posługiwać. Programiści używają zmiennych do przechowywania danych, dzięki czemu ich kod jest bardziej czytelny i nie muszą każdorazowo zastanawiać się, co jest czym.

Przypuśćmy, że chcemy stworzyć nową zmienną zwaną `imie`:

    >>> imie = "Ola"


Widzisz? Nietrudne! Po prostu: "imie" równa się Ola.

Jak już zauważyłaś, Twój program nie wyświetlił niczego tak, jak to robił wcześniej. Zatem skąd wiemy, że zmienna faktycznie istnieje? Po prostu wpisz `imie` i wciśnij `enter`:

    >>> imie
    'Ola'


Jupi! Twoja pierwsza zmienna :)! Zawsze masz możliwość zmiany tego, do czego ta zmienna się odnosi:

    >>> imie = "Sonja"
    >>> imie
    'Sonja'


Mozesz także używać jej w funkcjach:

    >>> len(imie)
    5


Ekstra, co? Oczywiście zmienne mogą reprezentować cokolwiek, także liczby! Spróbuj tak:

    >>> a = 4
    >>> b = 6
    >>> a * b
    24


Ale co by było, gdybyśmy użyły złej nazwy? Masz pomysł, co mogłoby się stać? Sprawdźmy!

    >>> miasto = "Tokyo"
    >>> masto
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'masto' is not defined


Błąd! Jak widzisz, Python ma różne rodzaje błędów, a ten nosi nazwę **NameError**. Python zwróci Ci taki błąd, gdy będziesz próbowała używać nazwy, która nie została jeszcze utworzona. Gdybyś w przyszłości natrafiła na niego, sprawdź w swoim kodzie czy nie popełniłaś literówek w nazwach zmiennych.

Poświęć chwilę czasu na zabawę i przekonaj się co możesz z tym zrobić!

## Funkcja print

Spróbuj tego:

    >>> imie = 'Maria'
    >>> imie
    'Maria'
    >>> print(imie)
    Maria


Kiedy wpisujesz po prostu `imie`, interpreter Pythona zwraca *odwzorowanie* stringu będącego wartością zmiennej 'imie', czyli litery M-a-r-i-a zamknięte w pojedynczym cudzysłowie ''. Natomiast gdy napiszesz `print(imie)`, Python wypisze zawartość zmiennej na ekran, bez żadnego cudzysłowu, co wygląda lepiej.

Jak się później przekonamy, `print()` jest szczególnie użyteczny, gdy chcemy wypisać coś z wnętrza funkcji, lub gdy zechcemy wypisać wartości w kilku wierszach.

## Listy

Oprócz stringów i liczb całkowitych, Python dysponuje bogactwem różnych typów obiektów. Teraz zapoznamy się z typem zwanym **listą**. Listy są dokładnie tym, co myślisz: obiektami, które są listami innych obiektów :)

Śmiało, stwórzmy listę:

    >>> []
    []


Tak, lista jest pusta. Niespecjalnie przydatne, co? Stwórzmy listę numerów totolotka. Nie chcemy się powtarzać za każdym razem, więc tutaj również posłużymy się zmienną:

    >>> wyniki = [3, 42, 12, 19, 30, 59]


Dobrze, mamy listę! Co możemy z nią zrobić? Zobaczmy ile liczb znajduje się w tej liście. Masz pomysł, jakiej funkcji powinnaś użyć? Już z niej korzystałaś!

    >>> len(wyniki)
    6


Tak! `len()` może zwrócić Ci liczbę obiektów zawartych w liście. Prawda że przydatne? To może teraz posortujmy listę:

    >>> wyniki.sort()


Polecenie to niczego nie zwraca, po prostu zmieniło kolejność liczb zawartych w liście. Wypiszmy jej zawartość jeszcze raz i zobaczmy co się stało:

    >>> print(wyniki)
    [3, 12, 19, 30, 42, 59]


Jak widzisz, liczby na liście są teraz uporządkowane według wartości od najniższej do najwyższej. Gratulacje!

A gdybyśmy zapragnęły odwrócić kolejność? Zróbmy to!

    >>> wyniki.reverse()
    >>> print(wyniki)
    [59, 42, 30, 19, 12, 3]


Proste, prawda? Jeśli chcesz dodać coś do swojej listy, możesz to zrobić wpisując polecenie:

    >>> wyniki.append(199)
    >>> print(wyniki)
    [59, 42, 30, 19, 12, 3, 199]


Jeśli chcesz wyświetlić tylko pierwszą liczbę, możesz to uczynić używając **indeksów**. Indeks jest numerem mówiącym nam, w którym miejscu listy znajduje się dany element. Programiści zaczynają liczenie od zera, zatem pierwszy element Twojej listy znajduje się w miejscu oznaczonym indeksem 0, następny z indeksem 1, i tak dalej. Spróbuj tego:

    >>> print(wyniki[0])
    59
    >>> print(wyniki[1])
    42


Jak widzisz, możesz uzyskać dostęp do każdego z elementów Twojej listy za pomocą jej nazwy oraz numeru indeksu wewnątrz nawiasów kwadratowych.

Aby skasować coś ze swojej listy, będziesz musiała użyć **indeksów**, których nauczyłyśmy się wyżej oraz polecenia `pop()`. Spróbujmy zobaczyć jak to działa na przykładzie i powtórzmy sobie to, czego się nauczyłyśmy wyżej. Usuńmy pierwszy element z naszej listy.

    >>> print(wyniki)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(wyniki[0])
    59
    >>> wyniki.pop(0)
    >>> print(wyniki)
    [42, 30, 19, 12, 3, 199]


Wszystko zadziałało zgodnie z planem!

Żeby było zabawniej, sprawdź inne indeksy: 6, 7, 1000, -1, -6 czy -1000. Sprawdż, czy jesteś w stanie przewidzieć rezultat przed użyciem instrukcji. Czy otrzymane rezultaty mają sens?

Wykaz wszystkich metod dostępnych dla list znajdziesz w odpowiednim rozdziale dokumentacji Pythona: https://docs.python.org/3/tutorial/datastructures.html

## Słowniki

Słownik przypomina nieco listę, jednak różni się tym, że dostęp do wartości uzyskujemy za pomocą klucza, a nie indeksu. Kluczem może być dowolny ciąg znaków lub liczba. Pusty słownik tworzymy tak:

    >>> {}
    {}


To pokazuje, że właśnie stworzyłaś pusty słownik. Hura!

A teraz spróbuj wpisać poniższą instrukcję (spróbuj użyć własnych danych):

```python
>>> uczestniczka = {'imie' : 'Ola', 'kraj' : 'Polska', 'ulubione_liczby' : [7, 42, 92]}
```

Za pomocą tej instrukcji stworzyłaś właśnie zmienną o nazwie `uczestniczka` zawierającą trzy pary klucz-wartość:

*   Klucz `imie` wskazuje na wartość `'Ola'` (obiekt typu `string`),
*   `kraj` wskazuje na wartość `'Polska'` (kolejny `string`),
*   zaś `ulubione_liczby` odnoszą się do `[7, 42, 92]` (obiekt typu `list` zawierający trzy liczby).

Za pomocą poniższej składni możesz sprawdzać wartości poszczególnych kluczy:

    >>> print(uczestniczka['imie'])
    Ola


Widzisz, zupełnie jak w liście. Ale nie trzeba pamiętać numeru indeksu, wystarczy nazwa klucza.

A co się stanie, gdy poprosimy Pythona o wartość klucza, który nie istnieje? Masz pomysł? Spróbujmy tak zrobić i zobaczmy efekt!

    >>> uczestniczka['wiek']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'wiek'


Spójrz, kolejny błąd! Tym razem **KeyError**. Python próbuje Ci pomóc i wskazuje, że klucz `'wiek'` nie istnieje w tym słowniku.

Kiedy powinniśmy używać słownika, a kiedy listy? To bardzo dobre pytanie! Zastanów się nad rozwiązaniem, zanim spojrzysz na odpowiedź poniżej.

*   Potrzebujesz ułożyć elementy w określonej kolejności? Wybierz listę.
*   Potrzebujesz powiązać wartości z kluczami, żeby mieć później łatwiejszy dostęp do nich (używając klucza)? Użyj słownika.

Słowniki, podobnie jak listy, są *mutowalne*, co oznacza, że po ich utworzeniu można je nadal zmieniać. Możesz dodać do stworzonego już słownika nowe pary klucz-wartość, w taki sposób:

    >>> uczestniczka['ulubiony_jezyk'] = 'Python'


Podobnie jak w przypadku list, metoda `len()` zwraca liczbę par klucz-wartość w danym słowniku. Śmiało, wpisz polecenie:

    >>> len(uczestniczka)
    4


Mam nadzieję, że jak dotąd jest to zrozumiałe. :) Gotowa na dalszą zabawę ze słownikami? W następnej linijce czeka nas jeszcze więcej niesamowitości.

Za pomocą polecenia `pop()` możesz usunąć element ze słownika. Założmy, że chciałabyś usunąć wpis oznaczony kluczem `'ulubione_liczby'`. Po prostu wpisz następującą instrukcję:

    >>> uczestniczka.pop('ulubione_liczby')
    >>> uczestniczka
    {'kraj': 'Polska', 'ulubiony_jezyk': 'Python', 'imie': 'Ola'}


Jak widać z wyświetlonego rezultatu, para klucz-wartość odpowiadająca kluczowi 'ulubione_liczby' została usunięta.

Ponadto możesz także zmienić wartość odpowiadającą kluczowi, który już istnieje w słowniku. Napisz:

    >>> uczestniczka['kraj'] = 'Niemcy'
    >>> uczestniczka
    {'kraj': 'Niemcy', 'ulubiony_jezyk': 'Python', 'imie': 'Ola'}


Jak widać, wartość klucza `'kraj'` została zmieniona z `'Polska'` na `'Niemcy'`. :) Ekscytujące? Hura! Właśnie nauczyłaś się kolejnej niesamowitej rzeczy.

### Podsumowanie

Doskonale! Wiesz już sporo o programowaniu. W tej części nauczyłaś się o:

*   **błędach** - umiesz już czytać ze zrozumieniem błędy pojawiające się, gdy Python nie rozumie polecenia, które mu wydałaś
*   **zmiennych** - nazwach dla obiektów, dzięki którym programuje się łatwiej, a Twój kod jest czytelniejszy
*   **listach** - listach obiektów uporządkowanych w określonej kolejności
*   **słownikach** - zbiorach obiektów przechowywanych w postaci par klucz-wartość

Gotowa na następną część? :)

## Porównywanie rzeczy

Istotną częścią programowania jest porównywanie różnych rzeczy. Co najłatwiej porównać? Liczby oczywiście. Zobaczmy, jak to działa:

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


Dałyśmy Pythonowi różne liczby do porównania. Jak widać, potrafi on nie tylko porównywać listy, ale również wyniki działań. Fajnie, nie?

Zastanawiasz się, dlaczego stawiamy dwa znaki równości `==` obok siebie, gdy sprawdzamy, czy liczby są równe? Pojedynczego znaku równości `=` używamy do nadawania wartości zmiennym. **Zawsze, ale to zawsze** musisz używać dwóch znaków równości `==`, gdy chcesz sprawdzić, czy dane elementy są równe. Możemy również stwierdzić, że dwie rzeczy nie są sobie równe. Aby to zrobić, używamy symbolu `!=`, tak jak to zostało pokazane na przykładzie powyżej.

Użyjmy Pythona do wykonania dwóch innych zadań:

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False


`>` i `<` są zrozumiałe, ale co oznaczają `>=` i `<=`? Czytamy je w ten sposób:

*   x `>` y oznacza: x jest większe od y
*   x `<` y oznacza: x jest mniejsze od y
*   x `<=` y oznacza: x jest mniejsze lub równe y
*   x `>=` y oznacza: x jest większe lub równe y

Świetnie! A chcesz zrobić coś jeszcze? Spróbuj tak:

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True


Możesz przekazać Pythonowi tyle liczb, ile Ci się podoba, a on zawsze zwróci Ci wynik! Prawda, że sprytne?

*   **and** - gdy używasz operatora `and` , oba porównania muszą być prawdziwe (True), żeby całe wyrażenie było prawdziwe
*   **or** - gdy używasz operatora `or`, tylko jedno z obu porównań musi być prawdziwe, aby całe wyrażenie było prawdziwe

Znasz powiedzenie "porównywać jabłka z gruszkami"? Zobaczmy, jak działa jego odpowiednik w Pythonie:

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()


Widać, że podobnie jak w powiedzeniu, Python nie jest w stanie porównać liczby (`int`) ze stringiem (`str`). Zamiast tego zwraca nam **TypeError** i mówi nam, że te dwa typy nie mogą być porównywane ze sobą.

## Obiekt logiczny (Boolean)

Przez przypadek poznałaś nowy typ obiektu w Pythonie. Nazywa się **obiektem logicznym (Boolean)** -- i jest chyba najprostszym typem jaki istnieje.

Są tylko dwa obiekty logiczne: - True (prawda) - False (fałsz)

Jednak żeby Python mógł to zrozumieć, powinnaś zawsze zapisywać je tak: True (pierwsza litera wielka, reszta to małe litery). **true, TRUE, tRUE nie zadziałają -- tylko True jest poprawne.** (oczywiście to samo dotyczy False.)

Wartości logiczne mogą także być zmiennymi! Zobacz tutaj:

    >>> a = True
    >>> a
    True


Możesz też zrobić tak:

    >>> a = 2 > 5
    >>> a
    False


Poćwicz i pobaw się wartościami logicznymi wpisując następujące instrukcje:

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

Gratulacje! Wartości logiczne są jedną z najfajniejszych możliwości w programaniu, a Ty właśnie nauczyłaś się ich używać!

# Zapisujemy!

Do tej pory pisałyśmy cały nasz kod Pythona w interpreterze, co zmusza nas do pisania linijka po linijce. Prawdziwe programy są zapisywane w plikach i uruchamiane przez **interpreter** lub **kompilator** naszego języka programowania. Dotąd uruchamiałyśmy nasze programy w **interpreterze** Pythona, wprowadzając za każdym razem najwyżej jedną linijkę kodu. Ale w następnych zadaniach będziemy potrzebowały dodać więcej niż jeden wiersz kodu, więc musimy szybko:

*   wyjść z interpretera Pythona
*   otworzyć wybrany przez nas edytor kodu
*   Zapisać kod do nowego pliku Pythona
*   Uruchomić go!

Aby wyjść z używanego przez nas interpretera Pythona, użyj po prostu funkcji ~~~ exit()~~~ :

    >>> exit()
    $


W ten sposób znajdziesz się z powrotem w wierszu poleceń.

Nieco wcześniej, w sekcji [Edytor kodu][2], dokonałyśmy wyboru programu używanego przez nas do pisania kodu. Musimy go teraz otworzyć i zapisać kod w nowym pliku:

 [2]: ../code_editor/README.md

```python
print('Hello, Django girls!')
```

> **Uwaga** Powinnaś zauważyć jedną z najfajniejszych rzeczy, jeśli chodzi o edytor kodu: kolory! Gdy pisałaś w konsoli Pythona, wszystko miało ten sam kolor. Teraz powinnaś zobaczyć, że funkcja `print` jest innego koloru niż string. Nazywa się to "podświetlanie składni" i jest naprawdę użyteczne podczas kodowania. Kolor wyrazów w edytorze będzie dla Ciebie wskazówką, np. łatwo rozpoznasz dzięki temu niezamknięty string albo literówkę w słowie kluczowym (tak jak `def` w funkcji). To jeden z powodów, dla których używamy edytora kodu :)

Oczywiście jesteś już całkiem kompetentną programistką Pythona, więc śmiało - dodaj tam więcej kodu, który poznałaś wcześniej.

Teraz musimy zapisać plik i nadać mu wymowną nazwę. Nazwijmy go **python_intro.py** i zapiszmy na Pulpicie. Możemy nazwać plik jak tylko nam się podoba, ale jedna rzecz jest istotna: na końcu nazwy musi być **.py**. Rozszerzenie **.py** informuje nasz komputer, że to jest **plik wykonywalny Pythona** i Python może go uruchomić.

Mamy już zapisany plik, a więc czas go uruchomić! Wykorzystując wiadomości poznane w sekcji poświęconej wierszowi poleceń, użyj terminala, aby **zmienić aktualny katalog** na katalog Pulpitu.

Na Macu polecenie będzie wyglądać mniej-więcej tak:

    $ cd /Users/<your_name>/Desktop


W Linuksie będzie tak (słowo "Desktop" może zostać przetłumaczone na polski jako "Pulpit"):

    $ cd /home/<your_name>/Desktop


A w systemie Windows będzie to wyglądać tak:

    > cd C:\Users\<your_name>\Desktop


Jeżeli coś jest dla Ciebie niejasne, nie wahaj się poprosić o pomoc.

Teraz użyj Pythona do uruchomienia kodu z pliku w następujący sposób:

    $ python3 python_intro.py
    Hello, Django girls!


Super! Właśnie uruchomiłaś z pliku swój pierwszy program w Pythonie. Wspaniałe uczucie, co?

Teraz możemy przejść do niezwykle istotnego narzędzia w programowaniu:

## If...elif...else

Dużo różnych rzeczy w kodzie powinno być uruchamiane tylko wtedy, kiedy zostaną spełnione określone warunki. Dlatego Python posiada coś, co nazywa się **instrukcjami warunkowymi**.

Zastąp kod w pliku **python_intro.py** następującym:

```python
if 3 > 2:
```  

Gdybyśmy to teraz zapisały i uruchomiły, pojawił się błąd podobny do poniższego:

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing


Python oczekuje od nas dalszych instrukcji, które mają zostać wykonane w przypadku, gdy warunek `3 > 2` okaże się prawdziwy (czyli przyjmie wartość `True`). Sprawmy, żeby Python wypisał na ekranie "To działa!". Zmień kod w pliku **python_intro.py** na poniższy:

```python
if 3 > 2:
    print('To dziala!')
```

Zauważyłaś, że w kolejnym wierszu nasz kod posiada wcięcie 4 spacji? Musimy tak robić, aby Python wiedział, co ma uruchomić, gdy warunek jest prawdziwy. Możesz używać jednej spacji, ale prawie każdy programista Pythona stosuje 4 spacje, aby kod wyglądał czytelniej. Pojedynczy `tabulator` również będzie liczył się jako 4 spacje.

Zapisz plik i uruchom go jeszcze raz:

    $ python3 python_intro.py
    To dziala!


### A co jeśli warunek nie jest prawdziwy?

W poprzednich przykładach kod był wykonywany wtedy, gdy warunki okazywały się prawdziwe (True). Ale Python posiada również wyrażenia `elif` i `else`:

```python
if 5 > 2:
    print('5 jest jednak większe od 2')
else:
    print('5 nie jest większe od 2')
```

Po uruchomieniu wyświetli się:

    $ python3 python_intro.py
    5 jest jednak większe od 2


Gdyby 2 było większą liczbą niż 5, wtedy zostałaby wykonana druga instrukcja. Proste, nie? Zobaczmy, jak działa `elif`:

```python
name = 'Sonja'
if name == 'Ola':
    print('Hej Ola!')
elif name == 'Sonja':
    print('Hej Sonja!')
else:
    print('Hej nieznajoma!')
```

i uruchommy go:

    $ python3 python_intro.py
    Hej Sonja!


Widzisz co się tutaj wydarzyło? `elif` pozwala Ci na dodanie dodatkowego warunku, jeśli poprzedni warunek nie został spełniony.

Po początkowej instrukcji `if` możesz dodać tyle instrukcji `elif` ile tylko Ci się podoba. Na przykład:

```python
glosnosc = 57
if glosnosc < 20:
    print("Prawie nic nie slychac.")
elif 20 <= glosnosc < 40:
    print("O, muzyka leci w tle.")
elif 40 <= glosnosc < 60:
    print("Idealnie, moge uslyszec wszystkie detale")
elif 60 <= glosnosc < 80:
    print("Dobre na imprezy")
elif 80 <= glosnosc < 100:
    print("Troszeczke za glosno!")
else:
    print("Ojoj! Moje uszy! :(")
```

Python zbada każdy warunek i wyświetli:

    $ python3 python_intro.py
    Idealnie, moge uslyszec wszystkie detale


### Podsumowanie

W ostatnich trzech ćwiczeniach nauczyłaś się:

*   **porównywać rzeczy** - w Pythonie do porównywania rzeczy możesz używać operatorów `>`, `>=`, `==`, `<=`, `<` oraz `and`, `or`
*   **Boolean** - typ obiektu, który może przyjmować jedną z dwóch wartości: `True` (prawda) lub `False` (fałsz)
*   **zapisywać pliki** - przechowywać kod w plikach, co pozwala nam uruchamiać bardziej rozbudowane programy.
*   **if...elif...else** - wyrażenia, które pozwalają Ci uruchamiać kod tylko wtedy, gdy zostaną spełnione określone warunki.

Czas na ostatnią część tego rozdziału!

## Twoje własne funkcje!

Pamiętasz funkcje takie jak `len()`, które możesz uruchamiać w Pythonie? Dobra wiadomość: teraz nauczysz się pisać swoje własne funkcje!

Funkcja jest zestawem poleceń, które Python ma wykonać. Każda funkcja w Pythonie zaczyna się słowem `def`, posiada nazwę i może przyjmować parametry. Zacznijmy od prostej funkcji. Zastąp kod w pliku **python_intro.py** następującym:

```python
def hej():
    print('Hej!')
    print('Jak się masz?')

hej()
```  

OK, nasza pierwsza funkcja gotowa!

Być może zastanawiasz się, czemu napisałyśmy nazwę funkcji na końcu pliku. Zrobiłyśmy tak, ponieważ Python odczytuje plik i wykonuje go od góry do dołu. Zatem w celu użycia naszej funkcji, musimy ponownie wpisać ją na dole.

Uruchommy to teraz i sprawdźmy, co się stanie:

    $ python3 python_intro.py
    Hej!
    Jak się masz?


To nie było trudne! Zbudujmy naszą pierwszą funkcję z parametrami. Posłużymy się wcześniejszym przykładem - funkcją, która wita każdego, kto ją uruchomi, wraz z imieniem:

```python
def hej(imie):
```

Jak widać, teraz nasza funkcja przyjmuje parametr, który nazwałyśmy `name`:

```python
def hej(imie):
    if imie == 'Ola':
        print('Hej Ola!')
    elif imie == 'Sonja':
        print('Hej Sonja!')
    else:
        print('Hej nieznajoma!')

hej()
```

Pamiętaj: Musiałyśmy dodać cztery dodatkowe spacje (razem osiem) przed funkcją `print`, ponieważ `if` musi dostać informację o tym, co powinno się wydarzyć, gdy warunek zostanie spełniony. Zobaczmy teraz jak to działa:

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hej()
    TypeError: hej() missing 1 required positional argument: 'imie'


Ups, błąd. Na szczęście Python zwrócił nam dość przydatny komunikat. Mówi nam, że funkcja `hej()` (ta, którą stworzyliśmy) posiada jeden wymagany argument (zwany `imie`) i że zapomniałyśmy go przekazać przy wywoływaniu funkcji. Naprawmy to na końcu naszego pliku:

```python
hej("Ola")
```

I wykonajmy ponownie:

    $ python3 python_intro.py
    Hej Ola!


A gdybyśmy zmieniły imię?

```python
hej("Sonja")
```

I wykonajmy:

    $ python3 python_intro.py
    Hej Sonja!


A jak myślisz - co się stanie, jak wprowadzimy tam inne imię (jeszcze inne niż Ola i Sonja)? Spróbuj i przekonaj się, czy miałaś rację. Powinno sie wyświetlić coś takiego:

    Hej nieznajoma!


Prawda, że fajnie? W ten sposób nie musisz powtarzać się za każdym razem, gdy zechcesz zmienić imię osoby, która ma zostać powitana. To właśnie dlatego funkcje są nam potrzebne - żeby nie powtarzać kodu!

Zróbmy coś sprytniejszego -- istnieje znacznie więcej niż dwa imiona i raczej ciężko byłoby pisać warunek dla każdego, co?

```python
def hej(imie):
    print('Hej ' + imie + '!')

hej("Rachel")
```

Teraz wywołajmy ten kod:

    $ python3 python_intro.py
    Hej Rachel!


Gratulacje! Właśnie nauczyłaś się pisać funkcje :)

## Pętle

To już ostatnia cześć. Prawda, że szybko poszło? :)

Jak już wspomniałyśmy, programiści są leniwi i nie lubią się powtarzać. W programowaniu chodzi o automatyzowanie różnych rzeczy, więc nie chcemy witać ręcznie każdej osoby po imieniu, prawda? I tu właśnie przydają nam się pętle.

Pamiętasz jeszcze listy? Zróbmy listę dziewczyn:

```python
dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
```

Chcemy powitać po imieniu każdą z nich. Mamy do tego funkcję `hej`, zatem użyjmy jej wewnątrz pętli:

```python
for imie in dziewczyny:
```

Wyrażenie for zachowuje się podobnie jak if, a więc kod pod nimi musi być wcięty 4 spacjami.

Oto kompletny kod, który umieścimy w pliku:

```python
def hej(imie):
    print('Hej ' + imie + '!')

dziewczyny = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'Ty']
for imie in dziewczyny:
    hej(imie)
    print('Kolejna dziewczyna')
```

a gdy go uruchomimy:

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

```python
for i in range(1, 6):
    print(i)
```

Co wypisze nam na ekranie:

    1
    2
    3
    4
    5


`range` jest funkcją, która tworzy listę liczb jedna po drugiej (liczby te podajesz jako parametry).

Zwróć uwagę, że druga z tych liczb nie jest częścią listy stworzonej przez Pythona (to znaczy, że `range(1, 6)` liczy od 1 do 5, ale nie zawiera liczby 6). Dzieje się tak, bo "range" ma przedział jednostronnie otwarty, co oznacza, że zawiera pierwszą wartość z przedziału, ale nie zawiera ostatniej.

## Podsumowanie

To już wszystko. **Wspaniale Ci idzie!** To nie było wcale takie łatwe, możesz zatem być z siebie dumna. My zdecydowanie jesteśmy z Ciebie dumne, że dotarłaś do tego miejsca!

Jak myślisz, może czas na małą przerwę? Rozciągnij się, rozprostuj nogi, daj odpocząć oczom zanim przejdziesz do kolejnego rozdziału. :)

![Babeczka][3]

 [3]: images/cupcake.png
