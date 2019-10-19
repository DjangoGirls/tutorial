# Àwọn àwòṣe Django

Ohun tí a fẹ́ ṣẹ̀dá ní báyìí jẹ́ nnkan kan tí yíò tọ́jú gbogbo àwọn àròkọ tó wà nínú blog wa. Ṣùgbọ́n láti lè ṣe ìyẹn, a nílò láti sọ̀rọ̀ díẹ̀ nípa àwọn nnkan tí a n pè ní `objects` (ohun-èlò).

## Àwọn Ohun-èlò

Ìlànà kan wà nínú kóòdù kíkọ tí a n pè ní `object-oriented programming` (kóòdù kíkọ tó dá lórí ohun-èlò). Èrò náà ni wípé dípò kíkọ gbogbo nnkan bíi ìtòtẹ̀léra àwọn kóòdù tó lè súni kan, a lè ṣe àwòṣe àwọn nnkan kí a sì ṣàlàyé bí wọ́n ṣe máa ṣiṣẹ́ pẹ̀lú ara wọn.

Nítorí náà, kíni ohun-èlò kan? Ó jẹ́ àkójọ àwọn ohun ìdánimọ̀ àti àwọn iṣẹ́ kan. Ó ṣàjèjì, ṣùgbọ́n a ó fún ọ ní àpẹẹrẹ kan.

Tí a bá fẹ́ ṣe àwòṣe ológbò kan, a óò ṣẹ̀dá ohun-èlò `Cat` (Ológbò) kan tó ní àwọn ohun ìdánimọ̀ bíi `color` (àwọ̀), `age` (ọjọ́ orí), `mood` (ìṣesí) (bíi ìdùnnú, ìbànújẹ́, tàbí oorun ;)), àti `owner` (oníǹkan) (èyí tí a lè yàn ohun-èlò `Person` (Ènìyàn) kan – tàbí bóyá, ní ti ológbò tó sọnù kan, ohun ìdánimọ̀ yìí lè jẹ́ òfìfo).

Lẹ́yìn náà, `Cat` (Ológbò) náà ní àwọn iṣẹ́ kan: `purr` (kùn), `scratch` (èékánná híha), tàbí `feed` (oúnje) (ní èyí tí, a óò fún ológbò náà ní `CatFood` (Oúnjẹ Ológbò) kan, èyí tó lè jẹ́ ohun-èlò ọ̀tọ̀ kan pẹ̀lú àwọn ohun ìdánimọ̀, bíi `taste` (ìtọ́wò)).

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
    

Ní pàtàkì, èrò náà ni láti ṣàpèjúwe àwọn nnkan gidi ní kóòdù pẹ̀lú àwọn ohun ìdánimọ̀ (tí a n pè ní `object properties` (àwọn ohun ìdánimọ̀ ohun-èlò)) àti àwọn iṣẹ́ (tí a n pè ní `methods` (ọ̀nà)).

Báwo ni a ṣe máa ṣe àwòṣe àwọn àròkọ blog nígbà náà? A fẹ́ kọ́ blog kan, àbí bẹ́ẹ̀ kọ?

A ní láti dáhùn ìbéèrè: Kíni àròkọ blog kan? Àwọn ohun ìdánimọ̀ wo ló yẹ kó ní?

Ó dáa, ó dájú pé àròkọ blog wa nílò awọn ọ̀rọ̀ kan pẹ̀lú àkóónú rẹ̀ àti àkọlé kan, àbí bẹ́ẹ̀ kọ? Yíò tún dára láti mọ ẹni tó kọ ọ́ – nítorí náà a nílò olùdásílẹ̀ kan. Ní ìparí, a fẹ́ mọ ìgbà tí a ṣẹ̀dá àti ṣàtẹ̀jáde àròkọ náà.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

Kíni irú àwọn nnkan tí a lè ṣe pẹ̀lú àròkọ blog kan? Yíò dára láti ní `method` (ọ̀nà) kan tí yíò ṣàtẹ̀jáde àròkọ náà, àbí bẹ́ẹ̀ kọ?

Nítorí náà a ó nílò ọ̀nà `publish` (tẹ̀jáde) kan.

Nígbà tí a ti mọ ohun tí a fẹ́ ṣe, jẹ́ ká bẹ̀rẹ̀ ṣíṣe àwòṣe rẹ̀ ní Django!

## Àwòṣe Django

Pẹ̀lú mímọ ohun tí ohun-èlò (object) kan jẹ́, a lè ṣẹ̀dá àwòṣe Django kan fún àròkọ blog wa.

Àwòṣe kan ní Django jẹ́ irú ohun-èlò àkànṣe kan – ó gba títọ́jú sínú `database` (àkójọpọ̀ dátà) náà. Àkójọpọ̀ dátà kan jẹ́ àkójọ dátà kan. Èyí jẹ́ ààyè kan tí o ti lè tọ́jú àwọn ìròyìn nípa àwọn aṣàmúlò, àwọn àròkọ blog rẹ, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ. A ó máa lo àkójọpọ̀ dátà SQLite kan láti tọ́jú dátà wa. Èyí jẹ́ ètò àkójọpọ̀ dátà Django ìpìlẹ̀ – yóò tó fún wa ní báyìí.

