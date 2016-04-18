# CSS - udělej svou aplikaci hezčí!

Náš blog nevypadá stále dost pěkně, že? Je na čase ho udělat hezčí! Použijeme na to CSS.

## Co je to CSS?

CSS (neboli Cascading Style Sheets) je jazyk používaný pro popis vzhledu a formátování webové stránky. Je to značkovací jazyk (jako HTML). Ber ho jako make-up pro náš web ;).

Nechceme ale zase začínat úplně od začátku, že? Opět použijeme něco, co již bylo vytvořeno jinými programátory a sdíleno na internetu pro použití zdarma. Vymýšlet znovu, co již před námi někdo vymyslel, to by nebyla žádná legrace.

## Použijme Bootstrap!

Bootstrap je jedním z nejpopulárnějších HTML a CSS frameworků pro vývoj pěkné webové stránky: http://getbootstrap.com/

Byl napsán programátory, kteří pracovali pro Twitter a je nyní vyvíjeno dobrovolníky z celého světa.

## Instalace Bootstrapu

Chceš-li nainstalovat Bootstrap, je třeba přidat do `< head >` v souboru `.html` (`blog/templates/blog/post_list.html`):

```html
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

To nepřidá žádné soubory do projektu. Jen to odkazuje na soubory, které existují na internetu. Jen do toho, otevři tvůj web a aktualizuj stránku. Tady to je!

![Obrázek 14.1][1]

 [1]: images/bootstrap1.png

Hned to vypadá lépe!

## Statické soubory v Djangu

Konečně se podíváme zblízka na téma, které jsme již zmínili, **statické soubory**. Statické soubory jsou všechny naše CSS soubory a obrázky, které nejsou dynamické, takže jejich obsah není závislý na kontextu požadavku a budou stejné pro každého uživatele.

### Kam umístit statické soubory pro Django

Jak jsi viděla, když jsme spustili `collectstatic` na serveru, Django už ví, kde najít statické soubory pro vestavěnou aplikaci "admin". Teď jen musíme přidat nějaké statické soubory pro vlastní aplikaci, `blog`.

Uděláš to tak, že vytvoříš složku s názvem `static` uvnitř aplikace blog:

```
    djangogirls
    ├── blog
    │   ├── migrations
    │   └── static
    └── mysite
```    

Django automaticky najde všechny složky s názvem "static" uvnitř vašich složek aplikací, a bude moci využívat jejich obsahu jako statické soubory.

## Tvůj první soubor CSS!

Vytvoř soubor CSS, chceš-li na stránku www přidat svůj vlastní styl. Vytvoř nový adresář s názvem `css` uvnitř adresáře `static`. Vytvoř nový soubor s názvem `blog.css` uvnitř tohoto adresáře `css`. Připraveno?

```
    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
```    

Čas k napsání nějakého CSS! Otevři soubor `blog/static/css/blog.css` v editoru kódu.

Nepůjdeme příliš hluboko do přizpůsobení webu a učení o CSS, protože je to docela snadné, a můžeš se o tom dozvědět sama po tomto workshopu. Opravdu můžeme doporučit [Codeacademy HTML & CSS kurz][2] kde se dozvíš vše, co potřebuješ vědět, aby tvoje stránky s CSS vypadaly dobře.

 [2]: http://www.codecademy.com/tracks/web

Ale pojďme něco málo udělat. Možná bychom mohli změnit barvu našeho záhlaví? Pro interpretaci barev, počítače používají speciální kódy. Začínají `#` a následuje 6 písmen (A-F) a číslic (0-9). Kódy barev můžeš najít například zde: http://www.colorpicker.com/. Můžeš také použít [předdefinované barvy][3], `červená/red` a `zelená/green`.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

V souboru `blog/static/css/blog.css` přidej následující kód:

```css
    h1 a {
        color: #FCA205;
    }
```  

`h1` je CSS selector. To znamená, že budeme aplikovat naše styly na jakýkoliv `a` element uvnitř `h1` (např. když máme v kódu něco jako: `< h1 >< href = "" > odkaz < /a >< / h1 >`). V takovém případě sdělujeme, že barvu elementu měníme na `#FCA205`, což je oranžová. Samozřejmě zde můžeš vložit vlastní barvu!

V CSS souboru určujeme styly pro prvky v souboru HTML. Prvky jsou identifikovány pomocí názvu prvku (tj, `a`,`h1`, `body`), atributem `class` nebo atributem `id`. Třídy/Class a id jsou jména, které pojmenovávají samotný prvek. Třídy definují skupiny prvků a Id poukazují na konkrétní prvky. Například, následující tag může identifikovat pomocí CSS tag `a`, třídu `external_link` nebo id `link_to_wiki_page`:

```html
    <a href="http://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```  

Přečti si o [CSS selektorech ve w3schools][4].

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Pak je třeba také říct naší HTML šabloně, že jsme přidali nějaké CSS. Otevři soubor `blog/templates/blog/post_list.html` a přidej tento řádek na samý začátek:

