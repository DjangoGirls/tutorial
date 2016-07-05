# Formularze Django

Ostatnią rzeczą jaką potrzebujemy dla naszej strony jest stworzenie przyjemnego sposobu dodawania i edytowania wpisów na bloga. Panel administracyjny (Django `admin`) jest fajny, ale raczej ciężko się go dostosowuje do niestandardowych potrzeb i ciężko poprawić jego wygląd. Z formularzami (`forms`) mamy absolutną władzę nad naszym interfejsem - możemy zbudować niemal wszystko, co nam przyjdzie do głowy!

Sympatyczną cechą formularzy Django jest to, że możemy je budować samodzielnie od zera lub posłużyć się formularzem modelu (`ModelForm`), który zapisze dane wynikowe w danym modelu.

To właśnie zamierzamy zrobić: zbudujemy formularz dla naszego modelu `Post`.

Jak każda istotna część Django, formularze mają swój własny plik: `forms.py`.

Stwórzmy plik o takiej nazwie w katalogu `blog`.

    blog
       └── forms.py


Dobrze, a teraz otwórzmy go i wprowadźmy następujący kod:

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```    

Musimy najpierw zaimportować formularze Django (`from django import forms`) oraz, naturalnie, nasz model wpisu (`from .models import Post`).

`PostForm`, jak zapewne podejrzewasz, to nazwa naszego formularza. Musimy poinformować Django, że ten formularz jest formularzem modelu (`ModelForm`), dzięki czemu Django wyręczy nas w pewnych czynnościach - właśnie za to odpowiada `forms.ModelForm`.

Dalej mamy `class Meta`, gdzie przekazujemy Django informację o tym, jaki model powinien być wykorzystany do stworzenia tego formularza (`model = Post`).

I wreszcie możemy wskazać, które pole (lub pola) powinny pojawić się w naszym formularzu. W tym przypaku chcemy udostępnić tylko pola `title` (tytuł) i `text` (treść wpisu) - pole autora, czyli `author` powinno zawierać aktualnie zalogowanego użytkownika (Ciebie!), zaś data stworzenia wpisu (`created_date`) powinna być ustawiana automatycznie gdy stworzymy wpis (czyli za pomocą kodu) - zgadza się?

I to wszystko! Jedyne, co potrzebujemy teraz zrobić, to użyć naszego formularza wewnątrz *widoku* i wyświetlić go w szablonie.

Oto, co za chwilę stworzymy: link do strony, adres URL, widok i szablon.

## Odnośnik do strony z formularzem

Czas otworzyć plik `blog/templates/blog/base.html`. Wewnątrz `div`-a o nazwie `page-header` dodajmy odnośnik:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Zauważ, że chcemy odwołać się do naszego nowego widoku `post_new`.

Po dodaniu powyższej linii Twój plik HTML powinien wyglądać następująco:

```html
{% load staticfiles %}
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

Po zapisaniu i odświeżeniu strony http://127.0.0.1:8000 zobaczyłaś oczywiście znajomo wyglądający błąd `NoReverseMatch`, zgadza się?

## URL

