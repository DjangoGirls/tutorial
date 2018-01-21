Chromebook kullanmıyorsanız, [bu bölümü atlayabilirsiniz](http://django-blog-tutorial.kadinyazilimci.com/en/installation/#install-python). Chromebook kullanıyorsanız kurulum deneyiminiz biraz farklı olacaktır. Diğer yükleme yönergelerini göz ardı edebilirsiniz.

### Cloud 9

Cloud 9, size İnternette yazılımı yükleyebileceğiniz, yazabileceğiniz ve çalıştırabileceğiniz bir kod düzenleyicisi ve çalışan bir bilgisayara erişim sağlayan bir araçtır. Eğitim boyunca, Cloud 9 sizin *yerel makinanız* olma görevini alacaktır. OS X, Ubuntu veya Windows'daki sınıf arkadaşlarınız gibi terminal arayüzünde komut çalıştırmaya devam edeceksiniz, ancak terminaliniz Cloud 9'un sizin yerinize kuracağı başka bir bilgisayara bağlanacaktır.

1. Cloud 9'u [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp) üzerinden yükleyin
2. [C9.io](https://c9.io) adresine gidin
3. Kaydolun
4. *Yeni çalışma alanı oluştur* ' u tıklayın
5. *django-girls* olarak isimlendirin
6. *Boş*'u seçin (en altta sağdan ikinci turuncu logolu olan)

Şimdi bir kenar çubuğu, bazı metinlerin olduğu büyük bir ana pencere ve en altta da buna benzer küçük penceresi olan bir arayüz görmelisiniz:

{% filename %}Cloud 9{% endfilename %}

    isminiz:~/calismaalani $
    

Bu alt alan * terminalinizdir </ 0>, Cloud 9'un sizin için hazırladığı talimatlarınızı yazacağınız yer. Biraz daha büyük yapmak için bu pencereyi yeniden boyutlandırabilirsiniz</p> 

### Sanal ortam (Virtual environment)

Bir sanal ortam(virtualenv diye de bilinir), üzerinde çalıştığımız proje için kullanışlı kodlarımızı yazabileceğimiz özel bir kutudur. Bunları çeşitli projelerimizi ayrı tutmak için kullanırız, böylece farklı projeler arasında işler karışmaz.

Cloud 9 arayüzünün altındaki terminalinizde şunu çalıştırın:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Eğer hala çalışmıyorsa eğitmeninizden yardım isteyin.

Sonra, çalıştır:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls 
    cd djangogirls 
    python3.6 -mvenv myvenv 
    source myvenv/bin/activate 
    pip install django~=1.11.0
    

(son satırda bir tılde ve eşitlik işareti kullandığımıza dikkat edin: ~=).

### Github

Bir [Github](https://github.com) hesabı açın.

### PythonAnywhere

Django Girls eğitimi, yeni web uygulamanızı güçlendiren ve onu herkesin görebileceği şekilde herkes tarafından erişilebilen bir bilgisayara (sunucu olarak adlandırılır) taşıyan bir kod olan Deployment (Dağıtım) adlı bir bölümü içerir.

Kılavuzu Chromebook üzerinden kullanırken bu bölüm biraz garip oluyor; zaten internet üzerindeki bir bilgisayar kullanılıyor (laptop dışında). Bununla birlikte, Cloud 9'u çalışma alanımız olarak veya "devam etmekte" olan işlerimizin bulunduğu bir yer olarak düşünebiliriz Python Anywhere de işlerimizi daha eksiksiz hale getirmek için gösterebileceğimiz bir yer olarak düşünebildiğimizden hala kullanışlıdır.

Bu nedenle, yeni bir Python Anywhere hesabı açmak için [www.pythonanywhere.com](https://www.pythonanywhere.com).