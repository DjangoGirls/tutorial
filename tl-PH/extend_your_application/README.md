# Patagalin pa ang iyong application

Nakumpleto na natin ang lahat ng iba't ibang hakbang na kinakailangan para sa paglikha ng ating website: alam na natin kung paano ang pagsulat ng isang model, url, view at template. Alam na rin natin kung paano pagandahin ang ating website.

Oras na para mag-ensayo!

Ang unang bagay na kailangan natin sa ating blog ay, malinaw naman na, isang page para ipakita ang isang post, hindi ba?

Mayroon na tayong isang `Post` na modelo, kaya hindi na natin kailangang magdagdag ng kahit ano pa sa `models.py`.

## Gumawa ng isang template sa detalye ng isang post

Magsimula tayo sa pamamagitan ng pagdagdag ng link sa loob na `blog/templates/blog/post_list.html` na file. Dapat itong maging kagaya nito: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

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
{% endblock %}
```

{% raw %} Gusto natin magkaroon ng lnk mula sa pamagat ng post sa ating listahan ng mga post papunta sa detalye na pahina ng post. Baguhin natin ang `<h1><a href="">{{ post.title }}</a></h1>` para maglink ito sa detail page ng post: {% endraw %}

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<h1><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h1>
```

{% raw %} Oras na para ipaliwanag ang misteryosong `{% url 'post_detail' pk=post.pk %}`. Gaya ng suspetsa mo, ang `{% %}` na notasyon na ang ibig sabihin ay gumagamit tayo ng template tags ni Django. Sa oras na ito gagamit tayo ng isa pa na maglikha ng url para sa atin!{% endraw %}

Ang `post_detail` na parte ay nangahulugang ang Django ay nag-antabay ng URL sa `blog/urls.py` na may pangalang=post_detail

At paano na ang tungkol sa `pk=post.pk`? Ang `pk` ay ang pinaikling anyo ng primary key, na isang bugtong na pangalan para sa bawat rekord na nasa database. Dahil hindi natin gustong magtakda ng primary key sa ating `Post` na model, si Django ay gagawa para sa atin (ang default, ay isang numero na lumalaki ng isa sa bawat rekord, i.e. 1, 2, 3) at magdagdag nito isip field na may pangalang `pk` para sa bawat post natin. Ma-access natin ang primary key sa pamamagitan ng pagsulat ng `post.pk`, katulad ng pag-access natin sa ibang mga field na (`title`,`author`, etc.) sa ating `Post` na object!

Ngayon, puntahan natin ang http://127.0.0.1:8000/ kung sa magkaroon tayo ng error (gaya ng iniasahan, dahil wala pa tayong URL o ang *view* para sa `post_detail`). Maging kagaya ito nito:

![NoReverseMatch error](images/no_reverse_match2.png)

## Maglikha ng URL para sa detalye ng post

Maglikha tayo ng URL sa `urls.py` para sa ating `post_detail` na *view*!

Gusto natin ang ating kaunaunahang detalye ng post na mapakita sa **URL** na ito: http://127.0.0.1:8000/post/1/

