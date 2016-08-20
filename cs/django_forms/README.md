# Django formuláře

Poslední věc, kterou chceme udělat na našich webových stránkách, je vytvořit pohodlný způsob, jak přidávat a upravovat příspěvky na blogu. Django `admin` je super, ale je těžké ho přizpůsobit a upravit do hezčí podoby. S `formuláři` budeme mít absolutní moc nad naším rozhraním - můžeme dělat téměř cokoliv, co si dokážeme představit!

Pěkná věc na Django formulářích je, že je můžeme definovat úplně od počátku nebo vytvořit `ModelForm`, který uloží výsledek z formuláře pomocí modelu.

To je přesně to, co chceme udělat: vytvoříme formulář pro náš model `Post`.

Stejně jako všechny důležité části Djanga mají formuláře své vlastní soubory: `forms.py`.

V našem adresáři potřebujeme vytvořit soubor s názvem `blog`.

```
    blog
     └── forms.py
```  

OK, otevři ho a zadej následující kód:

```python
     from django import forms

     from .models import Post

     class PostForm(forms.ModelForm):
         class Meta:
             model = Post
             fields = ('title', 'text',)
```    

Musíme nejdříve importovat Django formuláře (`from django import forms`) a samozřejmě náš `Post` model (`from .models import Post`).

`PostForm`, jak asi předpokládáš, je jméno našeho formuláře. Musíme říct Djangu, že tento formulář je `ModelForm` (tak pro nás bude moci Django udělat něco magického) - zodpovědný za to bude `forms.ModelForm`.

Dále zde máme `třídu Meta`, kde řekneme Djangu, který model by měl být použit k vytvoření tohoto formuláře (`model = Post`).

Nakonec můžeme Djangu říct, co se má stát s jednotlivými poli našeho formuláře. V tomto případě chceme pouze zobrazit pole `nadpis/title` a `text` - `autor` by měl být člověk, který je aktuálně přihlášen (ty!) a `created_date` by mělo být automaticky nastaveno, když vytvoříme příspěvek (tj. v kódu).

A je to! Vše, co teď musíme udělat, je použít formulář ve *view* a zobrazit ho v šabloně.

Takže ještě jednou: budeme vytvářet odkaz na stránky, URL, pohled a šablonu.

## Odkaz na stránku s formulářem

Je tedy čas otevřít soubor `blog/templates/blog/base.html`. Přidáme odkaz do `div` s názvem `page-header`:

```html
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```    

Všimni si, že chceme zavolat náš nový view `post_new`.

Po přidání řádku by měl tvůj html soubor vypadat takto:

```html
    {% load staticfiles %}
    <html>
          <head>
             <title>Django Girls blog</title>
             <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
             <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
             <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
             <link rel="stylesheet" href="{% static 'css/blog.css' %}">
          </head>
          <body>
             <div class="page-header">
                 <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
                 <h1><a href="/">Django Girls Blog</a></h1>
             </div>
             <div class="content container">
                 <div class="row">
                     <div class="col-md-8">
                         {% block content %}
                         {% endblock %}
                     </div>
                 </div>
             </div>
          </body>
    </html>
```    

Po uložení a obnovení stránky http://127.0.0.1:8000 patrně uvidíš známou `NoReverseMatch` chybu.

## URL

Otevři `blog/urls.py` a přidej řádek:

```python
    url(r'^post/new/$', views.post_new, name='post_new'),
```  

Výsledný kód bude vypadat takto:

```python
     from django.conf.urls import url
     from . import views

    urlpatterns = [
         url(r'^$', views.post_list, name='post_list'),
         url(r'^post/(?P<pk>[0-9]+)/$', views.post_detail, name='post_detail'),
         url(r'^post/new/$', views.post_new, name='post_new'),
    ]
```    

Po aktualizaci webu vidíme `AttributeError`, protože nemáme implementovaný `post_new` view. Přidáme ho právě teď.

## post_new view

Musíme otevřít soubor `blog/views.py` a přidat následující řádky:

```python
    from .forms import PostForm
```  

a náš *view*:

```python
    def post_new(request):
         form = PostForm()
         return render(request, 'blog/post_edit.html', {'form': form})
```    

