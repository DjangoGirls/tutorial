# Wprowadzenie do HTMLa

Zastanawiasz się czym jest szablon?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Co to jest HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML to skrót od "HyperText Markup Language". **HyperText** oznacza, że jest to tekst, który wspiera hyperlinki - czyli po prostu linki między stronami. **Markup** oznacza, że używamy tego kodu w dokumencie, żeby przekazać komuś informacje (w naszym przypadku przeglądarce), jak zinterpretować daną stronę. Kod HTML składa się ze **znaczników ** (tagów), a każdy z nich zaczyna się od `<` i kończy na`>`. Za pomocą znaczników oznaczamy **elementy**.

## Twój pierwszy szablon!

Stworzenie szablonu oznacza stworzenie pliku z szablonem. Bo przecież wszystko jest plikiem, zgadza się? Zapewne zdążyłaś to zauważyć.

Szablony są zapisywane w katalogu `blog/templates/blog`. Zacznij więc od stworzenia katalogu `templates` wewnątrz Twojego katalogu bloga. Następnie stwórz kolejny katalog o nazwie `blog` wewnątrz katalogu na szablony:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

A teraz stwórz plik `post_list.html` (na razie niech będzie pusty) wewnątrz katalogu `blog/templates/blog`.

Popatrz, jak Twoja strona wygląda teraz: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Rysunek 11.1](images/step1.png)

Nie ma błędu! Gratulacje :) Niestety, twoja aplikacja nie wyświetla niczego poza pustą stroną, ponieważ Twój szablon również jest pusty. Naprawmy to.

Dodaj następującą treść w pliku z szablonem:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Rysunek 11.2](images/step3.png)

Zadziałało! Dobra robota :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Jak widzisz, cała zawartość strony zawiera się pomiędzy znacznikiem otwierającym `<html>` i zamykającym `</html>`
* `<p>` jest znacznikiem akapitów; `</p>` zamyka każdy akapit

## Head and body

Każda strona HTML jest podzielona na dwie części: **head** i **body**.

* **head** jest elementem zawierającym informacje o dokumencie, które nie są wyświetlane na ekranie.

* **body** zawiera wszystkie pozostałe elementy, które są częścią strony internetowej widoczną na ekranie.

Używamy znacznika `<head>`, aby poinformować przeglądarkę o konfiguracji strony oraz `<body>` do przekazania informacji o tym, co właściwie znajduje się na stronie.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Zapisz plik i odśwież swoją stronę.

![Rysunek 11.3](images/step4.png)

Zauważyłaś, że przeglądarka zrozumiała, że "Ola's blog" jest tytułem Twojej strony? Zinterpretowała ona `<title>Ola's blog</title>` i umieściła tekst w pasku tytułu twojej przeglądarki (będzie on również używany m.in. w zakładkach).

Zapewne zauważyłaś także, że każdy znacznik otwierający posiada *znacznik zamykający*, z `/`, a także to, że elementy są *zagnieżdżane * (czyli nie możesz zamknąć danego znacznika zanim nie zostaną zamknięte znaczniki znajdujące się wewnątrz niego).

To trochę jak wkładanie rzeczy do pudełek. Masz jedno wielkie pudło, `<html></html>`; wewnątrz niego znajduje się `<body></body>`, a w środku tegoż są kolejne mniejsze pudełka: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Dostosowywanie szablonu

Teraz nieco się pobawmy i spróbujmy dostosować nasz szablon! Oto kilka znaczników, które nam się do tego przydadzą:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Podtytuł</h2>` dla nagłówka niższego poziomu
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>tekst</em>` dodaje wyróżnienie twojego tekstu
* `<strong>text</strong>` jeszcze mocniej wyróżnia twój tekst
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` tworzy link
* `<ul><li>pierwsza pozycja</li><li>druga pozycja</li></ul>` tworzy listę, taką samą jak ta!
* `<div></div>` tworzy sekcję na stronie

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
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

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

Daje nam to taki efekt:

![Rysunek 11.4](images/step6.png)

Hura! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Jeszcze jedna rzecz: wdrożenie na serwer!

Byłoby fajnie, gdybyśmy mogli to wszystko zobaczyć "na żywo" w Internecie, a nie tylko u siebie w komputerze. Czas na wdrożenie na serwer PythonAnywhere:

### Zapisz zmiany w historii i wrzuć swój kod na GitHuba

Po pierwsze, zobaczmy, jakie pliki zostały zmienione od ostatniej aktualizacji (wpisz następujące polecenie lokalnie w wierszu poleceń, nie na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Upewnij się, że jesteś w folderze `djangogirls` i powiedz `git`owi aby dodał wszystkie zmiany z aktualnego folderu:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Uwaga:** `--all` (czyli "wszystko") oznacza, że `git` weźmie pod uwagę pliki, które usunęłaś (domyślnie rozpoznaje zmiany tylko w nowych lub już istniejących plikach). Pamiętaj również (vide rozdział 3), że `.` oznacza aktualny katalog.

Zanim prześlemy wszystkie pliki, sprawdźmy, co faktycznie `git` zamierza przesłać (wszystkie pliki, które `git` prześle do repozytorium, powinny być zaznaczone na zielono):

{% filename %}command-line{% endfilename %}

    $ git status
    

Już blisko do końca. Teraz czas poprosić gita, aby zapisał te zmiany w historii. Dodamy za moment informację o zmianach (ang. "commit message"), gdzie opiszemy, co zostało zmienione. Możesz w tym miejscu wpisać cokolwiek zechcesz, ale warto jednak wpisać kilka słów opisujących, co robiłaś. W ten sposób łatwiej Ci będzie w przyszłości przypomnieć sobie, czego dotyczyły zapisane zmiany.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Zmieniony kod HTML na stronie."
    

> **Uwaga:** Nie zapomnij umieścić informacji o zmianach w cudzysłowie (" ").

Jak już wszystko to zrobimy, możemy wysłać (push) nasze zmiany na Githuba:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Prześlij nową wersję kodu do PythonAnywhere i ponownie załaduj swoją stronę

* Otwórz [stronę konsol na PythonAnywhere](https://www.pythonanywhere.com/consoles/) i przejdź do swojej **Bash console** (czyli po polsku "konsoli Bash") albo otwórz nową. Wpisz do niej:

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Pamiętaj by podmienić `<your-pythonanywhere-username>` na twoją właściwą nazwę użytkownika PythonAnywhere, bez nawiasów ostrokątnych).

I obserwuj jak Twój kod się ściąga. Jeśli chcesz sprawdzić czy już się pobrał, możesz przejść do zakładki **Files tab** i przeglądnąć swój kod na PythonAnywhere.

* Na koniec przeskocz do zakładki [Web tab](https://www.pythonanywhere.com/web_app_setup/) i naciśnij **Reload**.

I to powinno wystarczyć! Możesz śmiało odświeżyć swoją stronę w przeglądarce! Zmiany powinny być widoczne. :)