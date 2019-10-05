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

Eğer Python'ın eski bir versiyonunu yüklerseniz, yükleme ekranı yukarıda gösterilenden biraz farklı görünebilir. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Not** Python'ı OS X'te yüklemeden önce, Mac ayarlarınızın App Store'dan olmayan paketleri yüklemeye izin verdiğinden emin olmalısınız. Sistem Tercihleri'ne (Uygulamalar klasöründe) gidin, önce "Güvenlik & Gizlilik"'e ve daha sonra da "Genel" sekmesine tıklayın. Eğer sizin "Şuradan yüklenen uygulamalara izin ver:" ayarınız "Mac App Store"'a ayarlıysa, onu "Mac App Store and kimliği bilinen geliştirici."lere çevirin

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep ^NAME= /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.