Ó lè ronú nípa àwòṣe kan nínú àkójọpọ̀ dátà náà gẹ́gẹ́ bíi pẹpẹ ìṣirò (spreadsheet) kan pẹ̀lú àwọn ìlà òòró (ààyè) àti àwọn ìlà ìbú (dátà).

### Ṣíṣẹ̀dá ètò kan

Láti mú kí gbogbo nnkan wà létòlétò, a ó ṣẹ̀dá ètò ọ̀tọ̀ kan sínú iṣẹ́ wa. Ó dára púpọ̀ láti ní gbogbo nnkan létòlétò láti ìbẹ̀rẹ̀pẹ̀pẹ̀. Láti ṣẹ̀dá ètò kan, a nílò láti ṣe àṣẹ tó tẹ̀lé yìí nínú console náà (láti àkójọpọ̀ fáìlì `djangogirls` níbi tí fáìlì `manage.py` wà):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Ìwọ yíò ṣàkíyèsí pé a ti ṣẹ̀dá àkójọpọ̀ fáìlì `blog` tuntun kan àti pé ó ti ní àwọn fáìlì bíi mélòó kan. Ó yẹ kí àwọn àkójọpọ̀ fáìlì àti àwọn fáìlì inú iṣẹ́ wa rí báyìí:

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
    

Lẹ́yìn ṣíṣẹ̀dá ètò kan, a tún nílò láti sọ fún Django pé ó yẹ kó lò ó. A máa ṣe ìyẹn nínú fáìlì `mysite/settings.py` náà -- ṣí i nínú olóòtú kóòdù rẹ. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. Nítorí náà, ó yẹ kí àbájáde náà rí báyìí:

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

### Ṣíṣẹ̀dá àwòṣe àròkọ blog kan

Nínú fáìlì `blog/models.py` náà, a máa ṣàlàyé gbogbo àwọn ohun-èlò tí a n pè ní `Models` (Àwọn àwòṣe) – èyí jẹ́ ààyè kan tí a ó ti ṣàlàyé àròkọ blog wa.

Jẹ́ ká ṣí `blog/models.py` nínú olóòtú kóòdù náà, yọ gbogbo nnkan kúrò nínú rẹ̀, kí a sì tẹ kóòdù báyìí:

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

> Rí dájú pé o lo àmì-dáàṣì-ìsàlẹ̀ (`_`) méjì ní ẹ̀gbẹ́ kọ̀ọ̀kan `str`. Ìlànà yìí máa ń jẹ́ lílò lọ́pọ̀ ìgbà ní Python àti pé nígbà mìíràn a tún máa n pè wọ́n ní "dunder" (kékeré fún "double-underscore" (àmì-dáàṣì-ìsàlẹ̀ méjì)).

Ó n dẹ́rù bà ọ́, àbí bẹ́ẹ̀ kọ? Ṣùgbọ́n má dààmú – a ó ṣàlàyé ohun tí àwọn ìlà wọ̀nyí túmọ̀ sí!

Gbogbo àwọn ìlà tó n bẹ̀rẹ̀ pẹ̀lú `from` tàbí `import` jẹ́ àwọn ìlà tó n ṣàfikún àwọn nnkan kan láti àwọn fáìlì mìíràn. Nítorí náà, dípò ṣíṣe àdàkọ àwọn nnkan kannáà nínú gbogbo fáìlì, a lè ṣàfikún àwọn apá kan pẹ̀lú `from ... import ...`.

`class Post(models.Model):` – ìlà yìí yíò ṣàlàyé àwòṣe wa (ó jẹ́ `object` (ohun-èlò) kan).

- `class` jẹ́ àkànṣe ọ̀rọ̀ kan tó fi hàn pé a n ṣàlàyé ohun-èlò kan.
- `Post` jẹ́ orúkọ àwòṣe wa. A lè fún ní orúkọ mìíràn (ṣùgbọ́n a gbọ́dọ̀ yẹra fún àwọn àkànṣe ẹyọ ọ̀rọ̀ àti lẹ́tà aláàyè). Máa bẹ̀rẹ̀ orúkọ kíláàsì kan pẹ̀lú lẹ́tà-ńlá kan ní gbogbo ìgbà.
- `models.Model` túmọ̀ sí pé Post (Àròkọ) náà jẹ́ Àwòṣe Django kan, nítorí náà Django mọ̀ wípé ó yẹ kó gba títọ́jú sínú àkójọpọ̀ dátà náà.

Ní báyìí, a ó ṣàlàyé àwọn ohun ìdánimọ̀ tí a tí n sọ̀rọ̀ nípa: `title` (àkọlé), `text` (ọ̀rọ̀), `created_date` (ọjọ́ ṣíṣẹ̀dá), `published_date` (ọjọ́ títẹ̀jáde) and `author` (olùdásílẹ̀). Láti ṣe ìyẹn, a ní láti ṣàlàyé irú ààyè kọ̀ọ̀kan (Ṣé ọ̀rọ̀ ni? Nọ́mbà kan? Ọjọ́ kan? Ìbáṣepọ̀ kan pẹ̀lú ohun-èlò mìíràn, bíi Aṣàmúlò kan?)

