# Django modelleri

Şimdi blogumuzdaki bütün yazıları kaydedebileceğimiz bir şey oluşturmak istiyoruz. Ama bunu yapabilmek için önce `nesneler` denen şeylerden bahsetmemiz gerekiyor.

## Nesneler

Programlamada `Nesneye yönelik programlama` denen bir kavram bulunuyor. Buradaki ana fikir her şeyi sıkıcı bir düzende programlama komutları ile yazmak yerine şeyleri modelleyip birbirleri ile nasıl etkileşime geçeceklerini tanımlayabileceğimiz.

Peki bir nesne nedir? Özelliklerin ve hareketlerin bir bütünüdür. Kulağa garip geliyor olabilir ama bir örnekle açıklayacağız.

Eğer bir kediyi modellemek istiyorsak `Kedi` nesnesini oluştururuz ve bu nesne şöyle özelliklere sahip olur:`renk`, `yas`, `ruh_hali` (örneğin; iyi, kötü, uykulu ;)) ve `sahibi` (ki bu da bir `İnsan` nesnesi olur ya da eğer sokak kedisi ise bu özellik boş olabilir).

`Kedi` bazı hareketlere sahiptir: `miyavla`, `tirmala` ya da `beslen` (bu durumda kediye biraz `KediMamasi` vermemiz gerekir ki o da kendine ait özellikleri olan başka bir nesne olur. Özelliklere örnek olarak `tat` verilebilir).

```
Kedi
--------
renk 
yas 
ruh_hali 
sahibi 
miyavla() 
tirmala() 
beslen(kedi_mamasi) 

KediMamasi
-------- 
tat
```

Yani aslında ana fikir, gerçek nesneleri kod içinde özellikleriyle (`nesne özellikleri`) ve hareketleriyle (`metodlar`) tanımlamak.

Öyleyse blog gönderilerini nasıl modelleyeceğiz? Bir blog tasarlamak istiyoruz degil mi?

Cevaplamamız gereken soru: Blog gönderisi nedir? Özellikleri ne olmalıdır?

Tabii ki blog gönderimizin içeriği için yazı ve bir de başlık lazım, değil mi? Kimin yazdığını da bilsek iyi olur - dolayısı ile bir yazara da ihtiyacımız var. Son olarak, gönderinin ne zaman yaratıldığını ve yayınlandığını bilmek isteriz.

```
Post
------
baslik
yazi
yazar
yaratilis_tarihi
yayinlama_tarihi
```

Bir blog gönderisi ile ne tür şeyler yapılabilir? Gönderiyi yayınlayan bir `method` olması güzel olurdu, değil mi?

Bu yüzden `yayinla` metoduna ihtiyacımız olacak.

Ne elde etmek istediğimizi bildiğimize göre, haydi bunu Django'da modellemeye başlayalım!

## Django modeli

Nesnenin ne olduğunu bildiğimize göre, blog gönderimiz için bir Django modeli oluşturabiliriz.

Django'da bir model özel bir çeşit nesnedir - `veritabanı`'na kaydedilir. Veritabanı veri topluluğuna verilen isimdir. Burası, kullanıcıları, blog gönderileri gibi bilgileri saklayacağımız yerdir. Verilerimizi depolamak için SQLite veritabanını kullanacağız. Bu varsayılan Django veritabanı adaptörüdür - şimdilik bizim için yeterli olacaktır.

Veritabanındaki bir modeli sütunları (alan adı) ve satırları (veri) olan bir hesap çizelgesi olarak düşünebiliriz.

### Uygulama oluşturma

Her şeyi derli toplu tutmak için, projemizin içinde ayrı bir uygulama oluşturacağız. Her şeyin en başından düzenli olması çok iyidir. Bir uygulama oluşturmak için aşağıdaki komutu konsolda çalıştırmamız gerekiyor ( `djangogirls` dizininden `manage.py` dosyasının bulunduğu yer):

```
(myvenv) ~/djangogirls$ python manage.py startapp blog
```    

İçinde birkaç dosya olan yeni bir `blog` klasörü fark edeceksiniz. Projemizdeki klasörler ve dosyalar şöyle olmalı:

```
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
```

Uygulamamızı oluşturduktan sonra, Django'ya bunu kullanmasını da söylememiz lazım. Bunu `mysite/settings.py` dosyası ile yapıyoruz. `INSTALLED_APPS` dosyasını bulup `'blog'` u tam `)` karakterinin üzerine yazmamız lazım. Sonunda dosya şuna benzemelidir:

```
python
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

### Post (Blog gönderisi) modeli oluşturma

`blog/models.py` dosyasında `Models` deki tüm nesneler tanımlanır - burası bizim blog postunu tanımlayacağımız yerdir.

Şimdi `blog/models.py` dosyasını açalım ve içindeki her şeyi silip şu kodu yazalım:

```
python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    yazar = models.ForeignKey('auth.User')
    baslik = models.CharField(max_length=200)
    yazi = models.TextField()
    yaratilis_tarihi = models.DateTimeField(
            default=timezone.now)
    yayinlama_tarihi = models.DateTimeField(
            blank=True, null=True)

    def yayinla(self):
        self. yayinlama_tarihi = timezone.now()
        self.save()

    def __str__(self):
        return self.baslik
