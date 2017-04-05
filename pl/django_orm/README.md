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
    <QuerySet [<Post: Mój pierwszy wpis>, <Post: Kolejny tytuł wpisu>]>
    

Pojawiła się lista wpisów, które dodałyśmy wcześniej! Utworzyłyśmy je przy pomocy panelu administracyjnego Django. Teraz jednak chciałybyśmy dodać nowy wpis używając Pythona. Jak to zrobimy?

### Tworzenie obiektu

W taki sposób tworzymy nowy obiekt Post w bazie danych:

    >>> Post.objects.create(author=me, title='Przykładowy tytuł', text='Test')
    

Ale brakuje nam jednego składnika: `me`. Musimy przekazać instancję modelu `User` jako autora. Jak to zrobić?

Najpierw zaimportujmy model User:

    >>> from django.contrib.auth.models import User
    

Jakich użytkowników mamy w bazie danych? Spróbuj tak:

    >>> User.objects.all()
    <QuerySet [<User: ola>]>
    

To konto administratora, które stworzyłyśmy wcześniej! Teraz uzyskajmy dostęp do naszej instancji użytkownika:

    me = User.objects.get(username='ola')
    

Jak widzisz, za pomocą polecenia `get` pobrałyśmy z bazy obiekt użytkownika (`User`) z właściwością `username` o wartości 'ola'. Elegancko! Oczywiście musisz wprowadzić tam swoją nazwę użytkownika.

Teraz możemy wreszcie stworzyć nasz post:

    >>> Post.objects.create(author=me, title='Przykładowy tytuł', text='Test')
    

Hura! Chciałabyś sprawdzić, czy się udało?

    >>> Post.objects.all()
    <QuerySet [<Post: Mój pierwszy wpis>, <Post: Kolejny tytuł wpisu>, <Post: Przykładowy tytuł>]>
    

Jest! Kolejny post na liście!

### Dodajemy więcej wpisów

Możesz teraz się pobawić i utworzyć więcej wpisów, żeby zobaczyć, jak to działa. Dodaj jeszcze 2-3 i jedziemy do następnej części.

### Filtrowanie obiektów

Niezmiernie istotną cechą QuerySetów jest możliwość ich filtrowania. Dajmy na to, że chciałybyśmy znaleźć wszystkie wpisy dodane przez użytkowniczkę (User) o nazwie ola. Skorzystamy z metody `filter` zamiast `all` w `Post.objects.all()`. W nawiasach wpiszemy jeden lub więcej warunków, które muszą zostać spełnione, żeby nasz wpis znalazł się w QuerySecie. W naszej sytuacji chcemy, by `author` (autor) odpowiadał zmiennej `me`. W Django zapisujemy to tak: `author=me`. Teraz nasz kawałek kodu wygląda mniej więcej tak:

    >>> Post.objects.filter(author=me)
    <QuerySet [<Post: Mój pierwszy wpis>, <Post: Kolejny tytuł wpisu>, <Post: Przykładowy tytuł>, <Post: Wpis numer 2>, <Post: Mój trzeci post!>, <Post: Czwarty tytuł>]>
    

A gdybyśmy chciały wyświetlić wszystkie wpisy zawierające słowo 'title' w polu `tytuł`?

    >>> Post.objects.filter(title__contains = 'tytuł')
    <QuerySet [<Post: Kolejny tytuł wpisu>, <Post: Przykładowy tytuł>, <Post: Czwarty tytuł>]>
    

> **Uwaga:** Pomiędzy `title` a `contains` znajdują się dwa znaki podkreślenia (`_`). ORM w Django używa takiej składni, aby oddzielić nazwy pól ("title") od operacji lub filtrów ("contains"). Jeśli użyjesz tylko jednego, zobaczysz błąd o treści "FieldError: Cannot resolve keyword title_contains".

Możemy także wyświetlić listę wszystkich opublikowanych wpisów. W tym celu odfiltrujmy wszystkie wpisy, które mają ustawioną datę publikacji (`published_date`) na taką, która już minęła:

    >>> from django.utils import timezone
    >>> Post.objects.filter(published_date__lte=timezone.now())
    []

>(filtr `lte` oznacza `less than or equal`, czyli `mniejszy od lub równy` - co w naszym przykładzie można rozumieć jako 'z datą publikacji dzisiejszą lub wcześniejszą /mniejszą od dzisiejszej/). Obiekt `timezone.now()` oznacza właśnie aktualną datę i godzinę. 

Niestety, żaden z naszych wpisów, które dodaliśmy przez konsolę, nie został jeszcze opublikowany (mogą oczywiście w tym QuerySecie pojawić się wpisy dodane wcześniej w panelu admina, dla których zdefiniowałaś datę publikacji). Zmieńmy to! Zacznij od pobrania wpisu, który chcesz opublikować:

    >>> post = Post.objects.get(title="Przykładowy tytuł")
    

A następnie opublikuj go za pomocą metody `publish`!

    >>> post.publish()
    

Teraz spróbujmy jeszcze raz wyświetlić listę opublikowanych wpisów (wciśnij trzykrotnie klawisz ze strzałką do góry, a następnie zatwierdź klawiszem `Enter`):

    >>> Post.objects.filter(published_date__lte=timezone.now())
    <QuerySet [<Post: Przykładowy tytuł>]>
    

### Kolejność obiektów

QuerySety umożliwiają również porządkowanie list obiektów według określonej kolejności. Spróbujmy uporządkować je według daty utworzenia, czyli zawartości pola `created_date`:

    >>> Post.objects.all().order_by('created_date')
    <QuerySet [<Post: Mój pierwszy wpis>, <Post: Kolejny tytuł wpisu>, <Post: Przykładowy tytuł>, <Post: Wpis numer 2>, <Post: Mój trzeci post!>, <Post: Czwarty tytuł>]>
    

Możemy także odwrócić kolejność poprzez dodanie `-` na początku:

    >>> Post.objects.all().order_by('-created_date')
    <QuerySet [<Post: Czwarty tytuł>, <Post: Mój trzeci post!>, <Post: Wpis numer 2>, <Post: Przykładowy tytuł>, <Post: Kolejny tytuł wpisu>, <Post: Mój pierwszy wpis>]>
    

### Łączenie QuerySetów

Możesz też połączyć QuerySety:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

To naprawdę potężne narzędzie, które pozwala na pisanie bardzo złożonych zapytań.

Doskonale! Jesteś teraz gotowa na następną część! Zamknij konsolę poleceniem:

    >>> exit()
    $
