# Formulare în Django

La final vrem să adăugăm la proiectul nostru o metodă pentru a crea sau edita postări de blog. Consola de `admin` din Django este ajutătoare, dar este destul de greu să o perosnalizezi și să o faci frumoasă. Cu `forms` avem putere absolută în crearea interfeței noastre - putem face aproape tot ce ne putem imagina!

Un lucru util la formularele (forms) Django este că putem defini unul de la zero, sau putem crea un `ModelForm` care va salva ce se găsește în formular în model.

Asta ne și propunem să facem: vom crea un formular pentru modelul nostru `Post`.

La fel ca și celălalte componente importante din Django, formularele au propriul lor fișier: `forms.py`.

Trebuie să creăm un fișier cu acest nume în directorul `blog`.

    blog
       └── forms.py
    

Hai să-l deschidem în editorul de cod și tapăm comandă următoare:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Dintâi, Trebuie să importăm formularele Django (`from django import forms`) și, evident, modelul nostru `Post` (`from .models import Post`).

După cum probabil suspectați, `PostForm` este numele formularului nostru. Trebuie să îi spunem lui Django că acest formular este un `ModelForm` (astfel încât Django îi aplică un pic de magie pentru noi) - `forms.ModelForm` se ocupă de asta.

Apoi, avem `class Meta`, unde îi spunem lui Django care model ar trebui să fie folosit pentru a creea acest formular (`model = Post`).

La final, putem să spunem care câmp(uri) ar trebui să ajungă în formular. În acest scenariu ne dorim să expundem doar `title` (titlul) și `text` (textul) - `author` (autorul) ar trebui să fie persoana care este acum autentificată (adică tu!) iar `created_date` (data de creare) ar trebui să fie setată automat când creăm postul (din cod), nu?

Și gata! Tot ce trebuie să facem acum e să folosim formularul într-un *view* și să-l afișăm într-un template.

Deci încă o dată vom crea: un link către pagină, un URL, un view și un template.

## Link către o pagină cu formularul

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Dorim să numim noul view `post_new`. Clasa `"glyphicon glyphicon-plus"` este de la bootstrap, pe care îl utilizăm, și va afișa un simbol de plus.

După adăugarea liniei, fișierul HTML trebuie să arate în modul următor:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

După salvarea și actualizarea paginii http://127.0.0.1:8000 o să vedeți o eroare `NoReverseMatch`. Hai s-o rezolvăm!

## URL

Deschideți `blog/urls.py` în editorul de cod și adăugați o linie:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

Codul final va fi următor:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

După actualizarea site-ului noi vedem eroare `AttributeError`, pentru că noi n-am creat view `post_new`. Hai s-o adăugăm.

## post_new view

