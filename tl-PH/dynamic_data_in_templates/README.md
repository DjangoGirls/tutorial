# Mga dynamic na datos sa mga template

Mayroon tayong iba-ibang piraso na nakaposisyon: ang `Post` na model na nakadefine sa `models.py`, ang `post_list` sa `views.py` at ang template na dinagdag. Ngunit paano natin gawin na mapakita ang ating mga post sa ating HTML template? Dahil yan ang gusto nating gawin - kumuha ng mga nilalaman (mga model nakasave sa database) at ipakita itong mabuti sa ating template, di ba?

Ito ang eksaktong dapat gawain ng *views*: magkonek sa mga model at mga template. Sa ating `post_list` na *view*, kailangan nating kunin ang mga model na gusto nating i-display at ipasa ang mga ito sa ating template. Sa *view* pagpasyahan natin kung anong model ang idisplay sa template.

Sige, kaya paano natin magagawa ito?

We need to open our `blog/views.py` in our code editor. So far `post_list` *view* looks like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Naalala mo iyong pinag-usapan natin ang tungkol sa pag-include na mga code na naisulat sa iba-ibang mga file? Ngayon na ang oras na kailangan nating i-include ang ating model na sinulat sa `models.py`. Magdagdag tayo ng linya na `from .models import Post` gaya nito:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Ang ibig sabihin ng tuldok bago ang `models` ay *kasalukuyang directory* o *kasalukuyang aplikasyon*. Ang `views.py` at `models.py` ay parehong nasa kagayang directory. Ibig sabihin nito, maari tayong gumamit ng `.` at ang pangalan ng file (na walang `.py`). Pagkatapos i-import natin ang pangalan ng model na (`Post`).

Pero ano ang kasunod? Para makuha ang tunay na blog post mula sa `Post` na model, kailangan natin ang tinatawag na `QuerySet`.

## QuerySet

Dapat kabisado mo na kung paano gumagana ang QuerySets. Napag-usapan na natin ang tungkol dito sa [Django ORM (QuerySets) na kabanata](../django_orm/README.md).

Ngayon, gusto natin na ang nalathala na mga blog posts ay nasuri ayon sa pagkasunod-sunod ng `published_date`, tama ba? Nagawa na natin ito sa QuerySets na kabanata!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

So, let's open the `blog/views.py` file in the code editor, and add this piece of code to the function `def post_list(request)` -- but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

To display our QuerySet on our blog's post list, we have two things left to do:

1. Pass the `posts` QuerySet to the template context, by changing the `render` function call. We'll do this now.
2. Modify the template to display the `posts` QuerySet. We'll cover this in a later chapter.

Tandaan na naglikha tayo ng *variable* para sa ating QuerySet: `posts`. Isipin itong pangalan ng ating QuerySet. Simula ngayon, tatawagin natin ito sa pamamagitan ng pangalan na ito.

Sa `render` na function mayroon tayong isang parameter na `request` (lahat ng natanggap natin mula sa user sa pamamagitan ng Internet) at isa pa na nagbigay ng template file (`'blog/post_list.html'`). Ang pinakahuling parameter, `{}`, ay lugar kung saan maari tayong magdagdag ng mga bagay para magamit ng ating template. Kailangan natin silang bigyan ng pangalan (sa ngayon `'posts'` pa rin ang gagamitin natin). :) Dapat itong maging kagaya nito: `{'posts': posts}`. Tandaan na ang parte bago ang `:` ay isang string; dapat itong nakabalot sa mga panipi: `"`.

Sa wakas ang ating `blog/views.py` na file ay maging kagaya nito:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Ayun na! Oras na para bumalik sa aming template at ipakita itong QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/