```html
    {% load staticfiles %}
```  

Právě nahráváme statické soubory :). Pak mezi `< head >` `a/< / head >`, za odkazy na soubory Bootstrap CSS (prohlížeč načte soubory v pořadí, ve kterém jsou zapsány, takže kód v našem souboru může přepsat kód v Bootstrap souborech), přidejte tento řádek:

    html
    <link rel="stylesheet" href="{% static 'css/blog.css' %}">


Právě jsi řekla naší šabloně, kde je umístěn náš soubor CSS.

Soubor by měl nyní vypadat takto:

```html
    {% load staticfiles %}
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
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaks }}</p>
                </div>
            {% endfor %}
        </body>
    </html>
```

OK, ulož soubor a aktualizuj stránky!

![Obrázek 14.2][5]

 [5]: images/color2.png

Dobrá práce! Možná bychom také chtěli provzdušnit náš web a zvětšit okraj na levé straně? Pojďme to zkusit!

```css
    body {
        padding-left: 15px;
    }
```  

Přidej toto do svého CSS souboru, ulož soubor a koukni se, jak to funguje!

![Obrázek 14.3][6]

 [6]: images/margin2.png

Možná můžeme také chtít přizpůsobit písmo v našem záhlaví? Vlož mezi tag `< head >` v souboru `blog/templates/blog/post_list.html`:

```html
    <link href="http://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```  

Tento řádek bude importovat písmo s názvem *Lobster* z Google písem (https://www.google.com/fonts).

Nyní přidej řádek `font-family: "Lobster";` do CSS souboru `blog/static/css/blog.css` uvnitř deklarace `h1` bloku (kód mezi závorkami `{` a `}`) a aktualizuj stránky:

```css
    h1 a {
        color: #FCA205;
        font-family: 'Lobster';
    }
```  

![Obrázek 14.3][7]

 [7]: images/font.png

Skvěle!

Jak bylo uvedeno výše, CSS má koncept tříd, který v podstatě umožňuje pojmenovat části kódu HTML a styly aplikovat pouze na tyto části bez ovlivnění ostatních částí. Je to super užitečné, pokud máš dva div tagy, ale každý dělá něco jiného (jako záhlaví a příspěvek), takže nechceš, aby vypadaly stejně.

Pokračuj a pojmenuj některé části kódu HTML. Přidáš třídu s názvem `page-header` do tvého `div` tagu, který obsahuje záhlaví, jako je tento:

```html
    <div class="page-header">
         <h1><a href="/">Django Girls Blog</a></h1>
    </div>
```

A nyní přidej třídu, `post` do svého `div` obsahující blog post.

```html
    <div class="post">
         <p>published: {{ post.published_date }}</p>
         <h1><a href="">{{ post.title }}</a></h1>
         <p>{{ post.text|linebreaks }}</p>
    </div>
```    

Nyní přidáme deklaraci bloků pro jiné selektory. Selektory začínající `.` se týkají tříd. Existuje mnoho skvělých návodů a vysvětlení CSS na webu, které ti pomohou pochopit následující kód. Pro tuto chvíli stačí zkopírovat a vložit do souboru `blog/static/css/blog.css`:

```css
    .page-header {
         background-color: #ff9400;
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
         float: right;
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

     .post h1 a, .post h1 a:visited {
         color: #000000;
    }
```  

Pak obklopující HTML kód, který zobrazuje příspěvek s deklaracemi tříd. Nahraď tímto:

```html
    {% for post in posts %}
         <div class="post">
             <p>published: {{ post.published_date }}</p>
             <h1><a href="">{{ post.title }}</a></h1>
             <p>{{ post.text|linebreaks }}</p>
         </div>
    {% endfor %}
```    

v `blog/templates/blog/post_list.html` tímto:

```html
    <div class="content container">
         <div class="row">
             <div class="col-md-8">
                 {% for post in posts %}
                     <div class="post">
                         <div class="date">
                             {{ post.published_date }}
                         </div>
                         <h1><a href="">{{ post.title }}</a></h1>
                         <p>{{ post.text|linebreaks }}</p>
                     </div>
                 {% endfor %}
             </div>
         </div>
    </div>
```    

Tyto soubory ulož a aktualizuj své webové stránky.

![Obrázek 14.4][8]

 [8]: images/final.png

Woohoo! Vypadá to super, ne? Kód, který jsme vložili není opravdu tak těžký pochopit a měla bys být schopna pochopit jeho většinu, jen jeho čtením.

Neobávej se trochu poupravit CSS a pokusit se změnit některé věci. Když něco rozbiješ, neboj se, můžeš jej vždy vrátit zpět!

Mimochodem opravdu doporučujeme tento bezplatný online [Codeacademy HTML & CSS kurz][2] jako post-workshop úkol, naučíš se vše, co potřebuješ vědět, aby tvoje stránky byly hezčí s CSS.

Připravena na další kapitolu?! :)
