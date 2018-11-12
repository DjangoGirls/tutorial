# Εισαγωγή στην HTML

Ίσως αναρρωτιέστε, τι είναι ένα template;

Ένα template είναι ένα αρχείο που μπορούμε να επαναχρησιμοποιούμε για να παρουσιάζουμε διαφορετικές πληροφορίες μέσα από μια συνεπή μορφή. Για παράδειγμα, θα μπορούσατε να χρησιμοποιήσετε ένα πρότυπο (template) για να σας βοηθήσει να γράψετε μια επιστολή, γιατί αν και κάθε επιστολή μπορεί να περιέχει διαφορετικό μήνυμα και να απευθύνεται σε ένα διαφορετικό πρόσωπο, μερικά σημεία θα μοιραστούν την ίδια μορφή.

Η μορφή ενός Django template περιγράφεται με μια γλώσσα που ονομάζεται HTML (που είναι η HTML που αναφέραμε στο πρώτο κεφάλαιο, **Πώς λειτουργεί το Internet**).

## Τι είναι η HTML;

Η HTML είναι ένας κώδικας που ερμηνεύεται από τον web browser σας – όπως ο Chrome, Firefox ή Safari - για να εμφανιστεί μια ιστοσελίδα στον χρήστη.

HTML σημαίνει "HyperText Markup Language". Η λέξη **HyperText** σημαίνει ότι είναι ένας τύπος κειμένου που υποστηρίζει υπερ-συνδέσεις μεταξύ των σελιδών. **Markup** σημαίνει ότι έχουμε λάβει ένα έγγραφο και το έχουμε επισημάνει με κώδικα ούτως ώστε να πει κάτι (στην προκειμένη περίπτωση, ένας browser) πώς να ερμηνεύσει τη σελίδα. Ο HTML κώδικας είναι χτισμένος με **tags**, όπου καθένα αρχίζει με `<` και τελειώνει με `>`. Αυτά τα tags αντιπροσωπεύουν τα markup **elements**.

## Το πρώτο σας template!

H δημιουργία ενός template σημαίνει τη δημιουργία ενός αρχείου template. Τα πάντα είναι ένα αρχείο, σωστά; Πιθανώς να το έχετε παρατηρήσει αυτό.

Τα templates αποθηκεύονται στο φάκελο `blog/templates/blog`. Άρα, πρώτα δημιουργήστε έναν φάκελο με το όνομα `templates` μέσα στον φάκελο blog. Στη συνέχεια, δημιουργήστε έναν άλλο φάκελο που ονομάζεται `blog` μέσα στον φάκελο templates:

    blog
    └───templates
        └───blog
    

(Ίσως να αναρωτηθείτε γιατί χρειαζόμαστε δύο φακέλους που και οι δύο ονομάζονται `blog`. Όπως θα ανακαλύψετε αργότερα, αυτό είναι μια τεχνική ονομασίας που κάνει τη ζωή ευκολότερη όταν τα πράγματα αρχίζουν να περιπλέκονται.)

Και τώρα δημιουργήστε ένα αρχείο `post_list.html` (απλά αφήστε το κενό για τώρα) μέσα στον φάκελο `blog/templates/blog`.

Δείτε πώς εμφανίζεται η ιστοσελίδα σας στο: http://127.0.0.1:8000 /

> Αν παρουσιάζεται ακόμα το σφάλμα `TemplateDoesNotExist`, δοκιμάστε να επανεκκινήσετε τον server σας. Προσπαθήστε να τον σταματήσετε (πιέζοντας Ctrl + C) και επανεκκινήστε τον τρέχοντας την εντολή `python manage.py runserver`.

![Σχήμα 11.1](images/step1.png)

Δεν υπάρχει σφάλμα πια! Συγχαρητήρια :) Ωστόσο, ιστοσελίδα σας δεν δείχνει κάτι παρά μια κενή σελίδα επειδή το template σας είναι κενό. Πρέπει να το διορθώσουμε αυτό.

Ανοίξτε το νέο αρχείο και προσθέστε τα εξής:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Οπότε πως φαίνεται τώρα η ιστοσελίδα μας; Επισκεφθείτε το για να μάθετε: http://127.0.0.1:8000/

![Σχήμα 11.2](images/step3.png)

Λειτουργεί! Καλή δουλειά :)

* Το πιο βασικό tag, `<html>`, είναι πάντα η αρχή οποιασδήποτε ιστοσελίδας και `</html>` είναι πάντα στο τέλος. Όπως μπορείτε να δείτε, όλο το περιεχόμενο της σελίδας ενσωματώνεται μεταξύ της αρχής του tag `<html>` και του tag κλεισίματος `</html>`
* `<p>` is a tag for paragraph elements; `</p>` closes each paragraph

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** is an element that contains information about the document that is not displayed on the screen.

* **body** is an element that contains everything else that is displayed as part of the web page.

We use `<head>` to tell the browser about the configuration of the page, and `<body>` to tell it what's actually on the page.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Save the file and refresh your page.

![Σχήμα 11.3](images/step4.png)

Notice how the browser has understood that "Ola's blog" is the title of your page? It has interpreted `<title>Ola's blog</title>` and placed the text in the title bar of your browser (it will also be used for bookmarks and so on).

Probably you have also noticed that each opening tag is matched by a *closing tag*, with a `/`, and that elements are *nested* (i.e. you can't close a particular tag until all the ones that were inside it have been closed too).

It's like putting things into boxes. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Customize your template

You can now have a little fun and try to customize your template! Here are a few useful tags for that:

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` for a heading at the next level
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` emphasizes your text
* `<strong>text</strong>` strongly emphasizes your text
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>first item</li><li>second item</li></ul>` makes a list, just like this one!
* `<div></div>` defines a section of the page

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

We've created three `div` sections here.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

It gives us this effect:

![Σχήμα 11.4](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## One more thing: deploy!

It'd be good to see all this out and live on the Internet, right? Let's do another PythonAnywhere deploy:

### Commit, and push your code up to GitHub

First off, let's see what files have changed since we last deployed (run these commands locally, not on PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Also remember (from chapter 3) that `.` means the current directory.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

We're almost there, now it's time to tell it to save this change in its history. We're going to give it a "commit message" where we describe what we've changed. You can type anything you'd like at this stage, but it's helpful to type something descriptive so that you can remember what you've done in the future.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pull your new code down to PythonAnywhere, and reload your web app

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

And watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)