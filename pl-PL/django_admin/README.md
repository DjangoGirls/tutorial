# Administracja Django (admin)

W celu dodawania, edycji czy usuwania artykułów, dla których model przed chwilą stworzyłyśmy, użyjemy admina Django.

Otwórzmy plik `blog/admin.py` i zamieńmy jego zawartość na:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Jak widać, importujemy (dołączamy) model Post, który zdefiniowałyśmy w poprzednim rozdziale. Aby nasz model był widoczny w panelu admina, musimy go zarejestrować za pomocą polecenia `admin.site.register(Post)`.

OK, czas rzucić okiem na nasz model Post. Pamiętaj, by wpisać `python manage.py runserver` w wierszu poleceń, by uruchomić serwer. Przejdź do przeglądarki i wpisz adres http://127.0.0.1: 8000/admin /. Zobaczysz stronę logowania podobną do tej:

![Strona logowania](images/login_page2.png)

Aby móc się zalogować, musisz utworzyć konto administratora (*superuser*) - czyli użytkownika, który posiada nieograniczony dostęp do całej strony. Wróć do wiersza poleceń, wpisz `python manage.py createsuperuser`, i wciśnij enter.

> Pamietaj, aby móc wprowadzić nowe polecenie podczas pracy web serwera, otwórz nowy terminal i aktywuj virtualenv. Przyjrzałyśmy się, jak wpisywać nowe komendy w rozdziale **Twój pierwszy projekt w Django!**, w sekcji **Uruchamianie serwera www**.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!