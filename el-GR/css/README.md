# CSS- κάνε το όμορφο!

Το blog μας φαίνεται ακόμα αρκετά άσχημο, έτσι δεν είναι; Ωρα να το κάνουμε όμορφο! Γι'αυτή τη δουλειά θα χρησιμοποιούμε τη CSS.

## Τι είναι η CSS;

Cascading Style Sheets (CSS) is a language used for describing the look and formatting of a website written in a markup language (like HTML). Treat it as make-up for our web page. ;)

Άλλα δεν θέλουμε να ξεκινήσουμε από την αρχή ξανά, έτσι; Άλλη μια φορά, θα χρησιμοποιήσουμε κάτι που οι προγραμματιστές κυκλοφόρησαν δωρεάν στο διαδίκτυο. Το να ανακαλύπτουμε τον τροχό δεν έχει πλάκα, ξέρετε.

## Ας χρησιμοποιήσουμε το Bootstrap!

Bootstrap is one of the most popular HTML and CSS frameworks for developing beautiful websites: https://getbootstrap.com/

Γράφτηκε από προγραμματιστές που εργάστηκαν στο Twitter. Τώρα αναπτύσσεται από εθελοντές από ολόκληρο το κόσμο!

## Εγκατάσταση του Bootstrap

Για να εγκαταστήσετε το Bootstrap, πρέπει να προσθέσετε αυτό στο `<head>` στο `html`αρχείο σας:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!

![Σχήμα 14.1](images/bootstrap1.png)

Δείχνει ήδη πολύ καλύτερο!

## Στατικά αρχεία στο Django

Τέλος, ας ρίξουμε μια πιο προσεκτική ματιά στα λεγόμενα **στατικά αρχεία**. Static files are all your CSS and images. Their content doesn't depend on the request context and will be the same for every user.

### Πού βρίσκονται τα στατικά αρχεία στο Django

Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, `blog`.

Για να το κάνουμε αυτό πρέπει να δημιουργήσουμε ένα φάκελο με το όνομα `static` μέσα στο φάκελο του app blog:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

Το Django θα βρίσκει αυτόματα οποιοδήποτε φάκελο ονομάζεται "static" μέσα στους φακέλους οποιασδήποτε εφαρμογή σας. Έπειτα θα μπορεί να χρησιμοποιεί το περιεχόμενο τους ως στατικά αρχεία.

## Το πρώτο CSS αρχείο σας!

Ας δημιουργήσουμε ένα CSS αρχείο τώρα, για να προσθέσετε το δικό σας στυλ στην ιστοσελίδα σας. Δημιουργήστε έναν νέο κατάλογο που ονομάζεται `css` μέσα στο `static` κατάλογο. Στη συνέχεια, δημιουργήστε ένα νέο αρχείο που ονομάζεται `blog.css` μέσα σε αυτόν τον κατάλογο `css`. Είστε έτοιμη;

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Ώρα να γράψουμε λίγη CSS! Άνοιξε το αρχείο `blog/static/css/blog.css` στον επεξεργαστή.

We won't be going too deep into customizing and learning about CSS here. There is a recommendation for a free CSS course at the end of this page if you would like to learn more.

Αλλά ας δοκιμάσουμε μερικά πράγματα. Ίσως θα μπορούσαμε να αλλάξουμε το χρώμα του τίτλου της σελίδας μας; Για να καταλάβουν τα χρώματα, οι υπολογιστές χρησιμοποιούν ειδικούς κώδικες. Αυτοί οι κώδικες ξεκινάνε με `` και ακολουθούνται από 6 γράμματα (A-F) και αριθμούς (0-9). Για παράδειγμα, ο κωδικός για το μπλε είναι `#0000FF`. Μπορείτε να βρείτε τους κωδικούς των χρωμάτων για πολλά χρώματα εδώ: http://www.colorpicker.com/. Context | Request Context. Μπορείς επίσης να χρησιμοποιήσεις [προκαθορισμένα χρώματα](http://www.w3schools.com/colors/colors_names.asp) με το αγγλικό όνομά τους, όπως το `red` (κόκκινο) και το `green` (πράσινο.

Στο αρχείο `blog/static/css/blog.css` πρέπει να προσθέσεις τον παρακάτω κώδικα:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

Το `h1 a` είναι ένας επιλογέας CSS. This means we're applying our styles to any `a` element inside of an `h1` element. Έτσι όταν έχουμε κάτι σαν `<h1><a href="">σύνδεσμο</a></h1>`, το `h1 a ` στυλ θα εφαρμοστεί. Σε αυτή τη περίπτωση, του λέμε να αλλάξει το χρώμα του σε `#FCA205`, που είναι πορτοκαλί. Or you can put your own color here!

Μέσα σε ενα αρχείο CSS καθορίζουμε τα στύλ για τα στοιχεία μέσα στο HTML αρχείο. Ο πρώτος τρόπος που αναγνωρίζουμε στοιχεία είναι με το όνομα στοιχείου. Μπορεί να τα θυμάστε αυτά ως ετικέτες από το τμήμα HTML. Things like `a`, `h1`, and `body` are all examples of element names. We also identify elements by the attribute `class` or the attribute `id`. Η τάξη (class) και η ταυτότητα (id) είναι ονόματα που δίνεις εσύ στο κάθε στοιχείο. Οι τάξεις αναφέρονται σε ομάδες στοιχείων και οι ταυτότητες σε συγκεκριμένα στοιχεία. For example, you could identify the following tag by using the tag name `a`, the class `external_link`, or the id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

