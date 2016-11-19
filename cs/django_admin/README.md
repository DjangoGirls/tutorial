# Django admin

Chceš-li přidávat, upravovat a mazat příspěvky, které jsme právě vymodelovaly, použijeme Django admin.

Otevřeme soubor `blog/admin.py` a nahradíme jeho obsah následujícím kódem:

```python
    from django.contrib import admin
    from .models import Post

    admin.site.register(Post)
```  

Jak vidíš, importujeme (vkládáme) Post model definovaný v předchozí kapitole. Pro zviditelnění našeho modelu na admin stránce musíme zaregistrovat model pomocí `admin.site.register(Post)`.

OK, je čas se podívat na náš Post model. Nezapomeň spustit `Pythonu manage.py runserver` v konzoli www serveru. Přejdi do prohlížeče a zadej adresu http://127.0.0.1:8000/admin/. Uvidíš přihlašovací stránku jako je tato:

![Login page][1]

 [1]: images/login_page2.png

Chceš-li se přihlásit, musíš vytvořit *superusera* - uživatele, který má kontrolu nad celou webovou stránkou. Vrať se do příkazového řádku, zadej `python manage.py createsuperuser` a stiskni klávesu enter. Po zobrazení výzvy zadej své uživatelské jméno (malá písmena, bez mezer), e-mailovou adresu a heslo. Nedělej si starosti, že nevidíš heslo, které zadáváš - tak to má být. Jen ho napiš a stiskni `enter` pro pokračování. Výstup by měl vypadat takto (kde uživatelské jméno a e-mail by měly být tvé vlastní):

```
    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
```    

Vrať se do svého prohlížeče. Přihlas se pomocí pověření superuživatele, kterého jsi právě vytvořila; měla bys vidět Django admin dashboard/nástěnku.

![Django admin][2]

 [2]: images/django_admin3.png

Klikni na příspěvky/Posts a trochu si s nimi pohraj. Přidej pět nebo šest příspěvků blogu. Nedělej si starosti s obsahem - pro ušetření času můžeš jednoduše kopírovat a vložit nějaký text z tohoto kurzu :).

Ujisti se, že alespoň dva nebo tři příspěvky (ale ne všechny) mají nastavené datum publikování. Později to bude užitečné.

![Django admin][3]

 [3]: images/edit_post3.png

Pokud chceš vědět více o Django admin, koukni se do Django dokumentace: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

V tuto chvíli je asi dobrý čas dát si pro trochu vzpruhy kávu, čaj nebo něco k jídlu. Vytvořila jsi svůj první model Django - zasloužíš si malý oddech!
