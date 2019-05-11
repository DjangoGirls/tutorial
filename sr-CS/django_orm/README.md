# Django ORM i Query postavke

U ovom poglavlju ćemo naučiti kako se Django povezuje sa bazom podataka i kako čuva te podatke. Hajde da to otkrijemo!

## Šta su to Query postavke?

Query postavke (eng. QuerySets) su lista objekata za dati model. One omogućavaju da čitate podatke iz baze, da ih filtrirate i sortirate.

Najlakše je da to naučite na primeru. Hajde da to pokušamo, hoćemo li?

## Django shell

Otvorite Vašu lokalnu konzolu (ne onu na PythonAnywhere) i ukucajte ovu komandu:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Trebalo bi da dobijete ovo:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Sada ste u Django interaktivnoj konzoli. To je nešto slično Python konzoli, samo sa dodatnim Django efektima :) Ovde takođe možete da koristite Python naredbe.

### Svi objekti

Hajde prvo da pokušamo da prikažemo sve naše postove. To možete da uradite sledećom komandom:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Pojavila se greška koja nam govori da post ne postoji. To je tačno - zaboravili smo da ga prvo uvezemo!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Uvešćemo model `Post` iz `blog.models`. Hajde da sada ponovo pokušamo da prikažemo sve postove:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Ovo je lista postova koje smo ranije kreirali. To smo učinili koristeći Django admin interfejs. Ali sada želimo da kreiramo nove postove koristeći Python. Kako ćemo to da uradimo?

### Kreirajte objekat

Ovo je način na koji kreirate novi post objekat u bazi podataka:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ali nam nešto ovde nedostaje: `mi`. Potrebno je da prosledimo instancu modela `korisnik` kao autora. Kako da to uradimo?

Hajde da prvo uvezemo model korisnika:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Koje sve korisnike imamo u našoj bazi podataka? Pokušajte ovo da ukucate:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Ovo je super korisnik, kog smo kreirali ranije! Hajde da sada dobijemo instancu korisnika (prilagodite ovu liniju tako da u njoj piše Vaše korisničko ime):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Kao što možete da vidite, sada dobijamo `korisnika` sa `korisničkim imenom` 'ola'. Odlično!

Sada konačno možemo da kreiramo naš post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Uspeli smo! Želite li da proverite da li radi?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Evo ga, još jedan post na listi!

### Dodajte još postova

Sada možete i da se malo zabavite i da dodajete još postova kako biste razumeli kako ovo funkcioniše. Dodajte još 2-3 posta i pređite na naredni deo.

### Filtrirajte objekte

Važan deo Query postavki je mogućnost da ih filtrirate. Hajde da pokušamo da pronađemo sve postove koje je kreirao korisnik "ola". Koristićemo `filter` umesto `all` u `Post.objects.all()`. U zagradama navodimo uslove koje postovi treba da zadovolje kako bi završili u našim query stavkama. U ovom slučaju, uslov je da `autor` treba da bude isto što i `ja`. Način na koji ćemo to predstaviti U Django-u je `author=me`. Sada, naš deo koda izgleda ovako:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Ili možda želimo da vidimo sve postove koji sadrže reč "naslov" (eng. title) u `naslovu`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Napomena** Postoje dve donje crte (`_`) između `naslova` i `sadržaja`. Django ORM korisnici koriste to pravilo da razdvoje nazive ("title") i operacije ili filtere ("contains"). Ukoliko koristite samo jednu donju crtu, dobićete grešku koja govori da ne posotje te ključne reči (eng. "FieldError: Cannot resolve keyword title_contains").

Možete takođe da dobijete listu svih objavljenih postova. To radimo filtriranjem svih postova koji imaju `published_date` podešen u prošlosti:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Nažalost, post koji smo dodali pomoću Python konzole nije još uvek objavljen. Ali, to možemo da promenimo! Prvo je potrebno da dobijemo instancu željenog posta:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

A zatim da ga objavimo pomoću našeg `publish` metoda (metoda za objavljivanje):

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Pokušajte sada da ponovo dobijete listu objavljenih postova (pritisnite tri puta strelicu na gore, a zatim pritisnite `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Sortiranje objekata

Query stavke Vam takođe omogućavaju da sortirate listu objekata. Hajde da pokušamo da ih sortiramo pomoću `created_date` polja:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Možemo takođe i da obrnemo redosled sortiranog niza, dodavanjem `-` na samom početku:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Kompleksni upiti i ulančane metode

Kao što ste i videli, neke metode iz `Post.objects` vraćaju query stavke. Iste metode se zapravo mogu pozivati i za querz stavke, nakon čega bi vraćale nove query stavke. Tako da, možete da to kombinujete **ulančavanjem** tih metoda zajedno:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Ovo je prilično moćno svojstvo i omogućava Vam da pišete prilično kompleksne upite.

Odlično! Sada ste spremni za sledeći deo! Da zatvorite shell, ukucajte sledeće:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```