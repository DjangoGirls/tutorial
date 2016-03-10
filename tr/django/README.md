# Django nedir?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) Python ile yazılmış ücretsiz ve açık kaynak bir web uygulama iskeletidir (framework). Bir web iskeleti, websitesi geliştirmeyi hızlandıran ve kolaylaştıran bir grup bileşendir.

Bir websitesi geliştirdiğinizde benzer türde bileşenlere her zaman ihtiyacınız olur: kullanıcılar için kimlik denetimi (üye olma, üye girişi, üye çıkışı), websiteniz için bir yönetim paneli, formlar, dosyaları yüklemek için bir yol, vs.

Şansınıza çok önceden başka insanlar yeni bir site oluştururken web geliştiricilerinin benzer problemlerle karşı karşıya kaldığını fark etti ve bir araya gelip iskeletler (Django bunlardan biri) oluşturdular. Bu iskeletler size kullanabileceğiniz hazır bileşenler verir.

İskeletler sizi tekerleği yeniden icat etmekten kurtarır ve websitesi geliştirirken yükünüzün bir kısmını hafifletmekte yardımcı olur.

## Neden bir iskelete ihtiyacınız var?

Django'nun tam olarak ne işe yaradığını anlamak için sunucular konusuna daha çok girmemiz gerekiyor. İlk bilmeniz gereken şey, sunucunuzun ondan bir web sayfası sunmasını istediğinizi bilmesi gerektiği.

Bir posta kutusunun (port) gelen mektuplar (requests) için izlendiğini düşünün. Bu bir web sunucusu tarafından yapılıyor. Sunucu mektubu okuyor ve bir web sayfası göndererek cevap veriyor. Ama bir şey gönderecekseniz, içeriğe ihtiyacınız var. Django içeriği oluşturmanıza yardımcı olan bir şeydir.

## Birisi sunucunuzdan bir web sitesi istediğinde ne olur?

Web sunucusuna bir istek geldiğinde tam olarak ne istendiğini çıkarmak için Django'ya geçirilir. O da önce web sayfasının adresini alır ve ne yapması gerektiğini çıkarmaya çalışır. Bu kısım Django'nun **url çözücüsü** (urlresolver) tarafından yapılıyor (websitesi adresine URL - Uniform Resource Locator - deniyor, dolayısıyla *url çözücü* ismi mantıklı oluyor). Çok akıllı değil - bir kalıp listesi alıyor ve URL'yi bunlarla eşleştirmeye çalışıyor. Django kalıpları yukarıdan aşağı kontrol ediyor ve eşleşen bir şey varsa isteği (request'i) ilişkilendirilmiş işleve (fonksiyona) geçiriyor. Bu işlev bir *view*'a karşılık geliyor. View kelimesi Türkçe'de görünüm anlamına gelir. Django'da özel bir terim olduğu için, biz sadece <1>view</1> kelimesini kullanacağız.).

Mektup dağıtan bir postacı düşünün. Sokak boyunca yürüyor ve her evin numarasını mektubun üstündeki numara ile karşılaştırıyor. Eğer eşleşirse, mektubu oraya koyuyor. Url çözücü işte böyle çalışır!

*view* işlevinde her türlü ilginç şey yapılıyor: Bir bilgi için veritabanına bakabiliriz. Belki de kullanıcı veride bir şeyin değişmesini istemiştir? "Lütfen iş tanımımı değiştirin" diyen bir mektup gibi. *view* buna yapmaya izniniz olup olmadığını kontrol edebilir, sonra da sizin için iş tanımınızı güncelleyip geriye "Yapıldı!" diye bir ileti gönderir. Arkasından *view* bir cevap üretir ve Django bunu kullanıcının web tarayıcısına gönderebilir.

Tabi ki yukardaki biraz basitleştirilmiş bir açıklama, ama şimdilik bütün teknik ayrıntıyı bilmene gerek yok. Genel bir fikrin olması yeterli.

Doğrudan çok fazla detaya girmek yerine, Django ile birşeyler oluşturacağız ve önemli kısımları yolda öğreneceğiz!