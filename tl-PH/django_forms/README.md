# Mga Form ng Django

Ang pinakahuling bagay na gusto nating gawin sa ating website ay ang paglikha ng magandang para para magdagdag at mag-edit ng mga post sa blog. Ang `admin ng Django` ay maganda, ngunit mahirap itong i-customize at pagandahin. Gamit ang mga `forms` magkakaroon tayo ng kapangyarihan sa ating interface - maari nating magawa ang kung ano man ang maisip natin!

Ang maganda tungkol sa mga form ng Django ay maari tayong maglikha mula sa wala o maglikha ng `ModelForm` na magsi-save sa mga resulta ng form sa iyong model.

Ito talaga ang gusto nating gawin: ang paglikha ng form para sa ating model na `Post`.

Gaya ng bawat importanteng parte ng Django, ang mga form ay mayroong sariling file: `forms.py`.

Kailangan nating maglikha ng file sa loob ng `blog` na directory na may ganitong pangalan.

    blog
       └── forms.py
    

OK, let's open it in the code editor and type the following code:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

We need to import Django forms first (`from django import forms`) and our `Post` model (`from .models import Post`).

Ang `PostForm`, gaya ng suspetsa mo, ay ang pangalan ng ating form. Kailangan nating sabihan si Django na ang form na ito ay isang `ModelForm` (kaya gagawin ni Django ang mahika para sa atin) - `forms.ModelForm` ay responsable para dito.

Sa sunod, meron tayong `class Meta`, kung saan sasabihan natin si Django kung alling model ang dapat gagamitin sa paglikha ng form na ito (`model = Post`).

Sa wakas, pipiliin natin kung aling mga field ang dapat nasa form natin. Sa senaryo na ito, gusto lang natin na ipakita ang `pamagat` at `teksto` - `ang may-akda` ay dapat ang taong naka login (ikaw!) at ang `created_date` ay dapat awtomatikong na-set habang naglilikha tayo ng post (iyan ay sa loob ng code), di ba?

At yan na! Ang kailangan nalang natin gawin ngayon ay ang paggamit ng form sa loob ng *view* at i-display ito sa loob ng template.

Sa makaisa pa, gagawa tayo ng link papunta sa page, sa URL, sa view at sa template.

## I-link sa isang page na may mga form

It's time to open `blog/templates/blog/base.html` in the code editor. In the `div` named `page-header`, we will add a link:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Paalala na gusto nating tawagin ang ating bagong view na `post_new`. Ang class na `"glyphicon glyphicon-plus"` ay handa na sa pamamagitang ng bootstrap theme na ginagamit natin, at magdidisplay ito ng plus sign para sa atin.

Pagkatapos maidagdag ang linya, ang iyong HTML file ay maging kagaya nito:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
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

After saving and refreshing the page http://127.0.0.1:8000 you will see a familiar `NoReverseMatch` error. Is that the case? Good!

## URL

We open `blog/urls.py` in the code editor and add a line:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

At ang katapusang code ay maging ganito:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path 
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

Pagkatapos mag-refresh sa site, makikita natin ang `AttributeError`, ito ay dahil wala pa tayong `post_new` na view na nagawa. Ating idagdag ito ngayon.

## post_new view

Time to open the `blog/views.py` file in the code editor and add the following lines with the rest of the `from` rows:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

At ang atin ding *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Para makalikha ng bagong form na `Post`, kailagan nating tawagin ang `PostForm()` at ipasa ito sa mga template. Babalikan natin ang *view* na ito, pero sa ngayon, gagawa tayo ng madaliang template para sa ating form.

## Template

We need to create a file `post_edit.html` in the `blog/templates/blog` directory, and open it in the code editor. To make a form work we need several things:

* We have to display the form. We can do that with (for example) {% raw %}`{{ form.as_p }}`{% endraw %}.
* Ang linya sa itaas ay kailangang nakabalot sa HTML form na tag: `<form method="POST">...</form>`.
* Kailangan natin ng `Save` na button. Magagawa natin ito gamit ang HTML button: `<button type="submit">Save</button>`.
* At sa wakas, pagkatapos na opening na `<form ...>` tag, kailangan nating idagdag ang {% raw %}`{% csrf_token %}`{% endraw %}. Ito ay napakahalaga, dahil ginawa nitong matatag ang iyong mga form! Kung nakalimutan mo ang parte na ito, magsusumbong si Django kung susubukan mong i-save ang form:

![CSFR Forbidden page](images/csrf2.png)

