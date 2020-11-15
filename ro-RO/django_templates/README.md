# Template-urile în Django

Este timp să afișăm ceva date! Django are un instrument incorporat pentru acesta **template tags**.

## Ce reprezintă tăgurile din template?

În HTML nu puteți să srieți codul Python, pentru că browser-ul nu poate să-l interpreteze. Ei știu numai HTML. Noi știm că HTML este destul de static, dar Python este mai dinamic.

**Tăgurile din Django template** ne dă posibilitate de a utiliza Python în HTML, deci puteți să construiți site-urile dinamice mai rapid. E bun!

## Afișarea articolului în template

În capitolul precedent am transmis o listă de articole în template, utilizând variabilă `posts`. Acum trebuie să le afișăm în HTML.

Pentru a afișa o variabilă în Django template, utilizăm we use paranteze paralele duble cu denumirea variabilei în ei, în mod următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Încercați acesta în template `blog/templates/blog/post_list.html`. Deschideți-l în editorul de cod, și schimbați tot cod începând cu al doilea `<div>` până la al treilea `</div>` cu `{{ posts }}`. Salvați fișierul și faceți un refresh a paginii pentru a vedea rezultate:

![Figura 13.1](images/step1.png)

Am primit următoare:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Acesta înseamnă că Django știe că acesta este o listă de obiecte. Ținteți minte cum noi putem afișa liste de la capitol **Introducere în Python**? Da, utilizând cicluri! În Django template facem acesta în mod următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Încercați acesta în template-ul vostru.

![Figura 13.2](images/step2.png)

Lucrează! Dar noi dorim ca articolele să fie afișate în mod similar cu acela cum noi am afișat articolele create mai înainte în capitolul **Introducere în HTML**. Puteți să combinați HTML și tăgurile de template. `body` va arăta în mod următor:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Totul ce puneți între `{% for %}` și `{% endfor %}` va fi repetat pentru fiecare obiect în lista. Faceți refresh a paginii:{% endraw %}

![Figura 13.3](images/step3.png)

Ați observat că am utilizat o notație diferită (`{{ post.title }}` sau `{{ post.text }}`)? Accesăm data din câmpurile definite în modelul `Post`. `|linebreaksbr` este un pipe (filtru) care aplică un filtru asupra text pentru a converta linii de întrerupere în paragrafe.

## Încă ceva

Ar fi bun să vedem dacă website-ul va lucra în Internet? Hai să-l afișăm pe PythonAnywhere. Acesta este un rezumat al pașilor…

* Dintâi faceți un push pe GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Deschideți [pagină de linii de comandă pe PythonAnywhere](https://www.pythonanywhere.com/consoles/) și deschideți **linie de comandă** (sau deschideți nouă). Apoi, executați:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Trebuie să substituiți `<your-pythonanywhere-domain>` cu denumirea sub-domeniului pe PythonAnywhere, fără paranteze unghiulare.)

* În sfârșit, deschideți [pagina "Web"](https://www.pythonanywhere.com/web_app_setup/) și apăsați **Reload** în aplicație web. (Pentru a accesa alte pagine pe PythonAnywhere din consola, utilizați butonul de meniu în colțul de sus-dreapta.) Schimbările trebuie să fie live pe https://subdomain.pythonanywhere.com -- verificați în browser! Dacă articolele de pe site-ul pe PythonAnywhere nu sunt aceeași ca și cele de pe site-ul local, acesta este OK. Baza de date pe calculatorul local și Python Anywhere nu sincronizează împreună cu alte fișiere.

Felicitări! Acum mergem mai departe și încercăm să adăugăm articolul nou din panel de administrare Django (țineți minte că trebuie de adăugat published_date (data de publicare)!) Fiți siguri că sunteți în panel de administrare Django al site-ului vostru pe pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Faceți un refresh a paginii pentru a verifica dacă articol a fost afișat.

Lucrează? Suntem mândri! Acum puteți să odihniți :)

![Figura 13.4](images/donut.png)