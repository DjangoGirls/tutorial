# Template içinde dinamik veri

Birkaç parçayı yerine oturttuk: `Post` (gönderi) modelini `models.py`'de tanımladık, `views.py`'de `post_list` (gönderi listesi) var ve template ekledik. Ama gönderilerimizi HTML'de görünür kıldık mı? Çünkü yapmak istediğimiz şey bu -bazı içerikleri (veritabanında kayıtlı modeller) al ve şablonumuzda göster, değil mi?

Bu tam olarak *view*'lerin yapmasını beklediğimiz şey: modelleri ve template'leri bağlamak. `post_list` *view* 'ımızda göstermek istediğimiz modelleri alıp template'e iletmemiz gerekecek. *view* ile template içinde neyin (hangi modelin) gösterileceğine karar veriyoruz.

Tamam, peki nasıl yapacağız?

`blog/views.py`'ı açacağız. Şu anda `post_list` *view*'ı şöyle:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Kodları farklı dosyalara eklemekten bahsettiğimizi hatırlıyor musunuz? Şu an `models.py` içinde yazdığımız modeli kullanma zamanı. `from .models import Post` şeklinde bir satır ekleyeceğiz:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

`models`'dan önceki nokta, *mevcut dizin* veya *mevcut uygulama* anlamına geliyor. Hem `views.py` hem de `models.py` aynı dizindedir. Bu şu anlama geliyor: `.` ve dosya ismini (`.py` olmadan) kullanabiliriz. Arkasından modelin adını (`Post`)'u dahil ediyoruz (import ediyoruz).

Sırada ne var? `Post` modelinden gerçek blog gönderilerini almak için `QuerySet` denilen sorgu setine ihtiyacımız var.

## QuerySet (Sorgu Seti)

QuerySet'in nasıl çalıştığı konusunda bir fikriniz oluşmuştur. [Django ORM (QuerySets) bölümü](../django_orm/README.md)nde konuşmuştuk.

Şimdi yayınlanmış ve `published_date`'e (yayınlanma tarihine) göre sıralanmış bir gönderi listesi istiyoruz, değil mi? Bunu QuerySets bölümünde yapmıştık zaten!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Şimdi `blog/views.py` dosyasına `def post_list(request)` fonksiyonunu ekleyin ama öncelikle `from django.utils import timezone` eklemeyi unutmayın:

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

QuerySet'imiz için bir *değişken* yarattığımıza dikkat edin: `posts`. Bu QuerySet'in ismi. Bundan sonra ondan ismi ile bahsedebiliriz.

`render` fonksiyonunda `request` (internet aracılığıyla kullanıcıdan aldığımız her şey) adında ve başka bir şablon dosyası (`'blog/post_list.html'`) veren parametremiz var. Son parametremiz `{}`, şablonu kullanmak için bir şeyler ekleyebileceğimiz bir yer. Bunlara isimler vermemiz gerekiyor (`'posts'` ismini kullanmaya devam edeceğiz şimdilik). :) Şöyle olması lazım: `{'posts': posts}`. `:` 'dan önceki kısım string bunu not edelim; çift tırnak: `"` içine almamız gerekiyor.

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

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.2/ref/models/querysets/