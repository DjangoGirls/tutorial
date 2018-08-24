# Τι είναι το Django;

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Ένα πλαίσιο διαδικτύου είναι ένα σύνολο από στοιχεία που σας βοηθά να αναπτύξετε ιστοσελίδες πιο γρήγορα και εύκολα.

Όταν κατασκευάζετε μία ιστοσελίδα, χρειάζεστε πάντα ένα παρόμοιο σύνολο στοιχείων: έναν τρόπο για να χειρίζεστε τον έλεγχο ταυτότητας χρήστη (εγγραφή, σύνδεση, αποσύνδεση), ένα πάνελ διαχείρισης για την ιστοσελίδα σας, φόρμες, έναν τρόπο για να ανεβάσετε αρχεία, κ.λπ.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Γιατί χρειάζεστε ένα πλαίσιο;

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Φανταστείτε ένα γραμματοκιβώτιο (θύρα), το οποίο παρακολουθείται για εισερχόμενα γράμματα (αιτήματα). Αυτό γίνεται από έναν διακομιστή διαδικτύου. The web server reads the letter and then sends a response with a webpage. Αλλά όταν θέλετε να στείλετε κάτι, πρέπει να έχει και κάποιο περιεχόμενο. Και το Django είναι κάτι που σας βοηθάει να δημιουργήσετε αυτό το περιεχόμενο.

## Τι συμβαίνει όταν κάποιος ζητά μια ιστοσελίδα από το διακομιστή σας;

Όταν ένα αίτημα φτάσει σε ένα διακομιστή δικτύου, περνάει στο Django το οποίο προσπαθεί να καταλάβει τι ζητείται στην πραγματικότητα. Λαμβάνει πρώτα μια διεύθυνση σελίδας δικτύου και προσπαθεί να καταλάβει τι να κάνει. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). Δεν είναι πολύ έξυπνο- παίρνει μια λίστα από μοτίβα και προσπαθεί να ταιριάξει την διεύθυνση URL. Το Django ελέγχει πρότυπα από πάνω προς τα κάτω και αν κάτι ταιριάζει, το Django μεταβιβάζει το αίτημα στην σχετική λειτουργία ( η οποία ονομάζεται *view*).

Φανταστείτε μια ταχυδρόμο με ένα γράμμα. Περπατάει στην οδό και ελέγχει κάθε αριθμό σπιτιού αν είναι ίδιος με τον αντίστοιχο αριθμό στο γράμμα. Αν ταιριάζει, βάζει το γράμμα εκεί. Αυτός είναι ο τρόπος που λειτουργεί το urlresolver!

Στην λειτουργία *view*, γίνονται όλα τα ενδιαφέροντα πράγματα: μπορούμε να δούμε μια βάση δεδομένων για να ψάξουμε για μερικές πληροφορίες. Μήπως ο χρήστης ζήτησε να αλλάξει κάτι στα δεδομένα; Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!