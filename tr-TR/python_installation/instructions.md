> Evdeki okuyucular için: bu bölüm [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA) isimli videoda anlatılmıştır.
> 
> Bu bölüm Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) tarafından hazırlanmış bir öğreticiye dayanmaktadır

Django, Python dilinde yazılmıştır. Django'da herhangi bir şey yapmak için Python'a ihtiyaç duyarız. Hadi Python'ın kurulumunu yaparak başlayalım! Sizden Python 3 en son sürümünü yüklemenizi istiyoruz. Yani, eğer daha önceki bir sürüme sahipseniz, güncellemeniz gerekecek. If you already have version {{ book.py_min_version }} or higher you should be fine.

Lütfen bilgisayarınızda Anaconda yüklü olsa bile normal Python'u aşağıdaki gibi kurun.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Öncelikle, bilgisayarınızın Sistem Bilgisi sayfasındaki "Sistem türü" satırından, Windows'un 32 bit mi yoksa 64 bit mi olduğunu kontrol edin. Bu sayfaya ulaşmak için aşağıdaki yöntemlerden birini deneyin:

* Windows tuşuna ve Pause/Break tuşuna aynı anda basın
* Windows menüsünden Denetim Masası'nı açın, ardından Sistem & Güvenlik, ardından Sistem seçeneğine gidin
* Windows düğmesine basın, ardından Ayarlar> Sistem> Hakkında'ya gidin
* Search the Windows Start menu for "System Information". To do that, click the Start button or press the Windows key, then begin to type `System Information`. It will start making suggestions as soon as you type. You can select the entry once it shows up.

Windows için Python'ı https://www.python.org/downloads/windows/ adresinden indirebilirsiniz. "Latest Python 3 Release - Python x.x.x" bağlantısına tıklayın. Eğer bilgisayarınız **64-bit** versiyon Windows çalıştırıyorsa, **Windows x86-64 executable installer**'ı indirin. Değilse, **Windows x86 executable installer**'ı indirin. Yükleyiciyi indirdikten sonra, çalıştırmalısınız (üzerine çift tıklayarak) ve oradaki talimatları takip etmelisiniz.

Dikkat edilmesi gereken nokta: Yükleme esnasında "Setup" ("Kur") işaretli bir pencere farkedeceksiniz. Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

Kurulum tamamlandığında, Python veya yüklediğiniz sürüm hakkında daha fazla bilgi edinmeniz için bir bağlantı içeren bir iletişim kutusu görebilirsiniz. Bu iletişim kutusunu kapatın ya da iptal edin - bu kılavuzda daha fazla şey öğreneceksiniz!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* *Mac OS X 64-bit/32-bit installer* dosyasını indirin,
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep '^NAME=' /etc/os-release
    

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
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.