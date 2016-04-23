# HTML'ye giriş

Template nedir diye sorabilirsiniz.

Template, farklı bilgileri hep aynı biçimde sunmak için tekrar tekrar kullanabileceğimiz bir dosyadır - örneğin, mektup yazmanıza yardımcı olan bir template kullanabilirsiniz çünkü yazacağınız tüm mektuplar farklı mesajlar içerse ve farklı kişilere gönderilse de aynı sayfa düzenine sahip olacaktır.

Bir Django template düzeni HTML adını verdiğimiz bir dilde tanımlanır (**İnternet nasıl çalışır** adlı ilk bölümde bahsettiğimiz HTML).

## HTML nedir?

HTML Chrome, Firefox veya Safari gibi web tarayıcılar tarafından bir web sayfasını kullanıcıya görüntülemek için yorumlanan basit bir koddur.

HTML "HyperText Markup Language" (HiperMetin İşaretleme Dili) anlamına gelir. **HyperText (HiperMetin)** sayfalar arası bağlantıları destekleyen türden bir metin demektir. **Markup (İşaretleme)**, bir belgeyi alıp onu kodlarla işaretleyerek, nasıl yorumlanacağını (tarayıcıya) söyledik demektir. HTML kodu **etiketler** ile oluşturulur, etiketlerin her biri `<` ile başlar ve `>` ile biter. Bu etiketler biçimlendirme **öğelerini** temsil eder.

## İlk template'iniz!

Bir template oluşturmak bir template dosyası oluşturmak demektir. Her şey bir dosyadır, değil mi? Bunu muhtemelen zaten fark etmişsinizdir.

Template'lar `blog/templates/blog` dizininde saklanır. Öyleyse blog klasörü altında `templates` adlı bir klasör oluşturalım. Sonra da templates klasörü altında yine `blog` adlı bir klasör oluşturalım:

```
blog
└───templates
    └───blog
```

(Neden iki tane `blog` adlı klasöre gerek olduğunu merak etmiş olabilirsin. Daha sonra da anlaşılacağı gibi, sitemiz karmaşıklaştıkça bu şekilde isimlendirme tarzı işimizi oldukça kolaylaştırır.)

Şimdi de `blog/templates/blog` dizini içine `post_list.html` adlı bir dosya oluşturalım (şimdilik içini boş bırakalım).

Web sitemizin nasıl göründüğüne bir bakalım: http://127.0.0.1:8000/

> Eğer `TemplateDoesNotExists` hatası alırsanız sunucuyu yeniden başlatmayı deneyin. Komut satırına gidip, Ctrl+C (Control ve C tuşlarına eş zamanlı basarak) yaptıktan sonra sunucuyu tekrar başlatmak için `python manage.py runserver` komutunu çalıştırın.

![Şekil 11.1][1]

 [1]: images/step1.png

Artık hata kalmadı! Tebrikler :) Ama, web sitemiz aslında boş bir sayfadan başka bir şey yayınlamıyor, çünkü template boş. Bunu düzeltelim.

Template dosyamıza şunları ekleyelim:

```html
<html>
        <p>Merhaba!</p>
        <p>Çalışıyor!</p>
</html>
```

Web siteniz şimdi nasıl görünüyor? Öğrenmek için tıklayın: http://127.0.0.1:8000 /

![Şekil 11.2][2]

 [2]: images/step3.png

Çalıştı! Tebrikler :)

*   Tüm web sayfaları en temel etiket olan`<html>` etiketi ile başlar ve her zaman `</html>` ile biter. Gördüğünüz gibi, web sitesinin tüm içeriği `<html>` başlangıç etiketi ve `</html>` bitiş etiketinin arasında yer alır
*   `<p>` paragraf öğelerini belirten etikettir; her paragrafın bitişinde de `</p>` olacaktır

## Head ve body (Başlık ve gövde)

Aynı zamanda tüm HTML sayfaları **head** ve **body** olmak üzere iki öğeye ayrılır.

*   **head** belge hakkında ekranda görüntülenmeyen bilgiler içeren öğedir.

*   **body** ise ekranda gösterilen tüm öğeleri içeren öğedir.

`<head>` öğesini tarayıcıya sayfanın yapılandırmasını anlatmak için, `<body>` öğesini ise sayfada aslında ne olduğunu anlatmak için kullanırız.

Örneğin, web sayfasının (title) başlık elemanını `<head>` 'in içine böyle koyabilirsiniz:

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

![Şekil 11.3][3]

 [3]: images/step4.png

Tarayıcınızın "Zeynep'in blogu" başlığını nasıl anladığını fark ettiniz mi? `<title>Zeynep'in blogu</title>` kısmını başlık olarak yorumlayarak yazıyı tarayıcının başlık kısmına yerleştirdi. (Bu yazı yer işaretleri gibi yerlerde de kullanılır).

Her açılan etiketin benzer bir *kapatan etiket*, `/` ile başlayan, ile kapatılmalıdır. Ayrıca bu etiketler *iç içe* yerleştirilebilir (bu da bir etiketi kapatabilmek için, içindeki tüm etiketlerin kapanmış olmasını gerektirir).

Bir şeyleri kutulara yerleştirmek gibi. Büyük bir kutuda `<html></html>` olsun; onun içinde `<body></body>` kutusu olsun, onun da içinde daha küçük kutular olsun: `<p></p>`.

Etiketleri düzgün *kapatma* ve *iç içe * yerleştirme kurallarına uymak çok önemli. Aksi takdirde tarayıcı belgenizi doğru yorumlayamaz ve gösteremez.

