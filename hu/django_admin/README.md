# Django admin

Az előbb elkészítettük a bejegyzések modelljeit. Ahhoz, hogy létrehozhassuk, szerkeszthessük és törölhessük őket, a Django admint fogjuk használni.

Nyisd meg a `blog/admin.py` fájlt, és cseréld ki a benne lévő kódot erre:

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Amint láthatod, importáljuk az előző fejezet végén definiált Post modellt, vagyis elérhetővé tesszük ebben a fájlban is. Hogy a modell látszódjon az admin oldalon, regisztrálnunk kell a `admin.site.register(Post)` sorral.

Most nézzük meg, hogy néz ki a Post modell. Ne felejtsd el futtatni a `python manage.py runserver` parancsot a konzolban, hogy elindítsd a webszervert. Írd be a böngészőben a http://127.0.0.1:8000/admin/ címet. Egy ilyen login oldalt fogsz látni:

![Login page][1]

 [1]: images/login_page2.png

A bejelentkezéshez létre kell hoznod egy *superuser*-t - egy olyan felhasználót, akinek mindenhez van hozzáférése az oldalon. Menj vissza a parancssorba, és írd be a `python manage.py createsuperuser` parancsot, majd nyomj entert.

> Ne felejtsd, hogy ahhoz hogy új parancsokat tudj lefuttatni, miközben a webszerver fut, új terminál ablakot kell nyitnod és abban aktiválnod a virtualenvet. Erről <b>Az első Django projekted!</b> fejezetben, a <b>Webszerver elindítása</b> szakaszban volt szó.

A következő lépésekben meg kell adnod egy felhasználónevet (ne használj nagybetűket és szóközt), emailcímet és jelszót. Ne ijedj meg, ha nem látod a jelszót, amikor begépeled - ennek így kell lennie. Csak írd be, és nyomj `enter`t a folytatáshoz. Az outputnak így kell kinéznie (természetesen a felhasználónév és az email az lesz, amit te adtál meg):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Térj vissza a böngészőbe. Jelentkezz be a superuser adataival, amit az előbb adtál meg; ha minden jól megy, a Django admin dashboardra jutsz.

![Django admin][2]

 [2]: images/django_admin3.png

Nyisd meg a Posts részt, és kísérletezz vele egy kicsit. Hozz létre 5-6 blogposztot. Ne törődj a tartalommal - nyugodtan másolj be valami szöveget ebből a tutorialból, hogy időt spórolj :).

Állíts be legalább két-három posztnak (de ne mindegyiknek!) egy publish date-et (megjelenési dátumot). Később jól fog jönni.

![Django admin][3]

 [3]: images/edit_post3.png

Ha szeretnél többet megtudni a Django adminról, a Django dokumentációban tudsz olvasni róla: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

Itt az ideje, hogy kávézz vagy teázz egyet, vagy egyél valamit, hogy új erőre kapj. Elkészítetted az első Django modelledet - megérdemelsz egy kis lazítást!