# Szablony Django

Pora wyświetlić jakieś dane! Django udostępnia nam do tego celu przydatny zbiór wbudowanych **znaczników szablonu** (ang. template tags).

## Co to są znaczniki szablonu?

W HTML-u nie można tak naprawdę napisać kodu Pythona, ponieważ przeglądarki go nie rozumieją. Znają tylko HTML. Wiemy, że HTML jest raczej statyczny, a Python jest znacznie bardziej dynamiczny.

**Znaczniki szablonów Django** pozwalają przesyłać obiekty podobne do Pythona do HTML, dzięki czemu możesz budować dynamiczne strony internetowe szybciej. Super!

## Wyświetlamy szablon listy wpisów

W poprzednim rozdziale przekazaliśmy listę postów w zmiennej `posts` do naszego szablonu. Teraz wyświetlmy ją w HTML.

Aby wyświetlić zmienną w szablonie Django, używamy podwójnych nawiasów klamrowych z nazwą zmiennej w środku, w taki sposób:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Spróbuj tak zrobić w szablonie` blog/templates/blog/post_list.html`. Otwórz to w edytorze kodu i zastąp wszystko od drugiego `<div>` do trzeciego `</div>` wierszem `{{ posts }}`. Zapisz plik i odśwież stronę, by zobaczyć rezultat:

![Rysunek 13.1](images/step1.png)

Jak widzisz, dostaliśmy tylko tyle:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

Oznacza to tyle, że Django rozumie to jako listę obiektów. Pamiętasz z rozdziału **Wprowadzenie do Pythona**, jak możemy wyświetlić zawartość listy? Tak, za pomocą pętli for! W szablonie Django używamy ich w ten sposób:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Wypróbuj tego w swoim szablonie.

![Rysunek 13.2](images/step2.png)

Działa! Ale chcemy, aby posty były wyświetlane jak statyczne posty, które stworzyliśmy wcześniej w rozdziale ** Wprowadzenie do HTMLa**. Możliwe jest łączenie znaczników szablonu z kodem HTML. Nasza sekcja `body` będzie wyglądać tak:

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

{% raw %}Wszystko, co zawrzesz pomiędzy `{% for %}` a `{% endfor %}` zostanie powtórzone dla każdego obiektu z listy. Odśwież swoją stronę:{% endraw %}

![Rysunek 13.3](images/step3.png)

Zapewne zauważyłaś, że tym razem użyłyśmy nieco innej składni: (`{{ post.title }}` lub `{{ post.text }}`)? W ten sposób uzyskujemy dostęp do danych zawartych w poszczególnych polach naszego modelu `Post`. Z kolei `|linebreaksbr` przepuszcza wpisy przez filtr, który zamienia znaczniki nowej linii na akapity.

## Jeszcze jedno

Dobrze byłoby sprawdzić, czy twoja strona wciąż będzie działała w publicznym Internecie, prawda? Spróbujmy ponownie wdrożyć w PythonAnywhere. Oto podsumowanie kroków…

* Najpierw zapisz swój kod na GitHubie

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* Teraz zaloguj się ponownie na [PythonAnywhere](https://www.pythonanywhere.com/consoles/) i przejdź do konsoli **Bash** (albo uruchom nową) i wpisz:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(pamiętaj, by podmienić `<your-pythonanywhere-domain>` na Twoją właściwą nazwę użytkownika PythonAnywhere, bez ostrych nawiasów)

* Na koniec przeskocz do strony [Web](https://www.pythonanywhere.com/web_app_setup/) i naciśnij **Reload**. Aby dotrzeć do innych stron PythonAnywhere przez konsolę, użyj przycisku menu w prawym górnym rogu. Twoja zaktualizowana aplikacja powinna być już dostępna pod adresem https://subdomain.pythonanywhere.com - sprawdź to w swojej przeglądarce! Jeśli posty na blogu w witrynie PythonAnywhere nie są takie same jak posty znajdujące się na lokalnym serwerze, jest to OK. Bazy danych na komputerze lokalnym i PythonAnywhere nie synchronizują się z resztą plików.

Gratulacje! Teraz śmiało, spróbuj dodać nowy post w panelu administracyjnym Django (pamiętaj, aby dodać datę publikacji (published_date)). Upewnij się, że jesteś w zalogowana jako administrator w Django dla Twojej witryny PythonAnywhere, https://subdomain.pythonanywhere.com/admin. Następnie odśwież stronę, aby zobaczyć, czy post się pojawił.

Poszło jak z płatka? Jesteśmy dumne! Odejdź na chwilkę od komputera - zasłużyłaś na przerwę! :)

![Rysunek 13.4](images/donut.png)