Otwieramy plik `blog/urls.py` i dodajemy wiersz:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```

Ostatecznie kod będzie wyglądał tak:

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

Po odświeżeniu strony zobaczymy błąd `AttributeError`, ponieważ nie mamy jeszcze zaimplementowanego widoku `post_new`. Dodajmy go teraz.

## Widok post_new

Czas otworzyć plik `blog/views.py` i dodać poniższe linijki obok innych wierszy z `from`:

```python
from .forms import PostForm
```

no i nasz *widok*:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Aby stworzyć nowy formularz dla modelu `Post`, musimy wywołać funkcję `PostForm()` i przekazać ją do szablonu. Do tego *widoku* jeszcze wrócimy. Ale póki co, stwórzmy szybko szablon formularza.

## Szablon

Musimy utworzyć plik `post_edit.html` w katalogu `blog/templates/blog`. Aby nasz formularz zadziałał, niezbędne jest kilka rzeczy:

*   musimy wyświetlić formularz. Możemy to zrobić np. za pomocą prostego polecenia `{% raw %}{{ form.as_p }}{% endraw %}`.
*   powyższa linijka musi znajdować się wewnątrz znacznika formularza HTML: <`form method="POST">...</form>`
*   potrzebny nam przycisk `Zapisz`. Tworzymy go jako przycisk w HTML: `<button type="submit">Save</button>`
*   i na koniec jeszcze, zaraz po znaczniku otwierającym `<form ...>`, musimy dodać `{% raw %}{% csrf_token %}{% endraw %}`. To bardzo ważne, gdyż ta linijka sprawia, że Twoje formularze są bezpieczne! Jeśli o tym zapomnisz i spróbujesz zapisać formularz, Django nie pozostawi tego bez komentarza:

![Strona CSRF Forbidden][1]

 [1]: images/csrf2.png

OK. Podsumujmy, jak powinien wyglądać kod HTML w pliku `post_edit.html`:

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Czas odświeżyć stronę! Hura! Twój formularz został wyświetlony!

![Nowy formularz][2]

 [2]: images/new_form2.png

Ale zaraz zaraz! Co się stanie, gdy wpiszesz coś w pola z tytułem i treścią, a następnie spróbujesz to zapisać?

Nic! Znów jesteśmy na tej samej stronie, a nasza treść zniknęła... a nowego wpisu nie ma. Co poszło źle?

Odpowiedź brzmi: nic. Mamy coś jeszcze do zrobienia w naszym *widoku*.

## Zapisujemy formularz

Otwórz jeszcze raz plik `blog/views.py`. W tym momencie wszystko, co mamy w widoku `post_new` to:

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Gdy prześlemy formularz, wracamy do tego samego widoku, ale tym razem mamy nieco więcej danych w zapytaniu (zmiennej `request`) - a dokładnie w `request.POST`. (Nazwa POST nie ma nic wspólnego z naszymi blogowymi postami. POST wzięło się od angielskiego czasownika "post", który oznacza wysłać, nadać). Pamiętasz, że w pliku HTML nasza definicja formularza `<form>` zawierała atrybut `method="POST"`? Wszystkie pola z formularza znajdują się teraz w `request.POST`. Nie zmieniaj nazwy `POST` na cokolwiek innego (inną prawidłową wartością dla `method` jest `GET`, ale nie mamy czasu na omawianie różnic).

A więc w naszym *widoku* mamy dwie oddzielne sytuacje do obsłużenia. Pierwsza: gdy wchodzimy na stronę po raz pierwszy i chcemy pusty formularz. Druga: gdy ponownie znajdziemy się w *widoku* wraz ze wszystkimi danymi wpisanymi przez nas w formularzu. Czyli musimy dodać wyrażenie warunkowe (użyjemy do tego `if`).

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Teraz czas na uzupełnienie kropek `[...]`. Jeżeli zmienna `method` jest równa `POST`, to chcemy zbudować formularz `PostForm` z danymi wprowadzonymi w formularzu, zgadza się? Możemy zrobić to następująco:

```python
form = PostForm(request.POST)
```

Łatwizna! Następnie sprawdźmy, czy formularz jest wypełniony poprawnie (wszystkie wymagane pola są uzupełnione i żadna nieprawidłowa wartość nie zostanie zapisana). Użyjmy do tego `form.is_valid()`.

Sprawdzamy, czy formularz jest wypełniony poprawnie. Jeśli tak, możemy go zapisać!

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Tak właściwie robimy teraz dwie rzeczy: zapisujemy formularz przy pomocy `form.save` oraz dodajemy autora (jako że nasz `PostForm` nie zawierał pola `author`, a jest ono wymagane!). `commit=False` sygnalizuje, że jeszcze nie chcemy zapisywać modelu `Post` - najpierw chcemy dodać autora. Przez większość czasu będziesz używała `form.save()` bez `commit=False`, ale w tym przypadku musimy zrobić to w ten sposób. `post.save()` zachowa zmiany (razem z dodanym autorem) i nasz nowy wpis na blogu jest gotowy!

Byłoby wreszcie wspaniale, gdybyśmy mogły przejdź od razu na stronę `post_detail` i zobaczyć nasz nowy wpis, prawda? Aby to było możliwe, musimy dodać parę importów:

```python
from django.shortcuts import redirect
```

Dodaj je na samym początku pliku. I teraz możemy powiedzieć: przejdź na stronę `post_detail`, żeby zobaczyć nowo utworzony wpis.

```python
return redirect('post_detail', pk=post.pk)
```

`blog.views.post_detail` to nazwa widoku, do którego chcemy przejść. Pamiętasz, że ten *widok* potrzebuje zmiennej `pk`? Aby ją przekazać do widoków stosujemy `pk=post.pk`, gdzie `post` jest nowo utworzonym wpisem!

No dobrze, pogadałyśmy sobie, to może teraz zobaczymy, jak wygląda cały nasz *widok*, co?

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

Zobaczmy, czy zadziała. Przejdź na stronę http://127.0.0.1:8000/post/new/, dodaj `tytuł` i `tekst`, zapisz... i voilà! Nowy wpis został dodany, a my zostałyśmy przekierowane na stronę `post_detail`!

Zapewne dostrzegłaś, że w ogóle nie zajęłyśmy się ustawianiem daty publikacji. Wprowadzimy przycisk publikacji *publish* w kursie **Django Girls: Rozszerzenia**.

Wspaniale!

## Walidacja formularza

Teraz pokażemy Ci, jak fajne potrafią być formularze w Django. Wpis na blogu potrzebuje uzupełnionych pól `title` i `text`. W naszym modelu `Post` nie zaznaczałyśmy (z wyjątkiem `published_date`), że te pola nie są wymagane, prawda? Dlatego Django domyślnie uważa, że muszą zostać wypełnione.

Spróbuj zapisać formularz bez uzupełnionych pól `title` i `text`. Zgadnij, co się stanie!

![Walidacja formularza][3]

 [3]: images/form_validation2.png

Django dba o walidację pól w naszym formularzu, upewniając się, czy są uzupełnione poprawnie. Prawda że niesamowite?

> Jako że niedawno używałyśmy interfejsu admina Django, system w tym momencie jest przekonany, że jesteśmy zalogowane. Niektóre sytuacje mogą doprowadzić do tego, że zostaniemy wylogowane (np. zamknięcie przeglądarki czy restart bazy danych). Jeżeli zauważysz, że przy tworzeniu wpisu pojawia się błąd związany z brakiem zalogowanego użytkownika, przejdź na stronę stronę panelu admina http://127.0.0.1:8000/admin i zaloguj się jeszcze raz. Na pewien czas problem się rozwiąże. W rozdziale **Praca domowa: zabezpiecz swoją stronę!** - zaraz po głównym kursie - czeka na Ciebie permanentne rozwiązanie tego problemu.

![Błąd logowania użytkownika][4]

 [4]: images/post_create_error.png

## Edycja formularza

Teraz już wiemy, jak dodać nowy formularz. Ale co w przypadku, gdy zapragniemy zmienić już istniejący? Proces jest bardzo podobny do tego, który przeszłyśmy przed chwilą. Dodajmy szybko potrzebne elementy (jeżeli masz problem ze zrozumieniem czegoś - zapytaj osobę prowadzącą kurs lub przejrzyj poprzednie rozdziały, gdyż wszystkie kroki mamy już omówione).

Otwórz `blog/templates/blog/post_detail.html` i dodaj poniższą linijkę:

```python
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

