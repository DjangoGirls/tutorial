# HTML'ye giriş

Template nedir diye sorabilirsiniz.

A template is a file that we can re-use to present different information in a consistent format – for example, you could use a template to help you write a letter, because although each letter might contain a different message and be addressed to a different person, they will share the same format.

A Django template's format is described in a language called HTML (that's the HTML we mentioned in the first chapter, **How the Internet works**).

## HTML nedir?

HTML is a simple code that is interpreted by your web browser – such as Chrome, Firefox or Safari – to display a web page for the user.

HTML "HyperText Markup Language" (HiperMetin İşaretleme Dili) anlamına gelir. **HyperText (HiperMetin)** sayfalar arası bağlantıları destekleyen türden bir metin demektir. **Markup (İşaretleme)**, bir belgeyi alıp onu kodlarla işaretleyerek, nasıl yorumlanacağını (tarayıcıya) söyledik demektir. HTML kodu **etiketler** ile oluşturulur, etiketlerin her biri `<` ile başlar ve `>` ile biter. These tags represent markup **elements**.

## İlk template'iniz!

Bir template oluşturmak bir template dosyası oluşturmak demektir. Her şey bir dosyadır, değil mi? Bunu muhtemelen zaten fark etmişsinizdir.

Template'lar `blog/templates/blog` dizininde saklanır. Öyleyse blog klasörü altında `templates` adlı bir klasör oluşturalım. Sonra da templates klasörü altında yine `blog` adlı bir klasör oluşturalım:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is simply a useful naming convention that makes life easier when things start to get more complicated.)

Şimdi de `blog/templates/blog` dizini içine `post_list.html` adlı bir dosya oluşturalım (şimdilik içini boş bırakalım).

Web sitemizin nasıl göründüğüne bir bakalım: http://127.0.0.1:8000/

> If you still have an error `TemplateDoesNotExist`, try to restart your server. Go into command line, stop the server by pressing Ctrl+C (Control and C keys together) and start it again by running a `python manage.py runserver` command.

![Şekil 11.1](images/step1.png)

Artık hata kalmadı! Tebrikler :) Ama, web sitemiz aslında boş bir sayfadan başka bir şey yayınlamıyor, çünkü template boş. Bunu düzeltelim.

Template dosyamıza şunları ekleyelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <p>Hi there!</p>
    <p>It works!</p>
</html>
```

So how does your website look now? Visit it to find out: http://127.0.0.1:8000/

![Şekil 11.2](images/step3.png)

Çalıştı! Tebrikler :)

* The most basic tag, `<html>`, is always the beginning of any web page and `</html>` is always the end. Gördüğünüz gibi, web sitesinin tüm içeriği `<html>` başlangıç etiketi ve `</html>` bitiş etiketinin arasında yer alır
* `<p>` paragraf öğelerini belirten etikettir; her paragrafın bitişinde de `</p>` olacaktır

## Head and body

Each HTML page is also divided into two elements: **head** and **body**.

* **head** belge hakkında ekranda görüntülenmeyen bilgiler içeren öğedir.

* **body** ise ekranda gösterilen tüm öğeleri içeren öğedir.

`<head>` öğesini tarayıcıya sayfanın yapılandırmasını anlatmak için, `<body>` öğesini ise sayfada aslında ne olduğunu anlatmak için kullanırız.

For example, you can put a web page title element inside the `<head>`, like this:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

Dosyayı kaydedin ve sayfanızı yenileyin.

![Şekil 11.3](images/step4.png)

Tarayıcınızın "Zeynep'in blogu" başlığını nasıl anladığını fark ettiniz mi? `<title>Zeynep'in blogu</title>` kısmını başlık olarak yorumlayarak yazıyı tarayıcının başlık kısmına yerleştirdi. (Bu yazı yer işaretleri gibi yerlerde de kullanılır).

Her açılan etiketin benzer bir *kapatan etiket*, `/` ile başlayan, ile kapatılmalıdır. Ayrıca bu etiketler *iç içe* yerleştirilebilir (bu da bir etiketi kapatabilmek için, içindeki tüm etiketlerin kapanmış olmasını gerektirir).

Bir şeyleri kutulara yerleştirmek gibi. You have one big box, `<html></html>`; inside it there is `<body></body>`, and that contains still smaller boxes: `<p></p>`.

