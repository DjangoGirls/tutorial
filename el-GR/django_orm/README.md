# Django ORM και QuerySets

Σε αυτό το κεφάλαιο θα μάθετε πως το Django συνδέεται στην βάση δεδομένων και αποθηκεύει δεδομένα μέσα της. Ας ξεκινήσουμε!

## Τι είναι ένα QuerySet;

Ένα QuerySet είναι, στην ουσία, μία λίστα αντικειμένων ενός Μοντέλου. Τα QuerySets σας επιτρέπουν να διαβάσετε τα δεδομένα από την βάση δεδομένων, να τα φιλτράρετε και να τα ταξινομήσετε.

Είναι πιο εύκολο να μάθεις κάνοντας το. Πάμε να δοκιμάσουμε;

## Παράθυρο εντολών Django (django shell)

Άνοιξτε την κονσόλα (όχι στο PythonAnywhere) και πληκτρολογήστε αυτήν την εντολή:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Το αποτέλεσμα πρέπει να είναι σαν αυτό:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Είστε τώρα στην διαδραστική κονσόλα του Django. Είναι ακριβώς όπως το παράθυρο εντολών της Python, αλλά με μια μικρή επιπρόσθετη μαγεία του Django. :) Φυσικά, μπορείτε να χρησιμοποιήσετε όλες τις εντολές Python εδώ.

### Όλα τα αντικείμενα

Ας προσπαθήσουμε να εμφανίσουμε όλες τις δημοσιεύσεις του blog μας πρώτα. Μπορείτε να το κάνετε με την ακόλουθη εντολή:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ωχ! Εμφανίστηκε ένα λάθος, μας λέει ότι δεν υπάρχει καμία δημοσίευση. Είναι σωστό. Ξεχάσαμε να το εισάγουμε πρώτα (να το κάνουμε, δηλαδή, import)!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Εισάγουμε το μοντέλο `Post` από το module `blog.models`. Ας προσπαθήσουμε να εμφανίσουμε όλες τις αναρτήσεις ξανά:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Αυτή είναι μια λίστα των αναρτήσεων που δημιουργήσαμε νωρίτερα! Δημιουργήσαμε αυτές τις αναρτήσεις χρησιμοποιώντας το περιβάλλον διαχειριστή Django. Αλλά τώρα θέλουμε να δημιουργήσουμε νέες αναρτήσεις χρησιμοποιώντας την Python, οπότε πως το κάνουμε αυτό;

### Δημιουργία αντικειμένου

Έτσι δημιουργείται ένα νέο αντικείμενο Post στην βάση δεδομένων:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Αλλά μας λείπει ένα συστατικό εδώ: `εγώ`. Χρειαζόμαστε να περάσουμε μία παρουσία του μοντέλου `User` ως τον author. Πως το κάνουμε αυτό;

Ας εισάγουμε το μοντέλο User πρώτα:

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

Αυτός είναι ο χρήστης superuser που δημιουργήσαμε νωρίτερα! Ας πάρουμε ένα instance από την κλάση User τώρα (αντικαταστείστε το όνομα με το όνομα χρήστη που βάλατε νωρίτερα ως superuser):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Όπως βλέπετε, κάνουμε ένa `get` για έναν `User` με ένα `username` το οποίο ισούται με 'ola'. Καλό!

Τώρα μπορούμε, επιτέλους να δημιουργήσουμε το post:

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

Αυτό είναι, άλλη ένα post στη λίστα!

### Προσθέστε περισσότερα posts

Τώρα μπορείτε να διασκεδάσετε λίγο και να προσθέσετε περισσότερες δημοσιεύσεις για να δείτε πως δουλεύει. Προσθέστε δυο-τρεις ακόμα και μετά προχωρήστε στο επόμενο μέρος.

### Φιλτράρισμα αντικειμένων

Ένα μεγάλο μέρος των χαρακτηριστικών των QuerySets είναι η δυνατότητα να τα φιλτράρουμε. Ας υποθέσουμε ότι θέλουμε να βρούμε όλα τα posts όπου ο χρήστης ola έγραψε. Θα χρησιμοποιήσουμε την μέθοδο `filter` αντί της `all` στην εντολή `Post.objects.all()`. Μέσα στις παρενθέσεις της μεθόδου filter δηλώνουμε τα κριτήρια αναζήτησης για αυτό που ψάχνουμε. Στην περίπτβση μας, το κριτήριο είναι ένα `author` και θέλουμε να είναι ίσο με `me`. Ο τρόπος που το γράφουμε στο Django είναι `author=me`. Τώρα ο κώδικας μοιάζει κάπως έτσι:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Ή ίσως θα θέλαμε να δούμε όλα τα posts τα οποία περιέχουν τη λέξη 'title' μέσα στο πεδίο `title`;

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Σημείωση** Υπάρχουν δύο κάτω παύλες (`_`) μεταξύ του `title` και του `contains`. Το Django ORM χρησιμοποιεί αυτόν τον κανόνα για να διαχωρίσει τα ονόματα των πεδίων των μοντέλων ("title") με τους διαχωριστές ή τα φίλτρα ("contains"). Αν χρησιμποιούσατε μόνο μια κάτω παύλα θα λαμβάνατε το σφάλμα "FieldError: Cannot resolve keyword title_contains".

Μπορείτε επίσης να πάρετε μια λίστα από δημοσιευμένα posts. Το κάνουμε αυτό φιλτράροντας όλα τα posts που έχουν παρελθοντική ημ/νια `published_date`:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Δυστυχώς, το post που αναρτήσαμε από την Python κονσόλα δεν είναι δημοσιευμένο ακόμα. Αλλά μπορούμε να το αλλάξουμε αυτό. Πρώτα, πάρτε ένα instance από το post που θέλετε να δημοσιεύσετε:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Και έπειτα δημοσιεύστε το με την μέθοδο `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Τώρα προσπαθήστε να πάρετε μια λίστα από δημοσιευμένα posts ξανά (πιέστε το πάνω βελάκι στο πληκτρολόγιο 3 φορές και έπειτα `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Ταξινόμηση objects

Τα QuerySets επίσης σου επιτρέπουν να ταξινομήσεις την λίστα των αντικειμένων. Ας προσπαθήσουμε να τα ταξινομήσουμε ως προς πεδίο `created_date`:

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