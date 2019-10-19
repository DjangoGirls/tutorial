# Formularze Django

Ostatnią rzeczą, jaką potrzebujemy dla naszej strony, jest stworzenie przyjemnego sposobu dodawania i edytowania wpisów na blog. Panel administracyjny (Django `admin`) jest fajny, ale raczej ciężko się go dostosowuje do niestandardowych potrzeb i ciężko poprawić jego wygląd. Z formularzami (`forms`) mamy absolutną władzę nad naszym interfejsem - możemy zbudować niemal wszystko, co nam przyjdzie do głowy!

Sympatyczną cechą formularzy Django jest to, że możemy je budować samodzielnie od zera lub posłużyć się formularzem modelu (`ModelForm`), który zapisze dane wynikowe w danym modelu.

To właśnie zamierzamy zrobić: zbudujemy formularz dla naszego modelu `Post`.

Jak każda istotna część Django, formularze mają swój własny plik: `forms.py`.

Stwórzmy plik o takiej nazwie w katalogu `blog`.

    blog
       └── forms.py
    

Dobrze, a teraz otwórzmy edytor kodu i wprowadźmy następujący kod:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

Musimy najpierw zaimportować formularze Django (`from django import forms`) oraz nasz model `Post` (`from .models import Post`).

`PostForm`, jak zapewne podejrzewasz, to nazwa naszego formularza. Musimy poinformować Django, że ten formularz jest formularzem modelu (`ModelForm`), dzięki czemu Django wyręczy nas w pewnych czynnościach - właśnie za to odpowiada `forms.ModelForm`.

Dalej mamy `class Meta`, gdzie przekazujemy Django informację o tym, jaki model powinien być wykorzystany do stworzenia tego formularza (`model = Post`).

I wreszcie możemy wskazać, które pole (lub pola) powinny pojawić się w naszym formularzu. W tym przypadku chcemy udostępnić tylko pola `title` (tytuł) i `text` (treść wpisu) - pole autora, czyli `author` powinno zawierać aktualnie zalogowanego użytkownika (Ciebie!), zaś data stworzenia wpisu (`created_date`) powinna być ustawiana automatycznie, gdy stworzymy wpis (czyli za pomocą kodu) - zgadza się?

I to wszystko! Jedyne, co potrzebujemy teraz zrobić, to użyć naszego formularza wewnątrz *widoku* i wyświetlić go w szablonie.

Oto co za chwilę stworzymy: link do strony, adres URL, widok i szablon.

## Odnośnik do strony z formularzem

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Zauważ, że chcemy odwołać się do naszego nowego widoku `post_new`. Klasa `"glyphicon glyphicon-plus"` jest dostarczana przez motyw z bootstrapa, którego używamy i wyświetli nam znak plus.

Po dodaniu powyższej linii Twój plik HTML powinien wyglądać następująco:

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

Po zapisaniu i odświeżeniu strony http://127.0.0.1:8000 zobaczyłaś znajomo wyglądający błąd `NoReverseMatch`, zgadza się? OK!

## Adres URL

Otwieramy plik `blog/urls.py` w edytorze kodu i dodajemy wiersz:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new', views.post_new, name='post_new'),
```

Ostatecznie kod będzie wyglądał tak:

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

Po odświeżeniu strony zobaczymy błąd `AttributeError`, ponieważ nie mamy jeszcze zaimplementowanego widoku `post_new`. Dodajmy go teraz.

## Widok post_new

Czas otworzyć plik `blog/views.py` w edytorze kodu i dodać poniższe linijki obok innych wierszy z `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

No i nasz *widok*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Aby stworzyć nowy formularz dla modelu `Post`, musimy wywołać funkcję `PostForm()` i przekazać ją do szablonu. Do tego *widoku* jeszcze wrócimy, ale póki co, stwórzmy szybko szablon dla formularza.

## Szablon

