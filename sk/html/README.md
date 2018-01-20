# Introduction to HTML

What's a template, you may ask?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Čo je HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML znamená "HyperText Markup Language". **HyperText** znamená, že sa jedná o typ textu, ktorý podporuje hypertextové odkazy medzi stránkami. **Markup** znamená, že sme vzali dokument a označili ho kódom aby sme niečomu povedali (v tomto prípade prehliadaču) ako interpretovať stránku. HTML code is built with **tags**, each one starting with `<` and ending with `>`. Tieto tagy reprezentujú značkovacie (Markup) **elementy**.

## Tvoja prvá šablóna!

Creating a template means creating a template file. Everything is a file, right? You have probably noticed this already.

Templates are saved in `blog/templates/blog` directory. So first create a directory called `templates` inside your blog directory. Potom vytvor ďalšiu zložku s názvom `blog` v zložke templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

A teraz vytvor súbor `post_list.html` (zatiaľ ho ponechaj prázdny) v zložke `blog/templates/blog`.

Pozri sa, ako momentálne vyzerá tvoja stránka: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Obrázok 11.1](images/step1.png)

Žiadne ďalšie chyby! Gratulujeme :) Avšak tvoja stránka zatiaľ neukazuje nič, okrem prázdnej stránky, pretože tvoja šablóna je taktiež prázdna. To musíme opraviť.

Pridaj nasledujúci kód do tvojho súboru šablóny:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Obrázok 11.2](images/step3.png)

Funguje to! Dobrá práca :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Ako môžeš vidieť, celý obsah stránky sa nachádza medzi začínajúcim tagom `<html>` a uzatvárajúcim tagom `</html>`
* `<p>` je tag pre element odstavca; `</p>` uzatvára každý odstavec

## Head and body

Každá HTML stránka je taktiež rozdelená do dvoch elementov: **head** a **body**.

* **head** je element, ktorý obsahuje informácie o dokumente, ktoré nie sú zobrazené na obrazovke.

* **body** is an element that contains everything else that is displayed as part of the web page.

We use `<head>` to tell the browser about the configuration of the page, and `<body>` to tell it what's actually on the page.

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

Ulož súbor a znova načítaj svoju stránku.

![Obrázok 11.3](images/step4.png)

Všimni si ako prehliadač rozumie, že "Ola's blog" je titulok tvojej stránky? It has interpreted `<title>Ola's blog</title>` and placed the text in the title bar of your browser (it will also be used for bookmarks and so on).

Pravdepodobne si taktiež všimneš, že každý začínajúci tag má svoj *uzatvárajúci tag* obsahujúci `/`, a že elementy sú *vnorené* (tj. nemôžeš daný tag zatvoriť, kým nie sú taktiež zatvorené všetky tagy, ktoré sú v jeho vnútri).

Je to ako vkladať veci do krabice. Máš jednú veľkú krabicu, `<html></html>`; vo vnútri je `<body></body>`, a tá obsahuje menšie krabice: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Uprav svoju šablónu

You can now have a little fun and try to customize your template! Here are a few useful tags for that:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Podnádpis</h2>` pre nádpis na nižšej úrovni
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` zdôrazňuje tvoj text
* `<strong>text</strong>` zvýrazňuje tvoj text o čosi viac
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` vytvára odkaz
* `<ul><li>prvá položka</li><li>druhá položka</li></ul>` vytvára zoznam ako tento!
* `<div></div>` definuje sekciu stránky

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
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

Vytvorili sme tri `div` sekcie.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blogposts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blogpost.

Výsledok je nasledovný:

![Obrázok 11.4](images/step6.png)

Jupí! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Ešte jedna vec: nasaďte to!

Bolo by skvelé, ak by sme všetky tieto veci mohli vidieť naživo na Internete, že? Spravme ďalšie PythonAnywhere nasadenie:

### Commitni a pošli svoj kód na Github

Najprv sa pozrime, ktoré súbory sa zmenili od posledného nasadenia (tieto príkazy spusti lokálne, nie na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Uisti sa, že si v zložke `djangogirls` a následne povedzme `gitu` nech zahrnie všetky zmeny v zložke:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Also remember (from chapter 3) that `.` means the current directory.

Before we upload all the files, let's check what `git` will be uploading (all the files that `git` will upload should now appear in green):

{% filename %}command-line{% endfilename %}

    $ git status
    

Už sme skoro tam, teraz nastal čas mu povedať, aby uložil tieto zmeny v jeho histórii. Dáme mu "commit správu", kde popíšeme, čo sme zmenili. V tomto štádiu môžeš napísať čokoľvek, čo chceš, ale je nápomocné napísať čosi, čo je popisné natoľko, že si budeš v budúcnosti pamätať, čo si spravila.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Zmeny v HTML pre stránku."
    

> **Poznámka** - Uisti sa, že si použila dvojité úvodzovky okolo commit správy.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Stiahni svoj kód na PythonAnywhere a obnov svoju webovú aplikáciu

* Open up the [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) and go to your **Bash console** (or start a new one). Then, run:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

A sleduj ako sa tvoj kód sťahuje. Pokiaľ chceš skontrolovať, že dorazil, môžeš skočiť do **záložky Files** a pozrieť sa na svoj kód na PythonAnywhere.

* Nakoniec skoč do [záložky Web](https://www.pythonanywhere.com/web_app_setup/) a stlač **Reload** na tvojej webovej aplikácii.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)