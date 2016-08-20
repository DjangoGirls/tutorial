# Dynamická data v šablonách

Máme různé části na svém místě: `Post` model je definován v `models.py`, `post_list` máme v `views.py` a máme přidanou šablonu. Ale jak skutečně přinutíme naše příspěvky objevit se v naší HTML šabloně? Protože to je to, co chceme: Vzít nějaký obsah (modely uložené v databázi) a zobrazit je hezky v naší šabloně, správně?

To je přesně to, co *views* mají dělat: spojovat modely a šablony. Do našeho `post_list` *view* budeme potřebovat vzít modely, které chceme zobrazit a předat je šabloně. Takže v podstatě se ve *view* rozhodneme, co (model) bude zobrazeno v šabloně.

OK, tak jak toho dosáhneme?

Potřebujeme otevřít `blog/views.py`. Prozatím `post_list` *view* vypadá takhle:

```python
    from django.shortcuts import render

    def post_list(request):
        return render(request, 'blog/post_list.html', {})
```  

Vzpomínáš si, jak jsme mluvily o zahrnování kódu napsaného v různých souborech? Teď je ten moment, kdy musíme zahrnout model, který jsme napsaly do `models.py`. Přidáme tuto řádku `from .models import Post`:

```python
    from django.shortcuts import render
    from .models import Post
```  

Tečka po `from` znamená *aktuální adresář* nebo *aktuální aplikace*. Protože se `views.py` a `models.py` nachází ve stejném adresáři, můžeme jednoduše použít `.` a jméno souboru (bez `.py`). Potom importujeme název modelu (`Post`).

Ale co dál? Abychom mohly vzít skutečné příspěvky z `Post`, potřebujeme něco, čemu říkáme `QuerySet`.

## QuerySet

Už bys měla mít povědomí o tom, jak QuerySety fungují. To jsme probraly v kapitole [Django ORM (QuerySets)][1].

 [1]: ../django_orm/README.md

Takže teď nás zajímá seznam příspěvků, které jsou publikovány a setříděny podle `published_date`, že? To jsme už udělaly v kapitole na QuerySety!

```python
    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```    

Teď tento kousek kódu vložíme do souboru `blog/views.py` do funkce `def post_list(request)`:

```python
    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {})
```  

Vezmi, prosím, na vědomí, že jsme vytvořily *proměnnou* pro QuerySet: `posts`. Považuj to za název našeho QuerySetu. Od teď k němu budeme referovat tímto názvem.

Kód také používá funkci `timezone.now()`, takže potřebujeme přidat import pro `timezone`.

Poslední chybějící část je předat `posts` QuerySet do šablony (jak ho zobrazit si ukážeme v další kapitole).

Ve funkci `render` už máme parametr `request` (všechno, co přijmeme od uživatele přes internet) a šablonu `'blog/post_list.html'`. Poslední parametr, který vypadá takhle: `{}`, je místo, kam můžeme přidat nějaké věci, u kterých chceme, aby je šablona mohla používat. Potřebujeme je pojmenovat (teď zůstaneme u `'posts'` :)). Mělo by to vypadat takhle: `{'posts': posts}`. Všimni si, prosím, že část před `:` je string: musíš ho obalit uvozovkami `''`.

A nakonec by náš `blog/views.py` soubor měl vypadat takhle:

```python
    from django.shortcuts import render
    from django.utils import timezone
    from .models import Post

    def post_list(request):
        posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
        return render(request, 'blog/post_list.html', {'posts': posts})
```  

A je to! Čas jít zpět do šablony a zobrazit tento QuerySet!

Pokud si chceš přečíst něco víc o QuerySetech v Django, měla by ses podívat sem: https://docs.djangoproject.com/en/1.8/ref/models/querysets/
