# CSS – sayfanı güzelleştir!

Blogumuz hala epey çirkin gözüküyor, değil mi? Güzelleştirme zamanı! Bunun için CSS kullanacağız.

## CSS Nedir?

Cascading Style Sheets (yani stil şablonu, kısaca CSS) bir işaretleme dili (örneğin HTML) ile yazılmış bir web sitesinin görünüm ve biçimini tanımlamakta kullanılan bir dildir. Bunu, web sayfamızın bir tür makyajı gibi düşünün ;)

Fakat tekrar sıfırdan başlamak istemiyoruz, değil mi? Bir kez daha, programcıların internette ücretsiz sundukları bir şeyi kullanacağız. Bilirsiniz, tekerleği yeniden icat etmek pek eğlenceli değil.

## Haydi Bootstrap kullanalım!

Bootstrap HTML and CSS tabanlı çok güzel websiteleri geliştirmek için en yaygın olarak kullanılan çözümlerden biridir https://getbootstrap.com/

Twitter yazılımcıları tarafından geliştirilmeye başlanmış ve şu anda dünyanın her yerinden gönüllüler tarafından geliştirilmektedir!

## Bootstrap kurulumu

Bootstrap'ı kurmak için alttakileri `.html` dosyasının `<head>` kısmına eklemelisiniz:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Bu satırlar projeye yeni dosya eklemez. Ancak İnternet'te var olan dosyalara işaret eder. Haydi, tekrar websiteni tekrar aç ve yenile. İşte budur!

![Şekil 14.1](images/bootstrap1.png)

Şimdiden daha güzel gözüküyor!

## Django'da statik dosyalar

Son olarak **statik dosyalar** diye bahsettiğimiz şeylere daha yakından bakalım. Statik dosyalar, tüm CSS dosyaları ve resimlerindir. İçerikleri istek bağlamından (request context) bağımsızdır ve her kullanıcı için aynıdır.

### Django'da statik dosyaları nereye koymalı

Django dahili "admin" uygulaması için statik dosyaları nerede bulacağını biliyor. Şimdi sadece kendi `blog` uygulamamız için bazı statik dosyalar eklememiz gerekiyor.

Bunu blog uygulamamızın içine `static` isimli bir klasör oluşturarak yapacağız:

    djangogirls 
    ├── blog 
    │ ├── geçişler
    │ ├── statik 
    │ └── şablonlar 
    └── benimsitem
    

Django otomatik olarak uygulama klasörlerinizdeki "static" adlı klasörleri bulur. Böylece bunların içerikleri statik dosya olarak kullanabilir.

## İlk CSS dosyanız!

Simdi web sayfana kendi stilini eklemen için bir CSS dosyası oluşturalım. `static` klasörü içinde `css` adlı yeni bir klasör oluştur. Şimdi de `css` klasörü içinde `blog.css` adlı yeni bir dosya oluşturalım. Hazır mısınız?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Şimdi CSS yazma zamanı! `blog/static/css/blog.css` dosyasını kod editöründe açın.

Burada CSS'yi özelleştirme ve öğrenmeyle ilgili çok derinlemesine gidemeyeceğiz. Daha fazla bilgi edinmek isterseniz, bu sayfanın sonunda ücretsiz CSS kursu için bir tavsiye var.

Ama, biraz da yapalım. Acaba başlığımızın rengini mi değiştirsek? Bilgisayarlar renkleri anlamak için özel kodlar kullanır. Bu kodlar `#` ile başlar ve 6 harf(A-F) ve sayıyla(0-9) devam eder. Örneğin, mavinin renk kodu `#0000FF` dur. Birçok renk için renk kodlarını buradan bulabilirsiniz: http://www.colorpicker.com/. Ayrıca [tanımlı renkler](http://www.w3schools.com/colors/colors_names.asp)i de kullanabilirsin, `red` (kırmızı) ve `green` (yeşil) gibi.

`blog/static/css/blog.css` dosyanıza şu kodu eklemelisiniz:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
}
```

`h1 a` bir CSS seçicisidir (selector). Bu, stillerimizi `h1` öğesi içerisindeki `a` öğelerine uyguladığımız anlamına geliyor. Yani `<h1><a href="">bağlantı</a></h1>` gibi bir öğemiz olduğunda, ona `h1 a` stilimiz uygulanıyor. Bu durumda, rengi `#FCA205` yani turuncu yapmasını söylüyoruz. Elbette, buraya kendi arzu ettiğin rengi koyabilirsin!

Bir CSS dosyasında, HTML dosyasındaki öğeler için stil belirleriz. Öğeleri tanımlamanın ilk yolu öğe adıdır. Bunları HTML bölümünden etiket olarak hatırlıyor olabilirsiniz. Bunların hepsi öğe adına örnektir: `a`, `h1` ve `body`. Öğeleri aynı zamanda `class` ve `id` öznitelikleri ile tanımlarız. Sınıf ve id (kimlik), bir elemente senin tarafından verilen isimlerdir. Sınıflar bir öğe grubunu tanımlar, id'ler ise belirli bir öğeye işaret ederler. Örneğin şu aşağıdaki etiket CSS tarafından, `a` etiket adı, `external_link` class'ı ya da `link_to_wiki_page` id'si kullanılarak tanımlanabilir:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

