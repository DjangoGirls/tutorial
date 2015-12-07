# Django modelleri

Şimdi blogumuzdaki bütün yazıları kaydedebileceğimiz bir şey oluşturmak istiyoruz. Ama bunu yapabilmek için önce `nesneler`den (objects) bahsetmemiz gerekiyor.

## Nesneler

Programlamada `Nesneye yönelik programlama` denen bir kavram bulunuyor. Buradaki ana fikir her şeyi sıkıcı bir düzende programlama komutları ile yazmak yerine şeyleri modelleyip birbirleri ile nasıl etkileşime geçeceklerini tanımlayabilmek.

Peki bir nesne nedir? Özelliklerin ve hareketlerin bir bütünüdür. Kulağa garip geliyor olabilir ama bir örnekle açıklayacağız.

Eğer bir kediyi modellemek istiyorsak `Kedi` nesnesini oluştururuz ve bu nesne şöyle özelliklere sahip olur:`renk`, `yaş`, `ruh hali` (örneğin; iyi, kötü, uykulu ;)) ve `sahibi` (ki bu da bir `İnsan` nesnesi olur ya da eğer sokak kedisi ise bu özellik boş olabilir).

`Kedi` bazı hareketlere sahiptir: `miyavla`, `tırmala` ya da `beslen` (bu durumda kediye biraz `Kedi Maması` vermemiz gerekir ki bu özelliklere sahip başka bir nesne olur. Özelliklere örnek olarak `tat` verilebilir).

    Kedi
     --------
    renk
    yaş
    ruh_hali
    sahibi
    miyavla()
    tırmala()
    beslen(kedi_maması)

    KediMaması
     --------
    tat


Yani aslında ana fikir, gerçek nesneleri kod içinde özellikleriyle (`nesne özellikleri`) ve hareketleriyle (`metodlar`) tanımlamak.

Öyleyse blog gönderilerini nasıl modelleyeceğiz? Bir blog tasarlamak istiyoruz degil mi?

Cevaplamamız gereken soru: Blog gönderisi nedir? Özellikleri ne olmalıdır?

Tabii ki blog gönderimizin (post) içeriği için bir metin, bir de başlık lazım, değil mi? Kimin yazdığını da bilsek iyi olur - dolayısı ile bir yazara da ihtiyacımız var. Son olarak gönderinin ne zaman yaratıldığını ve ne zaman yayınlandığını da bilmek isteriz.

    Post
    ------
    baslik
    icerik
    yazar
    yaratma_tarihi
    yayinlama_tarihi


Bir blog gönderisi ile ne tür şeyler yapılabilir? Gönderiyi yayınlayan bir `metod` olması güzel olurdu, değil mi?

Bu yüzden `publish` yöntemine ihitiyacımız olacak.

Ne elde etmek istediğimizi bildiğimize göre, haydi bunu Django'da modellemeye başlayalım!

## Django modeli

Nesnenin ne olduğunu bildiğimize göre, blog gönderimiz için bir Django modeli oluşturabiliriz.

Django'da bir model özel bir çeşit nesnedir - `database` içinde kaydedilir. Veritabanı veri topluluğuna verilen isimdir. Burası, kullanıcılar, blog gönderilerimiz, vb. hakkında bilgileri saklayacağımız yerdir. Verilerimizi depolamak için SQLite veritabanını kullanıyor olacağız. SQLite, Django için varsayılan veritabanıdır - şimdilik bizim için yeterli olacaktır.

Veritabanındaki bir modeli, sütünları (alan adı) ve satırları (veri) olan bir hesap tablosuna (spreadsheet) benzetebiliriz.

### Uygulama Oluşturma

Herşeyi derli toplu tutmak için, projemizin içinde ayrı bir uygulama oluşturacağız. Herşeyin en başından düzenli olması çok iyidir. Bir uygulama oluşturmak için aşağıdaki komutu konsolda çalıştırmamız gerekiyor (`manage.py` dosyasının olduğu `djangogirls` klasörünün içinde olmalıyız):

    (myvenv) ~/djangogirls$ python manage.py startapp blog


Yeni bir `blog` klasörü ve içinde bir kaç dosya oluştuğunu fark edeceksiniz. Projemizdeki klasörler ve dosyalar şöyle olmalı:

    djangogirls
    ├── mysite
    |       __init__.py
    |       settings.py
    |       urls.py
    |       wsgi.py
    ├── manage.py
    └── blog
        ├── migrations
        |       __init__.py
        ├── __init__.py
        ├── admin.py
        ├── models.py
        ├── tests.py
        └── views.py


Bir uygulama oluşturduktan sonra, Django'ya bunu kullanmasını da söylememiz lazım. Bunu `mysite/settings.py` dosyasında yapıyoruz. `INSTALLED_APPS` girdisini bulup `'blog'`u tam `)` karakterinin üzerine yazmamız lazım. Sonunda yüklenilen uygulamalar (INSTALLED_APPS) listesi şuna benzemelidir:

```python
INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
)
```

