# Widoki Django - czas zacząć tworzyć!

Czas uporać się z błędem, który pozostawiłyśmy po poprzednim rozdziale! :)

*Widok* jest miejscem, w którym umieszczamy "logikę" naszej aplikacji. Pobierze on informacje od modelu, który wcześniej utworzyłaś, a następnie przekaże je do szablonu (`template`). Nauczymy się tworzyć szablony w następnym rozdziale. Widoki to po prostu funkcje w Django, tylko nieco bardziej skomplikowane niż te, którymi zajmowałyśmy się w rozdziale **Wprowadzenie do Pythona**.

Widoki (ang. views) są przechowywane w pliku `views.py`. Dodajmy *views* do naszego pliku `blog/views.py`.

## blog/views.py

OK, otwórzmy ten plik w naszym edytorze i zobaczmy, co siedzi w środku:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Nie ma tu jeszcze zbyt wiele rzeczy.

Pamiętaj, że linie zaczynające się od `#` to komentarze - oznacza to, że te linie nie będą uruchamiane przez Pythona.

Utwórzmy *view* zgodnie z sugestią komentarza. Najprostszy widok może wyglądać tak:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Jak widać, stworzyłyśmy funkcję (`def`) nazwaną `post_list`, która pobiera `request` i zwraca `return` wartość uzyskaną dzięki wywołaniu innej funkcji `render`, która wyrenderuje (złoży w całość) nasz szablon `blog/post_list.html`.

Zapisz plik, przejdź do http://127.0.0.1:8000/ i zobacz co mamy.

Znowu błąd! Przeczytaj, o co chodzi tym razem:

![Błąd](images/error.png)

Przynajmniej pokazuje, że serwer jest uruchomiony ponownie, ale nadal nie wygląda dobrze, prawda? Nie martw się, to po prostu błąd strony, nic strasznego! Podobnie jak komunikaty o błędach w konsoli, są one całkiem przydatne. Możesz przeczytać, że *TemplateDoesNotExist*. Naprawmy ten błąd i stwórzmy szablon - ale to już w następnym rozdziale!

> Więcej na temat widoków Django dowiesz się czytając oficjalną dokumentację: https://docs.djangoproject.com/en/2.2/topics/http/views/