You can read more about [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

We also need to tell our HTML template that we added some CSS. Open the `blog/templates/blog/post_list.html` file and add this line at the very beginning of it:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

We're just loading static files here. :) Between the `<head>` and `</head>` tags, after the links to the Bootstrap CSS files, add this line:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Ο browser διαβάζει τα αρχεία με την σειρά που δίνονται, οπότε πρέπει να σιγουρευτούμε ότι αυτή είναι η σωστή θέση. Διαφορετικά ο κωδικός στο αρχείο μας μπορεί να παρακαμφθεί από τον κώδικα στα αρχεία Bootstrap. Είπαμε στο template μας που βρίσκεται το CSS αρχείο μας.

Το αρχείο σου πρέπει τώρα να μοιάζει κάπως έτσι:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>published: {{ post.published_date }}</p>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Εντάξει, αποθηκεύσε το αρχείο και να ανανεώσε την σελίδα!

![Σχήμα 14.2](images/color2.png)

Πολύ καλά! Ίσως να θέλουμε να δώσουμε λίγο αέρα στην ιστιοσελίδα μας και να αυξήσουμε το περιθώριο στα αριστερά; Ας το δοκιμάσουμε!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Προσθέστε αυτό στο CSS σας, αποθηκεύστε τον φάκελο και δείτε πως λειτουργεί!

![Σχήμα 14.3](images/margin2.png)

'Ισως μπορούμε να αλλάξουμε την γραμματοσειρά της επικεφαλίδας μας. Μεσα στο `<head>` που βρίσκεται μεσα στο αρχείο `blog/templates/blog/post_list.html` βάλε αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

As before, check the order and place before the link to `blog/static/css/blog.css`. This line will import a font called *Lobster* from Google Fonts (https://www.google.com/fonts).

Find the `h1 a` declaration block (the code between braces `{` and `}`) in the CSS file `blog/static/css/blog.css`. Now add the line `font-family: 'Lobster';` between the braces, and refresh the page:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Σχήμα 14.3](images/font.png)

Τέλεια!

Όπως αναφέρθηκε παραπάνω, CSS έχει μια έννοια των τάξεων. Αυτά σας επιτρέπουν να ονομάσετε ένα μέρος του κώδικα HTML και να εφαρμόσετε στυλ μόνο σε αυτό το μέρος, χωρίς να επηρεάσετε άλλα μέρη. Αυτό μπορεί να είναι εξαιρετικά χρήσιμο! Maybe you have two divs that are doing something different (like your header and your post). Μια κατηγορία μπορεί να σε βοηθήσει να τα κάνετε να μοιάζουν διαφορετικά.

Ονόμασε μερικά μέρη του HTML. Πρόσθεσε μια τάξη που ονομάζεται `page-header` στο `div` που περιέχει την επικεφαλίδα σου, έτσι:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Και τώρα να προσθέσετε μια τάξη `post` στο `div` που περιέχει ένα blog post.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Τώρα θα προσθέσουμε κώδικα σε διάφορους επιλογείς (selectors). Οι επιλογείς που ξεκινούν με `.` αναφέρονται σε τάξεις. Υπάρχουν πολλά σπουδαία σεμινάρια και εξηγήσεις σχετικά με την CSS στο δίκτυο τα οποία θα σε βοηθήσουν να καταλάβεις τον παρακάτω κώδικα. For now, copy and paste it into your `blog/static/css/blog.css` file:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

Μετά, βάλε τάξεις στον κώδικα HTML των posts. Αντικατάστησε αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

μέσα στο αρχείο `blog/templates/blog/post_list.html` με αυτό:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Αποθήκευσε τα αρχεία και ανανέωσε την ιστοσελίδα σου.

![Σχήμα 14.4](images/final.png)

Woohoo! Φαίνεται τέλειο, έτσι δεν είναι; Κοιτάξτε στον κωδικό που μόλις κάναμε επικόλληση για να βρείτε τα σημεία που προσθέσαμε τάξεις στο HTML και τα χρησιμοποιήσαμε στο CSS. Που θα κάνατε την αλλαγή αν θέλατε την ημερομηνία να είναι τιρκουάζ;

Μην φοβάστε να πειραματιστείτε με το CSS λίγο και να προσπαθήσετε να αλλάξετε μερικά πράγματα. Παίζοντας με το CSS μπορεί να σε κάνει να καταλάβεις τι κάνουν τα διάφορα πράγματα. Εάν σπάσεις κάτι, μην ανησυχείς- μπορείς πάντα να το αναιρέσεις!

Πραγματικά συστήνουμε να πάρετε αυτή την δωρεάν online σειρά μαθημάτων  Codeacademy HTML &amp. Μπορεί να σε βοηθήσει να μάθεις τα πάντα σχετικά με το να κάνεις τις ιστοσελίδες σου ομορφότερες με το CSS.</p> 

Είσαι έτοιμη για το επόμενο κεφάλαιο; :)