# Wprowadzenie do interfejsu wiersza poleceń

Za chwilę napiszesz swoją pierwszą linijkę kodu. Jesteś już podekscytowana? :)

**Pozwól, że przedstawimy Ci Twojego pierwszego przyjaciela: wiersz poleceń!**

Następujące kroki pokażą Ci, jak wykorzystać tajemnicze czarne okno, którego używają wszyscy hakerzy. Na początku może to wyglądać nieco przerażająco, ale tak naprawdę to tylko zachęta do wpisywania komend.

## Czym jest wiersz poleceń?

Okno zwane zazwyczaj **wierszem poleceń** lub **interfejsem wiersza poleceń** jest aplikacją tekstową służącą do przeglądania, obsługi i operowania plikami na Twoim komputerze (podobnie jak np. Eksplorator Windows lub Finder na Macu, ale bez interfejsu graficznego). Inne nazwy dla wiersza poleceń to *cmd*, *CLI*, *prompt*, *konsola* lub *terminal*.

## Uruchamiamy interfejs wiersza poleceń

Aby zacząć nasze eksperymenty, musimy najpierw otworzyć nasz wiersz poleceń.

### Windows

Przejdź do menu Start → Wszystkie programy → Akcesoria → Wiersz poleceń.

### Mac OS X

Aplikacje → Narzędzia → Terminal.

### Linux

Prawdopodobnie gdzieś w menu Aplikacje → Akcesoria → Terminal, ale to może zależeć od wersji Twojego systemu. Jeżeli tam nie znajdziesz, po prostu zapytaj Google. :)

## Prompt

Teraz powinnaś zobaczyć białe lub czarne okno, które czeka na Twoje polecenia.

Jeżeli używasz Maca lub Linuksa, powinnaś zobaczyć `$`, tak jak poniżej:

    $


W systemie Windows ujrzysz znak `>`, o tak:

    >


Każde polecenie będzie poprzedzone tym znakiem oraz jedną spacją, ale nie musisz ich przepisywać. Twój komputer zrobi to za Ciebie :)

> Jedna mała uwaga: w Twoim przypadku prompt może być poprzedzony czymś jeszcze, np. `C:\Users\ola>` lub `Olas-MacBook-Air:~ ola$` i jest to w 100% poprawne. W tym tutorialu uprościmy sposób zapisu do minimum.

## Twoja pierwsza komenda!

Zacznijmy od czegoś łatwego. Wpisz to polecenie:

    $ whoami


lub

    > whoami


A następnie wciśnij `enter`. Oto rezultat:

    $ whoami
    olasitarska


Jak widzisz, komputer właśnie wyświetlił Twoją nazwę użytkownika. Prawda, że sprytne? :)

> Staraj się zawsze przepisywać polecenia zamiast je kopiować i wklejać. W ten sposób zapamiętasz więcej!

## Podstawy

Każdy system operacyjny ma nieco inny zestaw komend dostępnych w wierszu poleceń, zatem postępuj według instrukcji odpowiadających Twojemu systemowi operacyjnemu. To co, spróbujemy?

### Bieżący katalog

Byłoby miło dowiedzieć się, gdzie teraz jesteśmy, co? No to sprawdźmy. Wpisz poniższe polecenie i wciśnij `enter`:

    $ pwd
    /Users/olasitarska


Jeżeli używasz Windows:

    > cd
    C:\Users\olasitarska


Prawdopodobnie ujrzysz coś podobnego na swoim komputerze. Kiedy otwierasz wiersz poleceń, zwykle jest on uruchamiany w miejscu folderu głównego Twojego konta użytkownika.

>  Ciekawostka: `pwd` oznacza print working directory czyli w wolnym tłumaczeniu "wypisz folder roboczy"

* * *

### Lista plików i folderów

Co znajduje się w środku? Fajnie byłoby się tego dowiedzieć. Sprawdźmy:
```
$ ls
Applications
Desktop
Downloads
Music
...
```


Windows:

```
> dir
Directory of C:\Users\olasitarska
05/08/2014 07:28 PM <DIR>      Applications
05/08/2014 07:28 PM <DIR>      Desktop
05/08/2014 07:28 PM <DIR>      Downloads
05/08/2014 07:28 PM <DIR>      Music
...
```

* * *

### Zmiana katalogu bieżącego

A może by tak przejść do naszego folderu Pulpitu?

$ cd Desktop


Windows:

```
> cd Desktop
```

Sprawdźmy, czy coś się faktycznie zmieniło:

