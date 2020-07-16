# Δυναμικά δεδομένα στα templates

Μέχρι τώρα έχουμε διαφορετικά κομμάτια έτοιμα να συναρμολογηθούν: το μοντέλο `Post` είναι δηλωμένο στο αρχείο `models.py`, την συνάρτηση `post_list` στο αρχείο `views.py` το template. Αλλά πως θα κάνουμε τα posts να εμφανιστούν στο HTML template; Επειδή αυτό θέλουμε να κάνουμε. Να αντλήσουμε δεδομένα (αποθηκευμένα μοντέλα στη βάση δεδομένων) και να τα παρουσιάσουμε όμορφα μέσα από ένα template, σωστά;

Αυτό ακριβώς κάνουν τα *views*: συνδέουν τα μοντέλα με τα templates. Μέσα στη συνάρτηση `post_list` *view* πρέπει να προσπελάσουμε τα μοντέλα που θέλουμε και να τα δώσουμε στο template. Μέσα στο *view* αποφασίσαμε τι (μοντέλο) θα εμφανιστεί στο template.

Ωραία, πως το κάνουμε αυτό;

Πρέπει να ανοίξουμε το αρχείο `blog/views.py`. Μέχρι τώρα η συνάρτηση `post_list` *view* δείχνει κάπως έτσι:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Θυμάστε όταν είπαμε να συμπεριλαμβάνουμε κώδικα γραμμένο σε διαφορετικά αρχεία; Τώρα είναι η στιγμή να συπεριλάβουμε το μοντέλο που είχαμε γράψει στο αρχείο `models.py`. Θα προσθέσουμε τη γραμμή `from .models import Post`, όπως κάτωθι:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Η τελεία πριν τη λέξη `models` σημαίνει ο *παρόν φάκελος* ή το *παρόν application*. Και τα δύο αρχεία `views.py` και `models.py` βρίσκονται στον ίδιο φάκελο. Αυτό σημαίνει ότι μπορούμε να χρησιμοποιήσουμε την τελεία `.` και μετά το όνομα του αρχείου (δίχως την κατάληξη `.py`). Έπειτα κάνουμε import το όνομα του μοντέλου, δηλαδή της κλάσης (`Post`).

Και μετά; Για να εξάγουμε τα posts από το μοντέλο `Post` χρειαζόμαστε κάτι που ονομάζεται `QuerySet`.

## QuerySet

Θα πρέπει να είστε ήδη εξοικειωμένοι με τον όρο QuerySet και πως αυτό λειτουργεί. Μιλήσαμε γι'αυτά στο κεφάλαιο [Django ORM (QuerySets)](../django_orm/README.md).

Οπότε τώρα θέλουμε δημοσιευμένα posts ταξινομημένα κατά `published_date`, σωστά; Αυτό το κάναμε ήδη στο κεφάλαιο με τα QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Επομένως, ας ανοίξουμε το αρχείο `blog/views.py` και ας προσθέσουμε αυτό το κομμάτι κώδικα στη συνάρτηση `def post_list(request)`. Αλλά μην παραλείψετε να προσθέσετε `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Παρακαλούμε σημειώστε ότι δημιουργούμε μια *μεταβλητή* για το QuerySet: `posts`. Μεταχειριστείτε τη ως το όνομα του QuerySet. Απο δω και στο εξής μπορούμε να αναφερόμαστε σε αυτό με το όνομα αυτό.

Στη συνάρτηση `render` έχουμε μια παράμετρο `request` (οτιδήποτε λαμβάνουμε από το χρήστη μέσω του Internet) και άλλη μια ακόμα, εκείνη του αρχείου template (`'blog/post_list.html'`). Η τελευταία παράμετρος `{}`, είναι το σημείο που μπορούμε να προσθέσουμε πράγματα για να τα αξιοποιήσει το template. Χρειαζόμαστε να τους δώσουμε ονόματα (θα μείνουμε με το όνομα `'posts'`). :) Θα δείχνει κάπως έτσι: `{'posts': posts}`. Παρακαλούμε σημειώστε ότι το κομμάτι πριν το `:` είναι ένα string; πρέπει να το περικυκλώσετε με "αυτάκια": `''`.

Εν τέλει, το αρχείο `blog/views.py` θα δείχνει κάπως έτσι:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Αυτό ήταν! Ήρθε η ώρα να πάμε πίσω στο template και να εμφανίσουμε αυτό το QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/