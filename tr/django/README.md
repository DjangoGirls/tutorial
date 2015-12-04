# Django nedir?

Django (*/ˈdʒæŋɡoʊ/ jang-goh*) Python ile yazılmış ücretsiz ve açık kaynak bir web uygulama iskeletidir (framework). Bir web iskeleti, websitesi geliştirmeyi hızlandıran ve kolaylaştıran bir grup bileşendir.

Bir websitesi geliştirdiğinizde benzer türde bileşenlere her zaman ihtiyacınız olur: kullanıcılar için kimlik denetimi (üye olma, üye girişi, üye çıkışı), websiteniz için bir yönetim paneli, formlar, dosyaları yüklemek için bir yol, vs.

Şansınıza çok önceden başka insanlar yeni bir site oluştururken web geliştiricilerinin benzer problemlerle karşı karşıya kaldığını farketti ve bir araya gelip iskeletler (Django bunlardan biri) oluşturdular. Bu iskeletler size kullanabileceğiniz hazır bileşenler verir.

İskeletler sizi tekerleği yeniden icat etmekten kurtarır ve websitesi geliştirirken yükünüzün bir kısmını hafifletmekte yardımcı olur.

## Neden bir iskelete ihtiyacınız var?

Django'nun tam olarak ne işe yaradığını anlamak için sunucular konusunda daha çok girmemiz gerekiyor. İlk bilmeniz gereken şey, sunucunuzun onun bir web sayfası sunmasını istediğini bilmesi gerekiyor.

Bir posta kutusunun (port) gelen mektuplar (requests) için izlendiğini düşünün. Bu bir web sunucusu tarafından yapılıyor. Sunucu mektubu okuyor ve bir websayfası içeren bir cevap gönderiyor. Ama birşey gönderecekseniz, içeriğe ihtiyacınız var. Django içeriği oluşturmanıza yardımcı olan birşeydir.

## Birisi sunucunuzdan bir websitesi için istek gönderdiğinde (request ettiğinde) ne olur?

Web sunucusuna bir istek geldiğinde tam olarak ne istendiğini çıkarmak için Django'ya geçirilir. Önce web sayfasının adresini alır ve ne yapması gerektiğini çıkarmaya çalışır. Bu kısım Django'nun **url çözücüsü** (urlresolver) tarafından yapılıyor (websitesi adresine URL - Uniform Resource Locator - deniyor, dolayısıyla *url çözücü* ismi mantıklı oluyor). Çok akıllı değil - bir kalıp listesi alıyor ve URL'yi bunlarla eşleştirmeye çalışıyor. Django kalıpları yukardan aşağı kontrol ediyor ve eşleşen birşey varsa isteği (request'i) ilişkilendirilmiş işleve (fonksiyona) geçiriyor. Bu işlev bir *görünüm* (view)'a karşılık geliyor).

Mektubu olan bir postacı düşünün. Sokak boyunca yürüyor ve her evin numarasını mektubun üstündeki numara ile karşılaştırıyor. Eğer eşleşirse, mektubu oraya koyuyor. Url çözücü işte böyle çalışır!

*Görünüm* (view) işlevinde her türlü ilginç şey yapılıyor: bilgi almak için veritabanına bakabiliriz. Belki kullanıcı veride birşeyin değişmesini istedi? "Lütfen iş tanımımı değiştirin" diye bir mektup gibi. *Görünüm* buna yapmaya izniniz var mı diye kontrol edebilir, arkasından da sizin için iş tanımınızı güncelleyip geriye "Yapıldı!" diye bir mesaj döner. Arkasından *görünüm* bir cevap üretir ve Django bunu kullanıcının web tarayıcısına gönderebilir.

Tabi ki yukardaki açıklama biraz basitleştirilmiş bir açıklama, ama şimdilik bir sürü teknik detayı bilmene gerek yok. Genel bir fikrin olması yeterli.

Doğrudan çok fazla detaya girmek yerine, Django ile birşeyler oluşturacağız ve önemli kısımları yolda öğreneceğiz!