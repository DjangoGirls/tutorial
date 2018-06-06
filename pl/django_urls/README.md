# URL-e Django

Zaczynamy budować naszą pierwszą stronę internetową: będzie to miejsce dla twojego bloga! Ale zanim zaczniemy, nauczmy się trochę na temat URL-i w Django.

## Czym jest URL?

Adres URL to po prostu adres w internecie. Możesz zobaczyć URL-a za każdym razem, gdy odwiedzasz stronę internetową - jest on widoczny w pasku adresu przeglądarki internetowej. (Tak! `127.0.0.1:8000` jest adresem URL! Też `https://djangogirls.org` jest adresem URL.)

![Adres URL](images/url.png)

Każda strona w internecie potrzebuje własnego adresu URL. W ten sposób aplikacja wie, co wyświetlić użytkownikowi, który otworzy dany URL. W Django używamy tak zwanego `URLconf` (konfiguracji URL). URLconf to zestaw wzorców, które Django spróbuje dopasować do żądanego adresu URL, aby znaleźć poprawny widok.

## Jak działają adresy URL w Django?

Otwórzmy plik `mysite/urls.py` i przyjrzyjmy się jego treści:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

Jak zauważyłaś, Django coś nam już tu umieścił.

Linie między potrójnymi cudzysłowami (` '''` lub `""" `) nazywa się docstrings - możesz zapisać je na górze pliku, klasy lub metody, aby opisać, co robi. Nie będą one uruchamiane przez Pythona.

Adres URL panelu administracyjnego, który odwiedzałaś w poprzednim rozdziale, jest już tutaj dodany:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

To znaczy, że dla każdego adresu zaczynającego się od `admin/` Django spróbuje dopasować odpowiedni *widok*. W tym przypadku używamy wielu adresów URL panelu administracyjnego, dlatego nie wypisujemy ich wszystkich w tym jednym małym pliku - tak jest czytelniej i bardziej estetycznie.

## Regex, czyli wyrażenia regularne

Zastanawiałaś się, w jaki sposób Django kojarzy adresy URL z widokami? Cóż, ta część jest nieco bardziej złożona. Django wykorzystuje `regex`, czyli tzw. wyrażenia regularne. Regex posiada mnóstwo (naprawdę mnóstwo!) reguł, które tworzą wzorzec do wyszukania. To dość skomplikowany temat i nie będziemy tutaj wchodzić w szczegóły.

Jeśli nadal chcesz zrozumieć, w jaki sposób stworzyliśmy wzorce, oto przykład tego procesu - będziemy potrzebować tylko ograniczonego podzbioru reguł, aby wyrazić wzorzec, którego szukamy, a mianowicie:

* `^` oznacza początek tekstu
* `$` oznacza koniec tekstu
* `\d` oznacza cyfrę
* `+` oznacza, że poprzedni element powinien się powtórzyć przynajmniej raz
* piszemy () aby uchwycić część wzorca

Inne znaki we wzorcu URL będą rozumiane dosłownie.

Teraz wyobraź sobie, że masz stronę z takim adresem `http://www.mysite.com/post/12345/`, gdzie `12345` to numer Twojego posta.

Pisanie osobnych widoków dla każdego numeru z osobna byłoby frustrujące. Z wyrażeniami regularnymi możemy stworzyć wzorzec, który dopasuje URL i znajdzie dla nas numer posta: `^post/(\d+)/$`. Rozbijmy go na mniejsze części, by zrozumieć, co tu się dzieje:

* **^post/** mówi Django, by skupiło się na każdym adresie URL, który zaczyna się od wyrazu `post` (zaraz po `^`)
* **(\d+)** oznacza, że szukamy numeru (jedna lub więcej cyfr) i że chcemy go wyodrębnić
* **/** mówi Django, że następny w kolejności powinien się pojawić znak `/`
* **$** informuje, że to jest koniec adresu URL, co oznacza, że Django będzie szukał adresów kończących się na `/`

## Twój pierwszy adres URL w Django!

Czas utworzyć nasz pierwszy adres URL! Chcemy, aby adres 'http://127.0.0.1:8000/' był stroną główną naszego bloga i wyświetlał listę wpisów.

Zależy nam również, aby zachować porządek w pliku `mysite/urls.py`, dlatego zaimportujemy URL-e z naszej aplikacji `blog` do głównego pliku `mysite/urls.py`.

Śmiało, dodaj linię, która zaimportuje `blog.urls`. Zauważ też, że używamy funkcji `include`, więc trzeba będzie ją też zaimportować.

Twój plik `mysite/urls.py` powinien teraz wyglądać tak:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django przekieruje wszystkie reguły z adresu 'http://127.0.0.1:8000/' do `blog.urls` i tam będzie szukał dalszych wskazówek.

Pisząc wyrażenia regularne w Pythonie, zawsze dajemy `r` na początku ciągu znaków. To jest podpowiedź dla Pythona, że w tym ciągu znaków mogą się znajdować znaki specjalne, które nie są przeznaczone dla niego, ponieważ oznaczają wyrażenie regularne.

## blog.urls

Stwórz nowy pusty plik o nazwie `urls.py` w katalogu `blog`. Dokładnie tak! Dodaj te pierwsze dwie linie:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Tutaj importujemy funkcje `url` Django i wszystkie nasze widoki (`views`) z aplikacji `blog`. (Nie mamy jeszcze żadnych, ale do tego dojdziemy za chwilę!)

Potem możemy dodać nasz pierwszy wzorzec adresu URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Jak widzisz, teraz przyporządkowujemy widok (`view`) o nazwie `post_list` do URL `^$`. To wyrażenie regularne będzie dopasowywać `^` (początek) po którym następuje `$` (koniec) - więc tylko pusty ciąg znaków będzie zgodny. I to się zgadza, ponieważ dla mechanizmów rozróżniających adresy w Django, 'http://127.0.0.1:8000/' nie jest częścią adresu URL. Ten wzorzec będzie wskazówką dla Django, że `views.post_list` jest właściwym miejscem dla każdego, kto wejdzie na stronę poprzez adres 'http://127.0.0.1:8000/'.

Ostatnia część, `name='post_list` jest nazwą URL, która będzie używana do zidentyfikowania widoku. Nazwa może być taka sama jak nazwa widoku albo kompletnie inna. W projekcie będziemy później używać nazw URL, więc ważne jest nazwanie każdego URL-a w aplikacji. Powinnyśmy również starać się używać nazw URL unikalnych i prostych do zapamiętania.

Jeśli teraz spróbujesz odwiedzić stronę http://127.0.0.1:8000/, zobaczysz komunikat "niedostępna strona internetowa". Wynika to z faktu, że serwer (pamiętaj o wpisaniu ` runserver`?) nie jest już uruchomiony. Spójrz na okno konsoli serwera, aby dowiedzieć się, dlaczego.

![Błąd](images/error1.png)

Twoja konsola pokazuje błąd, ale nie martw się - w rzeczywistości jest to całkiem użyteczne: mówi ci, że** brak atrybutu 'post_list'**. To jest nazwa widoku (*view*), którą Django próbuje znaleźć i użyć, ale jeszcze go nie utworzyłyśmy. Na tym etapie Twój `/admin/ ` również nie będzie działać. Nie martw się, zajmiemy się tym.

> Jeśli chciałabyś dowiedzieć się więcej na temat konfiguracji URL w Django, zajrzyj do oficjalnej dokumentacji: https://docs.djangoproject.com/en/1.11/topics/http/urls/