Este timp de a deschide fișierul `blog/views.py` în editorul de cod și a adăuga linii următoare, cu liniile `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

Și funcție *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Pentru a crea un formular nou `Post`, noi trebuie să executăm `PostForm()` și să-l transmitem rezultat în șablon. O să mai întoarcem la acest *view*, dar acum hai să creăm un șablon pentru un formular.

## Șablon

Trebuie să creăm un fișier `post_edit.html` în directoriu `blog/templates/blog` și să-l deschidem în editor de cod. Pentru a face ca formularul să lucreze, trebuie să asigurăm de următoare:

* Noi trebuie să afișăm pe formular. Putem să facem acesta (de exemplu) în mod următor {% raw %}`{{ form.as_p }}`{% endraw %}.
* Linie de sus trebuie să fie între tăgurile HTML form: `<form method="POST">...</form>`.
* Avem nevoie de butonul `Save` (Salvează). Facem acesta cu un buton HTML: `<button type="submit">Save</button>`.
* Și în final, după deschiderea tăgului `<form ...>` noi trebuie să adăugăm {% raw %}`{% csrf_token %}`{% endraw %}. Acesta este foarte important pentru că face formulare protejate! Dacă nu faceți acesta, Django va da o eroare când o să încercați să-l salvați pe formular:

![CSFR Forbidden page](images/csrf2.png)

Hai să vedem cum HTML în `post_edit.html` trebuie să arăte:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

E timp pentru a actualiza pagina! Formular este afișat!

![Formular nou](images/new_form2.png)

Dar așteptați un minut! Ce o să întâmplă când voi tapați ceva în `title` (titlu) și `text` (text) și o să le salvați?

Nimic! Suntem pe aceeași pagină și textul s-a dispărut... și nici un post n-a fost adăugat. Deci care este problema?

Răspunsul este: nu este o problemă. Trebuie să mai adăugăm codul în funcție *view*.

## Salvarea formularului

Deschideți `blog/views.py`. Acum totul ce noi avem în funcție `post_new` este următoare:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Când facem un submit a formularului, noi suntem redirecționați la aceeași funcție, dar în cazul acesta avem mai multe date în `request`, de exemplu, în `request.POST` (denumirea POST nu este din cauza postului de blog; dar din cauza că "postăm" data). Țineți minte, în fișierul HTML la definiție `<form>` am adăugat atribut `method="POST"`? Toate aceste câmpurile din formular sunt în `request.POST`. Nu trebuie să renumiți `POST` pe altceva (o altă variantă validă pentru atributul `method` este `GET`, dar n-avem timp să explicăm care este diferență).

Deci în funcția *view* noi avem două situații sepărate pentru a gestiona: dintâi, noi accesăm pagină pentru prima dată și dorim să afișăm formularul fără date, în al doilea rând, când ne întoarcem la *view* cu toate date care au fost întroduse. Trebuie să adăugăm o condiție (o să utilizăm `if` pentru acesta):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Este timp să completăm bloc cu `[...]`. Dacă `method` este `POST` atunci dorim să constructăm `PostForm` cu dată de la formular? O să facem în fel următor:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Următorul lucru este de a verifica că forma este corectă (toate câmpurile obligatorii sunt setate și au valorile corecte). Facem acesta cu `form.is_valid()`.

Verificăm dacă formular este valid, dacă este, îl salvăm!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

În general, avem două lucruri: salvăm formular, utilizând `form.save` și adăugăm autor (pentru că câmpul `author` n-a fost în `PostForm` și el este obligatoriu). `commit=False` înseamnă că noi nu dorim să salvăm modelul `Post` până când – dintâi, noi dorim să adăugăm autorul. Majoritatea timpului o să utilizați `form.save()` fără `commit=False`, dar în cazul acesta, noi avem nevoie de acesta. `post.save()` o să păstreze schimbările (adăugând autor) și blogul nou este creat!

În sfârșit, acesta va fi minunat de a trece la pagina `post_detail` pentru a vizualiza articol creat? Pentru a face acesta avem nevoie de mai un import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Adăugați-l la începutul fișierului. Acum noi putem să "facem un redirect la pagina `post_detail` pentru a vizualiza articol creat":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` este denumire unui view pe care vrem să o afișăm. Țineți minte că acest *view* are nevoie de o variabilă `pk`? Ca să-l transmitem la funcție utilizăm `pk=post.pk`, unde `post` este un articol nou care a fost creat!

OK, am vorbit mult, poate doriți să vedeți codul complet al funcției *view*?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Hai să verificăm dacă lucrează. Mergeți la o pagină http://127.0.0.1:8000/post/new/, adăugați `title` și `text`, salvați-l... și voilà! Un nou articol este adăugat și noi suntem redirecționați la pagina `post_detail`!

Poate ați văzut că am setat data de publicare înainte de salvare a postului. Apoi, o să introducem *butonul publish* în **Django Girls Tutorial: Extensii**.

Acesta este minunat!

> Din cauză că am utilizat interfața Django admin, suntem logați în sistem. Acesta sunt câteva situații în care putem să fim deconectați (închiderea browserului, restartarea bazei de date, etc.). Dacă primiți erori, când creați articol, care se refer la absența userului care este logat în sistem, mergeți la pagina de administrare page http://127.0.0.1:8000/admin și autentificați. O să fixăm aceasta problemă temporar. O soluție este descrisă în capitolul **Tema pentru acasă: adăugați securitate la site-ul vostru!** după tutorial principal.

![Eroare de autentificare](images/post_create_error.png)

## Validație formularelor

Acum o să vă arătăm cum lucrează Django formulare. Un articol de blog trebuie să aibă câmpurile `title` și `text`. În modelul `Post` noi nu am zis că aceste câmpurile nu sunt obligatorii (spre deosebire de `published_date`), deci Django, o să le considere obligatorii, în mod implicit.

