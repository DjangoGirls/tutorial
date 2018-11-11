{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Εισαγωγή στην Python

> Μέρος αυτού του κεφαλαίου είναι βασισμένο στους οδηγούς από την κοινότητα Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Ας γράψουμε λίγο κώδικα!

## Παράθυρο εντολών Python

> Για τους αναγνώστες στο σπίτι: αυτό το μέρος που καλύπτεται από το βίντεο [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Για να αρχίσετε να παίζετε με την Python, πρέπει να ανοίξετε μια *γραμμή εντολών* στον υπολογιστή σας. Πρέπει ήδη να ξέρετε πως το κάνουμε αυτό. Το μάθαμε στο κεφάλαιο [Εισαγωγή στη γραμμή εντολών](../intro_to_command_line/README.md).

Μόλις είστε έτοιμοι, ακολουθήστε τις παρακάτω οδηγίες.

Θέλουμε να ανοίξουμε μια κονσόλα Python. Πληκτρολογήστε `python` αν είστε σε Windows ή `python3` αν είστε σε Mac OS/Linux και πατήστε `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Η πρώτη σας Python εντολή!

Αφού εκτελέσετε την εντολή Python, το prompt θα αλλάξει σε `>>>`. Για εμάς αυτό σημαίνει ότι τώρα μπορεί να χρησιμοποιούμε μόνο εντολές για τη γλώσσα Python. Δεν χρειάζεται να πληκτρολογήσετε `>>>`. Θα το κάνει η Python για σας.

Εάν θέλετε να τερματίσετε την κονσόλα Python σε οποιοδήποτε σημείο, απλά πληκτρολόγηστε `exit()` ή `Ctrl + Z` για Windows και `Ctrl + D` για Mac/Linux. Τότε δεν θα μπορείτε να δείτε το `>>>` πια.

Για τώρα δεν θέλουμε να φύγουμε από αυτό το περιβάλλον. Θέλουμε να μάθουμε περισσότερα γι'αυτό. Ας ξεκινήσουμε να γράφουμε μερικές μαθηματικές πράξεις, όπως `2 + 3` και μετά πατάμε `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Ωραία! Είδατε την απάντηση από κάτω; Η Python ξέρει μαθηματικά! Μπορείτε να δοκιμάσετε και άλλες εντολές, όπως:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Για να εκτελέσετε εκθετικούς υπολογισμούς, πχ 2 στη δύναμη του 3, γράφουμε: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Διασκέδασε με αυτό για λίγο και στη συνέχεια συνεχίστε πίσω εδώ. :)

Όπως μπορείτε να δείτε, η Python είναι μια πολύ καλή αριθμομηχανή. Αν αναρωτιέστε τι άλλο μπορείτε να κάνετε…

## Strings

Τι θα λέγατε για το όνομα σας; Πληκτρολογήστε το μικρό σας όνομα μέσα σε "αυτάκια", όπως παρακάτω:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
"Ola"
```

Μόλις δημιουργήσατε το πρώτο σας string! Είναι μια ακολουθία χαρακτήρων η οποία επεξεργάζεται από τον υπολογιστή. Ένα string πρέπει πάντα να ξεκινά και να τελειώνει με τον ίδιο χαρακτήρα. Αυτό μπορεί να είναι είτε μονά "αυτάκια" (`'`) ή διπλά (`"`) (καμία διαφορά!). Τα "αυτάκια" λένε στην Python το εξής: ότι υπάρχει ανάμεσα θεώρησε το ως ένα string.

Τα strings μπορούν να ενωθούν. Δοκιμάστε το ακόλουθο:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
"Hi there Ola"
```

Μπορείτε επίσης να πολλαπλασιάσετε strings με αριθμό:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Αν χρειαστεί να βάλετε κάποια απόστροφο μέσα στο string, υπάρχουν δύο τρόποι να το κάνετε.

Χρησιμοποιώντας διπλά "αυτάκια":

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

ή κάνοντας escape την απόστροφο με ένα backslash (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Ωραίο εε; Για να δείτε το όνομα σας σε κεφαλαία, γράψτε:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Μόλις χρησιμοποιήσατε την `upper` **method** πάνω στο string σας! Η μέθοδος (όπως η `upper()`) είναι μια ακολουθία από οδηγίες/εντολές που η Python πρέπει να εκτελέσει πάνω σε ένα συγκεκριμένο object (`"Ola"`) μόλις την καλέσετε.

Αν θέλετε να μάθετε τον αριθμό των γραμμάτων που περιέχονται στο όνομα σας, υπάρχει συνάρτηση **function** και γι'αυτό!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Αναρρωτιέστε γιατί μερικές φορές καλείτε συναρτήσεις με την τελεία `.` στο τέλος ενός string (όπως `"Ola".upper()`) και άλλες καλείτε μια συνάρτηση και τοποθετείτε μέσα στις παρενθέσεις το string; Λοιπόν, σε κάποια σημεία οι συναρτήσεις ανήκουν σε objects, όπως η `upper()` η οποία επιδρά μόνο πάνω σε strings. Σε αυτή την περίπτωση, ονομάζουμε τις συναρτήσεις αυτές μεθόδους (**method**). Άλλες, πάλι, φορές οι συναρτήσεις δεν ανήκουν σε κάτι συγκεκριμένο και μπορούν να χρησιμοποιηθούν σε οποιουδήποτε τύπου object, όπως η `len()`. Γι'αυτό δίνουμε το string `"Ola"` ως παράμετρο στη συνάρτηση `len`.

### Περίληψη

Αρκετά με τα strings. Μέχρι τώρα μάθατε:

- **το prompt** – γράφοντας εντολές (κώδικα) μέσα σε περειβάλλον της Python έχει ως αποτέλεσμα να παίρνετε απαντήσεις από την Python
- **αριθμούς και strings** – στην Python οι αριθμοί χρησιμοποιούνται για μαθηματικά και τα strings για χαρακτήρες
- **operators** – όπως `+` και `*`, συνδυάζουν τιμές και παράγουν μια νέα τιμή
- **functions** – όπως η `upper()` και η `len()`, εκτελούν κάποιες ενέργειες στα objects.

Αυτά είναι τα βασικά για κάθε γλώσσα προγραμματισμού. Είστε έτοιμοι για κάτι πιο δύσκολο; Είμαστε σίγουροι ότι είστε!

## Σφάλματα

Ας δοκιμάσουμε κάτι καινούργιο. Μπορούμε να βρούμε το μήκος ενός αριθμού ακριβώς όπως κάναμε με το όνομα σας νωρίτερα; Πληκτρολογήστε `len(304023)` και πατήστε `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Μόλις λάβατε το πρώτο σας σφάλμα! Το εικονίδιο {{ warning_icon }} είναι ο δικός μας τρόπος να σας πούμε ότι ο κώδικάς που πρόκειται να τρέξετε δεν θα έχει τα αναμενόμενα αποτελέσματα. Κάνοντας λάθη (ακόμα και εσκεμμένα) είναι σημαντικό κομμάτι κατά τη διάρκεια της εκμάθησης!

Το συγκεκριμένο σφάλμα λέει ότι τα objects τύπου "int" (από τη λέξη integers, που σημαίνει ακέραιοι αριθμοί) δεν έχουν μήκος. Οπότε τι κάνουμε τώρα; Μήπως να γράψουμε τον αριθμό ως ένα string; Τα strings έχουν μήκος, έτσι;

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Δούλεψε! Χρησιμοποιήσαμε τη συνάρτηση `str` μέσα στην `len`. Η `str()` μετατρέπει τα πάντα σε strings.

- Η συνάρτηση `str` μετατρέπει πράγματα σε **strings**
- Η συνάρτηση `int` μετατρέπει πράγματα σε **integers**

> Σημαντικό: μπορούμε να μετατρέψουμε αριθμούς σε κείμενο (strings) αλλά όχι απαραίτητα το αντίστροφο. Τι θα συνέβαινε αν τρέχατε `int('hello')`;

## Μεταβλητές

Ένα σημαντικό έννοια στον προγραμματισμό είναι οι μεταβλητές. Μια μεταβλητή δεν είναι τίποτε άλλο από ένα όνομα που μπορεί να επαναχρησιμοποιηθεί αργότερα. Οι προγραμματιστές χρησιμοποιούν τις μεταβλητές για την αποθήκευση δεδομένων, κάνοντας τον κώδικα πιο ευανάγνωστο χωρίς να χρειάζεται να θυμούνται τι ήταν τι.

Ας υποθέσουμε ότι θέλετε να δημιουργήσετε μια μεταβλητή με το όνομα `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Γράφουμε name ίσον με Ola.

Όπως θα παρατηρήσατε, το πρόγραμμα δεν επέστρεψε τίποτα όπως πριν. Πως ξέρουμε, λοιπόν, ότι η μεταβλητή υπάρχει; Πληκτρολογήστε`name` και μετά πιέστε `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Ναιιι! Η πρώτη σας μεταβλητή! :) Μπορείτε πάντα να αλλάξετε την τιμή αυτής της μεταβλητής:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Μπορείτε να χρησιμοποιήσετε μεταβλητές σε συναρτήσεις:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Φοβερό, έτσι; Οι μεταβλητές μπορεί να είναι οτιδήποτε (ακόμα και αριθμοί). Δοκιμάστε το εξής:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Αλλά τι θα γινόταν αν χρησιμοποιούσαμε λάθος όνομα; Τι θα συμβεί; Ας το δοκιμάσουμε!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Ένα σφάλμα! Όπως μπορείτε να δείτε, η Python έχει διαφορετικού τύπου σφάλματα (τα έχει κατατάξει σε κατηγορίες). Αυτό εδώ ονομάζεται **NameError**. Η Python θα σας εμφανίσει αυτό το σφάλμα αν προσπαθήσετε να χρησιμοποιήσετε κάποια μεταβλητή της οποίας το όνομα δεν έχει δηλωθεί. Αν εμφανίστηκε αυτό το σφάλμα νωρίτερα σε εσάς, δείτε τον κώδικά σας μήπως και έχετε κάνει λάθος σε κάποιο όνομα μεταβλητής.

