# Bevezetés a HTML-be

Mi az a template, kérdezhetnéd?

A template egy fájl, amit újrahasznosíthatunk, hogy különböző információkat jeleníthessünk meg egységes formában - például, egy template-et használhatsz egy levél megírásakor, ahol ugyan a levelek tartalma eltérhet, és a címzettek is különbözőek lehetnek, de a formájuk azonos.

A Django template formátumát egy nyelvvel írjuk le, amit HTML-nek hívunk (ez az a HTML, amit a **Hogy működik az Internet?** fejezetben már említettünk).

## Mi a HTML?

A HTML egy egyszerű kód, amit a böngésződ értelmez (pl.: Chrome, Firefox, vagy Safari), hogy weboldalakat jelenítsen meg a felhasználóknak.

A HTML a "HyperText Markup Language" rövidítése. A **HyperText** egy olyan szöveg, amely támogatja a hiperhivatkozásokat oldalak között. A **Markup** azt jelenti, hogy egy dokumentumot kód segítségével jelölésekkel látunk el, hogy leírjuk (ebben az esetben a böngészőnek) hogyan értelmezhető a weboldal. A HTML kód **tagekből** épül fel, amelyek mindegyike `<` jellel kezdődik, és `>` jellel végződik. Ezek a tagek reprezentálják a jelölő **elemeket**.

## Az első template-ed!

Egy template elkészítése azt jelenti, hogy létrehozunk egy template fájlt. Minden dolog egy fájl, igaz? Valószínűleg már te is észrevetted ezt.

A template-eket a `blog/templates/blog` mappába mentjük. Először hozd létre a `templates` könyvtárat a blog mappában. Ezután hozz létre egy `blog` mappát a templates mappádban:

    blog
    └───templates
        └───blog
    

(Meglepő lehet, hogy miért van szükség két `blog` nevű mappára - később majd rájössz, hogy ez egy hasznos elnevezési konvenció, ami megkönnyíti az életedet, amikor a dolgok bonyolulttá válnak.)

Ezután hozd létre a `post_list.html` fájlt (egyelőre hagyd üresen) a `blog/templates/blog` mappában.

Nézd meg, hogy néz ki most a weboldal: http://127.0.0.1:8000/

> Ha továbbra is a `TemplateDoesNotExists` hibát kapod, akkor próbáld újraindítani a szervert. Menj a parancssorba, állítsd meg a szervert a Ctrl+C megnyomásával (a Control és C gombot egyszerre nyomd meg), és indítsd el újra a `python manage.py runserver` paranccsal.

![11.1 ábra][1]

 [1]: images/step1.png

Nincs több hiba! Ügyes vagy :) Azonban a weboldalad csak egy üres oldalt jelenít meg, mivel a template is üres, amit készítettél. Ezt ki kell javítanunk.

Add hozzá az alábbi sorokat a template fájlodhoz:

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```    

Szóval, hogy néz ki most a weboldalad? Kattints és nézd meg: http://127.0.0.1:8000/

![11.2 ábra][2]

 [2]: images/step3.png

Működik! Szép munka :)

*   A legalapvetőbb tag a `<html>`, amely minden weboldal elejére kerül, míg a `</html>` a végén szerepel. Láthatod, hogy a weboldal tartalma a kezdő `<html>` tag, és a záró `</html>` tag közé kerül
*   A `<p>` tag a bekezdés (paragrafus) elem; `</p>` zárja a bekezdéseket

## Head és body

Minden HTML oldalt két elemre osztunk: **head** és **body**.

*   A **head** elem információkat tartalmaz a dokumentumról, amit nem jelenítünk meg a képernyőn.

*   A **body** elem tartalmaz minden mást, ami a weboldalon jelenik meg.

A `<head>` elemet használjuk arra, hogy az oldal konfigurációs beállításait megadjuk a böngészőnek, és a `<body>` elemet arra, hogy leírjuk mi jelenjen meg az oldalon.

Például a weboldal title elemét rakhatjuk a `<head>`-be:

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

![11.3 ábra][3]

 [3]: images/step4.png

Észrevetted, hogyan ismerte fel a böngésző, hogy az "Ola's blog" az oldal címe? Értelmezte a `<title>Ola's blog</title>` kódot, és a szöveget a böngésző cím mezőjébe rakta (ezt fogja használja könyvjelzőnek is, és így tovább).

Valószínűleg azt is észrevetted, hogy minden nyitó taghez tartozik egy *záró tag* egy `/` jellel, és ezek az elemek *egymásba ágyazhatóak* (azaz nem lehet bezárni egy adott taget mindaddig, míg a benne levők nincsenek lezárva).

