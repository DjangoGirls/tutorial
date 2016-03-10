# Django ORM ve QuerySets (Sorgu Setleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

QuerySet (SorguSeti), esas olarak, verilen bir modelin nesnelerinin listesidir. QuerySet veritabanından veri okumamıza, veriyi filtrelememize ve sıralamamıza imkan sağlar.

En kolayı örnekle öğrenmektir. Hadi deneyelim, olur mu?

## Django shell (kabuk)

Yerel konsolumuzu açalım (PythonAnywhere'dekini değil) ve şu komutu yazalım:

```
(myvenv) ~/djangogirls$ python manage.py shell
```    

Etkisi aşağıdaki gibi olmalı:

```
(InteractiveConsole)
>>>
```

Şu an Django'nun etkileşimli konsolundayız. Python istemine benziyor, ama biraz Django büyüsü eklenmiş :) Kuşkusuz burada da Python komutlarının tümünü kullanabiliriz.

### Tüm nesneler

Önce tüm gönderilerimizi görüntülemeyi deneyelim. Bunu aşağıdaki komut ile yapabiliriz:

```
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Aman! Bir hata meydana geldi. Bize bir gönderi olmadığını söylüyor. Doğru - önce gönderiyi almayı unuttuk!

```
>>> from blog.models import Post
```    

`Post` modelini `blog.models` model havuzundan kolayca kodumuza dahil ettik. Şimdi bütün gönderileri tekrar göstermeyi deneyelim:

```
>>> Post.objects.all()
[<Post: Gönderi 1>, <Post: Gönderi 2>]
```

Daha önce yarattığımız gönderilerin listesi! Bu gönderileri Django yönetici arayüzü kullanarak yaratmıştık. Şimdi ise Python kullanarak yeni gönderiler yaratmak istiyoruz, bunu nasıl yapabiliriz?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

```
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

Ancak bir eksiğimiz var: `ben`. Gönderinin yazar özelliğine `User` modelinden türetilen bir nesneyi parametre olarak vermemiz gerekiyor. Nasıl verebiliriz?

Öncelikle kullanıcı modelini dahil edelim:

```
>>> from django.contrib.auth.models import User
```

Veritabanımızda hangi kullanıcılar var? Şu şekilde görebiliriz:

```
>>> User.objects.all()
[<User: zeynep>]
```

Daha önce yarattığımız ayrıcalıklı kullanıcı! Şimdi veritabanından kullanıcı nesnesi alalım:

```
ben = User.objects.get(username='zeynep')
```

Gördüğünüz gibi, `username` özelliği 'zeynep' olan `User` nesnesini `get` ile aldık. Müthiş! Tabiki, kullanıcı adını kendi kullanıcı adınıza göre ayarlamalısınız.

Gönderimizi artık kaydedebiliriz:

```
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

Yaşasın! Çalışıp çalışmadığını kontrol etmek ister misin?

```
>>> Post.objects.all()
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>]
```

İşte bu kadar, listede bir gönderi daha!

### Daha fazla gönderi ekle

Şimdi biraz eğlenenebiliriz ve nasıl çalıştığını görmek için daha fazla gönderi ekleyebiliriz. 2-3 tane daha ekleyin ve bir sonraki kısma devam edin.

### Nesneleri filtrelemek

QuerySets in büyük bir parçası nesneleri filtreleyebilme kabiliyetidir. Diyelim ki, Zeynep tarafından yazılmış tüm gönderileri bulmak istiyoruz. `Post.objects.all()` içindeki `all` yerine `filter` kullanacağız. Parantez içine istediğimiz blog gönderilerinin sağlaması gereken şartları belirteceğiz. Örneğimizde, `yazar` `ben`'e eşitti. Django'da bu filtre şöyle yazılır: `yazar=ben`. Şu an kod parçacığımız şöyle görünüyor:

```
>>> Post.objects.filter(yazar=ben)
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
``` 

Ya da belki `baslik` alanında içinde 'Nefis' kelimesini içeren tüm gönderileri görmek istiyoruz?

```
>>> Post.objects.filter(baslik__contains='Nefis')
[<Post: Nefis bir gönderi>]
```

> **Not** `baslik` ve `contains` arasında iki tane alt çizgi (`_`) var. Django'nun ORM'i bu söz dizimini, özelliği ("baslik") ve operasyon veya filtreyi ("contains") ayırmak için kullanır. Sadece tek alt çizgi kullanırsanız, "FieldError: Cannot resolve keyword baslik_contains" hatası alırsınız.

Ayrıca yayınlanmış tüm gönderilerin bir listesini alabiliriz. Bunu geçmişte `yayinlama_tarihi` alanı belirtilmiş tüm gönderileri filtreleyerek yapıyoruz:

> > > from django.utils import timezone Post.objects.filter(yayinlama_tarihi__lte=timezone.now()) []

Maalesef, Python konsolundan eklediğimiz gönderi henüz yayınlanmadı. Bunu değiştirebiliriz! İlk olarak yayınlamak istediğimiz gönderinin bir örneğini alalım:

```
>>> post = Post.objects.get(baslik="Harika bir gönderi")
```

Ardından `yayinla` methodu ile gönderiyi yayınlayalım!

```
>>> post.yayinla()
```

Şimdi yayınlanmış gönderileri tekrar almaya çalışalım (3 kez yukarı yön ve ardından `enter` tuşuna basın):

```
>>> Post.objects.filter(yayinlama_tarihi__lte=timezone.now())
[<Post: Harika bir gönderi>]
```

### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `yaratilis_tarihi` özelliğine göre sıralamayı deneyelim:

```
>>> Post.objects.order_by('yaratilis_tarihi')
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Başına `-` ekleyerek sıralamayı tersine de çevirebiliriz:

```
>>> Post.objects.order_by('-yaratilis_tarihi'')
[<Post: Nefis bir gönderi>, <Post: Harika bir gönderi>, <Post: Gönderi 2>, <Post: Gönderi 1>]
```

### Sorgu Setlerini Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

```
>>> Post.objects.filter(yayinlama_tarihi__lte=timezone.now()).order_by('yayinlama_tarihi')
```

Zincirleme gerçekten çok güçlüdür ve oldukça karmaşık sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Kabuğu kapatmak için, şunu yazalım:

```
>>> exit()
$
```