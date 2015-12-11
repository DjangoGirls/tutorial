# Adresy URL w Django

Za chwilę zbudujemy naszą pierwszą stronę — stronę główną Twojego bloga! Ale najpierw dowiedzmy się co nieco o adresach URL w Django.

## Czym jest URL?

Adres URL to po prostu adres w internecie. Widzisz go za każdym razem, gdy odwiedzasz jakąkolwiek stronę — jest widoczny w pasku adresu Twojej przeglądarki (tak! `http://127.0.0.1:8000` jest adresem URL! `http://djangogirls.com` również):

![Adres URL](images/url.png)

Każda strona w internecie potrzebuje własnego adresu URL. W ten sposób aplikacja wie, co wyświetlić użytkownikowi, który otworzy dany URL. W Django używamy tak zwanego `URLconf` (konfiguracji URL) — zestawu wzorców, które Django stara się dopasować do otrzymanego adresu URL i znaleźć na tej podstawie właściwy widok.

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

Wiersze zaczynające się od `#` są komentarzami — co oznacza, że ich treść nie jest wykonywana przez Pythona. Prawda, że przydatne?

Adres URL panelu administracyjnego, który odwiedzałaś w poprzednim rozdziale, jest już tutaj dodany:

```python
    url(r'^admin/', include(admin.site.urls)),
```

To znaczy, że dla każdego adresu zaczynającego się od `admin/` Django spróbuje dopasować odpowiedni *widok*. W tym przypadku używamy wielu adresów URL panelu administracyjnego, dlatego nie wypisujemy ich wszystkich w tym jednym małym pliku — tak jak czytelniej i bardziej estetycznie.

## Regex, czyli wyrażenia regularne

Zastanawiałaś się, w jaki sposób Django kojarzy adresy URL z widokami? Cóż, ta część jest nieco bardziej złożona. Django wykorzystuje `regex` — wyrażenia regularne. Wyrażenia regularne posiadają mnóstwo (naprawdę mnóstwo!) reguł, które tworzą wzorzec do wyszukania. To dość skomplikowany temat i na razie nie będziemy się nim zajmować. Z pewnością poznasz go bardziej szczegółowo w przyszłości. Dziś ograniczymy się do tego, co jest nam faktycznie potrzebne.

Jeśli chcesz zrozumieć, jak powstały te wzorce, oto przykład tego procesu —
będziemy potrzebować tylko kilku reguł:

	^ oznacza początek tekstu
	$ oznacza koniec tekstu
	\d oznacza cyfrę
	+ oznacza, że poprzedni element powinien być powtórzony co najmniej raz
	() by „zebrać” część wzorca

Istnieją też [inne specjalne znaki i sekwencje](https://docs.python.org/3/library/re.html#regular-expression-syntax), ale większość znaków, które
chcesz używać w URL-ach, jest brane dosłownie.

Wyobraź sobie, że masz stronę internetową z adresami w postaci `http://www.mojastrona.com/post/12345/`, gdzie `12345` to numer Twojego wpisu. Pisanie osobnych widoków dla każdego numeru z osobna byłoby frustrujące. Z wyrażeniami regularnymi możemy stworzyć wzorzec, który dopasuje URL i wyciągnie dla nas numer posta: `^post/(\d+)/$`. Przeczytajmy go po kawałku, by zrozumieć, co tu się dzieje:

* **^post/** rozkazuje Django wzięcie wszystkoego, co ma `post/` na początku URL-a (zaraz po `^`)
* **(\d+)** oznacza, że szukamy numeru (jedna lub więcej cyfr), i że chcemy go zebrać i wydobyć
* **/** mówi Django, że kolejny powinien być `/`
* **$** informuje, że to jest koniec URL-a — tylko ciągi kończące się na `/` będą dopasowane do tego wzorca

## Twój pierwszy adres URL w Django!

Czas utworzyć nasz pierwszy adres URL! Chcemy, aby adres http://127.0.0.1:8000/ był stroną główną naszego bloga i wyświetlał listę wpisów.

Zależy nam również, aby zachować porządek w pliku `mysite/urls.py`, dlatego zaimportujemy URL-e z naszej aplikacji `blog` do głównego pliku `mysite/urls.py`.

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

Od tej pory Django przekieruje wszystkie reguły z adresu http://127.0.0.1:8000/ do `blog.urls` i tam będzie szukał dalszych wskazówek.

## blog.urls

Stwórz nowy pusty plik `blog/urls.py`. W porządku! Teraz dodaj dwie pierwsze linijki:

```py
from django.conf.urls import include, url
from . import views
```

Tutaj po prostu importujemy metody Django oraz wszystkie widoki (`views`) z naszej aplikacji `blog` (jeszcze nie mamy żadnych, ale dojdziemy do tego za chwilkę!)

Potem możemy dodać nasz pierwszy wzorzec adresu URL:

```py
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Jak widzisz, przyporządkowujemy widok (`view`) o nazwie `post_list` do adresu `^$`. To wyrażenie regularne będzie dopasowywać `^` (początek) i `$` (koniec) — połączenie tych dwóch znaków oznacza, że szukamy pustego ciągu znaków. I to się zgadza, ponieważ dla mechanizmów rozróżniających adresy w Django (ang. resolvers) http://127.0.0.1:8000/ nie jest częścią adresu URL. Wzorzec ten będzie wskazówką dla Django, że `views.post_list` jest właściwym kierunkiem dla każdego, kto wejdzie na stronę poprzez adres http://127.0.0.1:8000/.

Ostatni kawałek `name='post_list'` jest nazwą URL-a, która będzie używana do zidentyfikowania widoku. To może być nazwa widoku lub coś kompletnie innego. Będziemy używać nazwanych URL-i później w naszym projekcie, więc ważne jest nazwanie każdego URL-a w aplikacji. Nazwy powinny być unikalne i łatwe do zapamiętania.

Wszystko gra? Otwórz http://127.0.0.1:8000/ w przeglądarce, żeby zobaczyć rezultat.

![Błąd](images/error1.png)

Gdzieś zniknęło "It works", zgadza się? Spokojnie, to tylko strona błędu, nic strasznego! Czasami ich treść okazuje się całkiem pomocna:

Jest napisane, iż **brakuje atrybutu 'post_list'**. Czy *post_list* czegoś Ci nie przypomina? Tak samo nazwaliśmy nasz widok! Czyli wszystko jest w porządku, po prostu nie stworzyliśmy jeszcze naszego *widoku*. Nie martw się, zajmiemy się tym.

> Jeśli chciałabyś dowiedzieć się więcej na temat konfiguracji URL w Django, zajrzyj do oficjalnej dokumentacji: https://docs.djangoproject.com/en/1.8/topics/http/urls/
