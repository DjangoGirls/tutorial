# URL-e Django

Zaczynamy budować naszą pierwszą stronę internetową: będzie to miejsce dla twojego bloga! Ale zanim zaczniemy, nauczmy się trochę na temat URL-i w Django.

## Czym jest URL?

Adres URL to adres w internecie. Możesz zobaczyć URL-a za każdym razem, gdy odwiedzasz stronę internetową - jest on widoczny w pasku adresu przeglądarki internetowej. (Tak! `127.0.0.1:8000` jest adresem URL! Też `https://djangogirls.org` jest adresem URL.)

![Adres URL](images/url.png)

Każda strona w internecie potrzebuje własnego adresu URL. W ten sposób aplikacja wie, co wyświetlić użytkownikowi, który otworzy dany URL. W Django używamy tak zwanego `URLconf` (konfiguracji URL). URLconf to zestaw wzorców, które Django spróbuje dopasować do żądanego adresu URL, aby znaleźć poprawny widok.

## Jak działają adresy URL w Django?

Otwórzmy plik `mysite/urls.py` i przyjrzyjmy się jego treści:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Jak zauważyłaś, Django coś nam już tu umieścił.

Linie między potrójnymi cudzysłowami (` '''` lub `""" `) nazywa się docstrings - możesz zapisać je na górze pliku, klasy lub metody, aby opisać, co robi. Nie będą one uruchamiane przez Pythona.

Adres URL panelu administracyjnego, który odwiedzałaś w poprzednim rozdziale, jest już tutaj dodany:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

To znaczy, że dla każdego adresu zaczynającego się od `admin/` Django spróbuje dopasować odpowiedni *widok*. W tym przypadku używamy wielu adresów URL panelu administracyjnego, dlatego nie wypisujemy ich wszystkich w tym jednym małym pliku - tak jest czytelniej i bardziej estetycznie.

## Twój pierwszy adres URL w Django!

Czas utworzyć nasz pierwszy adres URL! Chcemy, aby adres 'http://127.0.0.1:8000/' był stroną główną naszego bloga i wyświetlał listę wpisów.

Zależy nam również, aby zachować porządek w pliku `mysite/urls.py`, dlatego zaimportujemy URL-e z naszej aplikacji `blog` do głównego pliku `mysite/urls.py`.

Śmiało, dodaj linię, która spowoduje zaimportowanie `blog.urls`. Będziesz musiała także zmienić pierwszy wiersz ` from django.urls...`, ponieważ użyjemy tutaj funkcji `include`, którą musimy najpierw zaimportować.

Twój plik `mysite/urls.py` powinien teraz wyglądać tak:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django przekieruje wszystkie reguły z adresu 'http://127.0.0.1:8000/' do `blog.urls` i tam będzie szukał dalszych wskazówek.

## blog.urls

Stwórz nowy pusty plik o nazwie `urls.py` w katalogu `blog` i otwórz go w Twoim edytorze. Dokładnie tak! Dodaj te pierwsze dwie linie:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Tutaj importujemy funkcje `path` Django i wszystkie nasze widoki (`views`) z aplikacji `blog`. (Nie mamy jeszcze żadnych, ale do tego dojdziemy za chwilę!)

Potem możemy dodać nasz pierwszy wzorzec adresu URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Jak widzisz, teraz przyporządkowujemy widok (`view`) o nazwie `post_list` do strony głównej. Ten wzorzec URL zostanie dopasowany do pustego ciągu znaków, a Django zignoruje nazwę domeny (np. http://127.0.0.1:8000/), która poprzedza pełną ścieżkę URL. Ten wzorzec będzie wskazówką dla Django, że `views.post_list` jest właściwym miejscem dla każdego, kto wejdzie na stronę poprzez adres 'http://127.0.0.1:8000/'.

Ostatnia część, `name='post_list` jest nazwą URL, która będzie używana do zidentyfikowania widoku. Nazwa może być taka sama jak nazwa widoku albo kompletnie inna. W projekcie będziemy później używać nazw URL, więc ważne jest nazwanie każdego URL-a w aplikacji. Powinnyśmy również starać się używać nazw URL unikalnych i prostych do zapamiętania.

Jeśli teraz spróbujesz odwiedzić stronę http://127.0.0.1:8000/, zobaczysz komunikat "niedostępna strona internetowa". Wynika to z faktu, że serwer (pamiętałaś o wpisaniu ` runserver`?) nie jest już uruchomiony. Spójrz na okno konsoli serwera, aby dowiedzieć się, dlaczego.

![Błąd](images/error1.png)

Twoja konsola pokazuje błąd, ale nie martw się - w rzeczywistości jest to całkiem użyteczne: mówi Ci, że** brak atrybutu 'post_list'**. To jest nazwa widoku (*view*), którą Django próbuje znaleźć i użyć, ale jeszcze go nie utworzyłyśmy. Na tym etapie Twój `/admin/ ` również nie będzie działać. Nie martw się, zajmiemy się tym. Jeżeli pojawiła Ci się wiadomość o innym błędzie, spróbuj zrestartować swój serwer. Aby to zrobić, przejdź do wiersza polecenia w którym uruchomiony jest serwer strony, zatrzymaj serwer wciskając Ctrl+C (klawisze Control i C równocześnie), a następnie uruchom go jeszcze raz poleceniem `python manage.py runserver`.

> Jeśli chciałabyś dowiedzieć się więcej na temat konfiguracji URL w Django, zajrzyj do oficjalnej dokumentacji: https://docs.djangoproject.com/en/2.0/topics/http/urls/