# Εισαγωγή στην γραμμή εντολών

> Για τους αναγνώστες στο σπίτι: αυτή η ενότητα καλύπτεται στο βίντεο [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Είναι φοβερό έτσι; Θα γράψετε την πρώτη γραμμή κώδικα σε μερικά λεπτά! :)

**Αφήστε μας να σας παρουσιάσουμε το νέο σας φίλο πρώτα: τη γραμμή εντολών!**

Τα επόμενα βήματα θα σας δείξουν πώς να χρησιμοποιήσετε το μαύρο παράθυρο που όλοι οι χάκερ χρησιμοποιούν. Αυτό μπορεί να μοιάζει λίγο τρομακτικό στην αρχή αλλά πραγματικά αυτό είναι απλά ένα prompt σε αναμονή για εντολές από εσάς.

> **Σημείωση** Παρακαλούμε να σημειώσετε ότι σε όλο το βιβλίο αυτό χρησιμοποιούμε το τους όρους «φάκελος» και «κατάλογος» αλλά στην ουσία είναι το ίδιο πράγμα.

## Τι είναι η γραμμή εντολών;

Το παράθυρο, το οποίο συνήθως ονομάζεται **γραμμή εντολών** ή **περιβάλλον γραμμής εντολών**, είναι μια εφαρμογή που βασίζεται σε κείμενο για προβολή, διαχείριση και χειρισμό αρχείων στον υπολογιστή σας. Είναι κάπως σαν το Windows Explorer ή το Finder στα Mac αλλά χωρίς το γραφικό κομμάτι (κουμπιά, βελάκια, σχήματα κλπ). Άλλα ονόματα για την γραμμή εντολών είναι: *cmd*, *CLI*, *prompt*, *console* ή *terminal*.

## Άνοιγμα της γραμμής εντολών

Για να πειραματιστείτε πρέπει πρώτα να ανοίξετε μια γραμμή εντολών (ή κονσόλα, πιο σύντομα).

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Πηγαίνετε στο Start menu → Windows System → Command Prompt.

> Σε παλαιότερες εκδόσεις των Windows, κοιτάχτε στο Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Πηγαίνετε στο Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

Συνήθως είναι κάτω από το Applications → Accessories → Terminal, αλλά αυτό εξαρτάται από το σύστημα σας. Αν δεν είναι εκεί ψάξτε το στο Google. :)

<!--endsec-->

## Prompt

Θα πρέπει, τώρα, να βλέπετε ένα άσπρο ή μαύρο παράθυρο που αναμένει εντολές από εσάς.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

Αν είστε σε Mac ή Linux, θα βλέπετε το `$`, όπως αυτό:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Στα Windows, θα βλέπετε το `>`, όπως:

{% filename %}command-line{% endfilename %}

    >
    

Ρίξτε μια ματιά τώρα στο τμήμα του Linux από πάνω. Θα δείτε κάτι παρόμοιο με αυτό του PythonAnywhere αργότερα στον οδηγό.

<!--endsec-->

Πριν από κάθε εντολή θα προηγείται ο χαρακτήρας `$` ή `>` και ένα κενό αλλά εσείς δεν πρέπει να τα γράφετε. Ο υπολογιστής σας θα το κάνει για εσάς. :)

> Μια μικρή σημείωση: στην περίπτωση σας μπορεί να δείτε κάτι σαν `C:\Users\ola>` ή `Olas-MacBook-Air:~ ola$` πριν το σύμβολο του prompt. Αυτό είναι 100% OK.

Το σημείο μέχρι το (και συμπεριλαμβανομένου) `$` ή το `>` ονομάζεται *command line prompt*, ή σκέτο *prompt* εν συντομία. Σας προτρέπει να εισάγεται κάτι εκεί.

Στον οδηγό, όταν θέλουμε εσείς να γράψετε μια εντολή, θα συμπεριλαμβάνουμε και το `$` ή `>` και, κατά περίπτωση, περισσότερα πιο αριστερά. Αγνοήστε, λοιπόν, το αριστερό κομμάτι και πληκτρολογείτε μόνο την εντολή ως έχει η οποία θα ξεκινά μετά το prompt.

## Η πρώτη σας εντολή (ΝΑΙ!)

Ας ξεκινήσουμε με αυτή την εντολή:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

Και μετά πατήστε `enter`. Αυτό είναι το αποτέλεσμα:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

