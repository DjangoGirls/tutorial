# ORM i obiekty QuerySet w Django

Z tego rozdziału dowiesz się, w jaki sposób Django łączy się z bazą danych i gromadzi w niej informacje. Do dzieła!

## Czym jest QuerySet?

Najprościej mówiąc, QuerySet jest listą obiektów danego modelu. Za jego pomocą możesz wczytywać informacje z bazy danych, jak również je filtrować i układać w określonej kolejności.

Najłatwiej uczyć się na przykładach. To co, spróbujemy?

## Konsola Django

Otwórz swoją lokalną konsolę Django (nie na PythonAnywhere) i wpisz następujące polecenie:

    (myvenv) ~/djangogirls$ python manage.py shell
    

Efekt powinien wyglądać tak:

    (InteractiveConsole)
    >>>
    

Jesteś teraz w intrektywnej konsoli Django. Przypomina ona nieco wiersz poleceń Pythona, z odrobiną dodatkowej magii Django :) Oczywiście możesz także używać w niej wszystkich poleceń Pythona.

### Wszystkie obiekty

Na początek spróbujmy wyświetlić wszystkie nasze wpisy. Zrób to następującym poleceniem:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined
    

Ups! Wyskoczył błąd. Mówi on nam, że nie istnieje coś takiego jak 'Post'. Oczywiście -- zapomniałyśmy go wcześniej zaimportować!

    >>> from blog.models import Post
    

Nic skomplikowanego: importujemy model `Post` z `blog.models`. Spróbujmy jeszcze raz wyświetlić wszystkie wpisy:

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>]
    

Pojawiła się lista wpisów, które dodałyśmy wcześniej! Utworzyłyśmy je przy pomocy panelu administracyjnego Django. Teraz jednak chciałybyśmy dodać nowy wpis używając Pythona. Jak to zrobimy?

### Tworzenie obiektu

W taki sposób tworzymy nowy obiekt Post w bazie danych:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Ale brakuje nam jednego składnika: `me`. Musimy przekazać instancję modelu `User` jako autora. Jak to zrobić?

Najpierw zaimportujmy model User:

    >>> from django.contrib.auth.models import User
    

Jakich użytkowników mamy w bazie danych? Spróbuj tak:

    >>> User.objects.all()
    [<User: ola>]
    

To konto administratora, które stworzyłyśmy wcześniej! Teraz uzyskajmy dostęp do naszej instancji użytkownika:

    me = User.objects.get(username='ola')
    

Jak widzisz, za pomocą polecenia `get` pobrałyśmy z bazy obiekt użytkownika (`User`) z właściwością `username` o wartości 'ola'. Elegancko! Oczywiście musisz wprowadzić tam swoją nazwę użytkownika.

Teraz możemy wreszcie stworzyć nasz post:

    >>> Post.objects.create(author=me, title='Sample title', text='Test')
    

Hura! Chciałabyś sprawdzić, czy się udało?

    >>> Post.objects.all()
    [<Post: my post title>, <Post: another post title>, <Post: Sample title>]
    

Jest! Kolejny post na liście!

### Dodajemy więcej wpisów

Możesz teraz się pobawić i utworzyć więcej wpisów, żeby zobaczyć, jak to działa. Dodaj jeszcze 2-3 i jedziemy do następnej cześci.

### Filtrowanie obiektów

Niezmiernie istotną cechą QuerySetów jest możliwość ich filtrowania. Dajmy na to, że chciałybyśmy znaleźć wszystkie wpisy dodane przez użytkowniczkę (User) o nazwie ola. Skorzystamy z metody `filter` zamiast `all` w `Post.objects.all()`. W nawiasach wpiszemy jeden lub więcej warunków, które muszą zostać spełnione, żeby nasz wpis znalazł się w QuerySecie. W naszej sytuacji chcemy, by `author` (autor) odpowiadał zmiennej `me`. W Django zapisujemy to tak: `author=me`. Teraz nasz kawałek kodu wygląda mniej-więcej tak:

    >>> Post.objects.filter(author=me)
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

A gdybyśmy chciały wyświetlić wszystkie wpisy zawierające słowo 'title' w polu `title`?

    >>> Post.objects.filter(title__contains = 'title')
    [<Post: Sample title>, <Post: 4th title of post>]
    

> **Uwaga:** Pomiędzy `title` a `contains` znajdują się dwa znaki podkreślenia (`_`). ORM w Django używa takiej składni, aby oddzielić nazwy pól ("title") od operacji lub filtrów ("contains"). Jeśli użyjesz tylko jednego, zobaczysz błąd o treści "FieldError: Cannot resolve keyword title_contains".

Możemy także wyświetlić listę wszystkich opublikowanych wpisów. W tym celu odfiltrujmy wszystkie wpisy, które mają ustawioną datę publikacji (`published_date`) na taką, która już minęła:

> > > from django.utils import timezone Post.objects.filter(published_date__lte=timezone.now()) []

Niestety, żaden z naszych wpisów, które dodaliśmy przez konsolę, nie został jeszcze opublikowany. Zmieńmy to! Zacznij od pobrania wpisu, który chcesz opublikować:

    >>> post = Post.objects.get(title="Sample title")
    

A następnie opublikuj go za pomocą metody `publish`!

    >>> post.publish()
    

Teraz spróbujmy jeszcze raz wyświetlić listę opublikowanych wpisów (wciśnij trzykrotnie klawisz ze strzałką do góry, a następnie zatwierdź klawiszem `enter`):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    [<Post: Sample title>]
    

### Kolejność obiektów

QuerySety umożliwiają również porządkowanie list obiektów według określonej kolejności. Spróbujmy uporządkować je według daty utworzenia, czyli zawartości pola `created_date`:

    >>> Post.objects.all().order_by('created_date')
    [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
    

Możemy także odwrócić kolejność poprzez dodanie `-` na początku:

    >>> Post.objects.all().order_by('-created_date')
    [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
    

### Łączenie QuerySetów

Możesz też połączyć QuerySety:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

To naprawdę potężne narzędzie, które pozwala na pisanie bardzo złożonych zapytań.

Doskonale! Jesteś teraz gotowa na następną część! Zamknij konsolę poleceniem:

    >>> exit()
    $