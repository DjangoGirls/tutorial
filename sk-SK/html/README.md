# Úvod do HTML

Môžno sa pýtaš, čo jej šablóna?

Šablóna je súbor, ktorý môžeme znova opakovane použiť, aby sme prezentovali nové informácie v konzistentnom formáte - šablónu môžeš použiť napríklad ako pomôcku pri písaní listu, pretože aj napriek tomu, že každý list môže obsahovať rozdielnu správu a byť adresovaný inej osobe, bude mať rovnaký formát.

Formát Django šablóny je popísaný v jazyku nazývanom HTML (to je to HTML, ktoré sme spomenuli v prvej kapitole **Ako funguje Internet**).

## Čo je HTML?

HTML je kód, ktorý je interpretovaný tvojím webovým prehliadačom - ako napríklad Chrome, Firefox alebo Safari - aby tak zobrazil užívateľom webové stránky.

HTML znamená "HyperText Markup Language". **HyperText** znamená, že sa jedná o typ textu, ktorý podporuje hypertextové odkazy medzi stránkami. **Markup** znamená, že sme vzali dokument a označili ho kódom aby sme niečomu povedali (v tomto prípade prehliadaču) ako interpretovať stránku. HTML kód je budovaný pomocou **tagov**, ktoré začínajú znakom `<` a končia znakom `>`. Tieto tagy reprezentujú značkovacie (Markup) **elementy**.

## Tvoja prvá šablóna!

Vytvorenie šablóny znamená vytvorenie súboru šablóny. Všetko je súbor, však? To si si asi už všimla.

Šablóny sú uložené v zložke `blog/templates/blog`. Takže najprv vytvor v zložke blogu zložku s názvom `templates`. Potom vytvor ďalšiu zložku s názvom `blog` v zložke templates:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

A teraz vytvor súbor `post_list.html` (zatiaľ ho ponechaj prázdny) v zložke `blog/templates/blog`.

Pozri sa, ako momentálne vyzerá tvoja stránka: http://127.0.0.1:8000/

> Pokiaľ stále vidíš chybu `TemplateDoesNotExist`, skús vyreštartovať svoj server. Choď do príkazového riadku, zastav server stlačením Ctrl+C (stlač naraz tlačidlá Control a C) a spusti ho znova pomocou príkazu `python manage.py runserver`.

![Obrázok 11.1](images/step1.png)

Žiadne ďalšie chyby! Gratulujeme :) Avšak tvoja stránka zatiaľ neukazuje nič, okrem prázdnej stránky, pretože tvoja šablóna je taktiež prázdna. To musíme opraviť.

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

Takže ako momentálne vyzerá tvoja stránka? To môžeš zistiť kliknutím na: http://127.0.0.1:8000/

![Obrázok 11.2](images/step3.png)

Funguje to! Dobrá práca :)

* Najzákladnejší tag, `<html>`, je vždy na začiatku každej webovej stránky a `</html>` je vždy na jej konci. Ako môžeš vidieť, celý obsah stránky sa nachádza medzi začínajúcim tagom `<html>` a uzatvárajúcim tagom `</html>`
* `<p>` je tag pre element odstavca; `</p>` uzatvára každý odstavec

## Head a body

Každá HTML stránka je taktiež rozdelená do dvoch elementov: **head** a **body**.

* **head** je element, ktorý obsahuje informácie o dokumente, ktoré nie sú zobrazené na obrazovke.

* **body** je element, ktorý obsahuje všetko ostatné zobrazené ako časť webovej stránky.

`<head>` používame, aby sme povedali prehliadaču o konfigurácii stránky a `<body>` aby sme mu povedali, čo na stránke je.

Napríklad môžeš dať stránke titulok pomocou title elementu v hlavičke `<head>` takto:

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

Všimni si ako prehliadač rozumie, že "Ola's blog" je titulok tvojej stránky? Interpretuje `<title>Ola's blog</title>` a vkladá text ako názov záložky (tento názov bude použitý aj keď si stránku uložíš do záložky a tak ďalej).

Pravdepodobne si taktiež všimneš, že každý začínajúci tag má svoj *uzatvárajúci tag* obsahujúci `/`, a že elementy sú *vnorené* (tj. nemôžeš daný tag zatvoriť, kým nie sú taktiež zatvorené všetky tagy, ktoré sú v jeho vnútri).