Musimy utworzyć plik `post_edit.html` w katalogu `blog/templates/blog` i otowrzyć go w edytorze kodu. Aby nasz formularz zadziałał, niezbędnych jest kilka rzeczy:

* Musimy wyświetlić formularz. Możemy to zrobić np. za pomocą polecenia {% raw %}`{{ form.as_p }}`{% endraw %}.
* Powyższa linijka musi znajdować się wewnątrz znacznika formularza HTML: &lt;`form method="POST">...</form>`.
* Potrzebny nam przycisk `Zapisz`. Tworzymy go jako przycisk w HTML: `<button type="submit">Save</button>`.
* I na koniec jeszcze, zaraz po znaczniku otwierającym `<form ...>`musimy dodać {% raw %}`{% csrf_token %}`{% endraw %}. To bardzo ważne, gdyż ta linijka sprawia, że Twoje formularze są bezpieczne! Jeśli o tym zapomnisz i spróbujesz zapisać formularz, Django nie pozostawi tego bez komentarza:

![Strona CSRF Forbidden](images/csrf2.png)

OK. Podsumujmy, jak powinien wyglądać kod HTML w pliku `post_edit.html`:

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

Czas odświeżyć stronę! Hura! Twój formularz został wyświetlony!

![Nowy formularz](images/new_form2.png)

Ale zaraz, zaraz! Co się stanie, gdy wpiszesz coś w pola z `tytułem` i `treścią`, a następnie spróbujesz to zapisać?

Nic! Znów jesteśmy na tej samej stronie, a nasza treść zniknęła... a nowego wpisu nie ma. Co poszło źle?

Odpowiedź brzmi: nic. Mamy coś jeszcze do zrobienia w naszym *widoku*.

## Zapisujemy formularz

Otwórz jeszcze raz plik `blog/views.py`. w edytorze kodu. W tym momencie wszystko, co mamy w widoku `post_new` to:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Gdy prześlemy formularz, wracamy do tego samego widoku, ale tym razem mamy nieco więcej danych w zapytaniu (zmiennej `request`) - a dokładnie w `request.POST` (Nazwa POST nie ma nic wspólnego z naszymi blogowymi postami. POST wzięło się od angielskiego czasownika "post", który oznacza wysłać, nadać). Pamiętasz, że w pliku HTML nasza definicja `<form>` zawierała atrybut `method="POST"`? Wszystkie pola z formularza znajdują się teraz w `request.POST`. Nie zmieniaj nazwy `POST` na cokolwiek innego (inną prawidłową wartością dla `method` jest `GET`, ale nie mamy czasu na omawianie różnic).

A więc w naszym *widoku* mamy dwie oddzielne sytuacje do obsłużenia. Pierwsza: gdy wchodzimy na stronę po raz pierwszy i chcemy pusty formularz. Druga: gdy ponownie znajdziemy się w *widoku* wraz ze wszystkimi danymi wpisanymi przez nas w formularzu. Czyli musimy dodać wyrażenie warunkowe (użyjemy do tego `if`):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

To jest czas na uzupełnienie kropek `[...]`. Jeżeli zmienna `method` jest równa `POST`, to chcemy zbudować formularz `PostForm` z danymi z formularza, zgadza się? Możemy zrobić to następująco:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

Następnie sprawdźmy, czy formularz jest wypełniony poprawnie (wszystkie wymagane pola są uzupełnione i żadna nieprawidłowa wartość nie zostanie zapisana). Użyjmy do tego `form.is_valid()`.

Sprawdzamy, czy formularz jest wypełniony poprawnie. Jeśli tak, możemy go zapisać!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

Tak właściwie robimy teraz dwie rzeczy: zapisujemy formularz przy pomocy `form.save` oraz dodajemy autora (jako że nasz `PostForm` nie zawierał pola `author`, a jest ono wymagane). `commit=False` sygnalizuje, że jeszcze nie chcemy zapisywać modelu `Post` - najpierw chcemy dodać autora. Przez większość czasu będziesz używała `form.save()` bez `commit=False`, ale w tym przypadku musimy zrobić to w ten sposób. `post.save()` zachowa zmiany (razem z dodanym autorem) i nasz nowy wpis na blogu jest gotowy!

