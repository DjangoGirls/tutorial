> Bagi para pembaca di rumah: bab ini terangkum dalam video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Bagian ini dibuat berdasarkan tutorial yang dibuat oleh Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django ditulis menggunakan Python. Kita butuh Python untuk melakukan berbagai hal di Django. Yuk kita mulai menginstallnya! Kita menginginkan kamu menginstall Python 3, Jika kamu sudah memiliki versi sebelum itu, Kamu butuh upgrade versi yang akan kita install kali ini. Jika kamu sudah memiliki versi 3.4 atau diatasnya, Kamu akan baik-baik saja.

Please install normal Python as follows, even when you have Anaconda installed on your computer.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

First check whether your computer is running a 32-bit version or a 64-bit version of Windows, on the "System type" line of the System Info page. To reach this page, try one of these methods:

* Press the Windows key and Pause/Break key at the same time
* Open your Control Panel from the Windows menu, then navigate to System & Security, then System
* Press the Windows button, then navigate to Settings > System > About

You can download Python for Windows from the website https://www.python.org/downloads/windows/. Click on the "Latest Python 3 Release - Python x.x.x" link. If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. After downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Jangan lupa menambahkan Python dapa Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Tambahkan Python ke Path, versi lama](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Catatan** Sebelum menginstal Python di OS X, Anda harus memastikan pengaturan Mac Anda memungkinkan menginstal paket yang bukan dari App Store. Buka System Preferences (ada di folder Applications), klik "Security & Privacy," dan kemudian tab "General". Jika "Izinkan aplikasi Anda diunduh dari:" disetel ke "Mac App Store", ubahlah menjadi "Mac App Store dan pengembang yang teridentifikasi."

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
    

Jika Anda menggunakan versi Fedora yang lebih tua, Anda mungkin mendapatkan pesan error bahwa perintah `dnf` tidak ditemukan. Dalam hal ini Anda perlu menggunakan `yum`sebagai gantinya.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Gunakan perintah ini di konsol Anda:

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

Jika Anda ragu, atau jika ada yang tidak beres dan Anda tidak tahu apa yang harus dilakukan selanjutnya, tolong tanya pelatih Anda! Kadang sesuatu tidak berjalan dengan lancar dan lebih baik untuk meminta bantuan pada seseorang yang berpengalaman.