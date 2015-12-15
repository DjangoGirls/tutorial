# Şablonlarda dinamik veri

Birkaç parçayı yerine oturttuk: `Post` (gönderi) modelini `models.py`'de tanımladık, `views.py`'de `post_list` (gönderi listesi) var ve şablonu ekledik. Ama gönderilerimiz HTML'de görünür kıldık mı? Çünkü bu yapmak istediğimiz şey: içeriği (veritabanında kayıtlı modellerimiz) al ve güzelcene şablonumuzda göster, değil mi?

Bu tam olarak *görünüm*'lerin yapmasını beklediğimiz şey: modelleri ve şablonları bağlamak. `post_list` *görünüm*'üzde göstermek istediğimiz modelleri alıp şablona iletmemiz gerekecek. Yani temelde bir *görünüm*de şablonda neyin (hangi modelin) gösterileceğine karar veriyoruz.

Peki, bunu nasıl yapacağız?

`blog/views.py`'ı açacağız. Şu anda `post_list` *görünüm*ü şöyle:

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

Kodları farklı dosyalara eklemekten bahsettiğimizi hatırlıyor musunuz? Şimdi `models.py`'de yazdığımız modeli ekleme zamanı. `from .models import Post` satırını şu şekilde ekleyeceğiz:

```python
from django.shortcuts import render
from .models import Post
```

`from`'dan sonraki nokta, *mevcut dizin* veya *mevcut uygulama* anlamına geliyor. `views.py` ve `models.py` aynı dizinde oldukları için sadece `.` ve dosyanın adı (`.py` olmadan) kullanabiliyoruz. Arkasından modelin adını (`Post`)'u içeri alıyoruz (import ediyoruz).

Sırada ne var? `Post` modelinden gönderileri almamız için `QuerySet` dediğimiz birşeye ihtiyacımız var.

## QuerySet

QuerySet'in nasıl çalıştığı konusunda bir fikriniz oluşmuştur. [Django ORM (QuerySets) bölümü][1]nde konuşmuştuk.

 [1]: ../django_orm/README.md

Şimdi yayınlanmış ve `published_date`'e (yayınlanma tarihine) göre sıralanmış bir gönderi listesine istiyoruz, değil mi? Bunu QuerySets bölümünde yapmıştık zaten!

    Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

Şimdi bu kodu `blog/views.py` dosyasında `def post_list(request)` fonksiyonuna ekleyelim:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

QuerySet'imiz için bir *değişken* yarattığımıza dikkat edin: `posts`. Bu QuerySet'in ismi. Bundan sonra ondan ismi ile bahsedebiliriz.

Bu kod `timezone.now()` fonksiyonunu kullanıyor, dolayısıyla `timezone` için bir 'import' eklememiz gerekiyor.

Son eksik kalan kısım `posts` QuerySet'ini şablona iletmek (nasıl göstereceğimizi bir sonraki bölümde işleyeceğiz).

`render` fonksiyonunda halihazırda `request` diye bir parametremiz var (dolayısıyla Internet üzerinden kullanıcı ile ilgili aldığımız herşey) ve bir de şablon dosyamız `'blog/post_list.html'` var. `{}` şeklindeki son parametremiz, şablonda kullanılmak üzere birşeyler ekleyebileceğimiz bir değişken. Bunlara isimler vermemiz gerekiyor (`'posts'` ismini kullanmaya devam edeceğiz şimdilik :)). Şöyle olması lazım: `{'posts': posts}`. `:`'dan önceki kısmın bir string olduğuna dikkat edin; etrafına tek tırnak koymanız gerekiyor `''`.

Nihayetinde `blog/views.py` şu şekle gelmiş olmalı:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

İşte bu kadar! Şablonumuza geri gidip QuerySet'leri görünür hale getirme zamanı!

Django'da QuerySet'lerle ilgili daha fazla bilgi istiyorsanız şuraya bakabilirsiniz: https://docs.djangoproject.com/en/1.8/ref/models/querysets/