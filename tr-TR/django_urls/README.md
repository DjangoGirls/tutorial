# Django URL'leri

İlk web sayfamızı yapmak üzereyiz: blogunuzun anasayfası! Ama önce, biraz Django url'lerini öğrenmeye başlayalım.

## URL nedir?

URL basitçe bir web adresidir. Her defasında bir web sitesini ziyaret ettiğinde bir URL görürsün. Tarayıcının adres çubuğunda görünmektedir. (Evet! `127.0.0.1:8000` bir URL'dir! Ve `https://djangogirls.org` da bir URL'dir)

![Url](images/url.png)

İnternetteki her sayfanın kendi URL'si olması gerekir. Böylelikle bir URL açıldığında uygulama ne göstermesi gerektiğini bilir. Django'da `URLconf` (URL konfigürasyonu) denilen bir şey kullanıyoruz. URLconf Django'nun doğru viewı bulmak için istenen URL ile eşleştirmeyi deneyeceği desenler dizinidir.

## URL'ler Django'da nasıl çalışır?

Kod editörümüzde `mysite/urls.py` dosyasını açalım ve neye benzediğine bakalım:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.urls import path, include
from django.contrib import admin

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

Devam edelim, `blog.urls`'yi içe aktaracak bir satır ekleyelim. Burada `include` fonksiyonunu kullandık bu yüzden bu içe aktarmayı (import) üste eklememiz gerekecek.

`mysite/urls.py` dosyamız şöyle olmalı:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.urls import path, include
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

Django artık 'http://127.0.0.1:8000/' adresine gelen her şeyi `blog.urls`'e yönlendirecek ve oradaki yönergelere bakacak.

## blog.urls

`blog` dizini içinde `urls.py` adında yeni bir boş dosya oluşturalım. Tamam! Şu ilk iki satırı ekleyelim:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `url` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

Bundan sonra ilk URL kalıbımızı ekleyebiliriz:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full url path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.0/topics/http/urls/