### Blog gönderisi modeli oluşturma

`blog/models.py` dosyasında `Models` olarak adlandırdığımız tüm nesneleri tanımlarız - burası bizim blog gönderisini tanımlayacağımız yer.

Şimdi `blog/models.py` dosyasını açalım ve içindeki herşeyi silelim ve şu kodu yazalım:

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    yazar = models.ForeignKey('auth.User')
    baslik = models.CharField(max_length=200)
    yazi = models.TextField()
    yaratilis_tarihi = models.DateTimeField(
            default=timezone.now)
    yayinlanma_tarihi = models.DateTimeField(
            blank=True, null=True)

    def yayinla(self):
        self. yayinlama_tarihi = timezone.now()
        self.save()

    def __str__(self):
        return self.baslik
```

> `str` nin her iki tarafında 2 tane alt çizgi (`_`) kullandığınızdan emin olun. Bu tarz Python dilinde sık olarak kullanılır ve bazen "dunder" (double underscore kısaltması) olarak ifade edilir.

Biraz korkunç görünüyor, değil mi? Ama merak etmeyin, her şeyin ne demek olduğunu anlatacağız!

`from` veya `import` ile başlayan tüm satırlar başka yerlerden birşeyleri projemize dahil eder. Yani, başka yerlerde tanımlanmış kodları bütün dosyalarımıza kopyalamak yerine, bu kodların bir kısmını `from ... import ...` ile kodumuza dahil edebiliriz.

`class Post(models.Model):` - bu satır modelimizi tanımlar (bir `nesne` dir).

*   `class` bir nesne tanımladığımızı belirten bir anahtar kelimedir.
*   `Post` modelimizin ismidir. Başka bir isim de verebilirdik (yeter ki özel karakterler ve boşluk kullanmayalım). Class isimleri her zaman büyük harf ile başlamalıdır.
*   `models.Model` Post'un bir Django Modeli olduğunu belirtir, bu şekilde Django onu veritabanında tutması gerektiğini bilir.

Şimdi daha önce bahsettiğimiz özellikleri tanımlayabiliriz: `baslik`, `icerik`, `yaratilis_tarihi`, `yayinlama_tarihi` ve `yazar` (Türkçe karakterleri kullanamadığımız unutmayalım). Bunun için her alanın tipini belirtmemiz lazım (Yazı mı? Numara mı? Tarih mi? Başka bir nesneye referans mı, ör. Kullanıcı?).

*   `models.CharField` - kısıtlı uzunlukta yazı tanımlamak için kullanır.
*   `models.TextField` - karakter limiti olmayan uzun yazıları tanımlar. Blog gönderilerinin içeriği için biçilmiş kaftan, değil mi?
*   `models.DateTimeField` - gün ve saati tanımlamada kullanılır.
*   `models.ForeignKey` - başka bir model ile ilişkilendirir.

Burada her detayı anlatmıyoruz, çünkü çok fazla vakit alır. Eğer detayları merak ederseniz veya farklı tür alanlar (Model fields) tanımlamak isterseniz Django'nun dokümantasyonlarınıza bakabilirsiniz (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

Peki `def yayinla(self):` nedir? Daha önce bahsettiğimiz `yayinla` metodudur. `def` bir fonksiyon/metod olduğunu belirtir, `yayinla` ise bu metodun adıdır. İstersen metodun ismini değiştirebilirsin. Metodlara isim verme kuralı küçük harf ve boşuk yerine alt çizgi ( _ ) kullanmaktır. Örneğin ortalama fiyatı hesaplayan bir metoda `ortalama_fiyati_hesapla` ismi verilebilir.

Genellikle metodlar birşey geri döndürür (`return` anahtar kelimesi döndür anlamına gelir). `__str__` metodunda buna bir örnek görebiliriz. Bu senaryoda `__str__()` unu çağırdığımızda Post başlığının yazısını (**string**) elde ederiz.

Şu noktada model hakkında anlamadığın birşeyler varsa mentörüne sormaktan çekinme! Bu konuların biraz karmaşık olduğunun farkındayız. Özellikle hem nesneler hem de fonksiyonları aynı anda öğrenmek kolay değil. Umarız gizemi biraz azalmaya başlamıştır!

### Modeller için veritabanında tablo oluşturma

Son adımımız yeni modelimizin veritabanına eklemesini sağlamak. İlk önce Django'ya modelde bir takım değişikliklerin olduğunu haber vermemiz gerek (daha yeni yaptığımız değişiklikleri yani!). `python manage.py makemigrations blog` yazın. Şöyle görünmeli:

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      0001_initial.py:
      - Create model Post


Django bize bir migrasyon dosyası oluşturdu ve bunu veritabanımıza uygulamamız lazım. `python manage.py migrate blog` yazdığın zaman şunu görmelisin:

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK


Yaşasın! Post modelimiz artık veritabanımızda! Görsek ne güzel olur, değil mi? Gelecek bölümde Post'un nasıl göründügünü göreceğiz!
