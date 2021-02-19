# Επεκτείνοντας τα template

Ένα άλλο ωραίο πράγμα που προσφέρει το Django είναι η **επέκταση των templates**. Τι σημαίνει αυτό; Αυτό σημαίνει ότι μπορείτε να χρησιμοποιείτε τα ίδια κομμάτια HTML για διαφορετικές σελίδες του διαδυκτιακού σας τόπου.

Τα templates σας βοηθάνε στο να επαναχρησιμοποιήσετε το ίδιο τμήμα HTML (την ίδια, δηλαδή, πληροφορία) σε περισσότερα από ένα μέρη. Δεν χρειάζεται να επαναλαμβάνεται τον εαυτό σας σε κάθε αρχείο. Και αν χρειαστεί να αλλάξετε κάτι, δεν χρειάζεται να το κάνετε σε κάθε template παρά μόνο σε ένα!

## Δημιουργία ενός βασικού (base) template

Το base template είναι το πιο βασικό template που μπορείτε να επεκτείνετε σε κάθε σελίδα του ιστότοπού σας.

Ας δημιουργήσουμε ένα αρχείο `base.html` μέσα στο `blog/templates/blog/`:

    blog
    └───templates
        └───blog
                base.html
                post_list.html
    

Στη συνέχεια, άνοιξε το και να αντίγραψε τα πάντα από το αρχείο `post_list.html` στο `base.html`, όπως ακολούθως:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
          <div class="container">
              <h1><a href="/">Django Girls Blog</a></h1>
          </div>
        </header>

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
    </body>
</html>
```

Στη συνέχεια στο αρχείο `base.html`, αντικαταστήστε τα περιεχόμενα των: `<body>`(τα πάντα μεταξύ `<body>` και `</body>`) με αυτό:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<body>
    <header class="page-header">
      <div class="container">
          <h1><a href="/">Django Girls Blog</a></h1>
      </div>
    </header>
    <main class="container">
        <div class="row">
            <div class="col">
            {% block content %}
            {% endblock %}
            </div>
        </div>
    </main>
</body>
```

{% raw %}Ίσως παρατηρήσατε ότι αυτό αντικατέστησε τα πάντα από το `{% for post in posts %}` μέχρι το `{% endfor %}` με αυτό: {% endraw %}

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% block content %}
{% endblock %}
```

Αλλά γιατί; Μόλις δημιουργήσατε ένα `block`! Χρησιμοποιήσατε ένα template tag με το όνομα `{% block %}` για να δημιουργήσετε μια περιοχή όπου μέσα θα εισαχθεί HTML. Η HTML θα έρθει από άλλο αρχείο template το οποίο κάνει extend (επεκτείνει) αυτό το template (`base.html`). Θα σας δείξουμε πως να το κάνετε αυτο σε λίγο.

Αποθηκεύστε το template `base.html` και ανοίξτε το αρχείο `blog/templates/blog/post_list.html` ξανά. {% raw %}Θα χρειαστεί να διαγράψετε τα πάντα πάνω από το `{% for post in posts %}` και κάτω από το `{% endfor %}`. Όταν είστε έτοιμοι, το αρχείο θα δείχνει κάπως έτσι:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <article class="post">
        <time class="date">
            {{ post.published_date }}
        </time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

Θέλουμε να χρησιμοποιήσουμε αυτό το κομμάτι ως μέρος του template μας για όλα τα blocks με περιεχόμενο. Ήρθε η ώρα να προσθέσουμε blocks σε αυτό το αρχείο!

{% raw %}Πρέπει το όνομα του block να είναι το ίδιο με αυτό που δηλώσαμε στο template `base.html`. Πρέπει επίσης να συμπεριλάβουμε όλο τον κώδικα που ανήκει σε αυτά τα blocks. Για να γίνει αυτό, βάλτε τα όλα μεταξύ `{% block content %}` και `{% endblock %}`. Έτσι:{% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Μόνο ένα πράγμα έμεινε. Πρέπει να "συνδέσουμε" αυτά τα δύο templates μαζί. Αυτή είναι η έννοια της επέκτασης των template! Θα το κάνουμε αυτό προσθέτοντας τη λέξη-κλειδί "extends" στην αρχή του αρχείου. Κάπως έτσι:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

Αυτό ήταν! Αποθηκεύστε το αρχείο και επιβεβαιώστε ότι η ιστοσελίδα σας λειτουργεί όπως πριν. :)

> Αν λέβετε κάποιο σφάλμα όπως `TemplateDoesNotExist`, αυτό σημαίνει ότι δεν υπάρχει το αρχείο `blog/base.html` και ότι ο `server` τρέχει στην κονσόλα. Προσπαθήστε να τον σταματήσετε (πιέζοντας Ctrl + C) και επανεκκινήστε τον τρέχοντας την εντολή `python manage.py runserver`.