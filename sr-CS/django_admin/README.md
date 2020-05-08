# Django Admin

Kako bismo dodali, izmenili ili izbrisali postove koje smo upravo podesili, koristićemo Django admina.

Hajde da otvorimo `blog/admin.py` fajl u editoru i da zamenimo njegov sadržaj ovim:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Kao što možete da vidite, uvozimo model posta koji je definisan u prethodnom poglavlju. Kako bi naš model bio vidljiv na admin stranici, potrebno je da ga registrujemo pomoću `admin.site.register(Post)`.

Ok, vreme je da pogledamo naš model. Ne zaboravite da pokrenete `python manage.py runserver` u konzoli kako biste pokrenuli veb server. Idite na Vaš pretraživač i ukucajte adresu http://127.0.0.1:8000/admin/. Trebalo bi da vidite stranicu koja ovako izgleda:

![Stranica za prijavljivanje](images/login_page2.png)

Kako biste se ulogovali, potrebno je da kreirate *superuser-a* (super korisnika) - korisnički nalog koji ima kontrolu nad svim stvarima na tom sajtu. Zatim se vratite na komandnu liniju i ukucajte `python manage.py createsuperuser` i pritisnite enter.

> Ne zaboravite da napišete nove komande dok je veb server pokrenut, da otvorite nov prozor terminala i da aktivirate virtuelno okruženje. Pokazali smo kako da napišete nove komande u poglavlju **Vaš prvi Django projekat!**, u delu **Pokretanje veb servera**.

{% filename %}Mac OS X ili Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

Nakon toga, ukucajte svoje korisničko ime (malim slovima, bez razmaka), e-mail adresu i šifru. **Ne brinite ako ne možete da vidite šifru dok je kucate - to tako i treba da bude.** Zatim pritisnite `enter` da biste nastavili. Izlaz bi trebalo da izgleda ovako (gde bi korisničko ime i e-mail trebalo da budu Vaši):

    Korisničko ime: ola
    E-mail adresa ola@example.com
    Šifra:
    Šifra (ponovo):
    Super korisnik je uspešno kreiran.
    

Vratite se na svoj pretraživač. Ulogujte se sa podacima super korisnika koje ste odabrali; trebalo bi da vidite Django kontrolnu tablu za admine.

![Django Admin](images/django_admin3.png)

Idite na postove i eksperimentišite malo s njima. Dodajte pet ili šest postova na blogu. Ne brinite za sadržaj - to je vidljivo isključivo na Vašem lokalnom računaru. Možete da prekopirate neki tekst iz ovog priručnika, kako biste uštedeli vreme. :)

Pobrinite se da najmanje dva ili tri posta (ali ne svi) imaju podešen datum objave. To će kasnije biti od koristi.

![Django Admin](images/edit_post3.png)

Ako želite znati više o administratoru Django, proverite Djangovu dokumentaciju: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

Ovo je verovatno zgodan trenutak da uzmete kafu (ili čaj) ili nešto da pojedete i da se osvežite. Uspeli ste da napravite Vaš prvi Django model - zaslužujete da se malo odmorite!