Încercați să salvați formular fără `title` și `text`. Ce se va întâmpla!

![Validarea formularelor](images/form_validation2.png)

Django are grija de validare câmpurilor din formularul nostru. Nu este acesta minunat?

## Editarea formularului

Now we know how to add a new post. Dar dacă dorim să shimbăm pe acela pe care îl avem? Acesta este foarte similar cu aceea, ce noi am făcut. Hai să cream niște lucruri importante. (Dacă nu înțelegeți ceva, întrebați pe mentorul vostru sau citiți capitole precedente, pentru că aceste pași au fost deja explicate.)

Deschideți `blog/templates/blog/post_detail.html` în editorul de cod și adăugați linia

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

în așa mod ca un template să arăte în mod următor:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Deschideți `blog/urls.py` în editorul de cod și adăugați o linie:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

O să utilizăm template `blog/templates/blog/post_edit.html`, urmează să scriem un *view*.

Hai să deschidem `blog/views.py` în editor de cod și să adăugăm cod următor la sfârșitul fișierului:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Este ca și view `post_new`, corect? Dar nu complet. For one, we pass an extra `pk` parameter from `urls`. Apoi, obținem modelul `Post` pe care o vrem să edităm, utilizând `get_object_or_404(Post, pk=pk)` și apoi, când creăm formular, transmitem articol ca `o instanță`, în ambele cazuri când salvăm formular…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

... și când am deschis formular cu articol selectat pentru a-l edita:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, hai să testăm, dacă lucrează! Deschideți pagina `post_detail`. Acolo trebuie să fie un buton pentru editare în colț din sus-dreapta:

![Butonul de editare](images/edit_button2.png)

Când faceți un click o să vedeți formular cu articolul nostru:

![Editarea formularului](images/edit_form2.png)

Schimbați titlu sau text și salvați schimbările!

Felicitări! Aplicație devine mai complicată!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Securitate

Având posibilitate de a publica aticolele noi apăsând un link este minunat! Dar acum, orice persoana care vizitează site-ul va avea posibilitate de a crea un articol nou, și acesta nu este ceea ce voi doriți. Hai să facem ca butonul va fi afișat numai pentru tine, dar pentru orice persoana.

Deschideți `blog/templates/blog/base.html` în editorul de cod, găsiți `page-header` `div` și o ancoră pe care ați făcut mai înainte. El trebuie să arăte în mod următor:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Trebuie să adăugăm alt tag `{% if %}` care va face ca link-ul va fi afișat numai utilizatorilor care sunt autorizați în panel de administrare. Acum voi sunteți autorizați! Schimbați tag `<a>` care va arăta în mod următor:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Acesta `{% if %}` va face ca link-ul va fi afișat numai în cazul când utilizatorul care accesează pagina este autorizat. Acesta nu protejează complet de la crearea articolelor noi, dar este un bun început. O să vorbim mai mult despre securitate în lecții despre extensii.

Țineți minte despre o pictogramă pe care am adăugat-o pe pagina cu detalii? Noi dorim să facem acesta schimbare și aici, ca utilizatorii neautorizați să nu aibă posibilitate de a schimba articole.

Deschideți `blog/templates/blog/post_detail.html` în editorul de cod și adăugați linia:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Schimbați pe cod următor:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Din cauza că sunteți autorizați, dacă faceți un refresh a paginii, nu veți vedea nici o diferență. Deschideți pagină în alt browser sau pagina incognito (denumită "InPrivate" în Windows Edge) și o să vedeți că link-ul nu va fi afișat și pictograma de asemenea nu e afișată!

## Un alt lucru: lansați site-ul!

Hai să vedem dacă acesta lucrează pe PythonAnywhere. Este timpul să afișăm!

* Dintâi, faceți un commit de cod și un push pe GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Apoi în [linie de comandă pe PythonAnywhere](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Trebuie să substituiți `<your-pythonanywhere-domain>` cu denumirea sub-domeniului pe PythonAnywhere, fără paranteze unghiulare.)

* În sfârșit, mergeți la pagina ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (utilizați butonul din meniu în colțul de sus-dreapta) și apăsați **Reload**. Faceți un refresh a paginii https://subdomain.pythonanywhere.com pentru a vizualiza schimbările.

And that should be it. Congrats! :)