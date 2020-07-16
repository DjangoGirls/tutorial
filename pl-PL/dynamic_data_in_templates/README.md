# Dane dynamiczne w szablonach Django

Sporo rzeczy jest już na swoim miejscu: model `Post` jest zdefiniowany w `models.py`, w `views.py` mamy `post_list`, szablon też już gotowy. Ale jak to zrobić, aby nasze wpisy pojawiały się w szablonie HTML? Bo właśnie to chcemy zrobić - pobrać trochę treści (modele zapisane w bazie danych) i ładnie je wyświetlić w naszym szablonie, prawda?

Dokładnie do tego przydadzą nam się *widoki*: do połączenia modeli i szablonów między sobą. W naszym widoku (*view*) `post_list` musimy pobrać modele do wyświetlenia i przekazać je do szablonu. W widoku *view* decydujemy, jaki (model) zostanie wyświetlony w szablonie.

OK, więc jak to osiągniemy?

Musimy otworzyć nasz plik `blog/views.py` w naszym edytorze kodu. Jak dotąd *widok* `post_list` wygląda następująco:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Pamiętasz, jak rozmawiałyśmy o dołączaniu kodu zapisanego w odrębnych plikach? Teraz jest moment, w którym musimy uwzględnić model, który napisałyśmy w `models.py`. Dodajmy wiersz `from .models import Post` w ten sposób:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Kropka przed modelami `models` oznacza *bieżący katalog * lub *bieżącą aplikację*. `views.py` i `models.py` znajdują się w tym samym katalogu. Oznacza to, że możemy użyć `.` i nazwy pliku (bez `.py`). Następnie importujemy nazwę modelu (`Post`).

Ale co dalej? Aby pobrać aktualne posty na blogu z modelu `Post`, potrzebujemy czegoś, co nazywa się `QuerySet`.

## QuerySet

Powinnaś być już zaznajomiona z zasadą działania obiektów typu QuerySet. Rozmawiałyśmy o tym w rozdziale [ORM Django (obiekty QuerySets)](../django_orm/README.md).

Więc teraz chcemy opublikować posty na blogu posortowane według daty publikacji (`published_date`), prawda? Zrobiłyśmy to już w rozdziale QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Teraz otwórz plik `blog/views.py` w edytorze kodu i umieść ten fragment kodu dodając go do funkcji `def post_list (request)`, ale nie zapomnij najpierw dodać `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Zauważ, że tworzymy *zmienną* dla naszego QuerySetu: `posts`. Potraktuj ją jako nazwę naszego QuerySetu. Od tej pory będziemy odnosić się do niej tylko za pomocą tej nazwy.

W funkcji `render` mamy jeden parametr `request` (wszystko, co otrzymujemy od użytkownika za pośrednictwem Internetu) i inny podający plik szablonu (`'blog/post_list.html'`). Ostatni parametr, który wygląda tak: `{}` jest miejscem, w którym możemy dodać parę rzeczy do wykorzystania w szablonie. Musimy nadać im nazwy (ale póki co będziemy trzymać się nazwy `'posts'`). :) Powinno to wyglądać tak: `{'posts': posts}`. Zwróć uwagę, że ta część przed `:` jest stringiem; powinnaś wziąć ją w cudzysłów:`'`.

Zatem ostatecznie nasz plik `blog/views.py` powinien wyglądać następująco:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

I to wszystko! Czas, żebyśmy wróciły do naszego szablonu i wyświetliły ten QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/