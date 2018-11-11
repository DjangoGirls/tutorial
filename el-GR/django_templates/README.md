# Django templates

Ήρθε η ώρα να παρουσιάσουμε ορισμένα δεδομένα! Το Django μας δίνει κάποια προεγκατεστημένα **template tags**.

## Τι είναι τα template tags;

Βλέπετε, στην HTML δεν μπορείτε να γράψετε κώδικα σε Python επειδή οι browsers δεν καταλαβαίνουν αυτή τη γλώσσα. Εκείνοι ξέρουν μόνο HTML, CSS και Javascript. Ξέρουμε ότι η HTML είναι στατική γλώσσα ενώ η Python περισσότερο δυναμική.

Τα **Django template tags** μας επιτρέπουν να μεταφέρουμε πράγματα της Python μέσα στην HTML, ούτως ώστε να χτίσετε δυναμικές ιστοσελίδες γρηγορότερα. Τέλεια!

## Template προβολή λίστας των post

Σε προηγούμενο κεφάλαιο δώσαμε στο template μας μια λίστα από posts μέσα σε μια μεταβλητή με το όνομα `posts`. Τώρα θα την προβάλουμε στην HTML. Άλλωστε αυτό θέλαμε να κάνουμε από την αρχή.

Για να εκτυπώσουμε μια μεταβλητή μέσα στα Django templates, χρησιμοποιούμε διπλές αγκύλες ({{ }}) με το όνομα της μεταβλητής ανάμεσα:

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

It'd be good to see if your website will still be working on the public Internet, right? Let's try deploying to PythonAnywhere again. Here's a recap of the steps…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Then, log back in to [PythonAnywhere](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one), and run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://yourname.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://yourname.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Σχήμα 13.4](images/donut.png)