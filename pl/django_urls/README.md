# Adresy URL w Django

Za chwilę zbudujemy naszą pierwszą stronę - stronę główną Twojego bloga! Ale najpierw dowiedzmy się co nieco o adresach URL w Django.

## Czym jest URL?

Adres URL to po prostu adres w internecie. Widzisz go za każdym razem, gdy odwiedzasz jakąkolwiek stronę - jest widoczny w pasku adresu Twojej przeglądarki (tak! `127.0.0.1:8000` jest adresem URL! http://djangogirls.org również):

![Adres URL][1]

 [1]: images/url.png

Każda strona w internecie potrzebuje własnego adresu URL. W ten sposób aplikacja wie, co wyświetlić użytkownikowi, który otworzy dany URL. W Django używamy tak zwanego `URLconf` (konfiguracji URL). Jest to zestaw wzorców, które Django stara się dopasować do otrzymanego adresu URL i na tej podstawie znaleźć właściwy widok.

## Jak działają adresy URL w Django?

Otwórzmy plik `mysite/urls.py` i przyjrzyjmy się jego treści:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
```

Jak zauważyłaś, Django coś nam już tu umieścił.

Wiersze zaczynające się od `#` są komentarzami - co oznacza, że ich treść nie jest wykonywana przez Pythona. Prawda, że przydatne?

Adres URL panelu administracyjnego, który odwiedzałaś w poprzednim rozdziale, jest już tutaj dodany:

```python
url(r'^admin/', include(admin.site.urls)),
```

To znaczy, że dla każdego adresu zaczynającego się od `admin/` Django spróbuje dopasować odpowiedni *widok*. W tym przypadku używamy wielu adresów URL panelu administracyjnego, dlatego nie wypisujemy ich wszystkich w tym jednym małym pliku - tak jest czytelniej i bardziej estetycznie.

## Regex, czyli wyrażenia regularne

Zastanawiałaś się, w jaki sposób Django kojarzy adresy URL z widokami? Cóż, ta część jest nieco bardziej złożona. Django wykorzystuje `regex`, czyli tzw. wyrażenia regularne. Regex posiada mnóstwo (naprawdę mnóstwo!) reguł, które tworzą wzorzec do wyszukania. To dość skomplikowany temat i nie będziemy tutaj wchodzić w szczegóły.

Do zrozumienia wzorców, które stworzyłyśmy powyżej, potrzebnych jest tylko kilka reguł:

    ^ oznacza początek tekstu
    $ oznacza koniec tekstu
    \d oznacza cyfrę
    + oznacza, że poprzedni element powinien się powtórzyć przynajmniej raz
    piszemy () aby uchwycić część wzorca


Inne znaki we wzorcu url będą rozumiane dosłownie.

Wyobraź sobie, że masz stronę, której adres to: `http://www.mysite.com/post/12345/`, gdzie `12345` to numer Twojego posta.

Pisanie osobnych widoków dla każdego numeru z osobna byłoby frustrujące. Z wyrażeniami regularnymi możemy stworzyć wzorzec, który dopasuje URL i znajdzie dla nas numer posta: `^post/(\d+)/$`. Rozbijmy go na mniejsze części, by zrozumieć, co tu się dzieje:

*   **^post/** mówi Django, by skupił się na każdym adresie URL, który zaczyna się od wyrazu `post` (zaraz po `^`)
*   **(\d+)** oznacza, że szukamy numeru (jedna lub więcej cyfr) i że chcemy go wyodrębnić
*   **/** mówi Django, że następny w kolejności powinien się pojawić znak `/`
*   **$** informuje, że to jest koniec adresu URL, co oznacza, że Django będzie szukał adresów kończących się na `/`

## Twój pierwszy adres URL w Django!

Czas utworzyć nasz pierwszy adres URL! Chcemy, aby adres 'http://127.0.0.1:8000/' był stroną główną naszego bloga i wyświetlał listę wpisów.

Zależy nam również, aby zachować porządek w pliku `mysite/urls.py`, dlatego zaimportujemy URLe z naszej aplikacji `blog` do głównego pliku `mysite/urls.py`.

Śmiało, usuń zakomentowane wiersze (zaczynające się od `#`) i dodaj wiersz nakazujący zaimportowanie `blog.urls` do głównego adresu (`''`).

Twój plik `mysite/urls.py` powinien teraz wyglądać tak:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

Django przekieruje wszystkie reguły z adresu 'http://127.0.0.1:8000/' do `blog.urls` i tam będzie szukał dalszych wskazówek.

Kiedy tworzymy wyrażenia regularne w Pythonie, zawsze piszemy `r` na początku ciągu znaków. To jest podpowiedź dla Pythona, że w tym ciągu znaków mogą się znajdować znaki specjalne, które nie są przeznaczone dla niego, ponieważ oznaczają wyrażenie regularne.

## blog.urls

Stwórz nowy pusty plik `blog/urls.py`. Super! Teraz dodaj dwie pierwsze linijki:

```python
from django.conf.urls import url
from . import views
```

Tutaj po prostu importujemy metody Django oraz wszystkie widoki (`views`) z naszej aplikacji `blog` (jeszcze nie mamy żadnych, ale dojdziemy do tego za chwilkę!)

Potem możemy dodać nasz pierwszy wzorzec adresu URL:

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Jak widzisz, przyporządkowujemy widok (`view`) o nazwie `post_list` do adresu `^$`. To wyrażenie regularne będzie dopasowywać `^` (początek) i `$` (koniec) — połączenie tych dwóch znaków oznacza, że szukamy pustego ciągu znaków. I to się zgadza, ponieważ dla mechanizmów rozróżniających adresy w Django 'http://127.0.0.1:8000/' nie jest częścią adresu URL. Ten wzorzec będzie wskazówką dla Django, że `views.post_list` jest właściwym miejscem dla każdego, kto wejdzie na stronę poprzez adres 'http://127.0.0.1:8000/'.

Ostatni kawałek `name='post_list` jest nazwą adresu URL, która będzie używana do zidentyfikowania widoku. Nazwa może być taka sama jak nazwa widoku albo kompletnie inna. W naszym projekcie będziemy używać właśnie nazw URL-i, więc ważne jest nazwanie każdego URL-a w aplikacji. Nazwy powinny być unikalne i łatwe do zapamiętania.

Wszystko gra? Otwórz http://127.0.0.1:8000/ w przeglądarce, żeby zobaczyć rezultat.

![Błąd][2]

 [2]: images/error1.png

Gdzieś zniknęło "It works", zgadza się? Spokojnie, to tylko strona błędu, nic strasznego! Czasami ich treść okazuje się całkiem pomocna:

Jest napisane, iż **brakuje atrybutu 'post_list'**. Czy *post_list* czegoś Ci nie przypomina? Tak samo nazwaliśmy nasz widok! To oznacza, że wszystko jest w porządku, po prostu nie stworzyliśmy jeszcze naszego *widoku*. Nie martw się, zajmiemy się tym.

> Jeśli chciałabyś dowiedzieć się więcej na temat konfiguracji URL w Django, zajrzyj do oficjalnej dokumentacji: https://docs.djangoproject.com/en/1.8/topics/http/urls/
