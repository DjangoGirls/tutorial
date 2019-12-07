# L'interfaccia admin di Django

Per aggiungere, modificare ed eliminare le pubblicazioni che abbiamo appena modellato, useremo l'amministratore di Django.

Apriamo `blog/admin.py` nell'editore testi e cambiamo il contenuto così:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

Come puoi vedere, stiamo importando (include) il modello di Post che abbiamo definito nel capitolo precedente. Per far si che il nostro modello sia visibile nella pagina di admin, dobbiamo registrare questo modello con `admin.site.register(Post)`.

OK, è tempo di guardare il nostro Post. Ricorda di eseguire `python manage.py runserver` nella console per avviare il web server. Vai al tuo browser e digita l'indirizzo http://127.0.0.1:8000/admin/. Vedrai una pagina login simile a questa:

![Login page](images/login_page2.png)

Per accedere, devi creare un *superuser* - un utente che ha pieno controllo di tutto quello che c'è sul sito. Torna alla riga di comando, digita` python manage.py crearesuperutente`, e premi invio.

> Ricorda, per eseguire comandi lasciando in esecuzione il server web, apri una nuova finestra di terminale e attiva il tuo virtualenv. Abbiamo presentato come scrivere nuovi comandi nel capitolo **Il tuo primo progetto Django!**, nella sezione **Avvio del server web**.

{% filename %}Mac OS X o Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

Quando te lo richiede, digita il tuo username (minuscole, senza spazi), il indirizzo email, e la password che vorrai utilizzare. **Non allarmarti se non vedi la password mentre scrivi, così funziona.** Digitala, premi `enter`, e continua. Il risultato dovrebbe assomigliare a questo (dove il nome utente e l'email saranno quelli che hai inserito):

    Username: ola
    Email address: ola@example.com 
    Password:
    Password (again):
    Superuser created successfully.
    

Torna al navigatore web. Fai log in con le credenziali di superuser che hai appena definito, dovresti vedere il pannello di amministrazione di Django.

![Django admin](images/django_admin3.png)

Vai su Posts e giocaci un po', per capire come funziona. Aggiungi cinque o sei post. Non preoccuparti del contenuto — questo è visibile solo a te sul tuo computer personale — puoi fare copia-incolla di parti di questo tutorial per far presto. :)

Fa in modo di avere per lo meno un paio di post (non tutti però) con data di pubblicazione. Ci tornerà utile poi.

![Django admin](images/edit_post3.png)

Se vuoi sapere di più su Django admin, puoi controllare la documentazione ufficiale di Django: https://docs.djangoproject.com/en/2.2/ref/contrib/admin/

Arrivati a questo punto, wow, mi sembra proprio il caso di prendersi un buon caffè ri-energizzante, una frutta (o magari una camomilla). Hai appena creato il tuo primo modello Django — ti meriti una pausa!