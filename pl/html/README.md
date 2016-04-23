# Wprowadzenie do HTMLa

Zastanawiasz się czym jest szablon?

Szablon to plik, którego używamy do prezentacji informacji w zwięzłej formie. Używając analogii - do pisania listów również możesz użyć szablonu. Każdy list ma inną treść i adres, ale każdy z nich ma taką samą strukturę.

Format szablonów Django wykorzystuje język HTML (ten sam, o którym wspominaliśmy w rozdziale **Jak działa internet**).

## Co to jest HTML?

HTML to prosty kod interpretowany przez Twoją przeglarkę - taką jak Chrome, Firefox czy Safari - w celu wyświetlenia strony dla użytkownika.

HTML to skrót od "HyperText Markup Language". **HyperText** oznacza, że jest to tekst, który wspiera hyperlinki - czyli po prostu linki między stronami. **Markup** oznacza, że używamy tego kodu w dokumencie, żeby przekazać komuś informacje (w naszym przypadku przeglądarce), jak zinterpretować daną stronę. Kod HTML składa się ze **znaczników ** (tagów), a każdy z nich zaczyna się od `<` i kończy na`>`. Za pomocą znaczników oznaczamy **elementy**.

## Twój pierwszy szablon!

Stworzenie szablonu oznacza stworzenie pliku z szablonem. Bo przecież wszystko jest plikiem, zgadza się? Zapewne zdążyłaś to zauważyć.

Szablony są zapisywane w katalogu `blog/templates/blog`. Zacznij więc od stworzenia katalogu `templates` wewnątrz Twojego katalogu bloga. Następnie stwórz kolejny katalog o nazwie `blog` wewnątrz katalogu na szablony:

    blog
    └───templates
        └───blog


(być może zastanawiasz się, dlaczego tworzymy dwa katalogi o nazwie `blog` - jak się niebawem dowiesz, to po prostu użyteczna konwencja nazewnictwa. Ułatwia życie, gdy sprawy stają się bardziej skomplikowane.)

A teraz stwórz plik `post_list.html` (na razie niech będzie pusty) wewnątrz katalogu `blog/templates/blog`.

Popatrz, jak Twoja strona wygląda teraz: http://127.0.0.1:8000/

> Jeżeli nadal otrzymujesz błąd `TemplateDoesNotExists`, spróbuj uruchomić serwer ponownie. Przejdź do wiersza poleceń, zatrzymaj serwer wciskając Ctrl+C (klawisze Control i C równocześnie), a następnie uruchom go jeszcze raz poleceniem `python manage.py runserver`.

![Rysunek 11.1][1]

 [1]: images/step1.png

Nie ma błędu! Gratulacje :) Niestety, twoja aplikacja nie wyświetla niczego poza pustą stroną, ponieważ Twój szablon również jest pusty. Naprawmy to.

Dodaj następującą treść w pliku z szablonem:

```html
<html>
    <p>Hej!</p>
    <p>Działa!</p>
</html>
```

I jak twoja strona wygląda teraz? Kliknij, żeby się dowiedzieć: http://127.0.0.1:8000/

![Rysunek 11.2][2]

 [2]: images/step3.png

Zadziałało! Dobra robota :)

*   Najbardziej podstawowy znacznik, `<html>`, jest zawsze na początku każdej strony internetowej, zaś `</html>` jest zawsze na końcu. Jak widzisz, cała zawartość strony zawiera się pomiędzy znacznikiem otwierającym `<html>` i zamykającym `</html>`
*   `<p>` jest znacznikiem akapitów; `</p>` zamyka każdy akapit

## Head i body

Każda strona HTML jest podzielona na dwie części: **head** i **body**.

*   **head** jest elementem zawierającym informacje o dokumencie, które nie są wyświetlane na ekranie.

*   **body** zawiera wszystkie pozostałe elementy, które są częścią strony internetowej widoczną na ekranie.

Używamy znacznika `<head>`, aby poinformować przeglądarkę o konfiguracji strony oraz `<body>` do przekazania informacji o tym, co właściwie znajduje się na stronie.

Przykładowo, element tytułu strony możesz umieścić wewnątrz `<head>`, o tak:

```html
<html>
    <head>
        <title>Blog Oli</title>
    </head>
    <body>
        <p>Hej!</p>
        <p>Działa!</p>
    </body>
</html>
```

Zapisz plik i odśwież swoją stronę.

![Rysunek 11.3][3]

 [3]: images/step4.png

Zauważyłaś, że przeglądarka zrozumiała, że "Ola's blog" jest tytułem Twojej strony? Zinterpretowała ona `<title>Ola's blog</title>` i umieściła tekst w pasku tytułu twojej przeglądarki (będzie on również używany m.in. w zakładkach).

Zapewne zauważyłaś także, że każdy znacznik otwierający posiada *znacznik zamykający*, z `/`, a także to, że elementy są *zagnieżdżane * (czyli nie możesz zamknąć danego znacznika zanim nie zostaną zamknięte znaczniki znajdujące się wewnątrz niego).

To trochę jak wkładanie rzeczy do pudełek. Masz jedno wielkie pudło, `<html></html>`; wewnątrz niego znajduje się `<body></body>`, a w środku tegoż są kolejne mniejsze pudełka: `<p></p>`.

