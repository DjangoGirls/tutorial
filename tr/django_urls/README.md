# Django url'leri

İlk web sayfamızı yapmak üzereyiz: blogunuzun anasayfası! Ama önce, biraz Django url'lerini öğrenmeye başlayalım.

## URL nedir?

URL basitçe bir web adresidir. Bir web sayfasını her ziyaret ettiğinizde tarayıcınızın adres barında bir URL görürsünüz (evet! `127.0.0.1:8000` bir URL'dir! Ve `https://djangogirls.com` da bir URL'dir):

![Url][1]

 [1]: images/url.png

Internetteki her sayfanın kendi URL'inin olması gerekir. Böylelikle bir URL açıldığında uygulama ne göstermesi gerektiğini bilir. Django'da `URLconf` (URL konfigürasyonu) denilen bir şey kullanıyoruz. URLconf, Django'ya gelen URL için doğru view'un bulunmasını sağlar.

## URL'ler Django'da nasıl çalışır?

Kod editörümüzde `mysite/urls.py` dosyasını açalım ve neye benzediğine bakalım:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
]
```

Gördüğünüz gibi Django bizim için bir şeyler koymuş bile.

`#` ile başlayan satırlar yorum satırlarıdır - bu satırlar Python tarafından çalıştırılmayacak manasına gelir. Çok pratik, değil mi?

Geçen bölümde gittiğimiz admin URL şimdiden burda:

```python
    url(r'^admin/', include(admin.site.urls)),
```

`admin` ile başlayan her URL için Django ona denk gelen bir *view* bulur manasına gelir. Bu şekilde bir sürü admin URLlerini ekliyoruz böylece hepsi bu küçük dosyanın içinde sıkıştırılmış bir şekilde durmuyor -- bu hali daha okunabilir ve düzenli.

## Regex (Kurallı İfade)

Django'nun URL'leri view'larla nasıl eşleştirdiğini merak ediyor musunuz? Bu kısım biraz karışık. Django bunun için `regex` kullanıyor. Regex, "regular expressions"ın kısaltılmış hali ve düzenli ifadeler anlamına geliyor. Regex'in bir arama kalıbı oluşturmak için birçok (birçok!) kuralı var. Regexler ileri bir konu olduğu için nasıl çalıştığının detayına girmeyeceğiz.

Gene de kalıpları nasıl oluşturduğumuzu anlamak isterseniz, aşağıdaki bir örnek var - aradığımız kalıbı oluşturmak için kuralların sadece bir kısmına ihtiyacımız olacak, şöyle:

```
^ metnin başlangıcı için
$ metnin sonu için
\d rakamlar için
+ bir önceki karakterin en az bir kere bulunması gerektiğini belirtmek için
() kalıbın belli bir kısmını yakalamak için
```    

Url tanımındaki diğer herşey birebir eşlenecek.

Şimdi `http://www.mysite.com/post/12345/` adresinde bir websitemiz olduğunu düşünelim. `12345` da gönderimizin numarası.

Her gönderi için ayrı bir view yazmak gerçekten can sıkıcı olurdu. Düzenli ifadelerle (regexlerle) url ile eşlecek bir kalıp oluşturup gönderi numarasını çıkartabiliriz: `^post/(\d+)/$`. Parçalara bölüp ne yaptığımıza bakalım:

*   **^post/** Django'ya `post/` ile başlayan her şeyi almasını söylüyor ( `^`)
*   **(\d+)** ise bir sayı (birden fazla rakam) olduğunu ve bu sayıyı yakalamak ve çıkarmak istediğimizi belirtiyor
*   **/** ise Django'ya arkasından bir `/` karakteri gelmesi gerektiğini söylüyor
*   **$** ise URL'nin sonuna işaret ediyor, yani sadece sonu `/` ile biten string'ler bu kalıpla eşleşecek

## İlk Django url'niz!

İlk URL'imizi oluşturma zamanı! 'http://127.0.0.1:8000/'ın blogumuzun ana sayfası olmasını istiyoruz ve bize bir gönderi listesi göstermesini istiyoruz.

Aynı zamanda `mysite/urls.py` dosyasını basit tutmak istiyoruz, bunun için ana `mysite/urls.py` dosyasına `blog` uygulamamızdan url'leri import edeceğiz (içeri alacağız).

Yorum satırlarını silin (`#` ile başlayan satırları) ve ana url'ye `blog.urls` satırlarını import edecek (içeri alacak) bir satır ekleyin (`''`).

`mysite/urls.py` dosyanız şöyle olmalıdır:

```python
from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls')),
]
```

Django artık 'http://127.0.0.1:8000/'ye gelen her şeyi `blog.urls`'ya yönlendirecek ve ordaki yönergelere bakacak.

Python'da düzenli ifadeler her zaman string'in başına `r` ekleyerek yapılır. Bu Python için string'in özel karakterler içerdiğini, doğrudan Python için değil düzenli ifadeler için bir string olduğu konusunda ipucu verir.

## blog.urls

`blog/urls.py` adında yeni boş bir dosya oluşturun. Harika! Şu iki satırı ekleyin:

```python
from django.conf.urls import url
from . import views
```

Burada sadece Django'nun methodlarını ve `blog` uygulamasındaki tüm `view`leri içeri aktarıyoruz (uygulamamız henüz yok, ama birazdan o kısma da geçeceğiz!)

Bundan sonra ilk URL kalıbımızı ekleyebiliriz:

```python
urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
]
```

Gördüğünüz üzere, `^$` URL'sine `post_list` adında bir `view` atıyoruz. Bu düzenli ifade `^` (başlangıç) ve `$` (bitiş)'e uyan stringlerle eşleşir - yani sadece boş string'lerle eşleşir. Bu doğru çünkü Django URL çözücülerinde 'http://127.0.0.1:8000/' URL'nin parçası değildir. Bu kalıp, Django'ya eğer siteye biri 'http://127.0.0.1:8000/' adresinden gelirse gitmesi gereken yerin `views.post_list` olduğunu söylüyor.

Son kısım olan `name='post_list'` view'u tanımlamak için kullanılan URL'nin adı. Bu view'un adı ile aynı olabilir ama tamamen farklı bir şey de olabilir. Named URL'leri (isimlendirilmiş URL'leri) projenin ilerleyen kısımlarında kullanacağız, o yüzden uygulamadaki her URL'yi isimlendirmemiz önemli. Aynı zamanda URL isimlerini tekil ve kolay hatırlanabilir yapmamız gerekir.

Her şey tamam mı? Tarayıcınızda http://127.0.0.1:8000/'ye gidin ve sonuçları görün.

![Hata][2]

 [2]: images/error1.png

Artık "It works" demiyor, di mi? Meraklanmayın, sadece bir hata sayfası, korkacak birşey yok! Aslında çok kullanışlılar:

Sayfada gördüğünüz şey: **no attribute 'post_list'**. *post_list* size bir şey hatırlatıyor mu? Bu view'un ismi! Bu her şey yerli yerinde sadece henüz *view* yok manasına geliyor. Hiç merak etmeyin, oraya geleceğiz.

> Django URLconfs ile ilgili daha fazla bilgi edinmek istiyorsanız resmi dokümantasyona bakabilirsiniz: https://docs.djangoproject.com/en/1.8/topics/http/urls/