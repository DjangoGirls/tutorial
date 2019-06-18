# Àwọn dátà tó n ṣiṣẹ́ nínú àwọn àwòṣe (template)

A ní àwọn ohun oríṣiríṣi ní ipò: a ti ṣàlàyé àwòṣe `Post` náà nínú `models.py`, a ní `post_list` nínú `views.py` àti àwòṣe (template) náà ní àfikún. Ṣùgbọ́n báwo ni a ó ṣe mú àwọn àròkọ wa hàn nínú àwòṣe HTML wa? Nítorí pé ohun tí a fẹ́ ṣe nìyẹn – mú àwọn àkóónú (àwọn àwòṣe tí a tọ́jú sínú àkójọpọ̀ dátà náà) àti ṣàfihàn rẹ̀ lọ́nà tó dára nínú àwòṣe wa, àbí bẹ́ẹ̀ kọ?

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

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). Then we import the name of the model (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

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

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

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

Ṣé o fẹ́ ka díẹ̀ si nípa QuerySets nínú Django? Ó yẹ kí o wo ibí: https://docs.djangoproject.com/en/2.0/ref/models/querysets/