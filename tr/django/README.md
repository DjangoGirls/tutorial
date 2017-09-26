# Django nedir?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Bir web iskeleti, websitesi geliştirmeyi hızlandıran ve kolaylaştıran bir grup bileşendir.

Bir websitesi geliştirdiğinizde benzer türde bileşenlere her zaman ihtiyacınız olur: kullanıcılar için kimlik denetimi (üye olma, üye girişi, üye çıkışı), websiteniz için bir yönetim paneli, formlar, dosyaları yüklemek için bir yol, vs.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Neden bir iskelete ihtiyacınız var?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Bir posta kutusunun (port) gelen mektuplar (requests) için izlendiğini düşünün. Bu bir web sunucusu tarafından yapılıyor. The web server reads the letter and then sends a response with a webpage. Ama bir şey gönderecekseniz, içeriğe ihtiyacınız var. Django içeriği oluşturmanıza yardımcı olan bir şeydir.

## Birisi sunucunuzdan bir web sitesi istediğinde ne olur?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Mektup dağıtan bir postacı düşünün. Sokak boyunca yürüyor ve her evin numarasını mektubun üstündeki numara ile karşılaştırıyor. Eğer eşleşirse, mektubu oraya koyuyor. Url çözücü işte böyle çalışır!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Belki de kullanıcı veride bir şeyin değişmesini istemiştir? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Tabi ki yukardaki biraz basitleştirilmiş bir açıklama, ama şimdilik bütün teknik ayrıntıyı bilmene gerek yok. Genel bir fikrin olması yeterli.

Doğrudan çok fazla detaya girmek yerine, Django ile birşeyler oluşturacağız ve önemli kısımları yolda öğreneceğiz!