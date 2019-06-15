# Consola de admin din Django

Pentru adăugarea, editarea și ștergerea articolelor pe care tocmai le-am descris în modele, vom utiliza consola de admin din Django.

Deschideți fișierul `blog/admin.py` în editorul de cod și înlocuiește conținutul său cu textul următor:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Așa cum poți observa, importăm (includem) modelul Post definit în capitolul anterior. Pentru a face modelul vizibil în consola de admin, trebuie să înregistrăm modelul cu instrucțiunea `admin.site.register(Post)`.

OK, acum este timpul să ne uităm la modelul Post. Reamintește-ți să rulezi comanda ` python manage.py runserver ` în linia de comandă pentru a rula serverul web. Deschideți în browser adresa http://127.0.0.1:8000/admin/. O să vedeți pagina de login:

![Pagina de login](images/login_page2.png)

Pentru a vă logați în consola de admin, trebuie să creați un *superuser* - un utilizator ce are control asupra tuturor resurselor din site. Pentru a crea un superuser trebuie să executați din linia de comandă `python manage.py createsuperuser`.

> Țineți minte pentru a scrie comenzile noi când serverul web este pornit, trebuie să deschideți o nouă linie de comandă și să activați virtualenv corespunzător. Ați văzut cum să scrieți comenzile noi în capitolul **Primul proiectul Django!**, în secția **Pornirea serverului web**.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

Vi se va cere să introduceți username (cu litere mici și fără spații), o adresă de email și parolă pentru user. **Nu vă faceți grijă că nu vedeți parola pe care o tapați – așa și trebuie să fie.** Introduceți-l și apăsați `enter` pentru a continua. Ceea ce veți vedea trebuie să fie asemănătoare cu (unde username și email ar trebui să fie cele introduse de voi):

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

Întoarce-ți la browserul web. Conectează-ți cu credențialele superuserului pe care tocmai l-ați creat; veți putea să vedeți consola de admin din Django.

![Django admin](images/django_admin3.png)

Mergeți la Articolele și experementați cu ei. Adăugați cinci ori șase posturile de blog. Nu vă faceți grija de conținutul - el este vizibil numai pe calculatorul vostru local - puteți să faceți o copie de text din acest tutorial pentru a păstra timp. :)

Asigura-ți că cel puțin două sau trei postări (dar nu toate) au setat câmpul publish date. Va fi de folos mai târziu.

![Django admin](images/edit_post3.png)

Dacă doriți să aflați mai multe despre consola de Django admin, puteți găsiți documentația de Django la: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

Ăsta este un moment bun să-vi luați o cafea (sau ceai) sau ceva de mâncare pentru a prinde energie. Ați creat primul tău model de Django - meritați o pauză!