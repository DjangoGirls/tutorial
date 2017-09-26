# Uvod v HTML

Kaj je predloga?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Kaj je HTML?

HTML is a simple code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML je kratica za "HyperText Markup Language". **HyperText** pomeni, da gre za vrsto besedila, ki vsebuje povezave (oziroma hiperpovezave) med (spletnimi) stranmi. **Markup** pomeni značka. V jeziku HTML namreč poznamo veliko posebnih značk (oznak), ki brskalnikom povedo, kako oblikovati besedilo, ki neki znački sledi. Vsaka značka se začne z znakom `<`, ki mu sledi ime značke in konča z znakom `>`. These tags represent markup **elements**.

## Tvoja prva predloga!

Predloga je torej zgolj HTML datoteka, ki vsebuje nekaj posebnih ukazov (značk) in besedilo.

Vse predloge bomo shranjevali v mapo `blog/templates/blog`. Za začetek moraš torej, znotraj osnovnega imenika blog, ustvariti mapo `templates`. Znotraj te naredi še mapo `blog`:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

Ustvari datoteko `post_list.html` (zaenkrat naj bo prazna) in jo shrani v `blog/templates/blog`.

Zdaj si lahko stran ogledaš na naslovu http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Figure 11.1](images/step1.png)

Napake ni več! Čestitke :) Vendar pa je naša stran zaenkrat še precej dolgočasna, saj ni na njej nič objavljenega. Zdaj je končno prišel čas, da to spremenimo.

V predlogo dodaj sledečo kodo:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

Deluje! Odlično :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Vsa preostala koda, ki jo bomo pisali, bo torej med tema dvema značkama
* `<p>` označuje začetek novega odstavka, `</p>` pa konec

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** je element, ki se ga na strani ne vidi. Kaj točno je njegov namen, bomo videli kasneje.

* **body** je element, ki vsebuje "vidni" del strani. Velik del spletne strani je zgrajen na podlagi kode, ki je znotraj tega elementa.

V elementu `<head>` brskalniku pojasnimo določene lastnosti naše spletne strani, v elementu `<body>` pa opišemo samo vsebino strani.

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

Shrani datoteko in osveži stran.

![Figure 11.3](images/step4.png)

Si opazila, kako je brskalnik uporabil element title? Besedilo `<title>Ola's blog</title>` je privzel za naslov zavihka, v katerem je odprta tvoja stran.

Kot si verjetno že opazila, vsaki znački oblike <besedilo>, sledi značka oblike `<besedilo/>`. Temu rečemo, da druga značka *zapre* prvo. Opisane pare značk lahko *gnezdimo* (to pomeni, da neke značke ne smemo zapreti, dokler niso zaprte vse značke, ki so znotraj nje).

Predstavljaj si, da imaš veliko škatel, ki jih zlagaš eno v drugo. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Spreminjanje predlog

Malce se pozabavaj in svojo predlogo poskusi spremeniti! Tukaj je par uporabnih značk:

* `<h1>A heading</h1>` for your most important heading
* `<h2>podnaslov</h2>` - za malce manj pomembne naslove
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>besedilo</em>` - za nagnjeno besedilo
* `<strong>besedilo</strong>` - za odebeljeno besedilo
* `<br />` - skok v novo vrstico (znotraj tega elementa besedila ni)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>prvi element</li><li>drugi element</li></ul>` - za seznam, takšnega kot je ta, ki ga bereš
* `<div></div>` - za definiranje novega dela spletne strani

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
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit ne mi porta gravida na eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit ne mi porta gravida na eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

V zgornji predlogi smo ustvarili tri elemente `div`.

* The first `div` element contains the title of our blog – it's a heading and a link
* Drugi dva `div`-a vsebujeta objave na blogu z datumi objave, naslovi in vsebino objav.

Naša stran zdaj zgleda takole:

![Figure 11.4](images/step6.png)

Super! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Še nekaj: objavimo stran!

Vse narejene spremembe bi si bilo dobro ogledati še na "pravi" spletni strani. Prenesimo spremenjene datoteke na PythonAnywhere:

### Nalaganje kode na Github

Za začetek poglej, katere datoteke so bile spremenjene (na tvojem računalniku, ne na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Prepričaj se, da si res v imeniku `djangogirls` in naroči `gitu`, da sporoči vse spremembe, ki so se zgodile znotraj tega imenika:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Ne pozabi (poglavje 3), da je `.` oznaka za trenutni imenik.

Preden boš datoteke naložila, preveri, katere je `git` izbral (le-te bodo zelene barve):

{% filename %}command-line{% endfilename %}

    $ git status
    

Zagotoviti moramo še, da bo git zabeležil, kakšno spremembo smo naredili. Napisati moramo torej, kaj smo naredili (commit message). Napišeš lahko načeloma karkoli, vendar je zelo priporočljivo, da je opis smiseln, saj boš kasneje na podlagi tega opisa lahko ugotovila in kdaj si naredila določeno spremembo.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Opomba:** Pri besedilo v git-u moraš vedno uporabiti dvojne narekovaje.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Nalaganje spremenjene kode na PythonAnywhere

* Na PythonAnyehere pojdi na del strani, kjer je ukazna vrstica (Bash console). Poženi:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

Koda se zdaj nalaga na strežnik. Če želiš preveriti, ali se je že naložila, pojdi na **zavihek Files**in si oglej kodo.

* Premakni se zdaj na zavihek [Web](https://www.pythonanywhere.com/web_app_setup/) in pritisni **Reload**.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)