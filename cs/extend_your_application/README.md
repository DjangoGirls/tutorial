# Rozšíření tvé aplikace

Dokončili jsme již všechny kroky potřebné k vytvoření našeho webu: víme, jak napsat model, url, view a šablonu. Víme také, jak udělat naše webové stránky pěkné.

Čas na procvičení!

První věc, kterou potřebujeme v našem blogu je pochopitelně stránka, která zobrazí jeden příspěvek, že ano?

Již máme `Post` model, takže nebudeme muset přidávat nic k `models.py`.

## Vytvoření šablony odkazu na post detail

Začneme s přidáním odkazu do `blog/templates/blog/post_list.html` souboru. Zatím by měl vypadat takto:

```html
    {% extends 'blog/base.html' %}

    {% block content %}
        {% for post in posts %}
            <div class="post">
                <div class="date">
                    {{ post.published_date }}
                </div>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    {% endblock content %}
```  


{% raw %}Chceme mít odkaz ze seznamu příspěvků na stránku detail příspěvku. Změňme `< h1 >< href ="">{{ post.title }}< /a></h1>` tak, aby odkazoval na stránku detailu příspěvku:{% endraw %}

```html
    <h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```  

{% raw %}Čas k vysvětlení tajemného `{% url 'post_detail' pk=post.pk %}`. Jak asi tušíš, `{% %}` tato notace znamená, že používáme Django šablonovací značky. Tentokrát použijeme jednu, která pro nás vytvoří adresu URL!{% endraw %}

`blog.views.post_detail` je cesta k `post_detail` *view*, který chceme vytvořit. Poznámka: `blog` je název naší aplikace (adresář `blog`), `views` je jméno ze souboru, `views.py` a poslední kousek - `post_detail` - je název *view*.

Teď, když půjdeme na: http://127.0.0.1:8000/ dostaneme chybu (což očekáváme, protože nemáme, adresu URL nebo *view* pro `post_detail`). Ten bude vypadat takto:

![NoReverseMatch error][1]

 [1]: images/no_reverse_match2.png

## Vytváříme adresu URL na detail příspěvku

Pojďme vytvořit adresu URL v `urls.py` pro náš `post_detail` *view*!

Chceme, aby se detail našeho prvního příspěvku zobrazil na této **URL**: http://127.0.0.1:8000/post/1 /

Pojďme vytvořit adresu URL v souboru `blog/urls.py` odkazující Django na *view* s názvem `post_detail`, který bude zobrazovat celý příspěvek blogu. Přidej řádek `url (r'^post/(?)P< pk>[0-9]+)/$', views.post_detail, name='post_detail'),` do souboru `blog/urls.py`. Tento soubor by měl vypadat takto:

```python
     from django.conf.urls import url
     from . import views

    urlpatterns = [
        url(r'^$', views.post_list, name='post_list'),
        url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
     ]
```  

Tato část `^post/(?)P<pk>[0-9] +)/$` vypadá děsivě, ale bez obav - my ti to vysvětlíme: - začíná to `^` – "to znamená začátek řetězce" - `post/` znamená pouze to, že po začátku, by adresa URL měla obsahovat slovo **post** a **/**. Zatím dobré. - `(?P<pk>[0-9]+)`-Tato část je složitější. Znamená to, že Django vezme vše, co zde bude umístěné a přesune to do view do proměnné s názvem `pk`. `[0-9]` nám také říká, že to může být pouze číslo, ne písmeno (takže cokoliv mezi 0 a 9). `+` znamená, že je zde má být jedna nebo více číslic. Takže něco jako `http://127.0.0.1:8000/post //` není platné Url, ale `http://127.0.0.1:8000/post/1234567890/` je naprosto v pořádku! -`/` - pak potřebujeme **/** znovu znak / - `$` - znamená "konec" řetězce!

Znamená to, že pokud zadáte `http://127.0.0.1:8000/post/5/` do prohlížeče, Django pochopí, že hledáte *view* s názvem `post_detail` a přenese informaci, že `pk` se rovná `5` do *view*.

`pk` je zkratka pro `primární klíč`. Tento název se často používá v Django projektech. Ale můžeš si své proměnné pojmenovat jak chceš (nezapomeň: malá písmena a `_` namísto mezer!). Například namísto `(?. P <pk>[0-9]+)` máme proměnnou `post_id`, takže tento kousek pak vypadá takto: `(?P< post_id> [0-9]+)`.

