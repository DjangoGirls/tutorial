# Úvod do HTML

Možno sa pýtaš, čo je to šablóna?

Šablóna (template) je súbor, ktorý môžeme viackrát použiť, aby sme ukazovali rôzne dáta v rovnakom formáte. Šablónu môžeš použiť napríklad ako pomôcku pri písaní listu, pretože aj napriek tomu, že každý list môže obsahovať rozdielnu správu a byť adresovaný inej osobe, bude mať rovnaký formát.

Formát Django šablóny je popísaný v jazyku nazývanom HTML (to je to HTML, ktoré sme spomenuli v prvej kapitole **Ako funguje internet**).

## Čo je HTML?

HTML je kód, ktorý je interpretovaný tvojím webovým prehliadačom - ako napríklad Chrome, Firefox alebo Safari - aby tak zobrazil užívateľkám a užívateľom webové stránky.

HTML znamená "HyperText Markup Language". **HyperText** znamená, že sa jedná o typ textu, ktorý podporuje hypertextové odkazy medzi stránkami. **Markup** znamená, že sme vzali dokument a označili ho kódom, aby sme niečomu povedali (v tomto prípade prehliadaču), ako interpretovať stránku. HTML kód je budovaný pomocou **tagov**, ktoré začínajú znakom `<` a končia znakom `>`. Tieto tagy reprezentujú značkovacie (markup) **elementy**.

## Tvoja prvá šablóna!

Vytvorenie šablóny znamená, že najprv musíme vytvoriť šablónový súbor. Všetko je súbor, však? To si si asi už všimla.

Šablóny sú uložené v zložke `blog/templates/blog`. Takže najprv vytvor v priečinku blog priečinok s názvom `templates`. Potom vytvor ďalší priečinok s názvom `blog` v priečinku templates:

    blog
    └───templates
        └───blog
    

(Možno sa pýtaš, prečo potrebujeme dve zložky s menom `blog` - ako neskôr zistíš, je to len užitočná konvencia, ktorá ti uľahčí život, keď sa veci začnú komplikovať.)

A teraz vytvor súbor `post_list.html` (zatiaľ ho ponechaj prázdny) v priečinku `blog/templates/blog`.

Pozri sa, ako momentálne vyzerá tvoja stránka: http://127.0.0.1:8000/

> Pokiaľ stále vidíš chybu `TemplateDoesNotExist`, skús reštartovať svoj server. Choď do príkazového riadku, zastav server stlačením Ctrl+C (stlač naraz tlačidlá Control a C) a spusti ho znova pomocou príkazu `python manage.py runserver`.

![Obrázok 11.1](images/step1.png)

Chyba je preč! Gratulujeme :) Avšak tvoja webstránka zatiaľ neukazuje nič, len prázdnu stránku, pretože tvoja šablóna je taktiež prázdna. To musíme napraviť.

Otvor svoj nový súbor v editore a pridaj doň nasledovné:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

Takže ako momentálne vyzerá tvoja stránka? To môžeš zistiť kliknutím na: http://127.0.0.1:8000/

![Obrázok 11.2](images/step3.png)

Funguje to. Dobrá práca! :)