Ostatecznie, byłoby wspaniale, gdybyśmy mogły przejść od razu na stronę `post_detail` i zobaczyć nasz nowy wpis, prawda? Aby to było możliwe, potrzebujemy jeszcze jednego importu:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Dodaj go na samym początku pliku. I teraz możemy powiedzieć: "przejdź na stronę `post_detail`, żeby zobaczyć nowo utworzony wpis":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` to nazwa widoku, do którego chcemy przejść. Pamiętasz, że ten *widok* potrzebuje zmiennej `pk`? Aby ją przekazać do widoków stosujemy `pk=post.pk`, gdzie `post` jest nowo utworzonym wpisem!

No dobrze, pogadałyśmy sobie, to może teraz zobaczymy, jak wygląda cały nasz *widok*, co?

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

Zobaczmy, czy zadziała. Przejdź na stronę http://127.0.0.1:8000/post/new/, dodaj `tytuł` i `tekst`, zapisz... i voilà! Nowy wpis został dodany, a my zostałyśmy przekierowane na stronę `post_detail`!

Zapewne dostrzegłaś, że ustalamy datę publikacji przed zapisaniem postu. Później wprowadzimy przycisk publikacji *publish* w kursie **Django Girls: Rozszerzenia**.

Wspaniale!

> Jako że niedawno używałyśmy interfejsu admina Django, system w tym momencie jest przekonany, że jesteśmy zalogowane. Niektóre sytuacje mogą doprowadzić do tego, że zostaniemy wylogowane (np. zamknięcie przeglądarki czy restart bazy danych, itd.). Jeżeli zauważysz, że przy tworzeniu wpisu pojawia się błąd związany z brakiem zalogowanego użytkownika, przejdź na stronę stronę panelu admina http://127.0.0.1:8000/admin i zaloguj się jeszcze raz. Na pewien czas problem się rozwiąże. W rozdziale **Praca domowa: zabezpiecz swoją stronę!** - zaraz po głównym kursie - czeka na Ciebie permanentne rozwiązanie tego problemu.

![Błąd logowania użytkownika](images/post_create_error.png)

## Walidacja formularza

Teraz pokażemy Ci, jak fajne potrafią być formularze w Django. Wpis na blogu potrzebuje uzupełnionych pól `title` i `text`. W naszym modelu `Post` nie powiedzieliśmy (z wyjątkiem `published_date`), że te pola nie są wymagane, więc Django domyślnie uważa, że muszą zostać wypełnione.

Spróbuj zapisać formularz bez uzupełnionych pól `title` i `text`. Zgadnij, co się stanie?

![Walidacja formularza](images/form_validation2.png)

Django dba o walidację pól w naszym formularzu, upewniając się, czy są uzupełnione poprawnie. Prawda, że niesamowite?

## Edycja formularza

Teraz już wiemy, jak dodać nowy formularz. Ale co w przypadku, gdy zapragniemy zmienić już istniejący? Proces jest bardzo podobny do tego, który przeszłyśmy przed chwilą. Stwórzmy szybko kilka ważnych rzeczy. (jeżeli masz problem ze zrozumieniem czegoś, zapytaj osobę prowadzącą kurs lub przejrzyj poprzednie rozdziały, gdyż wszystkie kroki mamy już omówione.)

Otwórz `blog/templates/blog/post_detail.html` w edytorze kodu i dodaj poniższą linijkę

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

dzięki czemu nasz szablon będzie wyglądał tak:

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
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Otwieramy plik `blog/urls.py` w edytorze kodu dodajemy wiersz:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Wykorzystamy jeszcze raz szablon `blog/templates/blog/post_edit.html`, więc ostatnią rzeczą, której nam brakuje, jest *widok*.

Otwórz `blog/views.py` w edytorze kodu i dodaj poniższy kod na samym końcu tego pliku:

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

To wygląda prawie tak samo, jak nasz widok `post_new`, nieprawdaż? Ale nie do końca. For one, we pass an extra `pk` parameter from `urls`. Dalej - pobieramy model wpisu `Post` do edycji za pomocą `get_object_or_404(Post, pk=pk)`. Gdy tworzymy formularz, przekazujemy ten wpis pod zmienną `instance` zarówno w trakcie zapisywania formularza…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…jak i zaraz po otwarciu formularza z wpisem do edycji:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

OK. Przetestujmy, jak to działa! Przejdź na stronę `post_detail`. W górnym prawym rogu powinnaś znaleźć przycisk edycji:

![Przycisk edycji](images/edit_button2.png)

Po kliknęciu w niego zobaczysz formularz z naszym wpisem:

![Edycja formularza](images/edit_form2.png)

Zmodyfikuj jego tytuł lub treść wedle uznania, a następnie zapisz zmiany!

Gratulacje! Twoja aplikacja staje się coraz bardziej kompletna!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Bezpieczeństwo

Super, że możemy tworzyć posty klikając w link! Jest niestety jeden problem - aktualnie każdy, kto odwiedzi Twoją stronę, może stworzyć nowy post. Zróbmy tak, aby przycisk był widoczny tylko dla Ciebie i nikogo innego.

Otwórzmy `blog/templates/blog/base.html` w edytorze kodu, znajdźmy nasz `page-header` `div` i zalinkujmy tag, który umieściłyśmy tam wcześniej. Powinien wyglądać tak:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Dodamy kolejny tag `{% if %}`, który sprawi, że link będzie widoczny tylko dla użytkowników zalogowanych jako admin. W tej grupie na razie jesteś tylko Ty! Zmień `<a>` tag, by wyglądał w ten sposób:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Ten `{% if %}` spowoduje, że link zostanie wysłany do przeglądarki tylko wtedy, kiedy użytkownik chcący wyświetlić tę stronę jest zalogowany. To nie chroni tworzenia wpisów w 100%, ale jest to dobry pierwszy krok. Zagadnieniu bezpieczeństwa poświęcimy więcej miejsca w rozszerzeniu do tego kursu.

Pamiętasz ikonkę edycji, która przed chwilą dodałyśmy do naszej strony szczegółów? Chcemy też dodać tę samą zmianę tutaj tak, by inne osoby nie były w stanie edytować istniejących postów.

Otwórzmy `blog/templates/blog/post_detail.html` w edytorze kodu i dodajmy poniższą linijkę:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Zamień ją na:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Ponieważ jesteś najprawdopodobniej zalogowana, jeżeli odświeżysz stronę, nie zobaczysz żadnej zmiany. Podejrzyj stronę w innej przeglądarce lub chociaż w trybie incognito (nazywanym "InPrivate" w Windows Edge) i zobaczysz, że ten link i ikonka się nie pojawiają!

## Jeszcze jedno: czas na wdrożenie!

Dobrze byłoby wiedzieć, że nasza witryna nadal działa na PythonAnywhere, prawda?

* Po pierwsze zapiszmy nasze zmiany i wyślijmy je na GitHuba:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Potem, w konsoli [PythonAnywhere Bash](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Pamiętaj by podmienić `<your-pythonanywhere-domain>` na Twoją właściwą nazwę użytkownika PythonAnywhere, bez nawiasów ostrokątnych).

* Nareszcie przeskakujemy do do ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (użyj przycisku menu w prawym górnym rogu konsoli) i naciśnij **Reload**. Odśwież swój blog https://yourname.pythonanywhere.com, aby zobaczyć zmiany.

I to już wszystko! Gratulacje :)