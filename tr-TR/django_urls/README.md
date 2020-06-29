# Django URL'leri

İlk web sayfamızı yapmak üzereyiz: blogunuzun anasayfası! Ama önce, biraz Django url'lerini öğrenmeye başlayalım.

## URL nedir?

URL basitçe bir web adresidir. Her defasında bir web sitesini ziyaret ettiğinde bir URL görürsün. Tarayıcının adres çubuğunda görünmektedir. (Evet! `127.0.0.1:8000` bir URL'dir! Ve `https://djangogirls.org` da bir URL'dir)

![Link](images/url.png)

İnternetteki her sayfanın kendi URL'si olması gerekir. Böylelikle bir URL açıldığında uygulama ne göstermesi gerektiğini bilir. Django'da `URLconf` (URL konfigürasyonu) denilen bir şey kullanıyoruz. URLconf Django'nun doğru viewı bulmak için istenen URL ile eşleştirmeyi deneyeceği desenler dizinidir.

## URL'ler Django'da nasıl çalışır?

Kod editörümüzde `mysite/urls.py` dosyasını açalım ve neye benzediğine bakalım:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

Gördüğünüz gibi Django bu dosyaya bizim için bir şeyler koymuş bile.

Üçlü tırnaklar (`'''` or `"""`) arasındaki satırlara docstrings denir - bunları bir dosyanın, sınıfın ya da metodun en üstüne ne yaptıklarını anlatmak için yazabilirsiniz. Python bunları çalıştırmaz.

Önceki bölümde gördüğümüz yönetici URL'si burada:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

Bu satırın anlamı Django, `admin` ile başlayan her URL için ona uyan bir *view* bulur demektir. Bu durumda bir sürü yönetici URL'lerini ekliyoruz, böylece hepsi bu küçük dosyanın içinde sıkıştırılmış bir şekilde durmuyor -- bu hali daha okunabilir ve düzenli.

## İlk Django URL'iniz!

İlk URL'mizi oluşturma zamanı. 'http://127.0.0.1:8000/' adresinin bloğumuzun anasayfası olmasını ve gönderilerin bir listesini görüntülemesini istiyoruz.

Aynı zamanda `mysite/urls.py` dosyasını temiz tutmak istiyoruz, bu yüzden `blog` uygulamamızdan `mysite/urls.py` ana dosyamıza URL'leri aktarıyoruz (import).

Devam edip, `blog.urls`'i import edecek bir satır ekleyelim. Ayrıca `from django.urls…` satırını değiştirmelisiniz çünkü `include` fonksiyonunu burada kullanıyoruz, böylece bunu satıra eklemelisiniz.

`mysite/urls.py` dosyamız şöyle olmalı:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django artık 'http://127.0.0.1:8000/' adresine gelen her şeyi `blog.urls`'e yönlendirecek ve oradaki yönergelere bakacak.

## blog.urls

`blog` dizini içinde `urls.py` adında yeni bir boş dosya oluşturalım ve kod editöründe açalım. Tamam! Şu ilk iki satırı ekleyelim:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Burada `blog` uygulamasından Django'nun `path` fonksiyonunu ve bütün `views` fonksiyonlarını dahil ediyoruz (import). (Şu an hiç url'imiz yok ama birazdan olacak!)

Bundan sonra ilk URL kalıbımızı ekleyebiliriz:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

Gördüğünüz üzere, ana URL'e `post_list` adında bir `view` atıyoruz. Bu URL kalıbı boş bir dizeyle eşleşecek ve Django URL çözümleyicisi, tam URL yolunun önüne gelen alan adını (yani, http://127.0.0.1:8000/) yok sayacaktır. Bu kalıp, Django'ya eğer siteye biri 'http://127.0.0.1:8000/' adresinden gelirse gitmesi gereken yerin `views.post_list` olduğunu söylüyor.

Son kısım `name='post_list'`, görünümü (view) tanımlamak için kullanılan URL'in adıdır. Bu view'un adı ile aynı olabilir ama tamamen farklı bir şey de olabilir. Bundan sonra projede isimlendirilmiş URL'leri kullanıyor olacağız, bu yüzden uygulamadaki her URL'i isimlendirmek önemli. Aynı zamanda URL isimlerini eşsiz ve kolay hatırlanabilir şekilde seçmeliyiz.

Eğer şimdi http://127.0.0.1:8000/ adresine gitmeyi denerseniz, 'sayfanıza ulaşılamıyor' tarzında bir mesaj görürsünüz. Bunun nedeni sunucunun (`runserver` yazdığınızı hatırlıyor musunuz?) artık çalışmıyor olması. Sebebini bulmak için sunucunuzdaki komut penceresine bakın.

![Hata](images/error1.png)

Konsolunuz bir hata gösteriyor, ama endişelenmeyin -aslında bu oldukça kullanışlı: bize **'post_list' özelliği yok** diyor. Bu Django'nun bulup kullanmaya çalıştığı *view*'ın adı. Ama onu henüz oluşturmadık. Bu aşamada `/admin/` de çalışmayacaktır. Hiç merak etmeyin, oraya geleceğiz. Farklı bir hata görürseniz, web sunucunuzu yeniden başlatmayı deneyin. Bunun için web sunucunun çalıştığı windows konsolunda Ctrl+C ( Control ve C tuşuna birlikte) basarak durdurun. Windows'ta Ctrl+Boşluk tuşlarına basmanız gerekebilir. Sonra web sunucusunu `python manage.py runserver` komutuyla tekrar başlatmalısınız.

> Eğer Django URLconfs hakkında daha fazla bilgi almak isterseniz resmi dokümana göz atın: https://docs.djangoproject.com/en/2.2/topics/http/urls/