```

> `str` nin her iki tarafında 2 tane alt çizgi (`_`) kullandığınızı kontrol edin. İki alt çizgi Python dilinde sık kullanılır. 

Biraz korkunç görünüyor, değil mi? Ama merak etmeyin, her şeyin ne demek olduğunu anlatacağız!

`from` veya `import` ile başlayan tüm satırlar başka yerlerden bir şeyleri projemize dahil eder. Yani, başka yerlerde tanımlanmış kodları dosyalarımıza kopyalamak yerine, bu kodların bir kısmını `from ... import ...` ile projemize dahil edebiliriz.

`class Post(models.Model):` - bu satır modelimizi tanımlar (bir `nesne` dir).

*   `class` bir nesne tanımladığımızı belirten bir anahtar kelimedir.
*   `Post` modelimizin ismidir. Başka bir isim de verebilirdik (yeter ki özel karakterler ve boşluk kullanmayalım). Class isimleri her zaman büyük harf ile başlamalıdır.
*   `models.Model` Post'un bir Django Modeli olduğunu belirtir, bu şekilde Django onu veritabanında tutması gerektiğini bilir.

Şimdi daha önce bahsettiğimiz özellikleri tanımlayabiliriz: `baslik`, `yazi`, `yaratilis_tarihi`, `yayinlama_tarihi` ve `yazar` (Türkçe karakterleri kullanamadığımızı unutmayalım). Bunun için her alanın tipini belirtmemiz lazım (metin mi? Sayı mı? Tarih mi? Başka bir nesneye referans mı, ör. Kullanıcı?).

*   `models.CharField` - kısıtlı uzunlukta metin tanımlamak için kullanılır.
*   `models.TextField` - bu da uzun metinleri tanımlar. Blog gönderileri için biçilmiş kaftan, değil mi?
*   `models.DateTimeField` -bu da gün ve saati tanımlamada kullanılır.
*   `models.ForeignKey` - başka bir model ile bağlantı içerir.

Burada her detayı anlatmıyoruz, çünkü çok fazla vakit alır. Eğer detayları merak ederseniz veya farklı tür alanlar tanımlamak isterseniz Django'nun dokümantasyonlarına bakabilirsiniz (https://docs.djangoproject.com/en/1.8/ref/models/fields/#field-types).

Peki `def yayinla(self):` nedir? Daha önce bahsettiğimiz `yayinla` methodudur. `def` bir fonksiyon/method olduğunu belirtir, `yayinla` ise bu methodun adıdır. İstersen methodun ismini değiştirebilirsin. Methodlara isim verirken küçük harf kullanmaya ve boşluk yerine alt çizgi kullanmaya dikkat etmemiz gerekiyor. Örneğin ortalama fiyatı hesaplayan bir methoda `ortalama_fiyati_hesapla` ismi verilebilir.

Genellikle methodlar bir şey geri döndürür (`return` anahtar kelimesi döndür anlamına gelir). `__str__` methodunda bunun örneğini görebiliriz. Bu durumda `__str__()` methodunu çağırdığımızda Post başlığının yazısını (**string**) elde ederiz.

Buraya kadar model hakkında anlamadığın bir şeyler varsa mentörüne sormaktan çekinme! Bu konuların biraz karmaşık olduğunun farkındayız. Özellikle hem nesneleri hem de fonksiyonları aynı anda öğrenmek kolay değil. Umarız gizemi biraz azalmaya başlamıştır!

### Modeller için veritabanında tablo oluşturma

Son adımımız yeni modelimizin veritabanına eklenmesini sağlamak. İlk önce Django'ya modelde bir takım değişiklikler yaptığımızı haber vermemiz gerekiyor (modeli yeni oluşturduk!). `python manage.py makemigrations blog` yazın. Şöyle görünmeli:

```
(myvenv) ~/djangogirls$ python manage.py makemigrations blog
Migrations for 'blog':
  0001_initial.py:
  - Create model Post
```

Django bize veritabanımıza uygulayabileceğimiz bir taşıma (migrasyon) dosyası oluşturdu. `python manage.py migrate blog` yazdığın zaman şunu görmelisin:

```
(myvenv) ~/djangogirls$ python manage.py migrate blog
Operations to perform:
  Apply all migrations: blog
Running migrations:
  Rendering model states... DONE
  Applying blog.0001_initial... OK
```

Yaşasın! Post modelimiz artık veritabanımızda! Görsek ne güzel olur, değil mi? Gelecek bölümde Post'un nasıl göründügünü göreceğiz!