- `models.CharField` – báyìí ní o ṣe máa ṣàlàyé ọ̀rọ̀ pẹ̀lú iye àwọn ẹyọ ọ̀rọ̀ tó ní ààlà kan.
- `models.TextField` – èyí wà fún ọ̀rọ̀ gígùn láìsí ààlà kan. Yíò dára láti lò fún àkóónú àròkọ blog, àbí bẹ́ẹ̀ kọ?
- `models.DateTimeField` – èyí jẹ́ ọjọ́ àti àkókò kan.
- `models.ForeignKey` – èyí jẹ́ ìtọ́ka kan sí àwòṣe mìíràn.

A kò ní ṣàlàyé gbogbo kóòdù níbí nítorí pé yíò gba àkókò púpọ̀. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

Kíni nípa `def publish(self):`? Èyí gan-an ni ọ̀nà `publish` (tẹ̀jáde) tí a n sọ̀rọ̀ nípa tẹ́lẹ̀. `def` túmọ̀ sí pé èyí jẹ́ iṣẹ́/ọ̀nà kan àti pé `publish` jẹ́ orúkọ ọ̀nà náà. O lè ṣàyípadà orúkọ ọ̀nà náà tí o bá fẹ́. Òfin orúkọ sísọ náà ní pé a máa lo lẹ́tà kékeré àti àwọn àmì-dáàṣì-ìsàlẹ̀ dípò àwọn àlàfo. Fún àpẹẹrẹ, a lè pe ọ̀nà kan tí yíò ṣe ìṣirò ìpíndọ́gba iye (average price) ní `calculate_average_price`.

Àwọn ọ̀nà sábà máa ń dá nnkan kan padà (`return`). Àpẹẹrẹ bẹ́ẹ̀ wà nínú ọ̀nà `__str__` náà. Ní àpẹẹrẹ yìí, nígbà tí a bá pe `__str__()`, a ó gba ọ̀rọ̀ kan (**string**) pẹ̀lú àkọlé Àròkọ kan.

Tún ṣàkíyèsí pé `def publish(self):` àti `def __str__(self):` ní ìtẹ̀wọnú sínú kíláàsì wa. Nítorí pé lẹ́tà aláàyè nípa nínú Python, a nílò láti ṣe ìtẹ̀wọnú àwọn ọ̀nà wa sínú kíláàsì náà. Bí bẹ́ẹ̀ kọ́, àwọn ọ̀nà náà kò ní jẹ́ ti kíláàsì náà, o sì lè rí àwọn ìhùwàsí àìròtẹ́lẹ̀.

Tí nnkan kan kò bá tíì yé ọ nípa àwọn àwòṣe, má tijú láti béèrè lọ́wọ́ olùkọ́ rẹ! A mọ̀ pé ó ṣòro, pàápàá nígbà tí o bá n kẹ́kọ̀ọ́ nípa ohun tí àwọn ohun-èlò àti àwọn iṣẹ́ jẹ́ lásìkò kannáà. Ṣùgbọ́n a nírètí pé kò dàbí idán lójú ẹ mọ́ báyìí!

### Ṣẹ̀dá àwọn tábìlì fún àwọn àwòṣe nínú àkójọpọ̀ dátà rẹ

Ìgbésẹ̀ ìkẹyìn níbí ni láti ṣàfikún àwòṣe tuntun wa sínú àkójọpọ̀ dátà wa. Lákọ̀ọ́kọ́, a ní láti mú kí Django mọ wípé a ní àwọn ìyípadà kan nínú àwòṣe wa. (A ṣẹ̀ṣẹ̀ ṣẹ̀dá rẹ̀!) Lọ sí fèrèsé console rẹ kí o sì tẹ `python manage.py makemigrations blog`. Yóò rí báyìí:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Àkíyèsí:** Rántí láti tọ́jú àwọn fáìlì tí o ṣàtúnṣe náà. Bí bẹ́ẹ̀ kọ́, kọ̀mpútà rẹ yíò ṣiṣẹ́ lórí ẹyà ti tẹ́lẹ̀ náà èyí tó lè fún ọ ní àwọn ìròyìn àṣìṣe láìròtẹ́lẹ̀.

Django ti ṣètò fáìlì migration (ìyípòpadà) kan fún wa tí a ní láti lò sí àkójọpọ̀ dátà wa. Tẹ `python manage.py migrate blog`, tó sì yẹ kí èsì náà rí báyìí:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

Inú wa dùn! Àwòṣe Post (Àròkọ) wa ti wà nínú àkójọpọ̀ dátà wa! Yíò dára láti rí i, àbí bẹ́ẹ̀ kọ? Fò sí àkòrí tó kàn láti wo bí Post (Àròkọ) rẹ ṣe rí!