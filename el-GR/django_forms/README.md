# Φόρμες Django

Το τελευταίο που έμεινε για την ιστοσελίδα μας είναι να δημιουργήσουμε μια όμορφη φόρμα για την εισαγαγωγή και τροποποίηση των blog post μας. Θα μπορούσαμε να χρησιμοποιήσουμε το Django `admin` αλλά είναι αρκετά πολύπλοκο να τροποποιήσουμε και να ωραιοποιήσουμε την φόρμα εισαγωγής. With `forms` we will have absolute power over our interface – we can do almost anything we can imagine!

Μία από τις ευκολίες των Django φορμών είναι ότι μπορούμε να ξεκινήσουμε από το μήδεν ή να χρησιμοποιήσουμε το `ModelForm` που ουσιαστικά αποθηκεύει τα δεδομένα της φόρμας στο μοντέλο (ή διαφορετικά στο σωστό πίνακα της βάσης μας).

Αυτό είναι ακριβώς που θέλουμε να κάνουμε δηλαδή να δημιουργήσουμε εύκολα μια φόρμα εισαγωγής δεδομένων για το ήδη προυπάρχων `Post` μοντέλο.

Οπώς κάθε άλλο σημαντικό τμήμα του Django, οι φόρμες εισαγωγής "ζούν" στο δικό τους αρχείο: `forms.py`.

Πρέπει να δημιουργήσουμε το αρχείο forms. py μέσα στην ντερέκτρορη `blog`.

    blog
       └── forms.py
    

OK, let's open it and type the following code:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

We need to import Django forms first (`from django import forms`) and our `Post` model (`from .models import Post`).

Οπώς πιθανόν να υποψιάζεστε το `PostForm`, είναι το όνομα της φόρμας εισαγωγής. We need to tell Django that this form is a `ModelForm` (so Django will do some magic for us) – `forms.ModelForm` is responsible for that.

Στην συνέχεια, έχουμε `class Meta`, όπου "λέμε" στο Django για ποίο μοντέλο πρέπει να δημιουργήσει την φόρμα εισαγωγής δεδομένων).

Τέλος, πρέπει να ορίσουμε ποίο/α πεδίο/α πρέπει να διαθέσουμε στην φόρμα μας. In this scenario we want only `title` and `text` to be exposed – `author` should be the person who is currently logged in (you!) and `created_date` should be automatically set when we create a post (i.e. in the code), right?

Αυτό ήταν! Αυτό που μας απομένει είναι να χρησιμοποιήσουμε την φόρμα μας μέσα σε ένα *view* ώστε να είναι διαθεσίμη μέσω ενός template.

So once again we will create a link to the page, a URL, a view and a template.

## Πως συνδέουμε μια σελίδα με την φόρμα μας

Ανοίξτε το αρχείο `blog/templates/blog/base.html`. Θα προσθέσουμε το λινκ μέσα στο `div` με όνομα `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Note that we want to call our new view `post_new`. The class `"glyphicon glyphicon-plus"` is provided by the bootstrap theme we are using, and will display a plus sign for us.

After adding the line, your HTML file should now look like this:

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

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
```

And the final code will look like this:

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

After refreshing the site, we see an `AttributeError`, since we don't have the `post_new` view implemented. Let's add it right now.

## post_new view

Time to open the `blog/views.py` file and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

And then our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

To create a new `Post` form, we need to call `PostForm()` and pass it to the template. Θα επιστρέψουμε σε αυτή την *άποψη*, αλλά για τώρα, ας δημιουργήσουμε γρήγορα ένα πρότυπο για την αίτηση.

## Πρότυπο

Πρέπει να δημιουργήσουμε ένα αρχείο `post_edit.html` στο κατάλογο `blog/templates/blog`. Για να κάνουμε μια αίτηση εργασίας χρειαζόμαστε αρκετά πράγματα:

* Πρέπει να εμφανίσουμε την αίτηση. Μπορούμε να το κάνουμε αυτό με (για παράδειγμα) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Η παραπάνω γραμμή πρέπει να τυλιχθεί με μία ετικέτα αίτησης HTML: `<form method="POST">...</form>`.
* Χρειαζόμαστε ένα κουμπί `Αποθήκευση`. Το κάνουμε αυτό με ένα κουμπί HTML: `<button type="submit">Αποθήκευση</button>`.
* Και στο τέλος, ακριβώς μετά την ετικέτα ανοίγματος `<form ...>` πρέπει να προσθέσουμε {% raw %}`{% csrf_token %}`{% endraw %}. Αυτό είναι πολύ σημαντικό, αφού καθιστά τις αιτήσεις σας ασφαλείς! Εάν ξεχάσετε αυτό το κομμάτι, το Django θα παραπονεθεί όταν προσπαθήσετε να αποθηκεύσετε την αίτηση:

![CSFR Απαγορευμένη σελίδα](images/csrf2.png)

Εντάξει, ας δούμε πως το HTML στο `post_edit.html` πρέπει να δείχνει:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Ώρα να ανανεώσετε! Ναι! Η αίτηση σας εμφανίζεται!

