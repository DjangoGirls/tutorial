# Àwọn dátà tó n ṣiṣẹ́ nínú àwọn àwòṣe (template)

A ní àwọn ohun oríṣiríṣi ní ipò: a ti ṣàlàyé àwòṣe `Post` náà nínú `models.py`, a ní `post_list` nínú `views.py` àti àwòṣe (template) náà ní àfikún. Ṣùgbọ́n báwo ni a ó ṣe mú àwọn àròkọ wa hàn nínú àwòṣe HTML wa? Nítorí pé ohun tí a fẹ́ ṣe nìyẹn – a fẹ́ mú àkóónú kan (àwọn àwòṣe tí a tọ́jú sínú àkójọpọ̀ dátà náà) láti ṣàfihàn rẹ̀ lọ́nà tó dára nínú àwòṣe wa, àbí bẹ́ẹ̀ kọ?

Èyí jẹ́ ohun tó yẹ kí àwọn *view* máa ṣe: ṣe ìsopọ̀ àwọn àwòṣe (models) àti àwọn àwòṣe (templates). Nínú *view* `post_list` wa, a máa nílò láti mú àwọn àwòṣe (model) tí a fẹ ṣàfihàn náà kí a sì darí wọn sí àwòṣe (template) náà. Nínú *view* kan, a máa pinnu ohun (àwòṣe - model) tí yíò hàn nínú àwòṣe (template) kan.

Ó dáa, báwo wá ni a ṣe lè ṣe èyí?

A nílò láti ṣí `blog/views.py` wa nínú olóòtú kóòdù wa. Títí di báyìí, *view* `post_list` rí báyìí:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Rántí ìgbà tí a sọ̀rọ̀ nípa ṣíṣe àfikún kóòdù tí a kọ ní àwọn fáìlì mìíràn? Àkókò ti tó báyìí tí a ní láti ṣàfikún àwòṣe tí a ti kọ nínú `models.py`. A máa ṣàfikún ìlà `from .models import Post` náà báyìí:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

Àmì tó-ín (dot) tó wà níwájú `models` túmọ̀ sí *àkójọpọ̀ fáìlì lọ́wọ́lọ́wọ́* tàbí *ètò lọ́wọ́lọ́wọ́*. `views.py` àti `models.py` wà nínú àkójọpọ̀ fáìlì kannáà. Èyí túmọ̀ sí pé a lè lo `.` àti orúkọ fáìlì náà (láìsí `.py`). Lẹ́yìn náà, a máa ṣàgbéwọlé orúkọ àwòṣe náà (`Post`).

Ṣùgbọ́n kí ló kàn? Láti mú àwọn àròkọ blog láti àwòṣe `Post` náà, a nílò nnkan kan tí a n pé ní `QuerySet`.

## QuerySet

Ó yẹ kí o ti mọ̀ nípa bí QuerySets ṣé n ṣiṣẹ́. A ti sọ̀rọ̀ nípa wọn nínú [àkòrí Django ORM (QuerySets)](../django_orm/README.md).

Ní báyìí, a fẹ́ ṣètò àwọn àròkọ blog tí a ṣàtẹ̀jáde nípasẹ̀ `published_date` (ọjọ́ títẹ̀jáde), àbí bẹ́ẹ̀ kọ? A ti ṣe ìyẹn tẹ́lẹ̀ nínú àkòrí QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Nítorí náà, jẹ́ ká ṣí fáìlì `blog/views.py` nínú olóòtú kóòdù náà, kí a sì ṣàfikún abala kóòdù yìí sí iṣẹ́ `def post_list(request)` náà -- ṣùgbọ́n má gbàgbé láti kọ́kọ́ ṣàfikún `from django.utils import timezone`:

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

Jọ̀wọ́ ṣàkíyèsí pé a ṣẹ̀dá *variable* kan fún QuerySet wa: `posts`. Mú èyí gẹ́gẹ́ bí orúkọ QuerySet wa. Láti àkókò yíì lọ, a lè tọ́ka sí i nípasẹ̀ orúkọ yìí.

Nínú iṣẹ́ `render` náà, a ní parameter `request` kan (gbogbo nnkan tí a gbà láti ọ̀dọ̀ aṣàmúlò náà nípasẹ̀ Íńtánẹ́ẹ̀tì) àti òmíràn tó n fúnni ní fáìlì àwòṣe (template) náà (`'blog/post_list.html'`). Parameter ìkẹyìn náà, `{}`, jẹ́ ààyè kan tí a ti lè ṣàfikún àwọn nnkan mìíràn fún àwòṣe (template) náà láti lò. A nílò láti fún wọn ní orúkọ (a óò fara mọ́ `'posts'` lọ́wọ́lọ́wọ́). :) Ó yẹ kó rí báyìí: `{'posts': posts}`. Jọ̀wọ́ ṣàkíyèsí pé apá tó wà níwájú `:` jẹ́ fọ́nrán (string) kan; o nílò láti wé e pẹ̀lú àwọn àmì àyọlò: `''`.

Ní ìparí, ó yẹ kí fáìlì `blog/views.py` wa rí báyìí:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

Ó parí! Àkókò láti padà sí àwòṣe (template) wa àti ṣàfihàn QuerySet yìí!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/