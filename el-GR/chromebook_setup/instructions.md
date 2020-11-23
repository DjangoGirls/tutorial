Μπορείτε [ να παραλείψετε αυτή την ενότητα](http://tutorial.djangogirls.org/en/installation/#install-python) εάν δεν χρησιμοποιείτε το Chromebook. Εάν το χρησιμοποιείτε, η διαδικασία εγκατάστασης θα είναι λίγο διαφορετική. Σε αυτή την περίπτωση μπορείτε να αγνοήσετε τις υπόλοιπες οδηγίες εγκατάστασης.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Το CloudIDE είναι ένα εργαλείο το οποίο σου παρέχει έναν επεξεργαστή κώδικα καθώς και πρόσβαση σε έναν υπολογιστή στο internet στον οποίο μπορείς να εγκαταστήσεις, να γράψεις και να τρέξεις το λογισμικό. Κατά τη διάρκεια του οδηγού, το CloudIDE θα παίζει το ρόλο του *local machine* (δηλαδή του τοπικού υπολογιστή σας). Παραταύτα, θα χρειαστεί να γράφετε εντολές στο τερματικό όπως ακριβώς οι συμμαθητές σας που χρησιμοποιούν OS X, Ubuntu ή Windows, με την μόνη διαφορά ότι το τερματικό δεν θα τρέχει στον υπολογιστή που κάθεστε αλλά στο cloud (σύννεφο), εκεί που το όρισε το CloudIDE (σε κάποιον εικονικό υπολογιστή, δηλαδή, στο internet). Εδώ είναι οι οδηγίες για τα cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). Μπορείτε να επιλέξετε ένα από τα cloud IDEs και να ακολουθήσετε τις αντίστοιχες οδηγίες του.

#### PaizaCloud Cloud IDE

1. Πηγαίνετε στο [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Δημιούργησε λογαριασμό
3. Click *New Server* and choose the Django app
4. Κάντε κλικ στο κουμπί Terminal (στην αριστερή πλευρά του παραθύρου)

Τώρα θα πρέπει να δείτε μια σελίδα με πλαϊνή μπάρα εργασίων και κουμπιά στα αριστερά. Κάντε κλικ στο κουμπί «Terminal» για να ανοίξετε το παράθυρο του τερματικού (ή αλλιώς "κοσνόλα" ή "γραμμή εντολών") όπως παρακάτω:

{% filename %}Terminal{% endfilename %}

    $
    

Το τερματικό στο PaizaCloud Cloud IDE είναι έτοιμο να δεχτεί τις εντολές σας. Μπορείτε να αλλάξετε το μέγεθος του παραθύρου ή να το μεγιστοποιήσετε, αν θέλετε.

#### AWS Cloud9

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io) and click *Get started with AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Αυτή η κάτω περιοχή είναι το τερματικό σας. Μπορείτε να χρησιμοποιήσετε το τερματικό για να στείλετε οδηγίες στον απομακρυσμένο υπολογιστή Cloud 9. Μπορείτε να αλλάξετε το μέγεθος αυτού του παραθύρου για να το κάνετε μεγαλύτερο.

### Εικονικό Περιβάλλον

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Εκτέλεση:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(Σημειώστε ότι στην τελευταία γραμμή χρησιμοποιούμε μια περισπωμένη ακολουθούμενη από ένα σύμβολο ίσον: ` ~ = `).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).