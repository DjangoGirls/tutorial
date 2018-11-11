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

Θυμάστε όταν είπαμε να συμπεριλαμβάνουμε κώδικα γραμμένο σε διαφορετικά αρχεία; Τώρα είναι η στιγμή να συπεριλάβουμε το μοντέλο που είχαμε γράψει στο αρχείο `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

So finally our `blog/views.py` file should look like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/