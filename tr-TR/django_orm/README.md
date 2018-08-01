# Django ORM ve QuerySets (SorguSetleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

QuerySet (SorguSeti), esas olarak, verilen bir modele ait nesnelerin listesidir. QuerySet veritabanından veri okumamıza, veriyi filtrelememize ve sıralamamıza imkan sağlar.

En kolayı örnek ile öğrenmektir. Hadi deneyelim, olur mu?

## Django shell (kabuk)

Bilgisayarımızdaki konsolu açalım (PythonAnywhere'dekini değil) ve şu komutu yazalım:

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

Önce tüm post'larımızı görüntülemeyi deneyelim. Bunu aşağıdaki komut ile yapabiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Ahh! Bir hata meydana geldi. Bize Post'un tanımlı olmadığını söylüyor. Bu doğru, öncesinde post'u dahil etmeyi (import) unuttuk!

{% filename %}komut-satırı{% endfilename %}

```python
>>> from blog.models import Post
```

`blog.models`'dan `Post` modelini dahil ettik (import). Tekrar bütün post'ları görüntülemeyi deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

Bu daha önce oluşturduğumuz post'ların listesi! Bu post'ları Django admin arayüzü ile oluşturduk. Fakat şimdi python'u kullanarak yeni post'lar oluşturmak istiyoruz, peki bunu nasıl yaparız?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(author=ben, title='Harika bir gönderi', text='Ne desem bilemedim')
```

Ancak bir eksiğimiz var: `ben`. Gönderinin yazar (author) özelliğine `User` (kullanıcı) modelinden türetilen bir nesneyi parametre olarak vermemiz gerekiyor. Nasıl verebiliriz?

Öncelikle User (kullanıcı) modelini dahil edelim:

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

Daha önce yarattığımız süper kullanıcı! Şimdi veritabanından User (kullanıcı) nesnesi alalım:

{% filename %}komut-satırı{% endfilename %}

```python
ben = User.objects.get(username='zeynep')
```

Gördüğünüz gibi, `username` (kullanıcı adı) özelliği 'zeynep' olan `User` nesnesini `get` ile aldık. Müthiş! Tabiki, kullanıcı adını kendi kullanıcı adınıza göre ayarlamalısınız.

Gönderimizi artık kaydedebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.create(author=ben, title='Harika bir gönderi', text='Ne desem bilemedim')
<Post: Harika bir gönderi>
```

Yaşasın! Çalışıp çalışmadığını kontrol etmek ister misin?

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: Gönderi başlığım>, <Post: Diğer bir gönderi başlığı>,<Post: Harika bir gönderi>]>
```

İşte bu kadar, listede bir gönderi daha!

### Daha fazla post ekle

Şimdi daha fazla post ekleyerek biraz eğlenebilir ve nasıl çalıştığını görebilirsin. İki veya üç tane daha ekle ve sıradaki bölüme geç.

### Nesneleri filtrelemek

QuerySet'lerin büyük bir bölümü onları filtreleme yeteneğidir. Diyelim ki, Zeynep tarafından yazılmış tüm post(gönderileri) bulmak istiyoruz. `Post.objects.all()` içindeki `all` yerine `filter` kullanacağız. Parantez içine istediğimiz blog gönderilerinin sağlaması gereken şartları belirteceğiz. Örneğimizde, `author(yazar)` `ben`'e eşitti. Django'da bu filtre şöyle yazılır: `author=ben`. Şu an kod parçacığımız şöyle görünüyor:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(author=ben)
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Ya da belki `title(başlık)` alanında içinde 'Nefis' kelimesini içeren tüm gönderileri görmek istiyoruz?

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(title__contains='Nefis')
[<Post: Nefis bir gönderi>]
```

> **Not** `title` (başlık) ve `contains` arasında iki tane alt çizgi (`_`) var. Django'nun ORM'i bu söz dizimini, özelliği ("title") ve operasyon veya filtreyi ("contains") ayırmak için kullanır. Eğer sadece tek bir alt çizgi kullanırsanız, "FieldError: Cannot resolve keyword title_contains" şeklinde bir hata alacaksınız.

Ayrıca yayınlanmış tüm post'ların bir listesini alabiliriz. Bunu geçmişte `published_date` (yayinlanma_tarihi) alanı belirtilmiş tüm gönderileri filtreleyerek yapıyoruz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Maalesef python konsolundan eklediğimiz post(gönderi) henüz yayınlanmadı. Fakat bunu değiştirebiliriz! Önce yayınlamak istediğimiz bir gönderinin örneğini bulalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> post = Post.objects.get(title="Harika bir gönderi")
```

Ardından `publish (yayinla)` methodu ile gönderiyi yayınlayalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> post.publish()
```

Şimdi yayınlanmış gönderileri tekrar almaya çalışalım (3 kez yukarı yön ve ardından `enter` tuşuna basın):

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Harika bir gönderi>]
```

### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `created_date` (yaratilma_tarihi) özelliğine göre sıralamayı deneyelim:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Başına `-` ekleyerek sıralamayı tersine de çevirebiliriz:

{% filename %}komut-satırı{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: Nefis bir gönderi>, <Post: Harika bir gönderi>, <Post: Gönderi 2>, <Post: Gönderi 1>]
```

### Sorgu Setlerini(QuerySets) Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Gönderi 2>, <Post:Harika bir gönderi!>, <Post: Nefis bir gönderi>, <Post: Gönderi 1>]>
```

Zincirleme gerçekten çok güçlüdür ve oldukça karmaşık sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Kabuğu kapatmak için, şunu yazalım:

{% filename %}komut-satırı{% endfilename %}

```python
>>> exit()
$
```