# Template içinde dinamik veri

Birkaç parçayı yerine oturttuk: `Post` (gönderi) modelini `models.py`'de tanımladık, `views.py`'de `post_list` (gönderi listesi) var ve template ekledik. Ama gönderilerimizi HTML'de görünür kıldık mı? Çünkü yapmak istediğimiz şey bu -bazı içerikleri (veritabanında kayıtlı modeller) al ve şablonumuzda göster, değil mi?

Bu tam olarak *view*'lerin yapmasını beklediğimiz şey: modelleri ve template'leri bağlamak. `post_list` *view* 'ımızda göstermek istediğimiz modelleri alıp şablona iletmemiz gerekecek. *view* ile şablon içinde neyin (hangi modelin) gösterileceğine karar veriyoruz.

Tamam, peki nasıl yapacağız?

`blog/views.py`'ı açacağız. Şu anda `post_list` *view*ü şöyle:

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

Son eksik parça `posts` QuerySet'i şablon içeriğine iletiyor. Endişelenmeyin - daha sonraki bölümlerde nasıl görüntüleyebileceğimizi ele alacağız.

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

Django'daki QuerySet'ler hakkında daha fazla bilgi sahibi olmak istiyor musunuz? Şuraya bakabilirsiniz: https://docs.djangoproject.com/en/1.11/ref/models/querysets/