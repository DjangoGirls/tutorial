> Bagi para pembaca di rumah: bab ini terangkum dalam video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Bagian ini dibuat berdasarkan tutorial yang dibuat oleh Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django ditulis dengan Python. Kami membutuhkan Python untuk melakukan apapun di Django. Mari kita mulai dengan menginstalnya! Kami ingin Anda menginstal Python 3.6, jadi jika Anda memiliki versi sebelumnya, Anda perlu mengunggahnya.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Pertama periksa apakah komputer Anda menjalankan versi 32-bit atau versi Windows 64-bit, dengan menekan tombol Windows + tombol Pause/Break yang akan membuka info Sistem Anda, dan melihat baris "Tipe sistem". Anda bisa mendownload Python untuk Windows dari situs https://www.python.org/downloads/windows/. Klik tautan "Latest Python 3 Release - Python x.x.x". Jika komputer Anda menjalan Windows versi **64-bit**, silahkan unduh **Windows x86-64 executable installer**. Jika tidak, unduh **Windows x86 executable installer**. Setelah mendownload installer, Anda harus menjalankannya (klik dua kali) dan ikuti instruksi di sana.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Jangan lupa menambahkan Python dapa Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. instal semua Windows Updates dan coba install Python 3.6 lagi; atau
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Catatan** Sebelum menginstal Python di OS X, Anda harus memastikan pengaturan Mac Anda memungkinkan menginstal paket yang bukan dari App Store. Buka System Preferences (ada di folder Applications), klik "Security & Privacy," dan kemudian tab "General". Jika "Izinkan aplikasi Anda diunduh dari:" disetel ke "Mac App Store", ubahlah menjadi "Mac App Store dan pengembang yang teridentifikasi."

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Unduh file installer Mac OS X 64-bit/32-bit
* Klik dua kali *python-3.6.1-macosx10.6.pkg* untuk menjalankan installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

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

    $ python3 --versi
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.