You need to follow these rules of *closing* tags, and of *nesting* elements – if you don't, the browser may not be able to interpret them properly and your page will display incorrectly.

## Template özelleştirme

Şimdi artık biraz eğlenip template'inizi özelleştirmeyi deneyebilirsiniz! İşte bunun için faydalı birkaç etiket:

* `<h1>A heading</h1>` for your most important heading
* `<h2>Bir alt başlık</h2>` - bir sonraki seviyedeki bir başlık için
* `<h3>A sub-sub-heading</h3>` …and so on, up to `<h6>`
* `<p>A paragraph of text</p>`
* `<em>metin</em>` metni vurgular
* `<strong>metin</strong>` metni iyice vurgular
* `<br />` - alt satıra gider (br etiketi içine bir şey konulmaz)
* `<a href="https://djangogirls.org">link</a>` creates a link
* `<ul><li>ilk madde</li><li>ikinci madde</li></ul>` - tıpkı bunun gibi bir liste yapar!
* `<div></div>` - sayfanın bir bölümünü tanımlar

Here's an example of a full template, copy and paste it into `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Ne kadar zevkli bir işmiş bilgisayarlarla uğraşmak. Artık bilgisayar başından kalkmam. </p>
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

* The first `div` element contains the title of our blog – it's a heading and a link
* Sonraki iki `div` öğesi blog gönderilerimizi içeriyor; bunlarda bir yayın tarihi, tıklanabilir bir `h2` başlığı ve biri tarih diğeri gönderi metnimiz için olmak üzere, iki tane `p` (paragraf) var.

Bize yaşattığı duygu:

![Şekil 11.4](images/step6.png)

Yaşasın! But so far, our template only ever displays exactly **the same information** – whereas earlier we were talking about templates as allowing us to display **different** information in the **same format**.

What we really want to do is display real posts added in our Django admin – and that's where we're going next.

## Birşey daha: dağıtım!

Bunları İnternet'te canlı olarak görmek çok güzel olur, değil mi:

### Kodumuzu commit ve push komutları ile Github'a yükleyelim

İlk önce son deployment dan sonra hangi dosyaların değiştiğine bakalım. Bu komutları lokal bilgisayarımızda çalıştıralım, PythonAnywhere'de değil:

{% filename %}command-line{% endfilename %}

    $ git status
    

`djangogirls` dizininde olduğumuzdan emin olalım ve `git` 'e bu dizinde yapılan tüm değişiklikleri dahil etmesini söyleyelim:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    

> **Note** `--all` means that `git` will also recognize if you've deleted files (by default, it only recognizes new/modified files). Hatırlatma: `.` içinde olduğumuz klasör anlamına gelir (3. Bölüm).

Dosyalarımızı yüklemeden önce `git`'in hangilerini yükleyeceğine (`git`'in yükleyeceği dosyalar yeşil gösterilir) bakalım:

{% filename %}command-line{% endfilename %}

    $ git status
    

Neredeyse bitirdik, şimdi bu değişikliği tarihçesine kaydetmesini söyleyelim. Commit için değişiklikleri açıklayan bir mesaj yazalım. Bu aşamada istediğimizi yazabiliriz, fakat tanımlayıcı yazılar gelecekte neler yapmış olduğumuzu hatırlatması açısından faydalı olacaktır.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Site için HTML dosyasını değiştirdim."
    

> **Not** Tamamlama mesajını çift tırnak içerisinde kullandığımızdan emin olalım.

Once we've done that, we upload (push) our changes up to GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### Pull ile yeni kodu PythonAnywhere e alıp web uygulamasını tekrar yükleyelim

* [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/)sayfasını ve **Bash console** u açalım (ya da yeni bir tane açalım). Sonra da çalıştıralım:

{% filename %}command-line{% endfilename %}

    $ cd ~/my-first-blog
    $ git pull
    [...]
    

Kodumuzun indirilmesini izleyelim. Kodun geldiğini kontrol etmek istersek **Files (dosyalar) sekme**sini açıp PythonAnywhere'de kodumuzu görebiliriz.

* Son olarak, [Web sekmesi](https://www.pythonanywhere.com/web_app_setup/)ne gidip uygulamanızın **Yenile** butonuna basın.

Your update should be live! Go ahead and refresh your website in the browser. Changes should be visible. :)