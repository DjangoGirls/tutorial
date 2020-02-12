# CSS - upiększ to!

Nasz blog nadal wygląda dość surowo, prawda? Czas, aby to zmienić! Użyjemy do tego CSS.

## Czym jest CSS?

Kaskadowe arkusze stylów (ang. Cascading Style Sheets, CSS) to język używany do określania wyglądu i formatowania strony internetowej napisanej w języku znaczników (np. HTML). Traktuj go jak make-up dla naszej strony. ;)

Ale nie chcemy zaczynać od nowa, prawda? Raz jeszcze będziemy używać czegoś, co programiści opublikowali w Internecie za darmo. Odkrywanie Ameryki na nowo nie jest zabawne.

## Użyjmy biblioteki Bootstrap!

Bootstrap jest jednym z najpopularniejszych frameworków HTML i CSS do budowania pięknych stron: https://getbootstrap.com/

Został stworzony przez programistów, którzy pracowali dla Twittera. Obecnie jest rozwijany przez kontrybutorów z całego świata!

## Zainstaluj Bootstrapa

Aby zainstalować Bootstrap, otwórz plik `.html` w edytorze kodu i dodaj do sekcji `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Akurat to nie doda żadnych nowych plików do Twojego projektu. Te dwie linijki wskazują na pliki, które istnieją w Internecie. Sprawdź sama, otwórz swoją stronę w przeglądarce internetowej, odśwież zawartość. No i proszę!

![Rysunek 14.1](images/bootstrap1.png)

Od razu wygląda lepiej, prawda?

## Pliki statyczne w Django

Przyjrzymy się teraz bliżej temu, co nazwałyśmy **plikami statycznymi**. Pliki statyczne to wszystkie twoje arkusze styli oraz pliki z obrazkami. Ich zawartość nie zależy od kontekstu żądania i będzie taka sama dla każdego użytkownika.

### Gdzie umieścić pliki statyczne w Django?

Django wie, gdzie szukać plików statycznych dla wbudowanej aplikacji "admin". Teraz musimy jeszcze dodać jakieś pliki statyczne do naszej własnej aplikacji `blog`.

Wystarczy, że w naszej aplikacji stworzymy nowy folder i nazwiemy go `static`:

    djangogirls
    ├── blog
    |     ├── migrations
    |     ├── static
    |     └── templates
    └── mysite
    

Django automatycznie wyszuka każdy folder nazwany "static" w środku każdego folderu aplikacji. Zawartość tych katalogów będzie uznawana za pliki statyczne.

## Twój pierwszy arkusz CSS!

Stwórzmy teraz plik CSS, aby dodać nasze własne style do naszej strony WWW. Stwórz katalog o nazwie `css` w środku folderu `static`. Następnie utwórz nowy plik o nazwie `blog.css` w katalogu `css`. Gotowa?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Czas, by napisać trochę styli CSS! Otwórz `blog/static/css/blog.css` w Twoim edytorze kodu.

Nie będziemy zbytnio zagłębiać się w dostosowywanie i uczenie się o CSS w tym miejscu. Jeśli chcesz dowiedzieć się więcej, istnieje rekomendacja dotycząca darmowego kursu CSS na końcu tej strony.

Jednak nauczmy się chociaż troszkę. Może mogłybyśmy zmienić kolor naszych nagłówków? Do rozpoznawania kolorów komputery używają specjalnych kodów. Kody te zaczynają się od znaku `#`, po którym następuje 6 liter (A-F) lub cyfr (0-9). Na przykład kod dla koloru niebieskiego to `#0000FF`. Kody dla wielu kolorów możesz znaleźć na stronie: http://www.colorpicker.com/. Możesz również użyć uprzednio [zdefiniowanych kolorów](http://www.w3schools.com/colors/colors_names.asp), takich jak `red` (czerwony) czy `green ` (zielony).

Do `blog/static/css/blog.css` powinnaś dodać następujący kod:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
}

```

`h1 a` to selektor CSS. Oznacza to, że zastosujemy nasze style do każdego elementu `a` znajdującego się w elemencie `h1`; selektor `h2 a` czyni to samo dla elementów `h2`. Czyli gdy mamy coś takiego jak `<h1><a href="">link</a></h1>`, styl `h1 a`, styl zostanie użyty. W tym przypadku nadajemy mu kolor `#C25100`, czyli ciemnopomarańczowy. Możesz też tutaj wstawić swój własny kolor, ale pamiętaj, by odpowiednio kontrastował z białym tłem!

