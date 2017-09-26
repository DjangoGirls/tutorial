# Django ORM ve QuerySets (Sorgu Setleri)

Bu bölümde Django'nun veritabanına nasıl bağlandığını ve veriyi nasıl sakladığını öğreneceğiz. Hadi başlayalım!

## QuerySet (SorguSeti) Nedir?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

En kolayı örnekle öğrenmektir. Hadi deneyelim, olur mu?

## Django shell (kabuk)

Yerel konsolumuzu açalım (PythonAnywhere'dekini değil) ve şu komutu yazalım:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

Etkisi aşağıdaki gibi olmalı:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

You're now in Django's interactive console. It's just like the Python prompt, but with some additional Django magic. :) You can use all the Python commands here too, of course.

### Tüm nesneler

Önce tüm gönderilerimizi görüntülemeyi deneyelim. Bunu aşağıdaki komut ile yapabiliriz:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

Oops! An error showed up. It tells us that there is no Post. It's correct – we forgot to import it first!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

This is simple: we import the model `Post` from `blog.models`. Let's try displaying all posts again:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

This is a list of the posts we created earlier! We created these posts using the Django admin interface. But now we want to create new posts using Python, so how do we do that?

### Nesne oluşturma

Veritabanına yeni bir gönderi eklemek için:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

But we have one missing ingredient here: `me`. We need to pass an instance of `User` model as an author. How do we do that?

Öncelikle kullanıcı modelini dahil edelim:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

Veritabanımızda hangi kullanıcılar var? Şu şekilde görebiliriz:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

As you can see, we now `get` a `User` with a `username` that equals 'ola'. Neat! Of course, you have to adjust this line to use your own username.

Gönderimizi artık kaydedebiliriz:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(yazar=ben, baslik='Harika bir gönderi', yazi='Ne desem bilemedim')
```

Yaşasın! Çalışıp çalışmadığını kontrol etmek ister misin?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

İşte bu kadar, listede bir gönderi daha!

### Daha fazla gönderi ekle

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### Nesneleri filtrelemek

A big part of QuerySets is the ability to filter them. Let's say we want to find all posts that user ola authored. `Post.objects.all()` içindeki `all` yerine `filter` kullanacağız. In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. The way to write it in Django is `author=me`. Şu an kod parçacığımız şöyle görünüyor:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(yazar=ben)
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Or maybe we want to see all the posts that contain the word 'title' in the `title` field?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(baslik__contains='Nefis')
[<Post: Nefis bir gönderi>]
```

> **Not** `baslik` ve `contains` arasında iki tane alt çizgi (`_`) var. Django's ORM uses this rule to separate field names ("title") and operations or filters ("contains"). If you use only one underscore, you'll get an error like "FieldError: Cannot resolve keyword title_contains".

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(baslik="Harika bir gönderi")
```

And then publish it with our `publish` method:

{% filename %}command-line{% endfilename %}

```python
>>> post.yayinla()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(yayinlanma_tarihi__lte=timezone.now())
[<Post: Harika bir gönderi>]
```

### Nesneleri Sıralama

QuerySets ayrıca nesne listesini sıralamanızı da sağlar. Nesneleri `yaratilma_tarihi` özelliğine göre sıralamayı deneyelim:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('yaratilma_tarihi')
[<Post: Gönderi 1>, <Post: Gönderi 2>, <Post: Harika bir gönderi>, <Post: Nefis bir gönderi>]
```

Başına `-` ekleyerek sıralamayı tersine de çevirebiliriz:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-yaratilma_tarihi')
[<Post: Nefis bir gönderi>, <Post: Harika bir gönderi>, <Post: Gönderi 2>, <Post: Gönderi 1>]
```

### Sorgu Setlerini Zincirlemek

Sorgu setlerini **zincirleyerek** beraber kullanabilirsiniz:

    >>> Post.objects.filter(yayinlanma_tarihi__lte=timezone.now()).order_by('yayinlanma_tarihi')
    

Zincirleme gerçekten çok güçlüdür ve oldukça karmaşık sorgular yazmanıza imkan sağlar.

Güzel! Şimdi bir sonraki bölüm için hazırız. Kabuğu kapatmak için, şunu yazalım:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```