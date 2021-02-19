# CSS - κάντε το όμορφο!

Το blog μας φαίνεται αρκετά άσχημο, έτσι δεν είναι; Ωρα να το κάνουμε όμορφο! Γι'αυτή τη δουλειά θα χρειαστούμε το CSS.

## Τι είναι το CSS;

Το CSS (Cascading Style Sheets - Διαδοχικά Φύλλα Στυλ) είναι μια γλώσσα που χρησιμοποιείται για να περιγράψει την εμφάνιση και την μορφοποίηση μιας ιστοσελίδας που έχει γραφτεί σε γλώσσα σήμανσης (όπως η HTML). Δείτε το σαν το μακιγιάζ για την ιστοσελίδα μας ;)

Άλλα δεν θέλουμε να ξεκινήσουμε από την αρχή ξανά, έτσι; Για ακόμα μια φορά θα χρησιμοποιήσουμε κάτι που οι προγραμματιστές χρησιμοποιούν ήδη και είναι δωρεάν στο διαδίκτυο. Το να ανακαλύπτουμε τον τροχό δεν έχει πλάκα, ξέρετε.

## Ας χρησιμοποιήσουμε το Bootstrap!

Το Bootstrap είναι μια από τις πιο δημοφιλή HTML / CSS εργαλειοθήκες (framework) που αποσκοπούν στην εύκολη και γρήγορη ανάπτυξη όμορφων ιστοσελίδων: https://getbootstrap.com/

Γράφτηκε από προγραμματιστές που εργάστηκαν στο Twitter. Τώρα αναπτύσσεται από εθελοντές από ολόκληρο το κόσμο!

## Εγκατάσταση του Bootstrap

Για την εγκατάσταση του Bootstrap, ανοίξτε το αρχείο `.html` στον επεξεργαστή κώδικα και προσθέστε αυτό στην ενότητα `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
```

Αυτό δεν προσθέτει κάποια αρχεία στο project σας. Απλώς, δείχνει σε αρχεία που υπάρχουν στο διαδίκτυο. Πηγαίνετε, λοιπόν, επισκεφτείτε την ιστοσελίδα σας και ανανεώστε τη σελίδα. Νάτο!

![Σχήμα 14.1](images/bootstrap1.png)

Δείχνει ήδη πολύ καλύτερο!

## Στατικά αρχεία στο Django

Τέλος, ας ρίξουμε μια πιο προσεκτική ματιά στα λεγόμενα **στατικά αρχεία**. Τα στατικά αρχεία (static files) είναι όλα τα αρχεία CSS και όλα τα αρχεία εικόνας (φωτογραφίες). Το περιεχόμενο τους δεν εξαρτάται από το εκάστοτε request και έτσι μένει ίδιο για κάθε χρήστη.

### Πού να τοποθετήσετε τα στατικά αρχεία στο Django

Το Django ήδη ξέρει πού να βρει τα στατικά αρχεία για την ενσωματωμένη εφαρμογή «admin». Τώρα πρέπει να προσθέσουμε κάποια στατικά αρχεία για την δική μας εφαρμογή, `blog`.

Για να το κάνουμε αυτό πρέπει να δημιουργήσουμε ένα φάκελο με το όνομα `static` μέσα στο φάκελο blog της εφαρμογής μας:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Το Django θα βρίσκει αυτόματα οποιοδήποτε φάκελο ονομάζεται "static" μέσα στους φακέλους οποιασδήποτε εφαρμογή σας. Έπειτα θα μπορεί να χρησιμοποιεί το περιεχόμενο τους ως στατικά αρχεία.

## Το πρώτο CSS αρχείο σας!

Ας δημιουργήσουμε ένα CSS αρχείο τώρα, για να προσθέσετε το δικό σας στυλ στην ιστοσελίδα σας. Δημιουργήστε έναν νέο φάκελο που ονομάζεται `css` μέσα στο `static` φάκελο. Στη συνέχεια, δημιουργήστε ένα νέο αρχείο που ονομάζεται `blog.css` μέσα σε αυτόν τον φάκελο `css`. Είστε έτοιμοι;

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Ώρα να γράψουμε λίγο CSS! Άνοιξτε το αρχείο `blog/static/css/blog.css` στον επεξεργαστή.

Δεν θα εμβαθύνουμε πολύ σχετικά με την γλώσσα CSS. Υπάρχει μια πρόταση σχετικά με μάθημα CSS στο τέλος αυτής της σελίδας αν θέλετε να μάθετε περισσότερα.

