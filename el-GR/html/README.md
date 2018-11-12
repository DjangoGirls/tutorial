# Εισαγωγή στην HTML

Ίσως αναρρωτιέστε, τι είναι ένα template;

Ένα template είναι ένα αρχείο που μπορούμε να επαναχρησιμοποιούμε για να παρουσιάζουμε διαφορετικές πληροφορίες μέσα από μια συνεπή μορφή. Για παράδειγμα, θα μπορούσατε να χρησιμοποιήσετε ένα πρότυπο (template) για να σας βοηθήσει να γράψετε μια επιστολή, γιατί αν και κάθε επιστολή μπορεί να περιέχει διαφορετικό μήνυμα και να απευθύνεται σε ένα διαφορετικό πρόσωπο, μερικά σημεία θα μοιραστούν την ίδια μορφή.

Η μορφή ενός Django template περιγράφεται με μια γλώσσα που ονομάζεται HTML (που είναι η HTML που αναφέραμε στο πρώτο κεφάλαιο, **Πώς λειτουργεί το Internet**).

## Τι είναι η HTML;

Η HTML είναι ένας κώδικας που ερμηνεύεται από τον web browser σας – όπως ο Chrome, Firefox ή Safari - για να εμφανιστεί μια ιστοσελίδα στον χρήστη.

HTML σημαίνει "HyperText Markup Language". Η λέξη **HyperText** σημαίνει ότι είναι ένας τύπος κειμένου που υποστηρίζει υπερ-συνδέσεις μεταξύ των σελιδών. **Markup** σημαίνει ότι έχουμε λάβει ένα έγγραφο και το έχουμε επισημάνει με κώδικα ούτως ώστε να πει κάτι (στην προκειμένη περίπτωση, ένας browser) πώς να ερμηνεύσει τη σελίδα. Ο HTML κώδικας είναι χτισμένος με **tags**, όπου καθένα αρχίζει με `<` και τελειώνει με `>`. Αυτά τα tags αντιπροσωπεύουν τα markup **elements**.

## Το πρώτο σας template!

H δημιουργία ενός template σημαίνει τη δημιουργία ενός αρχείου template. Τα πάντα είναι ένα αρχείο, σωστά; Πιθανώς να το έχετε παρατηρήσει αυτό.

Τα templates αποθηκεύονται στο φάκελο `blog/templates/blog`. Άρα, πρώτα δημιουργήστε έναν φάκελο με το όνομα `templates` μέσα στον φάκελο blog. Στη συνέχεια, δημιουργήστε έναν άλλο φάκελο που ονομάζεται `blog` μέσα στον φάκελο templates:

    blog
    └───templates
        └───blog
    

(Ίσως να αναρωτηθείτε γιατί χρειαζόμαστε δύο φακέλους που και οι δύο ονομάζονται `blog`. Όπως θα ανακαλύψετε αργότερα, αυτό είναι μια τεχνική ονομασίας που κάνει τη ζωή ευκολότερη όταν τα πράγματα αρχίζουν να περιπλέκονται.)

Και τώρα δημιουργήστε ένα αρχείο `post_list.html` (απλά αφήστε το κενό για τώρα) μέσα στον φάκελο `blog/templates/blog`.

Δείτε πώς εμφανίζεται η ιστοσελίδα σας στο: http://127.0.0.1:8000 /

> Αν παρουσιάζεται ακόμα το σφάλμα `TemplateDoesNotExist`, δοκιμάστε να επανεκκινήσετε τον server σας. Προσπαθήστε να τον σταματήσετε (πιέζοντας Ctrl + C) και επανεκκινήστε τον τρέχοντας την εντολή `python manage.py runserver`.

![Σχήμα 11.1](images/step1.png)

Δεν υπάρχει σφάλμα πια! Συγχαρητήρια :) Ωστόσο, ιστοσελίδα σας δεν δείχνει κάτι παρά μια κενή σελίδα επειδή το template σας είναι κενό. Πρέπει να το διορθώσουμε αυτό.

Ανοίξτε το νέο αρχείο και προσθέστε τα εξής:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Οπότε πως φαίνεται τώρα η ιστοσελίδα μας; Επισκεφθείτε το για να μάθετε: http://127.0.0.1:8000/

![Σχήμα 11.2](images/step3.png)

Λειτουργεί! Καλή δουλειά :)

