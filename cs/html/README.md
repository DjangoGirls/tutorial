# Úvod do HTML

Co je to šablona, se asi ptáš?

Šablona je soubor, který můžeme opakovaně použít pro prezentaci různých informací v konzistentním formátu - například bys mohla šablonu použít pro psaní dopisu, protože přestože každý dopis může obsahovat jinou zprávu a být adresován jiné osobě, všechny dopisy budou sdílet stejný formát.

Formát Django šablony je popsán v jazyku nazývaném HTML (Je to to HTML které jsme zmínili v první kapitole **Jak funguje internet**).

## Co je HTML?

HTML je jednoduchý kód který je interpretován tvým webovým prohlížečem - jako je Chrome, Firefox nebo Safari - aby se uživateli zobrazila webová stránka.

HTML je zkratka od "HyperText Markup Language". **HyperText** znamená, že je to typ textu, který podporuje hypertextové odkazy mezi stránkami. **Markup** znamená, že jsme vzali dokument a označili ho kódem, abychom něčemu (v tomto případě prohlížeči) řekli, jak interpretovat stránku. HTML kód se vytváží pomocí **tagů**. Každý začíná znakem `<` a končí znakem `>`. Tyto tagy representují **elementy** značkovacího jazyka (Markup).

## Tvá první šablona!

Vytvoření šablony znamená vytvoření souboru šablony. Všechno je soubor, dobře? Toho sis už asi všimla.

Šablony jsou uloženy v adresáři `blog/templates/blog`. Takže nejdříve vytvoř adresář `templates` uvnitř tvé blog složky. Potom vytvoř další složku nazvanou `blog` uvnitř templates složky:

```
    blog
    └───templates
        └───blog
```  

(Mohlo by tě zajímat proč potřebujeme dva adresáře s názvem `blog` - jak později zjistíš, je to pouze užitečná konvence, která dělá život jednodušším, když věci začnou být komplikovanější.)

A teď vytvoř soubor `post_list.html` (pro teď ho nech prázdný) uvnitř adresáře `blog/templates/blog`.

Podívej se jak tvá stránka vypadá teď: http://127.0.0.1:8000/

> Pokud máš stále chybu `TemplateDoesNotExists`, zkus restartovat server. Běž do příkazové řádky, zastav server zmáčknutím Ctrl+C (Control a C tlačítek zároveň) a znovu ho rozběhni pomocí příkazu `python manage.py runserver`.

![Figure 11.1][1]

 [1]: images/step1.png

Žádná chybová hláška! Gratulujeme :) Nicméně, na tvé stránce se ještě nezveřejnilo nic kromě prázdné stránky, protože tvá šablona je také prázdná. To musíme napravit.

Do souboru šablony (template) přidej následující:

```html
    <html>
        <p>Ahoj!</p>
        <p>Funguje to!</p>
    </html>
```  

Tak jak tvá stránka vypadá teď? Klikni abys to zjistila: http://127.0.0.1:8000/

![Figure 11.2][2]

 [2]: images/step3.png

Fungovalo to! Pěkná práce :)

*   Nejzákladnější tag, `<html>`, je vždy na začátku jakékoli stránky a `</html>` na jejím konci. Jak vidíš, celý obsah stránky je mezi otevíracím tagem `<html>` a zavíracím tagem `</html>`
*   `<p>` je tag pro element paragraf; `</p>` každý paragraf ukončuje

## Head & body

Každá HTML stránka je také rozdělena na dva elementy: **head** (hlavu) a **body** (tělo).

*   **head** je element, který obsahuje informace o dokumentu, které se nezobrazují na webu.

*   **body** je element který obsahuje vše ostatní, co se zobrazuje jakou součást webové stránky.

`<head>` používáme abychom prohlížeči sdělili konfiguraci stránky, `<body>` abychom sdělili co na té stránce skutečně je.

Například dovnitř `<head>` můžeš dát element title (titulek), třeba takhle:

```html
    <html>
        <head>
            <title>Ola's blog</title>
        </head>
        <body>
            <p>Ahoj!</p>
            <p>Funguje to!</p>
        </body>
    </html>
```  

Ulož soubor a načti znovu svou stránku.

![Figure 11.3][3]

 [3]: images/step4.png

Všimla sis, že prohlížeč už ví, že "Ola's blog" je titulek stránky? Interpretoval `<title>Ola's blog</title>` a umístil text jako název záložky.

Pravděpodobně jsi si také všimla, že každý otevírací tag je doplněn *zavíracím tagem* se znakem `/`, a že elementy jsou *vnořené* (tzn. že nemůžeš zavřít daný tag dokud nejsou zavřeny všechny tagy uvnitř).

