# Bevezetés a HTML-be

Mi az a template, kérdezhetnéd?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Mi a HTML?

HTML is a simple code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

A HTML a "HyperText Markup Language" rövidítése. A **HyperText** egy olyan szöveg, amely támogatja a hiperhivatkozásokat oldalak között. A **Markup** azt jelenti, hogy egy dokumentumot kód segítségével jelölésekkel látunk el, hogy leírjuk (ebben az esetben a böngészőnek) hogyan értelmezhető a weboldal. A HTML kód **tagekből** épül fel, amelyek mindegyike `<` jellel kezdődik, és `>` jellel végződik. These tags represent markup **elements**.

## Az első template-ed!

Egy template elkészítése azt jelenti, hogy létrehozunk egy template fájlt. Minden dolog egy fájl, igaz? Valószínűleg már te is észrevetted ezt.

A template-eket a `blog/templates/blog` mappába mentjük. Először hozd létre a `templates` könyvtárat a blog mappában. Ezután hozz létre egy `blog` mappát a templates mappádban:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

Ezután hozd létre a `post_list.html` fájlt (egyelőre hagyd üresen) a `blog/templates/blog` mappában.

Nézd meg, hogy néz ki most a weboldal: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![11.1 ábra](images/step1.png)

Nincs több hiba! Ügyes vagy :) Azonban a weboldalad csak egy üres oldalt jelenít meg, mivel a template is üres, amit készítettél. Ezt ki kell javítanunk.

Add hozzá az alábbi sorokat a template fájlodhoz:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![11.2 ábra](images/step3.png)

Működik! Szép munka :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Láthatod, hogy a weboldal tartalma a kezdő `<html>` tag, és a záró `</html>` tag közé kerül
* A `<p>` tag a bekezdés (paragrafus) elem; `</p>` zárja a bekezdéseket

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* A **head** elem információkat tartalmaz a dokumentumról, amit nem jelenítünk meg a képernyőn.

* A **body** elem tartalmaz minden mást, ami a weboldalon jelenik meg.

A `<head>` elemet használjuk arra, hogy az oldal konfigurációs beállításait megadjuk a böngészőnek, és a `<body>` elemet arra, hogy leírjuk mi jelenjen meg az oldalon.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Mentsd el a fájlt, és frissítsd az oldalt.

![11.3 ábra](images/step4.png)

Észrevetted, hogyan ismerte fel a böngésző, hogy az "Ola's blog" az oldal címe? Értelmezte a `<title>Ola's blog</title>` kódot, és a szöveget a böngésző cím mezőjébe rakta (ezt fogja használja könyvjelzőnek is, és így tovább).

Valószínűleg azt is észrevetted, hogy minden nyitó taghez tartozik egy *záró tag* egy `/` jellel, és ezek az elemek *egymásba ágyazhatóak* (azaz nem lehet bezárni egy adott taget mindaddig, míg a benne levők nincsenek lezárva).

Ez éppen olyan mintha különböző dolgokat tennénk dobozokba. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Változtasd meg a template-edet

Most szórakozásképpen próbáld módosítani a template-edet! Itt van néhány hasznos tag ehhez:

* `<h1>A heading</h1>` for your most important heading
* `<h2>A sub-heading</h2>` cím a következő szintre
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` dőlt szöveghez
* `<strong>text</strong>` a szöveg kiemeléséhez
* `<br />` új sor kezdéséhez (nem mindenhová rakhatsz br-t)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>first item</li><li>second item</li></ul>` létrehoz egy listát, akárcsak ezt itt!
* `<div></div>` az oldal szakaszainak megadásához

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Három `div` elemet hoztunk létre.

* The first `div` element contains the title of our blog – it's a heading and a link
* A másik két `div` elem a blog posztjainkat tárolja a publikálás dátumával - egy `h2` van benne a poszt címével, ami kattintható, emellett `p` bekezdések a dátumnak, és a szövegnek.

Ennek kell megjelenni:

![11.4 ábra](images/step6.png)

Yaaay! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Még egy dolog: deploy!

Jó lenne lenne látni ezt az egészet élesben az interneten, ugye? Csináljunk egy újabb PythonAnywhere deploy-t:

### Commit, és push a Github-ra

Először nézzük meg, hogy milyen fájlok változtak a legutóbbi deploy óta (futtasd az alábbi parancsot a gépeden, ne PythonAnywhere-en):

{% filename %}command-line{% endfilename %}

    $ git status
    

A `djangogirls` mappában kell lenned, és a `git`-tel add hozzá az összes változtatást a könyvtáradon belül:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Korábban már volt róla szó (a 3. fejezetben), hogy a `.` az aktuális mappát jelenti.

Mielőtt továbbmegyünk ellenőrizzük, hogy a `git` mit szeretne feltölteni (zölddel jelennek meg azok a fájlok, amiket a `git` fel akar tölteni):

{% filename %}command-line{% endfilename %}

    $ git status
    

Már majdnem készen is vagyunk, de előtte el kell mentenünk a változtatásokat az előzményekbe. Egy "commit message"-et adunk meg, ahol leírjuk, hogy mit változtattunk. Akármit beírhatsz, de később hasznos lehet, ha valami olyat adsz meg, ami segít beazonosítani, hogy mit csináltál.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Megjegyzés** Győződj meg róla, hogy idézőjelet használsz a commit üzenetnél.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pullold az új kódot PythonAnywhere-re, és frissítsd az oldalt

* Nyisd meg a [PythonAnywhere konzol oldalát](https://www.pythonanywhere.com/consoles/) és menj a **Bash console**-odra (vagy indíts egy újat). Aztán futtasd ezt:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

A fájljaid már itt is vannak. Ha le akarod csekkolni, akkor menj át a **Files tab**-ra és nézd meg a kódodat PythonAnywhere-en.

* Végül, kattints át a [Web tab](https://www.pythonanywhere.com/web_app_setup/)-ra, és nyomj egy **Reload**-ot a web alkalmazásodra.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)