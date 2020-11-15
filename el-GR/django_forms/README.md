# Φόρμες Django

Το τελευταίο που έμεινε για την ιστοσελίδα μας είναι να δημιουργήσουμε μια όμορφη φόρμα για την εισαγαγωγή και τροποποίηση των post μας. Θα μπορούσαμε να χρησιμοποιήσουμε το Django `admin` αλλά είναι αρκετά πολύπλοκο να τροποποιήσουμε και να κάνουμε όμορφη τη φόρμα εισαγωγής εκεί. Με τις `φόρμες` έχουμε τον πλήρη έλεγχο στο περιβάλλον του χρήστη. Μπορούμε να κάνουμε ότι μπορούμε να φανταστούμε!

Μία από τις ευκολίες των Django φορμών είναι ότι μπορούμε να ξεκινήσουμε από το μήδεν ή να χρησιμοποιήσουμε το `ModelForm` που ουσιαστικά αποθηκεύει τα δεδομένα της φόρμας στο μοντέλο (ή διαφορετικά στο σωστό πίνακα της βάσης μας).

Αυτό είναι ακριβώς που θέλουμε να κάνουμε: δηλαδή να δημιουργήσουμε εύκολα μια φόρμα εισαγωγής δεδομένων για το ήδη υπάρχων `Post` μοντέλο.

Οπώς κάθε άλλο σημαντικό τμήμα του Django, οι φόρμες εισαγωγής "ζούν" στο δικό τους αρχείο: `forms.py`.

Πρέπει να δημιουργήσουμε το αρχείο forms.py μέσα στο φάκελο `blog`.

    blog
       └── forms.py
    

Ωραία. Ας ανοίξουμε τον επεξεργαστή κώδικα και ας γράψουμε τον ακόλουθο κώδικα:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Θα χρειαστεί να κάνουμε import τις Django forms πρώτα (`from django import forms`) καθώς και το μοντέλο μας `Post` (`from .models import Post`).

Οπώς πιθανόν να υποψιάζεστε το `PostForm`, είναι το όνομα της φόρμας εισαγωγής. Θα χρειαστεί να πούμε στο Django ότι αυτή η φόρμα είναι μια `ModelForm` (ούτως ώστε το Django να κάνει τα "μαγικά" του για εμάς). Η κλάση `forms.ModelForm` είναι υπεύθυνη γι'αυτό.

Στην συνέχεια, έχουμε `class Meta`, όπου "λέμε" στο Django για ποιο μοντέλο πρέπει να δημιουργήσει την φόρμα εισαγωγής δεδομένων (`model = Post`).

Τέλος, πρέπει να ορίσουμε ποιο/α πεδίο/α πρέπει να διαθέσουμε στην φόρμα μας. Σε αυτό το σενάριο θέλουμε μόνο το `title` και το `text` να εμφανίζονται. Το `author` θα πρέπει να είναι το πρόσωπο που είναι συνδεδεμένο εκείνη τη στιγμή (εσείς!) και το `created_date` θα παράγεται αυτόματα όταν δημιουργούμε ένα post (πχ μέσω κώδικα), σωστά;

Αυτό ήταν! Αυτό που μας απομένει είναι να χρησιμοποιήσουμε την φόρμα μας μέσα σε ένα *view* ώστε να είναι διαθεσίμη μέσω ενός template.

Οπότε, για ακόμα μια φορά, θα χρειαστεί να συνδέσουμε τη σελίδα με ένα url, ένα view και ένα template.

## Πως συνδέουμε μια σελίδα με την φόρμα μας

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Σημειώστε ότι θέλουμε να ονομάσουμε το view ως `post_new`. Η κλάση `"glyphicon glyphicon-plus"` παρέχεται από το bootstrap και θα εμφανίσει το σύμβολο της πρόσθεσης.

Αφού προσθέσουμε τη γραμμή, το HTML αρχείο θα δείχνει κάπως έτσι:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