dzięki czemu nasz szablon będzie wyglądał tak:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

W pliku `blog/urls.py` dodajmy wiersz:

```python
    url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```

Wykorzystamy jeszcze raz szablon `blog/templates/blog/post_edit.html`, więc ostatnią rzeczą, której nam brakuje, jest *widok*.

Otwórz `blog/views.py` i dodaj poniższy kod na samym końcu tego pliku:

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

To wygląda prawie tak samo, jak nasz widok `post_new`, nieprawdaż? Ale nie do końca. Po pierwsze: przekazujemy dodatkowy parametr `pk` z urls. Dalej - pobieramy model wpisu `Post` do edycji za pomocą `get_object_or_404(Post, pk=pk)`. Gdy tworzymy formularz, przekazujemy ten wpis pod zmienną `instance` zarówno w trakcie zapisywania formularza:

```python
form = PostForm(request.POST, instance=post)
```

jak i zaraz po otwarciu formularza z wpisem do edycji:

```python
form = PostForm(instance=post)
```

OK. Przetestujmy, jak to działa! Przejdź na stronę `post_detail`. W górnym prawym rogu powinnaś znaleźć przycisk edycji:

![Przycisk edycji][5]

 [5]: images/edit_button2.png

Po kliknęciu w niego zobaczysz formularz z naszym wpisem:

![Edycja formularza][6]

 [6]: images/edit_form2.png

Zmodyfikuj jego tytuł lub treść wedle uznania, a następnie zapisz zmiany!

Gratulacje! Twoja aplikacja staje się coraz bardziej kompletna!

Jeżeli potrzebujesz więcej informacji o formularzach Django, zajrzyj do dokumentacji: https://docs.djangoproject.com/en/1.8/topics/forms/

## Bezpieczeństwo

Super, że możemy tworzyć posty po prostu klikając w link! Jest niestety jeden problem - teraz każdy, kto odwiedzi Twoją stronę, może stworzyć nowy post. Dobrze by było, gdyby przycisk był widoczny tylko dla Ciebie.

W `blog/templates/blog/base.html` znajdź `page-header` `div` i tag <0>a</0>, który umieściliśmy tam wcześniej. Powinien wyglądać tak:

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Dodamy kolejny tag `{% if %}`, który sprawi, że link będzie widoczny tylko dla użytkowników zalogowanych jako admin. W tej grupie na razie jesteś tylko Ty! Zmień `<a>` tag, by wyglądał w ten sposób:

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Ten `{% if %}` spowoduje, że link zostanie wysłany do przeglądarki tylko jeśli to żądanie zostało wystosowane przez zalogowanego użytkownika. To nie chroni tworzenia wpisów w 100%, ale jest to dobry pierwszy krok. Zagadnieniu bezpieczeństwa poświęcimy więcej miejsca w rozszerzeniu do tego kursu.

Pewnie jesteś teraz zalogowana, więc jak odświeżysz stronę to nie zobaczysz różnicy. Wejdź na tę stronę używając innej przeglądarki lub w trybie prywatnym, a wtedy zobaczysz, że link się już nie pokaże!

## Jeszcze jedno: czas na wdrożenie!

Dobrze byłoby wiedzieć, że nasza witryna nadal działa na PythonAnywhere, prawda?

*   Po pierwsze zapiszmy nasze zmiany i wyślijmy je na Githuba

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Dodano widok tworzenia/edytowania posta bezposrednio na stronie."
    $ git push


*   Potem, w konsoli [PythonAnywhere Bash][7]:

 [7]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]


*   Na koniec, przejdźmy do podstrony [Web tab][8] i wciśnijmy **Reload** (ang. odśwież).

 [8]: https://www.pythonanywhere.com/web_app_setup/

I to już wszystko! Gratulacje :)
