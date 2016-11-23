# CSS - güzelleştir!

Blogumuz hala epey çirkin gözüküyor, değil mi? Güzelleştirme zamanı! Bunun için CSS kullanacağız.

## CSS Nedir?

Basamaklı Stil Sayfaları (Cascading Style Sheets - CSS) bir websayfasının görünüm ve biçimlendirmelerini tanımlamak için kullanılan bir işaretleme (markup) dilidir (HTML gibi). CSS'i websayfanızın makyajı olarak görebilirsiniz ;).

Fakat tekrar en baştan başlamak istemiyoruz, değil mi? Bir kez daha, programcılar tarafından önceden hazırlanmış ve internette ücretsiz olarak yayınlanmış bir şeyi kullanacağız. Bilirsiniz tekerleği yeniden icat etmek eğlenceli değildir.

## Hadi Bootstrap kullanalım!

Bootstrap güzel websayfaları geliştirmek için kullanılan en popüler HTML ve CSS çerçevesidir (framework): https://getbootstrap.com/

Twitter yazılımcıları tarafından geliştirilmeye başlanmış ve şu anda dünyanın her yerinden gönüllüler tarafından geliştirilmektedir.

## Bootstrap kurulumu

Bootstrap kurmak için `.html` dosyanızda `<head>` kısmına şunları eklemeniz gerekli (`blog/templates/blog/post_list.html`):

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Bu, projemize hiçbir yeni dosya eklemez. Yalnızca internet üzerinde var olan dosyalara işaret eder. Şimdi websitenizi açın ve sayfayı yenileyin. İşte oldu!

![Şekil 14.1][1]

 [1]: images/bootstrap1.png

Şimdiden daha güzel gözüküyor!

## Django'da statik dosyalar

Son olarak **statik dosyalar** diye bahsettiğimiz şeylere daha yakından bakalım. Statik dosyalar, CSS ve resimlerindir -- dinamik olmayan, bu nedenle içerikleri istek bağlamından bağımsız ve her kullanıcı için aynı dosyalar.

### Django'da statik dosyaları nereye koymalı

Sunucuda `collectstatic` komutunu çalıştırdığımız zaman gördüğün gibi, Django dahili "admin" uygulaması için statik dosyaların nerede olduğunu biliyor. Şimdi de bizim kendi `blog` uygulamamız için bazı statik dosyalar eklememiz gerekiyor.

Bunu blog uygulamamızın içerisinde `static` isimli bir klasör oluşturarak yapacağız:

```
djangogirls
├── blog
│   ├── migrations
│   └── static
└── mysite
```

Django uygulama klasörlerinizin altındaki "static" isimli tüm klasörleri otomatik olarak bulacak ve içindekileri statik dosya olarak kullanabilecektir.

## İlk CSS dosyanız!

Şimdi web sayfamıza kendi stilimizi eklemek için bir CSS dosyası oluşturalım. `static` klasörü içinde `css` adlı yeni bir klasör oluşturalım. Şimdi de `css` klasörü içinde `blog.css` adlı yeni bir dosya oluşturalım. Hazır mısınız?

```
djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
```

Şimdi CSS yazma zamanı! `blog/static/css/blog.css` dosyasını kod editöründe açın.

Biz burada özelleştirme ve CSS'in detaylarına çok fazla girmeyeceğiz, çünkü gerçekten kolay ve workshop'tan sonra kendinizi bu konuda geliştirebilirsiniz. Web sitelerini CSS'le güzelleştirmek hakkında bilmen gerekenleri öğrenmek için, [Codeacademy HTML & CSS kursu][2]nu özellikle öneriyoruz.

 [2]: https://www.codecademy.com/tracks/web

Ancak az da olsa yapalım. Acaba başlığımızın rengini mi değiştirsek? Bilgisayarlar renkleri anlamak için özel kodlar kullanır. Bu kodlar `#` ile başlar ve arkasından 6 harf (A-F) ve numaralarda (0-9) gelir. Renk kodlarını örneğin burada bulabilirsin: http://www.colorpicker.com/. Ayrıca [önceden tanımlanmış renkler][3]i de kullanabilirsin, `red` (kırmızı) ve `green` (yeşil) gibi.

 [3]: http://www.w3schools.com/cssref/css_colornames.asp

`blog/static/css/blog.css` dosyanıza şu kodu eklemelisiniz:

```css
h1 a {
    color: #FCA205;
}
``` 

`h1 a` bir CSS Seçicisidir (Selector). Bu demek oluyor ki biz stilimizi, bir `h1` öğesi içerisinde olan tüm `a` öğelerine (örneğin kodumuzun içerisinde `<h1><a href="">link</a></h1>` gibi bir şey olduğunda) uyguluyoruz. Bu durumda, rengi `#FCA205` yani turuncu yapmasını söylüyoruz. Elbette, buraya kendi arzu ettiğin rengi koyabilirsin!

Bir CSS dosyasında, HTML dosyasındaki öğeler için stil belirleriz. Öğeler, öğenin ismi (örn. `a`, `h1`, `body`), `sınıf` özniteliği (attribute) ya da `id` özniteliği ile tanımlanırlar. Sınıf ve id (kimlik), bir elemente senin tarafından verilen isimlerdir. Sınıflar bir öğe grubunu tanımlar, id'ler ise belirli bir öğeye işaret ederler. Örneğin şu aşağıdaki etiket CSS tarafından, `a` etiket adı, `external_link` sınıfı ya da `link_to_wiki_page` id'si kullanılarak tanımlanabilir:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

