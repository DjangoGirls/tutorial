# Administracja Django (admin)

Aby dodawać, modyfikować i usuwać wpisy, do których stworzyliśmy wcześniej modele, posłużymy się panelem admina Django.

Otwórzmy plik `blog/admin.py` i zastąpmy jego zawartość poniższym:

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Jak widać, importujemy (dołączamy) model Post, który zdefiniowałyśmy w poprzednim rozdziale. Aby nasz model był widoczny w panelu admina, musimy go zarejestrować za pomocą polecenia `admin.site.register(Post)`.

OK, czas rzucić okiem na nasz model Post. Pamiętaj, by wpisać `python manage.py runserver` w wierszu poleceń, by uruchomić serwer. Przejdź do przeglądarki i wpisz adres http://127.0.0.1:8000/admin/ Powinnaś zobaczyć taką stronę:

![Strona logowania][1]

 [1]: images/login_page2.png

By móc się zalogować, musisz stworzyć *konto administratora* (ang. "superuser") - użytkownika, który ma całkowitą kontrolę nad stroną. Wróć do wiersza poleceń, wpisz `python manage.py createsuperuser` i zatwierdź klawiszem enter. Zostaniesz poproszona o wpisanie swojej nazwy użytkownika (małymi literami, bez spacji i polskich znaków), adresu e-mail oraz hasła. Gdy będziesz wpisywała hasło, nie martw się, że nie widać żadnych znaków na ekranie. Tak ma być, wpisz hasło i wciśnij `enter`. Treść widoczna na ekranie powinna wyglądać następująco (wpisz własną nazwę użytkownika i adres email):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.


Wróć do przeglądarki i zaloguj się danymi administratora, które wprowadziłaś wcześniej. Powinnaś zobaczyć panel admina Django.

![Administracja Django (admin)][2]

 [2]: images/django_admin3.png

Przejdź do sekcji Posts i poeksperymentuj trochę. Dodaj pięć - sześć wpisów. Nie przejmuj się ich treścią - możesz dla zaoszczędzenia czasu kopiować i wklejać treści z tego kursu :).

Postaraj się, aby przynajmniej dwa-trzy wpisy (ale nie wszystkie!) miały ustawioną datę publikacji. Przyda nam się nieco później.

![Administracja Django (admin)][3]

 [3]: images/edit_post3.png

Jeśli chcesz dowiedzieć się więcej o panelu admina Django, sprawdź dokumentację Django: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

To zdecydowanie dobra okazja na filiżankę kawy (lub herbaty) i schrupanie czegoś słodkiego. Stworzyłaś swój pierwszy model w Django - zasługujesz na małą nagrodę!
