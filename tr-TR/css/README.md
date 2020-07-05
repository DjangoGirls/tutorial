# CSS - sayfanı güzelleştir!

Blogumuz hala epey çirkin gözüküyor, değil mi? Güzelleştirme zamanı! Bunun için CSS kullanacağız.

## CSS Nedir?

Cascading Style Sheets (yani stil şablonu, kısaca CSS) bir işaretleme dili (örneğin HTML) ile yazılmış bir web sitesinin görünüm ve biçimini tanımlamakta kullanılan bir dildir. Bunu, web sayfamızın bir tür makyajı gibi düşünün ;)

Fakat tekrar sıfırdan başlamak istemiyoruz, değil mi? Bir kez daha, programcıların internette ücretsiz sundukları bir şeyi kullanacağız. Bilirsiniz, tekerleği yeniden icat etmek pek eğlenceli değil.

## Haydi Bootstrap kullanalım!

Bootstrap güzel websiteleri geliştirmek için en yaygın olarak kullanılan HTML ve CSS tabanlı çözümlerden biridir: https://getbootstrap.com/

Bootstrap Twitter yazılımcıları tarafından geliştirilmeye başlanmış. Şu anda dünyanın her yerinden gönüllüler tarafından geliştirilmektedir!

## Bootstrap Kurulumu

Bootstrap yüklemek için `.html` uzantılı dosyanızı kod düzenleyicisinde açın ve `<head>` bölümüne şunları ekleyin:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

Bu satırlar projeye yeni dosya eklemez. Ancak İnternet'te var olan dosyalara işaret eder. Şimdi websitenizi açın ve sayfayı yenileyin. İşte oldu!

![Şekil 14.1](images/bootstrap1.png)

Şimdiden daha güzel görünüyor!

## Django'da statik dosyalar

Son olarak **statik dosyalar** dediğimiz şeylere daha yakından bakalım. Statik dosyalar, tüm CSS dosyaları ve resimlerindir. İçeriklerini istek içeriğine bağlı değildir ve her kullanıcı için aynıdır.

### Django'da statik dosyaları nereye koymalı

Django dahili "admin" uygulaması için statik dosyaları önceden nerede bulacağını biliyor. Şimdi kendi `blog` uygulamamız için bazı statik dosyalar eklememiz gerekiyor.

Bunu blog uygulamamızın içine `static` isimli bir klasör oluşturarak yapacağız:

    djangogirls 
    ├── blog 
    │ ├── migrations
    │ ├── static
    │ └── templates
    └── mysite
    

Django otomatik olarak uygulama klasörlerinizin içindeki "static" adlı klasörleri bulur. Böylece bunların içeriklerini statik dosya olarak kullanabilir.

## İlk CSS dosyanız!

Şimdi web sayfana kendi stilini eklemen için bir CSS dosyası oluşturalım. `static` klasörü içinde `css` adlı yeni bir klasör oluştur. Şimdi de `css` klasörü içinde `blog.css` adlı yeni bir dosya oluştur. Hazır mısınız?

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

Şimdi CSS yazma zamanı! `blog/static/css/blog.css` dosyasını kod editöründe açın.

Burada CSS'yi özelleştirme ve öğrenmeyle ilgili çok derinlemesine gidemeyeceğiz. Daha fazla bilgi edinmek isterseniz, bu sayfanın sonunda ücretsiz CSS kursu için bir tavsiye var.

Ama, en azından biraz yapalım. Acaba başlık renklerimizi mi değiştirsek? Bilgisayarlar renkleri anlamak için özel kodlar kullanır. Bu kodlar `#` ile başlar ve 6 harf(A-F) ve sayıyla(0-9) devam eder. Örneğin, mavinin renk kodu `#0000FF` dur. Birçok renk için renk kodlarını buradan bulabilirsiniz: http://www.colorpicker.com/. Ayrıca [tanımlı renkler](http://www.w3schools.com/colors/colors_names.asp)i de kullanabilirsiniz, `red` (kırmızı) ve `green` (yeşil) gibi.

`blog/static/css/blog.css` dosyanıza şu kodu eklemelisiniz:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` bir CSS seçicisidir (selector). Bu bizim stillerimizi `h1` öğesi içindeki herhangi bir `a` öğesine uyguladığınız anlamına gelir; `h2 a` seçicisi `h2` öğeleri için aynı şeyi yapar. Yani `<h1><a href="">bağlantı</a></h1>` gibi bir öğemiz olduğunda, ona `h1 a` stilimiz uygulanıyor. Böylelikle, o öğeye rengini`#Fca205` yani koyu turuncu olarak değiştirmesini söylüyoruz. Ya da burada kendi renginizi koyabilirsiniz ama beyaz arka plan ile iyi bir kontrastı olmasına dikkat edin!

Bir CSS dosyasında, HTML dosyasındaki öğeler için stil belirleriz. Öğeleri tanımlamanın ilk yolu öğe adıdır. Bunları HTML bölümünden etiketler olarak hatırlıyor olabilirsiniz. Bunların hepsi öğe adına örnektir: `a`, `h1` ve `body`. Öğeleri aynı zamanda `class` ve `id` öznitelikleri ile tanımlarız. Sınıf ve id (kimlik), bir öğeye senin tarafından verilen isimlerdir. Sınıflar bir öğe grubunu tanımlar, id'ler ise belirli bir öğeye işaret ederler. Örneğin şu aşağıdaki etiketi `a` etiket adı, `external_link` sınıfı ya da `link_to_wiki_page` id'si kullanarak tanımlayabilirsiniz:

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