* Riadok `<!DOCTYPE html>` nie je HTML tag. Len definuje typ dokumentu. V tomto prípade hovorí prehliadaču, že typ nášho dokumentu je [HTML5](https://html.spec.whatwg.org/#the-doctype). Každý HTML5 súbor začína takto.
* Najzákladnejší tag, `<html>`, je vždy na začiatku každej webovej stránky, a `</html>` je vždy na jej konci. Ako môžeš vidieť, celý obsah stránky sa nachádza medzi začínajúcim tagom `<html>` a uzatvárajúcim tagom `</html>`
* `<p>` je tag pre element odstavca; `</p>` každý odstavec uzatvára

## Head a body

Každá HTML stránka je taktiež rozdelená do dvoch elementov: **head** a **body**.

* **head** je element, ktorý obsahuje informácie o dokumente, ktoré nie sú zobrazené na obrazovke.

* **body** je element, ktorý obsahuje všetko ostatné, zobrazené ako časť webovej stránky.

`<head>` používame, aby sme povedali prehliadaču o konfigurácii stránky, a `<body>`, aby sme mu povedali, čo na stránke je.

Napríklad môžeš dať stránke titulok pomocou elementu title v elemente `<head>` takto:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
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

Všimla si si, ako prehliadač porozumel, že "Ola's blog" je titulok tvojej stránky? Prečítal si slová `<title>Ola's blog</title>` a vložil ich do záložky v tvojom prehliadači (tiež ich bude používať, keby si si stránku napríklad uložila, atď.).

Pravdepodobne si taktiež všimneš, že každý začínajúci tag má svoj *uzatvárajúci tag* obsahujúci `/`, a že elementy sú *vnorené* (tj. nemôžeš daný tag zatvoriť, kým nie sú taktiež zatvorené všetky tagy, ktoré sú v jeho vnútri).

Je to, ako keby si vkladala veci do krabice. Máš jednu veľkú krabicu, `<html></html>`; vo vnútri je `<body></body>`, a tá obsahuje menšie krabice: `<p></p>`.

Musíš dodržiavať pravidlá *uzatvárania* tagov a *vnorenia* elementov - pokiaľ ich nebudeš dodržiavať, prehliadač nemusí tagy správne interpretovať a tvoja stránka sa zobrazí nesprávne.

## Upravenie tvojej šablóny

Môžeš sa trocha pohrať s tým, že budeš upravovať svoju šablónu! Tu je zopár užitočných tagov:

* `<h1>Hlavný nadpis</h1>` - pre tvoj najdôležitejší nadpis
* `<h2>Podnadpis</h2>` pre nadpis na nižšej úrovni
* `<h3>Pod-podnadpis</h3>`... a tak ďalej až do `<h6>`
* `<p>Odsek textu</p>`
* `<em>text</em>` zvýrazňuje tvoj text
* `<strong>text</strong>` zvýrazňuje tvoj text o čosi viac
* `<br>` vkladá nový riadok (do br nemôžeš nič vložiť a nemá ani uzatvárací tag)
* `<a href="https://djangogirls.org">link</a>` vytvára odkaz
* `<ul><li>prvá položka</li><li>druhá položka</li></ul>` vytvára zoznam, ako je tento!
* `<div></div>` definuje sekciu stránky
* `<nav></nav>` definuje skupinu navigačných odkazov
* `<article></article>` (článok) definuje nezávislý obsah, ktorý má zmysel sám osebe
* `<section></section>` definuje sekciu v dokumente
* `<header></header>` definuje hlavičku dokumentu alebo sekcie
* `<main></main>` definuje hlavný obsah dokumentu
* `<aside></aside>` definuje obsah vedľa iného obsahu (napr. bočná lišta)
* `<footer></footer>` definuje pätičku dokumentu alebo sekcie
* `<time></time>` definuje konkrétny čas (alebo dátum a čas)

Tu je príklad úplnej šablóny, skopíruj ho do súboru `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <header>
            <h1><a href="/">Django Girls Blog</a></h1>
        </header>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </article>

        <article>
            <time>published: 14.06.2014, 12:14</time>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </article>
    </body>
</html>
```

Týmto sme vytvorili jednu hlavičkovú `header` sekciu a dve článkové `article` sekcie.

* Prvý `header` element obsahuje hlavný nadpis nášho blogu - je to nadpis a odkaz
* Nasledujúce `article` elementy obsahujú naše blogové príspevky, každý s dátumom publikovania v `time` elemente, s nadpisom príspevku v `h2` elemente, na ktorý sa dá kliknúť, a s odstavcovým elementom `p`, ktorý predstavuje text nášho príspevku.

Výsledok je nasledovný:

![Obrázok 11.4](images/step6.png)

Jupí! Ale zatiaľ naša šablóna zobrazila len presne **tie isté dáta** - kým pred chvíľou sme hovorili, že nám šablóny dovoľujú zobrazovať **rozdielne** dáta v **rovnakom formáte**.

To, čo v skutočnosti chceme docieliť, je zobraziť reálne príspevky pridané v Django admin rozhraní - a to teraz aj spravíme.

## Ešte jedna vec: deploynime to!

Bolo by skvelé, ak by sme všetky tieto veci mohli vidieť naživo na internete, že? Spravme ďalší PythonAnywhere deployment:

### Commitni a pošli svoj kód na Github

Najprv sa pozrime, ktoré súbory sa zmenili od posledného deploymentu (tieto príkazy spusti lokálne, nie na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Uisti sa, že si v priečinku `djangogirls`, a následne povedz `gitu`, nech zahrnie všetky zmeny v priečinku:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Predtým, ako nahráme všetky súbory, skontrolujme, čo bude `git` nahrávať (všetky súbory, ktoré `git` nahrá, by teraz mali byť zelené):

{% filename %}command-line{% endfilename %}

    $ git status
    

Už sme skoro tam, teraz nastal čas mu povedať, aby uložil tieto zmeny v jeho histórii. Dáme mu "commit správu" (commit message), kde popíšeme, čo sme zmenili. V tomto štádiu môžeš napísať čokoľvek, čo chceš, ale je nápomocné napísať čosi, čo je popisné natoľko, že si budeš v budúcnosti pamätať, čo si spravila.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Zmeny v HTML pre stranku."
    

> **Poznámka** Uisti sa, že si okolo commit správy použila dvojité úvodzovky.

Keď to máme hotové, nahráme (push) naše zmeny na GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Stiahni svoj kód na PythonAnywhere a obnov svoju webovú aplikáciu

* Otvor [konzolovú stránku PythonAnywhere](https://www.pythonanywhere.com/consoles/) a prejdi do svojej **Bash konzoly** (alebo naštartuj novú). Potom zadaj:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

Nezabudni nahradiť `<your-pythonanywhere-domain>` svojou subdoménou na PythonAnywhere bez špicatých zátvoriek. Názov tvojej subdomény je zväčša tvoje užívateľské meno na PythonAnywhere, ale sú prípady, kedy môže byť trochu iný (napríklad, keď tvoje užívateľské meno obsahuje veľké písmená). Čiže ak ti tento príkaz nefunguje, skús spustiť `ls` (list files, alebo vypíš súbory), aby si zistila, ako sa tvoja subdoména/podadresár volá, a potom sa do tohto adresára presuň pomocou `cd`.

Sleduj, ako sa tvoj kód sťahuje. Ak si chceš overiť, že už prišiel, prejdi na stránku **"Files"** a pozri sa na svoj kód na PythonAnywhere (po ostatné PythonAnywhere stránky sa vieš potom dostať pomocou tlačidla v menu na stránke s konzolou).

* A nakoniec prejdi na [záložku Web](https://www.pythonanywhere.com/web_app_setup/) a stlač **Reload** na svojej webovej aplikácii.

Tvoje zmeny by mali byť online! Obnov svoju stránku v prehliadači. Zmeny by mali byť viditeľné. :)