Chceš-li vytvořit nový formulář `Post`, musíš zavolat `PostForm()` a předat ho do šablony. Za chvilku se vrátíme k tomuto *view*, ale teď pojďme rychle vytvořit šablonu formuláře.

## Šablona

Musíme vytvořit soubor `post_edit.html` v adresáři `blog/templates/blog`. Pro vytvoření formuláře potřebujeme udělat několik věcí:

*   musíme zobrazit formulář. Můžeme to udělat například jednoduchým `{% raw %}{{ form.as_p }}{% endraw %}`.
*   formulář musíme obalit HTML značkou (přidej řádek nad formulář): `< method="POST" >... < / form >`
*   potřebujeme tlačítko `Uložit`. Vytvoříme HTML tlačítko: `< button type="submit"> Uložit < / button>`
*   a nakonec těsně za otevírací značku `< form... >` musíme přidat `{% raw %}{% csrf_token %}{% endraw %}`. Toto je velmi důležité, protože tak vytvoříme bezpečnější formulář! Django si bude stěžovat v okamžiku, kdy se pokusíš uložit formulář, pokud zapomeneš na tuto část:

![CSFR zakázaná stránka][1]

 [1]: images/csrf2.png

Pojďme se nyní podívat, jak by mělo vypadat HTML v `post_edit.html`:

```html
    {% extends 'blog/base.html' %}

    {% block content %}
         <h1>New post</h1>
         <form method="POST" class="post-form">{% csrf_token %}
             {{ form.as_p }}
             <button type="submit" class="save btn btn-default">Save</button>
         </form>
    {% endblock %}
```    

Čas aktualizovat naší stránku! Hurá! Zobrazil se formulář!

![Nový formulář][2]

 [2]: images/new_form2.png

Ale ještě chvilku počkej! Když něco zadáš do polí `titulek` a `text` a pokusíš se formulář uložit - co se stane?

Nic! Jsme opět na stejné stránce, náš text je pryč... a nepřidal se žádný nový příspěvek. Tak co se stalo?

Odpověď je: nic. Musíme ještě trochu zapracovat na našem *view*.

## Ukládání formuláře

Otevři znovu `blog/views.py`. Vše, co máme aktuálně v `post_new`, je toto:

```python
    def post_new(request):
         form = PostForm()
         return render(request, 'blog/post_edit.html', {'form': form})
```    

Když odešleme formulář, vrátíme se zpět na ten samý view, ale tentokrát obdržíme nějaká další data v `request`, přesněji v `request.POST` (pojmenování nemá nic společného s naším "post" v blogu, vychází to z toho, že "zasíláme" data). Pamatuješ si, že v našem HTML souboru ve `<form>` jsme definovali proměnnou `method="POST"`? Všechna pole z formuláře jsou nyní k dispozici v proměnné `request.POST`. Neměla bys přejmenovávat `POST` na něco jiného (jediná další platná hodnota proměnné `method` je `GET`, ale teď tady nebudeme vysvětlovat rozdíly).

Takže v našem *view* máme dvě samostatné situace ke zpracování. První: když načteme stránku poprvé a chceme dostat prázdný formulář. Druhou: když se vrátíme zpět do našeho *view* s vyplněnými daty formuláře. Takže musíme přidat podmínku (použijeme na to `if`).

```python
    if request.method == "POST":
         [...]
    else:
         form = PostForm()
```    

Teď je čas k vyplnění mezer `[...]`. Je-li `method` `POST`, chceme vytvořit `PostForm` s údaji z formuláře, že? Udělejme to:

```python
    form = PostForm(request.POST)
```  

Snadné! Další věcí je zjistit, zda-li je formulář v pořádku (všechna požadovaná pole jsou vyplněna a neobsahují špatné hodnoty). Uděláme to pomocí `form.is_valid()`.

Zkontrolujeme, je-li formulář platný, a pokud ano, můžeme ho uložit!

```python
    if form.is_valid():
         post = form.save(commit=False)
         post.author = request.user
         post.published_date = timezone.now()
         post.save()
```    

