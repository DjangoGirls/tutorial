# ORM i obiekty QuerySet w Django

Z tego rozdziału dowiesz się, w jaki sposób Django łączy się z bazą danych i gromadzi w niej informacje. Do dzieła!

## Czym jest QuerySet?

Najprościej mówiąc, QuerySet jest listą obiektów danego Modelu. Za jego pomocą możesz odczytywać informacje z bazy danych, jak również je filtrować i układać w określonej kolejności.

Najłatwiej uczyć się na przykładach. To co, spróbujemy?

## Konsola Django

Otwórz swoją lokalną konsolę Django (nie na PythonAnywhere) i wpisz następujące polecenie:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Efekt powinien wyglądać tak:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Jesteś teraz w intrektywnej konsoli Django. Przypomina ona nieco wiersz poleceń Pythona, z odrobiną dodatkowej magii Django. :) Oczywiście możesz także używać w niej wszystkich poleceń Pythona.

### Wszystkie obiekty

Na początek spróbujmy wyświetlić wszystkie nasze wpisy. Zrób to następującym poleceniem:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ups! Wyskoczył błąd. Mówi on nam, że nie istnieje coś takiego jak 'Post'. Oczywiście -- zapomniałyśmy go wcześniej zaimportować!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

Importujemy model `Post` z `blog.models`. Spróbujmy jeszcze raz wyświetlić wszystkie wpisy:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Pojawiła się lista wpisów, które dodałyśmy wcześniej! Utworzyłyśmy je przy pomocy panelu administracyjnego Django. Teraz jednak chciałybyśmy dodać nowy wpis używając Pythona. Jak to zrobimy?

### Tworzenie obiektu

W taki sposób tworzymy nowy obiekt Post w bazie danych:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

Ale brakuje nam jednego składnika: `me`. Musimy przekazać instancję modelu `User` jako autora. Jak to zrobić?

Najpierw zaimportujmy model User:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Jakich użytkowników mamy w bazie danych? Spróbuj tak:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

To konto administratora, które stworzyłyśmy wcześniej! Teraz uzyskajmy dostęp do naszej instancji użytkownika:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

Jak widzisz, za pomocą polecenia `get` pobrałyśmy z bazy obiekt użytkownika (`User`) z właściwością `username` o wartości 'ola'. Elegancko! Oczywiście musisz wprowadzić tam swoją nazwę użytkownika.

Teraz możemy wreszcie stworzyć nasz post:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

Hura! Chciałabyś sprawdzić, czy się udało?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

Jest! Kolejny post na liście!

### Dodajemy więcej wpisów

Możesz teraz trochę się zabawić i dodać więcej postów, aby zobaczyć, jak to działa. Dodaj dwa lub trzy kolejne, a następnie przejdź do następnej części.

### Filtrowanie obiektów

Niezmiernie istotną cechą QuerySetów jest możliwość ich filtrowania. Dajmy na to, że chciałybyśmy znaleźć wszystkie wpisy dodane przez użytkowniczkę (User) o nazwie ola. Skorzystamy z metody `filter` zamiast `all` w `Post.objects.all()`. W nawiasach podajemy, jaki warunek bądź warunki muszą spełniać posty na blogu, aby znaleźć się w naszym zapytaniu. W naszej sytuacji chcemy, by `author` (autor) odpowiadał zmiennej `me`. W Django zapisujemy to tak: `author=me`. Teraz nasz kawałek kodu wygląda mniej-więcej tak:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

A może chcemy zobaczyć wszystkie posty, które zawierają słowo "tytuł" w polu `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Uwaga:** Pomiędzy `title` a `contains` znajdują się dwa znaki podkreślenia (`_`). ORM w Django używa takiej składni, aby oddzielić nazwy pól ("title") od operacji lub filtrów ("contains"). Jeśli użyjesz tylko jednego, zobaczysz błąd o treści "FieldError: Cannot resolve keyword title_contains".

Możemy także wyświetlić listę wszystkich opublikowanych wpisów. W tym celu odfiltrujmy wszystkie wpisy, które mają ustawioną datę publikacji (`published_date`) na taką, która już minęła:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Niestety, post dodany przez nas z konsoli Pythona nie został jeszcze opublikowany. Ale możemy to zmienić! Zacznij od pobrania wpisu, który chcesz opublikować:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

A następnie opublikuj go za pomocą metody `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Teraz spróbujmy jeszcze raz wyświetlić listę opublikowanych wpisów (wciśnij trzykrotnie klawisz ze strzałką do góry, a następnie zatwierdź klawiszem `Enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Kolejność obiektów

QuerySety umożliwiają również porządkowanie list obiektów według określonej kolejności. Spróbujmy uporządkować je według daty utworzenia, czyli zawartości pola `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Możemy także odwrócić kolejność poprzez dodanie `-` na początku:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Łączenie QuerySetów

Możesz też połączyć QuerySety:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

To naprawdę potężne narzędzie, które pozwala na pisanie bardzo złożonych zapytań.

Doskonale! Jesteś teraz gotowa na następną część! Zamknij konsolę poleceniem:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```