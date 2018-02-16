# Django modelleri

Şimdi blogumuzdaki bütün yazıları kaydedebileceğimiz bir şey oluşturmak istiyoruz. Ama bunu yapabilmek için önce `nesne` dediğimiz şeylerden (objects) bahsetmemiz gerekiyor.

## Nesneler (Objects)

Programlamada `nesneye yönelik programlama` denen bir kavram bulunuyor. Buradaki ana fikir her şeyi sıkıcı program komutları dizisi şeklinde yazmak yerine, konseptleri modelleyip birbirleri ile nasıl etkileşime geçeceklerini tanımlamak.

Peki bir nesne nedir? Nesne bir özellikler ve hareketler bütünüdür. Kulağa garip geliyor olabilir, bir örnekle açıklayalım.

Eğer bir kediyi modellemek istiyorsak, `Kedi` nesnesini oluştururuz ve bu nesne şöyle özelliklere sahip olur: `renk`, `yas`, `ruh_hali` (örneğin; iyi, kötü, uykulu ;)) ve `sahibi` (ki bu da bir `insan` nesnesi olur ya da eğer sokak kedisi ise bu özellik boş olabilir).

Ayrıca `Kedi` bazı hareketlere sahiptir: `miyavla`, `tirmala` ya da `beslen` (bu durumda kediye biraz `KediMamasi` vermemiz gerekir ki o da kendine ait özellikleri olan başka bir nesne olarak tanımlanabilir, bu durumda onun özellikleri arasında da `tat` yer alabilir).

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
    

Yani aslında ana fikir, gerçek nesneleri kod içinde özellikleri (`nesne özellikleri`) ve hareketleri (`metodlar`) ile tanımlamak.

Öyleyse blog gönderilerini nasıl modelleyeceğiz? Bir blog tasarlamak istiyoruz, degil mi?

Cevaplamamız gereken soru: Bir blog gönderisi nedir? Özellikleri ne olmalıdır?

Tabii ki blog gönderimizin içeriği için yazı ve bir de başlık lazım, değil mi? Kimin yazdığını da bilsek iyi olur - dolayısı ile bir de yazara ihtiyacımız var. Son olarak, gönderinin ne zaman yaratıldığını ve yayınlandığını da bilmek isteyebiliriz.

    Post
    ------
    baslik
    yazi
    yazar
    yaratilma_tarihi
    yayinlanma_tarihi
    

Bir blog gönderisi ile ne tür şeyler yapılabilir? Gönderiyi yayınlayan bir `method` olması güzel olurdu, değil mi?

Bu yüzden `yayinla` metoduna ihtiyacımız olacak.

Ne elde etmek istediğimizi bildiğimize göre, haydi bunu Django'da modellemeye başlayalım!

## Django modeli

Nesnenin ne olduğunu bildiğimize göre, blog gönderimiz için bir Django modeli oluşturabiliriz.

Django'da modeller özel bir çeşit nesnedir - `veritabanı`'na kaydedilir. Veritabanı ise veri topluluğuna verdiğimiz isim. Veritabanında, kullanıcılar, blog gönderileri, vs. ile ilgili bilgileri saklarız. Verilerimizi depolamak için SQLite veritabanını kullanacağız. Bu varsayılan Django veritabanı adaptörü - şimdilik bizim için yeterli olacaktır.

Veritabanındaki bir modeli, sütunları (alan adı) ve satırları (veri) olan bir hesap çizelgesi olarak düşünebilirsiniz.

### Uygulama oluşturma

Her şeyi derli toplu tutmak için, projemizin içinde ayrı bir uygulama oluşturacağız. Her şeyin en başından düzenli olması çok iyidir. Bir uygulama oluşturmak için aşağıdaki komutu konsolda çalıştırmamız gerekiyor ( `djangogirls` dizininden `manage.py` dosyasının bulunduğu yer):

{% filename %}Mac OS X ve Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

Şimdi oluşturulmuş yeni bir `blog` dizinini göreceksiniz ve bu, dizinlerin bir numarasını içerir. Bizim projemizdeki dizinler ve dosyalar bunun gibi görünmeli:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

Bir uygulamayı oluşturduktan sonra, Django’ya da onu kullanmasını söylememiz lazım. Bunu `mysite/settings.py` dosyasında yapıyoruz. `INSTALLED_APPS`‘ı bulmalı ve `]`’ın tam üzerine `'blog',`‘ı içeren bir satır eklemeliyiz. Sonunda ürün bunun gibi görünmeli:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### Post (Blog gönderisi) modeli oluşturma

`blog/models.py` dosyasında `Models` denilen bütün nesneleri tanımlıyoruz - bu blog postumuzu tanımlayacağımız bir yerdir.

