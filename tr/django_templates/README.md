# Django templateleri

Bazı verileri gösterme zamanı! Django bunun için bize faydalı bazı yerleşik **template etiketleri** sunuyor.

## Template etiketleri nedir?

Görüyorsunuz, HTML'de gerçek Python kodu yazamazsınız çünkü tarayıyıcılar bunu anlamazlar. Tarayıcılar sadece HTML kodlarını anlarlar. Bildiğimiz üzere Python çok daha dinamik bir dil iken, HTML de oldukça statiktir.

**Django şablon etiketleri** Python benzeri şeyleri HTML'e aktarmamıza izin verir, böylece dinamik websitelerini daha hızlı bir şekilde oluşturabilirsiniz. Harika!

## Gönderi listesi template'ini göster

Bir önceki bölümde, template'e `posts` değişkeni içinde gönderiler listesi verdik. Şimdi, bunu HTML'de göstereceğiz.

Django şablonunda bir değişken yazdırmak için, değişken adını çift kıvrımlı parantez içinde şu şekilde kullanırız:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Bunu `blog/templates/blog/post_list.html` şablonunda deneyelim. İkinci `<div>`'den üçüncü `</div>`'e kadar olan her şeyi `{{ posts }}` ile değiştirelim. Ne olduğunu görmek için dosyayı kaydedip sayfayı yenileyelim:

![Şekil 13.1](images/step1.png)

Gördüğümüz sadece bu:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: İkinci gönderim>, <Post: İlk gönderim>]>
```

Yani Django bunu bir nesneler listesi olarak algılıyor. **Python'a giriş**'ten listelerin nasıl gösterildiğini hatırlıyor musun? Evet, döngülerle! Bir Django template ile bunu şöyle yaparsın:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

Bunu kendi template'imizle deneyelim.

![Şekil 13.2](images/step2.png)

İşe yarıyor! Fakat bunların daha önce **HTML'ye giriş** bölümünde oluşturduğumuz statik gönderiler gibi görünmesini istiyoruz. HTML ve template etiketlerini karıştırabiliriz. `body` şöyle görünecektir:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}`{% for %}` ve `{% endfor %}` arasına koyduğunuz her şey listedeki her nesne için tekrarlanır. Sayfanı yenile:{% endraw %}

![Şekil 13.3](images/step3.png)

Bu sefer biraz daha farklı bir notasyon kullandığımızın farkında mısınız (`{{ post.title }}` or `{{ post.text }})`? Böylece `Post` modelinde tanımlanan alanlardaki verilere ulaşıyoruz. Ayrıca `|linebreaksbr` satırsonlarını paragrafa dönüştürmek için gönderilerin içindeki metinleri bir filtre ile yönlendiriyor.

## Bir şey daha

Websitenizi internette çalışır halde görmek iyi olur değilmi? PythonAnywhere tekrar çalıştıralım. Adımları hatırlayalım…

* İlk önce kodumuzu Github'a push komutu ile yükleyelim

{% filename %}komut-satırı{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Veritabanından gönderileri göstermek için template'ler değiştirildi."
    [...]
    $ git push
    

* [PythonAnywhere](https://www.pythonanywhere.com/consoles/)'e bağlanalım ve **Bash konsolu**'na gidelim (veya yeni bir konsol açalım) ve şunu çalıştıralım:

{% filename %}PythonAnywhere komut-satırı{% endfilename %}

    $ cd ilk-blogum
    $ git pull
    [...]
    

* Ve son olarak da [Web tab](https://www.pythonanywhere.com/web_app_setup/) sekmesine gidip web uygulamamızdaki **Reload**'a basalım. Şimdi güncellememiz yayında olmalı! Eğer PythonAnywhere sitesindeki gönderilerin içeriği ile lokal sunucunuzda bulunan gönderilerin içeriği aynı değilse sorun değil. Lokal bilgisayarınızdaki veritabanı ile Python Anywhere'deki veritabanı, diğer dosyalarınız gibi eşitlenmiyor.

Tebrikler! Django admin üzerinden yeni bir gönderi ekleyin (yayinlama_tarihi eklemeyi unutmayın!) PythonAnywhere sitenizinin Django admin'inde olduğunuzdan emin olun, https://yourname.pythonanywhere.com/admin. Arkasından gönderileri görebilmek için ordaki sayfanızı yenileyin.

Şiir gibi çalışıyor değil mi? Gurur duyuyoruz! Bi süre bilgisayarınızdan uzaklaşın - molayı hak ettiniz. :)

![Şekil 13.4](images/donut.png)