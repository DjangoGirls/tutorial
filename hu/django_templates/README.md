# Django sablonok (template)

Itt az idő, hogy megjelenítsünk pár adatot! Ehhez Django felkínál nekünk pár beépített **template tag**-et számunkra.

## Mik a template tag-ek?

Mint látod, a HTML-ben nem tudsz Python kódot írni, mivel a böngészők nem értik, csak a HTML-t. Fontos tudni, hogy a HTML inkább statikus, míg Python inkább dinamikus.

A **Django template tag-ek** lehetővé teszik, hogy Python-szerű dolgokat írjunk a HTML-be, ezáltal gyorsabban és könnyebben tudsz dinamikus weboldalt készíteni. Éljen!

## Template a bejegyzések listájához

Az előző fejezetben hozzáadtuk a template-hez a bejegyzéseink listáját a `post` változóban. Most meg fogjuk ezt jeleníteni a HTML-ben.

Ahhoz, hogy kiírjunk egy változót a Django template-ben, dupla kapcsos zárójelet használunk, benne a változó nevével, mint itt:

```html
{{ posts }}
```    

Próbáld ki a `blog/templates/blog/post_list.html` template-ben. Cserélj ki mindent a második `<div>` -től a harmadikig a következővel: `{{ posts }}`. Mentsd el a fájlt és frissítsd az oldalt, hogy lásd az eredményt:

![13.1 ábra][1]

 [1]: images/step1.png

Ahogy látod, ez minden, amink van:

    [<Post: My second post>, <Post: My first post>]
    

Ez azt jelenti, hogy a Django objektumok listájaként értelmezi. Emlékszel a **Bevezetés a Python-ba** című fejezetből, hogy hogyan jelenítünk meg listákat? Igen, for loop-okkal! Egy Django template-ben ezt így tudod megtenni:

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```   

Próbáld ki a template-edben.

![13.2 ábra][2]

 [2]: images/step2.png

És működik! De azt akarjuk, hogy úgy jelenjen meg, mint a statikus bejegyzések, amit korábban készítettünk el a **Bevezetés a HTML-be** című fejezetben. A HTML-t és a template tageket használhatod együtt. A `body` így fog kinézni:

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

{% raw %} Minden, amit a `{% for %}` és `{% endfor %}` közé írsz, a lista minden egyes elemére meg fog ismétlődni. Frissítsd az oldalt:{% endraw %}

![13.3 ábra][3]

 [3]: images/step3.png

Észrevetted, hogy most egy kicsit más megjelölést használtunk: `{{ post.title }}`? Az adatokat a `Post` modelben meghatározott mezők szerint érjük el. Emellett `|linebreaks` kíséri a szöveget, ezáltal egy filteren keresztül új bekezdéssé alakítja az új sorokat.

## Még valami

Jó lenne látni, hogy a weblapod még mindig működik az Interneten, nem igaz? Telepítsük újra a PythonAnywhere-en. Itt a lépések összefoglalója...

*   Először tedd fel a kódot a Github-ra
```
$ git status
[...]
$ git add --all .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
```    

*   Ezután a [PythonAnywhere][4]-en menj a **Bash console**-ba (vagy indíts újat), és futtasd le:

 [4]: https://www.pythonanywhere.com/consoles/

```
$ cd my-first-blog
$ git pull
[...]
```

*   Végül, a [Web][5] menüpontban klikkelj a **Reload**-ra. A frissítések ott vannak!

 [5]: https://www.pythonanywhere.com/web_app_setup/

Gratulálunk! Folytatásképp hozz létre új bejegyzéseket a Django adminban (ne felejts el published_date-t hozzáadni), majd frissítsd az oldalt, hogy lásd, megjelentek-e.

Olyan, mint a varázslat? Büszkék vagyunk Rád! Hagy ott egy kicsit a gépet, megérdemelsz egy kis szünetet. :)

![13.4 ábra][6]

 [6]: images/donut.png