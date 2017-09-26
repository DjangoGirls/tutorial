# Django modelleri

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Nesneler

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

Peki bir nesne nedir? Özelliklerin ve hareketlerin bir bütünüdür. Kulağa garip geliyor olabilir ama bir örnekle açıklayacağız.

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

Öyleyse blog gönderilerini nasıl modelleyeceğiz? Bir blog tasarlamak istiyoruz degil mi?

Cevaplamamız gereken soru: Blog gönderisi nedir? Özellikleri ne olmalıdır?

Tabii ki blog gönderimizin içeriği için yazı ve bir de başlık lazım, değil mi? It would be also nice to know who wrote it – so we need an author. Son olarak, gönderinin ne zaman yaratıldığını ve yayınlandığını bilmek isteriz.

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

A model in Django is a special kind of object – it is saved in the `database`. Veritabanı veri topluluğuna verilen isimdir. Burası, kullanıcıları, blog gönderileri gibi bilgileri saklayacağımız yerdir. Verilerimizi depolamak için SQLite veritabanını kullanacağız. This is the default Django database adapter – it'll be enough for us right now.

Veritabanındaki bir modeli sütunları (alan adı) ve satırları (veri) olan bir hesap çizelgesi olarak düşünebiliriz.

### Uygulama oluşturma

Her şeyi derli toplu tutmak için, projemizin içinde ayrı bir uygulama oluşturacağız. Her şeyin en başından düzenli olması çok iyidir. Bir uygulama oluşturmak için aşağıdaki komutu konsolda çalıştırmamız gerekiyor ( `djangogirls` dizininden `manage.py` dosyasının bulunduğu yer):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. Bunu `mysite/settings.py` dosyası ile yapıyoruz. We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. Sonunda dosya şuna benzemelidir:

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

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
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

> Double-check that you use two underscore characters (`_`) on each side of `str`. İki alt çizgi Python dilinde sık kullanılır. 

It looks scary, right? But don't worry – we will explain what these lines mean!

`from` veya `import` ile başlayan tüm satırlar başka yerlerden bir şeyleri projemize dahil eder. Yani, başka yerlerde tanımlanmış kodları dosyalarımıza kopyalamak yerine, bu kodların bir kısmını `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` bir nesne tanımladığımızı belirten bir anahtar kelimedir.
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` Post'un bir Django Modeli olduğunu belirtir, bu şekilde Django onu veritabanında tutması gerektiğini bilir.

Şimdi daha önce bahsettiğimiz özellikleri tanımlayabiliriz: `baslik`, `yazi`, `yaratilma_tarihi`, `yayinlanma_tarihi` ve `yazar` (Türkçe karakterleri kullanamadığımızı unutmayalım). To do that we need to define the type of each field (Is it text? Sayı mı? Tarih mi? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

Burada her detayı anlatmıyoruz, çünkü çok fazla vakit alır. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

Peki `def yayinla(self):` nedir? This is exactly the `publish` method we were talking about before. `def` bir fonksiyon/method olduğunu belirtir, `yayinla` ise bu methodun adıdır. You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Genellikle methodlar bir şey geri döndürür (`return` anahtar kelimesi döndür anlamına gelir). `__str__` methodunda bunun örneğini görebiliriz. Bu durumda `__str__()` methodunu çağırdığımızda Post başlığının yazısını (**string**) elde ederiz.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

Buraya kadar model hakkında anlamadığın bir şeyler varsa mentörüne sormaktan çekinme! Bu konuların biraz karmaşık olduğunun farkındayız. Özellikle hem nesneleri hem de fonksiyonları aynı anda öğrenmek kolay değil. Umarız gizemi biraz azalmaya başlamıştır!

### Modeller için veritabanında tablo oluşturma

Son adımımız yeni modelimizin veritabanına eklenmesini sağlamak. First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. Şöyle görünmeli:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

Yaşasın! Post modelimiz artık veritabanımızda! Görsek ne güzel olur, değil mi? Gelecek bölümde Post'un nasıl göründügünü göreceğiz!