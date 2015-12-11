# İlk Django projen!

> Bu bölümün kaynağı Geek Girls Carrots (http://django.carrots.pl/) tutorial'ıdır.
>
> Bölümün parçaları Creative Commons Attribution-ShareAlike 4.0 International License ile lisanslı [django-marcador tutorial][1]'a dayanılarak hazırlanmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

 [1]: http://django-marcador.keimlink.de/

Basit bir blog oluşturacağız!

İlk adım yeni bir Django projesi başlatmaktır. Temel olarak Django tarafından sağlanan bazı scriptleri (komut dizilerini) çalıştırarak, Django projesinin iskeleti oluşturulacaktır. Bu sadece daha sonra kullanacağımız dosyalar ve dizinler grubudur.

Bazı dosya ve dizinlerin isimleri Django için çok önemlidir. Oluşturmak üzere olduğumuz dosyaları yeniden adlandırmamalısınız. Onları başka bir yere taşımak da iyi bir fikir değil. Django önemli şeyleri bulabilmek için belirli yapısını koruması gerekir.

> virtualenv içindeki herşeyi çalıştırmayı unutmayın. Eğer konsolunuzda bir önek `(myvenv)` görmüyorsanız virtualenv'nizi aktive etmelisiniz. **Django yükleme** bölümünün **virtualenv ile Çalışma** kısmında nasıl yapılacağını açıkladık. Windows'da ` myvenv\Scripts\activate` ya da Mac OS / Linux de `source myvenv/bin/activate` yazmak sizin için bunu yapacaktır.

MacOS veya Linux konsolunuzda aşağıdaki komutu çalıştırmalısınız; ** sonunda nokta `(.)` koymayı unutmayın **:

    (myvenv) ~/djangogirls$ django-admin startproject mysite .

Windows'da; ** sonunda nokta `(.)` koymayı unutmayın**:

    (myvenv) C:\Users\Name\djangogirls > django-admin startproject mysite .

> Nokta `.` çok önemli çünkü şu an bulunduğunuz dizine Django'yu yüklemek için koda söyler. ( nokta `. ` kısayol referansıdır)
>
> **Not** Yukarıdaki komutları yazarken sadece `django-admin` veya `django-admin.py` ile başlayan bölümü yazmayı unutmayın. Burada gösterilen `(myvenv) ~/djangogirls$` and `(myvenv) C:\Users\Name\djangogirls>` kısımları komut satırınızdaki girdilerinizi çağıracak olan komut isteği örnekleridir.

`django-admin.py` sizin için dosya ve dizinler oluşturacak bir komut dosyasıdır. Şimdi aşağıdaki gibi görünen bir dizin yapınız olmalı:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py

`manage.py` site yönetimine yardımcı olan bir komut dosyasıdır. Biz bununla bilgisayarımızda diğer şeyler arasında hiçbir şey kurmadan bir web sunucusunu başlatabileceğiz.

`settings.py` dosyası, web sitesinizin yapılandırmasını içerir.

Bir mektubu nereye götüreceğini kontrol eden postacının hakkında konuştuğumuzu hatırlıyor musun? `urls.py` dosyası `urlresolver` (url çözücü) tarafından kullanılan url örnekleri listesi içerir.

Şu an için değişiklik yapmayacağımız diğer dosyaları yoksayalım. Unutmamanız gereken tek şey kazayla onları silmeyin!

## Ayarları değiştirme

Hadi `mysite/settings.py` dosyasında bazı değişiklikler yapalım. Daha önceden kurduğunuz kod düzenleyicinizi kullanarak dosyayı açın.

Web sitemizin doğru bir saate sahip olması güzel olurdu. [wikipedia timezones list][2]'e gidin ve ilgili saat diliminizi (TZ -time zone-) kopyalayın. (örn. `Europe/Berlin` )

 [2]: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

`settings.py` dosyasında `TIME_ZONE` ifadesini içeren satırı bulun ve "Europe/Berlin" yazan kısmı uygun şekilde değiştirerek (örneğin "Europe/Istanbul") kendi seçtiğiniz zaman dilimine göre uyarlayın:

```python
TIME_ZONE = 'Europe/Berlin'
```

Sabit dosyalar için de bir tane yol (path) eklememiz gerekecek (Daha sonra eğitimde sabit dosyalar ve CSS hakkında herşeyi öğreneceğiz). Dosyanın *sonuna* en aşağıya `STATIC_URL` girdisinin altına gidin ve `STATIC_ROOT` adında bir girdi ekleyin:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## Veritabanı Kurulumu

Web uygulamalarınız için farklı birçok veritabanı yazılımı vardır. Biz varsayılan olanı kullanacağız, `sqlite3`.

Sqlite varsayılan olduğu için zaten `mysite/settings.py` dosyamızda kurulu:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Blogumuzun veritabanını oluşturmak için terminalde şu komutu çalıştırın:`python manage.py migrate` (komutu çalıştırırken `manage.py` dosyasının olduğu `djangogirls` klasörünün içinde olmalıyız ). İşler iyi giderse şöyle bir şey görmelisiniz:

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: messages, staticfiles
      Apply all migrations: contenttypes, sessions, admin, auth
    Synchronizing apps without migrations:
       Creating tables...
          Running deferred SQL...
       Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying sessions.0001_initial... OK

Bu kadar! Şimdi web sunucumuzu ayağa kaldırma ve websitemizin çalıştığını görme zamanı!

Öncelikle `manage.py` dosyasının bulunduğu dizinde olmalısınız (`djangogirls` klasörü). `python manage.py runserver` komutunu çalıştırarak terminal'den web sunucunuzu başlatabilirsiniz:

    (myvenv) ~/djangogirls$ python manage.py runserver

Eğer Windows'taysanız ve `UnicodeDecodeError` hatası varsa, bu komutu kullanın:

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000

Şimdi tek yapmanız gereken şey sitenizin çalışıp çalışmadığını kontrol etmek. Tarayıcınızı açın (Firefox, Chrome, Safari, Internet Explorer ya da ne kullanıyorsanız) ve şu adresi girin:

    http://127.0.0.1:8000/

Siz durdurana kadar web sunucusu komut istemi alacaktır. Sunucu çalışıyorken daha fazla komut girebilmek için yeni bir terminal penceresi açın ve virtualenv'inizi aktive edin. Web sunucunuzu durdurmak için çalıştığı pencereye tekrar gelin ve CTRL+C ye - Control ve C butonlarına aynı anda - basın (Windows için Ctrl+Break'e basmanız gerekiyor olabilir).

Tebrikler! ilk websitenizi oluşturdunuz ve bunu bir web sunucusu kullanarak yaptınız! Harika, değil mi?

![İşte çalışıyor!][3]

 [3]: images/it_worked2.png

Sonraki adım için hazır mısınız? İçerikleri oluşturma zamanı geldi!