Musisz przestrzegać zasad *zamykania* znaczników i *zagnieżdżania* elementów - przeciwnym razie przeglądarka może mieć problem z ich poprawnym zinterpretowaniem i Twoja strona będzie wyświetlać się niepoprawnie.

## Dostosowywanie szablonu

Teraz nieco się pobawmy i spróbujmy dostosować nasz szablon! Oto kilka znaczników, które nam się do tego przydadzą:

*   `<h1>Nagłówek</h1>` - dla najważniejszego nagłówka na Twojej stronie
*   `<h2>Podtytuł</h2>` dla nagłówka niższego poziomu
*   `<h3>Pod-podtytuł</h3>` ... i tak dalej, aż do `<h6>`
*   `<em>tekst</em>` dodaje wyróżnienie twojego tekstu
*   `<strong>text</strong>` jeszcze mocniej wyróżnia twój tekst
*   `<br />` to przejście do nowej linii (wewnątrz br nie wstawiamy niczego)
*   `<a href="http://djangogirls.org">link</a>` tworzy link
*   `<ul><li>pierwsza pozycja</li><li>druga pozycja</li></ul>` tworzy listę, taką samą jak ta!
*   `<div></div>` tworzy sekcję na stronie

Poniżej przykład pełnego szablonu:

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Stworzyliśmy tutaj trzy sekcje `div`.

*   Pierwszy `div` zawiera w sobie tytuł naszego bloga - jest to nagłówek i link.
*   Kolejne dwa elementy `div` zawierają nasze wpisy wraz z opublikowaną datą, `h2` z klikalnym tytułem wpisu oraz dwa elementy `p` (akapity) z tekstem, jeden z datą i drugi z treścią naszego wpisu.

Daje nam to taki efekt:

![Rysunek 11.4][4]

 [4]: images/step6.png

Hura! Ale jak do tej pory, nasz szablon wyświetla dokładnie **tą samą treść**. Tymczasem wspominałyśmy wcześniej, że szablony umożliwiają nam wyświetlenie **różnych** treści w **takim samym formacie**.

Chcemy wyświetlić prawdziwe wpisy dodane w naszym panelu admina Django - i tym się teraz zajmiemy.

## Jeszcze jedna rzecz: wdrożenie na serwer!

Byłoby fajnie, gdybyśmy mogli to wszystko zobaczyć "na żywo" w Internecie, a nie tylko u siebie w komputerze. Czas na wdrożenie na serwer PythonAnywhere:

### Zapisz zmiany w historii i wrzuć swój kod na GitHuba

Po pierwsze, zobaczmy, jakie pliki zostały zmienione od ostatniej aktualizacji (wpisz następujące polecenie lokalnie w wierszu poleceń, nie na PythonAnywhere):

    $ git status


Upewnij się, że jesteś w folderze `djangogirls` i powiedz `git`owi aby dodał wszystkie zmiany z aktualnego folderu:

    $ git add --all .


> **Uwaga:** `-A` (skrót od "all", czyli "wszystko") oznacza, że `git` weźmie pod uwagę pliki, które usunęłaś (domyślnie rozpoznaje zmiany tylko w nowych lub już istniejących plikach). Pamiętaj również (vide rozdział 3), że `.` oznacza aktualny katalog.

Zanim prześlemy wszystkie pliki, sprawdźmy, co faktycznie `git` zamierza przesłać (wszystkie pliki, które `git` prześle do repozytorium, powinny być zaznaczone na zielono):

    $ git status


Już blisko do końca. Teraz czas poprosić gita, aby zapisał te zmiany w historii. Dodamy za moment informację o zmianach (ang. "commit message"), gdzie opiszemy, co zostało zmienione. Możesz w tym miejscu wpisać cokolwiek zechcesz, ale warto jednak wpisać kilka słów opisujących, co robiłaś. W ten sposób łatwiej Ci będzie w przyszłości przypomnieć sobie, czego dotyczyły zapisane zmiany.

    $ git commit -m "Zmieniony kod HTML na stronie."


> **Uwaga:** Nie zapomnij umieścić informacji o zmianach w cudzysłowie (" ").

Jak już wszystko to zrobimy, możemy wysłać (push) nasze zmiany na Githuba:

    git push


### Prześlij nową wersję kodu do PythonAnywhere i ponownie załaduj swoją stronę

*   Otwórz [stronę konsol na PythonAnywhere][5] i przejdź do swojej **Bash console** (czyli po polsku "konsoli Bash") albo otwórz nową. Wpisz do niej:

 [5]: https://www.pythonanywhere.com/consoles/

    $ cd ~/my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]


I obserwuj jak Twój kod się ściąga. Jeśli chcesz sprawdzić czy już się pobrał, możesz przejść do zakładki **Files tab** i przeglądnąć swój kod na PythonAnywhere.

*   Na koniec przeskocz do zakładki [Web tab][6] i naciśnij **Reload**.

 [6]: https://www.pythonanywhere.com/web_app_setup/

I to powinno wystarczyć! Możesz śmiało odświeżyć swoją stronę w przeglądarce! Zmiany powinny być widoczne :)