Je to ako vkladať veci do krabice. Máš jednú veľkú krabicu, `<html></html>`; vo vnútri je `<body></body>`, a tá obsahuje menšie krabice: `<p></p>`.

Musíš dodržovať pravidlá *uzatvárania* tagov a *vnorenia* elementov - pokiaľ ich nebudeš dodržovať, prehliadač nemusí správne interpretovať tagy a tvoja stránka bude zobrazená nesprávne.

## Uprav svoju šablónu

Môžeš sa trocha pohrať s tým, že budeš upravovať svoju šablónu! Tu je zopár užitočných tagov:

* `<h1>Hlavný nádpis</h1>` - pre tvoj najdôležitejší nádpis
* `<h2>Podnádpis</h2>` pre nádpis na nižšej úrovni
* `<h3>Pod-podnádpis</h3>`.. a tak ďalej až do `<h6>`
* `<p>Odsek textu</p>`
* `<em>text</em>` zdôrazňuje tvoj text
* `<strong>text</strong>` zvýrazňuje tvoj text o čosi viac
* `<br>` vkladá nový riadok (do br nemôžeš nič vložiť a nemá uzatvárací tag)
* `<a href="https://djangogirls.org">link</a>` vytvára odkaz
* `<ul><li>prvá položka</li><li>druhá položka</li></ul>` vytvára zoznam ako tento!
* `<div></div>` definuje sekciu stránky

Tu je príklad úplnej šablóny, skopíruj ho do súboru `blog/templates/blog/post_list.html`:

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

* Prvá `div` sekcia obsahuje titulok nášho blogu - je to nádpis a odkaz
* Ďalšie dva `div` elementy obsahujú príspevky blogu s časom publikovania, `h2` nádpisom príspevku, na ktorý sa dá kliknúť a dva `p` (odstavce) textu, jeden pre dátum a druhý pre náš príspevok.

Výsledok je nasledovný:

![Obrázok 11.4](images/step6.png)

Jupí! Ale zatiaľ naša šablóna zobrazila len presne **rovnaké informácie** - kým pred chvíľou sme hovorili, že nám šablóny dovoľujú zobrazovať **rozdielne** informácie v **rovnakom formáte**.

To čo v skutočnosti chceme spraviť je zobraziť reálne príspevky pridané v Django admin rozhraní - a to je to, čo teraz spravíme.

## Ešte jedna vec: nasaďte to!

Bolo by skvelé, ak by sme všetky tieto veci mohli vidieť naživo na Internete, že? Spravme ďalšie PythonAnywhere nasadenie:

### Commit, and push your code up to GitHub

Najprv sa pozrime, ktoré súbory sa zmenili od posledného nasadenia (tieto príkazy spusti lokálne, nie na PythonAnywhere):

{% filename %}command-line{% endfilename %}

    $ git status
    

Uisti sa, že si v zložke `djangogirls` a následne povedzme `gitu` nech zahrnie všetky zmeny v zložke:

{% filename %}command-line{% endfilename %}

    $ git add .
    

Predtým, ako nahráme všetky súbory, skontrolujme čo bude `git` nahrávať (všetky súbory, ktoré `git` nahrá by teraz mali byť zelené):

{% filename %}command-line{% endfilename %}

    $ git status
    

Už sme skoro tam, teraz nastal čas mu povedať, aby uložil tieto zmeny v jeho histórii. Dáme mu "commit správu", kde popíšeme, čo sme zmenili. V tomto štádiu môžeš napísať čokoľvek, čo chceš, ale je nápomocné napísať čosi, čo je popisné natoľko, že si budeš v budúcnosti pamätať, čo si spravila.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Zmeny v HTML pre stránku."
    

> **Note** Make sure you use double quotes around the commit message.

Po tom, čo sme to dokončili, nahráme (push) naše zmeny na Github:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Stiahni svoj kód na PythonAnywhere a obnov svoju webovú aplikáciu

* Otvor [konzolovú stránku PythonAnywhere](https://www.pythonanywhere.com/consoles/) a prejdi do svojej **Bash konzoly** (alebo naštartuj novú). Potom zadaj:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

Aktualizácia by mala prebehnuť a zmeny by mali byť dostupne v živej verzii! Obnov svoju stránku v prehliadači. Zmeny by mali byť viditeľné. :)