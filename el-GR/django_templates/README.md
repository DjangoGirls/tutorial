# Django templates

Ήρθε η ώρα να παρουσιάσουμε ορισμένα δεδομένα! Το Django μας δίνει κάποια προεγκατεστημένα **template tags**.

## Τι είναι τα template tags;

Βλέπετε, στην HTML δεν μπορείτε να γράψετε κώδικα σε Python επειδή οι browsers δεν καταλαβαίνουν αυτή τη γλώσσα. Εκείνοι ξέρουν μόνο HTML, CSS και Javascript. Ξέρουμε ότι η HTML είναι στατική γλώσσα ενώ η Python περισσότερο δυναμική.

Τα **Django template tags** μας επιτρέπουν να μεταφέρουμε πράγματα της Python μέσα στην HTML, ούτως ώστε να χτίσετε δυναμικές ιστοσελίδες γρηγορότερα. Τέλεια!

## Template προβολή λίστας των post

Σε προηγούμενο κεφάλαιο δώσαμε στο template μας μια λίστα από posts μέσα σε μια μεταβλητή με το όνομα `posts`. Τώρα θα την προβάλουμε στην HTML. Άλλωστε αυτό θέλαμε να κάνουμε από την αρχή.

Για να εκτυπώσουμε μια μεταβλητή μέσα στα Django templates, χρησιμοποιούμε διπλές αγκύλες ({% raw %}{{ }}{% endraw %}) με το όνομα της μεταβλητής ανάμεσα:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Δοκιμάστε αυτό μέσα στο template `blog/templates/blog/post_list.html`. Ανοίξτε το και αντικαταστήστε τα πάντα από το δεύτερο `<div>` to the third `</div>` με το `{{ posts }}`. Αποθηκεύστε το αρχείο και ανανεώστε τη σελίδα για να δείτε τα αποτελέσματα:

![Σχήμα 13.1](images/step1.png)

Όπως βλέπετε, το μόνο που έχουμε είναι το εξής:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Αυτό σημαίνει ότι το Django το εκλαμβάνει ως μια λίστα από objects. Θυμηθείτε στο κεφάλαιο **Εισαγωγή στην Python** πως προβάλαμε λίστες; Ναι, με επαναλήψεις! Στα Django template το κάνετε ως εξής:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Δοκιμάστε αυτό στο template.

![Σχήμα 13.2](images/step2.png)

Δούλεψε! Αλλά θέλουμε τα posts μα εμφανίζονται όπως τα στατικά posts που φτιάξαμε νωρίτερα στο κεφάλαιο **Εισαγωγή στην HTML**. Μπορείτε να μιξάρετε HTML και template tags μαζί. Έτσι, το `body` θα μοιάζει κάπως έτσι:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Οτιδήποτε βάζετε ανάμεσα στο `{% for %}` και το `{% endfor %}` θα επαναληφθεί για κάθε object στη λίστα. Ανανεώστε τη σελίδα:{% endraw %}

![Σχήμα 13.3](images/step3.png)

Παρατηρήσατε ότι χρησιμοποιούμε έναν διαφορετικό τρόπο πρόσβασης αυτή τη φορά (`{{ post.title }}` ή `{{ post.text }}`); Αποκτούμε πρόσβαση στα δεδομένα κάθε πεδίου που είναι ορισμένα στο μοντέλο `Post`. Επίσης, η κάθετη γραμμή `|linebreaksbr` φιλτράρει το κείμενο του posts όπου μετατρέπει τις αλλαγές γραμμής σε παράγράφους.

## Ένα ακόμα πράγμα

Θα ήταν καλό να βλέπαμε αν το site σας εξακολουθεί να λειτουργεί ακόμα στο internet, σωστά; Ας το κάνουμε deploy στο PythonAnywhere για ακόμη μια φορά. Παρακάτω φαίνεται μια περίληψη των βημάτων…

* Πρώτα κάντε push τον κώδικα σας στο GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Έπειτα συνδεθείτε στο [PythonAnywhere](https://www.pythonanywhere.com/consoles/), μεταβείτε στο **Bash console** (ή ανοίξτε ένα νέο) και τρέξτε:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Τέλος, πηγαίνετε στο ["Web" page](https://www.pythonanywhere.com/web_app_setup/) και κλικάρετε **Reload** στην εφαρμογή σας. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! Δεν πειράζει αν τα posts στο PythonAnywhere δεν είναι τα ίδια με τα posts που εμφανίζονται τοπικά στον υπολογιστή σας. Οι βάσεις δεδομένων στον τοπικό υπολογιστή σας και στο PythonAnywhere δεν είναι συγχρονισμένες μεταξύ τους.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)