CSS hakkında daha fazla bilgi edinmek için [CSS Selectors at w3schools](http://www.w3schools.com/cssref/css_selectors.asp) u okuyabilirsin.

HTML şablonumuza (template) da birtakım CSS eklemeleri yaptığımızı bildirmemiz gerekiyor. `blog/templates/blog/post_list.html` dosyasını kod editöründe açıp en başına şu satırı ekleyin:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

Burada sadece statik dosyalar ekliyoruz :) `<head>` ve `</head>` etiketleri arasına, bootstrap CSS dosyalarından sonra, şu satırı ekleyin:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

Tarayıcı, dosyaları verilen sırada okuyor. O yüzden doğru yerde olduğundan emin olmalıyız. Aksi takdirde Bootstrap dosyalar bizim kodumuzun üzerine yazabilir. Az evvel şablonumuza (template) CSS dosyamızın sadece nerede olduğunu söyledik.

Şimdi dosyanız şöyle görünmeli:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
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
                <p>published: {{ post.published_date }}</p>
                <h2><a href="">{{ post.title }}</a></h2>
                <p>{{ post.text|linebreaksbr }}</p>
            </div>
        {% endfor %}
    </body>
</html>
```

Tamam, dosyayı kaydedip sayfayı yenileyin!

![Şekil 14.2](images/color2.png)

Güzel bir iş çıkardınız! Şimdi de sitemizi biraz rahatlatıp sol kenar boşluğunu arttırsak mı? Hadi deneyelim!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

Bunu CSS dosyana ekleyip kaydet ve bak bakalım nasıl çalışıyor!

![Şekil 14.3](images/margin2.png)

Belki de başlığımızın yazı tipini özelleştirebiliriz? Aşağıdaki satırı `blog/templates/blog/post_list.html` dosyasının içinde `<head>` bölümüne yapıştırın:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

Daha önce yaptığımız gibi, sıralamayı ve yerini kontrol edelim `blog/static/css/blog.css` den önce olmalı. Bu satır Google Fonts'tan *Lobster* adlı bir font yükler (https://www.google.com/fonts).

`blog/static/css/blog.css` CSS dosyasında `h1 a` tanımlama bölümünü bulalım ( `{` ve `}` sembolleri arasındaki kod). `font-family: 'Lobster';` satırını parantezler arasına kopyalayıp sayfayı yenileyin:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![Şekil 14.3](images/font.png)

Harika!

Yukarıda bahsettiğimiz üzere, CSS'te sınıf (class) diye bir kavram var. Sınıflar, HTML kodunuzun bir kısmına isim vermenize yarar ve diğer kısımların stilini değiştirmeden yalnızca o kısmın stilini değiştirmenizi sağlar. Bu çok yararlı olabilir! Çok farklı şeyler yapan iki div'iniz var diyelim (örneğin biri başlık diğeri gönderinin metni). Sınıf farklı görünmelerini sağlamana yardımcı olur.

Hadi HTML kodunun bazı kısımlarına isim verelim. Başlığı içeren `div`'e `page-header` isimli bir sınıf ekleyelim:

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
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

Şimdi farklı seçicilere (selectors) bildirim (deklarasyon) blokları ekleyeceğiz. `.` ile başlayan seçiciler sınıflara işaret eder. Web'de, aşağıdaki kodu anlamanıza yardımcı olacak pek güzel CSS öğreticileri ve açıklamaları mevcut. Şimdilik sadece bu kodu kopyalayıp `blog/static/css/blog.css` dosyamıza yapıştıralım:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
page-header {
    background-color: #C25100;
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

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

Sonra, blog gönderilerini gösteren HTML kodunu, sınıf bildirimleri içine alın. Şu kısmı değiştirin:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

`blog/templates/blog/post_list.html` i bununla değiştirelim:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

Bu dosyaları kaydedin ve web sayfanızı yenileyin.

![Şekil 14.4](images/final.png)

Yaşasın! Harika görünüyor değil mi? Şimdi yapıştırdığımız koda bakıp CSS tarafından kullanılan sınıf eklediğimiz HTML bölümlerini bulalım. Tarihi turkuaz rengine çevirmek için nereyi değiştirirdiniz?

CSS ile biraz oynamaktan çekinme ve birkaç şeyi değiştirmeye calış. CSS ile oynamak neyin neyi etkilediğini anlamak için çok faydalı. Bir şey bozarsanız, merak etmeyin- her zaman geri alabilirsiniz!

Kesinlikle [freeCodeCamp](https://learn.freecodecamp.org/) adresindeki ücretsiz 'Temel HTML& HTML5" ve "Temel CSS" derslerini almanızı öneriyoruz. Bu dersler websitelerinizi HTML ve CSS ile daha güzel yapmayı öğrenmenize yardım edebilir.

Sonraki bölüm için hazır mısınız?! :)