```
$ pwd
/Users/olasitarska/Desktop
```

Windows:

```
> cd
C:\Users\olasitarska\Desktop
```

Tak, to tutaj!

> PRO tip: gdy wpiszesz `cd D` i wciśniesz przycisk `tab` na klawiaturze, wiersz poleceń automatycznie uzupełni resztę nazwy, dzięki czemu będziesz mogła nawigować szybciej. Jeżeli istnieje więcej niż jeden folder o nazwie zaczynającej się na "D", wciśnij `tab` dwukrotnie, aby wyświetlić listę możliwości.

* * *

### Tworzenie folderu

Co powiesz na stworzenie folderu Django Girls na swoim pulpicie? Zrób to w ten sposób:

```
$ mkdir djangogirls
```

Windows:

```
> mkdir djangogirls
```

To niepozorne polecenie doda do twojego pulpitu folder o nazwie `djangogirls`. Możesz sprawdzić, czy na pewno został tam dodany - spójrz na swój pulpit albo uruchom polecenie `ls`/`dir`! Spróbuj :)

> PRO tip: Jeżeli nie chcesz w kółko wpisywać tych samych poleceń, wciśnij na klawiaturze klawisz ze `strzałką w górę` i `strzałką w dół` aby przewinąć listę poprzednio użytych poleceń.

* * *

### Ćwiczenie!

Małe wyzwanie dla Ciebie: wewnątrz świeżo utworzonego katalogu `djangogirls` stwórz katalog o nazwie `test`. Użyj poleceń `cd` i `mkdir`.

#### Rozwiązanie:

```
$ cd djangogirls
$ mkdir test
$ ls
test
```

Windows:

```
> cd djangogirls
> mkdir test
> dir
05/08/2014 07:28 PM <DIR>      test
```

Gratulacje! :)

* * *

### Sprzątanie

Nie chcemy zostawić bałaganu, a zatem wyrzućmy wszystko, co do tej pory zrobiłyśmy.

Najpierw musimy wrócić do Pulpitu:

```
$ cd ..
```

Windows:

```
> cd ..
```

Wykonanie `cd` wraz z `..` przeniesie Cię do katalogu nadrzędnego (czyli tego, w którym znajduje się Twój aktualny katalog).

Sprawdź, gdzie jesteś:

```
$ pwd
/Users/olasitarska/Desktop
```

Windows:
```
> cd
C:\Users\olasitarska\Desktop
```

A teraz czas na usunięcie katalogu `djangogirls`.

> **Uwaga**: Usuwanie plików za pomocą `del`, `rmdir` lub `rm` jest nieodwracalne. To znaczy, że *Twoje pliki zostaną bezpowrotnie utracone*! Tak więc bądź ostrożna z tymi poleceniami.

```
$ rm -r djangogirls
```

Windows:

```
> rmdir /S djangogirls
djangogirls, Are you sure <Y/N>? Y
```

Gotowe! Dla pewności, że został on naprawdę usunięty, sprawdźmy to:

```
$ ls
```

Windows:
```
> dir
```

### Wyjście

To na razie tyle! Możesz teraz spokojnie zamknąć wiersz poleceń. To co, zrobimy to po hakersku? :)

```
$ exit
```

Windows:

```
> exit
```

Fajnie, nie? :)

## Podsumowanie

Oto podsumowanie przydatnych poleceń:

| Polecenie (Windows) | Polecenie (Mac OS / Linux) | Opis                      | Przykład                                          |
| ------------------- | -------------------------- | ------------------------- | ------------------------------------------------- |
| exit                | exit                       | zamknięcie okna           | **exit**                                          |
| cd                  | cd                         | zmiana katalogu           | **cd test**                                       |
| dir                 | ls                         | lista katalogów/plików    | **dir**                                           |
| copy                | cp                         | kopiowanie pliku          | **copy c:\test\test.txt c:\windows\test.txt** |
| move                | mv                         | przenoszenie pliku        | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir               | mkdir                      | tworzenie nowego katalogu | **mkdir testdirectory**                           |
| del                 | rm                         | usunięcie katalogu/pliku  | **del c:\test\test.txt**                        |

To tylko garstka wszystkich poleceń, z których możesz skorzystać w wierszu poleceń, ale na dzień dzisiejszy nie będziesz potrzebowała niczego więcej.

Jeżeli temat Cię zainteresował, to [ss64.com][1] zawiera kompletny spis poleceń dla wszystkich systemów operacyjnych.

[1]: http://ss64.com

## Gotowa?

No to poznajmy Pythona!
