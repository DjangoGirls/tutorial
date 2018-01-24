# Template içinde dinamik veri

Birkaç parçayı yerine oturttuk: `Post` (gönderi) modelini `models.py`'de tanımladık, `views.py`'de `post_list` (gönderi listesi) var ve template ekledik. Ama gönderilerimizi HTML'de görünür kıldık mı? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

Bu tam olarak *view*'lerin yapmasını beklediğimiz şey: modelleri ve template'leri bağlamak. In our `post_list` *view* we will need to take the models we want to display and pass them to the template. *view* ile şablon içinde neyin (hangi modelin) gösterileceğine karar veriyoruz.

Tamam, peki nasıl yapacağız?

`blog/views.py`'ı açacağız. Şu anda `post_list` *view*ü şöyle:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Kodları farklı dosyalara eklemekten bahsettiğimizi hatırlıyor musunuz? Şu an `models.py` içinde yazdığımız modeli kullanma zamanı. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

`models`'dan önceki nokta, *mevcut dizin* veya *mevcut uygulama* anlamına geliyor. Hem `views.py` hem de `models.py` aynı dizindedir. Bu şu anlama geliyor: `.` ve dosya ismini (`.py` olmadan) kullanabiliriz. Arkasından modelin adını (`Post`)'u dahil ediyoruz (import ediyoruz).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet (Sorgu Seti)

QuerySets çalışma şeklinde bir fikir sahibi olmuşsunuzdur. [Django ORM (QuerySets) chapter](../django_orm/README.md) içinde bu konudan bahsetmiştik.

Şimdi yayınlanmış ve `published_date`'e (yayınlanma tarihine) göre sıralanmış bir gönderi listesi istiyoruz, değil mi? Bunu QuerySets bölümünde yapmıştık zaten!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(yayinlanma_tarihi__lte=timezone.now()).order_by('yayinlanma_tarihi')
```

Şimdi `blog/views.py` dosyası içindeki bu kodu `def post_list(request)` fonksiyonu ekleyin ama öncelikle `from django.utils import timezone` eklemeyi unutmayın:

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

QuerySet'imiz için bir *değişken* yarattığımıza dikkat edin: `posts`. Bu QuerySet'in ismi. Bundan sonra ondan ismi ile bahsedebiliriz.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. Bunlara isimler vermemiz gerekiyor (`'posts'` ismini kullanmaya devam edeceğiz şimdilik). :) Şöyle olması lazım: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

Nihayetinde `blog/views.py` şu şekle gelmiş olmalı:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

İşte bu kadar! Template'e geri gidip QuerySet'leri görünür hale getirme zamanı!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/1.11/ref/models/querysets/