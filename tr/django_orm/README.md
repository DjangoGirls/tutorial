# Django ORM (Nesne-İlişkisel Eşleme) ve QuerySets (Sorgu Setleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

QuerySet, esas olarak, verilen bir modelin nesnelerinin listesidir. QuerySet veritabanından veri okumamıza, veriyi filtrelememize ve sıralamamıza imkan sağlar.

En kolayı örnekle öğrenmektir. Hadi deneyelim, olur mu?

## Django çekirdeği (shell)

Lokal konsolumuzu açalım (PythonAnywhere'de değil) ve şu komutu yazalım:

    (myvenv) ~/djangogirls$ python manage.py shell


Etkisi aşağıdaki gibi olmalı:

    (InteractiveConsole)
    >>>


Şuan Django'nun interaktif konsolundayız. Python istemine benziyor, ama bazı ek Django büyüsüyle :) Tabi ki, burada da tüm Python komutlarını kullanabiliriz.

### Tüm nesneler

Önce tüm gönderilerimizi görüntülemeyi deneyelim. Bunu aşağıdaki komut ile yapabiliriz:

    >>> Post.objects.all()
    Traceback (most recent call last):
          File "<console>", line 1, in <module>
    NameError: name 'Post' is not defined


Oops! Bir hata meydana geldi. Bize bir gönderi olmadığını söylüyor. Doğru - önce gönderiyi almayı unuttuk!

    >>> from blog.models import Post


`Post` modelini `blog.models` model havuzundan kolayca kodumuza dahil ettik. Şimdi bütün gönderileri tekrar göstermeyi deneyelim:

    >>> Post.objects.all()
    [<Post: gönderi başlığım>, <Post: bir başka gönderi başlığı>]


Daha önce yarattığımız gönderilerin listesi! Bu gönderileri Django yönetici arayüzü kullanarak yaratmıştık. Şimdi ise Python kullanarak yeni gönderiler yaratmak istiyoruz, bunu nasıl yapabiliriz?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

    >>> Post.objects.create(yazar=ben, baslik=u'Örnek Başlık', yazi=u'Test')


Ancak bir eksiğimiz var: `ben`. Gönderinin yazar özelliğine `User` modelinden türetilen bir nesneyi parametre olarak vermemiz gerekiyor. Nasıl verebiliriz?

Öncelikle kullanıcı modelini dahil edelim:

    >>> from django.contrib.auth.models import User


Veritabanımızda hangi kullanıcılar var? Şu şekilde görebiliriz:

    >>> User.objects.all()
    [<User: ahmet>]


Daha önce yarattığımız ayrıcalıklı kullanıcı! Şimdi veritabanından kullanıcı nesnesi alalım:

    ben = User.objects.get(username='ahmet')


Gördüğünüz gibi, `username` özelliği 'Ahmet' olan `User` nesnesini `get` ile aldık. Müthiş! Tabiki, kullanıcı adını kendi kullanıcı adınıza göre ayarlamalısınız.

Gönderimizi artık kaydedebiliriz:

    >>> Post.objects.create(yazar=ben, baslik=u'Örnek Başlık', yazi=u'Test')


Yaşasın! Çalışıp çalışmadığını kontrol etmek ister misin?

    >>> Post.objects.all()
    [<Post: gönderi başlığım>, <Post: bir başka gönderi başlığı>, <Post: Örnek başlık>]


İşte bu kadar, listede bir gönderi daha!

### Daha fazla gönderi ekle

Şimdi biraz eğlenenebiliriz ve nasıl çalıştığını görmek için daha fazla gönderi ekleyebiliriz. 2-3 tane daha ekleyin ve bir sonraki kısma devam edin.

### Nesneleri filtrelemek

QuerySets in büyük bir parçası nesneleri filtreleyebilme kabiliyetidir. Diyelim ki, kullanıcı Ola tarafından yazılmış tüm gönderileri bulmak istiyoruz. `Post.objects.all()` yapısı içindeki `all` yerine `filter` kullanacağız. Parantez içinde, bir blog gönderisinin sorgu setimizin içinde yer alması için hangi şartı(ları) sağlaması gerektiğini belirteceğiz. Örneğimizde, `yazar` özelliği `ben` nesnesine eşitti. Django'da bu filtre şöyle yazılır: `yazar=ben`. Şuan bizim kod parçacığımız şöyle görünüyor:

    >>> Post.objects.filter(yazar=ben)
    [<Post: Örnek başlık>, <Post: Gönderi Numarası 2>, <Post: Üçüncü postum!>, <Post: Gönderinin dördüncü başlığı>]


Ya da belki `title` alanında içinde 'başlık' kelimesini içeren tüm gönderileri görmek istiyoruz?

    >>> Post.objects.filter(baslik__contains=u'başlık')
    [<Post: Örnek başlık>, <Post: gönderinin dördüncü başlığı>]


> **Not** `baslik` ve `contains` arasında iki tane alt çizgi (`_`) var. Django'nun ORM'i bu söz dizimini, özelliği ("baslik") ve operasyon veya filtreyi ("contains") ayırmak için kullanır. Sadece tek alt çizgi kullanırsanız, "FieldError: Cannot resolve keyword title_contains" hatası alırsınız.

Ayrıca yayınlanmış tüm gönderilerin bir listesini alabiliriz. Bunu geçmişte `yayinlanma_tarihi` alanı belirtilmiş tüm gönderileri filtreleyerek yapıyoruz:

    >>> from django.utils import timezone
    >>> Post.objects.filter(yayinlanma_tarihi__lte=timezone.now())
    []

Maalesef, Python konsolundan eklediğimiz gönderi henüz yayınlanmadı. Bunu değiştirebiliriz! İlk olarak yayınlamak istediğimiz gönderinin bir örneğini alalım:

    >>> post = Post.objects.get(baslik="Örnek başlık")


Ardından `yayinla` metodu ile gönderiyi yayınlayalım!

    >>> post.yayinla()


Şimdi yayınlanmış gönderileri tekrar almaya çalışalım (3 kez yukarı yön ve ardından `enter` tuşuna basın):

    >>> Post.objects.filter(yayinlama_tarihi__lte=timezone.now())
    [<Post: Örnek başlık>]


### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `yaratilis_tarihi` özelliğine göre sıralamayı deneyelim:

    >>> Post.objects.order_by('yaratilis_tarihi')
    [<Post: Örnek başlık>, <Post: Gönderi Numarası 2>, <Post: Üçüncü postum!>, <Post: Gönderinin dördüncü başlığı>]


Başlangıçta `-` ekleyerek sıralamayı tersine de çevirebiliriz:

    >>> Post.objects.order_by('-yaratilis_tarihi')
    [<Post: Gönderinin dördüncü başlığı>, <Post: Üçüncü postum!>, <Post: Gönderi Numarası 2>, <Post: Örnek başlık>]


### Sorgu Setlerini Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

    >>> Post.objects.filter(yayinlama_tarihi__lte=timezone.now()).order_by('published_date')


Zincirleme gerçekten çok güçlüdür ve oldukça kompleks sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Çekirdeği kapatmak için, şunu yazalım:

    >>> exit()
    $
