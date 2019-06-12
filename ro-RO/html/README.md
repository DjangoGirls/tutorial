# Introducere în HTML

Poate vă intrebați ce este un template?

Template este un fișier pe care îl putem să reutilizăm pentru a prezenta informație într-un format consistent - de exemplu, ați putea să utilizați pe template pentru a scrie o scriisoare, dar fiecare scriisoare poate să conțină un mesaj diferit și poate să fie adresat persoanelor diferite, dar ei sunt de aceeași format.

Format unui template din Django este descris în limbajul denumit HTML (pe care noi l-am menționat în primul capitol **Cum lucrează Internetul**).

## Ce este HTML?

HTML este un cod care este interpretat de web browser – Chrome, Firefox sau Safari – pentru a afișa pagina web utilizatorului.

HTML înseamnă "HyperText Markup Language". **HyperText** înseamnă că acesta este un tip de text care suportă hyper-linkuri între pagini. **Markup** înseamnă că am marcat pe document cu codul pentru a executa (în cazul nostru browser) codul din pagina. Codul HTML este constuit din **tăguri**, care se încep cu `<` și se termin cu `>`. Aceste tăguri reprezintă **elemente** de markup.

## Primul template!

Crearea unui template înseamnă crearea unui fișier de template. Totul este compus din fișiere, corect? Probabil, deja ați observat acesta.

Templături sunt salvate în directoriu `blog/templates/blog`. Dintâi creați un directoriu numit `templates` în directoriu de blog. Apoi creați un alt directoriu numit `blog` în directoriu templates:

    blog
    └───templates
        └───blog
    

(Poate vă întrebați de ce este nevoie de doi directorii denumite `blog` – acesta este o convenție de denumire care face lucruri mai ușoare când structura devine complicată.)

Acum creați fișier `post_list.html` (păstrați-l fără informație până când) în directoriu `blog/templates/blog`.

Puteți să vedeți site-ul acum: http://127.0.0.1:8000/

> Dacă vedeți o eroare `TemplateDoesNotExist`, restartați serverul. În linie de comandă opriți serverul, apăsând pe Ctrl+C (Control și C keys împreună) și porniți-l executând comandă `python manage.py runserver`.

![Figura 11.1](images/step1.png)

Eroare a fost eliminată! Felicitări :) Dar website-ul nu postează nimic, doar o pagină goală, pentru că în template nu este informație. Trebuie să afișăm ceva informație.

Deschideți fișier în editor de cod și adăugați marcajul următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Cum arată website-ul acum? Vizitați-l pe http://127.0.0.1:8000/

![Figura 11.2](images/step3.png)

Lucrează! Ați lucrat bine :)

* Tag-ul de bază, `<html>`, este începutul a paginii web și `</html>` este sfârșitul. După cum vedeți, conținutul website-ului este între tăgul de început `<html>` și cel de sfârșit `</html>`
* `<p>` este un tăg pentru elemente de paragraf; `</p>` închide fiecare paragraf

## Head și body

Fiecare pagina HTML este divizată în două elemente: **head** și **body**.

* **head** este un element care conține informație despre document și nu este afișat pe ecran.

* **body** este un element care conține totul ce este afișat pe o pagină web.

Noi utilizăm `<head>` pentru ca browser să știe despre configurație paginii, și `<body>` pentru a arăta ce este pe o pagină.

De exemplu, putem pune elementul pentru a afișa titlu paginii web în `<head>`:

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

Salvează fișierele și actualizează site-ul.

![Figura 11.3](images/step4.png)

Vedeți cum browser a înțeles că "Ola's blog" este titlu paginii voastre? El s-a înterpretat `<title>Ola's blog</title>` și a pus textul în bara de titlu a browser-ului vostru (el va fi utilizat pentru bookmark ș.a.).

Probabil voi ați observat că fiecare tăg de început are *un tăg de sfârșit*, cu `/`, și că elemente sunt *inserate unul în altul* (voi nu puteți închide un tăg anumit până când cele care sunt în el, nu sunt închise).

Acesta seamănă cu aranjarea lucrurilor într-o cutie. Aveți o mare cutie, `<html></html>`; în care este `<body></body>`, care conține cutii mai mici: `<p></p>`.

Trebuie să urmați reguli de tăgurilor de *închidere*, și elementelor *incluse unul în altul* – dacă nu veți face acesta, browser-ul n-o să poată interpreta codul corect și pagina va fi afișată greșit.

## Personalizați template-ul vostru

Acum puteți să distrați și să încercați să personalizați template-ul vostru! Acesta sunt câteva tăguri care va fi de folos:

* `<h1>Titlu</h1>` pentru cel mai important titlu
* `<h2>Sub-titlu</h2>` pentru un titlu de nivel următor
* `<h3>Sub-sub-titlu</h3>` ... așa mai departe, până `<h6>`
* `<p>Un paragraf de text</p>`
* `<em>text</em>` accentuează textul vostru
* `<strong>text</strong>` face textul vostru să fie evidențiat
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

![Figura 11.4](images/step6.png)

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

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)