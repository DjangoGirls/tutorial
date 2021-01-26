Το Git είναι ένα «σύστημα ελέγχου έκδοσης» και χρησιμοποιείται από πολλούς προγραμματιστές. Αυτό το εργαλείο μπορεί να παρακολουθήσει τις αλλαγές στα αρχεία με την πάροδο του χρόνου έτσι ώστε να μπορείτε να ανακαλέσετε συγκεκριμένες εκδόσεις σε μεταγενέστερο στάδιο. Είναι κάπως σαν την δυνατότητα "παρακολούθηση αλλαγών" σε προγράμματα επεξεργασίας κειμένου (όπως το Microsoft Word ή το LibreOffice Writer) αλλά πολύ πιο δυνατό.

## Εγκαθιστώντας το Git

<!--sec data-title="Installing Git: Windows" data-id="git_install_windows"
data-collapse=true ces-->

Μπορείτε να κατεβάσετε το Git από το [git-scm.com](https://git-scm.com/). Μπορείτε να πατάτε "επόμενο" σε όλα τα στάδια εκτός από δύο: στο στάδιο που ρωτάει για τον προτιμώμενο επεξεργαστή κειμένου θα πρέπει να επιλέξετε το Nano και στο στάδιο με το όνομα "Adjusting your PATH environment", θα πρέπει να επιλέξετε το "Use Git and optional Unix tools from the Windows Command Prompt" (την τελευταία επιλογή). Εκτός από αυτό, οι προκαθορισμένες ρυθμίσεις είναι μια χαρά. Επίσης, οι επιλογές Checkout Windows-style και Commit Unix-style είναι μια χαρά.

Do not forget to restart the command prompt or PowerShell after the installation finished successfully. <!--endsec-->

<!--sec data-title="Installing Git: OS X" data-id="git_install_OSX"
data-collapse=true ces-->

Κατεβάστε το Git από το [git-scm.com](https://git-scm.com/) και ακολουθήστε τις οδηγίες.

> **Σημείωση** Αν έχετε OS X 10.6, 10.7, ή 10.8, θα χρειαστεί να εγκαταστήσετε την έκδοση του git από εδώ: [Git installer for OS X Snow Leopard](https://sourceforge.net/projects/git-osx-installer/files/git-2.3.5-intel-universal-snow-leopard.dmg/download)

<!--endsec-->

<!--sec data-title="Installing Git: Debian or Ubuntu" data-id="git_install_debian_ubuntu"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo apt install git
```

<!--endsec-->

<!--sec data-title="Installing Git: Fedora" data-id="git_install_fedora"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo dnf install git
```

<!--endsec-->

<!--sec data-title="Installing Git: openSUSE" data-id="git_install_openSUSE"
data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

```bash
$ sudo zypper install git
```

<!--endsec-->