W pliku CSS ustalamy styl dla elementów znajdujących się w pliku HTML. Pierwszą metodą rozpoznawania elementu jest jego nazwa. Możesz pamiętać te tagi z rozdziału o HTML. Takie rzeczy jak `a`, `h1` i `body` to wszystko przykłady nazw elementów. Elementy rozpoznajemy również po atrybutach `class` lub `id`. Nazwę klasy lub id ustalasz sama dowolnie. Ta sama nazwa klasy może być przypisana do wielu elementów, ale id musi być unikalne dla całego kodu HTML. Dla przykładu, możesz zidentyfikować następujący tag używając nazwy tagu `a`, klasy `external_link` lub po jego id `link_to_wiki_page`:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Więcej dowiesz się o [selektorach CSS z w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

Musimy też powiedzieć naszemu szablonowi HTML, że dodałyśmy trochę styli CSS. Otwórz plik `blog/templates/blog/post_list.html` i dodaj tę linię na jego początku:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Tutaj ładujemy pliki statyczne :) Pomiędzy tagami `<head>` oraz `</head>`, po liniach linkujących do plików CSS Bootstrapa, dodaj tę linię:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Przeglądarka czyta pliki w takiej kolejności, w jakiej zostały jej podane, więc musimy się upewnić, że linię dodałyśmy w odpowiednim miejscu. Inaczej kod w naszym pliku może zostać nadpisany przez pliki Bootstrapa. Właśnie pokazaliśmy naszemu szablonowi, gdzie znajduje się nasz plik CSS.

Twój plik powinien teraz wyglądać tak:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
```

Ok, teraz zapisz plik i odśwież stronę!

![Rysunek 14.2](images/color2.png)

Super! Niezła robota. Może damy teraz naszej stronie trochę przestrzeni i zwiększymy margines po lewej stronie? Spróbujmy!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Dodaj powyższe do swoich stylów CSS, zapisz plik i zobacz, jak to zadziałało!

![Rysunek 14.3](images/margin2.png)

Może zmienimy też rodzaj czcionki w naszym nagłówku? Wklej to do sekcji `<head>` w pliku `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Tak jak wcześniej, sprawdź kolejność i umieść tę linię przed linkiem do `blog/static/css/blog/css`. Podana linia zaimportuje czcionkę pod nazwą *Lobster* z usługi Google Fonts (https://www.google.com/fonts).

Znajdź blok deklaracji dla `h1 a` (to jest kod pomiędzy nawiasami `{` i `}`) w pliku CSS `blog/static/css/blog.css`. Dodaj do niego linię `font-family: 'Lobster';` pomiędzy nawiasami, po czym odśwież stronę:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Rysunek 14.3](images/font.png)

Wspaniale!

Jak napisałyśmy powyżej, w CSS istnieje koncepcja klas. Pozwalają one nazwać część naszego kodu HTML i aplikować style tylko do tej części, omijając wpływ tych stylów na inne części. To może być super użyteczne! Może masz dwa divy, które odpowiadają za coś innego (jak nasz header lub post). Klasa pomoże nam, gdy będziemy chciały, by wyglądały one inaczej.

Śmiało! Nazwijmy kilka części Twojego kodu HTML. Dodaj klasę nazwaną `page-header` do Twojego `div` który zawiera nagłówek:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Teraz dodaj klasę `post` do Twojego `div` zawierającego post bloga:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

A teraz dodamy bloki deklaracji do selektorów. Selektory zaczynające się od `.` odnoszą się do klas. W Internecie jest wiele wspaniałych tutoriali dotyczących CSS, które pomogą Tobie zrozumieć następujący kod. Na razie skopiuj i wklej do `blog/static/css/blog.css` poniższy kod:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Teraz otocz kod HTML wyświetlający posty deklaracjami klas. Zamień to:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

w pliku `blog/templates/blog/post_list.html` na to:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Zapisz te pliki i odśwież swoją stronę.

![Rysunek 14.4](images/final.png)

Woohoo! Wygląda to niesamowicie, prawda? Sprawdź w kodzie, który przed chwilą wkleiłyśmy i poszukaj miejsc, w których dodałyśmy klasy w HTML oraz użyłyśmy ich w CSS. Gdzie dokonałabyś zmiany, gdybyś chciała, by data była w kolorze turkusowym?

Nie bój się trochę pomajstrować w CSS próbując zmienić niektóre rzeczy. Zabawa z CSS pozwoli Ci lepiej zrozumieć, co robią różne rzeczy. Niczym się nie przejmuj, jeżeli coś zepsujesz - zawsze przecież można cofnąć zmiany!

Naprawdę polecamy skorzystanie z bezpłatnych kursów online "Basic HTML & HTML5" i "Basic CSS" na [freeCodeCamp](https://learn.freecodecamp.org/). Pomoże to Tobie nauczyć się wszystkiego, czego potrzebujesz, by upiększyć twoje strony za pomocą CSS.

Gotowa na następny rozdział?! :)