# Django URLs

Είμαστε έτοιμοι να χτίσουμε την πρώτη μας σελίδα: μια αρχική σελίδα (homepage) για το blog μας! Αλλά πρώτα πρέπει να μάθουμε λίγα πράγματα για τα Django URLs.

## Τι είναι ένα URL;

Ένα URL είναι μια διεύθυνση ιστού. Μπορείτε να δείτε ένα URL κάθε φορά που επισκέπτεστε μια σελίδα. Είναι ορατό στην γραμμή διεύθυνσης. (Ναι! `127.0.0.1:8000` είναι ένα URL! Και το `https://djangogirls.org` είναι, επίσης, ένα URL.)

![Url](images/url.png)

Κάθε σελίδα στο ιντερνετ χρειάζεται το δικό της URL. Με αυτό τον τρόπο η εφαρμογή σας θα ξέρει τι να δείξει στον χρήστη που ανοίγει αυτό το URL. Στο Django, χρησιμοποιούμε κάτι που το ονομάζουμε `URLconf` (URL configuration). Το URLconf είναι ένα σετ από μοτίβα που το Django θα προσπαθήσει να ταιριάξει με το ζητούμενο URL ούτως ώστε να βρει το κατάλληλο view.

## Πως δουλεύουν τα URLs στο Django;

Ας ανοίξουμε το αρχείο `mysite/urls.py` και να δούμε τι έχει μέσα:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Όπως βλέπετε, το Django έχει γράψει μέσα κάποια πράγματα για εμάς.

Οι γραμμές μεταξύ των τριπλών εισαγωγικών (`'''` ή `"""`) ονομάζονται docstrings. Μπορείτε να τα γράψετε στην αρχή κάθε Python αρχείου, κλάσης, μεθόδου ή συνάρτησης για να περιγράψετε το τι κάνει. Δεν θα εκτελεστούν από την Python.

Το admin URL, το οποίο επισκεφτήκατε σε προηγούμενο κεφάλαιο, είναι ήδη εκεί:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Η γραμμή αυτή σημαίνει ότι για κάθε URL που ξεκινά με τη λέξη `admin/`, το Django θα ψάξει να βρει το αντίστοιχο *view*. Σε αυτή την περίπτωση συμπεριλαμβάνουμε αρκετά admin URLs ούτως ώστε να μην εμφανίζονται όλα σε αυτό το αρχείο. Είναι περισσότερο ευανάγνωστο κατ' αυτό τον τρόπο.

## Το πρώτο σας Django URL!

Ώρα να δημιουργήσουμε το πρώτο σας URL! Θέλουμε η διεύθυνση 'http://127.0.0.1:8000/' να είναι η αρχική μας σελίδα για το blog, η οποία θα εμφανίζει όλα τα posts.

Θέλουμε, επίσης, να κρατήσουμε το αρχείο `mysite/urls.py` καθαρό. Οπότε, θα κάνουμε import τα URLs από το `blog` application στο αρχείο `mysite/urls.py`.

Πηγαίνετε λοιπόν, και προσθέστε αυτή τη γραμμή στο αρχείο `blog.urls`. Θα χρειαστεί, επίσης, να αλλάξετε την πρώτη γραμμή επειδή χρησιμοποιούμε την συνάρτηση `include`. Επομένως, θα χρειαστεί να προσθέσετε αυτή τη γραμμή.

Το αρχείο σας `mysite/urls.py` θα μοιάζει κάπως έτσι:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Το Django, τώρα, θα ανακατευθύνει οτιδήποτε έρχεται στο 'http://127.0.0.1:8000/' προς το αρχείο `blog.urls` και από κει και πέρα θα πράττει αναλόγως.

## blog.urls

Δημιουργήστε ένα κενό αρχείο `urls.py` μέσα στο φάκελο `blog` και ανοίξτε το. Τέλεια! Προσθέστε αυτές τις δύο γραμμές:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Εδώ κάνουμε import τη συνάρτηση `path` του Django και όλα τα `views` από το `blog` application. (Δεν κάποια views ακόμα αλλά θα φτάσουμε εκεί σε λίγο!)

Μετά από αυτό, μπορούμε να προσθέσουμε το πρώτο μας URL μοτίβο (URL pattern):

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together) and restart it by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/