Αλλά ας δοκιμάσουμε μερικά πράγματα. Ίσως θα μπορούσαμε να αλλάξουμε το χρώμα των τίτλων της σελίδας μας; Για να καταλάβετε τη λογική των χρωμάτων, οι υπολογιστές χρησιμοποιούν ειδικούς κώδικες. Αυτοί οι κώδικες ξεκινάνε με `#` και ακολουθούνται από 6 γράμματα (A-F) και αριθμούς (0-9). Για παράδειγμα, ο κωδικός για το μπλε είναι `#0000FF`. Μπορείτε να βρείτε τους κωδικούς των χρωμάτων για πολλά χρώματα εδώ: http://www.colorpicker.com/. Μπορείτε επίσης να χρησιμοποιήσετε [προκαθορισμένα χρώματα](http://www.w3schools.com/colors/colors_names.asp) με το αγγλικό όνομά τους, όπως το `red` (κόκκινο) και το `green` (πράσινο).

Στο αρχείο `blog/static/css/blog.css` πρέπει να προσθέσετε τον παρακάτω κώδικα:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

Το `h1 a` είναι ένας επιλογέας CSS (CSS selector). Αυτό σημαίνει ότι θέλουμε να εφαρμόσουμε τα στυλ (στη συγκεκριμένη περίπτωση έχουμε ένα στυλ, το χρώμα) σε κάθε `a` στοιχείο μέσα σε κάθε `h1` στοιχείο. Ο επιλογέας `h2 a` κάνει το ίδιο πράγμα αλλά για τα `h2` στοιχεία. Έτσι όταν έχουμε κάτι σαν `<h1><a href="">σύνδεσμο</a></h1>`, το `h1 a ` στυλ θα εφαρμοστεί. Σε αυτή τη περίπτωση, του λέμε να αλλάξει το χρώμα του σε `#C25100`, που είναι το σκούρο πορτοκαλί. Ή μπορείτε να βάλετε το δικό σας χρώμα εδώ, αλλά σιγουρευτείτε ότι έχει καλή αντίθεση σε λευκό φόντο!

Μέσα σε ενα αρχείο CSS καθορίζουμε τα στύλ για τα στοιχεία μέσα στο HTML αρχείο. Ο πρώτος τρόπος που αναγνωρίζουμε στοιχεία είναι με το όνομα στοιχείου. Μπορεί να τα θυμάστε αυτά ως ετικέτες από την HTML. Πράγματα όπως `a`, `h1` και το `body` είναι όλα τα παραδείγματα των ονομάτων στοιχείων (HTML elements). Μπορούμε επίσης να προσδιορίσουμε στοιχεία από το χαρακτηριστικό `class` ή το χαρακτηριστικό `id`. Η τάξη (class) και η ταυτότητα (id) είναι ονόματα που δίνεις εσύ στο κάθε στοιχείο. Οι τάξεις αναφέρονται σε ομάδες στοιχείων και οι ταυτότητες σε συγκεκριμένα στοιχεία. Για παράδειγμα, το ακόλουθο tag μπορεί να προσδιοριστεί απο την CSS χρησιμοποιώντας το όνομα του tag `a`, την class `external_link`, ή το id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Διαβάστε περισσότερα για τους επιλογείς CSS στο [w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Στη συνέχεια, πρέπει να πούμε στο HTML αρχείο οτι θέλουμε να συμπεριλάβουμε αρχείο/α CSS. Ανοίξτε το αρχείο `blog/templates/blog/post_list.html` και προσθέστε αυτή τη γραμμή στην αρχή:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Απλά "φορτώνουμε" στατικά αρχεία σε αυτό το σημείο :) Μεταξύ του `<head>` και `</head>` ετικετών (tags), μετά τα links με τα Bootstrap αρχεία CSS, προσθέστε αυτή τη γραμμή:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Ο browser διαβάζει τα αρχεία με την σειρά που δίνονται, οπότε πρέπει να σιγουρευτούμε ότι αυτή είναι η σωστή θέση. Διαφορετικά ο κώδικας στο αρχείο μας μπορεί να παρακαμφθεί από τον κώδικα στα αρχεία Bootstrap. Μόλις είπαμε στο template μας που βρίσκεται το CSS αρχείο μας.

Το αρχείο σας πρέπει τώρα να μοιάζει κάπως έτσι:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        {% for post in posts %}
            <article>
                <time>published: {{ post.published_date }}</time>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </article>
        {% endfor %}
    </body>
