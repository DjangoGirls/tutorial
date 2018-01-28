# Django URL'leri

İlk web sayfamızı kurmak üzereyiz: bloğun için bir ana sayfa! Ama öncelike, Django URL'leri hakkında biraz bilgi edinelim.

## URL nedir?

URL basitçe bir web adresidir. Her defasında bir web sitesini ziyaret ettiğinde bir URL görürsün. Tarayıcının adres çubuğunda görünmektedir. (Evet! `127.0.0.1:8000` bir URL'dir! Ve`https://djangogirls.org`'da bir URL'dir)

![Url](images/url.png)

Internetteki her sayfanın kendi URL'si olması gerekir. Bu yolla uygulama URl'yi açan kullanıcaya ne göstemesi gerektiğini bilir. Django'da `URLconf` (URL konfigürasyonu) denilen bir şey kullanıyoruz. URLconf Django'nun doğru görünümü bulmak için istenen URL ile eşleştirmeyi deneyeceği desenler dizinidir.

## URL'ler Django'da nasıl çalışır?

Kod editörümüzde `mysite/urls.py` dosyasını açalım ve neye benzediğine bakalım:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]
```

Gördüğünüz gibi, Django çoktan bizim için buraya bir şey yerleştirmiş.

Üçlü tırnaklar (`'''` or `"""`) arasındaki satırlara docstrings denir - bunları bir dosyanın, sınıfın ya da metodun en üstüne ne yaptıklarını anlatmak için yazabilirsiniz. Python bunları çalıştırmaz.

Önce ki bölümde ziyaret ettğiniz yönetici URL'si şimdiden burada:

{% filename %}mysite/urls.py{% endfilename %}

```python
    url(r'^admin/', admin.site.urls),
```

Bu satırın anlamı Django, `admin` ile başlayan her URL için ona uyan bir *view* bulur demektir. Bu durumda bir sürü admin URLlerini dahil ediyoruz yani hepsi bu küçük dosyada sıkıştırılmış olarak durmuyor - bu şekil daha okunaklı ve düzenli.

## Regex (Kurallı İfade)

Django'nun URL'leri view'larla nasıl eşleştirdiğini merak ediyor musunuz? Bu kısım biraz karışık. Django bunun için `regex` kullanıyor. Regex, "regular expressions"ın kısaltılmış hali ve düzenli ifadeler anlamına geliyor. Regex'in bir arama kalıbı oluşturmak için birçok (birçok!) kuralı var. Regexler ileri bir konu olduğu için nasıl çalıştığının detayına girmeyeceğiz.

Gene de kalıpları nasıl oluşturduğumuzu anlamak isterseniz, aşağıdaki bir örnek var - aradığımız kalıbı oluşturmak için kuralların sadece bir kısmına ihtiyacımız olacak, şöyle:

* `^` metnin başlangıcı için
* metnin sonu için `$`
* `\d` bir basamak için
* `+` belirlemek için bi önceki öğenin en az bir kez tekrarlanması lazım
* `()` desenin bir parçasını yakalamak için

URL tanımındaki diğer her şey tamamen ele alınacaktır.

Şimdi adresi `http://www.mysite.com/post/12345/` olan bir websitesine sahip olduğunuzu düşünün, url sonundaki `12345` gönderi numaranız.

Her gönderi için ayrı bir view yazmak gerçekten can sıkıcı olurdu. Düzeni ifadelerle, URL ile eşleşen ve bizim için gönderi numarasını çıkaran bir desen yaratabiliriz: `^post/(\d+)/$`. Şimdi bunu, burada ne yaptığımızı görebilmek için parçalarına ayıralım:

* **^post/** Django'ya urldeki `post/` ile başlayan her şeyi almasını söylüyor. (`^` 'dan hemen sonra)
* **(\d+)** ise bir sayı (birden fazla rakam) olduğunu ve bu sayıyı yakalamak ve çıkarmak istediğimizi belirtiyor
* **/** ise Django'ya arkasından bir `/` karakteri gelmesi gerektiğini söylüyor
* **$** ise URL'nin sonuna işaret ediyor, yani sadece sonu `/` ile biten string'ler bu kalıpla eşleşecek

## İlk Django URL'niz!

İlk URL'mizi oluşturma zamanı.'http://127.0.0.1:8000/' adresinin bloğumuzun anasayfası olmasını ve gönderilerin bir listesini görüntülemesini istiyoruz.

Aynı zamanda `>mysite/urls.py` dosyasını temiz tutmak istiyoruz, bu yüzden `blog` uygulamamızdan `mysite/urls.py` ana dosyamıza URLleri aktarıyoruz (import).

Devam edelim, `blog.urls` 'yi içe aktaracak bir satır ekleyelim. Burada `include` fonksiyonunu kullandık bu yüzden bu içe aktarmayı (import) üste eklememiz gerekecek.

`mysite/urls.py` dosyanız şöyle olmalıdır:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.conf.urls import include
from django.conf.urls import url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'', include('blog.urls')),
]
```

Django artık 'http://127.0.0.1:8000/'ye gelen her şeyi `blog.urls`'ya yönlendirecek ve ordaki yönergelere bakacak.

Python'da düzenli ifade yazarken her zaman string (dize)'den önce `r` eklenir. Bu Python için string'in özel karakterler içerdiğini, doğrudan Python için değil düzenli ifadeler için bir string olduğu konusunda ipucu verir.

## blog.urls

`blog` dizini içinde `urls.py` adında yeni bir boş dosya oluşturun. Tamam! Şu ilk iki satırı ekleyin:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views
```

Burada `blog` uygulamasından Django'nun fonksiyonunu `url` ve bütün `views` için içe aktarıyoruz (import).(Şu an hiç urlmiz yok ama birazdan olacak!)

Bundan sonra ilk URL kalıbımızı ekleyebiliriz:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Gördüğünüz üzere, şimdi `^$` URL'sine `post_list` denen bir `view` atıyoruz. Bu düzenli ifade `^` ile başlayan ve `$` ile biten (yani sadece boş olan) stringlerle eşleşecek. Bu doğru çünkü Django URL çözücülerinde 'http://127.0.0.1:8000/' URL'nin parçası değildir. Bu kalıp, Django'ya eğer siteye biri 'http://127.0.0.1:8000/' adresinden gelirse gitmesi gereken yerin `views.post_list` olduğunu söylüyor.

Son kısım olan `name='post_list'` kısmı görünümü (view) tanımlamak için kullanılan URL'nin adıdır. Bu view'un adı ile aynı olabilir ama tamamen farklı bir şey de olabilir. Daha sonraki projelerde isimlendirilmiş URL'leri kullanıyor olacağız, bu yüzden uygulamadaki her URL'yi isimlendirmek önemli. Aynı zamanda URL'lerin isimlerini hatırlamak için eşsiz ve kolay yapmayı denemeliyiz.

Eğer şimdi http://127.0.0.1:8000/'ine gitmeyi denerseniz, 'sayfanıza ulaşılamıyor' tarzında bir mesaj görürsünüz. Bunun nedeni sunucu (`runserver` yazdığınızı hatırlıyor musunuz?) artık çalışmıyor olacaktır. Sebebini bulmak için sunucunuzdaki komut penceresine bakın.

![Hata](images/error1.png)

Konsolunuz bir hata gösteriyor, ama endişelenmeyin -aslında bu oldukça kullanışlıdır: bu **'post_list' özelliği yok** demektir. Bu Django'nun bulup kullanmaya çalıştığı *view*'un adı. Ama onu henüz oluşturmedık. Bu aşamada `/admin/` işlevi de çalışmayacaktır. Endişeye gerek yok - o noktaya ulaşacağız.

> Django URLconfs ile ilgili daha fazla bilgi edinmek istiyorsanız resmi dokümantasyona bakabilirsiniz: https://docs.djangoproject.com/en/1.11/topics/http/urls/