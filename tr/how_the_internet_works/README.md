# İnternet nasıl çalışır

> Bu bölüm Jessica McKellar'ın "How the Internet works" yani "İnternet nasıl çalışır" adlı bir konuşmasından esinlenerek oluşturuldu. (http://web.mit.edu/jesstess/www/).

Bahse varız ki İnternet'i her gün kullanıyorsunuz. Fakat tarayıcınıza http://djangogirls.org gibi bir adres girip `enter` tuşuna bastığınızda neler olduğunu biliyor musunuz?

Öncelikle bir web sitesinin bir sabit diske kaydedilmiş bir grup dosya olduğunu anlamanız gerekir. Tıpkı filmleriniz, müzikleriniz ya da resimleriniz gibi. Ancak, web sitelerine özel şöyle bir durum var: HTML adı verilen bir bilgisayar kodu içerirler. 

Eğer programlamaya aşina değilseniz HTML'yi kavramak başlangıçta zor olabilir, ama web tarayıcılarınız (Chrome, Safari, Firefox, vs.) ona bayılıyor. Web tarayıcılarınız bu kodu anlamak, komutlarını yerine getirmek ve size bu websitesini oluşturan dosyaları sunmak için tasarlanmıştır, tam da olmasını istediğiniz gibi.

Her dosya gibi, bu HTML dosyalarını da sabit diskte bir yerde saklamamız gerekir. Internet için, *sunucu* denilen özel ve güçlü bilgisayarlar kullanıyoruz. Bir ekranları, fareleri ya da klavyeleri yok çünkü esas amaçları veriyi saklamak ve sunmak. Bu yüzden onlara *sunucu* diyoruz -- çünkü size veri *sunuyorlar*.

Peki, fakat İnternet'in nasıl göründüğünü bilmek istiyorsunuz. Değil mi?

Size bir resmini çizdik, İnternet işte buna benzer:

![Şekil 1.1][1]

 [1]: images/internet_1.png

Çok karışık, değil mi? Aslında bu birbirine bağlı makinelerin(yukarıda bahsi geçen *sunucu*lar) birbirine bağlandığı bir ağ. Yüz binlerce makine! Dünyanın dört bir yanını saran yüz binlerce kilometrelik kablolar! İnternet'in ne kadar karışık olduğunu görmek için denizaltı kablo haritası web sitesine(http://submarinecablemap.com) göz atabilirsiniz. İşte web sitesinden bir ekran görüntüsü:

![Şekil 1.2][2]

 [2]: images/internet_3.png

Büyüleyici, değil mi? Ama açıkça belli ki, İnternet'e bağlanan tüm makineler arasında kablolar olması mümkün değil. Yani, bir makineye ulaşmak için( örneğin http://djangogirls.org web sitesinin kayıtlı olduğu) bir çok farklı makineden istek geçmesi gerekli.

Şöyle gözükmekte:

![Şekil 1.3][3]

 [3]: images/internet_2.png

Tarayıcınıza http://djangogirls.org yazdığınızda, "Sevgili Django Girls, ben djangogirls.org web sitesini görmek istiyorum. Lütfen bana gönderin!" diyen bir mektup gönderdiğinizi düşünün.

Mektubunuz size en yakın postaneye gider. Daha sonra sizden biraz daha uzak bir postaneye gider, daha sonra biraz daha uzaktakine, daha uzağa ve en son gitmesi gereken yere. Tek farklı olan, aynı yere bir çok mektup(*veri paketi*) gönderirseniz, tamamen farklı postanelerden(*yönlendirici*) geçebilir. Bu, her bir postanede nasıl dağıtım yapıldığına bağlıdır.

![Şekil 1.4][4]

 [4]: images/internet_4.png

Evet, bu kadar basit. Bir mektup yollarsınız ve cevap beklersin. Tabii ki, kağıt kalem yerine bayt biriminde veri kullanırsınız, fakat fikir aynı!

Sokak adı, şehir, alan kodu ve ülke adı yerine, biz IP adreslerini kullanırız. Bilgisayarınız ilk olarak DNS'den (Domain Name System - Alan Adı Sistemi) djangogirls.org adresini bir IP adresine çevirmesini ister. Bu biraz ulaşmak istediğiniz kişinin adına bakarak telefon numarası ve adresini bulabildiğiniz eski telefon rehberleri gibi çalışır.

Bir mektup gönderdiğinizde, bazı özelliklerin doğru teslim edilmesi gerekecektir: bir adres, pul vs. Ayrıca alıcının anlayacağı bir dil kullanıyorsunuz, değil mi? Aynısı bir web sitesini görmek için gönderdiğiniz *veri paketleri* için de geçerli. HTTP(Hypertext Transfer Protocol - HiperMetin transfer protokolü) adı verilen bir protokol kullanırız.

Basit olarak, bir web siteniz olduğunuzda, içinde yaşayacağı bir *sunucu* makineniz olması gerekli. *Sunucu* (bir mektupla gelen) bir *istek* aldığında, (başka bir mektupla) size web sitenizi gönderir.

Bu bir Django eğitimi olduğu için, Django'nun ne yaptığını soracaksınız. Bir yanıt gönderirken, herkese her zaman aynı şeyi göndermek istemezsiniz. Mektupları özellikle size yazan kişi için kişiselleştirmek çok daha iyi, değil mi? Django bu kişiselleştirilmiş, ilginç mektupları yazmanıza yardımcı olur :).

Bu kadar konuşma yeter, bir şeyler yaratma vakti!