CSS hakkında daha fazla bilgi edinmek için [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp) u okuyabilirsin.

Bir de HTML şablonuna projemize CSS eklediğimizi bildirmemiz gerekiyor. `blog/templates/blog/post_list.html` dosyasını açıp en başına bunlar ekleyelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load staticfiles %}
```

Burada sadece statik dosya ekliyoruz :) `<head>` ve `</head>` etiketleri arasına, bootstrap linklerinde sonra, şu satırı ekleyelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Tarayıcı, dosyaları verilen sırada okuyor. O yüzden doğru yerde olduğundan emin olmalıyız. Aksi takdirde dosyadaki kod, Bootstrap dosyası tarafından üzerine yazılabilir. Az evvel şablonumuza (template) CSS dosyamızın nerede olduğunu söylemiş olduk.

Şimdi dosyanız şöyle olmalı:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

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
                <p>Yayın tarihi: {{ post.published_date }}</p>
                <h1><a href="">{{ post.title }}</a></h1>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Tamamdır, dosyayı kaydedip sayfayı yenileyebilirsiniz.

![Şekil 14.2](images/color2.png)

Güzel! Şimdi de sitemizi biraz rahatlatıp sol kenar boşluğunu arttırsak mı? Hadi deneyelim!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Bunu CSS ekleyip kaydet ve bak bakalım! Nasıl da oldu!

![Şekil 14.3](images/margin2.png)

Belki de başlığımızın yazı tipini özelleştirebiliriz? Aşağıdaki satırı `blog/templates/blog/post_list.html` dosyasının içinde `<head>` bölümüne yapıştırın:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Daha önce yaptığımız gibi, sıralamayı ve yerini kontrol edelim `blog/static/css/blog.css` den önce olmalı. Bu satır Google Fonts'tan *Lobster* adlı bir font yükler (https://www.google.com/fonts).

`blog/static/css/blog.css` CSS dosyasında `h1 isimli ` tanımlama bölümünü bulalım ( `{` ve `}` sembolleri arasındaki kod). `font-family: 'Lobster';` satırını parantezler arasına kopyalayıp sayfayı yenileyelim:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a {
    color: #FCA205;
    font-family: 'Lobster';
}
```

![Şekil 14.3](images/font.png)

Harika!

Yukarıda bahsettiğimiz üzere, CSS'te class (sınıf) diye bir kavram var. Class'lar, temel olarak HTML kodunuzun bir kısmına isim vermenize yarar ve diğer kısımları stiline değiştirmeden yalnızca o kısmın stilini değiştirmenizi sağlar. Bu süper yararlı olabilir! Çok farklı şeyler yapan iki div'iniz var diyelim (örneğin biri başlık diğeri gönderinin metni). Class, farklı görünmelerini sağlamana yardımcı olur.

Devam edelim ve HTML kodumuzun bir kısmına isim verelim. Başlığı içeren `div`'e `page-header` isimli bir class ekleyelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

Şimdi de gönderi metnini içeren `div`'e `post` isimli bir sınıf ekleyelim.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>Yayın tarihi: {{ post.published_date }}</p>
    <h1><a href="">{{ post.title }}</a></h1>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Şimdi farklı seçicilere (selectors) bildirim (deklarasyon) blokları ekleyeceğiz. `.` ile başlayan seçiciler sınıflara işaret eder. Web'de, aşağıdaki kodu anlamanıza yardımcı olacak pek çok güzel CSS öğreticisi ve açıklama mevcut. Şimdilik sadece bu kodu kopyalayıp `blog/static/css/blog.css` dosyamıza yapıştıralım:

{% filename %}blog/static/css/blog.css{% endfilename %}

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

Sonra, blog gönderilerini gösteren HTML kodunu, class bildirimleri içine alın. <0>blog/templates/blog/post_list.html</0> içindeki şu kısmı,

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>Yayın tarihi: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

bununla değiştirelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>Yayın tarihi: {{ post.published_date }}</p>
                    </div>
                    <h1><a href="">{{ post.title }}</a></h1>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Bu dosyaları kaydedin ve web sayfanızı yenileyin.

![Şekil 14.4](images/final.png)

Yaşasın! Harika görünüyor değil mi? Şimdi yapıştırdığımız koda bakıp CSS tarafından kullanılan ve HTML eklenmiş olan nesneleri bulalım. Tarihi turkuaz rengine çevirmek için nereyi değiştirmen gerekir?

CSS ile biraz oynamaktan çekinme ve bir kaç şeyi değiştirmeye calış. CSS ile oynamak neyin neyi etkilediğini anlamak için çok faydalı. Bir şeyleri bozarsan dert etme, her zaman geri alabilirsin!

Ücretsiz [Codeacademy HTML & CSS kursu](https://www.codecademy.com/tracks/web)nu izlemeni gerçekten öneririz. Web sitelerini CSS'le güzelleştirmeyi iyice öğrenmene yardımcı olabilir.

Sonraki bölüm için hazır mısın?! :)