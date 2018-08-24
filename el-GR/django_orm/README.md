# Django ORM και QuerySets

Σε αυτό το κεφάλαιο θα μάθετε πως το Django συνδέεται στην βάση δεδομένων και αποθηκεύει δεδομένα μέσα της. Ας ξεκινήσουμε!

## Τι είναι ένα QuerySet;

Ένα QuerySet είναι, στην ουσία, μία λίστα αντικειμένων ενός δοθέν Μοντέλου. Τα QuerySets σας επιτρέπουν να διαβάσετε τα δεδομένα από την βάση δεδομένων, να τα φιλτράρετε και να τα ταξινομήσετε.

Είναι πιο εύκολο να μάθεις κάνοντας. Πάμε να δοκιμάσουμε;

## Παράθυρο εντολών Django

Άνοιξε την τοπική σου κονσόλα (όχι στο PythonAnywhere) και πληκτρολόγησε αυτήν την εντολή:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Το αποτέλεσμα πρέπει να είναι σαν αυτό:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too.

### Όλα τα αντικείμενα

Ας προσπαθήσουμε να εμφανίσουμε όλες τις δημοσιεύσεις του blog μας πρώτα. Μπορείς να το κάνεις με την ακόλουθη εντολή:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ωχ! Εμφανίστηκε ένα λάθος, μας λέει ότι δεν υπάρχει καμία δημοσίευση. Είναι σωστό- ξεχάσαμε να το εισάγουμε πρώτα!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Εισάγουμε το μοντέλο `Post` from `blog.models`. Ας προσπαθήσουμε να εμφανίσουμε όλες τις αναρτήσεις ξανά:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Αυτή είναι μια λίστα των αναρτήσεων που δημιουργήσαμε νωρίτερα! Δημιουργήσαμε αυτές τις αναρτήσεις χρησιμοποιώντας το περιβάλλον διαχειριστή Django. Αλλά τώρα θέλουμε να δημιουργήσουμε νέες αναρτήσεις χρησιμοποιώντας την Python, οπότε πως το κάνουμε αυτό;

### Δημιουργία αντικειμένου

Έτσι δημιουργείτε ένα νέο αντικείμενο Ανάρτηση στην βάση δεδομένων:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Αλλά μας λείπει ένα συστατικό εδώ: `εγώ`. Χρειαζόμαστε να περάσουμε μία παρουσία του μοντέλου `Χρήστη` ως συγγραφέα. Πως το κάνουμε αυτό;

Ας εισάγουμε το μοντέλο Χρήστη πρώτα:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Τι χρήστες έχουμε στην βάση δεδομένων μας; Δοκιμάστε αυτό:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now (adjust this line to use your own username):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat!

Now we can finally create our post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Ζήτω! Θέλετε να ελέγξετε αν λειτούργησε;

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Αυτό είναι, άλλη μια δημοσίευση στην λίστα!

### Προσθέστε περισσότερες δημοσιεύσεις

Τώρα μπορείτε να διασκεδάσετε λίγο και να προσθέσετε περισσότερες δημοσιεύσεις για να δείτε πως δουλεύει. Προσθέστε δυο-τρεις ακόμα και μετά προχωρήστε στο επόμενο μέρος.

### Φιλτράρισμα αντικειμένων

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. We will use `filter` instead of `all` in `Post.objects.all()`. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Now our piece of code looks like this:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Note** There are two underscore characters (`_`) between `title` and `contains`. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ordering objects

Τα QuerySets επίσης σου επιτρέπουν να ταξινομήσεις την λίστα των αντικειμένων. Ας προσπαθήσουμε να τα ταξινομήσουμε με το πεδίο `ημερομηνία_δημιουργίας`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Μπορούμε επίσης να αντιστρέψουμε την ταξινόμηση προσθέτοντας `-` στην αρχή:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Αλυσιδωτά QuerySets

Μπορείτε επίσης να συνδυάσετε QuerySets με το να τα **αλυσοδέσετε** μαζί:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Αυτό είναι πολύ ισχυρό και σας επιτρέπει να γράψετε αρκετά σύνθετα ερωτήματα.

Ωραία! Τώρα είστε έτοιμοι για το επόμενο μέρος! Για να κλείσετε το κέλυφος, πληκτρολογήστε αυτό:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```