Daha fazla bilgi için [w3schools'da CSS seçicileri][4]ni okuyabilirsin.

 [4]: http://www.w3schools.com/cssref/css_selectors.asp

Sonrasında, ayrıca HTML şablonumuza (template) bir takım CSS eklemeleri yaptığımızı bildirmemiz gerekiyor. `blog/templates/blog/post_list.html` dosyasını açın ve en başına şu satırı ekleyin:

```html
{% load staticfiles %}
```

Burada yaptığımız yalnızca statik dosyaları yüklemek. :) Sonrasında, `<head>` ve `</head>`, tagları arasına, Bootstrap CSS dosyalarına yönelik bağlantılardan sonra (web tarayıcımız dosyaları yazıldıkları sırasıyla okuduğundan, bizim dosyamızdaki kodlar Bootstrap dosyasının içerisindekileri geçersiz kılabilir), şu satırı ekleyin:

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Az evvel şablonumuza (template) CSS dosyamızın nerede olduğunu söylemiş olduk.

Dosyanız şu şekilde gözüküyor olmalı:

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        {% for post in posts %}
            <div>
                <p>yayınlanma tarihi: {{ post.yayinlama_tarihi }}</p>
                <h1><a href="">{{ post.baslik }}</a></h1>
                <p>{{ post.yazi|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Tamamdır, dosyayı kaydedip sayfayı yenileyebilirsiniz.

![Şekil 14.2][5]

 [5]: images/color2.png

Güzel! Şimdi de sitemizi biraz rahatlatıp sol kenar boşluğunu (margin'i) arttırsak mı? Hadi deneyelim!

```css
body {
    padding-left: 15px;
}
```

Bunu CSS dosyanıza ekleyin, dosyayı kaydedin ve nasıl çalıştığını görelim!

![Şekil 14.3][6]

 [6]: images/margin2.png

Belki de başlığımızın yazı tipini özelleştirebiliriz? Aşağıdaki satırı `blog/templates/blog/post_list.html` dosyasının içinde `<head>` bölümüne yapıştırın:

```html
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Bu satır *Lobster* adlı bir fontu Google Fonts (https://www.google.com/fonts) sitesinden sayfamıza aktarır.

Şimdi `blog/static/css/blog.css` dosyamızdaki `h1 a` deklarasyon bloğunun içine (`{` ve `}` kodları arasına) `font-family: 'Lobster';` satırını ekleyip sayfayı yenileyin:

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Şekil 14.3][7]

 [7]: images/font.png

Harika!

Yukarıda bahsettiğimiz üzere, CSS'te class (sınıf) diye bir kavram var. Class'lar, temel olarak HTML kodunuzun bir parçasına isim vermenize yarar ve yalnızca o parçanın stilini değiştirirken diğer parçaların etkilenmemesini sağlar. İki div'iniz var diyelim; fakat çok farklı şeyler yapıyorlarsa (örneğin biri başlık diğeri gönderinin metni) ve bu nedenle de aynı şekilde gözükmelerini istemiyorsanız, sınıflar müthiş yararlıdır.

Devam edelim ve HTML kodumuzun bir kısmına isim verelim. Başlığı içeren `div`'e `page-header` isimli bir class ekleyelim:

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Şimdi de gönderi metnini içeren `div`'e `post` isimli bir sınıf ekleyelim.

```html
<div class="post">
    <p>yayınlanma tarihi: {{ post.yayinlama_tarihi }}</p>
    <h1><a href="">{{ post.baslik }}</a></h1>
    <p>{{ post.yazi|linebreaksbr }}</p>
</div>
```

Şimdi farklı seçicilere (selectors) bildirim (deklarasyon) blokları ekleyeceğiz. `.` ile başlayan seçiciler sınıflara işaret eder. Web'de, aşağıdaki kodu anlamanıza yardımcı olacak pek çok güzel CSS öğreticisi ve açıklama mevcut. Şimdilik sadece bu kodu kopyalayıp `blog/static/css/blog.css` dosyamıza yapıştıralım:

```css
.page-header {
    background-color: #ff9400;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    float: right;
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
```

Sonra da blog gönderilerimizi gösteren HTML kodunu sınıf bildirimleriyle saralım. <0>blog/templates/blog/post_list. html</0> dosyasındaki şu kodu atıp:

```html
{% for post in posts %}
    <div class="post">
        <p>yayınlanma tarihi: {{ post.yayinlama_tarihi }}</p>
        <h1><a href="">{{ post.baslik }}</a></h1>
        <p>{{ post.yazi|linebreaksbr }}</p>
    </div>
{% endfor %}
```

bununla değiştirelim:

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        {{ post.yayinlama_tarihi }}
                    </div>
                    <h1><a href="">{{ post.baslik }}</a></h1>
                    <p>{{ post.yazi|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Bu dosyaları kaydedin ve web sayfanızı yenileyin.

![Şekil 14.4][8]

 [8]: images/final.png

Heyo! Harika görünüyor, değil mi? Yapıştırdığımız bu kodları anlamak pek de zor değil. Büyük bir kısmını sırf okuyarak anlayabilirsiniz.

CSS ile biraz oynamaktan korkmayın ve bazı şeyleri değiştirmeyi deneyin. Bir şeyi bozarsanız tasalanmayın, yaptığınızı her zaman geri alabilirsiniz!

Her durumda atölye sonrası ödevi olarak ücretsiz [Codeacademy HTML & CSS Kursu][2]'nu, websayfanızı CSS ile güzelleştirmeyi öğrenmek için almanızı tavsiye ediyoruz.

Sonraki bölüm için hazır mısınız? :)