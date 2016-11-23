# Dane dynamiczne w szablonach Django

Sporo rzeczy jest już na swoim miejscu: model `Post` jest zdefiniowany w `models.py`, w `views.py` mamy `post_list`, szablon też już gotowy. Ale jak to zrobić, aby nasze wpisy pojawiały się w szablonie HTML? Bo to właśnie chcemy osiągnąć: pobrać treści (czyli modele zapisane w bazie) i ładnie je wyświetlić w szablonie, prawda?

Dokładnie do tego przydadzą nam się *widoki*: do połączenia modeli i szablonów między sobą. W naszym widoku (*view*) `post_list` musimy pobrać modele do wyświetlenia i przekazać je do szablonu. Innymi słowy, w naszym *widoku* decydujemy o tym, co (czyt. jaki model lub modele) zostanie wyświetlony w szablonie.

OK, zatem jak możemy to osiągnąć?

Musimy otworzyć nasz plik `blog/views.py`. Jak dotąd *widok* `post_list` wygląda następująco:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Pamiętasz, jak rozmawiałyśmy o dołączaniu kodu zapisanego w odrębnych plikach? Teraz jest przyszedł czas na dołączenie modelu, który napisałyśmy wcześniej w `models.py`. Dodajmy wiersz `from .models import Post` w następujący sposób:

```python
from django.shortcuts import render
from .models import Post
```

Kropka po `from` oznacza *bieżący katalog* lub *biężącą aplikację*. Jako że pliki `views.py` i `models.py` są w tym katalogu, możemy użyć po prostu `.` i nazwy pliku (bez `.py`). Następnie importujemy nazwę modelu (`Post`).

Ale co dalej? Żeby pobrać wpisy naszego bloga z modelu `Post` potrzebujemy czegoś, co nazywa się się `QuerySet`.

## QuerySet

Powinnaś być już zaznajomiona z zasadą działania obiektów typu QuerySet. Rozmawiałyśmy o tym w rozdziale [Django ORM (QuerySets)][1].

 [1]: ../django_orm/README.md

Więc teraz interesuje nas lista wpisów, które zostały opublikowane i posortowane według daty publikacji (`published_date`), zgadza się? Już to zrobiłyśmy w rozdziale o QuerySetach!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')


Teraz umieśćmy ten kod wewnątrz pliku `blog/views.py` poprzez dodanie go do funkcji `def post_list(request)`:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Zauważ, że tworzymy *zmienną* dla naszego QuerySetu: `posts`. Potraktuj ją jako nazwę naszego QuerySetu. Od tej pory będziemy odnosić się do niej tylko za pomocą tej nazwy.

Ponadto w kodzie mamy funkcję `timezone.now()`, więc musimy zaimportować `timezone`.

Ostatnią częścią, której nam brakuje, jest przekazanie QuerySetu `posts` do szablonu (jej wyświetlaniem w szablonie zajmiemy się w następnym rozdziale).

W funkcji `render` mamy już parametr `request` (czyli wszystko to, co odbieramy od użytkownika przez internet) oraz plik szablonu `'blog/post_list.html'`. Ostatni parametr, który wygląda tak: `{}` jest miejscem, w którym możemy dodać parę rzeczy do wykorzystania w szablonie. Musimy nadać im nazwy (ale póki co będziemy trzymać się nazwy `'posts'` :)). Powinno to wyglądać tak: `{'posts': posts}`. Zwróć uwagę, że ta część przed `:` jest stringiem - powinna być w środku znaków `''`.

Zatem ostatecznie nasz plik `blog/views.py` powinien wyglądać następująco:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

I to wszystko! Czas, żebyśmy wróciły do naszego szablonu i wyświetliły ten QuerySet!

Jeżeli chciałabyś poczytać troszkę więcej na temat QuerySetów w Django, powinnaś rzucić okiem tutaj: https://docs.djangoproject.com/en/1.7/ref/models/querysets/