</html>
```

Εντάξει, αποθηκεύστε το αρχείο και ανανεώστε τη σελίδα!

![Σχήμα 14.2](images/color2.png)

Πολύ καλά! Θα θέλατε να δώσουμε λίγο αέρα στην ιστοσελίδα μας και να αυξήσουμε το περιθώριο στα αριστερά; Ας το δοκιμάσουμε!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Προσθέστε αυτό στο CSS σας, αποθηκεύστε τον αρχείο και δείτε πως λειτουργεί!

![Σχήμα 14.3](images/margin2.png)

'Ισως μπορούμε να αλλάξουμε την γραμματοσειρά της επικεφαλίδας μας. Μεσα στο `<head>` που βρίσκεται μεσα στο αρχείο `blog/templates/blog/post_list.html` βάλτε αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Όπως πριν, ελέγξτε τη σειρά και τοποθετήστε το πριν τον σύνδεσμο `blog/static/css/blog.css`. Αυτή η γραμμή θα εισάγει μια γραμματοσειρά που λέγεται *Lobster* από τα Google Fonts (https://www.google.com/fonts).

Βρείτε το `h1 a` μπλοκ (τον κώδικα μεταξύ `{` και `}`) μέσα στο αρχείο CSS `blog/static/css/blog.css`. Τώρα προσθέστε την γραμμή `font-family: 'Lobster';` μεταξύ των αγκύλων και ανανεώστε τη σελίδα:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Σχήμα 14.3](images/font.png)

Τέλεια!

Όπως αναφέρθηκε παραπάνω, το CSS έχει την έννοια των κλάσεων (classes). Αυτές σας επιτρέπουν να ονομάσετε ένα μέρος του κώδικα HTML και να εφαρμόσετε στυλ μόνο σε αυτό το μέρος, χωρίς να επηρεάσετε άλλα μέρη. Αυτό μπορεί να είναι εξαιρετικά χρήσιμο! Ίσως να έχετε δύο divs τα οποία περιγράφουν κάτι διαφορετικό το καθένα (όπως πχ μια επικεφαλίδα και ένα post). Μια class μπορεί να σας βοηθήσει να τα κάνετε να μοιάζουν διαφορετικά.

Go ahead and name some parts of the HTML code. Replace the `header` that contains your header with the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<header class="page-header">
    <div class="container">
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
</header>
```

And now add a class `post` to your `article` containing a blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<article class="post">
    <time>published: {{ post.published_date }}</time>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</article>
```

Τώρα θα προσθέσουμε κώδικα στους επιλογείς (selectors) που μόλις δημιουργήσαμε. Οι επιλογείς που ξεκινούν με `.` αναφέρονται σε κλάσεις. Υπάρχουν πολλοί σπουδαίοι οδηγοί (tutorials) και εξηγήσεις σχετικά με το CSS στο διαδίκτυο τα οποία θα σας βοηθήσουν να καταλάβετε τον παρακάτω κώδικα. Για αρχή, αντιγράψτε το στο αρχείο `blog/static/css/blog.css`:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    margin-bottom: 40px;
    padding: 20px 20px 20px 40px;
}

.page-header h1,
.page-header h1 a,
.page-header h1 a:visited,
.page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

h1,
h2,
h3,
h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea,
.post-form input {
    width: 100%;
}

.top-menu,
.top-menu:hover,
.top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a,
.post h2 a:visited {
    color: #000000;
}

.post > .date,
.post > .actions {
    float: right;
}

.btn-default,
.btn-default:visited {
    color: #C25100;
    background: none;
    border-color: #C25100;
}

.btn-default:hover {
    color: #FFFFFF;
    background-color: #C25100;
}
```

Μετά, περιβάλλετε τον κώδικα HTML που προβάλει τα posts με κλάσεις. Αντικατάστησε αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

μέσα στο αρχείο `blog/templates/blog/post_list.html` με αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<main class="container">
    <div class="row">
        <div class="col">
            {% for post in posts %}
                <article class="post">
                    <time class="date">
                        {{ post.published_date }}
                    </time>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </article>
            {% endfor %}
        </div>
    </div>
</main>
```

Αποθήκευσε τα αρχεία και ανανέωστε την ιστοσελίδα σας.

![Σχήμα 14.4](images/final.png)

Ουάου! Φαίνεται τέλειο, έτσι δεν είναι; Κοιτάξτε τον κώδικα που μόλις κάναμε επικόλληση για να βρείτε τα σημεία που προσθέσαμε κλάσεις στην HTML και τις χρησιμοποιήσαμε στο CSS. Που θα κάνατε την αλλαγή αν θέλατε την ημερομηνία να είναι τιρκουάζ;

Μην φοβάστε να πειραματιστείτε με το CSS λίγο και να προσπαθήσετε να αλλάξετε μερικά πράγματα. Παίζοντας με το CSS μπορεί να σε κάνει να καταλάβεις τι κάνουν τα διάφορα πράγματα. Εάν κάτι πάει στραβά μην ανησυχείτε - μπορείτε πάντα να το αναιρέσετε!

We really recommend taking the free online courses "Basic HTML & HTML5" and "Basic CSS" on [freeCodeCamp](https://learn.freecodecamp.org/). They can help you learn all about making your websites prettier with HTML and CSS.

Είστε έτοιμοι για το επόμενο κεφάλαιο; :)