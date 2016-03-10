# Domain (Alan Adı)

Heroku size bir alan adı verdi, ama uzun, hatırlaması zor ve çirkin. Kısa ve kolay hatırlanabilir bir alan adı olsaydı harika olurdu, değil mi?

Bu bölümde size yeni bir alan adı satın alıp Heroku'ya yönlendirmeyi öğreteceğiz!

## Alan adını nerden alabiliriz?

Bir alan adı ortalamada senelik $15 civarında oluyor. Alan adı sağlayıcısına göre daha ucuzları ve daha pahalıları var. Alan adı satın alabileceğiniz bir sürü şirket var: basit bir [google araması][1] size yüzlerce seçenek getirir.

 [1]: https://www.google.com/search?q=register%20domain

Bizim favorimiz [I want my name][2]. Kendilerini "acısız alan adı yönetimi" diye nitelendiriyorlar ve gerçekten acısız.

 [2]: https://iwantmyname.com/

## IWantMyName ile alan adı nasıl satın alınır?

[iwantmyname][3]'e gidin ve arama kutusuna istediğiniz alan adını girin.

 [3]: http://iwantmyname.com

![][4]

 [4]: images/1.png

Aradığınız ada sahip alan adlarının bir listesini görüyor olmanız lazım. Gülen surat, alan adını alabileceğinizi; üzülen surat ise alan adının halihazırda başkasında olduğunu gösteriyor.

![][5]

 [5]: images/2.png

`djangogirls.in` alan adını almaya karar verdik:

![][6]

 [6]: images/3.png

'Checkout'a gidin. Eğer hesabınız yoksa, kaydolmanız gerekir. Arkasından kredi kartı bilgilerinizi girin ve alan adını satın alın!

Menüde '`Domains`'e (alan adları) tıklayın ve yeni satın alınmış alan adınızı seçin. Arkasından `managen DNS records` (DNS kayıtlarınızı yönetin) linkine tıklayın:

![][7]

 [7]: images/4.png

Arkasından bu formu bulmanız gerekiyor:

![][8]

 [8]: images/5.png

Ve aşağıdaki detayları girin: - Hostname: www - Type: CNAME - Value: Heroku'daki alan adınız (örneğin djangogirls.herokuapp.com) - TTL: 3600

![][9]

 [9]: images/6.png

Önce 'Add' (ekle) butonuna tıklayın. Sonra da alttaki 'Save Changes'e (değişiklikleri kaydet) tıklayın.

Alan adınızın çalışır hale gelmesi birkaç saati sürebilir, sabırlı olun!

## Alan adını Heroku'da Ayarlayın

Heroku'ya da kendi özel alan adınızı kullanmak istediğinizi belirtmeniz gerekiyor.

[Heroku Dashboard][10]'una gidin, Heroku hesabınıza girin ve uygulamanızı seçin. 'Settings'e (ayarlar) girin ve `Domains` (alan adı) kısmına alan adınızı girin. Değişiklikleri kaydedin.

 [10]: https://dashboard.heroku.com/apps

İşte bu kadar!