## Template özelleştirme

Şimdi artık biraz eğlenip template'inizi özelleştirmeyi deneyebilirsiniz! İşte bunun için faydalı birkaç etiket:

*   `<h1>Bir başlık</h1>` - ana başlığınız için
*   `<h2>Bir alt başlık</h2>` - bir sonraki seviyedeki bir başlık için
*   `<h3>Bir alt alt başlık</h3>` ... ve böyle `<h6>` ya kadar iner
*   `<em>metin</em>` metni vurgular
*   `<strong>metin</strong>` metni iyice vurgular
*   `<br />` - alt satıra gider (br etiketi içine bir şey konulmaz)
*   `<a href = "http://djangogirls.org">bağlantı</a>` bir bağlantı oluşturur
*   `<ul><li>ilk madde</li><li>ikinci madde</li></ul>` - tıpkı bunun gibi bir liste yapar!
*   `<div></div>` - sayfanın bir bölümünü tanımlar

Şimdi de tam bir template örneği:


```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">İlk Blogum</a></h2>
            <p>Çok heyecanlıyım! Bu benim ilk blogum. Ne kadar zevkli bir işmiş bilgisayarlarla uğraşmak. Artık bilgisayar başından kalkmam. </p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">İkinci gönderim</a></h2>
            <p>Bir varmış bir yokmuş, evvel zaman içinde, Ne kadar zevkli bir işmiş bilgisayarlarla uğraşmak. Artık bilgisayar başından kalkmam. kalbur saman içinde, develer tellal iken, pireler berber iken; ben annemin beşiğini tıngır mıngır sallar iken.</p>
        </div>
    </body>
</html>
```

Burada üç tane `div` bölümü oluşturduk.

*   İlk `div` öğesi blogumuzun başlığını içeriyor - bir başlık ve bir bağlantıdan oluşuyor
*   Sonraki iki `div` öğesi blog gönderilerimizi içeriyor; bunlarda bir yayın tarihi, tıklanabilir bir `h2` başlığı ve biri tarih diğeri gönderi metnimiz için olmak üzere, iki tane `p` (paragraf) var.

Bize yaşattığı duygu:

![Şekil 11.4][4]

 [4]: images/step6.png

Yaşasın! Şimdiye dek, template tam olarak sadece **aynı bilgiyi ** görüntüledi - öncesinde ise template'in **farklı** bilgileri **aynı formatta** görüntülememize izin verdiğinden bahsetmiştik.

Gerçekten yapmak istediğimiz ise Django adminde ekli gerçek gönderileri göstermek - ve bir sonraki adımımız da bu.

## Birşey daha: dağıtım!

Bunları İnternet'te canlı olarak görmek çok güzel olur, değil mi:

### Kodumuzu commit ve push komutları ile Github'a yükleyelim

İlk önce son deployment dan sonra hangi dosyaların değiştiğine bakalım. Bu komutları lokal bilgisayarımızda çalıştıralım, PythonAnywhere'de değil:

```
$ git status
```

`djangogirls` dizininde olduğumuzdan emin olalım ve `git` 'e bu dizinde yapılan tüm değişiklikleri dahil etmesini söyleyelim:

```
$ git add --all .
```

> **Not:** `-A` (hepsi için bir kısaltma - İngilizce'de "all" hepsi demek) `git`'in silinmiş dosyaları tanır (normalde sadece yeni/güncellenmiş dosyaları tanır). Hatırlatma: `.` içinde olduğumuz klasör anlamına gelir (3. Bölüm).

Dosyalarımızı yüklemeden önce `git`'in hangilerini yükleyeceğine (`git`'in yükleyeceği dosyalar yeşil gösterilir) bakalım:

```
$ git status
```

Neredeyse bitirdik, şimdi bu değişikliği tarihçesine kaydetmesini söyleyelim. Commit için değişiklikleri açıklayan bir mesaj yazalım. Bu aşamada istediğimizi yazabiliriz, fakat tanımlayıcı yazılar gelecekte neler yapmış olduğumuzu hatırlatması açısından faydalı olacaktır.

```
$ git commit -m "Site için HTML dosyasını değiştirdim."
```

> **Not** Tamamlama mesajını çift tırnak içerisinde kullandığımızdan emin olalım.

Bunu tamamladıktan sonra, değişiklikleri Github'a push komutunu kullanarak yükleyelim:

```
git push
```

### Pull ile yeni kodu PythonAnywhere e alıp web uygulamasını tekrar yükleyelim

*   [PythonAnywhere consoles page][5]sayfasını ve **Bash console** u açalım (ya da yeni bir tane açalım). Sonra da çalıştıralım:

 [5]: https://www.pythonanywhere.com/consoles/

```
$ cd ~/ilk-blogum
$ source myvenv/bin/activate
(myvenv)$ git pull
[...]
(myvenv)$ python manage.py collectstatic
[...]
```    

Kodumuzun indirilmesini izleyelim. Kodun geldiğini kontrol etmek istersek **Files (dosyalar) sekme**sini açıp PythonAnywhere'de kodumuzu görebiliriz.

*   Son olarak, [Web sekmesi][6]ne gidip uygulamanızın **Yenile** butonuna basın.

 [6]: https://www.pythonanywhere.com/web_app_setup/

Güncelleme hazır olmalı! Devam edelim ve tarayıcıda web sitesini yenileyelim. Değişiklikler görünüyor olmalı :)