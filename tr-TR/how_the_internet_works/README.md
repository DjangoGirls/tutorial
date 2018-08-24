# İnternet Nasıl Çalışır

> Evdeki okuyucular için: bu bölüm [İnternet Nasıl Çalışır](https://www.youtube.com/watch?v=oM9yAA09wdc) videosunda anlatıldı.
> 
> Bu bölüm Jessica McKellar'ın "İnternet Nasıl Çalışır" adlı konuşmasından esinlenilerek oluşturuldu. (http://web.mit.edu/jesstess/www/).

İddia ediyoruz ki her gün İnternet'i kullanıyorsunuz. Fakat tarayıcınıza https://djangogirls.org gibi bir adres girip `enter` tuşuna bastığınızda neler olduğunu biliyor musunuz?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Tıpkı filmleriniz, müzikleriniz ya da resimleriniz gibi. Ancak, web sitelerine özel şöyle bir durum var: HTML adı verilen bir bilgisayar kodu içerirler. 

Eğer programlamaya aşina değilseniz HTML'yi kavramak başlangıçta zor olabilir, ama web tarayıcılarınız (Chrome, Safari, Firefox, vs.) ona bayılıyor. Web tarayıcılarınız bu kodu anlamak, komutlarını yerine getirmek ve size bu websitesini oluşturan dosyaları sunmak için tasarlanmıştır, tam da olmasını istediğiniz gibi.

Her dosya gibi, bu HTML dosyalarını da sabit diskte bir yerde saklamamız gerekir. Internet için, *sunucu* denilen özel ve güçlü bilgisayarlar kullanıyoruz. Bir ekranları, fareleri ya da klavyeleri yok çünkü esas amaçları veriyi saklamak ve sunmak. Bu yüzden onlara *sunucular* diyoruz – çünkü size veri *sunuyorlar*.

Tamam ama yinede Internetin nasıl gözüktğünü görmek istersiniz değil mi?

Size bir resmini çizdik, İnternet işte buna benzer:

![Şekil 1.1](images/internet_1.png)

Çok karışık, değil mi? Aslında birbirine bağlanmış bir makina ağıdır (yukarıda bahsedilen *servers*). Yüz binlerce makine! Dünyanın dört bir yanını saran yüz binlerce kilometrelik kablolar! İnternet'in ne kadar karışık olduğunu görmek için denizaltı kablo haritası web sitesine(http://submarinecablemap.com) göz atabilirsiniz. İşte web sitesinden bir ekran görüntüsü:

![Şekil 1.2](images/internet_3.png)

Büyüleyici, değil mi? But it is not possible to have a wire between every machine connected to the Internet. Yani, bir makineye erişmek için (örneğin, https://djangogirls.org sitesinin kayıtlı olduğu) birçok farklı makine üzerinden istek geçmesi gereklidir.

Şöyle gözükmekte:

![Şekil 1.3](images/internet_2.png)

https://djangogirls.org yazdığınızda: "Sevgili Django Girls, djangogirls.org websitesini görmek istiyorum. Lütfen bana gönderin!" diyen bir mektup gönderdiğinizi düşünün.

Mektubunuz size en yakın postaneye gider. Daha sonra sizden biraz daha uzak bir postaneye gider, daha sonra biraz daha uzaktakine, daha uzağa ve en son gitmesi gereken yere. Tek farklı olan, aynı yere bir çok mektup(*veri paketi*) gönderirseniz, tamamen farklı postanelerden(*yönlendirici*) geçebilir. Bu, her bir postanede nasıl dağıtım yapıldığına bağlıdır.

![Şekil 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Sokak adı, şehir, alan kodu ve ülke adı yerine, biz IP adreslerini kullanırız. Bilgisayarınız ilk olarak DNS'den (Domain Name System - Alan Adı Sistemi) djangogirls.org adresini bir IP adresine çevirmesini ister. Bu bir nebze burada iletişim kurmak istediğiniz kişinin adına bakarak telefon numarası ve adresini bulabildiğiniz eski telefon rehberleri gibi çalışır.

Bir mektup gönderdiğinizde, bazı özelliklerin doğru olarak teslim edilecek olması gerekir: bir adres, bir pul vs. Ayrıca alıcının anlayacağı bir dil kullanıyorsunuz, değil mi? Aynısı bir web sitesini görmek için gönderdiğiniz *veri paketleri* için de geçerli. HTTP(Hypertext Transfer Protocol - HiperMetin transfer protokolü) adı verilen bir protokol kullanırız.

Basit olarak, bir web siteniz olduğunuzda, içinde yaşayacağı bir *sunucu* makineniz olması gerekli. *Sunucu* (bir mektupla gelen) bir *istek* aldığında, (başka bir mektupla) size web sitenizi gönderir.

Bu bir Django eğitimi olduğundan, Django'nun ne yaptığını sorabilirsiniz. Bir yanıt gönderirken, herkese her zaman aynı şeyi göndermek istemezsiniz. Mektupları özellikle size yazan kişi için kişiselleştirmek çok daha iyi, değil mi? Django bu kişiselleştirilmiş, ilginç mektupları yazmanıza yardımcı olur. :)

Yeterince konuştuk - Yaratma zamanı!