# Django views – je čas začít tvořit!

Nejdříve se musíme zbavit chyb, které jsme vytvořily v předchozí kapitole :)

*View* je místo, kam píšeme "logiku" naší aplikace. Bude požadovat informace z `modelu`, který jsi vytvořila dříve, a předá je `šabloně`. Šablonu vytvoříme v příští kapitole. View jsou vlastně jen Python funkce, které jsou o trochu složitější než funkce z kapitoly **Úvod do Pythonu**.

View se dávají do souboru `views.py`. My si teď přidáme naše vlastní *view* do souboru `blog/views.py`.

## blog/views.py

OK, pojďme otevřít tento soubor a podívat se, co tam je:

```python
    from django.shortcuts import render

    # Create your views here.
```  

Zatím zde není příliš informací. Nejjednodušší *view* může vypadat následovně.

```python
    def post_list(request):     
        return render(request, 'blog/post_list.html', {})
```  

Jak vidíš vytvořily, jsme metodu (`def`) nazvanou `post_list`, která přebírá `request`(žádost) a `return` (vrací) metodu `render`, která bude vykreslovat naši šablonu `blog/post_list.html`.

Ulož soubor, přejdi na http://127.0.0.1:8000/ a podívej se, co se nám nyní zobrazí.

Další chyba! Přečti si, co je špatně nyní:

![Error][1]

 [1]: images/error.png

Je to jednoduché: *TemplateDoesNotExist*. Musíme opravit tuto chybu a v následující kapitole vytvořit šablonu!

> Další informace ohledně Django views získáš v oficiální dokumentaci na: https://docs.djangoproject.com/en/1.8/topics/http/views/