Sige, tingnan natin kung ano dapat ang hitsura ng HTML sa `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

Oras na para mag-refresh! Yay! Nakadisplay na ang ating form!

![Bagong form](images/new_form2.png)

Pero, teka muna! Kung mag-type ka sa `pamagat` at `teksto` na mga field at subukang i-save, ano ang mangyari?

Wala! Tayo ay babalik sa parehong pahina at nawala ang ating tekso... at walang bagong post ang nadagdag. Kaya saan nagkaproblema?

Ang sagot ay: wala. May kailangan lang tayong gawin sa ating *view*.

## Nagsisave ng form

Open `blog/views.py` once again in the code editor. Currently all we have in the `post_new` view is the following:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Kung nagpasa tayo ng form, dadalhin tayo pabalik sa parehong view, pero ngayon may mga karagdagang mga datos na sa ating `request`, para mas maging partikular sa loob ng `request.POST` (ang pagkakapangalan ay walang kinalaman sa blog "post"; ito ay dahil tayo ay nagpopost ng data). Tandaan kung paano sa loob ng HTML file, ang ating `<form>`pagbigay kahulugan ay mayroong variable na `method="POST"`? Lahat ng mga field galing sa form ay nasa `request.POST` na. Hindi mo dapat baguhin ang pangalan ng `POST` sa kahit ano (ang isa pang balidong value para sa `method` ay si `GET`, pero wala na tayong oras para ipaliwanag ang kaibahan).

Kaya sa ating *view* mayroon tayong hiwalay ng mga sitwasyon na dapat kailangang gawin: una, kung bibisitahin natin ang pahina sa unang beses at gusto natin na walang laman ang form, at pangalawa, kung gusto nating bumalik sa *view* na may laman nang lahat na na-type natin. Kaya kailangan nating magdagdag ng kondisyon (gagamit tayo ng `if` para dito):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

Oras na para gawin ang mga dots `[...]`. Kung ang `method` ay `POST`, gusto nating gawin ang `PostForm` na may lamang datos galing sa form, tama ba? Gagawin natin ito gaya ng sumunod:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

The next thing is to check if the form is correct (all required fields are set and no incorrect values have been submitted). We do that with `form.is_valid()`.

Susuriin natin ang form kung ito ay balido, para ma-save natin!

{% filename %}blog/views.py{% endfilename %}

```python
{% filename %}blog/views.py{% endfilename %}
```

Pangunahin na, mayroon tayong dalawang bagay dito: i-save natin ang form gamit ang `form.save` at magdagdag ng may-akda (dahil wala tayong `may-akda` na field sa `PostForm` at ang field na ito ay kinakailangan. Ang ibig sabihin ng `commit=False` ay hindi muna natin gustong i-save ang model na `Post` - magdagdag muna tayo ng may-akda. Kadalasan gagamit ka ng `form.save()` na walang `commit=False`, pero sa ngayon, kailangan natin itong idagdag. Ang `post.save()` ay magiimbak sa mga pagbabago (magdagdag ng may-akda) at ang bagong blog post at nilikha!

Sa wakas, mas maganda kung tayo ay makakapunta ng direkta sa ating `post_detail` na pahina para sa ating bagong nalikha na blog post, tama ba? Para gawin ito, kailangan natin ng isa pang import:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

Idagdag ito sa pinakasimula ng file. At ngayon pede nating sabihin na, "pumunta sa `post_detail` na pahina para sa kakalikhang post":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` ang pangalan sa view na gusto nating puntahan. Tandaan na ang *view* na ito ay nangangailangan ng `pk` na variable? Para mapasa ito sa ating mga view, gagamit tayo ng `pk=post.pk`, kung saan ang `post` at ang kakalikha lang na blog post!

Sige, dami na nating sinabi, ngunit gusto siguro nating makita ang kung naano na ang kabuoang *view* ngayon, tama ba?

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

Tingnan natin kung gumana ba. Pumunta sa pahina na http://127.0.0.1:8000/post/new/, magdagdag ng `pamagat` at `teksto`, i-save ito... at tingnan! Ang bagong blog post ay nadagdag na at tayo ay pinasa sa `post_detail` na pahina!

Siguro ay napansin mo na nag-set muna tayo ng paglathala na petsa bako tayo nag-save ng post. Maya-mata, aming ianunsyo ang *publish na button* sa **Django Girls Tutorial: Extensions**.

Yan ay kasindak-sindak!

> Dahil bago lang natin ginamit ang interface ng Django admin, inisip ng sistema na tayo ay nakalog-in pa. Mayroong mga sitwasyon na magresulta sa ating paglog-out (nasara ang browser, na-restart ang DB, at iba pa). Kung, gagawa ng post, at napansin mo na may mga problema tungkol sa walang nakalog-in na user, pumunta sa admin page na http://127.0.0.1:8000/admin at maglog-in ulit. Ito ay panandaliang mag-ayos sa problema. May permanenteng solusyong na nag-aabang sa iyo sa **Gawaing Bahay: magdagdag ng seguridad sa iyong website!** na kabanata pagkatapos ng pangunahing tutorial.

![May problema sa paglog-in](images/post_create_error.png)

