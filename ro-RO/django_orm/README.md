# Django ORM și QuerySets

În acest capitol veţi învăţa cum Django se conectează la baza de date şi stochează informație în ea. Haideti sa începem!

## Ce este un QuerySet?

QuerySet este, în genere, o listă de obiecte de anumit model. QuerySets dă posibilitate de a citi, filtra și sorta date dintr-o bază de date.

E mai ușo să învățăm după exemplu. Să ne încercăm?

## Django shell

Deschideți linie de comandă pe calculatorul vostru (nu pe PythonAnywhere) și executați comandă următoare:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Rezultatul trebuie să fie următor:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Sunteți acum în linie de comandă Django. Este ca Python prompt, dar cu niște funcții magice adiționale. :) Python și aici.

### Toate obiecte

Hai să încercăm să afișăm toate posturile noastre. Executați comandă următoare:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! Am primit o eroare. Ea ne arată că nu numele Post nu e definit. E corect - noi am uitat să-l importăm!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Importăm model `Post` din `blog.models`.Hai să afișăm pe toate posturile încă o dată:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Acesta este o listă de posturi pe ca le-am creat înainte! Noi am creat aceste posturi, utilizând interfața Django admin. Dar acum dorim să creăm posturi noi, utilizând Python. Cum obținem asta?

### Crearea obiectului

Acesta este cum să creați un nou obiect Post în baza de date:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Dar un ingredient lipsește: `me`. Avem nevoie să transmitem un exemplar de modelul `User` ca autor. Cum putem să obținem acesta?

Hai să facem un import a modelului User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Care utilizatorii avem în baza de date? Încercați codul următor:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

Acesta este utilizator cu super privilegiu, pe care i-am creat înainte! Hai să obținem un exemplar de utilizator (schimbați linie următoare ca să utilizați numele vostru de utilizator):

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Acum noi facem `get` a utilizatorului `User` cu `username` care este 'ola'. Ordonat!

Acum putem să cream un post de blog:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Ura! Doriți să verificați dacă s-a primit?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Avem un alt post in listă!

### Adaugați mai multe posturi

Acum puteți să adăugați mai multe posturi pentru a se adopta la acest proces. Mai adăugați doi sau trei posturi și trecem la capitolul următor.

### Filtrarea obiectelor

Functie importantă a QuerySets este abilitate de filtrare. Hai să găsim toate posturile utilizatorului ola. O să utilizăm `filter` în loc de `all` în `Post.objects.all()`. În paranteze o să indicăm condiție(ile) de filtrare la cere un post de blog trebuie să corespundă. În cazul nostru condiție este că `author` trebuie să fie egal cu `me`. Modul de a scrie acesta în Django este următor: `author=me`. Acum codul este următor:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Sau poate dorim să afișăm pe toate posturile care conțin cuvântul 'title' în atributul `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Notă** Între `title` și `contains` este două bare de jos (`_`). Regulă aceasta este utilizată de Django's ORM pentru a sepăra denumirea atributului ("title") și operațiilor sau filtrelor ("contains"). Dacă utilizați numai una bară de jos, o să primiți o eroare de tip "FieldError: Cannot resolve keyword title_contains".

Puteți să afișați o listă de posturi publicate. Facem asta, filtrând posturile care au `published_date` cu dată în trecut:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Din păcate, postul pe care noi i-am adăugat din linie de comandă Python încă nu este publicat. Dar putem schimba acesta! Dintâi trebuie să obținem postul pe care dorim să-l publicăm:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

Apoi îl publicăm, utilizând metoda `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Acum încercăm să obținem o listă de posturile (apăsați săgeată trei ori și apoi `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Sortarea obiectelor

Utilizând QuerySets puteți să sortați listă de obiecte. Pentru a le sorta după tribubutul `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Putem să inversăm sortare, adăugând `-` la început:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Interogările complexe, utilizând o serie de metode

După cum ați văzut, niște metode ale `Post.objects` returnează QuerySet. Aceași metode pot să fie utilizate pentru filtrarea a QuerySet-ului, și voi returna un nou QuerySet. Astfel, puteți să combinați efectul, utilizând o serie (**chaining**) de filtre:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Acesta dă posibilitate de a executa interogările complexe.

Acum sunteți gată de următorul capitol! Pentru a închide linie de comandă executați:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```