Αφού αποθηκεύσετε και ανανέωσετε τη σελίδα http://127.0.0.1:8000 θα δείτε τη γνωστή σελίδα σφάλματος `NoReverseMatch`. Αν ναι, τότε ωραία!

## URL

Ανοίξτε το αρχείο `blog/urls.py` και προσθέστε τη γραμμή:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Ο ολοκληρωμένος κώδικας θα δείχνει κάπως έτσι:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Αφού ανανεώσετε τη σελίδα θα δείτε ένα σφάλμα `AttributeError`, αφού δεν έχουμε φτιάξει ακόμα το view `post_new`. Ας το φτιάξουμε τώρα.

## post_new view

Ανοίξτε το αρχείο`blog/views.py` και προσθέστε τις ακόλουθες γραμμές μαζί με τις γραμμές `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Στη συνέχεια το *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Για να δημιουργήσετε μια νέα `Post` φόρμα, θα χρειαστεί να αρχικοποιήσουμε την κλάση `PostForm()` όπως επίσης και να δηλώσουμε ένα template. Θα επιστρέψουμε σε αυτό το *view* αλλά για τώρα, ας δημιουργήσουμε γρήγορα ένα template για την φόρμα.

## Template

Θα χρειαστεί να δημιουργήσουμε ένα αρχείο `post_edit.html` μέσα στο φάκελο `blog/templates/blog` και να το ανοίξουμε. Για να κάνουμε τη φόρμα να δουλέψει θα χρειαστεί να κάνουμε διάφορα πράγματα:

* Πρέπει να εμφανίσουμε τη φόρμα. Μπορούμε να το κάνουμε αυτό (για παράδειγμα) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Η παραπάνω γραμμή πρέπει συμπεριληφθεί γύρω από ένα HTML form tag: `<form method="POST">...</form>`.
* Χρειαζόμαστε ένα κουμπί `Αποθήκευση`. Το κάνουμε αυτό με ένα κουμπί HTML: `<button type="submit">Αποθήκευση</button>`.
* Και στο τέλος, ακριβώς μετά το tag `<form ...>` πρέπει να προσθέσουμε {% raw %}`{% csrf_token %}`{% endraw %}. Αυτό είναι πολύ σημαντικό, αφού καθιστά τις φόρμες σας ασφαλείς! Εάν ξεχάσετε αυτό το κομμάτι, το Django θα παραπονεθεί όταν προσπαθήσετε να αποθηκεύσετε τη φόρμα:

![Σελίδα CSFR Forbidden](images/csrf2.png)

Εντάξει, ας δούμε πως η HTML στο template `post_edit.html` πρέπει να δείχνει:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Ώρα να ανανεώσετε! Ναι! Η φόρμα σας εμφανίζεται!

![Νέα φόρμα](images/new_form2.png)

Αλλά, περιμένετε ένα λεπτό! Όταν πληκτρολογείτε κάτι στα πεδία `title` και `text` και προσπαθήσετε να το αποθηκεύσετε, τι θα συμβεί;

Τίποτα! Είμαστε άλλη μια φορά στην ίδια σελίδα και το κείμενο μας έχει εξαφανιστεί... και δεν έχει προστεθεί καμία νέα δημοσίευση. Οπότε τι πήγε λάθος;

Η απάντηση είναι: τίποτα. Πρέπει να κάνουμε λίγη περισσότερη δουλειά στο αρχείο *view*.

## Αποθηκεύοντας τη φόρμα

Ανοίξτε το αρχείο `blog/views.py` ξανά. Προς το παρόν αυτό που έχουμε στο `post_new` είναι τα ακόλουθα:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Όταν υποβάλουμε την φόρμα, επανερχόμαστε στο ίδιο view αλλά αυτή τη φορά έχουμε περισσότερα δεδομένα στο `request`. Πιο συγκεκριμένα στο `request.POST` (το όνομα δεν έχει να κάνει με μία "δημοσίευση" blog, έχει να κάνει με το γεγονός ότι "δημοσιεύουμε" δεδομένα). Θυμηθείτε πως στο αρχείο HTML ο `<form>` ορισμός μας είχε την μεταβλητή `method="POST"`; Όλα τα πεδία από τη φόρμα είναι στο `request.POST`. Δεν πρέπει να μετονομάσετε το `POST` σε οτιδήποτε άλλο (η μόνο άλλη έγκυρη τιμή για το `method` είναι `GET`, αλλά δεν έχουμε χρόνο για να εξηγήσουμε ποια είναι η διαφορά).

Έτσι στο *view* έχουμε δύο ξεχωριστές καταστάσεις να διαχειριστούμε: 1ον, όταν αποκτούμε πρόσβαση στην σελίδα για πρώτη φορά και θέλουμε μία άδεια φόρμα και 2ον, όταν πάμε πίσω στο *view* με όλα τα δεδομένα της φόρμας που μόλις πληκτρολογήσαμε. Επομένως, πρέπει να προσθέσουμε μια συνθήκη (θα χρησιμοποιήσουμε `if` για αυτό):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Είναι καιρός να συμπληρώσουμε τις τελείες `[...]`. Αν το `method` είναι `POST` τότε θέλουμε να δημιουργήσουμε μια `PostForm` με τα δεδομένα από τη φόρμα, σωστά; Θα το κάνουμε αυτό όπως παρακάτω:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Το επόμενο πράγμα είναι να ελέγξουμε αν η φόρμα είναι σωστή (όλα τα απαιτούμενα πεδία έχουν οριστεί και δεν έχουν υποβληθεί εσφαλμένες τιμές). Το κάνουμε αυτό με τη μέθοδο `form.is_valid()`.

Ελέγχουμε αν η αίτηση είναι έγκυρη και αν ναι, μπορούμε να την αποθηκεύσουμε!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Βασικά, έχουμε δύο πράγματα εδώ: αποθηκεύουμε τη φόρμα με τη μέθοδο `form.save()` και προσθέτουμε έναν συγγραφέα (μιας και δεν υπήρχε πεδίο `author` στην κλάση `PostForm` και αυτό το πεδίο είναι απαραίτητο). `commit=False` σημαίνει ότι δεν θέλουμε να αποθηκεύσουμε το μοντέλο `Post` ακόμα. Θέλουμε να προσθέσουμε τον author πρώτα. Τις περισσότερες φορές θα χρησιμοποιήσετε το `form.save()` χωρίς το `commit=False`, αλλά σε αυτή την περίπτωση, πρέπει να το κάνουμε. Η μέθοδος `post.save()` θα διατηρήσει τις αλλαγές (προσθέτοντας τον author) και έτσι δημιουργείται ένα νέο blog post!

Τέλος, θα ήταν ωραίο εάν μπορούσαμε να πάμε αμέσως στην σελίδα `post_detail` για το νεοσυσταθέν blog post μας, σωστά; Για να το κάνουμε αυτό χρειαζόμαστε ένα ακόμα import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Προσθέστε το στην αρχή του αρχείου σας. Και τώρα μπορούμε να πούμε, "πηγαίνε στη σελίδα `post_detail` για το νεοσυσταθέν post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

Το `post_detail` είναι το όνομα του view στο οποίο θέλουμε να πάμε. Θυμηθείτε ότι αυτό το *view* απαιτεί μία μεταβλητή `pk`; Για να το περάσουμε στα views, χρησιμοποιούμε το `pk=post.pk`, όπου `post` είναι το νεοσύστατο blog post!

Εντάξει. Έχουμε μιλήσει πολύ. Αλλά μάλλον θέλουμε να δούμε πως μοιάζει το *view*, σωστά;

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Ας δούμε αν λειτουργεί. Πηγαίνετε στην σελίδα http://127.0.0.1:8000/post/new/ και προσθέστε ένα `title` και ένα `text`, αποθηκεύστε το… και voilà! Το νέο σας post προστέθηκε και αυτόματως ανακατευθυνόμαστε στη σελίδα του `post_detail`!

Ίσως να προσέξατε ότι ορίζουμε την ημ/νια έκδοσης (publish date) πριν την αποθήκευση του post. Αργότερα θα παρουσιάσουμε ένα *publish button* στην ενότητα **Οδηγός Django Girls: Επεκτάσεις**.

Αυτό είναι απίθανο!

> Επειδή έχουμε χρησιμοποιήσει το Django Admin πρόσφατα, το σύστημα υποθέτει ότι είμαστε ακόμα συνδεδεμένοι. Υπάρχουν μερικοί τρόποι που μπορεί να μας οδηγήσουν εκτός σύνδεσης (κλείνοντας τον browser, επανεκκινώντας την βάση δεδομένων κλπ). Αν, κατά τη διάρκεια δημιουργίας ενός post, λαμβάνετε σφάλματα ότι είστε εκτός σύνδεσης, πηγαίνετε στη σελίδα admin http://127.0.0.1:8000/admin και συνδεθείτε ξανά. Αυτό θα διορθώσει το πρόβλημα, προσωρινά. Υπάρχει, ωστόσο, η μόνιμη λύση του προβλήματος η οποία σας περιμένει στο κεφάλαιο **Εργασία: ασφάλεια για το site σας!** μετά από αυτόν τον οδηγό.

![Σφάλμα σύνδεσης](images/post_create_error.png)

## Form validation

Τώρα θα σας δείξουμε πόσο ωραίες είναι οι Django φόρμες. Ένα post χρειάζεται να έχει τουλάχιστον τα εξής πεδία: `title` και `text`. Στο μοντέλο μας `Post` δεν δηλώσαμε ότι θέλουμε αυτά τα πεδία να είναι προαιρετικά (εν εντιθέση με το πεδίο `published_date`). Έτσι το Django, από προεπιλογή, αναμένει αυτά τα πεδία να υπάρχουν.

Προσπαθήστε να αποθηκεύσετε τη φόρμα δίχως τιμές για τα πεδία `title` και `text`. Τι θα συμβεί;

![Form validation](images/form_validation2.png)

Το Django χειρίζεται την εγκυρότητα της φόρμας. Με άλλα λόγια κάνει το λεγόμενο form validation. Δεν είναι φοβερό αυτό;

## Επεξεργασία φόρμας

Now we know how to add a new post. Αλλά πως επεξεργαζόμαστε μια ήδη υπάρχουσα; Αυτό είναι παρόμοιο με αυτό που κάναμε. Ας δημιουργήσουμε, γρήγορα, μερικά σημαντικά πράγματα. (Αν δεν καταλαβαίνετε κάτι, θα πρέπει να ζητήσετε τη βοήθεια του επιτηρητή σας ή να κοιτάξετε στα προηγούμενα κεφάλαια, δεδομένου ότι καλύψαμε ήδη όλα αυτά τα βήματα.)

Ανοίξτε το αρχείο `blog/templates/blog/post_detail.html` και προσθέστε τη γραμμή

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

ούτως ώστε το template να δείχνει κάπως έτσι:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Ανοίξτε το αρχείο `blog/urls.py` και προσθέστε τη γραμμή:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Θα ξαναχρησιμοποιήσουμε το template `blog/templates/blog/post_edit.html`, οπότε λείπει μόνο το *view*.

Ανοίξτε το αρχείο `blog/views.py` και προσθέστε αυτό στο τέλος του αρχείου:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Αυτό μοιάζει σχεδόν το ίδιο με το view `post_new`, σωστά; Αλλά όχι εντελώς. For one, we pass an extra `pk` parameter from `urls`. Στη συνέχεια, παίρνουμε το μοντέλο `Post` που θέλουμε να επεξεργαστούμε με την συνάρτηση `get_object_or_404 (Post, pk=pk)` και στη συνέχεια όταν δημιουργούμε μια φόρμα, περνάμε το post αυτό ως ένα `instance`, τόσο όταν αποθηκεύουμε τη φόρμα...

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

… όσο και όταν έχουμε μόλις ανοίξει μία φόρμα προς επεξεργασία με αυτό το post:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Εντάξει, ας δοκιμάσουμε αν λειτουργεί! Πάμε στην σελίδα `post_detail`. Θα πρέπει να υπάρχει ένα κουμπί επεξεργασίας στην πάνω δεξιά γωνία:

![Κουμπί επεξεργασίας](images/edit_button2.png)

Όταν κάνετε κλικ θα δείτε την φόρμα με την δημοσίευση στο blog μας:

![Επεξεργασία φόρμας](images/edit_form2.png)

Νιώστε ελεύθεροι να αλλάξετε τον τίτλο ή το κείμενο και να αποθηκεύσετε τις αλλαγές!

Συγχαρητήρια! Η εφαρμογή σας γίνεται όλο και πιο πλήρης!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Ασφάλεια

Το να μπορείς να δημιουργήσεις νέες δημοσιεύσεις κάνοντας απλώς ένα κλικ σε ένα σύνδεσμο είναι φοβερό! Αλλά τώρα, οποιοσδήποτε επισκεφθεί την σελίδα σας θα μπορεί να φτιάξει μία καινούρια δημοσίευση blog, και αυτό είναι κάτι που πιθανώς δεν θέλετε. Ας το κάνουμε έτσι ώστε το κουμπί να εμφανίζεται μόνο για εσάς και για κανέναν άλλο.

Ανοίξτε το αρχείο `Blog/templates/blog/base.html` και βρείτε το `page-header` `div` καθώς και το tag a του link. Θα μοιάζει κάπως έτσι:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Πρόκειται να προσθέσουμε άλλη μία ετικέτα `{% if %}` σε αυτό, το οποίο θα κάνει τον σύνδεσμο να εμφανίζεται μόνο για χρήστες που είναι συνδεδεμένοι στο Django Admin. Προς το παρόν, είστε μόνο εσείς! Αλλάξτε το tag `<a>` να μοιάζει σαν αυτό:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Αυτό το `{% if %}` θα προκαλέσει τον σύνδεσμο να σταλθεί στο πρόγραμμα περιήγησης μόνο αν ο χρήστης που ζητά την σελίδα είναι συνδεδεμένος. Αυτό δεν προστατεύει την δημιουργία νέων δημοσιεύσεων εντελώς, αλλά είναι ένα καλό πρώτο βήμα. Θα καλύψουμε περισσότερα σχετικά με την ασφάλεια στα μαθήματα επέκτασης.

Θυμάστε το εικονίδιο επεξεργασίας που μόλις προσθέσαμε στην σελίδα λεπτομερειών; Θέλουμε επίσης να προσθέσουμε την ίδια αλλαγή εκεί, ώστε άλλα άτομα δεν θα μπορούν να επεξεργαστούν τις υπάρχουσες δημοσιεύσεις.

Ανοίξτε το αρχείο `blog/templates/blog/post_detail.html` και προσθέστε τη γραμμή:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Αλλάξτε το σε αυτό:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Μιας και είστε πιθανότατα συνδεδεμένοι, εάν ανανεώσετε την σελίδα, δεν θα δείτε τίποτα διαφορετικό. Φορτώστε την σελίδα σε ένα διαφορετικό πρόγραμμα περιήγησης ή ένα παράθυρο ανώνυμης περιήγησης (που ονομάζεται "InPrivate" στο Windows Edge), όμως, και θα δείτε ότι ο σύνδεσμος δεν εμφανίζεται, ούτε και το εικονίδιο!

## Ένα πράγμα ακόμα: ώρα να το ανεβάσετε!

Για να δούμε αν όλα αυτά λειτουργούν στο PythonAnywhere. Ώρα για άλλο ένα deploy!

* Πρώτα κάντε commit τον νέο σας κώδικα και έπειτα push στο GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Έπειτα, στην [κονσόλα Bash του PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Τέλος, επισκεφτείτε τη σελίδα σας ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (χρησιμοποιήστε το κουμπί του menu στην πάνω δεξιά γωνία της κονσόλας) και κλικάρετε **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

Αυτό ήταν! Συγχαρητήρια :)