> Evdeki okuyucular için: bu bölüm [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) isimli videoda kapsanmıştır.
> 
> Bu bölüm Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tarafından hazırlanmış bir öğreticiye dayanmaktadır

Django, Python dilinde yazılmıştır. Django'da herhangi bir şey yapmak için Python'a ihtiyaç duyarız. Python'ın kurulumunu yaparak başlayalım! Sizden Python 3.6'nın kurulumunu yapmanızı istiyoruz. Yani, eğer daha önceki bir versiyonuna sahipseniz, güncellemeniz gerekecek.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Öncelikle Windows + Pause/Break tuş kombinasyonlarına basarak bilgisayarınızın Windows'un 32-bit versyionunu mu 64-bit versiyonu mu çalıştırdığını kontrol edin. Bu size Sistem bilgisini açacak. Açılan bu pencerede "Sistem tipi" satırına bakın. Windows için Python'ı şu web sitesinden indirebilirsinizhttps://www.python.org/downloads/windows/. "Son Python 3 Sürümü - Python x.x.x" bağlantısına tıklayın. Eğer bilgisayarınız **64-bit** versiyon Windows çalıştırıyorsa, **Windows x86-64 çalıştırılabilir yükleyici**'yi indirin. Değilse, **Windows x86 çalıştırılabilir yükleyici**'yi indirin. Yükleyiciyi indirdikten sonra, çalıştırmalısınız (üzerine çift tıklayarak) ve oradaki talimatları takip etmelisiniz.

Dikkat edilmesi gereken bir şey: Yükleme esnasında "Setup" ("Kur") işaretli bir pencere farkedeceksiniz. "Add Python 3.6 to PATH" ("PATH'e Python 3.6'yı ekle) kutucuğunun işaretli olduğundan emin olun ve aşağıda gösterildiği gibi "Install Now" ("Şimdi Yükle") 'a tıklayın:

![Python'u arama yoluna eklemeyi unutmayın](../python_installation/images/python-installation-options.png)

Önümüzdeki adımlarda, Windows Komut Satırını kullanıyor olacaksınız (ki ayrıca bahsedeceğiz). Şimdilik, eğer kimi komutlar yazmanız gerekirse, Başlat menüsü → Windows Sistemi → Komut Satırı'na gidin. Ayrıca "Çalıştır" penceresi ekrana gelene kadar Windows tuşuna basılı tutarken "R"-tuşuna basabilirsiniz. Komut Satırı'nı açmak için, "cmd" yazın ve "Çalıştır" penceresinde enter'a basın. (Windows'un yeni versiyonlarında, bazen saklı olduğundan "Komut Satırı"nı aratmak zorunda kalabilirsiniz.)

!["Çalıştır" penceresine "cmd" yazın](../python_installation/images/windows-plus-r.png)

Not: eğer Windows'un eski bir versiyonunu (7, Vista ya da herhangi bir eski versiyon) kullanıyorsanız ve Python 3.6.x yükleyicisi hata veriyorsa, aşağıdakilerden birini deneyebilirsiniz:

1. bütün Windows Güncellemeleri'ni yükleyin ve Python 3.6'yı tekrar yüklemeyi deneyin; ya da
2. [eski bir Python versiyonu](https://www.python.org/downloads/windows/), örneğin [3.4.6](https://www.python.org/downloads/release/python-346/) yükleyin.

Eğer Python'ın eski bir versiyonunu yüklerseniz, yükleme ekranı yukarıda gösterilenden biraz farklı görünebilir. "python.exe'yi Path'e ekle" görene dek aşağı kaydırdığınızdan emin olun, daha sonra soldaki butona tıklayın ve "Yerel sabit sürücüye yüklenecek"'i seçin:

![Eski Python sürümlerini Path'e ekleyin](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Not** Python'ı OS X'te yüklemeden önce, Mac ayarlarınızın App Store'dan olmayan paketleri yüklemeye izin verdiğinden emin olmalısınız. Sistem Tercihleri'ne (Uygulamalar klasöründe) gidin, önce "Güvenlik & Gizlilik"'e ve daha sonra da "Genel" sekmesine tıklayın. Eğer sizin "Şuradan yüklenen uygulamalara izin ver:" ayarınız "Mac App Store"'a ayarlıysa, onu "Mac App Store and kimliği bilinen geliştirici."lere çevirin

Python kurulum dosyasını indirmek için resmi siteye gitmelisiniz: https://www.python.org/downloads/release/python-361/

* *Mac OS X 64-bit/32-bit yükleyici* dosyasını indirin,
* *python-3.6.1-macosx10.6.pkg* 'a çift tıklayarak yükleyiciyi çalıştırın.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Muhtemelen sisteminizde Python zaten yüklüdür. Yüklü olup olmadığını (ya da hangi versiyon olduğunu) kontrol etmek için komut satırını açın ve aşağıdaki komutları girin: 

{% filename %}komut satırı{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Eğer farklı bir 'mikro sürüm' Python yüklüyse, örn: 3.6.0, o zaman yükseltme yapmak zorunda değilsiniz. Python yüklü değilse ya da farklı bir versiyon edinmek istiyorsanız aşağıdaki adımları takip edin:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Terminale bu komutu girin:

{% filename %}komut satırı{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Terminalde kullanmanız gereken komut:

{% filename %}komut satırı{% endfilename %}

    $ sudo dnf install python3
    

Eğer eski bir Fedora sürümünüz varsa `dnf` komutu bulunamadı hatasını alabilirsiniz. Bu durumda, yum kullanmanız gerekir.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Terminalde kullanmanız gereken komut:

{% filename %}komut satırı{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Komut istemini açıp `python3` komutunu çalıştırarak yüklemenin başarılı olup olmadığını doğrulayabilirsiniz:

{% filename %}komut satırı{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**Not:** Eğer Windows kullanıyorsanız ve `python3` bulunamadı hatasını alıyorsanız, `python` (`3` olmadan) komutunu deneyin ve Python 3.6 sürümlerinin olup olmadığını kontrol edin.

* * *

Eğer herhangi bir şüpheniz varsa veya kurulumda bir şeyler ters gittiyse ve sonrasında ne yapılacağını bilmiyorsanız, eğitmeninize sorabilirsiniz! Bazen işler düzgün gitmiyor, bu durumda daha fazla deneyime sahip birinden yardım istemelisiniz.