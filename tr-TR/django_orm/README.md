# Django ORM ve QuerySets (Sorgu Setleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

QuerySet (SorguSeti), esas olarak, verilen bir modelin nesnelerinin listesidir. QuerySet veritabanından veri okumamıza, veriyi filtrelememize ve sıralamamıza imkan sağlar.

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

Şu an Django'nun etkileşimli konsolundayız. Python istemine benziyor, ama biraz Django büyüsü eklenmiş :) Kuşkusuz burada da Python komutlarının tümünü kullanabiliriz.

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
<QuerySet [<Post: Gönderi başlığım>, <Post: Diğer bir gönderi başlığı>]>
```

Bu daha önce oluşturduğumuz gönderilerin listesi! Bu gönderileri Django admin arayüzü ile oluşturduk. Fakat şimdi python'u kullanarak yeni gönderiler oluşturmak istiyoruz, peki bunu nasıl yaparız?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(author=ben, title='Harika bir gönderi', text='Ne desem bilemedim')
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
>>> User.objects.all()
<QuerySet [<User: zeynep>]>
```

Bu daha önce oluşturduğumuz yetkili kullanıcı! Şimdi kullanıcının örneğini alalım:

{% filename %}komut-satırı{% endfilename %}

```python
ben = User.objects.get(username='zeynep')
```

Gördüğünüz gibi, `username` özelliği 'zeynep' olan `User` nesnesini `get` ile aldık. Müthiş! Tabiki, kullanıcı adını kendi kullanıcı adınıza göre ayarlamalısınız.

Gönderimizi artık kaydedebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
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
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Yada belkide içinde 'Başlık' kelimesi olan bütün gönderileri `başlık`alanında görmek istiyoruzdur?

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **Not** `baslik` ve `contains` arasında iki tane alt çizgi (`_`) var. Django'nun ORM'i bu söz dizimini, özelliği ("title") ve operasyon veya filtreyi ("contains") ayırmak için kullanır. Eğer sadece tek bir alt çizgi kullanırsanız, "FieldError: Cannot resolve keyword title_contains" şeklinde bir hata alacaksınız.

Ayrıca yayınlananmış olan tüm gönderilerin bir listesini de alabilirsiniz. Bunu, yayınlanmış olan postlar içerisinde `yayınlanma_tarihi` şeklinde filtreleyerek yapıyoruz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
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
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `yaratilma_tarihi` özelliğine göre sıralamayı deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

Başına `-` ekleyerek sıralamayı tersine de çevirebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Sorgu Setlerini Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

Zincirleme gerçekten çok güçlüdür ve oldukça karmaşık sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Kabuğu kapatmak için, şunu yazalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> exit()
$
```