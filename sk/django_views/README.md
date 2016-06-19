# Django views - čas tvoriť!

Je čas zbaviť sa toho bugu, čo sme vytvorili v poslednej kapitole :)

*View* je miesto, kam dávame "logiku" našej aplikácie. Bude požadovať informáciu z `modelu`, ktorý si už vytvorila a pošle to do `šablóny`. Šablónu (template) budeme vytvárať v nasledujúcej kapitole. Views sú vlastne len metódy Pythonu, ktoré sú trochu zložitejšie, ako tie, ktoré sme písali v kapitole **Úvod do Pythonu**.

Views sú umiestnené v súbore `views.py`. Naše *views* budeme pridávať do súboru `blog/views.py`.

## blog/views.py

OK, otvorme tento súbor a pozrime sa, čo je v ňom:

```python
from django.shortcuts import render

# Create your views here.
```

Veľa toho nie je. Najjednoduchší *view* môže vyzerať zhruba takto.

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Ako vidíš, vytvorili sme metódu (`def`) nazvanú `post_list`, ktorá použije `request` (žiadosť) a `return` (vráti) metódu `render`, ktorou vykreslí (spojí dokopy) našu šablónu `blog/post_list.html`.

Ulož súbor, prejdi na http://127.0.0.1:8000 / a pozri sa, čo sa udeje.

Ďalšia chyba! Prečítaj si, o čo ide tentokrát:

![Chyba][1]

 [1]: images/error.png

To je jednoduché: *TemplateDoesNotExist*. Opravme túto chybu a v nasledujúcej kapitole vytvorme šablónu!

> Viac informácií o Django views získaš v oficiálnej dokumentácii: https://docs.djangoproject.com/en/1.8/topics/http/views/
