# Úvod do HTML

Co je to šablona, se ami ptáš?

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## Co je HTML?

HTML is a code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML je zkratka od "HyperText Markup Language". **HyperText** znamená, že je to typ textu, který podporuje hypertextové odkazy mezi stránkami. **Markup** znamená, že jsme vzali dokument a označili ho kódem, abychom něčemu (v tomto případě prohlížeči) řekli, jak interpretovat stránku. HTML kód se vytváží pomocí **tagů**. Každý začíná znakem `<` a končí znakem `>`. Tyto tagy representují **elementy** značkovacího jazyka (Markup.

## Tvá první šablona!

Vytvoření šablony znamená vytvoření souboru šablony. Všechno je soubor, dobře? Toho sis už asi všimla.

Šablony jsou uloženy v adresáři `blog/templates/blog`. Takže nejdříve vytvoř adresář `templates` uvnitř tvé blog složky. Potom vytvoř další složku nazvanou `blog` uvnitř templates složky:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

A teď vytvoř soubor `post_list.html` (pro teď ho nech prázdný) uvnitř adresáře `blog/templates/blog`.

Podívej se jak tvá stránka vypadá teď: http://127.0.0.1:8000/

> Pokud se ti stále zobrazuje chyba`TemplateDoesNotExists`, zkus restartovat server. Go to the command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Figure 11.1](images/step1.png)

No error anymore! Congratulations! :) However, your website isn't actually publishing anything except an empty page, because your template is empty too. We need to fix that.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Figure 11.2](images/step3.png)

It worked. Nice work there! :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Jak vidíš, celý obsah stránky je mezi otevíracím tagem `<html>` a zavíracím tagem `</html>`
* `<p>` je tag pro element paragraf; `</p>` každý paragraf ukončuje

## Head and body

Každá HTML stránka je také rozdělena na dva elementy: **head** (hlavu) a **body** (tělo.

* **head** je element, který obsahuje informace o dokumentu, které se nezobrazují na webu.

* **body** je element který obsahuje vše ostatní, co se zobrazuje jakou součást webové stránky.

`<head>` používáme abychom prohlížeči sdělili konfiguraci stránky, `<body>` abychom sdělili co na té stránce skutečně je.

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

Ulož soubor a načti znovu svou stránku.

![Figure 11.3](images/step4.png)

Všimla sis, že prohlížeč už ví, že "Ola's blog" je titulek stránky? Interpretoval `<title>Ola's blog</title>` a umístil text jako název záložky.

Pravděpodobně jsi si také všimla, že každý otevírací tag je doplněn *zavíracím tagem* se znakem `/`, a že elementy jsou *vnořené* (tzn. že nemůžeš zavřít daný tag dokud nejsou zavřeny všechny tagy uvnitř).

Je to jako dávat věci do krabic. Máš jednu velkou krabici, `<html></html>`; uvnitř je `<body></body>`, A ta obsahuje další, menší krabice: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Přizpůsob si šablonu

Teď si můžeš užít trochu zábavy a pokusit se přizpůsobit si svou šablonu! Tady je pár užitečných tagů:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Pod-nadpis</h2>` pro nadpis na nižší úrovni
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>text</em>` zvýrazňuje tvůj text
* `<strong>text</strong>` hodně zvýrazňuje tvůj text
* `<br>` goes to another line (you can't put anything inside br and there's no closing tag)
* `<a href="https://djangogirls.org">link</a>` vytváří odkaz
* `<ul><li>První položka seznamu</li><li>second item</li></ul>` vytváří seznam, zrovna jako tento!
* `<div></div>` definuje sekce stránky

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
            <h2><a href="">Můj druhý příspěvek</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

Tady vytvoříme tři `div` sekce.

* The first `div` element contains the title of our blog – it's a heading and a link
* Another two `div` elements contain our blog posts with a published date, `h2` with a post title that is clickable and two `p`s (paragraph) of text, one for the date and one for our blog post.

To nám dá následující efekt:

![Figure 11.4](images/step6.png)

Jupííí! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Ještě jedna věc: nasaďme to!

Bylo by fajn vidět všecho tohle venku a živé na internetu, že jo? Pojďme udělat další PythonAnywhere nasazení (deploy):

### Commit, and push your code up to GitHub

Nejdříve se podívejme které soubory se změnily od posledního nasazení (deploy). Zadej tyto příkazy lokálně (ne na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Make sure you're in the `djangogirls` directory and let's tell `git` to include all the changes in this directory:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Než nahrajeme všechny soubory, zkontrolujme co bude `git` nahrávat (všechny soubory, které bude `git` nahrávat, se zobrazí zeleně):

{% filename %}command-line{% endfilename %}

    $ git status
    

Jsme skoro u konce, teď je čas uložit změny do historie. Vytvoříme "commit zprávu" kde popíšeme co jsme změnili. Můžeš napsat cokoli tě napadne, ale je užitečné napsat něco popisného, aby sis v budoucnosti mohla vzpomenout cos udělala.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Změněn HTML kód stránek."
    

> **Note** Make sure you use double quotes around the commit message.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Stáhni svůj nový kód na PythonAnywhere a načti webovou aplikaci

* Otevři [stránku s konzolí na PythonAnywhere](https://www.pythonanywhere.com/consoles/) a jdi do své **Bash konzole** (nebo začni novou). Potom zadej:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)