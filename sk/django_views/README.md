# Django viewy - čas tvoriť!

Je čas zbaviť sa toho bugu, čo sme vytvorili v poslednej kapitole! :)

*View* je miesto, kam dávame "logiku" našej aplikácie. Bude požadovať dáta z `modelu`, ktorý si už vytvorila, a pošle ich `šablóne`. Šablónu budeme vytvárať v nasledujúcej kapitole. Viewy sú vlastne len metódy Pythonu, ktoré sú trochu zložitejšie, ako tie, ktoré sme písali v kapitole **Úvod do jazyka Python**.

Viewy sú umiestnené v súbore `views.py`. Naše *viewy* budeme pridávať do súboru `blog/views.py`.

## blog/views.py

OK, otvorme tento súbor v editore a pozrime sa, čo je v ňom:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Zatiaľ je tu toho málo.

Ak si spomínaš, riadky začínajúce `#` sú komentáre - to znamená, že ich Python nespustí.

Vytvorme *view*, ako nám komentár naznačuje. Pridaj pod komentár nasledovný minimálny view:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Ako vidíš, vytvorili sme funkciu (`def`) nazvanú `post_list`, ktorá použije `request` (žiadosť) a `return` (vráti) metódu `render`, ktorá vyplní (vyrenderuje) našu šablónu `blog/post_list.html`.

Ulož súbor, prejdi na http://127.0.0.1:8000/ a pozri sa, čo sa udeje.

Ďalšia chyba! Prečítaj si, o čo ide tentokrát:

![Chyba](images/error.png)

Ukazuje, že server aspoň znovu beží, ale nie je to úplne ono, že? Neboj sa, je to len chybová stránka, nič, čoho sa treba báť! Podobne ako chyby v konzole nám tieto chyby napovedajú, čo treba robiť. Dočítaš sa, že *TemplateDoesNotExist* (šablóna neexistuje). Poďme opraviť túto chybu tým, že vytvoríme šablónu v nasledujúcej kapitole!

> Viac informácií o Django viewoch získaš v oficiálnej dokumentácii: https://docs.djangoproject.com/en/3.2/topics/http/views/