# Szablony Django

Pora wyświetlić jakieś dane! Django udostępnia nam do tego celu przydatny zbiór wbudowanych **znaczników szablonu**.

## Co to są znaczniki szablonu?

Widzisz, w HTML nie da się używać kodu w Pythonie, ponieważ przeglądarki go nie zrozumieją. Jedyne, co rozumieją przeglądarki, to HTML. Wiemy, że HTML jest raczej statyczny, podczas gdy Python jest znacznie bardziej dynamiczny.

Za pomocą **znaczników szablonu Django** możemy przemycić elementy Pythona w naszym kodzie HTML, dzięki czemu budowanie dynamicznym stron jest szybsze i łatwiejsze. Hura!

## Wyświetlamy szablon listy wpisów

W poprzednim rozdziale przekazaliśmy listę postów w zmiennej `posts` do naszego szablonu. Teraz wyświetlmy ją w HTML.

Aby wyświetlić zmienną w szablonie Django, używamy podwójnych nawiasów klamrowych z nazwą zmiennej w środku, w taki sposób:

```html
{{ posts }}
```

Wypróbuj tego w szablonie `blog/templates/blog/post_list.html` (zastąp wszystko wewnątrz drugiego `<div></div>` wierszem `{{ posts }}`), zapisz plik i odśwież stronę, aby zobaczyć rezultat:

![Rysunek 13.1](images/step1.png)

Jak widzisz, dostaliśmy tylko tyle:

    [<Post: My second post>, <Post: My first post>]


Oznacza to tyle, że Django rozumie to jako listę obiektów. Pamiętasz z rozdziału **Wprowadzenie do Pythona**, jak możemy wyświetlić zawartość listy? Tak, za pomocą pętli! W szablonie Django używamy ich w ten sposób:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```


Wypróbuj tego w swoim szablonie.

![Rysunek 13.2](images/step2.png)

Działa! Ale chcemy je wyświetlić tak samo, jak statyczne wpisy, które tworzyłyśmy wcześniej w rozdziale **Wprowadzenie do HTML**. Możliwe jest łączenie znaczników szablonu z kodem HTML. Nasza sekcja `body` będzie wyglądać tak:

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaks }}</p>
    </div>
{% endfor %}
```


Wszystko, co zawszesz pomiędzy `{% for %}` a `{% endfor %}` zostanie powtórzone dla każdego obiektu z listy. Odśwież stronę:

![Rysunek 13.3](images/step3.png)

Zapewne zauważyłaś, że tym razem użyłyśmy nieco innej składni: `{{ post.title }}` i `{{ post.text }}`? W ten sposób uzyskujemy dostęp do danych zawartych w poszczególnych polach naszego modelu `Post`. Z kolei `|linebreaks` przepuszcza wpisy przez filtr, który zamienia znaczniki nowej linii na akapity.

## Jeszcze jedno

Dobrze byłoby wiedzieć, że nasza witryna nadal działa na Heroku, prawda? Spróbuj ponownie wdrażania. Jeśli nie pamiętasz jak to zrobić, sprawdź na końcu rozdziału 15:

```bash
$ git status
...
$ git add -A .
$ git status
...
$ git commit -m "Dodane szablony Django"
...
$ git push heroku master
```


Gratulacje! Teraz śmiało możesz dodać nowy wpis w swoim panelu administratora Django (nie zapomnij dodać published_date!). Następnie odśwież stronę, żeby sprawdzić, czy Twój wpis się tam pojawił.

Działa jak marzenie? Jesteśmy z Ciebie dumne! Zasłużyłaś na słodką nagrodę. :)

![Rysunek 13.4](images/donut.png)
