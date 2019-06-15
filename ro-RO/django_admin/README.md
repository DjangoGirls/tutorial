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
    

Vi se va cere să introduceți username (cu litere mici și fără spații), o adresă de email și parolă pentru user. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: ola
    Email address: ola@example.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content –- it's only visible to you on your local computer -- you can copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!