> Evdeki okuyucular için: bu bölüm [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) isimli videoda anlatılmıştır.
> 
> Bu bölüm Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tarafından hazırlanmış bir öğreticiye dayanmaktadır

Django, Python dilinde yazılmıştır. Django'da herhangi bir şey yapmak için Python'a ihtiyaç duyarız. Hadi Python'ın kurulumunu yaparak başlayalım! Sizden Python 3 en son sürümünü yüklemenizi istiyoruz. Yani, eğer daha önceki bir sürüme sahipseniz, güncellemeniz gerekecek. Zaten 3.4 veya daha yüksek bir sürümünüz varsa, her şey tamam.

Lütfen bilgisayarınızda Anaconda yüklü olsa bile normal Python'u aşağıdaki gibi kurun.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Öncelikle, bilgisayarınızın Sistem Bilgisi sayfasındaki "Sistem türü" satırından, Windows'un 32 bit mi yoksa 64 bit mi olduğunu kontrol edin. Bu sayfaya ulaşmak için aşağıdaki yöntemlerden birini deneyin:

* Windows tuşuna ve Pause/Break tuşuna aynı anda basın
* Windows menüsünden Denetim Masası'nı açın, ardından Sistem & Güvenlik, ardından Sistem seçeneğine gidin
* Windows düğmesine basın, ardından Ayarlar> Sistem> Hakkında'ya gidin

Windows için Python'ı https://www.python.org/downloads/windows/ adresinden indirebilirsiniz. "Latest Python 3 Release - Python x.x.x" bağlantısına tıklayın. Eğer bilgisayarınız **64-bit** versiyon Windows çalıştırıyorsa, **Windows x86-64 executable installer**'ı indirin. Değilse, **Windows x86 executable installer**'ı indirin. Yükleyiciyi indirdikten sonra, çalıştırmalısınız (üzerine çift tıklayarak) ve oradaki talimatları takip etmelisiniz.

Dikkat edilmesi gereken nokta: Yükleme esnasında "Setup" ("Kur") işaretli bir pencere farkedeceksiniz. "Add Python 3.6 to PATH" ("PATH'e Python 3.6 Ekle") veya "Ortam değişkenlerinize Python Ekle" ( "Add Python to your environment variables") onay kutusunu işaretleyin ve burada gösterildiği gibi "Şimdi Yükle" yi tıklayın (farklı bir sürüm kuruyorsanız biraz farklı olabilir):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Kurulum tamamlandığında, Python veya yüklediğiniz sürüm hakkında daha fazla bilgi edinmeniz için bir bağlantı içeren bir iletişim kutusu görebilirsiniz. Bu iletişim kutusunu kapatın ya da iptal edin - bu kılavuzda daha fazla şey öğreneceksiniz!

Not: Eğer Windows'un eski bir versiyonunu (7, Vista ya da herhangi bir eski versiyon) kullanıyorsanız ve Python 3.6.x yükleyicisi hata veriyorsa, aşağıdaki seçeneklerden birini deneyebilirsiniz:

1. bütün Windows Güncellemeleri'ni yükleyin ve Python'ı tekrar yüklemeyi deneyin; ya da
2. [eski bir Python versiyonu](https://www.python.org/downloads/windows/), örneğin [3.4.6](https://www.python.org/downloads/release/python-346/) yükleyin.

Eğer Python'ın eski bir versiyonunu yüklerseniz, yükleme ekranı yukarıda gösterilenden biraz farklı görünebilir. "python.exe'yi Path'e ekle" uyarısını görene dek aşağı kaydırdığınızdan emin olun, daha sonra soldaki butona tıklayın ve "Yerel sabit sürücüye yüklenecek"' seçeneğini seçin:

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Not** Python'ı OS X'te yüklemeden önce, Mac ayarlarınızın App Store'dan olmayan paketleri yüklemeye izin verdiğinden emin olmalısınız. Sistem Tercihleri'ne (Uygulamalar klasöründe) gidin, önce "Güvenlik & Gizlilik"'e ve daha sonra da "Genel" sekmesine tıklayın. Eğer sizin "Şuradan yüklenen uygulamalara izin ver:" ayarınız "Mac App Store"'a ayarlıysa, onu "Mac App Store and kimliği bilinen geliştirici."lere çevirin

Python kurulum dosyasını indirmek için resmi siteye gitmelisiniz: https://www.python.org/downloads/release/python-361/:

* *Mac OS X 64-bit/32-bit installer* dosyasını indirin,
* *python-3.6.1-macosx10.6.pkg*'a çift tıklayarak yükleyiciyi çalıştırın.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Muhtemelen sisteminizde Python zaten yüklüdür. Yüklü olup olmadığını (ya da hangi versiyon olduğunu) kontrol etmek için komut satırını açın ve aşağıdaki komutları girin:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Farklı bir Python sürümü yüklüyse, en azından 3.4.0 (örn. 3.6.0), yükseltme yapmanıza gerek yoktur. Python yüklü değilse ya da farklı bir versiyon edinmek istiyorsanız öncelikle aşağıdaki komutu kullanarak hangi Linux dağıtımını kullandığınızı kontrol edin:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

Daha sonra, sonuca bağlı olarak, bu bölümün altındaki aşağıdaki kurulum kılavuzlarından birini izleyin.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Terminale bu komutu girin:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Konsolunuzda bu komutu kullanın:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

Eğer eski bir Fedora sürümünüz varsa `dnf` komutu bulunamadı hatasını alabilirsiniz. Bu durumda `yum` komutunu kullanmanız gerekir.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Konsolunuzda bu komutu kullanın:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Komut istemini açıp `python3` komutunu çalıştırarak yüklemenin başarılı olup olmadığını doğrulayabilirsiniz:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Konsolda gösterilen sürüm 3.6.1'den farklı olabilir - kurduğunuz sürümle aynı olmalıdır.

**NOT:** Eğer Windows kullanıyorsanız ve `python3` bulunamadı hatasını alıyorsanız, `python` (`3` olmadan) komutunu deneyin ve 3.4.0 veya daha yüksek bir Python sürümü olup olmadığını kontrol edin. Eğer bu da işe yaramazsa, yeni bir komut istemi açıp tekrar deneyebilirsiniz; çünkü Python kurulumundan önce açılan bir komut istemi kullanıyorsanız bu durumla karşılaşabilirsiniz.

* * *

Eğer herhangi bir şüpheniz varsa veya kurulumda bir şeyler ters gittiyse ve sonrasında ne yapılacağını bilmiyorsanız, eğitmeninize sorabilirsiniz! Bazen işler yolunda gitmez ve daha fazla deneyime sahip birinden yardım istemek iyidir.