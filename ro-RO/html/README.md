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
* `<br>`merge la linie următoare (nu puteți pune nimic în br și el n-are tăgul de închidere)
* `<a href="https://djangogirls.org">link</a>` creează un
* `<ul><li>primul punct</li><li>al doilea punct</li></ul>` face un list, ca acesta!
* `<div></div>` definește o secție a paginii

Acesta este un exemplu a template-ului, copiați-l și plasați-l în `blog/templates/blog/post_list.html`:

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

Aici am creat 3 secții `div`.

* Primul element `div` conține titlul blogului nostru – acesta este un titlu și link
* Alte două elemente `div`conțin posturi de blog cu data de publicare, `h2` cu un titlu de post, pe care o putem face click și două `p` (paragrafe) de text, unul pentru dată și unul pentru postul de blog.

Acesta dă efectul următor:

![Figura 11.4](images/step6.png)

Uau! Dar până când template-ul nostru afișează **informație statică** – dar înainte noi am vorbit despre un template care va afișa **diferită** informație **în aceeași format**.

Ceea ce noi dorim obținem mai departe este de a afișa posturi reale adăugate din panelă de administrare Django – o să facem acesta.

## Un alt lucru: lansați site-ul!

Va fi bine de văzut site-ul pe Internet, corect? Hai să facem un alt PythonAnywhere deploy:

### Faceți un commit, push codului vostru pe GitHub

Cel dintâi, hai să vedem ce fișiere s-au schimbat în comparație cu ultimul deploy (executați comenzile aceste pe calculatorul vostru, nu pe PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Asigurați-vă că sunteți în directoriu `djangogirls` și hai să spunem ca `git` să include pe toate fișiere schimbate în acest directoriu:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Înainte de a încărca pe toate fișiere, hai să verificăm ce `git` va încărca (toate fișiere pe care `git` va încărca vor fi de culoare verde):

{% filename %}command-line{% endfilename %}

    $ git status
    

Aproape terminăm, acum este timp să-i spunem să salvăm schimbare această în istorie. O să facem un mesaj de commit unde o să descriem ce s-a schimbat. Puteți să tapați orice, dar este folositor să tapați ceva explicativ ca să țineți minte în viitor ce ați făcut.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

Când sunteți gată, încărcați (push) schimbările pe GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Faceți pull codului nou pe PythonAnywhere, și restartați aplicație web

* Deschideți [pagină de linii de comandă pe PythonAnywhere](https://www.pythonanywhere.com/consoles/) și deschideți **linie de comandă** (sau deschideți nouă). Apoi, executați:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Trebuie să substituiți `<your-pythonanywhere-domain>` cu denumirea sub-domeniului pe PythonAnywhere, fără paranteze unghiulare. Denumirea sub-domeniului este numele de utilizator vostru pe PythonAnywhere, dar în niște cazuri poate fi diferit (dacă numele de utilizator conține majuscule). Dacă codul dat nu lucrează, utilizați comandă `ls` (afișarea fișierilor) pentru a găsi denumirea sub-domeniului/directoriului, și apoi `cd` în el.

Acum observați cum codul se descarcă. Dacă doriți să verificați dacă fișierele au fost descarcate, puteți să deschideți **pagină "Files"** și vedeți codul vostru pe PythonAnywhere (pagina cu fișiere puteți să găsiți din meniu pe pagina cu linie de comandă).

* În sfârșit, deschideți [pagina "Web"](https://www.pythonanywhere.com/web_app_setup/) și apăsați **Reload** în aplicație web.

Acum trebuie să vedeți schimbările voastre live! Reîncărcați website-ul vostru în browser. Trebuie să vedeți schimbările. :)