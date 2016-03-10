# Template içerisinde dinamik veri

Birkaç parçayı yerine oturttuk: `Post` (gönderi) modelini `models.py`'de tanımladık, `views.py`'de `post_list` (gönderi listesi) var ve template ekledik. Ama gönderilerimizi HTML'de görünür kıldık mı? Çünkü bu yapmak istediğimiz şey: içeriği (veritabanında kayıtlı modellerimiz) al ve güzelcene template içerisinde göster, değil mi?

Bu tam olarak *view*'lerin yapmasını beklediğimiz şey: modelleri ve template'leri bağlamak. `post_list` *view*'de göstermek istediğimiz modelleri alıp template'e iletmemiz gerekecek. Yani temelde bir *view*de template içinde neyin (hangi modelin) gösterileceğine karar veriyoruz.

Peki, bunu nasıl yapacağız?

`blog/views.py`'ı açacağız. Şu anda `post_list` *view*ü şöyle:

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

`from`'dan sonraki nokta, *mevcut dizin* veya *mevcut uygulama* anlamına geliyor. `views.py` ve `models.py` aynı dizinde oldukları için sadece `.` ve dosyanın adı (`.py` olmadan) kullanabiliyoruz. Arkasından modelin adını (`Post`)'u dahil ediyoruz).

Sırada ne var? `Post` modelinden gönderileri almamız için `QuerySet` dediğimiz bir şeye ihtiyacımız var.

## QuerySet (Sorgu Seti)

QuerySet'in nasıl çalıştığı konusunda bir fikriniz oluşmuştur. [Django ORM (QuerySets) bölümü][1]nde konuşmuştuk.

 [1]: ../django_orm/README.md

Şimdi yayınlanmış ve `yayinlama_tarihi`'ne göre sıralanmış bir gönderi listesi istiyoruz, değil mi? Bunu QuerySets bölümünde yapmıştık zaten!

```
Post.objects.filter(yayinlama_tarihi__lte=timezone.now()).order_by('yayinlama_tarihi')
```

Şimdi bu kodu `blog/views.py` dosyasında `def post_list(request)` fonksiyonuna ekleyelim:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(yayinlama_tarihi__lte=timezone.now()).order_by('yayinlama_tarihi')
    return render(request, 'blog/post_list.html', {})
```

QuerySet'imiz için bir *değişken* yarattığımıza dikkat edin: `posts`. Bu QuerySet'in ismi. Bundan sonra ondan ismi ile bahsedebiliriz.

Bu kod `timezone.now()` fonksiyonunu kullanıyor, dolayısıyla `timezone` için bir 'import' eklememiz gerekiyor.

Son eksik kalan kısım `posts` QuerySet'ini template'e iletmek (nasıl göstereceğimizi bir sonraki bölümde işleyeceğiz).

`render` fonksiyonunda halihazırda `request` diye bir parametremiz var (dolayısıyla Internet üzerinden kullanıcı ile ilgili aldığımız her şey) ve bir de template dosyamız `'blog/post_list.html'` var. `{}` şeklindeki son parametremiz, template içinde kullanılmak üzere bir şeyler ekleyebileceğimiz bir değişken. Bunlara isimler vermemiz gerekiyor (`'posts'` ismini kullanmaya devam edeceğiz şimdilik :)). Şöyle olması lazım: `{'posts': posts}`. `:`'dan önceki kısmın bir string olduğuna dikkat edin; etrafına tek tırnak koymanız gerekiyor `''`.

Nihayetinde `blog/views.py` şu şekle gelmiş olmalı:

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(yayinlama_tarihi__lte=timezone.now()).order_by('yayinlama_tarihi')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

İşte bu kadar! Template'e geri gidip QuerySet'leri görünür hale getirme zamanı!

Django'da QuerySet'lerle ilgili daha fazla bilgi istiyorsanız şuraya bakabilirsiniz: https://docs.djangoproject.com/en/1.8/ref/models/querysets/