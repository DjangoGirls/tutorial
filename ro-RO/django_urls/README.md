# URL-urile în Django

Acuma putem să facem prima pagină: pagină principală pentru blogul vostru! Dar dintâi, hai să învățăm ceva despre Django URL-urile.

## Ce este URL?

URL este o adresa web. Vedeți URL fiecare dată când voi vizitați website - el este afișat în bara de adrese a browser-ului. (Da! `127.0.0.1:8000` este URL! Și `https://djangogirls.org` tot este URL.)

![URL](images/url.png)

Fiecare pagina din Internet are nevoie de URL. În așa mod, aplicație știe ce ea trebuie să afișeze utilizatorului care deschide acest URL. În Django, noi utilizăm un instrument denumit `URLconf` (configurație URL). URLconf este un set de modeluri pe care Django va încerca să compare cu URL solicitat pentru a găsi un view corect.

## Cum URL-urile lucrează în Django?

Hai să deschidem fișierul `mysite/urls.py` în editorul de cod și să vedem cum el arată:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

După cum vedeți, Django deja a generat careva cod.

Liniile între paranteze triple (`'''` sau `"""`) sunt numite docstrings (șir de documentație) – puteți să-l scrieți la începutul fișierului, clasei sau metodei pentru a descrie ce el face. Ele nu vor fi interpretate de Python.

URL panelului de administrare, pe care l-ați vizitat în capitolul precedent, este deja acolo:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Acesta înseamnă că pentru fiecare URL care începe cu `admin/`, Django va găsi un *view* corespunzător. În cazul acesta, noi includem mai multe URL-urile din panel de administrare ca ele să nu fie într-un singur fișier - așa codul se citește mai ușor și este mai curat.

## Primul tău Django URL!

Este timp să creăm primul URL! Noi dorim ca 'http://127.0.0.1:8000/' să fie pagina principală a blogului nostru și să afișează o listă de articole.

Noi mai dorim să păstrăm fișierul `mysite/urls.py` curat, de aceea o să facem import URL-urilor din aplicație `blog` în fișierul principal `mysite/urls.py`.

Mergeți mai departe și adăugați o linie care va importa `blog.urls`. Înca trebuie să schimbăm linia `from django.urls…` pentru că noi utilizăm funcția `include`, de aceea trebuie să adăugăm aceasta linie de import.

Fișierul `mysite/urls.py` trebuie să arăte în mod următor:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django va redireționa totul de 'http://127.0.0.1:8000/' la `blog.urls` și caută instrucțiunele următoare acolo.

## blog.urls

Faceți un fișier nou `urls.py` în directoriu `blog` și deschideți-l în editorul de cod. Adăugați liniile următoare:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Aici noi facem un import a funției din Django `path` și a tuturor `views` din aplicație `blog`. (Până când nu le avem, dar o să le creăm!)

După acesta putem să adăugăm primul model de URL:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

După cum vedeți, noi atribuim `view` numit `post_list` la URL principal. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full URL path. Aest model va spune lui Django că `views.post_list` este un loc corect de a începe când cineva va introduce adresa site-ului vostru 'http://127.0.0.1:8000/'.

Ultima parte, `name='post_list'`, este denumirea URL-ului care va fi utilizat pentru identificarea view-ului. Acesta poate fi la fel ca denumirea view-ului dar poate fi ceva complet diferit. O să utilizăm URL cu denumire mai târziu în proiect, de aceea este important să denumim fiecare URL în aplicație. Noi trebuie să păstrăm denumirile URL-urilor unice și ușor de a le aminti.

Dacă vizitați http://127.0.0.1:8000/ o să vedeți un mesaj că 'pagină web nu este disponibilă'. Acesta este din cauza că server (țineți minte să executați comandă `runserver`?) nu lucrează. Verificați linie de comandă a server-ului vostru și găsiți cauza.

![Eroare](images/error1.png)

Consola arată o eroare, dar nu faceți grijă – ea este utilă: ea vă spune că **atributul 'post_list'** nu există. Acesta este denumirea *view* pe care Django încearcă să găsească și s-o utilizeze, dar noi n-am creat-o până când. Acum `/admin/` tot nu va lucra. Nu vă faceți grijă - o s-o corectăm. Dacă vedeți o altă eroare, restartați serverul. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together). On Windows, you might have to press Ctrl+Break. Then you need to restart the web server by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/