Chromebook kullanmıyorsanız, [bu bölümü atlayabilirsiniz](http://tutorial.djangogirls.org/en/installation/#install-python). Chromebook kullanıyorsanız kurulum deneyiminiz biraz farklı olacaktır. Diğer yükleme yönergelerini göz ardı edebilirsiniz.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE, size İnternette yazılım yükleyebileceğiniz, yazabileceğiniz ve çalıştırabileceğiniz bir kod düzenleyicisi ve çalışan bir bilgisayara erişim sağlayan bir araçtır. Eğitim boyunca, Cloud IDE sizin *yerel makinanız* gibi davranacak. OS X, Ubuntu veya Windows'daki sınıf arkadaşlarınız gibi terminal arayüzünde komut çalıştırmaya devam edeceksiniz, ancak terminaliniz Cloud IDE'nin sizin yerinize kuracağı başka bir bilgisayara bağlanacaktır. Cloud IDE'ler (PaizaCloud bulut IDE, AWS Cloud9) için talimatlar burada. Cloud IDE'lerden birini seçin ve o IDE'nin talimatlarini takip edin.

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/)'ye gidin
2. Bir hesap oluşturun
3. *New Server* a tıklayıp Django app i seçin
4. Pencerenin sol tarafındaki Terminal butonuna tıklayalım

Şimdi arayüzün sol tarafında bir takım buttonları görmeniz gerekiyor. "Terminal" buttonuna tıklayıp aşağıdaki komut satırını gösteren bir ekran açın:

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE'nin terminali sizin komutlarınızı girmeniz icin hazırlanacak. Terminal penceresinin boyunu değiştirebilir ve en büyük boyuta getirebilirsiniz.

#### AWS Cloud9

Cloud 9 kullanmak için bir AWS üyeliğine sahip olmanız ve kredi kartı bilgilerinizi girmeniz gerekiyor.

1. [Chrome Web Mağazası](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)'ndan Cloud 9 uygulamasını yükleyin
2. [c9.io](https://c9.io) sayfasına gidin ve *AWS Cloud9'u kullanmaya başlayın* butonuna tıklayın
3. Bir AWS hesabı açın (kredi kartı bilgilerinizi girmeniz gerekiyor, fakat ücretsiz kullanabilirsiniz)
4. AWS in paneline gidip arama çubuğuna *Cloud9* girin ve tıklayın
5. Cloud 9 panelinde *Create environment* a tıklayın
6. *django-girls* ismini verin
7. Ayarları (Settings) tanımlarken "Environment Type" için *Create a new instance for environment (EC2)* ve "Instance type" için *t2.micro* seçin ("Free-tier eligible." yazısı görünmeli). Halihazırdaki ayarları uygundur ve olduğu gibi bırakın.
8. *Next step* e tıklayın
9. *Create environment* a tıklayın

Şimdi, bir yan panel, içinde bir takım yazıların olduğu büyük bir ana ekran ve altta aşağıdaki yazıya benzeyen küçük bir panel olan yeni bir arayüz görmelisiniz:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Aşağıdaki bölge sizin terminalizdir. Bu terminali kullanarak Cloud 9 bigisayarına komut gönderebilirsiniz. Tercih ederseniz bu pencereyi büyütebilirsiniz.

### Sanal ortam (Virtual environment)

Sanal ortamlar (virtualenv olarak da bilinir) projelerimiz için faydalı içerik ve kod saklayabileceğimiz özel bir kutu gibidir. Onları farklı projemiz ile ilgili kodların birbirine karışmaması için kullanırız.

Çalıştır:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(dikkat ederseniz eşit işaretinde önce "~" var `~=`).

### GitHub

Bir [GitHub](https://github.com) hesabı açın.

### PythonAnywhere

Django Girls rehberi yazdığımız kodun web üzerinden başkaları tarafından erişilmesini sağlayan "yayına alma" (deployment) ile ilgili bir bölüm içerir.

Chromebook kullanırken bunu yapmak biraz garip gelebilir, çünkü zaten internet üzerinde olan bir bilgisayar kullanmaktayız. Ancak, bu kısım yine de faydalıdır, çünkü Cloud 9 çalışma ortamını "gelişme aşamasında" olan bir çalışma ve Python Anywhere de tamamladığız kısmın başkalarına gösterilebileceği yer olarak düşünebiliriz.

Öyleyse, şimdi yeni bir Python Anywhere hesabını [www.pythonanywhere.com](https://www.pythonanywhere.com) a girerek açalım.