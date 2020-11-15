# HTML'ye giriş

Template nedir diye sorabilirsiniz.

Template (şablon), farklı bilgileri hep aynı biçimde sunmak için tekrar tekrar kullanabileceğimiz bir dosyadır - örneğin, mektup yazmanıza yardımcı olan bir template kullanabilirsiniz çünkü yazacağınız tüm mektuplar farklı mesajlar içerse ve farklı kişilere gönderilse de aynı sayfa düzenine sahip olacaktır.

Bir Django template'inin formatı HTML adını verdiğimiz bir dilde tanımlanır (**İnternet nasıl çalışır** adlı ilk bölümde bahsettiğimiz HTML).

## HTML nedir?

HTML kullanıcıya basit bir web sayfası görüntülemek için web tarayıcınız tarafından - Chrome, Firefox veya Safari gibi - yorumlanan basit bir koddur.

HTML "HyperText Markup Language" (HiperMetin İşaretleme Dili) anlamına gelir. **HyperText** (HiperMetin) sayfalar arası bağlantıları destekleyen türden bir metin demektir. **Markup** (işaretleme), bir belgeyi alıp onu kodlarla işaretleyerek, nasıl yorumlanacağını (tarayıcıya) söylemek demektir. HTML kodu **etiketler** ile oluşturulur, etiketlerin her biri `<` ile başlar ve `>` ile biter. Bu etiketler biçimlendirme **öğelerini** temsil eder.

## İlk template'iniz!

Bir template oluşturmak bir template dosyası oluşturmak demektir. Her şey bir dosyadır, değil mi? Bunu muhtemelen zaten fark etmişsinizdir.

Template'lar `blog/templates/blog` dizininde saklanır. Öyleyse blog klasörü altında `templates` adlı bir klasör oluşturalım. Sonra da templates klasörü altında yine `blog` adlı bir klasör oluşturalım:

    blog
    └───templates
        └───blog
    

(`blog` diye adlandırılan iki dizine niye ihtiyacımız olduğunu merak edebilirsiniz - daha sonra anlayacağınız üzere, sitemiz karmaşıklaştıkça bu şekilde isimlendirme tarzı işimizi oldukça kolaylaştırır.)

Şimdi de `blog/templates/blog` dizini içine `post_list.html` adlı bir dosya oluşturalım (şimdilik içini boş bırakalım).

Web sitemizin nasıl göründüğüne bir bakalım: http://127.0.0.1:8000/

> Eğer hala `TemplateDoesNotExist` hatası alıyorsanız, sunucunuzu yeniden başlatmayı deneyin. Komut satırına girin, Ctrl+C (Kontrol ve C tuşlarına beraber) basarak sunucuyu durdurun ve `python manage.py runserver` komutunu çalıştırarak yeniden başlatın.

![Şekil 11.1](images/step1.png)

Artık hata kalmadı! Tebrikler :) Ama, web sitemiz aslında boş bir sayfadan başka bir şey yayınlamıyor, çünkü template boş. Bunu düzeltelim.

Yeni dosyayı kod düzenleyicisinde açıp şunları ekleyelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Merhaba!</p>
    <p>Çalışıyor!</p>
</body>
</html>
```

Web siteniz şu anda nasıl görünüyor? Öğrenmek için bir bakalım: http://127.0.0.1:8000/

![Şekil 11.2](images/step3.png)

Çalıştı! Tebrikler :)

* En temel etiket, `<html>`, daima herhangi bir web sayfasının başlangıcıdır ve `</html>` daima bitişidir. Gördüğünüz gibi, web sitesinin tüm içeriği `<html>` başlangıç etiketi ve `</html>` bitiş etiketinin arasında yer alır
* `<p>` paragraf öğelerini belirten etikettir; her paragrafın bitişinde de `</p>` olacaktır

## Kafa ve vücut

Aynı zamanda tüm HTML sayfaları **head** ve **body** olmak üzere iki öğeye ayrılır.

* **head** belge hakkında ekranda görüntülenmeyen bilgiler içeren öğedir.

* **body** ise ekranda gösterilen tüm öğeleri içeren öğedir.

`<head>` öğesini tarayıcıya sayfanın yapılandırmasını anlatmak için, `<body>` öğesini ise sayfada aslında ne olduğunu anlatmak için kullanırız.

Örnek olarak, bir web sayfası başlık ögesini `<head>` içine koyabilirsiniz, bunun gibi:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Zeynep'in blogu</title>
    </head>
    <body>
        <p>Merhaba!</p>
        <p>Çalışıyor!</p>
    </body>
</html>
```

Dosyayı kaydedin ve sayfanızı yenileyin.

![Şekil 11.3](images/step4.png)

Tarayıcınızın "Zeynep'in blogu" başlığını nasıl anladığını fark ettiniz mi? `<title>Zeynep'in blogu</title>` kısmını başlık olarak yorumlayarak yazıyı tarayıcının başlık kısmına yerleştirdi. (Bu yazı yer işaretleri gibi yerlerde de kullanılır).

Her açılan etiketin `/` ile başlayan bir *kapatan etiket*'i ile kapatılması gerekmektir. Ayrıca bu etiketler *iç içe* yerleştirilebilir (bu da bir etiketi kapatabilmek için, içindeki tüm etiketlerin kapanmış olmasını gerektirir).

Bir şeyleri kutulara yerleştirmek gibi. Büyük bir kutuda `<html></html>` olsun; onun içinde `<body></body>` kutusu olsun, onun da içinde daha küçük kutular olsun: `<p></p>`.

