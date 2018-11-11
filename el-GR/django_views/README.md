# Django views – ώρα να δημιουργήσουμε!

Ώρα να ξεφορτωθούμε το σφάλμα που δημιουργήσαμε στο προηγούμενο κεφάλαιο! :)

Ένα *view* είναι το μέρος όπου βάζουμε την "λογική" της εφαρμογής μας. Θα ζητήσει πληροφορίες από το μοντέλο μας (`model`) που δημιουργήσαμε νωρίτερα και θα το περάσει στο `template`. Θα δημιουργήσουμε ένα template στο επόμενο κεφάλαιο. Τα views είναι απλώς Python συναρτήσεις οι οποίες είναι ελαφρώς πιο περίπλοκες από αυτές που γράψαμε στο κεφάλαιο **Εισαγωγή στην Python**.

Τα views τοποθετούνται σε ένα αρχείο (ανα εφαρμογή) με το όνομα `views.py`. Θα προσθέσουμε τα δικά μας *views* στο αρχείο `blog/views.py`.

## blog/views.py

Ωραία. Ας ανοίξουμε το αρχείο να δούμε τι έχει μέσα:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Όχι και πολλά πράγματα, ακόμα.

Θυμηθείτε ότι οι γραμμές που ξεκινούν με δίεση `#` είναι σχόλια. Αγνοούνται πλήρως από την Python.

Ας δημιουργήσουμε ένα *view* όπως προτείνει και το σχόλιο. Προσθέστε τα επόμενα από κάτω:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Όπως βλέπετε, δημιουργήσαμε μια συνάρτηση (`def`) με το όνομα `post_list` η οποία παίρνει την παράμετρο `request` και επιστρέφει `return` την τιμή που παίρνει από άλλη συνάρτηση, την `render`, η οποία κάνει render ("χτίζει") το template `blog/post_list.html`.

Save the file, go to http://127.0.0.1:8000/ and see what we've got.

Another error! Read what's going on now:

![Error](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? Don't worry, it's just an error page, nothing to be scared of! Just like the error messages in the console, these are actually pretty useful. You can read that the *TemplateDoesNotExist*. Let's fix this bug and create a template in the next chapter!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/views/