`blog/models.py`‘ı açalım, burdaki herşeyi sil, ve kodu bunun gibi yaz:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> `str`'nin her iki tarafında da 2 tane alt çizgi (`_`) kullandığınızdan emin olun. İki alt çizgi Python dilinde sık kullanılır, bazen "dunder" olarak da anılır ("double-underscore"un kısaltması).

Korkutucu, değil mi? Fakat endişelenmeyin - Bu satırların ne anlama geldiğini açıklayacağız!

Bütün satırlar `from`‘la başlar veya `imprt` diğer dosyalardan bazı bitlerin eklendiği satırlardır. Yani her dosyada aynı şeyleri kopyalayıp yapıştırmak yerine, `‘la bazı bölümleri de ekleyebiliriz... import ...`

`class Post(models.Model):` - bu satır modelimizi tanımlar (bu bir `nesne`‘dir).

- `class` bir nesne tanımladığımızı belirten bir anahtar kelimedir.
- `Post` modelimizin ismi. Başka bir isim de verebilirdik (yeter ki özel karakterler ve boşluk kullanmayalım). Class isimleri her zaman büyük harf ile başlamalıdır.
- `models.Model` Post'un bir Django Modeli olduğunu belirtir, bu şekilde Django onu veritabanında tutması gerektiğini bilir.

Şimdi daha önce bahsettiğimiz özellikleri tanımlayabiliriz: `title`, `text`, `created_date`, `published_date` ve `author`. Bunun için her alanın türünü tanımlamamız gerekir (Bu metin mi? Bir numara mı? Bir tarih mi? Bir kullanıcı gibi, başka bir nesne ile bağlantılı mı?)

- `models.CharField` - belirli bir uzunluktaki metinleri tanımlamak için kullanılır.
- `models.TextField` - bu da uzun metinleri tanımlar. Blog gönderileri için biçilmiş kaftan, değil mi?
- `models.DateTimeField` - bu da gün ve saati tanımlamada kullanılır.
- `models.ForeignKey` - başka bir modele referans tanımlar.

Çok zaman aldığından burada her bit kodunu açıklamayacağız. Model dosyalarından daha çok bilgi almak ve yukarıdaki açıklamalardan farklı tanımlamaları öğrenmek istiyorsanız Django'nun belgelerine daha çok bakmalısınız (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Peki ya `def publish(self):` nedir? Bu, daha önce bahsettiğimiz tam olarak `publish` yöntemidir. `def` bunun bir fonksiyon/metod olduğunu söyler. `publish` ise metodun adıdır. Eğer isterseniz metodun adını değiştirebilirsiniz. Adlandırma kuralı boşluk yerine küçük harf ve alt çizgi kullanmamızdır. Örneğin ortalama fiyatı hesaplayan bir yöntem çağrılabilir `calculate_average_price`.

Yöntemler çoğu kez bir şeylere `return`. `__str__` yönteminde bunun bir örneği vardır. Bu durumda `__str__()`'yi çağırdığımız zaman gönderi başlığı olan bir metin (**string**) elde ederiz.

Aynı zamanda hem `def publish(self):` satırının, hem de `def __str__(self):` satırının sınıfımızın içinde girintili bir şekilde yazıldığına dikkat edin. Çünkü Python boşlukta duyarlıdır, yöntemlerimizi sınıfın içine sokmalıyız. Aksi takdirde, yöntemler sınıfın üyesi olmaz, ve bazı beklenmedik davranışlar elde edebilirsiniz.

Hala modeller hakkında bir şeyler belli değil ise, koçuna sormaktan çekinme! Özellikle hem nesneleri hem de fonksiyonları aynı anda öğrenmenin karmaşık olduğunu biliyoruz. Ama şimdi umarız ki senin için biraz daha az sihirli görünüyor!

### Modeller için veritabanında tablo oluşturma

Buradaki son adım, yeni modelimizi veritabanımıza eklemek. İlk olarak, modelimizdeki bazı değişikliklerden Django’yu haberdar etmeliyiz. (Daha yeni oluşturduk!) konsol pencerenize gidin ve `python manage.py makemigrations blog` yazın. Bunun gibi görünecek:

{% filename %}komut-satır{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Not:** Düzenlediğiniz dosyaları kaydetmeyi unutmayın. Aksi takdirde, bilgisayarınız beklenmedik hata mesajlarını verebilecek önceki sürümü çalıştıracaktır.

Django bize veritabanımıza uygulayabileceğimiz bir taşıma dosyası oluşturdu. `python manage.py migrate blog` yaz ve çıktı aşağıdaki gibi olmalıdır:

{% filename %}komut-satır{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Yaşasın! Model yazımız şimdi veritabanımızda! Onu görmek güzel olur, değil mi? Yazınızın neye benzediğini görmek için bir sonraki bölüme geçin!
