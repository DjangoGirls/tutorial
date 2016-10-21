# Django URL

Chystáme se napsat naši první webovou stránku: homepage pro tvůj blog! Ale nejdřív si něco málo řekneme o Django URL.

## Co je adresa URL?

Adresa URL je jednoduše webová adresa. Adresu URL můžeš vidět pokaždé, když navštívíš webové stránky - je vidět v adresním řádku tvého prohlížeče (Ano! `127.0.0.1:8000` je adresa URL! A `https://djangogirls.org` je také adresa URL):

![Url][1]

 [1]: images/url.png

Každá stránka na internetu potřebuje svou vlastní URL. Tímto způsobem aplikace ví, co by měla ukázat uživateli, který otevře URL. V Djangu používáme takzvaný `URLconf` (URL konfigurace). URLconf je sada vzorů, podle kterých Django zpracuje URL a pokusí se najít správné view.

## Jak fungují URL v Djangu?

Pojďme otevřít soubor `mysite/urls.py` v tvém zvoleném editoru kódu a uvidíme, jak vypadá:

```python
    from django.conf.urls import include, url
    from django.contrib import admin

    urlpatterns = [
        # Examples:
        # url(r'^$', 'mysite.views.home', name='home'),
        # url(r'^blog/', include('blog.urls')),

        url(r'^admin/', include(admin.site.urls)),
    ]
```  

Jak vidíš, Django už má tady něco pro nás připravené.

Řádky, které začínají na `#`, jsou komentáře - to znamená, že tyto řádky nebudou spuštěny v Pythonu. Docela užitečný nástroj, ne?

Admin URL, které jsi navštívila v předchozí kapitole, už je tady:

```python
         url(r'^admin/', include(admin.site.urls)),
```  

To znamená, že pro každou adresu URL, která začíná na `admin/`, bude Django hledat odpovídající *view*. V tomto případě je zde vložen odkaz na soubor s admin URL, takže není vše zabaleno v jednom souboru – je to mnohem čitelnější a jednodušší.

## Regex

Zajímá tě, jak Django porovnává URL pro views? No, tato část je složitější. Django používá `regex`, což je zkratka pro "regulární výrazy". Regex má hodně (hodně!) pravidel, ze kterých tvoří vzorek pro vyhledávání. Vzhledem k tomu, že regex jsou hodně pokročilou záležitostí, nepůjdeme do podrobností, jak fungují.

Pokud chceš porozumět tomu, jak jsme vytvořili vzory, zde je příklad procesu - budeme potřebovat pouze omezenou sadu pravidel pro vyjádření vzoru, který hledáme, jmenovitě:

```
    ^ pro začátek textu
    $ pro konec textu
    \d číslice
    + označuje poslední položku, které by měla být zopakována
    () k zachycení/ohraničení části vzoru
```  

Cokoliv jiného v definici URL budeme brát doslovně.

Nyní si představ, že máš webové stránky s adresou: `http://www.mysite.com/post/12345/`, kde `12345` je číslo tvého příspěvku.

Psaní oddělených views pro všechna čísla příspěvků by bylo opravdu otravné. S regulárními výrazy můžeme vytvořit vzor, který bude odpovídat adrese URL a extrahovat z něj číslo, které potřebujeme: `^ post/(\d+) / $`. Pojďme si rozebrat kousek po kousku, co zde děláme:

*   **^ post/** říká Djangu: vezmi cokoliv, co má začátku adresy URL text `post/` (hned za `^`)
*   **(\d+)** znamená, že bude následovat číslo (jedno nebo více číslic) a že chceme číslo zachytit a extrahovat
*   **/** říká djangu, že by měl následovat další znak `/`
*   **$** pak označuje konec adresy URL, což znamená, že pouze řetězce s `/` na konci budou odpovídat tomuto vzoru

## Tvoje první Django URL!

Čas na vytvoření našeho prvního URL! Chceme, aby ' http://127.0.0.1:8000 /' bylo domovskou stránkou našeho blogu a zobrazilo seznam postů.

Chceme také, aby soubor `mysite/urls.py` zůstal čistý, takže budeme importovat adresy URL z našeho `blogu` do hlavního souboru `mysite/urls.py`.

Odstraň zakomentované řádky (řádky začínající `#`) a přidej řádek, který bude importovat `blog.urls` do hlavní URL('').`''`).

Tvůj `Mysite/urls.py` soubor by měl nyní vypadat takto:

```python
    from django.conf.urls import include, url
    from django.contrib import admin

    urlpatterns = [
         url(r'^admin/', include(admin.site.urls)),
         url(r'', include('blog.urls')),
    ]
```  

Django nyní bude přesměrovávat vše, co přichází na ' http://127.0.0.1:8000/', do `blog.urls ` a hledat zde další instrukce.

Při psaní regulárních výrazů v Pythonu se vždy přidává `r` před řetězec. To je užitečný tip pro Python, že řetězec může obsahovat zvláštní znaky, které nejsou určeny přímo pro Python samotný, ale pro regulární výraz namísto toho.

## blog.urls

Vytvoř nový prázdný soubor `blog/urls.py`. Přidej tyto dvě první řádky:

```python
    from django.conf.urls import url
    from . import views
```

Zde jsme jen importovaly Django metody a všechny naše `views` z aplikace `blogu` (zatím žádné nemáme, ale dostaneme se k tomu za chvíli).

Poté můžeme přidat náš první URL vzor:

```python
    urlpatterns = [
         url(r'^$', views.post_list, name='post_list'),
    ]
```  

Jak vidíš, právě jsme přiřadili `view` nazvané `post_list`, k URL `^$`. Tento regulární výraz znamená `^` (začátek řetězce), následuje `$` (konec řetězce) - výrazu bude odpovídat pouze prázdný řetězec. Tak je to správně, protože v Django URL překladači/resolveru, část adresy ' http://127.0.0.1:8000 /' není součástí adresy URL. Tento vzor řekne Djangu, že `views.post_list` je správné místo, kam jít, když někdo vstoupí na tvé webové stránky na adrese ' http://127.0.0.1:8000 /'.

Poslední část `name = 'post_list'` je název adresy URL, která bude použita k identifikaci view. Název URL může být stejný jako název view, ale také může být úplně jiný. Pojmenované URL budeme používat později v projektu, proto je důležité pojmenovat všechny adresy URL v aplikaci. Také by ses měla snažit udržet názvy adres URL jedinečné a snadno zapamatovatelné.

Všechno v pořádku? Otevři http://127.0.0.1:8000 / v prohlížeči a uvidíš výsledek.

![Error][2]

 [2]: images/error1.png

Stránka přestala fungovat, co? Neboj se, je to chyba, které se nemusíš obávat! Tyto hlášky jsou vlastně docela užitečné:

Můžeš si v ní přečíst, že neexistuje **žádný atribut/no attribute "post_list"**. Připomíná ti *post_list* něco? Tak jsme nazvali naše view! Znamená to, že vše je na svém místě, ale prostě jsme ještě nevytvořili naše *view*. Žádný strach, vytvoříme ho za chvilku.

> Pokud chceš vědět více o Django URLconfs, podívej se na oficiální dokumentaci: https://docs.djangoproject.com/en/1.8/topics/http/urls/