Παίξτε για λίγο με αυτό και δείτε τι μπορείτε να κάνετε!

## Η συνάρτηση print

Δοκιμάστε αυτό:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Όταν απλώς πληκτρολογείτε `name`, η Python ανταποκρίνεται με το λεγόμενο string *representation* της τιμής της μεταβλητής 'name', η οποία είναι τα γράμματα M-a-r-i-a, περικυκλωμένα με τα μονά "αυτάκια", ''. Όταν λέτε `print(name)`, η Python θα "εκτυπώσει στην οθόνη" τα περιεχόμενα της μεταβλητής, χωρίς τα "αυτάκια", κάτι το οποίο είναι πιο ωραίο.

Όπως θα δούμε και αργότερα, η συνάρτηση `print()` είναι χρήσιμη όταν θέλουμε να εκτυπώσουμε πράγματα μέσα σε συναρτήσεις ή όταν θέλουμε να εκτυπώσουμε πράγματα σε πολλαπλές γραμμές αντί μιας.

## Λίστες

Πέρα από τα strings και τους αριθμούς, η Python προσφέρει αρκετά ακόμα διαφορετικούς τύπους objects. Παρακάωτ θα περιγράψουμε αυτό που αποκαλούμε λίστα (**list**). Οι λίστες είναι αυτό που φαντάζεστε: objects τα οποία είναι λίστες άλλων objects. :)

