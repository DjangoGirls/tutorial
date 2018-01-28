# İlk Django projen!

> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (https://github.com/ggcarrots/django-carrots).
> 
> Bu bölümün [django-marcador tutorial](http://django-marcador.keimlink.de/)'a dayanan bazı kısımları Creative Commons Attribution-ShareAlike International License altında lisanslanmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

Küçük bir blog oluşturacağız!

İlk adım yeni bir Django projesi başlatmaktır. Aslında, bizim için bir Django projesinin iskeletini yaratacak Django tarafından sağlanan bazı komut dosyaları çalıştıracağız. Bu sadece daha sonra kullanacağımız dosyalar ve dizinler grubudur.

Bazı dosya ve dizinlerin isimleri Django için çok önemlidir. Oluşturmak üzere olduğumuz dosyaları yeniden adlandırmamalısınız. Onları başka bir yere taşımak da iyi bir fikir değil. Django'nun önemli şeyleri bulabilmesi için belirli yapısını koruması gerekir.

> virtualenv içindeki her şeyi çalıştırmayı unutmayın. Eğer konsolunuzda `(myenv)` öneki görmüyorsanız, virtualenv'inizi aktive etmeniz gerekir. **Django yükleme** bölümünün **virtualenv ile Çalışma** kısmında nasıl yapılacağını açıkladık. Windows'ta `myvenv\Scripts\activate` ya da, Mac OS ya da Linux'ta `source myvenv/bin/activate` yazmak bunu sizin için yapacaktır.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

Mac OS X or Linux konsolunuzda, devam eden şu komutu çalıştırmalısınız. **Periyot eklemeyi unutmayın (yada nokta)`.`sonunda!**

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> Nokta `.` bu durumda çok önemlidir çünkü; koda, Django'yu şu an bulunduğunuz dizine kurmasını söyler. (nokta `.` şu anki dizine bir kısayoldur).
> 
> **Not** Yukarıdaki komutu yazarken, sadece `django-admin` ile başlayan kısmı yazmanız gerektiğini unutmayın. Burada gösterilen `(myvenv) ~/djangogirls$` kısmı, sadece komut satırında girdinizi davet eden komut istemi örneğidir.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

Windows'ta aşağıdaki kumutu çalıştırmalısınız. **(Sonuna nokta `.` koymayı unutmayın)**:

{% filename %}komut-satırı{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> Nokta `.` bu durumda çok önemlidir çünkü; koda, Django'yu şu an bulunduğunuz dizine kurmasını söyler. (nokta `.` şu anki dizine bir kısayoldur).
> 
> **Not** Yukarıdaki komutu yazarken, sadece `django-admin.exe` ile başlayan bölümü yazmanız gerektiğini unutmayın. Burada gösterilmiş olan `(myvenv) C:\Users\Name\djangogirls>` kısmı komut satırına girdiğiniz davet edecek olan komut istemi örneğidir.

<!--endsec-->

`django-admin.py` sizin için dosya ve dizinler oluşturacak bir komut dosyasıdır. Şimdi aşağıdaki gibi görünen bir dizin yapınız olmalı:

    djangogirls
    ├───manage.py
    └───mysite
            settings.py
            urls.py
            wsgi.py
            __init__.py
    

> **Not**: Dizin yapınızda, daha önceden oluşturduğumuz `venv` dizinini de göreceksiniz.

`manage.py` siteyi yönetmenize yardımcı olan bir scripttir (komut). Bununla başka herhangi bir şey yüklemeden kendi bilgisayarımızda bir web sunucusu başlatabileceğiz.

`settings.py` dosyası, web sitesinizin ayarlarını içerir.

Bir mektubu nereye götüreceğini kontrol eden postacının hakkında konuştuğumuzu hatırlıyor musun? `urls.py` dosyası `urlresolver`(urlçözümleyici) tarafından kullanılan desenler listesi içerir.

Şu an için değişiklik yapmayacağımız diğer dosyaları yoksayalım. Unutmamanız gereken tek şey kazayla onları silmeyin!

## Ayarları değiştirme

Hadi `mysite/settings.py` dosyasında bazı değişiklikler yapalım. Daha önceden kurduğunuz kod düzenleyicinizi kullanarak dosyayı açın.

**Not**: Bunu aklınızda tutun, `settings.py` dosyası da diğerleri gibi düzenli bir dosyadır. Bunu kod düzenleyicisi içerisinde "dosya -> aç" menü eylemini kullanarak açabilirsiniz. Bu, size `settings.py` dosyanıza gidebileceğiniz ve bu dosyayı seçebileceğiniz her zamanki klasik pencereyi alacaktır. Alternatif olarak, bu dosyayı masaüstünüzdeki djangogirls klasörüne gidip sağ tıklayarak açabilirsiniz. Sonra, listeden kod düzenleyicinizi seçiniz. Dosyayı açabilen ancak düzenlemenize izin vermeyecek diğer programların yüklü olabilmesi nedeniyle kod düzenleyicinin seçilmesi önem arz etmektedir.

Web sitemizin doğru bir saate sahip olması güzel olurdu. [Wikipedia'nın zaman dilimleri listesine](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) gidin ve ve ilgili saat dilimini kopyalayın (ZD) (Ör. `Europe/Berlin`).

`settings.py`'de, `TIME_ZONE` içeren satırı bulun ve kendi zaman diliminizi seçmek için değiştirin. Örnek olarak:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Istanbul'
```

Bir dil kodu dilden oluşmaktadır, ör. `en` ingilizce için veya `de` almanca için, ve ülke kodu da, ör. `de` almanya için veya `ch`isviçre için. Django'daki varsayılan butonların ve bildirimlerin sizin dilinizde olmasını istiyorsanız bunu eklemek isteyeceksiniz. Böylece "İptal" butonu burada tanımladığınız dile çevrilmiş olacaktır. [Django hazırlanmış olan bir çok çeviri ile birlikte gelmektedir](https://docs.djangoproject.com/en/1.11/ref/settings/#language-code).

Aşağıdaki satırı değiştirerek dil kodunu değiştiriniz:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

Ayrıca statik dosyalar için bir yol eklememiz gerekmektedir. (Eğitici ders içerisinde statik dosyalar ve CSS hakkında ayrıntılı bilgi bulabilirsiniz.) Dosyanın *son*'una gidin, hemen altında sadece `STATIC_URL` girişi yapın, `STATIC_ROOT` adında yeni birim ekleyin:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

`DEBUG(Hata Ayıklama)` `True(Doğru)` ve `ALLOWED_HOSTS` boş olduğu zaman ana bilgisayar `['localhost', '127.0.0.1', '[::1]']`'a karşı doğrulanır. Bu, uygulamamızı dağıttıktan sonra, PythonAnywhere'deki anamakine adıyla eşleşmeyecek ve böylece aşağıdaki ayarları değiştireceğiz:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **Not**: Eğer Chromebook kullanıyorsanız bu satırı settings.py dosyanızın en altına ekleyiniz: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Ayrıca eğer cloud9 kullanıyorsanız `ALLOWED_HOSTS`'a `.c9users.io` 'i ekleyin

## Bir veritabanı kur

Web uygulamalarınız için farklı birçok veritabanı yazılımı vardır. Biz varsayılanı kullanacağız, `sqlite3`.

Sqlite varsayılan olduğu için zaten `mysite/settings.py` dosyamızda kurulu:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

Blogumuzun veritabanını oluşturmak için konsolda şu komutu çalıştırın:`python manage.py migrate` (`manage.py` dosyasını içeren `djangogirls` klasöründe olmalıyız). İşler iyi giderse şöyle bir şey görmelisiniz:

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying sessions.0001_initial... OK
    

Hepsi bu kadar! Web sunucusunu (web server) çalıştırma ve websitemizin çalıştığını görme zamanı!

## Web sunucusunu başlatmak

`manage.py` dosyasının bulunduğu dizinde olmalıyız (`djangogirls` klasörü). Konsol üzerinden `python manage.py runserver` komutunu çalıştırarak web sunucusunu başlatabilirsiniz:

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

Eğer Chromebook üzerindeyseniz, bunun yerine şu komutu kullanın:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

Eğer Windows'taysanız ve `UnicodeDecodeError` hatası varsa, bu komutu kullanın:

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Şimdi tek yapmanız gereken sitenizin çalışıp çalışmadığına bakmak. Tarayıcınızı açın (Firefox, Chrome, Safari, Internet Explorer veya ne tercih ediyorsanız) ve bu adresi girin:

{% filename %}tarayıcı{% endfilename %}

    http://127.0.0.1:8000/
    

Eğer Chromebook kullanıyorsanız, her seferinde test sunucusunu ziyaret edeceksiniz ve erişeceksiniz:

{% filename %}tarayıcı{% endfilename %}

    https://django-girls-<your cloud9 username>.c9users.io
    

Tebrikler! ilk web siteni oluşturdun ve web sunucusu kullanarak çalıştırdın! Harika, değil mi?

![İşte çalışıyor!](images/it_worked2.png)

Web sunucusu çaışırken ek komutlar girmek için yeni bir komut satır istemi göremezsiniz. Terminal yeni metin kabul edecek ama yeni komutları çalıştırmayacaktır. Bunun nedeni web sunucusunun duraklamadan gelen talepleri algılamasıdır.

> Web sunucuları nasıl çalışır **How the Internet works (İnternet Nasıl Çalışır)** bölümünde görmüştük.

Ağ sunucusu açıkken yeni komut yazmak için, yeni bir terminal penceresi açıp virtualenv aktive etmeniz gerekmektedir. Web sunucusunu durdurmak için, çalıştığı pencereye geri dönün ve CTRL+C ye basın -Control ve C tuşlarına birlikte. (Windows'ta Ctrl+Break tuşları olabilir.).

Sonraki adım için hazır mısın? İçerikleri oluşturma zamanı!