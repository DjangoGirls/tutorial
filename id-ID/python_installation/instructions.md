> Bagi para pembaca di rumah: bab ini terangkum dalam video [Installing Python & Code Editor](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> Bagian ini dibuat berdasarkan tutorial yang dibuat oleh Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django ditulis dengan Python. Kami membutuhkan Python untuk melakukan apapun di Django. Mari kita mulai dengan menginstalnya! Kami ingin Anda menginstal Python 3.6, jadi jika Anda memiliki versi sebelumnya, Anda perlu mengunggahnya.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

Pertama periksa apakah komputer Anda menjalankan versi 32-bit atau versi Windows 64-bit, dengan menekan tombol Windows + tombol Pause/Break yang akan membuka info Sistem Anda, dan melihat baris "Tipe sistem". Anda bisa mendownload Python untuk Windows dari situs https://www.python.org/downloads/windows/. Klik tautan "Latest Python 3 Release - Python x.x.x". Jika komputer Anda menjalan Windows versi **64-bit**, silahkan unduh **Windows x86-64 executable installer**. Jika tidak, unduh **Windows x86 executable installer**. Setelah mendownload installer, Anda harus menjalankannya (klik dua kali) dan ikuti instruksi di sana.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![Jangan lupa menambahkan Python dapa Path](../python_installation/images/python-installation-options.png)

Pada langkah selanjutnya, Anda akan menggunakan Windows Command Line (yang juga akan kami ceritakan). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. Untuk membuka Command Line, ketik "cmd" dan tekan enter di jendela "Run".

![Jenis "; cmd"; di "; Jalankan " jendela](../python_installation/images/windows-plus-r.png)

Catatan: Jika Anda menggunakan versi Windows yang lebih tua (7, Vista, atau versi yang lebih lama) dan installer Python 3.6.x gagal dengan kesalahan, Anda dapat mencoba:

1. instal semua Windows Updates dan coba install Python 3.6 lagi; atau
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

Jika Anda menginstal versi lama Python, layar penginstalan mungkin terlihat sedikit berbeda dari yang ditunjukkan di atas. Pastikan Anda menggulir ke bawah untuk melihat "Add python.exe to Path", lalu klik tombol di sebelah kiri dan pilih "Akan diinstal pada hard drive lokal":

![Tambahkan Python ke Path, versi lama](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Catatan** Sebelum menginstal Python di OS X, Anda harus memastikan pengaturan Mac Anda memungkinkan menginstal paket yang bukan dari App Store. Buka System Preferences (ada di folder Applications), klik "Security & Privacy," dan kemudian tab "General". Jika "Izinkan aplikasi Anda diunduh dari:" disetel ke "Mac App Store", ubahlah menjadi "Mac App Store dan pengembang yang teridentifikasi."

Kamu bisa berkunjung ke situs https://www.python.org/downloads/release/python-361/ dan unduh file install-an Python:

* Unduh file installer Mac OS X 64-bit/32-bit
* Klik dua kali *python-3.6.1-macosx10.6.pkg* untuk menjalankan installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

Sepertinya kamu telah menginstall Python sebelumnya. Untuk mengecek jika itu sudah terinstall serta mengetahui versi yang dipakai, Buka konsol dan ketik perintah dibawah ini:

{% filename %} baris perintah {% endfilename %}

    $ python3 --version
    Python 3.6.1
    

Jika Anda memiliki 'versi mikro' yang berbeda dari Python yang terpasang, mis. 3.6.0, maka Anda tidak perlu upgrade. Jika kamu tidak memiliki Python yang terinstall sebelumnya atau jika kamu menginginkan versi Python yang berbeda, Kamu bisa menginstall seperti dibawah ini:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Ketik perintah ini di konsol:

{% filename %} baris perintah {% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Gunakan perintah ini di konsol:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Gunakan perintah ini di konsol:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verifikasi instalasi berhasil dengan membuka command prompt dan menjalankan perintah `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --versi
    Python 3.6.1
    

**CATATAN:** Jika Anda menggunakan Windows dan Anda mendapatkan pesan kesalahan bahwa `python3` tidak ditemukan, coba gunakan `python` (tanpa `3`) dan periksa apakah masih mungkin versi Python 3.6.

* * *

Jika Anda ragu, atau jika ada yang tidak beres dan Anda tidak tahu apa yang harus dilakukan selanjutnya, tolong tanya pelatih Anda! Kadang sesuatu tidak berjalan dengan lancar dan ini lebih baik untuk meminta bantuan pada seseorang yang berpengalaman.