![Νέα αίτηση](images/new_form2.png)

Αλλά, περιμένετε ένα λεπτό! Όταν πληκτρολογείτε κάτι στα πεδία `τίτλο` και `κείμενο`και προσπαθήσετε να το αποθηκεύσετε, τι θα συμβεί;

Τίποτα! Είμαστε άλλη μια φορά στην ίδια σελίδα και το κείμενο μας έχει εξαφανιστεί... και δεν έχει προστεθεί καμία νέα δημοσίευση, Οπότε τι πήγε λάθος;

Η απάντηση είναι: τίποτα. Πρέπει να κάνουμε λίγη περισσότερη δουλειά στο *προβολή* μας.

## Αποθηκεύοντας την αίτηση

Ανοίξτε `blog/views.py` ξανά. Προς το παρόν αυτό που έχουμε στο `post_new` θέα είναι τα ακόλουθα:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Όταν υποβάλουμε την αίτηση, επανερχόμαστε στην ίδια θέα, αλλά αυτή τη φορά έχουμε περισσότερα δεδομένα στο `αίτημα`, πιο συγκεκριμένα στο `αίτηση.POST` (το όνομα δεν έχει να κάνει με μία "δημοσίευση" blog, έχει να κάνει με το γεγονός ότι "δημοσιεύουμε" δεδομένα). Θυμηθείτε πως στον φάκελο HTML, ο `<form>` ορισμός μας είχε την μεταβλητή `method="POST"`; Όλα τα πεδία από την αίτηση είναι στο `request.POST`. Δεν πρέπει να μετονομάσετε το `POST` σε οτιδήποτε άλλο ( η μόνο άλλη έγκυρη τιμή για το `method` είναι `GET`, αλλά δεν έχουμε χρόνο για να εξηγήσουμε ποια είναι η διαφορά).

Έτσι στο *view* έχουμε δύο ξεχωριστές καταστάσεις να διαχειριστούμε: πρώτον, όταν αποκτούμε πρόσβαση στην σελίδα για πρώτη φορά και θέλουμε μία άδεια αίτηση, και δεύτερον, όταν πάμε πίσω στο *view* με όλα τα δεδομένα αίτησης που μόλις πληκτρολογήσαμε. Επομένως, πρέπει να προσθέσουμε μια συνθήκη ( θα χρησιμοποιήσουμε `if` για αυτό):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Είναι καιρός να συμπληρώσουμε τις τελείες `[...]`. If `method` is `POST` then we want to construct the `PostForm` with data from the form, right? Θα το κάνουμε αυτό όπως ακολουθεί:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Το επόμενο πράγμα είναι να ελέγξουμε αν η αίτηση είναι σωστή ( όλα τα απαιτούμενα πεδία έχουν οριστεί και δεν έχουν υποβληθεί εσφαλμένες τιμές). Το κάνουμε αυτό με `form.is_valid()`.

Ελέγχουμε αν η αίτηση είναι έγκυρη και αν ναι, μπορούμε να την αποθηκεύσουμε!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Βασικά, έχουμε δύο πράγματα εδώ: αποθηκεύουμε την αίτηση με `form.save` και προσθέτουμε έναν συγγραφέα ( μιας και δεν υπήρχε πεδίο `συγγραφέα` στο `PostForm` και αυτό το πεδίο είναι απαραίτητο). `commit=False` σημαίνει ότι δεν θέλουμε να αποθηκεύσουμε το μοντέλο `Post` ακόμα - θέλουμε να προσθέσουμε τον αναγνώστη πρώτα. Τις περισσότερες φορές θα χρησιμοποιήσετε το `form.save()` χωρίς το `commit=False`, αλλά σε αυτή την περίπτωση, πρέπει να το προμηθεύσουμε. `post.save()` θα διατηρήσει τις αλλαγές (προσθέτοντας τον συγγραφέα) και δημιουργείται ένα νέο blog post!

Τέλος, θα ήταν τρομερό εάν μπορούσαμε να πάμε αμέσως στην `post_detail` σελίδα για το νεοσυσταθέν blog post μας, σωστά; Για να το κάνουμε αυτό χρειαζόμαστε μια ακόμα είσοδο:

{% filename %}blog/views.py{% endfilename %}

```python
από ανακατεύθυνση εισαγωγής django.shortcuts
```

Προσθέστε το στην αρχή του αρχείου σας. Και τώρα μπορούμε να πούμε, "πηγαίνετε στη `post_detail` σελίδα για το νεοσυσταθέν post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` είναι το όνομα της προβολής στο οποίο θέλουμε να πάμε. Θυμηθείτε ότι αυτή η *άποψη * απαιτεί μία μεταβλητή `pk`; Για να το περάσουμε στις απόψεις, χρησιμοποιούμε `pk=post.pk`, όπου `post` είναι το νεοσύστατο blog post!