V podstatě, tady máme dvě věci: ukládáme formulář pomocí `form.save` a přidáváme autora (vzhledem k tomu, že v `PostForm` nebylo žádné pole `Autor` a toto pole je požadováno!). `commit=False` znamená, že ještě nechceme `Post` uložit pomocí modelu - chceme nejdříve přidat autora. Většinu času budeš používat `form.save()`, bez `commit=False`, ale v tomto případě to potřebujeme takto udělat. `post.save()` zachová změny (přidá autora) a vytvoří nový příspěvek na blogu!

A nakonec by bylo úžasné, pokud bychom okamžitě přešli na stránku `post_detail` s nově vytvořeným příspěvkem, že ano? K tomu potřebujeme jeden další import:

```python
    from django.shortcuts import redirect
```    

Přidej to na samý začátek souboru. A nyní můžeš říci: Jdi na stránku `post_detail` s nově vytvořeným příspěvkem.

```python
    return redirect('blog.views.post_detail', pk=post.pk)
```  

`blog.views.post_detail` je název pohledu, na který chceme jít. Pamatuj si, že tento *view* vyžaduje proměnnou `pk`. Pro předání do view použijeme `pk=post.pk`, kde `post` je nově vytvořený příspěvek!

Už jsme si toho řekly hodně, ale pravděpodobně chceš vidět, jak nyní celý *view* vypadá nyní, nemám pravdu?

```python
    def post_new(request):
        if request.method == "POST":
            form = PostForm(request.POST)
            if form.is_valid():
                post = form.save(commit=False)
                post.author = request.user
                post.published_date = timezone.now()
                post.save()
                return redirect('blog.views.post_detail', pk=post.pk)
        else:
            form = PostForm()
        return render(request, 'blog/post_edit.html', {'form': form})
```    

Pojďme se podívat, jestli to funguje. Přejdi na stránku http://127.0.0.1:8000/post/new/, přidej `title` a `text`, ulož jej... a hle! Byl přidán nový příspěvek na blog a my jsme přesměrovány na stránku `post_detail`!

Možná jsi si všimla, že jsme nastavili proměnnou publish_date před uložením postu. Později si ukážeme *tlačítko Publikovat* v **Django girls tutorial: rozšíření**.

## Ověření formuláře

A teď ti ukážeme, jak cool jsou formuláře v Djangu. Blog příspěvek musí mít `title` a `text` pole. V našem modelu `Post` jsme neřekly (na rozdíl od `published_date`), že jsou tato pole nepovinná, takže Django ve výchozím nastavení očekává, že budou vyplněná.

Pokus se uložit formulář bez `nadpisu` a `textu`. Hádej, co se stane!

![Ověření formuláře][3]

 [3]: images/form_validation2.png

Django se stará o ověřování, že všechna pole v našem formuláři jsou správně. Není to skvělé?

> Jelikož jsme nedávno použily Django admin rozhraní, systém si v současné době myslí, že jsme přihlášeni. Existuje několik situací, které by mohly vést k našemu odhlášení (zavření prohlížeče, restartováním DB, atd.). Pokud při vytváření příspěvku dostaneš chybu, upozorňující na nepřihlášeného uživatele, zamiř na http://127.0.0.1:8000/admin a přihlas se znovu. Tím se dočasně vyřeší tento problém. Existuje trvalá oprava, která na tebe čeká v **domácím úkolu: zabezpeč svůj web!** v kapitole za hlavním tutorialem.

![Chyba přihlášení][4]

 [4]: images/post_create_error.png

## Upravit formulář

Teď víme, jak přidat nový formulář. Ale co když chceme upravit stávající? Je to velmi podobné tomu, co jsme před chvílí dělaly. Vytvoříme teď rychle některé důležité věci (pokud něčemu neporozumíš, měla bys požádat svého kouče nebo se podívat do předchozích kapitol, protože jsme již všechny tyto kroky probíraly).

Otevři `blog/templates/blog/post_detail.html` a přidej následující řádek:

```html
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```  

tak, aby šablona vypadala takto:

```html
    {% extends 'blog/base.html' %}
    {% block content %}
         <div class="post">
             {% if post.published_date %}
                 <div class="date">
                     {{ post.published_date }}
                 </div>
             {% endif %}
             <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
             <h1>{{ post.title }}</h1>
             <p>{{ post.text|linebreaksbr }}</p>
         </div>
    {% endblock %}
```  

V `blog/urls.py` přidej tento řádek:

```python
         url(r'^post/(?P<pk>[0-9]+)/edit/$', views.post_edit, name='post_edit'),
```  

Znovu použijeme šablonu `blog/templates/blog/post_edit.html`, takže jediné, co chybí, je *view*.

Otevři `blog/views.py` a přidej na samý konec souboru:

```python
    def post_edit(request, pk):
         post = get_object_or_404(Post, pk=pk)
         if request.method == "POST":
             form = PostForm(request.POST, instance=post)
             if form.is_valid():
                 post = form.save(commit=False)
                 post.author = request.user
                 post.published_date = timezone.now()
                 post.save()
                 return redirect('blog.views.post_d etail', pk=post.pk)
         else:
             form = PostForm(instance=post)
         return render(request, 'blog/post_edit.html', {'form': form})
```    

Vypadá to téměř úplně stejně jako náš view `post_new`. Ale ne zcela. Za prvé: máme navíc parametr `pk` z adresy URL. Za druhé: získáme model `Post`, který chceme upravit, pomocí `get_object_or_404 (Post, pk = pk)`. Když potom vytvoříme formulář, předáme tento post jako parametr `instance`, když ukládáme formulář:

```python
    form = PostForm(request.POST, instance=post)
```  

a když jsme otevřely formulář s tímto příspěvkem pro úpravu:

```python
    form = PostForm(instance=post)
```    

Ok, vyzkoušejme si, jestli to funguje! Pojďme na stránku `post_detail`. Tam by mělo být tlačítko Edit v pravém horním rohu:

![Tlačítko Upravit][5]

 [5]: images/edit_button2.png

Po klepnutí na něj se zobrazí formulář s naším příspěvkem:

![Upravit formulář][6]

 [6]: images/edit_form2.png

Neboj se změnit název nebo text a ulož změny!

Blahopřejeme! Tvoje aplikace je skoro kompletní!

Pokud potřebuješ více informací o Django formulářích, měla by sis přečíst dokumentaci: https://docs.djangoproject.com/en/1.8/topics/forms/

## Zabezpečení

Být schopná vytvářet nové příspěvky pouhým klepnutím na odkaz je super! Právě teď ale každý, kdo přijde na tvé stránky, je schopen odeslat nový příspěvek na blog a to asi nechceš. Udělejme to tak, že se tlačítko zobrazí tobě, ale nezobrazí se nikomu jinému.

V `blog/templates/blog/base.html` najdeš naši `page-header`, `div` a tag `a`, který jsme tam dali dříve. Řádek by měl vypadat nějak takto:

```html
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```  

Chceme přidat další `{% if %}` příkaz, který zajistí, že se odkaz zobrazí pouze pro uživatele, kteří jsou přihlášeni jako admin. Ve skutečnosti jsi jím pouze ty! Změň tag `< a >`, aby vypadal takto:

```html
    {% if user.is_authenticated %}
         <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
    {% endif %}
```  

Tento `{% if %}` způsobí, že odkaz bude odeslán do prohlížeče, pouze pokud je uživatel, který požaduje stránku, přihlášený. To zcela nezabrání možnosti vytvářet nové záznamy, ale je to dobrý první krok. Lepší zabezpečení vysvětlíme v rozšířené lekci.

Vzhledem k tomu, že jsi pravděpodobně přihlášená, neuvidíš žádnou změnu, pokud aktualizuješ stránku. Při načtení stránky v novém prohlížeči nebo anonymním okně se odkaz již neukáže!

## Ještě jedna věc: čas nasadit aplikaci!

Uvidíme, jestli to funguje na PythonAnywhere. Čas na další nasazení!

*   Za prvé commitni nový kód a pošli ho na Github

```
    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
```  

*   Pak v [Bash konzoli PythonAnywhere][7]:

 [7]: https://www.pythonanywhere.com/consoles/

```
    $ cd my-first-blog
    $ source myvenv/bin/activate
    (myvenv)$ git pull
    [...]
    (myvenv)$ python manage.py collectstatic
    [...]
```  

*   Nakonec skoč na [kartu Web][8] a klikni na **Reload**.

 [8]: https://www.pythonanywhere.com/web_app_setup/

A mělo by to být! Gratulujeme :)
