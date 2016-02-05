# Widoki Django - czas je stworzyć!

Czas uporać się z błędem, który pozostawiłyśmy po poprzednim rozdziale. :)

*Widok* jest miejscem, w którym umieszczamy "logikę" naszej aplikacji. Pobierze on informacje od modelu, który wcześniej utworzyłaś, a następnie przekaże je do szablonu (`template`). Nauczymy się tworzyć szablony w następnym rozdziale. Widoki to po prostu metody w Django, tylko nieco bardziej skomplikowane niż te, którymi zajmowałyśmy się w rozdziale **Wprowadzenie do Pythona**.

Widoki (ang. views) są przechowywane w pliku `views.py`. Dodajmy *views* do naszego pliku `blog/views.py`.

## blog/views.py

OK, otwórzmy ten plik i zobaczmy co siedzi w środku:

```python
from django.shortcuts import render

# Create your views here.
```

Póki co niewiele. Najprostszy *widok* może wyglądać tak.

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Jak widzisz, stworzyłyśmy metodę (`def`) zwaną `post_list`, która przyjmuje zapytanie (`request`) i zwraca (`return`) metodę zwaną `render`, której zadaniem jest wyrenderowanie (złożenie w całość) naszego szablonu `blog/post_list.html`.

Zapisz plik, przejdź do http://127.0.0.1:8000/ i sprawdź, co teraz się stanie.

Znowu błąd! Przeczytaj, o co chodzi tym razem:

![Błąd][1]

 [1]: images/error.png

Tym razem jest łatwo: *TemplateDoesNotExist*, Naprawmy ten błąd i stwórzmy szablon - ale to już w następnym rozdziale!

> Więcej na temat widoków Django dowiesz się czytając oficjalną dokumentację: https://docs.djangoproject.com/en/1.7/topics/http/views/
