# Django templateleri

Bazı verileri gösterme zamanı! Django bunun için bize faydalı bazı yerleşik **template etiketleri** sunuyor.

## Template etiketleri nedir?

Görüyoruz ki aslında, HTML'de Python kodu yazamayız, çünkü tarayıcılar bunu anlamaz. Tarayıcılar yalnızca HTML'den anlar. Biliyoruz ki Python daha dinamik bir dil iken, HTML oldukça statiktir.

**Django template etiketleri** Python benzeri yapıların HTML'ye aktarılmasını sağlar, böylece dinamik web sitelerini daha kolay ve hızlı oluşturabiliriz!

## Gönderi listesi template'ini gösterme

Bir önceki bölümde, template'e `posts` değişkeni içinde gönderiler listesi verdik. Şimdi, bunu HTML'de göstereceğiz.

Django şablonunda (template) bir değişken (variable) yazdırmak için, değişken adını çift kıvrımlı parantez içinde şu şekilde kullanırız:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

Bunu `blog/templates/blog/post_list.html` şablonunda deneyelim. Dosyayı kod editöründe açalım ve ikinci `<div>`'den üçüncü `</div>`'e kadar olan her şeyi `{{ posts }}` ile değiştirelim. Ne olduğunu görmek için dosyayı kaydedip sayfayı yenileyelim:

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
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %}`{% for %}` ve `{% endfor %}` arasına koyduğunuz her şey listedeki her nesne için tekrarlanır. Sayfanı yenile:{% endraw %}

![Şekil 13.3](images/step3.png)

Bu sefer biraz daha farklı bir notasyon kullandığımızın farkında mısınız (`{{ post.title }}` or `{{ post.text }})`)? Böylece `Post` modelinde tanımlanan alanlardaki verilere ulaşıyoruz. Ayrıca `|linebreaks` (satırsonu), gönderilerin metnini, satır sonlarını paragraflara çeviren bir filtreden geçiriyor.

## Bir şey daha

Web sitemizin İnternet'te hâlâ çalıştığını görmek iyi olacak, değil mi? PythonAnywhere'e yükleyelim yine. Adımları hatırlayalım…

* İlk önce kodumuzu Github'a push komutu ile yükleyelim

{% filename %}komut-satırı{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Veritabanındaki gönderileri görüntülemek için değiştirilmiş şablonlar."
    [...]
    $ git push
    

* [PythonAnywhere](https://www.pythonanywhere.com/consoles/)'e bağlanalım ve **Bash konsolu**'na gidelim (veya yeni bir konsol açalım) ve şunu çalıştıralım:

{% filename %}PythonAnywhere komut-satırı{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Köşeli parantez olmadan `<your-pythonanywhere-domain>` yerine gerçek PythonAnywhere alt etki alanınızı koymayı unutmayın.)

* Son olarak, [Web sekmesi](https://www.pythonanywhere.com/web_app_setup/)ne gidip uygulamanızın **Yenile** butonuna basın. (Konsoldan diğer PythonAnywhere sayfalarına ulaşmak için, sağ üst köşedeki menü düğmesini kullanın.) Güncellemeniz https://isminiz.pythonanywhere.com adresinde yayınlanmalıdır - tarayıcıda kontrol edin! Eğer PythonAnywhere sitesindeki gönderilerin içeriği ile lokal sunucunuzda bulunan gönderilerin içeriği aynı değilse sorun değil. Lokal bilgisayarınızdaki veritabanı ile Python Anywhere'deki veritabanı, diğer dosyalarınız gibi eşitlenmiyor.

Tebrikler! Şimdi Django admin üzerinden yeni bir gönderi eklemeyi deneyin (published_date eklemeyi unutmayın!) PythonAnywhere sitenizin Django admininde olduğunuzdan emin olun, https://subdomain.pythonanywhere.com/admin. Arkasından gönderileri görebilmek için oradaki sayfanızı yenileyin.

Şiir gibi çalışıyor, değil mi? Gurur duyabiliriz! Şimdi bilgisayar başından bir süre kalkalım, çünkü bir molayı hak ettik. :)

![Şekil 13.4](images/donut.png)