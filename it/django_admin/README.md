# Django admin

Per aggiungere, modificare e cancellare i post che abbiamo appena strutturato useremo Django admin.

Apri il file `blog/admin.py` e sostituisci il suo contenuto con:

    from django.contrib import admin
    from .models import Post
    
    admin.site.register(Post)
    

Come puoi vedere, stiamo importando (include) il modello di Post che abbiamo definito nel capitolo precedente. Per far si che il nostro modello sia visibile nella pagina di admin, dobbiamo registrare questo modello con `admin.site.register(Post)`.

OK, è tempo di guardare il nostro modello Post. Ricorda di eseguire `python manage.py runserver` nella console per avviare il web server. Vai nel browser e scrivi l'indirizzo http://127.0.0.1:8000/admin/ Vedrai una pagina di login come questa:

![Login page][1]

 [1]: images/login_page2.png

Per accedere, devi creare un *superuser* - un utente che ha il controllo su tutto nel sito. Torna alla command-line e digita `python manage.py createsuperuser`, e premi invio. Quando richiesto, digita il tuo username (minuscole, senza spazi), indirizzo e-mail e password. Non ti preoccupare se non riesci a vedere la password che stai digitando - è così che dovrebbe essere. Basta digitarlo e premere `invio` per continuare. L'output dovrebbe essere così (dove il nome utente e l'email dovrebbero essere i tuoi):

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Torna nel tuo browser e fai il log in con le credenziali di superuser che hai scelto, dovresti vedere la dashboard d'amministrazione di Django.

![L'admin di Django][2]

 [2]: images/django_admin3.png

Vai su Post ed sperimenta un po'. Aggiungi cinque o sei post. Non preoccuparti del contenuto - puoi semplicemente fare il copia-incolla di parti di testo da questo tutorial per risparmiare tempo :).

Assicurati che almeno due o tre post (ma non tutti) abbiano la data in cui sono stati pubblicati. Ti sarà utile più tardi.

![L'admin di Django][3]

 [3]: images/edit_post3.png

Se vuoi sapere di più riguardo l'admin di Django, dovresti dare un'occhiata alla documentazione di Django: https://docs.djangoproject.com/en/1.8/ref/contrib/admin/

Questo è un buon momento per andare a prendere un caffè (o tè) o qualcosa da mangiare per riprendere le forze. Hai creato il tuo primo modello Django - ti meriti una piccola pausa!