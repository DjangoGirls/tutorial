# Django Forme

Na kraju, stvar koju želimo da uradimo na našem blogu je da omogućimo da se lako dodaju i izmenjuju postovi. Django `admin` je kul, ali ga je teško prilagoditi i učiniti lepim. Uz pomoć `formi` možemo da imamo apsolutnu kontrolu nad našim interfejsom - možemo da uradimo skoro sve što zamislimo!

Dobra stvar u vezi sa Django formama je ta što možemo ili da ih definišemo ispočetka ili možemo da definišemo `formu modela` koja će sačuvati rezultat forme za model.

To je upravo ono što želimo da uradimo: da kreiramo formu za naš `Post` model.

Kao i svaki važan deo Django biblioteke, forme imaju svoj fajl: `forms.py`.

Moramo da kreiramo fajl sa ovakvim nazivom u `blog` direktorijumu.

    blog
       └── forms.py
    

Ok, hajde da to otvorimo u editoru i da ukucamo sledeći kod:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Prvo moramo da uvezemo listu sa Django formama (ukucaćemo `from django import forms`) i naš `Post` model (naredbom `from .models import Post`).

`PostForm` je, kao što možete i da pretpostavite, naziv naše forme. Moramo da kažemo Django-u da je ta forma u stvari `forma modela` (tako da Django može da odradi magičan deo posla za nas) - za to je odgovorna `forms.ModelForm` komanda.

Zatim, imamo `class Meta` naredbu, gde kažemo Django-u koji model bi trebalo da se koristi da se napravi ova forma (`model = Post`).

Konačno, možemo da kažemo koja polja bi trebalo da budu u našoj formi. U ovom slučaju želimo da jedino `naslov` i `tekst` budu vidljivi - `autor` bi trebalo da bude osoba koja je trenutno ulogovana (Vi), a `datum` bi trebalo da bude automatski podešen kada kreiramo post (npr. u kodu).

To je sve! Ono što treba sada da uradimo je da iskoristimo formu u *pregledu* i da je prikažemo u obrascu.

Dakle, još jednom ćemo kreirati link do stranice, URL, pregled i obrazac.

## Link do stranice sa formom

Vreme je da otvorite `blog/templates/blog/base.html` u editoru. Dodaćemo link u `div` i nazvaćemo ga `zaglavlje stranice`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Primetite da želimo da naš novi pregled imenujemo kao `post_new`. Klasa `"glyphicon glyphicon-plus"` je obezbeđena od strane bootstrap teme koju koristimo i prikazaće znak plus.

Nakon dodavanja odgovarajuće linije, vaš HTML bi trebalo da izgleda ovako:

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

Nakon memorisanja i osvežavanja stranice http://127.0.0.1:8000, videćete poznatu `NoReverseMatch` grešku. Da li je tako? Odlično!

## URL

Otvorite `blog/urls.py` u editoru kako biste dodali liniju:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

A krajnji rezultat u kodu bi trebalo da izgleda ovako:

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

Nakon osvežavanja sajta, vidimo grešku `AttributeError`, jer nemamo još uvek implementiran prikaz `post_new`. Hajde da ga dodamo.

## post_new prikaz

Vreme je da otvorite `blog/views.py` fajl u editoru i da dodate sledeće linije, zajedno sa ostalim `from` redovima:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

I zatim naš *pregled*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Da biste kreirali novu `Post` formu, potrebno je da pozovete `PostForm()` funkciju i da je prosledite obrascu. Vratićemo se na ovaj *pregled*, ali za sada, hajde da na brzinu kreiramo šablon za formu.

## Šablon

Moramo da kreiramo fajl `post_edit.html` u `blog/templates/blog` direktorijumu i da ga otvorimo u editoru. Da bi forma funkcionisala, potrebno je nekoliko stvari:

