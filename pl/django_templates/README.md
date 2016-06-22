# Szablony Django

Pora wyświetlić jakieś dane! Django udostępnia nam do tego celu przydatny zbiór wbudowanych **znaczników szablonu** (ang. template tags).

## Co to są znaczniki szablonu?

Widzisz, w HTML nie da się używać kodu napisanego w Pythonie, ponieważ przeglądarki go nie zrozumieją. Jedyne, co rozumieją to HTML. Wiemy, że HTML jest raczej statyczny, podczas gdy Python jest znacznie bardziej dynamiczny.

Za pomocą **znaczników szablonu Django** możemy przemycić elementy Pythona w naszym kodzie HTML, dzięki czemu budowanie dynamicznym stron jest szybsze i łatwiejsze. Hura!

## Wyświetlamy szablon listy wpisów

W poprzednim rozdziale przekazaliśmy listę postów w zmiennej `posts` do naszego szablonu. Teraz wyświetlmy ją w HTML.

Aby wyświetlić zmienną w szablonie Django, używamy podwójnych nawiasów klamrowych z nazwą zmiennej w środku, w taki sposób:

```html
{{ posts }}
```

Spróbuj tak zrobić w szablonie` blog/templates/blog/post_list.html`. Zastąp wszystko od drugiego `<div>` do trzeciego `</div>` wierszem `{{ posts }}`. Zapisz plik i odśwież stronę, by zobaczyć rezultat:

![Rysunek 13.1][1]

 [1]: images/step1.png

Jak widzisz, dostaliśmy tylko tyle:

    [<Post: My second post>, <Post: My first post>]


Oznacza to tyle, że Django rozumie to jako listę obiektów. Pamiętasz z rozdziału **Wprowadzenie do Pythona**, jak możemy wyświetlić zawartość listy? Tak, za pomocą pętli for! W szablonie Django używamy ich w ten sposób:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Wypróbuj tego w swoim szablonie.

![Rysunek 13.2][2]

 [2]: images/step2.png

Działa! Ale chcemy je wyświetlić tak samo, jak statyczne wpisy, które tworzyłyśmy wcześniej w rozdziale **Wprowadzenie do HTML**. Możliwe jest łączenie znaczników szablonu z kodem HTML. Nasza sekcja `body` będzie wyglądać tak:

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}Wszystko, co zawrzesz pomiędzy `{% for %}` a `{% endfor %}` zostanie powtórzone dla każdego obiektu z listy. Odśwież swoją stronę:{% endraw %}

![Rysunek 13.3][3]

 [3]: images/step3.png

Zapewne zauważyłaś, że tym razem użyłyśmy nieco innej składni: `{{ post.title }}` i `{{ post.text }}`? W ten sposób uzyskujemy dostęp do danych zawartych w poszczególnych polach naszego modelu `Post`. Z kolei `|linebreaksbr` przepuszcza wpisy przez filtr, który zamienia znaczniki nowej linii na akapity.

## Jeszcze jedno

Dobrze byłoby sprawdzić, czy Twoja strona dalej działa w internecie, prawda? Ponownie wyślijmy kod na PythonAnywhere. Oto małe przypomnienie jak to zrobić...

*   Najpierw zapisz swój kod na Githubie

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modyfikacja szablonu, by pokazywal posty z bazy danych"
    [...]
    $ git push


*   Teraz zaloguj się ponownie na [PythonAnywhere][4] i przejdź do konsoli **Bash** (albo uruchom nową) i wpisz:

 [4]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ git pull
    [...]


*   Na koniec przejdź do podstrony [Web tab][5] i naciśnij **Reload**. Twoja aktualizacja powinna być widoczna!

 [5]: https://www.pythonanywhere.com/web_app_setup/

Gratulacje! Teraz śmiało możesz dodać nowy wpis w swoim panelu administratora Django (nie zapomnij dodać published_date!). Następnie odśwież stronę, żeby sprawdzić, czy Twój wpis się tam pojawił.

Poszło jak z płatka? Jesteśmy dumne! Odejdź na chwilkę od komputera, zasłużyłaś na przerwę. :)

![Rysunek 13.4][6]

 [6]: images/donut.png