Όπως μπορείτε να δείτε, ο υπολογιστής μόλις εκτύπωσε το όνομα χρήστη σας. Ωραίο, εε; :)

> Προσπαθείτε να γράφετε ξάθε εντολή. Μην κάνετε αντιγραγή-επικόλληση. Θα θυμάστε περισσότερα με αυτό τον τρόπο!

## Βασικά

Κάθε υπολογιστικό σύστημα ένα διαφορετικό ρεπερτόριο εντολών στη γραμμή εντολών. Οπότε, φροντίστε να ακολουθάτε τις οδηγίες του δικού σας λειτουργικού συστήματος. Ας το δοκιμάσουμε, έτσι;

### Παρόν φάκελος

Θα ήταν ωραίο να γνωρίζουμε πού βρισκόμαστε τώρα, έτσι; Ας δούμε. Πληκτρολογήσετε αυτή την εντολή πατήστε `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> Σημείωση: 'pwd' σημαίνει 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Σημείωση: 'cd' σημαίνει 'change directory'. Με το PowerShell μπορείτε να χρησιμοποιήσετε την εντολή pwd όπως στο Linux ή το Mac OS X.

<!--endsec-->

Κατά πάσα πιθανότητα θα δείτε κάτι παρόμοιο στο μηχάνημά σας. Μόλις ανοίγετε τη γραμμή εντολών, θα ξεκινάτε στον φάκελο του χρήστη (home folder).

* * *

### Μάθετε περισσότερα σχετικά με μια εντολή

Πολλές εντολές που πληκτρολογείτε στη γραμμή εντολών έχουν ενσωματωμένη βοήθεια που μπορείτε να εμφανίσετε και να διαβάσετε! Για παράδειγμα, για να μάθετε περισσότερα σχετικά με τον τρέχων φάκελο:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

Τα λειτουργικά συστήματα OS X και Linux έχουν μια εντολή `man`, η οποία δίνει βοήθεια στις εντολές. Δοκιμάστε `man pwd` και δείτε τι λέει ή βάλτε την εντολή `man` πριν από άλλες εντολές για να δείτε τη βοήθειά τους. Η έξοδος της εντολής `man` παρουσιάζεται, συνήθως, ως σελιδοποιημένη (paged). Χρησιμοποιήστε το κουμπί του διαστήματος για να κινηθείτε προς την επόμενη σελίδα και το πλήκτρο `q` για να βγείτε από την "σελιδοποιημένη" βοήθεια, πίσω στην γραμμή εντολών.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_help" data-collapse=true ces-->

Προσθέτοντας το πρόθεμα `/?` στις περισσότερες εντολές θα εκτυπώσετε τη σελίδα βοήθειας. Ίσως να χρειαστεί να κάνετε scroll στο παράθυρο σας για να δείτε όλα. Δοκιμάστε `cd /;`.

<!--endsec-->

### Προβολή αρχείων και φακέλων

Τι είναι, λοιπόν, μέσα; Θα ήταν ωραίο να μάθουμε. Ας δούμε:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> Σημείωση: Σε PowerShell μπορείτε επίσης να χρησιμοποιήσετε το 'ls' όπως στο Linux και στο Mac OS X. <!--endsec-->

* * *

### Αλλαγή του τρέχοντος φακέλου

Τώρα, ας μεταβούμε στον φάκελο επιφάνεια εργασίας:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Δείτε αν όντως άλλαξε:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Εδώ είναι!

> PRO tip: Εάν πληκτρολογήσετε `cd D` και στη συνέχεια πατήσετε το πλήκτρο `tab`, τότε η γραμμή εντολών θα συμπληρώσει αυτόματα το υπόλοιπο όνομα του. Έτσι μπορείτε να πλοηγηθείτε ταχύτερα. Εάν υπάρχουν περισσότεροι από ένας φάκελος που ξεκινάει με το «D», πατήστε το πλήκτρο `tab` δύο φορές για να εμφανιστεί μια λίστα επιλογών.

* * *

### Δημιουργία φακέλου

Τι θα λέγατε να δημιουργούσαμε έναν φάκελο για σκοπούς εξάσκησης στην επιφάνεια εργασίας; Μπορείτε να το κάνετε κατ' αυτό τον τρόπο:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

Αυτή η μικρή εντολή θα δημιουργήσει ένα φάκελο με το όνομα `practice` στην επιφάνεια εργασίας. Μπορείτε να ελέγξετε αν είναι εκεί εξετάζοντας την επιφάνεια εργασίας σας ή εκτελώντας την εντολή `ls` ή `dir`! Δοκιμάστε το. :)

> PRO tip: Αν δεν θέλετε να γράφετε την ίδια εντολή ξανά και ξανά, πιέστε το `πάνω βελάκι` ή/και το `κάτω βελάκι` στο πληκτρολόγιο σας για να περιηγηθείτε στο ιστορικό των εντολών σας.

* * *

### Εξασκηθείτε!

Μια μικρή πρόκληση για εσάς: στον καινούργιο σας φάκελο με το όνομα `practice`, δημιουργήστε έναν φάκελο με το όνομα `test`. (Χρησιμοποιήστε τις εντολές `cd` και `mkdir`.)

#### Λύση:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

Συγχαρητήρια! :)

* * *

### Διαγραφή

Δεν θέλουμε να αφήσουμε πίσω μας άχρηστα αρχεία/φακέλους. Ας διαγράψουμε ότι έχουμε δημιουργήσει μέχρι τώρα.

Πρώτα, πρέπει να πάμε πίσω στην Επιφάνεια Εργασίας:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Χρησιμοποιώντας τις δύο τελίτσες `..` παρέα με την εντολή `cd` αλλάζετε την θέση σας από τον παρόν φάκελο σε 1 επίπεδο πιο ψηλά (δηλαδή στον φάκελο που περιέχει τον τρέχων φάκελο).

Δείτε που είστε:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Ώρα να διαγράψουμε τον φάκελο `practice`:

> **Προσοχή**: Η διαγραφή των αρχείων χρησιμοποιώντας τις εντολές `del`, `rmdir` ή `rm` είναι μη αναστρέψιμες, δηλαδή *τα διεγραμμένα αρχεία δεν μπορούν να επανακτηθούν*! Οπότε να είστε προσεκτικοί με αυτή την εντολή.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Έγινε! Για να βεβαιωθείτε ότι όντως διαγράφηκε, ας το δούμε:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Έξοδος

Αυτά για τώρα! Μπορείτε να κλείσετε τη γραμμή εντολών με ασφάλεια τώρα. Ας το κάνουμε με τον τρόπο του χάκερ, εντάξει;:)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Ωραίο, ε; :)

## Περίληψη

Παρακάτω φαίνεται μια περίληψη μερικών χρήσιμων εντολών:

| Εντολή (Windows) | Εντολή (Mac OS / Linux) | Περιγραφή                              | Παράδειγμα                                        |
| ---------------- | ----------------------- | -------------------------------------- | ------------------------------------------------- |
| exit             | exit                    | κλείσιμο παραθύρου                     | **exit**                                          |
| cd               | cd                      | αλλαγή φακέλου                         | **cd test**                                       |
| cd               | pwd                     | προβολή τρέχοντος φακέλου              | **cd** (Windows) ή **pwd** (Mac OS / Linux)       |
| dir              | ls                      | προβολή λίστας φακέλων/αρχείων         | **dir**                                           |
| copy             | cp                      | αντιγραφή αρχείου                      | **copy c:\test\test.txt c:\windows\test.txt** |
| move             | mv                      | μετακίνηση/μετονομασία αρχείου/φακέλου | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir            | mkdir                   | δημιουργία φακέλου                     | **mkdir testdirectory**                           |
| rmdir (ή del)    | rm                      | διαγραφή αρχείου                       | **del c:\test\test.txt**                        |
| rmdir /S         | rm -r                   | διαγραφή φακέλου                       | **rm -r testdirectory**                           |
| [CMD] /?         | man [CMD]               | προβολή βοήθειας για μια εντολή        | **cd /?** (Windows) ή **man cd** (Mac OS / Linux) |

Αυτό είναι ένα πολύ μικρό κομμάτι από τις διαθέσιμες εντολές που μπορείτε να τρέξετε στην γραμμή εντολών. Αλλά δεν θα χρειαστεί να χρησιμποιήσετε περισσότερες από αυτές σήμερα.

Αν είστε περίεργοι δείτε το [ss64.com](http://ss64.com) που περιέχει μια πλήρη αναφορά σε όλες τις εντολές όλων των λειτουργικών συστημάτων.

## Είστε έτοιμοι;

Ας μάθουμε λίγο Python!