Bu *kapatma* etiketleri ve *yuvalama* ögeleri kurallarını takip etmeye ihtiyacınız vardır - eğer yapmazsanız tarayıcı onları gerektiği gibi açıklayamayabilir ve sayfanız hatalı olarak görüntülenecektir.

## Template özelleştirme

Şimdi artık biraz eğlenip template'inizi özelleştirmeyi deneyebilirsiniz! İşte bunun için faydalı birkaç etiket:

* `<h1>Bir başlık</h1>` en önemli başlığınız (ana başlık)
* `<h2>Bir alt başlık</h2>` - bir sonraki seviyedeki bir başlık için
* `<h3>Bir alt-alt başlık</h3>`…ve böyle `<h6>`'ya kadar gider
* `<p>Metin paragrafı</p>`
* `<em>metin</em>` metni vurgular
* `<strong>metin</strong>` metni iyice vurgular
* `<br>`alt satıra gider (br etiketi ve > işaretinin arasına bir şey konulmaz)
* `<a href="https://djangogirls.org">bağlantı</a>` bağlantı oluşturur
* `<ul><li>ilk madde</li><li>ikinci madde</li></ul>` - tıpkı bunun gibi bir liste yapar!
* `<div></div>` - sayfanın bir bölümünü tanımlar

İşte komple bir template örneği, kopyalayın ve `blog/templates/blog/post_list.html` içine yapıştırın:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">İlk Blogum</a></h2>
            <p>Çok heyecanlıyım! Bu benim ilk blogum. Ne kadar zevkli bir işmiş bilgisayarlarla uğraşmak. Artık bilgisayar başından kalkmam. </p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:20</p>
            <h2><a href="">İkinci gönderim</a></h2>
            <p>Bir varmış bir yokmuş, evvel zaman içinde Ne kadar zevkli bir işmiş bilgisayarlarla uğraşmak. Artık bilgisayar başından kalkmam. kalbur saman içinde, develer tellal iken, pireler berber iken; ben annemin beşiğini tıngır mıngır sallar iken.</p>
        </div>
    </body>
</html>
```

Burada üç tane `div` bölümü oluşturduk.

* İlk `div` ögesi blogumuzun başlığını içerir - bu bir baş kısımdır ve bir bağlantıdır
* Sonraki iki `div` öğesi blog gönderilerimizi içeriyor; bunlarda bir yayın tarihi (published_date), tıklanabilir bir `h2` başlığı ve biri tarih diğeri gönderi metnimiz için olmak üzere, iki tane `p` (paragraf) var.

Bize yaşattığı duygu:

![Şekil 11.4](images/step6.png)

Yaşasın! Şimdiye dek, şablonumuz tam olarak sadece **aynı bilgiyi** görüntüler - öncesinde ise şablonlardan **aynı formatta** **farklı** bilgileri görüntülememizden bahsediyorduk.

Aslında yapmak istediğimiz Django yöneticimize eklenen gerçek postaları açmak - bundan sonra oraya gidiyoruz.

## Bir şey daha: deployment (yayına alma) zamanı!

Bunları İnternet'te canlı olarak görmek çok güzel olur, değil mi:

### Kodumuzu commit ve push komutları ile Github'a yükleyelim

İlk önce son deployment dan sonra hangi dosyaların değiştiğine bakalım. Bu komutları lokal bilgisayarımızda çalıştıralım, PythonAnywhere'de değil:

{% filename %}komut-satırı{% endfilename %}

    $ git status
    

`djangogirls` dizininde olduğumuzdan emin olalım ve `git` 'e bu dizinde yapılan tüm değişiklikleri dahil etmesini söyleyelim:

{% filename %}komut-satırı{% endfilename %}

    $ git add .
    

Dosyalarımızı yüklemeden önce `git`'in hangilerini yükleyeceğine (`git`'in yükleyeceği dosyalar yeşil gösterilir) bakalım:

{% filename %}komut-satırı{% endfilename %}

    $ git status
    

Neredeyse bitirdik, şimdi bu değişikliği tarihçesine kaydetmesini söyleyelim. Commit için değişiklikleri açıklayan bir mesaj yazalım. Bu aşamada istediğimizi yazabiliriz, fakat tanımlayıcı yazılar gelecekte neler yapmış olduğumuzu hatırlatması açısından faydalı olacaktır.

{% filename %}komut-satırı{% endfilename %}

    $ git commit -m "Site için HTML dosyasını değiştirdim."
    

> **Note** Make sure you use double quotes around the commit message.

Bunu bir kez yapıp, değişikliklerimizi GitHub'a yükledik (ittik):

{% filename %}komut-satırı{% endfilename %}

    $ git push
    

### Pull ile yeni kodu PythonAnywhere e alıp web uygulamasını tekrar yükleyelim

* [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/)sayfasını ve **Bash console** u açalım (ya da yeni bir tane açalım). Sonra da çalıştıralım:

{% filename %}PythonAnywhere komut satırı{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. Kontrol etmek istersen, **Files** sekmesine gidip kodunu PythonAnywhere üzerinde görebilirsin (Konsol sayfasındaki menü butonundan diğer PythonAnywhere sayfalarına ulaşabilirsin).

* Son olarak, [Web sekmesi](https://www.pythonanywhere.com/web_app_setup/)ne gidip uygulamanızın **Yenile** butonuna basın.

Güncelleme hazır olmalı! Devam edelim ve tarayıcıda web sitesini yenileyelim. Değişiklikler görünüyor olmalı. :)