* Moramo da prikažemo formu. To možemo da uradimo (na primer) uz pomoć linije {% raw %}`{{ form.as_p }}`{% endraw %}.
* Prethodna linija mora da bude obuhvaćena HTML tagovima `<form method="POST">...</form>`.
* Potrebno nam je `Sačuvaj` dugme. To radimo pomoću HTML dugmeta: `<button type="submit">Sačuvaj</button>`.
* I na kraju, odmah nakon otvaranja `<form ...>` taga, moramo da dodamo {% raw %}`{% csrf_token %}`{% endraw %}. Ovo je veoma važno jer čini Vašu formu bezbednom! Ako to zaboravite, Django će da se žali kada pokušate da sačuvate formu:

![CSFR Forbidden page](images/csrf2.png)

Okej, hajde sada da vidimo kako bi trebalo da izgleda HTML u `post_edit.html`:

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

Vreme je da osvežite stranicu! Opa! Forma se prikazala!

![New form](images/new_form2.png)

Ali, samo trenutak - šta će se desiti kada pokušate da ukucate nešto u polja za `naslov` i `tekst` i probate to da sačuvate?

Ništa! Ponovo se nalazimo na istoj stranici i tekst je nestao, a novi post uopšte nije dodat. Dakle, šta je krenulo naopako?

Odgovor je - ništa. Moramo da odradimo još nešto u našem *prikazu*.

## Čuvanje forme

Otvorite ponovo `blog/views.py` u editoru. Trenutno je sve što imamo u `post_new` prikazu sledeće:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Kada predamo formu, vraćamo se na isti prikaz, ali ovog puta imamo više podataka u `zahtevu`, tačnije unutar `request.POST` (naziv nema veze sa blog "postom", već sa time što "postujemo" podatke). Sećate se kako je u HTML naša `<form>` definicija imala promenljivu `method="POST"`? Sva polja iz forme se sada nalaze unutar `request.POST`. Ne bi trebalo da preimenujete `POST` ni u šta drugo (jedina preostala validna vrednost za `metod` je `GET`, ali nemamo sada dovoljno vremena da objašnjavamo u čemu je razlika).