* Το πιο βασικό tag, `<html>`, είναι πάντα η αρχή οποιασδήποτε ιστοσελίδας και `</html>` είναι πάντα στο τέλος. Όπως μπορείτε να δείτε, όλο το περιεχόμενο της σελίδας ενσωματώνεται μεταξύ της αρχής του tag `<html>` και του tag κλεισίματος `</html>`
* `<p>`είναι ένα tag για στοιχεία κειμένου παραγράφου. Το tag `</p>` κλείνει κάθε παράγραφο

## Head και body

Κάθε σελίδα HTML χωρίζεται σε δύο στοιχεία: το **head** και το **body**.

* To **head** είναι ένα στοιχείο (element) που περιέχει πληροφορίες σχετικά με το έγγραφο αλλά αυτές οι πληροφορίες δεν εμφανίζονται στην οθόνη.

* Το **body** είναι ένα στοιχείο που περιέχει όλα τα υπόλοιπα που εμφανίζονται ως μέρος της ιστοσελίδας.

Χρησιμοποιούμε το tag `<head>`για να πούμε στον browser σχετικά με τη διαμόρφωση της σελίδας και το tag `<body>` για να πούμε για το περιεχόμενο της.

Για παράδειγμα, μπορείτε να προσθέσετε τίτλο στην ιστοσελίδα σας μέσα από το tag `<head>`, όπως παρακάτω:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Αποθηκεύστε το αρχείο και ανανέωστε την σελίδα σας.

![Σχήμα 11.3](images/step4.png)

Παρατηρήσατε πως ο browser κατάλαβε το "Ola's blog" ως τίτλο για την σελίδα σας; Ερμήνευσε το κείμενο `<title>Ola's blog</title>` και το τοποθέτησε στην μπάρα τίτλων του browser σας (το ίδιο κείμενο θα λειτουργήσει και ως όνομα σελιδοδείκτη κλπ).

Probably you have also noticed that each opening tag is matched by a *closing tag*, with a `/`, and that elements are *nested* (i.e. you can't close a particular tag until all the ones that were inside it have been closed too).

It's like putting things into boxes. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Παραμετροποιώντας το template

Μπορείτε, τώρα, να διασκεδάσετε λιγάκι και να τροποιήσετε το template σας! Παρακάτω παρουσιάζονται μερικά χρήσιμα tags γι'αυτό:

* `<h1>A heading</h1>` για επικεφαλίδες
* `<h2>A sub-heading</h2>` για επικεφαλίδες χαμηλότερου επιπέδου
* `<h3>A sub-sub-heading</h3>` …κοκ μέχρι την `<h6>`
* `<p>Μια παράγραφος κειμένου</p>`
* `<em>text</em>` δίνει έμφαση στο κείμενο σας
* `<strong>text</strong>` κάνει τα γράμματα πιο έντονα
* `<br>` αλλάζει γραμμή (δεν μπορείτε να βάλετε τίποτα ανάμεσα και δεν υπάρχει αντίστοιχο tag που να το κλείνει)
* `<a href="https://djangogirls.org">link</a>` δημιουργεί έναν σύνδεσμο
* `<ul><li>first item</li><li>second item</li></ul>` δημιουργεί μια λίστα, όπως αυτή εδώ που διαβάζετε τώρα!
* `<div></div>` ορίζει ένα τμήμα στη σελίδα

Παρακάτω φαίνεται ένα πλήρες παράδειγμα ενός template. Αντιγράψτε-επικολλήστε το μέσα στο αρχείο `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Δημιουργήσαμε τρία `div` εδώ.

* Το πρώτο `div` περιέχει τον τίτλο του blog μας – είναι μια επικεφαλίδα και ένας σύνδεσμος
* Τα υπόλοιπα δύο `div` περιέχουν τα posts μας με ημ/νια δημοσίευσης, το `h2` με τον τίτλο του post ο οποίος μπορεί να κλικαριστεί και επίσης δύο `p`s (παραγράφους) κείμενα, ένα για την ημ/νια και το άλλο για το κυρίως κείμενο.

Δίνει αυτή την αίσθηση:

![Σχήμα 11.4](images/step6.png)

Ναιιι! Αλλά μέχρι στιγμής, το template μας εμφανίζει **τις ίδιες πληροφορίες** – ενώ προηγουμένως μιλούσαμε για templates που μας επέτρεπαν να εμφανίσουμε **διαφορετικές/δυναμικές** πληροφορίες με την **ίδια μορφή**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## One more thing: deploy!

It'd be good to see all this out and live on the Internet, right? Let's do another PythonAnywhere deploy:

### Commit, and push your code up to GitHub

First off, let's see what files have changed since we last deployed (run these commands locally, not on PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Also remember (from chapter 3) that `.` means the current directory.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)