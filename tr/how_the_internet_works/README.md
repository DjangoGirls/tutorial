# İnternet Nasıl Çalışır

> For readers at home: this chapter is covered in the [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

We bet you use the Internet every day. But do you actually know what happens when you type an address like https://djangogirls.org into your browser and press `enter`?

Öncelikle bir web sitesinin bir sabit diske kaydedilmiş bir grup dosya olduğunu anlamanız gerekir. Tıpkı filmleriniz, müzikleriniz ya da resimleriniz gibi. Ancak, web sitelerine özel şöyle bir durum var: HTML adı verilen bir bilgisayar kodu içerirler. 

Eğer programlamaya aşina değilseniz HTML'yi kavramak başlangıçta zor olabilir, ama web tarayıcılarınız (Chrome, Safari, Firefox, vs.) ona bayılıyor. Web tarayıcılarınız bu kodu anlamak, komutlarını yerine getirmek ve size bu websitesini oluşturan dosyaları sunmak için tasarlanmıştır, tam da olmasını istediğiniz gibi.

Her dosya gibi, bu HTML dosyalarını da sabit diskte bir yerde saklamamız gerekir. Internet için, *sunucu* denilen özel ve güçlü bilgisayarlar kullanıyoruz. Bir ekranları, fareleri ya da klavyeleri yok çünkü esas amaçları veriyi saklamak ve sunmak. That's why they're called *servers* – because they *serve* you data.

Tamam ama yinede Internetin nasıl gözüktğünü görmek istersiniz değil mi?

Size bir resmini çizdik, İnternet işte buna benzer:

![Şekil 1.1](images/internet_1.png)

Çok karışık, değil mi? Aslında birbirine bağlanmış bir makina ağıdır (yukarıda bahsedilen *servers*). Yüz binlerce makine! Dünyanın dört bir yanını saran yüz binlerce kilometrelik kablolar! İnternet'in ne kadar karışık olduğunu görmek için denizaltı kablo haritası web sitesine(http://submarinecablemap.com) göz atabilirsiniz. İşte web sitesinden bir ekran görüntüsü:

![Şekil 1.2](images/internet_3.png)

Büyüleyici, değil mi? Ama açıkça belli ki, İnternet'e bağlanan tüm makineler arasında kablolar olması mümkün değil. So, to reach a machine (for example, the one where https://djangogirls.org is saved) we need to pass a request through many, many different machines.

Şöyle gözükmekte:

![Şekil 1.3](images/internet_2.png)

Imagine that when you type https://djangogirls.org, you send a letter that says: "Dear Django Girls, I want to see the djangogirls.org website. Send it to me, please!"

Mektubunuz size en yakın postaneye gider. Daha sonra sizden biraz daha uzak bir postaneye gider, daha sonra biraz daha uzaktakine, daha uzağa ve en son gitmesi gereken yere. Tek farklı olan, aynı yere bir çok mektup(*veri paketi*) gönderirseniz, tamamen farklı postanelerden(*yönlendirici*) geçebilir. Bu, her bir postanede nasıl dağıtım yapıldığına bağlıdır.

![Şekil 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Sokak adı, şehir, alan kodu ve ülke adı yerine, biz IP adreslerini kullanırız. Bilgisayarınız ilk olarak DNS'den (Domain Name System - Alan Adı Sistemi) djangogirls.org adresini bir IP adresine çevirmesini ister. It works a little bit like old-fashioned phonebooks where you can look up the name of the person you want to contact and find their phone number and address.

When you send a letter, it needs to have certain features to be delivered correctly: an address, a stamp, etc. Ayrıca alıcının anlayacağı bir dil kullanıyorsunuz, değil mi? Aynısı bir web sitesini görmek için gönderdiğiniz *veri paketleri* için de geçerli. HTTP(Hypertext Transfer Protocol - HiperMetin transfer protokolü) adı verilen bir protokol kullanırız.

Basit olarak, bir web siteniz olduğunuzda, içinde yaşayacağı bir *sunucu* makineniz olması gerekli. *Sunucu* (bir mektupla gelen) bir *istek* aldığında, (başka bir mektupla) size web sitenizi gönderir.

Since this is a Django tutorial, you might ask what Django does. Bir yanıt gönderirken, herkese her zaman aynı şeyi göndermek istemezsiniz. Mektupları özellikle size yazan kişi için kişiselleştirmek çok daha iyi, değil mi? Django bu kişiselleştirilmiş, ilginç mektupları yazmanıza yardımcı olur. :)

Yeterince konuştuk - Yaratma zamanı!