U našem *pregledu* imamo dve različite situacije sa kojima moramo da izadjemo na kraj: prvo - kada prvi put posetimo stranicu i želimo praznu formu i drugo - kada se vratimo na *pregled* sa svim podacima sa forme koje smo upravo uneli. Zato, treba da podesimo uslov (za to ćemo koristiti `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Vreme je da popunimo mesto obeleženo tačkama `[...]`. Ako je `metod` isto što i `POST`, onda želimo da napravimo `PostForm` pomoću podataka iz forme, zar ne? To ćemo uraditi na sledeći način:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Sledeće što treba da uradimo je da proverimo da li je forma ispravna (proveravamo da li su sva neophodna polja popunjena i da li su unete ispravne vrednosti). To radimo uz pomoć funkcije `form.is_valid()`.

Proveravamo da li je forma ispravna i ako jeste - možemo da je sačuvamo!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Praktično, ovde imamo dve stvari: čuvamo formu pomoću funkcije `form.save` i dodajemo autora (s obzirom na to da ne postoji polje `autor` unutar `PostForm`, a ovo polje je neophodno). `commit=False` znači da nećemo još uvek da sačuvamo `Post` model - prvo želimo da dodamo autora. U najvećem broju slučajeva ćete koristiti funkciju `form.save()` bez `commit=False`, ali u ovom slučaju moramo to da dodamo. Funkcija `post.save()` će da sačuva izmene (autora) i novi blog post je kreiran!

Na kraju, bilo bi odlično ako bismo mogli da odmah odemo do `post_detail` stranice za naš novi blog, zar ne? Da bismo to uradili, potrebno je da još nešto uvezemo:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Dodajte to na samom početku Vašeg fajla. Onda tek možemo da kažemo "idite na stranicu `post_detail` za novi post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

Naziv prikaza na koji želimo da odemo je `post_detail`. Da li se sećate da je za ovaj *prikaz* neophodna `pk` promenljiva? Da bismo je prosledili, koristimo `pk=post.pk`, gde je `post` naš post koji smo skoro kreirali.

Okej, dosta smo pričali, vreme je da vidimo kako ceo *prikaz* zaista izgleda, zar ne?

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

Hajde da vidimo da li radi. Idite na stranicu http://127.0.0.1:8000/post/new/, dodajte `naslov` i `tekst`, sačuvajte ga i... voilà! Novi blog post je dodat, a mi smo preusmereni na stranicu `post_detail`!

Možda ste primetili da postavljamo datum objavljivanja pre nego što smo sačuvali post. Kasnije ćemo predstaviti *dugme za objavljivanje* u **Django Girls Priručniku: Ekstenzije**.

To je kul!

> Pošto smo skoro koristili Django admin interfejs, sistem trenutno misli da smo još uvek ulogovani. Postoji nekoliko situacija koje bi mogle da prouzrokuju da budemo izlogovani - zatvaranje pretraživača, restartovanje DB-a itd. Ukoliko u toku kreiranja posta dobijate poruke o grešci, koje ukazuju na nepostojanje ulogovanih korisnika, idite na admin stranicu http://127.0.0.1:8000/admin i ponovo se ulogujte. Ovo će privremeno da reši problem. Postoji stalno rešenje problema koje možete pronaći u poglavlju **Domaći zadatak: obezbeđivanje sigurnosti veb sajta!**, na kraju glavnog dela priručnika.

![Logged in error](images/post_create_error.png)

## Validacija forme

Sada ćemo Vam pokazati koliko su kul Django forme. Blog post mora da sadrži polja za `naslov` i `tekst`. In our `Post` model we did not say that these fields (as opposed to `published_date`) are not required, so Django, by default, expects them to be set.

Try to save the form without `title` and `text`. Guess what will happen!

![Form validation](images/form_validation2.png)

Django is taking care to validate that all the fields in our form are correct. Isn't it awesome?

## Edit form

Now we know how to add a new form. But what if we want to edit an existing one? This is very similar to what we just did. Let's create some important things quickly. (If you don't understand something, you should ask your coach or look at the previous chapters, since we covered all these steps already.)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

so that the template will look like this:

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

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

We will reuse the template `blog/templates/blog/post_edit.html`, so the last missing thing is a *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

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

This looks almost exactly the same as our `post_new` view, right? But not entirely. For one, we pass an extra `pk` parameter from urls. Next, we get the `Post` model we want to edit with `get_object_or_404(Post, pk=pk)` and then, when we create a form, we pass this post as an `instance`, both when we save the form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…and when we've just opened a form with this post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK, let's test if it works! Let's go to the `post_detail` page. There should be an edit button in the top-right corner:

![Edit button](images/edit_button2.png)

When you click it you will see the form with our blog post:

![Edit form](images/edit_form2.png)

Feel free to change the title or the text and save the changes!

Congratulations! Your application is getting more and more complete!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.0/topics/forms/

## Security

Being able to create new posts by clicking a link is awesome! But right now, anyone who visits your site will be able to make a new blog post, and that's probably not something you want. Let's make it so the button shows up for you but not for anyone else.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

We're going to add another `{% if %}` tag to this, which will make the link show up only for users who are logged into the admin. Right now, that's just you! Change the `<a>` tag to look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

This `{% if %}` will cause the link to be sent to the browser only if the user requesting the page is logged in. This doesn't protect the creation of new posts completely, but it's a good first step. We'll cover more security in the extension lessons.

Remember the edit icon we just added to our detail page? We also want to add the same change there, so other people won't be able to edit existing posts.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Change it to this:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Since you're likely logged in, if you refresh the page, you won't see anything different. Load the page in a different browser or an incognito window (called "InPrivate" in Windows Edge), though, and you'll see that the link doesn't show up, and the icon doesn't display either!

## One more thing: deploy time!

Let's see if all this works on PythonAnywhere. Time for another deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it! Congrats :)