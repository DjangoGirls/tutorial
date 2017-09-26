# Dane dynamiczne w szablonach Django

Sporo rzeczy jest już na swoim miejscu: model `Post` jest zdefiniowany w `models.py`, w `views.py` mamy `post_list`, szablon też już gotowy. Ale jak to zrobić, aby nasze wpisy pojawiały się w szablonie HTML? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

Dokładnie do tego przydadzą nam się *widoki*: do połączenia modeli i szablonów między sobą. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

Musimy otworzyć nasz plik `blog/views.py`. Jak dotąd *widok* `post_list` wygląda następująco:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Pamiętasz, jak rozmawiałyśmy o dołączaniu kodu zapisanego w odrębnych plikach? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

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

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

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

Zauważ, że tworzymy *zmienną* dla naszego QuerySetu: `posts`. Potraktuj ją jako nazwę naszego QuerySetu. Od tej pory będziemy odnosić się do niej tylko za pomocą tej nazwy.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Zatem ostatecznie nasz plik `blog/views.py` powinien wyglądać następująco:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

I to wszystko! Czas, żebyśmy wróciły do naszego szablonu i wyświetliły ten QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/1.9/ref/models/querysets/