Πηγαίνετε και δημιουργήστε μια λίστα:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Ναι, αυτή είναι μια κενή λίστα. Όχι πολύ χρήσιμη έτσι; Ας δημιουργήσουμε μια λίστα με αριθμούς. Δεν θέλουμε να επαναλαμβανόμαστε όλη την ώρα, οπότε θα βάλουμε τη λίστα μέσα σε μια μεταβλητή:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Τέλεια, έχουμε μια λίστα! Τι μπορούμε να κάνουμε με αυτή; Ας δούμε πόσοι αριθμοί υπάρχουν μέσα στη λίστα. Ξέρετε, μήπως, ποια συνάρτηση μπορούμε να χρησιμοποιήσουμε γι'αυτό; Το ξέρετε ήδη!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Ναι! Η συνάρτηση `len()` σας δίνει τον αριθμό των objects μέσα σε μια λίστα. Ωραίο, έτσι; Ίσως να μπορούμε να ταξινομήσουμε τους αριθμούς:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Αυτό δεν επιστρέφει τίποτα, απλώς άλλαξε τη σειρά με την οποία εμφανίζονται οι αριθμοί στη λίστα. Ας εκτυπώσουμε τη λίστα να δούμε πως άλλαξαν τα δεδομένα της:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Όπως βλέπετε, οι αριθμοί μέσα στη λίστα είναι πλέον ταξινομημένοι κατά αύξοντα αριθμό. Συγχαρητήρια!

Ίσως να θέλουμε να αντιστρέψουμε αυτή τη σειρά. Ας το κάνουμε!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Αν θέλετε να προσθέσετε κάτι στη λίστα σας, μπορείτε να το κάνετε με την ακόλουθη εντολή:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Αν θέλετε να εμφανίσετε μόνο το πρώτο στοιχείο της λίστας, μπορείτε να το κάνετε χρησιμοποιώντας τα λεγόμενα **indexes**. Ένα index είναι ένας αριθμός ο οποίος δηλώνει σε ποιο σημείο ένα στοιχείο υπάρχει σε μια λίστα. Οι προγραμματιστές προτιμούν να ξεκινούν από το 0, οπότε το πρώτο στοιχείο θα βρίσκεται στη θέση (index) 0, το επόμενο στη θέση 1 κοκ. Δοκιμάστε αυτό:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Όπως μπορείτε να δείτε, μπορείτε να έχετε πρόσβαση στα διαφορετικά στοιχεία μια λίστας γνωρίζοντας το όνομα της λίστας και τη θέση (index) του κάθε στοιχείου, δηλώνοντας το μέσα σε αγκύλες ([]).

