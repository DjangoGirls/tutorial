# Django nedir?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) Python ile yazılmış özgür ve açık kaynak bir web uygulama iskeletidir (framework). Bir web iskeleti, websitesi geliştirmeyi hızlandıran ve kolaylaştıran bir grup bileşendir.

Bir web sitesi geliştirdiğinizde benzer türde bileşenlere her zaman ihtiyacınız olur: kullanıcılar için kimlik denetimi (üye olma, üye girişi, üye çıkışı), websiteniz için bir yönetim paneli, formlar, dosyaları yüklemek için bir yol, vs.

Şanslısınız ki, uzun zaman önce başkaları web geliştiricilerinin yeni bir site yaratırken benzer problemlerle karşı karşıya geldiğini farkettiler ve takım kurup, kullanmanız için hazır bileşenleri olan iskeletler (ki Django bunlardan bir tanesi) oluşturdular.

Frameworkler, siz yeni bir site oluştururken yükünüzü hafifletmek için tekerleği yeniden icat etmek zorunda.

## Neden bir iskelete ihtiyacınız var?

Django'nun aslında ne işe yaradığını anlamak için, sunuculara daha yakından bakmamız gerekiyor. İlk olarak sunucunun, onun size bir web sitesi sunmasını istediğinizi bilmesi gerekiyor.

Bir posta kutusunun (port) gelen mektuplar (requests) için izlendiğini düşünün. Bu bir web sunucusu tarafından yapılıyor. Web sunucusu mektubu okur ve ardından bir web sayfası ile cevap verir. Ama bir şey gönderecekseniz, içeriğe ihtiyacınız var. Django içeriği oluşturmanıza yardımcı olan bir şeydir.

## Birisi sunucunuzdan bir web sitesi istediğinde ne olur?

Bir istek bir web sunucusuna geldiğinde, Django'ya aktarılır aslında ve Django da istenin ne olduğunu anlamaya çalışır. O da önce bir web sayfası adresi alır ve ne yapacağını anlamaya çalışır. Bu kısım Django'nun **url çözücüsü** (urlresolver) tarafından yapılıyor (websitesi adresine URL - Uniform Resource Locator - deniyor, dolayısıyla *url çözücü* ismi mantıklı oluyor). Çok akıllı değildir - kalıpların bir listesini alır ve URL'yi eşleştirmeye çalışır. Django kalıpları üstten alta doğru denetler ve eşleşen bir şey varsa isteği ilgili işleve (*view* olarak adlandırılan) aktarır.

Mektup dağıtan bir postacı düşünün. Sokak boyunca yürüyor ve her evin numarasını mektubun üstündeki numara ile karşılaştırıyor. Eğer eşleşirse, mektubu oraya koyuyor. Url çözücü işte böyle çalışır!

Tüm ilginç şeyler *view (görünüm)* fonksiyonunda yapılır: bir bilgi için veritabanına bakabiliriz. Belki de kullanıcı veride bir şeyin değişmesini istemiştir? "Lütfen iş tanımımı değiştirin." diyen bir mektup gibi. *View* bunu yapmaya izninizin olup olmadığını kontrol eder, iş tanımınızı sizin için günceller ve geri "Tamamdır!" mesajı yollar. Sonra *view* bir yanıt üretir ve Django bunu kullanıcının web tarayıcısına gönderebilir.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!