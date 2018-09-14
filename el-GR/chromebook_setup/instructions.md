Μπορείς [ να παραλείψεις αυτή την ενότητα](http://tutorial.djangogirls.org/en/installation/#install-python) εάν δεν χρησιμοποιείς ένα Chromebook. Εάν όμως δουλεύεις σε ένα τέτοιο laptop, η διαδικασία εγκατάστασης θα είναι λίγο διαφορετική. Μπορείς να αγνοήσεις τις υπόλοιπες οδηγίες εγκατάστασης και να ακολουθήσεις μόνο τα παρακάτω βήματα.

### Cloud 9

Το Cloud 9 είναι ένα εργαλείο, το οποίο σου παρέχει έναν code editor και πρόσβαση σε έναν υπολογιστή, κάπου στο διαδίκτυο, όπου μπορείς να εγκαταστήσεις, να γράψεις και να τρέξεις λογισμικό. Σε όλη τη διάρκεια του workshop, το Cloud 9 θα λειτουργεί σαν *το τοπικό σου μηχάνημα*. Με αυτόν τον τρόπο θα μπορείς να τρέχεις εντολές σε ένα τερματικό περιβάλλον, ακριβώς όπως και οι συμμαθητές σου που χρησιμοποιούν OS X, Ubuntu ή Windows, με τη διαφορά ότι το δικό σου τερματικό θα είναι συνδεδεμένο με έναν υπολογιστή κάπου στο διαδίκτυο, στον οποίο το Cloud 9 έχει κάνει όλες τις απαραίτητες ρυθμίσεις για σένα.

1. Εγκατάστησε το Cloud 9 από το [web store του Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Πήγαινε στο [c9.io](https://c9.io)
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