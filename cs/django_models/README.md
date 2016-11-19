# Django modely

Nyní chceme vytvořit něco, co bude ukládat všechny příspěvky na náš blog. Ale abychom to mohly udělat, musíme si nejdříve říct něco o `objektech`.

## Objekty

V programování se používá koncept zvaný `objektově orientované programování`. Tato myšlenka předpokládá, že místo psaní všeho jako nudný sled programovacích instrukcí můžeme modelovat věci a definovat, jak komunikují mezi sebou navzájem.

Co tedy je objekt? Je to kolekce vlastností a činností. Zní to divně, ale dáme ti příklad.

Pokud chceme modelovat kočku, vytvoříme objekt `kočka`, který má nějaké vlastnosti, například `barva`, `věk`, `nálada` (ta je dobrá, špatná, ospalá ;)), `vlastník` (který je objektem `osoba` nebo je možný případ zatoulané kočky, kde bude tato vlastnost prázdná).

`Kočka` má také některé akce: `předení`, `škrábání` nebo `žraní` (v němž dáváme kočce nějaké `kočičí granule`, které by mohlo být samostatný objekt s vlastnostmi, například `chuť`).

```
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
```  

Základní představa je popsat skutečné věci v kódu vlastnostmi (nazývané `vlastnosti objektu/object properties`) a akcemi (nazývané `metody/methods`).

Jak tedy bude vypadat model blogu?

Musíme odpovědět na otázku: Co je blog post/příspěvek? Jaké by měl mít vlastnosti?

Určitě budeme v naše blogu potřebovat nějaký text s jeho obsahem a titulkem, že? Bylo by také dobré vědět, kdo příspěvek napsal, takže potřebujeme autora. Nakonec také chceme vědět, kdy byl příspěvek vytvořen a publikován.

```
    Post
    --------
    title
    text
    author
    created_date
    published_date
```  

Jaký druh věcí můžeme s příspěvkem dělat? Bylo by hezké mít nějakou `metodu`, která publikuje příspěvek.

Takže budeme potřebovat metodu `publish`.

Vzhledem k tomu, že už víme, čeho chceme dosáhnout, můžeme začít modelování v Djangu!

## Django model

Nyní víme, jaký objekt chceme vytvořit, takže můžeme přistoupit k tvorbě Django modelu pro náš příspěvek v blogu.

Model v Django je zvláštní druh objektu - který je uložen v `databázi`. Databáze je soubor dat. Je to místo, kam budeš ukládat informace o uživatelích a tvých příspěvcích v blogu, atd. Budeme používat SQLite databázi k ukládání dat. To je výchozí databázový adaptér v Djangu – to nám bude nyní stačit.

Model v databázi si lze představit jako tabulku s řádky (data) a sloupci (údaje).

### Vytvoření aplikace

Abychom udržely pořádek, vytvoříme si samostatnou aplikaci uvnitř našeho projektu. Je velmi příjemné mít všechno zorganizované od samého začátku. Chceš-li vytvořit novou aplikaci, je třeba spustit následující příkaz v konzoli (z `djangogirls` adresáře, kde je `manage.py` soubor):

```
    (myvenv) ~/djangogirls$ python manage.py startapp blog
```  

Zjistíš, že nový adresář `blog` nyní obsahuje řadu souborů. Adresáře a soubory v našem projektu by měly vypadat následovně:

```
    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py
```    

Po vytvoření aplikace musíš také Djangu říct, že by ji měl použít. Uděláme to v souboru `mysite/settings.py`. Musíme najít `INSTALLED_APPS` a přidat řádek, který bude obsahovat `"blog",` `)`. Takže konečná konfigurace by měla vypadat takto:

```python
    INSTALLED_APPS = (
         'django.contrib.admin',
         'django.contrib.auth',
         'django.contrib.contenttypes',
         'django.contrib.sessions',
         'django.contrib.messages',
         'django.contrib.staticfiles',
         'blog',
    )
```  

### Vytvoření modelu pro blog post

V souboru `blog/models.py` budeme definovat všechny objekty nazývané `modely` - na tomto místě budeme definovat náš blog post.