Gagawa tayo ng URL sa loob ng `blog/urls.py` na file na magtuturo kay Django sa *view* na pinangalanang `post_detail`, na magpapakita sa buong blog post. Idagdag ang linyang `url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),` sa `blog/urls.py` na file. Ang file ay dapat maging katulad nito:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
]
```

Ang parteng ito `^post/(?P<pk>\d+)/$` ay mukhang nakakatakot, ngunit huwag mag-alala - ipapaliwanag namin yan sa iyo:

- ito ay nagsisimula sa `^` uulitin ko - "ang simula".
- Ang `post` ay nangangahulugang pagkatapos ng simula, ang URL ay dapat naglalaman ng salitang **post** at ang **/**. Sa ngayon, mabuti naman.
- `(?P<pk>\d+)` – ang parteng ito ay mas mapandaya. Ibig sabihin ang Django ay kukunin ang lahat ng nilagay mo dito at ilipat ito sa view isip isang variable na tinatawag na `pk`. (Tandaan na ito ay tumugma sa pangalan na binigay natin sa primary key na variable sa ating `blog/templates/blog/post_list.html`!) Ang `\d` ay nagsasabi din sa atin na ito ay maaring numero lamang, hindi isang letra (lahat ng nasa pagitang ng 0 at 9). Ibig sabihin ng `+` ay kailangang merong isa or higit pa na mga numero doon. Kaya ang gaya ng `http://127.0.0.1:8000/post//` ay hindi tama, ngunit ang `http://127.0.0.1:8000/post/1//234567890/` ay tamang-tama!
- `/` - pagkatapos kailangan natin ng **/** uli.
- `$` - "ang wakas"!

Ibig sabihin nito, kung maglagay ka ng `http://127.0.0.1:8000/post/5/` sa iyong browser, maiintindihan ni Django na ikaw ay naghahanap ng *view* na tinatawag na `post_detail` at maglipat ng impormasyon na ang `pk` ay katumbas ng `5` sa *view* na iyan.

OK, nagdagdag na tayo ng bagong URL pattern sa `blog/urls.py`! I-refresh natin ang pahina: http:://127.0.0.1:8000. Yun! Ang server ay huminto na naman. Tingnan ang console - gaya ng inaasahan, may ibang error na naman!

![AttributeError](images/attribute_error2.png)

Naalala mo ba kung ano ang sunod na hakbang nito? Siyempre: ang pagdagdag ng view!

## Magdagdag ng view para sa detalye ng post

Sa oras na ito, ang *view* natin ay binigyan pa ng isa pang parameter, `pk`. Ang *view* natin ay dapat sasalo nito, di ba? Kaya ating i-define ang ating function isip `def post_detail(request, pk):`. Tandaan na kailangan nating gamitin ang parehong pangalan na nilagay natin sa mga url (`pk`). Ang pagtanggal sa variable na ito ay mali at magresulta sa isang error!

Ngayon, gusto nating kumuha ng isa at isa lang na blog post. Para gawin ito, maari tayong gumamit ng mga queryset, gaya nito:

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)
```

Ngunit ang code na ito ay may problema. Kung walang `Post` na may nakatugmang `primary key` (`pk`), magkakaroon ng tayo ng lubhang pangit na error!

![DoesNotExist na error](images/does_not_exist2.png)

Hindi natin gusto ito! Pero, siyempre, kasama ng Django ang isang bagay na mag-aayos nito para sa atin: `get_object_or_404`. Kung walang `Post` na tugma sa `pk`, magpapakita ito na mas magandang pahina, ang `Page Not Found 404` na pahina.

![Hindi mahanap ang pahina](images/404_2.png)

Ang magandang balita ay maari tayong maglikha ng ating sariling `Page not found` na pahina at gawing maganda ito ayon sa gusto mo. Pero hindi ito lubhang importante sa ngayon, kaya lalaktawan lang natin ito.

Sige, oras na para magdagdag ng *view* sa ating <0>views.py</code> na file!

Sa `blog/urls.py`, gumawa tayo ng URL na patakaran na pinangalanang `post_detail` na tumutukoy sa view na tinatawag na `views.post_detail`. Ibig sabihin na si Django ay umaasa na may view na function na tinatawag na `post_detail` sa loob ng `blog/views.py`.

Dapat nating buksan ang `blog/views.py` at idagdag ang sumunod na mga code malapit sa ibang `from` na mga linya:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

At sa pinakadulo ng file, idadagdag natin ang ating *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Oo. Oras na para i-refresh ang pahina: http://127.0.0.1:8000/

![View ng Post list](images/post_list2.png)

Gumana ito! Pero ano ang mangyari kapag nagclick ka sa link sa pamagat ng blog post?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Naku! Ibang error na naman! Pero alam na natin kung paano ayusin ito, di ba? Kailangan nating magdagdag ng template!

## Gumawa ng template para sa mga detalye ng post

Gagawa tayo ng file sa `blog/templates/blog` na tinatawag na `post_detail.html`.

Maging kagaya ito nito:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

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

Sa makaisa pa, tayo ay nag-extend sa `base.html`. Sa loob ng `content` na block, gusto nating ipakita ang publish_date ng post (kung meron), pamagat at teksto. Pero dapat nating pag-usapan ang mga importanteng mga bagay, tama ba?

{% raw %}`{% if ... %} ... {% endif %}` ay isang template tag na magagamit natin kung may gusto tayong tingnan. (Tandaan na ang `if ... else ..` mula sa **Introduksyon sa Python** na kabanata?) Sa senaryong ito, gusto nating tingnan kung ang `published_date` ng post ay mayroon laman.{% endraw %}

Sige, maari nating i-refresh ang ating pahina at tingnan kung wala na ang `TemplateDoesNotExist`.

![Pahina ng detalye ng post](images/post_detail2.png)

Yay! Gumana ito!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Pagkatapos sa [PythonAnywhere na Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-username>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-username>` with your actual PythonAnywhere username, without the angle-brackets).

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}command-line{% endfilename %}

    $ workon <your-pythonanywhere-username>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the [Web tab](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload**.

And that should be it! Congrats :)