{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# Επεκτείνετε την εφαρμογή σας

Έχουμε ήδη ολοκληρώσει όλα τα βήματα που είναι απαραίτητα για τη δημιουργία της ιστοσελίδας μας: γνωρίζουμε πώς να γράψουμε ένα μοντέλο, ένα url, ένα view και ένα template. Γνωρίζουμε επίσης πώς να κάνουμε το website μας όμορφο.

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

{% raw %}Θέλουμε να έχουμε έναν σύνδεσμο (link) για κάθε τίτλο του post μέσα στη λίστα ο οποίος όταν κλικάρετε να μεταβαίνει στη σελίδα λεπτομερειών του post. Ας αλλάξουμε το `<h1><a href="">{{ post.title }}</a></h1>` έτσι ώστε να συνδέεται με τη σελίδα λεπτομερειών του post:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %}Ώρα να εξηγήσουμε το μυστηριώδης `{% url 'post_detail' pk=post.pk %}`. Όπως υποψιάζεστε, το `{% %}` σημαίνει ότι χρησιμοποιούμε τα Django template tags. Αυτή τη φορά θα χρησιμοποιήσουμε ένα που δημιουργεί μια διεύθυνση URL για εμάς!{% endraw %}

Το μέρος `post_detail` σημαίνει ότι θα πρέπει το Django θα περιμένει μια διεύθυνση URL με το όνομα αυτό στο αρχείο `blog/urls.py` με το όνομα=post_detail

Τι γίνεται όμως με το `pk=post.pk`; Το `pk` είναι σύντμηση για τη λέξη primary key, το οποίο είναι ένα μοναδικό όνομα για κάθε εγγραφή σε μια βάση δεδομένων. Επειδή δεν ορίσαμε κάποιο primary key στο μοντέλο μας `Post`, το Django δημιουργεί ένα για μας (από προεπιλογή, ένας αριθμός που αυξάνεται κατά ένα για κάθε εγγραφή, δηλαδή 1, 2, 3) και το προσθέτει ως ένα πεδίο που ονομάζεται `pk` σε κάθε μία από τα post μας. Μπορούμε να έχουμε πρόσβαση σε κάθε primary key γράφοντας `post.pk`, με τον ίδιο τρόπο που έχουμε πρόσβαση σε άλλα πεδία (`title`, `author`, κ.λπ.) του `Post` object μας!

Τώρα, όταν πάμε στη διεύθυνση http://127.0.0.1:8000 / θα εμφανιστεί σφάλμα (όπως ήταν αναμενόμενο, καθώς δεν έχουμε ακόμη διεύθυνση URL ή κάποιο *view* για το `post_detail`). Αυτό θα μοιάζει κάπως έτσι:

![NoReverseMatch error](images/no_reverse_match2.png)

## Δημιουργία ενός URL για τις λεπτομέρειες του post

Ας δημιουργήσουμε μια διεύθυνση URL στο αρχείο `urls.py` για το `post_detail` *view* μας!

Θέλουμε οι λεπτομέρειες του πρώτου μας post να εμφανίζονται σε αυτό το **URL**: http://127.0.0.1:8000/θέση/1 /

Ας δημιουργήσουμε ένα URL μέσα στο αρχείο `blog/urls.py` που θα κατευθύνει το Django στο *view* με το όνομα `post_detail`, που με τη σειρά του θα δείξει ένα ολόκληρο blog post. Ανοίξτε το αρχείο `blog/urls.py` στο πρόγραμμα επεξεργασίας κώδικα και προσθέστε τη γραμμή `path('post/<int:pk>/'), views.post_detail, name='post_detail'),` έτσι ώστε το αρχείο να μοιάζει με αυτό:

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

Αυτή τη φορά το *view* δέχεται μια έξτρα παράμετρο, το `pk`. Το *view* μας χρειάζεται με κάποιο τρόπο να αιχμαλωτίσει αυτή την παράμετρο, σωστά; Έτσι, λοιπόν, θα ορίσουμε την συνάρτηση μας ως `def post_detail(request, pk):`. Σημειώστε ότι χρειάζεται να ορίσουμε την παράμετρο με το ίδιο ακριβώς όνομα που δώσαμε στο URL μέσα στο αρχείο urls (`pk`). Η απουσία της παραμέτρου είναι λάθος και θα παρουσιάσει σφάλμα!

Τώρα, θέλουμε να πάρουμε ένα και μόνο ένα post. Για να το κάνουμε αυτό, μπορούμε να χρησιμοποιήσουμε τα querysets, όπως παρακάτω:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Αλλά αυτός ο κώδικας έχει πρόβλημα. Αν δεν υπάρχει κάποιο `Post` με το δεδομένο `primary key` (`pk`) θα έχουμε ένα άσχημο σφάλμα!

![DoesNotExist error](images/does_not_exist2.png)

Δεν το θέλουμε αυτό! Αλλά ευτυχώς το Django περιλαμβάνει με κάτι που θα μας φανεί χρήσιμο: `get_object_or_404`. In case there is no `Post` with the given `pk`, it will display much nicer page, the `Page Not Found 404` page.

![Page not found](images/404_2.png)

The good news is that you can actually create your own `Page not found` page and make it as pretty as you want. But it's not super important right now, so we will skip it.

OK, time to add a *view* to our `views.py` file!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## Create a template for the post details

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

It will look like this:

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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ..` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://yourname.pythonanywhere.com page to see the result.

And that should be it! Congrats :)