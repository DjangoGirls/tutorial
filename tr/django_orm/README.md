# Django ORM ve QuerySets (Sorgu Setleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

QuerySet(SorguSeti), temel olarak, verilmiş olan bir Modelin nesnelerinin bir listesini oluşturmaktadır. QuerySet(SorguSeti) veritabanından verileri okumanızı, bu verileri filtrelemenizi ve düzenlemenizi sağlar.

En kolayı örnekle öğrenmektir. Hadi deneyelim, olur mu?

## Django shell (kabuk)

Yerel konsolumuzu açalım (PythonAnywhere'dekini değil) ve şu komutu yazalım:

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Etkisi aşağıdaki gibi olmalı:

{% filename %}komut-satırı{% endfilename %}

```python
(InteractiveConsole)
>>>
```

Şu anda Django interaktif konsoldasınız. Python komut istemi gibi fakat biraz Django büyüsü katılmış hali. :) Tabii ki, bütün python komutlarını buradada kullanabilirsiniz.

### Tüm nesneler

Önce tüm gönderilerimizi görüntülemeyi deneyelim. Bunu aşağıdaki komut ile yapabiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ahh! Bir hata meydana geldi. Bize hiç gönderi olmadığını söylüyor. Bu doğru, önce gönderiyi içeriye aktarmayı unuttuk!

{% filename %}komut-satırı{% endfilename %}

```python
>>> from blog.models import Post
```

`blog.models`'ten `Post` modelini içe aktardık. Tekrar bütün gönderileri görüntülemeyi deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
<SorguSeti [<Gönderi: Gönderi başlığım>, <Gönderi: Diğer ir gönderi başlığı>]>
```

Bu daha önce oluşturduğumuz gönderilerin listesi! Bu gönderileri Django admin arayüzü ile oluşturduk. Fakat şimdi python'u kullanarak yeni gönderiler oluşturmak istiyoruz, peki bunu nasıl yaparız?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

Fakat burada bir eksik maddemiz var: `ben`. Bir yazar olarak `Kullanıcı` modelinin bir örneğini göstermemiz gerekiyor. Bunu nasıl yaparız?

Öncelikle kullanıcı modelini dahil edelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Veritabanımızda hangi kullanıcılar var? Şu şekilde görebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>>User.objects.all()
<SorguSetleri [<Kullanıcı: ola>]>
```

Bu daha önce oluşturduğumuz yetkili kullanıcı! Şimdi kullanıcının örneğini alalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> ben = User.objects.get(kullanıcı adı='ola')
```

Gördüğünüz gibi, 'ola' `kullanıcı adı`'yla aynı olan bir `kullanıcı` `aldık`. Muntazam! Tabiki, kendi kullanıcı adınızı kullanmak için bu satırı ayarlarınızı yapmanız gerekmektedir.

Gönderimizi artık kaydedebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

Yaşasın! Çalışıp çalışmadığını kontrol etmek ister misin?

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
<SorguSetleri [<Gönderi: gönderi başlığım>, <Gönderi: Diğer bir gönderi başlığı>, <Gönderi: Örnek başlık>]>
```

İşte bu kadar, listede bir gönderi daha!

### Daha fazla gönderi ekle

Şimdi daha fazla gönderi ekleyerek biraz eğlenebilir ve nasıl çalıştığını görebilirsin. İki veya üç tane daha ekle ve sıradaki bölüme geç.

### Nesneleri filtrelemek

QuerySet'lerin büyük bir bölümü onları filtreleme yeteneğidir. Diyelim ki ola yazarına ait tüm gönderileri bulmak istiyoruz. `Post.objects.all()` içindeki `all` yerine `filter` kullanacağız. Parantez içine istediğimiz blog gönderilerinin sorgusetimize girmesi için sağlaması gereken şart(lar) ı belirteceğiz. Bizim örneğimizde, `yazar`'ın `bana` eşit olma koşulu vardır. Django'da bu şu şekilde yazılır: `yazar=ben`. Şu an kod parçacığımız şöyle görünüyor:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(yazar=ben)
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Yada belkide içinde 'Başlık' kelimesi olan bütün gönderileri `başlık`alanında görmek istiyoruzdur?

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(baslik__contains='Nefis')
[<Post: Nefis bir gönderi>]
```

> **Not** `baslik` ve `contains` arasında iki tane alt çizgi (`_`) var. Django'nun ORM'i bu söz dizimini, özelliği ("title") ve operasyon veya filtreyi ("contains") ayırmak için kullanır. Eğer sadece tek bir alt çizgi kullanırsanız, "FieldError: Cannot resolve keyword title_contains" şeklinde bir hata alacaksınız.

Ayrıca yayınlananmış olan tüm gönderilerin bir listesini de alabilirsiniz. Bunu, yayınlanmış olan postlar içerisinde `yayınlanma_tarihi` şeklinde filtreleyerek yapıyoruz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> django.utils'ten zaman dilimlerini içe aktar
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Maalesef python konsolundan eklediğimiz gönderi henüz yayınlanmadı. Fakat bunu değiştirebiliriz! Önce yayınlamak istediğimiz bir gönderinin örneğini bulalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> post = Post.objects.get(baslik="Harika bir gönderi")
```

Ardından `yayinla` methodu ile gönderiyi yayınlayalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> post.yayinla()
```

Şimdi tekrar yayınlanmış gönderilerin listesini edinin.(Üç kere yukarı ok tuşuna basın ve `enter`)'a basın:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(yayinlanma_tarihi__lte=timezone.now())
[<Post: Harika bir gönderi>]
```

### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `yaratilma_tarihi` özelliğine göre sıralamayı deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('yaratilma_tarihi')
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Başına `-` ekleyerek sıralamayı tersine de çevirebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('-yaratilma_tarihi')
[<Post: Nefis bir gönderi>, <Post: Harika bir gönderi>, <Post: Gönderi 2>, <Post: Gönderi 1>]
```

### Sorgu Setlerini Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

    >>> Post.objects.filter(yayinlanma_tarihi__lte=timezone.now()).order_by('yayinlanma_tarihi')
    

Zincirleme gerçekten çok güçlüdür ve oldukça karmaşık sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Kabuğu kapatmak için, şunu yazalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> exit()
$
```