# Django templateleri(şablonlar) 

Bazı verileri gösterme zamanı! Django bunun için bize bazı faydalı hazır şablon etiketleri sunuyor.

## Şablon Etiketleri nedir?

Görüyoruz ki aslında, HTML'de Python kodu yazamayız, çünkü tarayıcılar bunu anlamaz. Tarayıcılar yalnızca HTML'den anlar. Biliyoruz ki Python daha dinamik bir dil iken, HTML oldukça statiktir.

Django şablon etiketleri Python-benzeri yapıların HTML'e transfer edilmesine olanak sağlar, böylece dinamik web siteleri daha kolay ve hızlı oluşturabiliriz.

## Gönderi Listesi Şablonunu Gösterme

Bir önceki bölümde, şablonumuza `posts` değişkeni içinde gönderiler listesi verdik. Şimdi, bunu HTML'de göstereceğiz.

Django şablonunda bir değişken yazdırmak için, değişken adını çift kıvırcık parantezi içinde şu şekilde kullanırız:

    html
    {{ posts }}
    

Bunu `blog/templates/blog/post_list.html` template ile deneyelim. İkinci `<div>` den üçüncü `</div>` e kadar olan her şeyi `{{ posts }}` ile değiştirelim. Ne olduğunu görmek için dosyayı kaydedip sayfayı yenileyelim:

![Şekil 13.1][1]

 [1]: images/step1.png

Sadece bunu görüyoruz:

    [<Post: İkinci postum>, <Post: Birinci postum>]
    

Django bunu bir liste nesne olarak algılamış. Python'a Giriş'ten listelerin nasıl gösteridiğini hatırlayalım. Evet, döngülerle! Bir Django şablonunda böyle yapılır:

    html
    {% for post in posts %}
        {{ post }}
    {% endfor %}
    

Bunu kendi şablonumuzda deneyelim.

![Şekil 13.2][2]

 [2]: images/step2.png

İşe yarıyor! Fakat, bunların daha önce **HTML'e Giriş** bölümde oluşturduğumuz statik gönderiler gibi görünmesini istiyoruz. HTLM ve şablon etiketlerini karıştırabiliriz. `body` şöyle görünecektir:

    html
    <div>
        <h1><a href="/">Django Girls Blog</a></h1>
    </div>
    
    {% for post in posts %}
        <div>
            <p>published: {{ post.published_date }}</p>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaks }}</p>
        </div>
    {% endfor %}
    

{% raw %} `{% for %}` ve `{% endfor %}` arasına koyduğumuz her şey listedeki her nesne için tekrarlanır. Sayfanı yenile:{% endraw %}

![Şekil 13.3][3]

 [3]: images/step3.png

`{{ post.title }}` ve `{{ post.text }}` in biraz farkı şekilde yazıldığı dikkatini çekti mi? `Post` modelinde tanımlanan alanlardaki verilere ulaşıyoruz. Ek olarak `|linebreaks` postlardaki yeni satırları paragraflara çeviren bir filtreden geçiriyor.

## Bir şey daha

Web sitemizin İnternet'te hala çalıştığını görmek iyi bir fikir, değil mi? PythonAnywhere yükleyelim yine. Adımları hatırlayalım...

*   İlk önce kodumuzu Github'a push komutu ile yükleyelim

    $ git status
    [...]
    $ git add -A .
    $ git status
    [...]
    $ git commit -m "Veritabanındaki postları görebilmek için şablonları değiştirdim."
    [...]
    $ git push
    

*   [PythonAnywhere][4] a bağlanalım ve **Bash konsolu** na gidelim (veya yeni bir konsol açalım) ve şunu çalıştıralım:

 [4]: https://www.pythonanywhere.com/consoles/

    $ cd my-first-blog
    $ git pull
    [...]
    

*   Nihayet [Web tab][5] sekmesine gidip web uygulamamızdaki **Reload** a basalım. Şimdi uygulamamız güncellenmiş olmalı!

 [5]: https://www.pythonanywhere.com/web_app_setup/

Tebrikler! Şimdi devam edelim ve Django admininde yeni bir gönderi eklemeyi deneyelim (published_date eklemeyi unutmayalım!), sonrasında gönderinin görünüp görünmediğini görmek için sayfayı yenileyelim.

Mükemmel çalışıyor, değil mi? Kendimizle gurur duyabiliriz! Şimdi bilgisayarımızdan bir süreliğine uzaklaşalım, çünkü bir arayı hak ettik. :)

![Şekil 13.4][6]

 [6]: images/donut.png