OK přidali jsme nový vzor adresy URL do `blog/urls.py`! Musíme obnovit stránku: http://127.0.0.1:8000 / Boom! Ještě další chyba! Jak jsme čekali!

![AttributeError][2]

 [2]: images/attribute_error2.png

Pamatuješ si, jaký je další krok? Jistě: Přidat view!

## Přidání view pro detail příspěvku

Tentokrát má náš *view* uveden dodatečný parametr `pk`. Náš *view* potřebuje tento parametr zachytit, že? Takže definujeme naši funkci jako `def post_detail (request, pk):`. Všimni si, že musíme použít přesně stejný název jako ten, který jsme určili v Url (`pk`). Vynechání této proměnné je nesprávné a bude mít za následek chybu!

A teď chceme dostat jeden a pouze jeden příspěvek z blogu. K tomu můžeme použít querysets jako je tento:

```python
    Post.objects.get(pk=pk)
```    

Ale tento kód má problém. Pokud neexistuje žádný `Post` s `primárním klíčem` (`pk`) dostaneme super ošklivou chybu!

![DoesNotExist error][3]

 [3]: images/does_not_exist2.png

A to my nechceme! Ale, samozřejmě, Django přichází s něčím, co nám to pomůže ošetřit za nás: `get_object_or_404`. V případě, že neexistuje žádný `Post` s daným `pk` zobrazí se mnohem hezčí stránka (nazývaná `Page Not Found 404`).

![Page not found][4]

 [4]: images/404_2.png

Dobrou zprávou je, že můžeš skutečně vytvořit vlastní stránku, `Page Not Found 404` a udělat jí tak krásnou, jak jen chceš. Ale to není nyní super důležité, takže to přeskočíme.

Ok, čas k přidání *view* do našeho souboru `views.py`!

Měla by si otevřít `blog/views.py` a přidat následující kód:

```python
    from django.shortcuts import render, get_object_or_404
```    

Poblíž jiné řádky `from`. A na konec souboru přidáme náš *view*:

```python
    def post_detail(request, pk):
         post = get_object_or_404(Post, pk=pk)
         return render(request, 'blog/post_detail.html', {'post': post})
```    

Ano. Je na čase aktualizovat stránku: http://127.0.0.1:8000 /

![Post list view][5]

 [5]: images/post_list2.png

Fungovalo to! Ale co se stane, když klepneš na odkaz v názvu příspěvku?

![TemplateDoesNotExist error][6]

 [6]: images/template_does_not_exist2.png

Ach ne! Další chyba! Ale my už víme jak s tím naložit správně? Musíme přidat šablonu!

## Vytvoření šablony pro detail příspěvku

Vytvoříme soubor `blog/templates/blog` s názvem `post_detail.html`.

Celý příkaz bude vypadat takto:

```html
    {% extends 'blog/base.html' %}

    {% block content %}
        <div class="post">
            {% if post.published_date %}
                <div class="date">
                    {{ post.published_date }}
                </div>
            {% endif %}
            <h1>{{ post.title }}</h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endblock %}
```  

Opět rozšiřujeme `base.html`. V bloku `content` chceme zobrazit published_date příspěvku (pokud existuje), název a text. Ale měli bychom probrat, některé důležité věci, že?

{% raw %} `{% if ... %} ... {% endif %}` je značka šablony, kterou můžeme použít, když chceme něco zkontrolovat (nezapomeň `, if... else...` v kapitole **Úvod do Pythonu**?). V tomto případě chceme zjistit, jestli `published_date` příspěvku není prázdný.{% endraw %}

OK můžeme aktualizovat naše stránky a uvidíš, jestli `Page Not Found` je pryč.

![Post detail page][7]

 [7]: images/post_detail2.png

Hurá! Funguje to!

## Ještě jedna věc: čas nasadit aplikaci!

Bylo by dobré zjistit, jestli naše webové stránky budou stále fungovat na PythonAnywhere? Zkusme je znovu nasadit.

```
    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
```  

*   Pak v [Bash konzoli PythonAnywhere][8]:

 [8]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
```  

*   Nakonec, skoč na [kartu Web][9] a klikni na **Reload**.

 [9]: https://www.pythonanywhere.com/web_app_setup/

A mělo by to být! Gratulujeme :)
