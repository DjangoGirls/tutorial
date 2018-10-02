Chromebook kullanmıyorsanız, [bu bölümü atlayabilirsiniz](http://tutorial.djangogirls.org/en/installation/#install-python). Chromebook kullanıyorsanız kurulum deneyiminiz biraz farklı olacaktır. Diğer yükleme yönergelerini göz ardı edebilirsiniz.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE, size İnternette yazılım yükleyebileceğiniz, yazabileceğiniz ve çalıştırabileceğiniz bir kod düzenleyicisi ve çalışan bir bilgisayara erişim sağlayan bir araçtır. Eğitim boyunca, Cloud IDE sizin *yerel makinanız* gibi davranacak. OS X, Ubuntu veya Windows'daki sınıf arkadaşlarınız gibi terminal arayüzünde komut çalıştırmaya devam edeceksiniz, ancak terminaliniz Cloud IDE'nin sizin yerinize kuracağı başka bir bilgisayara bağlanacaktır. Cloud IDE'ler (PaizaCloud bulut IDE, AWS Cloud9) için talimatlar burada. Cloud IDE'lerden birini seçin ve o IDE'nin talimatlarini takip edin.

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/)'ye gidin
2. Bir hesap oluşturun
3. *New Server*'a tiklayalim
4. Pencerenin sol tarafındaki Terminal butonuna tıklayalım

Şimdi arayüzün sol tarafında bir takım buttonları görmeniz gerekiyor. "Terminal" buttonuna tıklayıp aşağıdaki komut satırını gösteren bir ekran açın:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal Cloud 9 in hazırladığı komutları gösterecek. Ekranın boyunu değiştirebilir veya maxize edebilirsiniz.

#### AWS Cloud9

1. [AWS Cloud9](https://aws.amazon.com/cloud9/)'a gidin
2. Bir hesap oluşturun
3. *Create Environment* a tıklayın

Şimdi bir kenar çubuğu, bazı metinlerin olduğu büyük bir ana pencere ve en altta da buna benzer küçük penceresi olan bir arayüz görmelisiniz:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Bu alt alan * terminalinizdir </ 0>, Cloud 9'un sizin için hazırladığı talimatlarınızı yazacağınız yer. Biraz daha büyük yapmak için bu pencereyi yeniden boyutlandırabilirsiniz.</p> 

### Sanal ortam (Virtual environment)

Bir sanal ortam(virtualenv diye de bilinir), üzerinde çalıştığımız proje için kullanışlı kodlarımızı yazabileceğimiz özel bir kutudur. Bunları çeşitli projelerimizi ayrı tutmak için kullanırız, böylece farklı projeler arasında işler karışmaz.

Cloud 9 arayüzünün altındaki terminalinizde şunu çalıştırın:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Eğer hala çalışmıyorsa eğitmeninizden yardım isteyin.

Sonra, bunu çalıştırın:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(son satırda bir tilde ve eşitlik işareti kullandığımıza dikkat edin: ~=).

### GitHub

Bir [Github](https://github.com) hesabı açın.

### PythonAnywhere

Django Girls eğitimi, yeni web uygulamanızı güçlendiren ve onu herkesin görebileceği şekilde herkes tarafından erişilebilen bir bilgisayara (sunucu olarak adlandırılır) taşıyan bir kod olan Deployment (Dağıtım) adlı bir bölümü içerir.

Kılavuzu Chromebook üzerinden kullanırken bu bölüm biraz garip oluyor; zaten internet üzerindeki bir bilgisayar kullanılıyor (laptop dışında). Bununla birlikte, Cloud 9'u çalışma alanımız veya "devam etmekte" olan işlerimizin bulunduğu bir yer olarak, Python Anywhere'i de işlerimizi daha eksiksiz hale getirdiğimizde gösterebileceğimiz bir yer olarak düşündüğümüzde hala kullanışlıdır.

Bu nedenle, [www.pythonanywhere.com](https://www.pythonanywhere.com) adresinden yeni bir Python Anywhere hesabı açın.