Εντάξει. έχουμε μιλήσει πολύ. αλλά μάλλον θέλουμε να δούμε πως μοιάζει το *view*, σωστά;

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

Ας δούμε αν λειτουργεί. Πηγαίνετε στην σελίδα http://127.0.0.1:8000/post/new/, προσθέστε ένα `τίτλο` και `κείμενο`, αποθηκεύστε το… και voilà! The new blog post is added and we are redirected to the `post_detail` page!

You might have noticed that we are setting the publish date before saving the post. Later on, we will introduce a *publish button* in **Django Girls Tutorial: Extensions**.

That is awesome!

> As we have recently used the Django admin interface, the system currently thinks we are still logged in. There are a few situations that could lead to us being logged out (closing the browser, restarting the DB, etc.). If, when creating a post, you find that you are getting errors referring to the lack of a logged-in user, head to the admin page http://127.0.0.1:8000/admin and log in again. This will fix the issue temporarily. There is a permanent fix awaiting you in the **Homework: add security to your website!** chapter after the main tutorial.

![Logged in error](images/post_create_error.png)

## Form validation

Now, we will show you how cool Django forms are. A blog post needs to have `title` and `text` fields. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new form. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

In `blog/urls.py` we add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

We will reuse the template `blog/templates/blog/post_edit.html`, so the last missing thing is a *view*.

Let's open `blog/views.py` and add this at the very end of the file:

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

Αυτό μοιάζει σχεδόν ίδιο με την `post_new` προβολή, σωστά; Αλλά όχι εντελώς. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

… και όταν έχουμε μόλις ανοίξει μία αίτηση με αυτή τη δημοσίευση για να επεξεργαστούμε:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Εντάξει, ας δοκιμάσουμε αν λειτουργεί! Πάμε στην σελίδα `post_detail`. Θα πρέπει να υπάρχει ένα κουμπί επεξεργασίας στην πάνω δεξιά γωνία:

![Κουμπί επεξεργασίας](images/edit_button2.png)

Όταν κάνετε κλικ θα δείτε την φόρμα με την δημοσίευση στο blog μας:

![Επεξεργαστείτε αίτηση](images/edit_form2.png)

Νιώστε ελεύθεροι να αλλάξετε τον τίτλο η το κείμενο και να αποθηκεύσετε τις αλλαγές!

Συγχαρητήρια! Η εφαρμογή σας γίνεται όλο και πιο πλήρης!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.0/topics/forms/

## Ασφάλεια

Being able to create new posts by clicking a link is awesome! Αλλά τώρα, οποιοσδήποτε επισκεφθεί την σελίδα σας θα μπορεί να φτιάξει μία καινούρια δημοσίευση blog, και αυτό είναι κάτι που πιθανώς δεν θέλετε. Ας το κάνουμε έτσι ώστε το κουμπί εμφανίζεται για εσάς αλλά για κανέναν άλλο.

In `blog/templates/blog/base.html`, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Πρόκειται να προσθέσουμε άλλη μία ετικέτα `{% if %}` σε αυτό, το οποίο θα κάνει τον σύνδεσμο να εμφανίζεται μόνο για χρήστες που είναι συνδεδεμένοι στον διαχειριστή. Προς το παρόν, είστε μόνο εσείς! Αλλάξτε την ετικέτα `<a>` να μοιάζει σαν αυτό:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Αυτό `{% if %}` θα προκαλέσει τον σύνδεσμο να σταλθεί στο πρόγραμμα περιήγησης μόνο αν ο χρήστης που ζητά την σελίδα είναι συνδεδεμένος. Αυτό δεν προστατεύει την δημιουργία νέων δημοσιεύσεων εντελώς, αλλά είναι ένα καλό πρώτο βήμα. Θα καλύψουμε περισσότερη ασφάλεια στα μαθήματα επέκτασης.

Θυμάστε το εικονίδιο επεξεργασίας που μόλις προσθέσαμε στην σελίδα λεπτομερειών; Θέλουμε επίσης να προσθέσουμε την ίδια αλλαγή εκεί, ώστε άλλα άτομα δεν θα μπορούν να επεξεργαστούν τις υπάρχουσες δημοσιεύσεις.

Ανοίξτε το `blog/templates/blog/post_detail.html` και βρείτε αυτή τη γραμμή:

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

Μιας και είστε πιθανότατα συνδεδεμένοι, εάν ανανεώσετε την σελίδα, δεν θα δείτε τίποτα διαφορετικό. Φορτώστε την σελίδα σε ένα διαφορετικό πρόγραμμα περιήγησης ή ένα παράθυρο ανώνυμης περιήγησης ( που ονομάζεται "InPrivate" στο Windows Edge), όμως, και θα δείτε ότι ο σύνδεσμος δεν εμφανίζεται, ούτε και το εικονίδιο!

## Ένα πράγμα ακόμα: ώρα να αναπτύξετε!

Για να δούμε αν όλα αυτά λειτουργούν στο PythonAnywhere. Ώρα για άλλη μια ανάπτυξη!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

* Finally, hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)