Για να διαγράψετε κάτι από τη λίστα, θα χρειαστεί να χρησιμοποιήσετε τα **indexes** καθώς και την μέθοδο `pop()`. Δηλαδή, θα πρέπει να ξέρετε ποιο στοιχείο να διαγράψετε. Ας δοκιμάσουμε ένα παράδειγμα. Θα διαγράψουμε το πρώτο στοιχείο της λίστας.

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

Δούλεψε μια χαρά!

Παίξτε λίγο παραπάνω: δοκιμάστε μερικές άλλες θέσεις (αριθμός μέσα στην αγκύλη) όπως 6, 7, 1000, -1, -6 ή -1000. Δείτε αν μπορείτε να προβλέψετε το αποτέλεσμα πριν πατήσετε enter. Συμφωνούν τα αποτελέσματα με την πρόβλεψη σας;

Μπορείτε να βρείτε την λίστα με όλες διαθέσιμες μεθόδους για μια λίστα στο Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Λεξικά

> Για τους αναγνώστες στο σπίτι: αυτή η ενότητα καλύπτεται στο βίντεο [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Ένα λεξικό (dictionary ή όπως έχει επικρατήσει, dict εν συντομία) είναι όμοιο με μια λίστα αλλά έχετε πρόσβαση στις τιμές όχι κατά θέση (index) αλλά κατά ένα κλειδί (key). Ένα κλειδί μπορεί να είναι ένα string ή ένας αριθμός. Η σύνταξη για ένα κενό λεξικό είναι:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Αυτό σηλώνει ότι μόλις δημιουργήσατε ένα κενό dict. Συγχαρητήρια!

Τώρα, προσπαθήστε να εκτελέσετε την ακόλουθη εντολή (αντικαθιστώντας με δικά σας στοιχεία):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Με αυτή την εντολή μόλις δημιουργήσατε μια μεταβλητή με το όνομα `participant` με τρια ζευγάρια κλειδι-τιμή (key value pairs):

- Το πρώτο κλειδί είναι το `name` το οποίο αντιστοιχεί την τιμή `'Ola'` (είναι ένα `string` object),
- Το δεύτερο κλειδί με το όνομα `country` αντιστοιχεί στην τιμή `'Poland'` (άλλο ένα `string`),
- και το τρίτο κλειδί `favorite_numbers` αντιστοιχεί στην τιμή `[7, 42, 92]` (μια λίστα `list` με τρεις αριθμούς μέσα της).

Μπορείτε να δείτε τις τιμές κάθε κλειδιού με την ακόλουθη σύνταξη:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Βλέπετε ότι είναι όμοια με μια λίστα. Απλώς δεν χριάζεται να θυμάστε τη θέση - μόνο το όνομα.

Τι θα συμβεί αν ζητήσουμε μια τιμή ενός κλειδιού η οποία δεν υπάρχει; Μπορείτε να μαντέψετε; Ας δοκιμάσουμε να δούμε!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Είδατε, άλλο ένα σφάλμα το οποίο λέγεται **KeyError**. Η Python είναι αρκετά καλή σε αυτό. Δηλαδή στην περιγραφικότητα των σφαλμάτων της. Σας λέει ότι το κλειδί `'age'` δεν υπάρχει στο λεξικό.

Πότε πρέπει να χρησιμοποιείτε λεξικό έναντι μιας λίστας; Αυτό είναι ένα καλό ερώτημα. Σκεφτείτε λίγο την απάντηση πριν προχωρήσετε.

- Χρειάζεστε μια ταξινομημένη ακολουθία από στοιχεία; Η απάντηση είναι λίστα.
- Χρειάζεστε να συσχετίζετε κλειδιά ούτως ώστε να τα αναζητείτε αργότερα μόνο με το όνομα τους και όχι με τη θέση τους; Η απάντηση είναι dict.

Τα dicts όπως και οι λίστες είναι *mutable*, που σημαίνει ότι μπορούν να αλλάξουν μετά τη δημιουργία τους. Μπορείτε να προσθέσετε ένα νέο κλειδί-τιμή στο λεξικό αφού δημιουργηθεί, όπως παρακάτω:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Όπως στις λίστες, χρησιμοποιώντας τη μέθοδο `len()` σε λεξικά, θα πάρετε τον αριθμό των ζευγαριών κλειδί-τιμή μέσα σε ένα λεξικό. Γράφτε το παρακάτω:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Ελπίζουμε να βγάζουν νόημα όλα αυτά μέχρι τώρα. :) Είστε έτοιμοι για περισσότερη διασκέδαση με τα λεξικά; Συνεχίστε να διαβάζετε για περισσότερα πράγματα που μπορείτε να κάνετε.