## Pagpapabalido ng Form

Ngayon, ipapakita namin kung gaano kahusay ang mga form ng Django. Ang blog post ay kinakailangan na mayroon `pamagat` at `teksto` na mga field. Sa ating `Post` na model, hindi natin sinabi na ang mga field na ito (kumpara sa `published_date` ay hindi kinakailangan, kaya si Django ay umaasa na naka-set ang mga ito.

Subukang i-save ang form na walang `pamagat` at `teksto`. Hulaan kung ano ang mangyari!

![Pagpapabalido ng Form](images/form_validation2.png)

Si Django ay sinisuguro na ang lahat ng field sa ating form ay tama. Kagilas-gilas di ba?

## I-edit ang form

Now we know how to add a new post. Ngunit paano kung gusto natin i-edit ang umiiral na? Ito ay parehong-pareho lang sa ginawa natin kanina. Gagawa tayo ng mga importanteng bagay nang mabilisan. (Kung meron kang bagay na hindi maiintindihan, magtanong sa iyong taga sanay o hanapin sa nakalipas na mga kabanata, yamang atin ng napag-aralan and mga hakbang na ito.)

Open `blog/templates/blog/post_detail.html` in the code editor and add the line

{% filename %}blog/templates/blog/post/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

nang sa gayon ang template ay magmumukhang ganito:

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
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

Open `blog/urls.py` in the code editor, and add this line:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

Gagamitin natin uli ang template na `blog/templates/blog/post_edit.html`, kaya ang kulang nalang natin ay ang *view*.

Let's open `blog/views.py` in the code editor and add this at the very end of the file:

{% filename %}blog/views.py{% endfilename %}

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
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

Ito ay halos kapareho sa ating `post_new` na view, di ba? Pero hindi talaga lubos. For one, we pass an extra `pk` parameter from `urls`. Sa sunod, kukunin natin ang `Post` model na gusto nating i-edit gamit ang `get_object_or_404(Post, pk=pk)` at pagkatapos, sa paglikha ng form, ipasa natin ang post na ito isip `instance`, pareho sila sa pag-save natin sa form…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

... at pagkatapos nating buksan ang form gamit ang post to edit:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

Sige, tingnan natin kung gumana ba! Puntahan natin ang `post_detail` na pahina. Dapat mayroon itong edit na button sa kaliwang itaas:

![Edit na button](images/edit_button2.png)

Pag-click mo nito makikita mo ang blog post sa ating form:

![I-edit ang form](images/edit_form2.png)

Huwag mag-atubiling magpalit ng pamaga at tesko at i-save ang mga pagbabago!

Binabati ko kayo! Ang iyong application ay unti-unti nang nakompleto!

If you need more information about Django forms, you should read the documentation: https://docs.djangoproject.com/en/2.2/topics/forms/

## Seguridad

Being able to create new posts by clicking a link is awesome! Pero sa ngayon, kung sinuman ang bumisita sa iyong site ay maaring maglikha ng bagong blog post, at yan ang hindi mo siguro gustong mangyari. Gawin natin ito na ang button ay makikita mo lang pero hindi sa ibang tao.

Open `blog/templates/blog/base.html` in the code editor, find our `page-header` `div` and the anchor tag you put in there earlier. It should look like this:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

Magdadagdag tayo ng isa pang `{% if %}` na tag dito, at ang link ay makikita lamang ng mga gumagamit na naka log-in sa admin. Sa ngayon, ikaw palang! Palitan ang `<a>` na tag para maging kagaya nito:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

Ang `{% if %}` ay maging sanhi na ang link ay ipapadala sa browser kung ang gumamit na humingi sa pahina ay nakalog-in. Hindi ito nagproprotekta sa paglikha ng mga bagong posts, pero maganda na itong hakbang. Tatalakayin natin ang karamihan sa mga seguridad doon sa extention na mga klase.

Natandaan mo ba ang edit na icon na kakadagdag lang natin sa pahina na detalye? Gusto din nating magdagdag ng kaparehang pagbabago dito. Para ang ibang tao ay hindi maaring mag-edit ng umiiral na mga post.

Open `blog/templates/blog/post_detail.html` in the code editor and find this line:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

Palitan ito ng ganito:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

Dahil maari kang nakalog-in, kung i-refresh mo ang pahina, wala kang makikitang kakaiba. I-load ang page sa ibang browser or sa window na naka incognito (tinanatawag na "InPrivate" sa Windows Edge), bagaman, at makikita mo ang linki ay hindi makikita, at ang icon ay wala din!

## May isang bagay pa: oras na para mag-deploy!

Tingnan natin kung gagana ito sa PythonAnywhere. Oras na para gumawa ng isa pang pag-deploy!

* First, commit your new code, and push it up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* Pagkatapos, sa loob ng [PythonAnywhere na Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it! Congrats :)