Μπορείτε [ να παραλείψετε αυτή την ενότητα](http://tutorial.djangogirls.org/en/installation/#install-python) εάν δεν χρησιμοποιείτε το Chromebook. Εάν το χρησιμοποιείτε, η διαδικασία εγκατάστασης θα είναι λίγο διαφορετική. Σε αυτή την περίπτωση μπορείτε να αγνοήσετε τις υπόλοιπες οδηγίες εγκατάστασης.

### Cloud 9

Cloud 9 is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. Για τη διάρκεια του workshop, το Cloud 9 θα είναι *το τοπικό σας μηχάνημα*. Με αυτόν τον τρόπο θα μπορείτε να τρέχετε εντολές σε ένα τερματικό περιβάλλον ακριβώς όπως και οι συμμαθητές σας με OS X, Ubuntu ή Windows, αλλά το δικό σας τερματικό θα είναι συνδεδεμένο με έναν υπολογιστή που τρέχει σε server του Cloud 9.

1. Εγκαταστήστε το Cloud 9 από το [ web store του Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Πηγαίντε στο [c9.io](https://c9.io)
3. Δημιουργήστε λογαριασμό
4. Κάντε κλικ στο * Create a New Workspace*
5. Ονομάστε το *django-girls*
6. Επιλέξτε το *Βlank*(Δεύτερο από δεξιά στην κάτω γραμμή με το πορτοκαλί λογότυπο)

Τώρα πρέπει να βλέπετε μια σελίδα με ένα μεγάλο κύριο παράθυρο με κείμενο, μία πλαϊνή μπάρα και ένα μικρό παράθυρο στο τέλος που μοιάζει κάπως έτσι:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Εικονικό Περιβάλλον

Ένα εικονικό περιβάλλον( γνωστό και ως virtualenv) είναι σαν ένα ιδιωτικό κουτί που μπορούμε να χωρέσουμε χρήσιμο υπολογιστικό κώδικα για ένα πρότζεκτ στο οποίο εργαζόμαστε. Τα χρησιμοποιούμε για να κρατήσουμε διάφορα κομμάτια κώδικα που θέλουμε για τα διαφορετικά πρότζεκτ μας χωριστά ώστε τα πράγματα να μην μπερδεύονται μεταξύ τους μεταξύ πρότζεκτ.

Εάν ο ακροδέκτης σας είναι στο κάτω μέρος της διεπαφής του Cloud 9, εκτελέστε το ακόλουθο:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Εάν εξακολουθεί να μην λειτουργεί, ζήτησε βοήθεια από τον προπονητή σας.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Το φροντιστήριο Django Girls συμπεριλαμβάνει μια ενότητα στο τι αποκαλείται Ανάπτυξη, το οποίο είναι η διαδικασία όπου παίρνεις τον κώδικα που τροφοδοτεί την νέα σου εφαρμογή δικτύου και την μετακινεί σε ένα δημόσια προσιτό υπολογιστή (που ονομάζεται διακομιστής) έτσι ώστε άλλα άτομα μπορούν να δουν την εργασία σου.

Αυτό το μέρος είναι λίγο περίεργο όταν κάνεις το φροντιστήριο σε ένα Chromebook μιας και χρησιμοποιούμε ήδη έναν υπολογιστή ο οποίος είναι στο διαδίκτυο ( σε αντίθεση, ας πούμε, με ένα φορητό υπολογιστή). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).