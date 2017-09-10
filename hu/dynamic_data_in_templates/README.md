# Dinamikus adatok a template-ben

Az összetevőink különböző helyeken vannak: a `Post` modellt a `models.py`-ban definiáltuk, a `post_list` a `views.py`-ban van, és létrehoztunk egy sablont is. De mégis hogyan fogjuk megjeleníteni a bejegyzést a HTML sablonban? Mert pontosan ez az, amit szeretnénk: fogjuk a tartalmat (az adatbázisban elmentett modelleket) és szépen megjelenítjük a sablonunkban.

Pont ez az, amit a *nézetek (views)* csinálnak: összekötik a modelleket a sablonokkal. A `post_list` *view*-ba kell berakni a modelleket, amiket meg akarunk jeleníteni, és továbbítani a sablonba. Tehát a *nézet*ben eldöntjük, hogy mi fog megjelenni a sablonban.

OK, hogyan fogjuk ezt megvalósítani?

Meg kell nyitni a `blog/views.py` fájlt. Eddig így nézett ki a `post_list` *view*:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Emlékszel, amikor azt magyaráztuk, hogyan tudsz korábban megírt kódot beletenni más fájlokba? Most itt az alkalom, hogy beletegyük a modelt, amit a `models.py`-ba írtunk. A `from .models import Post` sort a következőképpen adjuk hozzá:

```python
from django.shortcuts import render
from .models import Post
```

A pont a `from` után az *aktuális könyvtárt*, vagy az *aktuális applikációt* jelenti. Mivel a `views.py` és a `models.py` ugyanabban a könyvtárban vannak, elég annyit használnunk, hogy `.` és a fájl nevét (`.py` nélkül). Ezután importáljuk a model nevét.).

De mi jön ezután? Ahhoz, hogy megkapjuk az aktuális blog bejegyzést a `Post` modelből, szükségünk lesz valamire, amit `QuerySet`-nek hívnak.

## QuerySet

Már ismerős lehet, hogy hogyan működik a QuerySet. A [Django ORM (QuerySets)][1] fejezetben már beszéltünk róla.

 [1]: ../django_orm/README.md

Most azok a bejegyzések érdekelnek minket, amik publikálva vannak és a `published_date` szerint vannak sorba rendezve. Ezt már megtettük a QuerySets fejezetben!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Most ezt a kódrészletet rakjuk a `blog/views.py` fájlba, hozzáadva a `def post_list(request)` function-hoz:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

Figyeld meg, hogy létrehozunk egy *változót* a QuerySethez: `posts`. Vedd úgy, hogy ez a QuerySet neve. Innentől kezdve erre a névre hivatkozva használjuk.

Szintén fontos, hogy a kód a `timezone.now()` function-t tartalmazza, ehhez importálnunk kell a `timezone`-t.

Az utolsó hiányzó rész, hogy továbbítsuk a `posts`-ot a sablonba (ezt a következő fejezetben kifejtjük).

A `render` function-ban már van egy `request` paraméterünk (vagyis minden, ami a felhasználótól érkezik az interneten keresztül) és egy template file `'blog/post_list.html'`. Az utolsó paraméter, ami így néz ki: `{}`, egy olyan összetevő, amiben megadhatjuk azokat a dolgokat, amiket használni fogunk a template-ben. El kell neveznünk őket (egyelőre ragaszkodunk a `'posts'`-hoz :)). Így kell kinéznie: `{'posts': posts}`. Ne felejtsd el, hogy a `:` előtti rész egy string, ezt idézőjelbe kell tenned `''`.

Végül a `blog/views.py` fájlnak így kell kinéznie:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

És megvan! Itt az idő visszatérni a template-hez és megjeleníteni ezt a QuerySet-et!

Ha utána szeretnél olvasni a QuerySet-nek, itt megteheted: https://docs.djangoproject.com/en/1.11/ref/models/querysets/