Je to jako dávat věci do krabic. Máš jednu velkou krabici, `<html></html>`; uvnitř je `<body></body>`, A ta obsahuje další, menší krabice: `<p></p>`.

Musíš dodržovat pravidlo *zavíracích* tagů a *vnořených* elementů - pokud nebudeš, prohlížeč je nemusí být schopný správně interpretovat a tvá webová stránka se bude zobrazovat nesprávně.

## Přizpůsob si šablonu

Teď si můžeš užít trochu zábavy a pokusit se přizpůsobit si svou šablonu! Tady je pár užitečných tagů:

*   `<h1>Hlavní nadpis</h1>` - Pro tvůj nejdůležitější nadpis
*   `<h2>Pod-nadpis</h2>` pro nadpis na nižší úrovni
*   `<h3>Pod-pod-nadpis</h3>` ... a tak dále, až k `<h6>`
*   `<em>text</em>` zvýrazňuje tvůj text
*   `<strong>text</strong>` hodně zvýrazňuje tvůj text
*   `<br />` vkládá novou řádku (dovnitř br nemůžeš nic dát)
*   `<a href="https://djangogirls.org">link</a>` vytváří odkaz
*   `<ul><li>První položka seznamu</li><li>second item</li></ul>` vytváří seznam, zrovna jako tento!
*   `<div></div>` definuje sekce stránky

Zde je příklad celé šablony:

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
                <h2><a href="">Můj první příspěvek</a></h2>
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

*   První `div` element obsahuje titulek našeho blogu - jeho nadpis a odkaz
*   Další dva `div` elementy obsahují naše příspěvky s datem zveřejnění, na `h2` s titulkem příspěvku se dá kliknout a dva `p` (paragrafy) obsahují text, jeden datum a druhý samotný příspěvek.

To nám dá následující efekt:

![Figure 11.4][4]

 [4]: images/step6.png

Jupííí! Ale teď naše šablona zobrazuje jen **neměnné informace** - dříve jsme ovšem mluvili o tom, že šablony nám umožňují zobrazovat **různé** informace ve **stejném formátu**.

Co ve skutečnosti chceme, je zobrazit opravdové příspěvky přidané v našem Django administrátorském rozhraní - a to se chystáme udělat zachvilku.

## Ještě jedna věc: nasaďme to!

Bylo by fajn vidět všecho tohle venku a živé na internetu, že jo? Pojďme udělat další PythonAnywhere nasazení (deploy):

### Commitni, a hoď svůj kód na Github

Nejdříve se podívejme které soubory se změnily od posledního nasazení (deploy). Zadej tyto příkazy lokálně (ne na PythonAnywhere):

```
    $ git status
```  

Ujisti se, že jsi v `djangogirls` adresáři a řekni `gitu`, ať zahrne všechny nové změny v adresáři:

```
    $ git add --all .
```  

> **Poznámka** `-A` (zkratka pro "all", tj. "vše") znamená, že `git` také rozpozná jestli jsi smazala nějaké soubory (defaultně rozpoznává pouze nové a modifikované soubory). Taky si vzpomeň (ze 3. kapitoly), že `.` znamená aktuální adresář.

Než nahrajeme všechny soubory, zkontrolujme co bude `git` nahrávat (všechny soubory, které bude `git` nahrávat, se zobrazí zeleně):

```
    $ git status
```  

Jsme skoro u konce, teď je čas uložit změny do historie. Vytvoříme "commit zprávu" kde popíšeme co jsme změnili. Můžeš napsat cokoli tě napadne, ale je užitečné napsat něco popisného, aby sis v budoucnosti mohla vzpomenout cos udělala.

```
    $ git commit -m "Změněn HTML kód stránek."
```  

> **Poznámka** Ujisti se, že používáš dvojité uvozovky kolem zprávy.

Jakmile jsme hotovi s tímto, nahrajeme (push) naše změny na Github:

```
    git push
```  

### Stáhni svůj nový kód na PythonAnywhere a načti webovou aplikaci

*   Otevři [stránku s konzolí na PythonAnywhere][5] a jdi do své **Bash konzole** (nebo začni novou). Potom zadej:

 [5]: https://www.pythonanywhere.com/consoles/

```
    $ cd ~/my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
```  

A sleduj svůj kód jak se stahuje. Pokud si chceš zkontrolovat, že se kód opravdu nahrál, můžeš skočit do záložky **Files** a podívat se na svůj kód na PythonAnywhere.

*   A konečně, skoč na záložku [Web][6] a klikni na **Reload** (Znovu načíst).

 [6]: https://www.pythonanywhere.com/web_app_setup/

Tvůj update by měl běžet živě! Obnov svou stránku v prohlížeči. Měla bys vidět změny :)
