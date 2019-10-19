# Django modeli

Ono što želimo sada da napravimo je nešto što će da skladišti sve postove sa našeg bloga. Da bismo to uradili, potrebno je da se upoznamo sa stvarima koje se nazivaju `objekti`.

## Objekti

U programiranju postoji jedan koncept koji se naziva `objektno-orijentisano programiranje`. Ideja je da možemo da modelujemo stvari i definišemo način na koji interaguju međusobno, umesto da pišemo sve kao deo jedne sekvence programskog koda.

Dakle, šta je to objekat? To je skup svojstava i akcija. Možda to zvuči čudno, ali daćemo Vam primer.

Ako želimo da modelujemo mačku, kreiraćemo objekat `Mačka` koji ima svojstva kao što su `boja`, `godine`, `raspoloženje` (npr. dobro, loše ili pospano ;)) i `vlasnik` (što može biti pripisano objektu `Osoba`, ili možda u slučaju mačke lutalice, ovo može da ostane prazno polje).

Zatim, `Mačka` ima određene akcije: `predenje`, `grebanje` ili `hranjenje` (u tom slučaju ćemo da damo mački `HranuZaMačke`, što može da bude poseban objekat sa svojstvima kao što je npr. `ukus`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

U suštini, ideja je da opišemo realne stvari u kodu pomoću svojstava (koja se nazivaju `svojstva objekta`) i akcija (koje se nazivaju `metode`).

Kako ćemo u tom slučaju da modelujemo postove na blogu? Želimo da napravimo blog, zar ne?

Moramo da odgovorimo na pitanje: šta je to zapravo blog post? Koja svojstva bi trebalo da ima?

Pa, naš blog sigurno treba da ima tekst sa svojim sadržajem i naslovom, zar ne? Takođe, bilo bi dobro da znamo ko je napisao tekst - znači potreban nam je autor. I na kraju, želimo da znamo kada je post kreiran i objavljen.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Kakve sve stvari mogu da se urade sa postom? Bilo bi lepo da postoji neki `metod` koji objavljuje post, zar ne?

To znači da će nam trebati metod za `objavljivanje`.

Pošto znamo šta želimo da postignemo, hajde da krenemo da to modelujemo u Django-u!

## Django model

Ako znamo šta nam je objekat, možemo da kreiramo Django model za naš blog post.

Model u Django-u je posebna vrsta objekta i čuva se u `bazi podataka`. To je skup podataka. Takoreći, to je mesto gde se skladište informacije o korisnicima, postovima itd. Za skladištenje naših podataka ćemo koristiti SQLite bazu podataka. To je podrazumevani Django adapter za bazu podataka i za sada nam je to sasvim dovoljno.

Možete da zamislite model u bazi podataka kao jednu veliku tabelu sa kolonama koje predstavljaju polja i redovima koji predstavljaju podatke.

### Kreiranje aplikacije

Kako bismo sve držali uredno, kreiraćemo posebnu aplikaciju unutar našeg projekta. Veoma je lepo imati sve organizovano od samog početka. Da bismo kreirali aplikaciju, potrebno je da pokrenemo sledeću komandu u konzoli (iz `djangogirls` direktorijuma, gde se nalazi fajl `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Primetićete da je kreiran novi `blog` direktorijum i da sadrži broj fajlova. Direktorijumi i fajlovi u našem projektu bi trebalo da izgledaju ovako:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

Nakon kreiranja aplikacije, moramo na neki način da kažemo Django-u da treba da je koristi. To radimo u fajlu `mysite/settings.py` - otvorite ga u editoru. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. Tako da, na kraju to treba da izgleda ovako:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### Kreiranje modela posta

U fajlu `blog/models.py` definišemo sve objekte koji se nazivaju `Modeli` - to je mesto u kom ćemo da definišemo naš blog post.

Hajde da otvorimo `blog/models.py` u editoru, uklonimo sve iz fajla i da napišemo kod koji izgleda ovako:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Proverite da li koristite dve donje crte (`_`) na svakoj strani `str`. Ova konvencija se često koristi u Python-u i ponekad to nazivamo "dunder" (skraćeno od "double-underscore").

Izgleda zastrašujuće, zar ne? Ali, ne brinite - objasnićemo Vam šta ove linije znače!

Sve linije koje počinju sa `from` ili `import` su linije koje dodaju neke bite iz drugih fajlova. Tako da, umesto da kopirate uvek istu stvar u svakom fajlu, sada možete da jednostavno uključite neke delove pomoću `from... import ...`.

`class Post(models.Model):` – ova linija definiše naš model (kao `objekat`).

- `class` je specijalna reč koja ukazuje na to da definišemo objekat.
- `Post` je ime našeg modela. Možemo da mu damo drugačiji naziv (ali moramo da izbegnemo specijalne karaktere i razmake). Uvek treba pisati ime klase velikim početnim slovom.
- `models.Model` znači da je Post u stvari Django Model, tako da Django zna da bi trebalo da ga sačuva u bazi podataka.

Zatim, definišemo svojstva o kojima smo pričali: `naslov`, `tekst`, `datum_kreiranja`, `datum_objave` i `autor`. Da bismo to uradili, potrebno je da definišemo tip svakog polja (da li je to tekst? Broj? Datum? Relacija sa drugim objektom, kao npr. korisnik?)

- `models.CharField` - ovo je način da definišete tekst sa ograničenim brojem karaktera.
- `models.TextField` - ovo je način da predstavite dug tekst, bez ograničenja. Zvuči savršeno za sadržaj posta, zar ne?
- `models.DataTimeField` - ovo predstavlja datum i vreme.
- `models.ForeignKey` - ovo je link do drugog modela.

Ovde nećemo objašnjavati svaku sitnicu u kodu, jer bi za to trebalo previše vremena. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

Šta je sa `def publish(self):`? Ovo je upravo metod za `objavljivanje` o kom smo pričali ranije. `def` znači da je u pitanju funkcija/metod, a `publish` je ime metoda. Ako želite, možete da ga promenite. Jedino pravilo je da koristite mala slova i donje crte umesto razmaka. Na primer, metod koji izračunava prosečnu cenu bi se mogao nazvati `calculate_average_price`.

Metodi često vraćaju nešto naredbom `return`. Postoji jedan primer toga u `__str__` metodu. U tom slučaju, kada pozovemo `__str__()` dobijamo tekst (**string**) sa naslovom posta.

Takođe, primetite da su i `def publish(self):` i `def __str__(self):` uvučeni unutar naše klase. Pošto je Python osetljiv na razmake, moramo da uvučemo metode unutar klase. U suprotnom, metodi neće pripadati klasi i može da se dogodi neko neočekivano ponašanje.

Ukoliko Vam nešto još uvek nije jasno u vezi sa modelima, slobodno pitajte svog mentora. Znamo da je komplikovano, naročito kada učite o objektima i funkcijama u isto vreme. Ali, nadamo se da sada vidite malo jasniju sliku!

### Kreiranje tabela za modele u Vašoj bazi podataka

U poslednjem koraku ćemo dodati naš novi model u bazu podataka. Prvo, moramo da obavestimo Django-a da imamo neke izmene u našem modelu. (Upravo smo ih napravili!) Idite na prozor sa konzolom i ukucajte `python manage.py makemigrations blog`. To bi trebalo da izgleda ovako:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Napomena:** Ne zaboravite da zapamtite fajlove koje izmenite. U suprotnom će Vaš računar da izvrši prethodnu verziju i mogu da se jave neke neočekivane greške.

Django je pripremio fajl za nas, koji sada treba da upotrebimo u našoj bazi podataka. Ukucajte `python manage.py migrate blog` i izlaz bi trebalo da izgleda ovako:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Uspeli smo! Naš post model se sada nalazi u bazi podataka! Bilo bi lepo da možemo da ga vidimo, zar ne? Pogledajte u sledećem poglavlju kako naš post sada izgleda!