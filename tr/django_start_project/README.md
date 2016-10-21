# İlk Django projen!

> Bu bölümün kaynağı Geek Girls Carrots (http://django.carrots.pl/) eğitim materyalidir.
> 
> Bölümün parçaları Creative Commons Attribution-ShareAlike 4.0 International License ile lisanslı [django-marcador tutorial][1]'a dayanılarak hazırlanmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

 [1]: http://django-marcador.keimlink.de/

Basit bir blog oluşturacağız!

İlk adım yeni bir Django projesi başlatmaktır. Aslında, bizim için bir Django projesinin iskeletini yaratacak Django tarafından sağlanan bazı komut dosyaları çalıştıracağız. Bu sadece daha sonra kullanacağımız dosyalar ve dizinler grubudur.

Bazı dosya ve dizinlerin isimleri Django için çok önemlidir. Oluşturmak üzere olduğumuz dosyaları yeniden adlandırmamalısınız. Onları başka bir yere taşımak da iyi bir fikir değil. Django'nun önemli şeyleri bulabilmesi için belirli yapısını koruması gerekir.

> virtualenv içindeki her şeyi çalıştırmayı unutmayın. Eğer konsolunuzda bir önek `(myvenv)` görmüyorsanız virtualenv'nizi çalışır hale getirmelisiniz. **Django yükleme** bölümünün **virtualenv ile Çalışma** kısmında nasıl yapılacağını açıkladık. Windows'da ` myvenv\Scripts\activate` ya da Mac OS / Linux'ta `source myvenv/bin/activate` yazmak sizin için bunu yapacaktır.

MacOS veya Linux konsolunuzda aşağıdaki komutu çalıştırmalısınız; **sonuna nokta `.` koymayı unutmayın**:

```
(myvenv) ~/djangogirls$ django-admin startproject mysite .
```

Windows'ta; ** sonunda nokta `.` koymayı unutmayın**:

```
(myvenv) C:\Users\Name\djangogirls> django-admin.py startproject mysite .
```

> Nokta `.` bu durumda çok önemlidir çünkü; koda, Django'yu şu an bulunduğunuz dizine yüklemesini söyler. ( nokta `. ` kısayol referansıdır)
> 
> **Not** Yukarıdaki komutları yazarken sadece `django-admin` veya `django-admin.py` ile başlayan bölümü yazmayı unutmayın. Burada gösterilen `(myvenv) ~/djangogirls$` ve `(myvenv) C:\Users\Name\djangogirls>` kısımları, sadece, komut satırınızdaki girdilerinizi çağıracak olan komut isteği örnekleridir.

`django-admin.py` sizin için dosya ve dizinler oluşturacak bir komut dosyasıdır. Şimdi aşağıdaki gibi görünen bir dizin yapınız olmalı:

```
djangogirls
├───manage.py
└───mysite
        settings.py
        urls.py
        wsgi.py
        __init__.py
```  

`manage.py` site yönetimine yardımcı olan bir komut dosyasıdır. Bu dosya sayesinde, başka herhangi bir şey kurmadan bilgisayarımızda bir web sunucusunu başlatabileceğiz.

`Settings.py` dosyası, web sitesinizin yapılandırmasını içerir.

Bir mektubu nereye götüreceğini kontrol eden postacının hakkında konuştuğumuzu hatırlıyor musun? `urls.py` dosyası `urlresolver`(urlçözümleyici) tarafından kullanılan desenler listesi içerir.

Şu an için değişiklik yapmayacağımız diğer dosyaları yoksayalım. Unutmamanız gereken tek şey kazayla onları silmeyin!

## Ayarları değiştirme

Hadi `mysite/settings.py` dosyasında bazı değişiklikler yapalım. Daha önceden kurduğunuz kod düzenleyicinizi kullanarak dosyayı açın.

Web sitemizin doğru bir saate sahip olması güzel olurdu. [wikipedia timezones list][2] 'e gidin ve ilgili saat diliminizi (TZ -time zone-) kopyalayın. (örn. `Europe/Istanbul` )

 [2]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

`settings.py` dosyasında <0>TIME_ZONE</0> ifadesini içeren satırı bulun ve kendi seçtiğiniz zaman dilimine göre uyarlayın:

```python
  TIME_ZONE = 'Europe/Istanbul'
```  

"Europe/Istanbul" uygun şekilde değiştirildi

Sabit dosyalar için de bir tane yol eklememiz gerekecek (Daha sonra eğitimde sabit dosyalar ve CSS hakkındaki her şeyi öğreneceğiz). Dosyanın *sonuna* en aşağı `STATIC_URL` girdisinin altına gidin ve `STATIC_ROOT` adında bir şey ekleyin:

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

## Veritabanı Kurulumu

Web uygulamalarınız için farklı birçok veritabanı yazılımı vardır. Biz varsayılanı kullanacağız, `sqlite3`.

Sqlite varsayılan olduğu için zaten `mysite/settings.py` dosyamızda kurulu:

```python
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.sqlite3',
          'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
      }
  }
```  

Blogumuzun veritabanını oluşturmak için konsolda şu komutu çalıştırın:`python manage.py migrate` (`manage.py` dosyasını içeren `djangogirls` klasöründe olmalıyız). İşler iyi giderse şöyle bir şey görmelisiniz:

```
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
```

Hepsi bu kadar! Web server'ı çalıştırma ve websitemizin çalıştığını görme zamanı!

`manage.py` dosyasının bulunduğu dizinde olmalıyız (`djangogirls` klasörü). Konsol üzerinden `python manage.py runserver` komutunu çalıştırarak web servere başlatabilirsiniz:

```
(myvenv) ~/djangogirls$ python manage.py runserver
```

Eğer Windows'taysanız ve `UnicodeDecodeError` hatası varsa, bu komutu kullanın:

```
(myvenv) ~/djangogirls$ python manage.py runserver 0:8000
```

Şimdi tek yapmanız gereken, sitenizin çalışıp çalışmadığını kontrol etmek. Tarayıcınızı (Firefox, Chrome, Safari, Internet Explorer ya da ne kullanıyorsanız) açın ve şu adresi girin:

```
http://127.0.0.1:8000/
```    

Web sunucusu, siz durdurana kadar komut istemi almaya devam edecektir. Server çalışıyorken daha fazla komut girebilmek için yeni bir terminal penceresi açın ve virtualenv'inizi aktive edin. Web server'ı durdurmak için çalıştığı pencereye tekrar gelin ve CTRL+C ye -Control ve C butonlarına birlikte - basın (Windows için Ctrl+Break'e basmanız gerekiyor olabilir).

Tebrikler! ilk web siteni oluşturdun ve web server kullanarak çalıştırdın! Harika, değil mi?

![İşte çalışıyor!][3]

 [3]: images/it_worked2.png

Sonraki adım için hazır mısın? İçerikleri oluşturma zamanı!
