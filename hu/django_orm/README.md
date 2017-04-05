# Django ORM és QuerySet-ek

Ebben a fejezetben megtanulod, hogy hogyan kapcsolódik az adatbázishoz a Django, és hogyan tárol benne adatokat. Ugorjunk fejest!

## Mi a QuerySet?

A QuerySet lényegében egy lista, amely egy bizonyos Model objektumait tartalmazza. A QuerySetek segítségével tudsz adatot kinyerni az adatbázisból, szűrheted és sorba rendezheted.

A legkönnyebb, ha példákon keresztül tanulod meg. Próbáljuk csak ki!

## Django shell

Nyisd meg a lokális konzolodat (nem a PythonAnywhere-ét), és gépeld be ezt a parancsot:

    (myvenv) ~/djangogirls$ python manage.py shell
    

Ezt fogod látni:

    (InteractiveConsole)
    >>>
    

Most a Django interaktív konzoljában vagy. Olyasmi, mint a Python prompt, csak egy kis extra Django varázslattal :) Természetesen itt is használhatod az összes Python parancsot.

### Az összes objektum

Először is próbáljuk meg az összes posztot megjeleníteni. A következő paranccsal tudod megtenni:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

Hoppá, egy hiba! Azt mondja, hogy nincs olyan, hogy Post. Igaza van -- elfelejtettük importálni!

    >>> from blog.models import Post
    

Ez egyszerű: importáljuk a `Post` modellt a `blog.models`-ből. Próbáljuk meg újra megjeleníteni a Post-okat:

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>]>
    

Egy lista a posztokból, amiket korábban megírtál! Ezeket még a Django admin felületén hoztad létre. Viszont ugyanezt meg tudod tenni a Python segítségével is. De vajon hogyan?

### Objektum létrehozása

Így hozhatsz létre egy új Post objektumot az adatbázisodban:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

De az egyik összetevő hiányzik: a `me`. Az `User` (felhasználó) modell egy instance-át kell megadnunk author-ként (szerző). Hogy tudjuk ezt megcsinálni?

Először importáljuk az User modellt:

    >>> from django.contrib.auth.models import User
    

Milyen felhasználók vannak az adatbázisban? Próbáld meg ezt:

    >>> User.objects.all()
    <QuerySet [<User: ola>]>
    

Ez a superuser, amit korábban hoztál létre! Most vegyük ennek a felhasználónak egy instance-ét:

    me = User.objects.get(username='ola')
    

Ahogy láthatod, most hozzájutottunk (`get`) egy `User`-hez, `username`-mel (felhasználónév), ami 'ola'-val egyenlő. Szuper! Természetesen itt a saját felhasználónevedet kell beírnod.

Most pedig végre létrehozhatjuk a posztot:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Hurrá! Meg akarod nézni, hogy működött-e?

    >>> Post.objects.all()
    <QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
    

Ott is van, egy újabb poszt a listában!

### Hozz létre még néhány posztot

A móka kedvéért hozz létre még 2-3 posztot, hogy lásd, hogyan működik. Ha ez megvan, továbbléphetsz a következő részre.

### Objektumok filterezése

A QuerySet-ek egyik nagy előnye, hogy filterezhetjük (szűrhetjük) őket. Mondjuk le szeretnénk kérdezni az összes posztot, amit az ola User írt. Itt a `filter`-t fogjuk használni az `all` helyett a `Post.objects.all()`-ban. A zárójelek között megadhatjuk, hogy milyen feltétel(ek)nek kell teljesülnie ahhoz, hogy egy blogposzt bekerülhessen a querysetünkbe. Ebben az esetben az `author` (szerző) egyenlő `me`-vel (én). Ezt a Django-ban így írjuk le: `author=me`. Most így néz ki a kódunk:

    >>> Post.objects.filter(author=me)
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>

    

És ha össze szeretnénk gyűjteni minden olyan posztot, aminek a `title` (cím) mezőjében szerepel a 'title' szó?

    >>> Post.objects.filter(title__contains='title')
    <QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
    

> **Note** A `title` és a `contains` (vagyis 'tartalmaz') között két underscore karakter (`_`) van. A Django ORM ezt a szintaxist használja arra, hogy elkülönítse a mezők neveit ("title") a műveletektől vagy filterektől ("contains"). Ha csak egy underscore-t használt, egy ilyen hibát fogsz kapni: "FieldError: Cannot resolve keyword title_contains" (kb "Mezőhiba: a title_contains kulcsszó nem található").

Megkaphatod az összes közzétett poszt listáját is. Ezt úgy tudod megtenni, hogy az összes poszt között szűrsz azokra, amiknél be van állítva múltbéli `published_date` (vagyis közzététel dátuma):

    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

Sajnos az a poszt, amit a Python konzolban hoztunk létre, még nem lett közzétéve. De ezen könnyen változtathatunk! Először is, hozzá kell férnünk a poszt instance-éhez, amit közzé szeretnénk tenni:

    >>> post = Post.objects.get(title="Sample title")
    

Aztán közzétesszük a `publish` methoddal!

    >>> post.publish()
    

Most próbáld meg újra lekérdezni a közzétett posztok listáját (nyomd meg háromszor a felfelé nyilat, és nyomj `enter`t):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    <QuerySet [<Post: Sample title>]>
    

### Objektumok sorbarendezése

A QuerySetek segítségével sorba is rendezheted az objektumok listáját. Először próbáljuk meg a létrehozás dátuma (`created_date` mező) alapján rendezni őket:

    >>> Post.objects.order_by('created_date')
    <QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
    

Meg is fordíthatjuk a sorrendet, ha az elejére egy `-` jelet teszünk:

    >>> Post.objects.order_by('-created_date')
    <QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
    

### QuerySetek összefűzése

A QuerySeteket kombinálhatod is, ha összefűződ őket (**chaining**):

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Ez egy nagyon hatékony módszer, és a segítségével bonyolult query-ket írhatsz.

Remek! Most már készen állsz a következő részre! Hogy kilépj a shellből, gépeld be ezt:

    >>> exit()
    $