Ez éppen olyan mintha különböző dolgokat tennénk dobozokba. Van egy nagy dobozod, a `<html></html>`; ebben benne van a `<body></body>`, és ez egy újabb kisebb dobozt tartalmaz: `<p></p>`.

Követned kell a *záró* tagekre, és az *egymásba ágyazható* elemekre vonatkozó szabályokat - ha nem teszed, a böngésző nem tudja majd értelmezni a kódodat megfelelően, és az oldalad hibásan jelenik majd meg.

## Változtasd meg a template-edet

Most szórakozásképpen próbáld módosítani a template-edet! Itt van néhány hasznos tag ehhez:

*   `<h1>A heading</h1>` - a legfontosabb címedhez
*   `<h2>A sub-heading</h2>` cím a következő szintre
*   `<h3>A sub-sub-heading</h3>` ... és így tovább, egészen `<h6>`-ig
*   `<em>text</em>` dőlt szöveghez
*   `<strong>text</strong>` a szöveg kiemeléséhez
*   `<br />` új sor kezdéséhez (nem mindenhová rakhatsz br-t)
*   `<a href="https://djangogirls.org">link</a>` létrehoz egy linket
*   `<ul><li>first item</li><li>second item</li></ul>` létrehoz egy listát, akárcsak ezt itt!
*   `<div></div>` az oldal szakaszainak megadásához

Itt a példa egy teljes template-re:

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

*   Az első `div` tartalmazza a blogunk címét - ez egy cím, és egy link
*   A másik két `div` elem a blog posztjainkat tárolja a publikálás dátumával - egy `h2` van benne a poszt címével, ami kattintható, emellett `p` bekezdések a dátumnak, és a szövegnek.

Ennek kell megjelenni:

![11.4 ábra][4]

 [4]: images/step6.png

Yaaay! A template eddig pontosan **ugyanazt az infót** jeleníti meg - viszont korábban arról volt szó, hogy egy template-tel **különböző** információkat jeleníthetünk meg **azonos formában**.

Amit igazából szeretnénk, hogy igazi posztokat jelenítünk meg, amiket a Django adminon adunk hozzá - nemsokára ezt is megnézzük.

## Még egy dolog: deploy!

Jó lenne lenne látni ezt az egészet élesben az interneten, ugye? Csináljunk egy újabb PythonAnywhere deploy-t:

### Commit, és push a Github-ra

Először nézzük meg, hogy milyen fájlok változtak a legutóbbi deploy óta (futtasd az alábbi parancsot a gépeden, ne PythonAnywhere-en):

    $ git status
    

A `djangogirls` mappában kell lenned, és a `git`-tel add hozzá az összes változtatást a könyvtáradon belül:

    $ git add --all .
    

> **Megjegytés** `-A` (az "all" rövidítése) azt jelenti, hogy a `git` felismeri, ha fájlokat törölsz (alapból csak az új, és módosított fájlokat ismeri fel). Korábban már volt róla szó (a 3. fejezetben), hogy a `.` az aktuális mappát jelenti.

Mielőtt továbbmegyünk ellenőrizzük, hogy a `git` mit szeretne feltölteni (zölddel jelennek meg azok a fájlok, amiket a `git` fel akar tölteni):

    $ git status
    

Már majdnem készen is vagyunk, de előtte el kell mentenünk a változtatásokat az előzményekbe. Egy "commit message"-et adunk meg, ahol leírjuk, hogy mit változtattunk. Akármit beírhatsz, de később hasznos lehet, ha valami olyat adsz meg, ami segít beazonosítani, hogy mit csináltál.

    $ git commit -m "Changed the HTML for the site."
    

> **Megjegyzés** Győződj meg róla, hogy idézőjelet használsz a commit üzenetnél.

Miután ezzel megvagy, töltsd fel (push) a változtatásaidat Github-ra:

    $ git push
    

### Pullold az új kódot PythonAnywhere-re, és frissítsd az oldalt

*   Nyisd meg a [PythonAnywhere konzol oldalát][5] és menj a **Bash console**-odra (vagy indíts egy újat). Aztán futtasd ezt:

 [5]: https://www.pythonanywhere.com/consoles/

    $ cd ~/my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
    

A fájljaid már itt is vannak. Ha le akarod csekkolni, akkor menj át a **Files tab**-ra és nézd meg a kódodat PythonAnywhere-en.

*   Végül, kattints át a [Web tab][6]-ra, és nyomj egy **Reload**-ot a web alkalmazásodra.

 [6]: https://www.pythonanywhere.com/web_app_setup/

A frissítéseid kint vannak! Frissítsd az weboldalt a böngésződben, és a változtatások már látni fogod :)