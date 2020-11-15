{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Επεκτείνετε την εφαρμογή σας

We've already completed all the different steps necessary for the creation of our website: we know how to write a model, URL, view and template. We also know how to make our website pretty.

Ώρα για εξάσκηση!

Το πρώτο πράγμα που χρειαζόμαστε στο blog μας είναι, προφανώς, μια σελίδα για το εκάστοτε post (της οποίας η εμφάνιση θα είναι η ίδια για όλα post και το μόνο που θα αλλάζει θα είναι το περιεχόμενο), σωστά;

Έχουμε ήδη ένα μοντέλο `Post`, έτσι δεν χρειάζεται να προσθέσετε τίποτα στο αρχείο `models.py`.

## Δημιουργία ενός συνδέσμου template με τις λεπτομέρειες του post

Θα ξεκινήσουμε με την προσθήκη ενός συνδέσμου στο αρχείο `blog/templates/blog/post_list.html`. Ανοίξτε το. Θα δείχνει κάπως έτσι: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
```

{% raw %}Θέλουμε να έχουμε έναν σύνδεσμο (link) για κάθε τίτλο του post μέσα στη λίστα ο οποίος όταν κλικάρετε να μεταβαίνει στη σελίδα λεπτομερειών του post. Let's change `<h2><a href="">{{ post.title }}</a></h2>` so that it links to the post's detail page:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %}Ώρα να εξηγήσουμε το μυστηριώδης `{% url 'post_detail' pk=post.pk %}`. Όπως υποψιάζεστε, το `{% %}` σημαίνει ότι χρησιμοποιούμε τα Django template tags. Αυτή τη φορά θα χρησιμοποιήσουμε ένα που δημιουργεί μια διεύθυνση URL για εμάς!{% endraw %}

Το μέρος `post_detail` σημαίνει ότι θα πρέπει το Django θα περιμένει μια διεύθυνση URL με το όνομα αυτό στο αρχείο `blog/urls.py` με το όνομα=post_detail

Τι γίνεται όμως με το `pk=post.pk`; `pk` is short for primary key, which is a unique identifier for each record in a database. Every Django model has a field which serves as its primary key, and whatever other name it has, it can also be referred to as "pk". Because we didn't specify a primary key in our `Post` model, Django creates one for us (by default, a field named "id" holding a number that increases for each record, i.e. 1, 2, 3) and adds it as a field to each of our posts. We access the primary key by writing `post.pk`, the same way we access other fields (`title`, `author`, etc.) in our `Post` object!

Τώρα, όταν πάμε στη διεύθυνση http://127.0.0.1:8000 / θα εμφανιστεί σφάλμα (όπως ήταν αναμενόμενο, καθώς δεν έχουμε ακόμη διεύθυνση URL ή κάποιο *view* για το `post_detail`). Αυτό θα μοιάζει κάπως έτσι:

![Σφάλμα NoReverseMatch](images/no_reverse_match2.png)

## Δημιουργία ενός URL για τις λεπτομέρειες του post

Ας δημιουργήσουμε μια διεύθυνση URL στο αρχείο `urls.py` για το `post_detail` *view* μας!

Θέλουμε οι λεπτομέρειες του πρώτου μας post να εμφανίζονται σε αυτό το **URL**: http://127.0.0.1:8000/θέση/1 /

Ας δημιουργήσουμε ένα URL μέσα στο αρχείο `blog/urls.py` που θα κατευθύνει το Django στο *view* με το όνομα `post_detail`, που με τη σειρά του θα δείξει ένα ολόκληρο blog post. Ανοίξτε το αρχείο `blog/urls.py` και προσθέστε τη γραμμή `path('post/<int:pk>/', views.post_detail, name='post_detail'),` έτσι ώστε το αρχείο να μοιάζει κάπως έτσι:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

Το μέρος `post/<int:pk>/` καθορίζει ένα URL μοτίβο. Θα σας το εξηγήσουμε:

- Το μέρος `post/` σημαίνει ότι το URL θα πρέπει να ξεκινά με τη λέξη **post** ακολουθούμενο από μια κάθετο **/**. Μέχρι τώρα όλα καλά.
- `<int:pk>` – Αυτό το μέρος είναι πιο δύσκολο. Σημαίνει ότι το Django περιμένει έναν ακέραιο όπου με την σειρά του θα το μεταφέρει ως παράμετρο με το όνομα `pk` στο αντίστοιχο view.
- `/` – έπειτα χρειαζόματε άλλη μια κάθετο **/** πριν να κλείσει το URL.

Αυτό σημαίνει ότι αν μεταβείτε στο `http://127.0.0.1:8000/post/5/` στον browser σας, το Django θα καταλάβει ότι ψάχνετε το *view* με το όνομα `post_detail` και θα μεταφέρει την πληροφορία του `pk` που ισούται με το `5` σε αυτό το *view*.

Ωραία. Προσθέσαμε ένα νέο URL μοτίβο στο αρχείο `blog/urls.py`! Ας ανανεώσουμε τη σελίδα: http://127.0.0.1:8000/ Μπαμ! Ο server σταμάτησε να τρέχει ξανά. Ρίξτε μια ματιά στην κονσόλα. Όπως ήταν αναμενόμενο, υπάρχει ακόμα ένα σφάλμα!

![AttributeError](images/attribute_error2.png)

Θυμάστε το επόμενο βήμα; Προσθήκη ενός view!

## Προσθήκη ενός view για τις λεπτομέρειες του post

Αυτή τη φορά το *view* δέχεται μια έξτρα παράμετρο, το `pk`. Το *view* μας χρειάζεται με κάποιο τρόπο να αιχμαλωτίσει αυτή την παράμετρο, σωστά; Έτσι, λοιπόν, θα ορίσουμε την συνάρτηση μας ως `def post_detail(request, pk):`. Note that this parameter must have the exact same name as the one we specified in `urls` (`pk`). Also note that omitting this variable is incorrect and will result in an error!

Τώρα, θέλουμε να πάρουμε ένα και μόνο ένα post. Για να το κάνουμε αυτό, μπορούμε να χρησιμοποιήσουμε τα querysets, όπως παρακάτω:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Αλλά αυτός ο κώδικας έχει πρόβλημα. Αν δεν υπάρχει κάποιο `Post` με το δεδομένο `primary key` (`pk`) θα έχουμε ένα άσχημο σφάλμα!

![Σφάλμα DoesNotExist](images/does_not_exist2.png)

Δεν το θέλουμε αυτό! Αλλά ευτυχώς το Django περιλαμβάνει με κάτι που θα μας φανεί χρήσιμο: `get_object_or_404`. Σε αυτή την περίπτωση δεν υπάρχει κάποιο `Post` με αυτό το `pk`, θα εμφανίσει μια πολύ πιο όμορφη σελίδα, την σελίδα `Page Not Found 404`.

![Page not found](images/404_2.png)

Τα καλά νέα είναι ότι μπορείτε να δημιουργήσετε τη δική σας σελίδα `Page not found` και να την κάνετε όσο όμορφη θέλετε. Αλλά δεν είναι εξαιρετικά σημαντικό αυτή τη στιγμή, οπότε θα το παραλείψουμε τώρα.

Ωραία, ώρα να προσθέσουμε ένα *view* στο αρχείο `views.py`!

Στο αρχείο `blog/urls.py` δημιουργήσαμε ένα URL με το όνομα `post_detail`, που αναφέρεται σε ένα view με το όνομα `views.post_detail`. Αυτό σημαίνει ότι το Django θα περιμένει να υπάρχει μια συνάρτηση με το όνομα `post_detail` μέσα στο αρχείο `blog/views.py`.

Ανοίξτε το αρχείο`blog/views.py` και προσθέστε τις ακόλουθες γραμμές μαζί με τις γραμμές `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

Και στο τέλος του αρχείου θα προσθέσουμε το *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Ναι. Ήρθε η ώρα να ανανεώσουμε τη σελίδα: http://127.0.0.1:8000/

![view για την λίστα των post](images/post_list2.png)

Δούλεψε! Αλλά τι συμβαίνει όταν κλικάρετε στον σύνδεσμο σε κάποιον τίτλο ενός post;

![Σφάλμα TemplateDoesNotExist](images/template_does_not_exist2.png)

Ω όχι! Άλλο ένα άλλο σφάλμα! Αλλά ήδη γνωρίζουμε πώς να το αντιμετωπίσουμε, έτσι; Πρέπει να προσθέσουμε ένα template!

## Δημιουργία template για τις λεπτομέρειες του post

Θα δημιουργήσoυμε ένα αρχείο μέσα στο φάκελο `blog/πρότυπα/blog` με το όνομα `post_detail.html`. Ανοίξτε το.

Enter the following code:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Για μια ακόμη φορά θα επεκτείνουμε το template `base.html`. Στο block`content` θέλουμε να εμφανίσουμε την ημ/νια έκδοσης του post (αν υπάρχει) τον τίτλο και το κυρίως κείμενο. Αλλά θα πρέπει να συζητήσουμε ορισμένα σημαντικά πράγματα, έτσι;

{% raw %}`{% if ... %} ... {% endif %}` είναι ένα template tag που μας επιτρέπει να ελέγξουμε κάτι - με άλλα λόγια είναι μια συνθήκη. (Θυμάστε το `if ... else ..` από το κεφάλαιο **Εισαγωγή στην Python**?) Σε αυτό το σενάριο θέλουμε να δούμε αν το πεδίο `published_date` του post έχει κάποια τιμή.{% endraw %}

Ωραία, μπορούμε να ανανεώσουμε τη σελίδα και να δούμε, για αρχή, αν το σφάλμα `TemplateDoesNotExist` έχει φύγει.

![Σελίδα λεπτομέρειας του post](images/post_detail2.png)

Ναι! Έφυγε!

# Ώρα για deploy!

Θα ήταν καλό να δούμε εάν η σελίδα σας εξακολουθεί να λειτουργεί στο PythonAnywhere, σωστά; Ας δοκιμάσουμε να το κάνουμε deploy ξανά.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Έπειτα, στην [κονσόλα Bash του PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Θυμηθείτε να αντικαταστήσετε με το `<your-pythonanywhere-domain>`πραγματικό όνομα χρήστη σας του PythonAnywhere χωρίς τα <>)

## Ενημέρωση των στατικών αρχείων στο διακομιστή

Οι διακομιστές όπως το PythonAnywhere τους αρέσει να διαχειρίζονται τα «στατικά αρχεία» (όπως τα αρχεία CSS) διαφορετικά από τα αρχεία της Python επειδή μπορεί να βελτιστοποιηθούν ούτως ώστε να φορτώνονται πιο γρήγορα. Ως αποτέλεσμα, κάθε φορά που μπορούμε να κάνουμε αλλαγές στα αρχεία CSS, θα πρέπει να εκτελούμε μια πρόσθετη εντολή στο διακομιστή η οποία του λέει να τα ενημερώσει. Η εντολή ονομάζεται `collectstatic`.

Ξεκινήστε με το να ενεργοποιήσετε το virtualenv σας, αν δεν είναι ήδη ενεργό (το PythonAnywhere χρησιμοποιεί μια εντολή που ονομάζεται `workon` για να γίνει αυτό, είναι ακριβώς σαν την εντολή `source myenv/bin/activate` που χρησιμοποιείτε στον υπολογιστή σας):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

Η εντολή `manage.py collectstatic` είναι λίγο σαν την `manage.py migrate`. Κάνουμε κάποιες αλλαγές στον κώδικα και στη συνέχεια λέμε στο Django να *εφαρμόσει* αυτές τις αλλαγές είτε στον αντίστοιχο φάκελο στατικών αρχείων του server είτε στη βάση δεδομένων.

Σε κάθε περίπτωση, είμαστε τώρα έτοιμοι να κλικάρουμε ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (από το κουμπί του μενού στην επάνω δεξιά μεριά της κονσόλας) και κλικάρουμε στο **Reload**. Δείτε τη σελίδα https://subdomain.pythonanywhere.com με το αποτέλεσμα.

Αυτό ήταν! Συγχαρητήρια :)