Otevři `blog/models.py`, odstraň vše, co v něm je, a vlož následující kód:

```python
    from django.db import models
    from django.utils import timezone


    class Post(models.Model):
        author = models.ForeignKey('auth.User')
        title = models.CharField(max_length=200)
        text = models.TextField()
        created_date = models.DateTimeField(
                default=timezone.now)
        published_date = models.DateTimeField(
                blank=True, null=True)

        def publish(self):
            self.published_date = timezone.now()
            self.save()

        def __str__(self):
            return self.title
```

> Dvakrát si zkontroluj, že jsi použila dva znaky podtržítko(`_`) na každé straně `str`. Tato konvence se v Pythonu používá často. Někdy je také nazýváme "dunder" (zkratka pro "Double-UNDERscore").

Vypadá to děsivě, že? Ale žádný strach, vysvětlíme ti, co tyto řádky znamenají!

Všechny řádky začínající `from` nebo `import` jsou řádky, které přidávají některé kousky z jiných souborů. Takže namísto kopírování a vkládání stejných věcí v každém souboru, můžeš zahrnout některé části s `from... import...`.

`class Post(models.Model):` - Tento řádek definuje náš model (Jedná se o `objekt`).

*   `class` je speciální klíčové slovo, které říká, že definujeme objekt.
*   `Post` je jméno našeho modelu, můžeme mu dát jiné jméno (ale musíme se vyvarovat speciálních znaků a bílých znaků). Název třídy vždy začínej velkým písmenem.
*   `models. Model` znamená, že Post je Django Model, takže Django ví, že by to mělo být uloženo v databázi.

Nyní definujeme vlastnosti, mluvily jsme o: `title`, `text`, `created_date`, `published_date` a `autor`. To uděláš tak, že definuješ typ každého pole (Je to text? Číslo? Datum? Vztah k jinému objektu, například uživateli?).

*   `models. CharField` - takto definuješ text s omezeným počtem znaků.
*   `models. TextField` - toto použiješ na dlouhý text bez omezení. To zní ideálně pro obsah blog post, ne?
*   `models. DateTimeField` - definuje datum a čas.
*   `models. ForeignKey` - definuje odkaz do jiného modelu.

Nebudeme vysvětlovat každý kousek kódu, vzhledem k tomu, že by trvalo příliš dlouho. Měla bys se podívat do Django dokumentace, pokud se chceš dozvědět víc o polích modelu a jak definovat jiné věci než výše uvedené (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

Co je `def publish(self):`? Je to `publish` metoda, o které jsme mluvili dříve. `def` znamená, že definuješ funkci/metodu, a `publish` je název metody. Název metody můžeš změnit, pokud chceš. Pravidlo pro pojmenovávání je, že používáme malá písmena a podtržítka místo mezer. Například metoda, která vypočítá průměrnou cenu, se bude jmenovat `calculate_average_price`.

Metody často něco `vrací/return`. Zde je příklad metoda `__str__`. V tomto případě, když zavoláme metodu `__str__()`, dostaneme text (**řetězec/string**) s názvem Postu.

Pokud ti něco stále ještě není jasné o modelech, neváhej se zeptat svého kouče! Víme, že je to složité, zvláště, když se dozvíte, co jsou objekty a funkce takto naráz. Doufejme, že to je nyní pro tebe trochu méně magické!

### Vytvoření tabulek pro modely v databázi

V posledním kroku přidáš náš nový model do databáze. Nejprve musíme dát Djangu vědět, že mám nějaké změny v modelu (které jsme právě vytvořily!). Napiš `Python manage.py makemigrations blog`. Celý příkaz bude vypadat takto:

```
    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post
```  

Django pro nás připravil soubor migrace, který budeme muset aplikovat na naši databázi. Napiš `Python manage.py migrate blog` a výstup by měl vypadat takto:

```
    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
```  

Hurá! Náš Post model je nyní v naší databázi! Bylo by hezké vidět ho v akci, že ano? Přeskoč na další kapitolu a podívej se, jak vypadá tvůj příspěvek!