Μπορείτε να χρησιμοποιήσετε την μέθοδο `pop()` για να διαγράψετε ένα στοιχείο (ζευγάρι από κλειδί-τιμή) από ένα dict. Για παράδειγμα, αν θέλετε να διαγράψετε το ζευγάρι με το κλειδί `'favorite_numbers'`, γράψτε την ακόλουθη εντολή:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Όπως μπορείτε να δείτε από την έξοδο, το ζευγάρι του κλειδιού 'favorite_numbers' διαγράφηκε επιτυχώς.

Επίσης, μπορείτε να αλλάξετε την τιμή σε μια τιμή μέσα σε ένα λεξικό (αλλά όχι το ίδιο το κλειδί). Δοκιμάστε το εξής:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Όπως βλέπετε, η τιμή του κλειδιού `'country'` αλλάξε από `'Poland'` σε `'Germany'`. :) Φοβερό έτσι; Μπράβο! Μόλις μάθατε άλλο ένα απίθανο πράγμα.

### Περίληψη

Τέλεια! Ξέρετε πολλά σχετικά με τον προγραμματισμό τώρα. Στην τελευταία ενότητα μάθατε τα εξής:

- **errors** – μάθατε πως να διαβάζετε και να καταλαβαινέτε τα σφάλματα τα οποία εμφανίζονται αν η Python δεν καταλαβαίνει κάποια εντολή που της δώσατε
- **variables** – ονόματα για objects τα οποία σας επιτρέπουν να γράφετε κώδικα πιο εύκολα αλλά και να είναι ο κώδικας σας πιο ευανάγνωστος
- **lists** – λίστες από objects που αποθηκεύονται σε μια συγκεκριμένη σειρά
- **dictionaries** – αντικείμενα τα οποία αποθηκεύονται υπό τη μορφή ζευγαριού κλειδί-τιμή

Ενθουσιασμένοι για το επόμενο μέρος; :)

## Σύγκριση πραγμάτων

> Για τους αναγνώστες στο σπίτι: αυτή η ενότητα καλύπτεται στο βίντεο [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Ένα μεγάλος μέρος του προγραμματισμού περιλαμβάνει τη σύγκριση πραγμάτων. Ποιο είναι το πιο εύκολο πράγμα να συγκρίνουμε; Οι αριθμοί! Ας δούμε πως:

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
```

Δώσαμε στην Python μερικούς αριθμούς προς σύγκριση. Όπως βλέπετε, όχι μόνο μπορεί να συγκρίνει αριθμούς αλλά και αποτελέσματα από μεθόδους. Καλό εε;

Αναρρωτιέστε γιατί βάλαμε `==` (δύο ίσον σύμβολα) για να εξακριβώσουμε αν οι αριθμοί είναι ίσοι; Χρησιμοποιούμε το μονό ίσον `=` για να αναθέσουμε μια τιμή σε μια μεταβλητή. Πάντα, **πάντα** θα χρειάζεται να βάζετε διπλό ίσον – `==` – αν θέλετε να δείτε αν δύο πράγματα είναι ίσα μεταξύ τους. Αν οι τιμές τους, δηλαδή, είναι ίδιες. Μπορούμε επίσης να εξακριβώσουμε αν οι τιμές τους δεν είναι ίσες. Γι'αυτό χρησιμοποιούμε το σύμβολο `!=`, όπως φαίνεται παραπάνω.

Ας δώσουμε στην Python δύο ακόμα αποστολές:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y means: x is greater than y
- x `<` y means: x is less than y
- x `<=` y means: x is less than or equal to y
- x `>=` y means: x is greater than or equal to y

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Save it!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Exit the Python interpreter
- Open up our code editor of choice
- Save some code into a new python file
- Run it!

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. This is called "syntax highlighting", and it's a really useful feature when coding. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

If you get stuck, ask for help. That's exactly what the coaches are here for!

Now use Python to execute the code in the file like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### What if a condition isn't True?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comments

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Περίληψη

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Your own functions!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Congratulations! You just learned how to write functions! :)

## Loops

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Περίληψη

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)