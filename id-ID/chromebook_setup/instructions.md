Anda bisa [lewati bagian ini](http://tutorial.djangogirls.org/en/installation/#install-python) jika Anda tidak menggunakan perangkat Chromebook. Jika ya, pengalaman instalasi Anda akan sedikit berbeda. Anda bisa mengabaikan sisa instruksi penginstalan.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE merupakan sebuah layanan berupa editor kode dan diakses lewat komputer yang berjalan di internet yang mana Anda bisa memasang, menulis, dan mengoperasikan perangkat lunak. Di dalam tutorial ini, Cloud IDE ini akan bertindak sebagai *mesin lokal* Anda. Anda tetap bisa mengoperasikan perintah di antarmuka terminal sama seperti mereka yang menggunakan OS X, Ubuntu, atau Windows, tapi terminal ini akan terkoneksi ke komputer yang berjalan di layanan cloud IDE yang Anda gunakan. Inilah instruksi untuk layanan cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Anda bisa pilih salah satu dari layanan cloud IDE, dan ikuti instruksi dari setiap layanan cloud IDE yang Anda gunakan.

#### PaizaCloud Cloud IDE

1. Buka situs [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Buatlah akun baru
3. Klik *New Server*
4. Klik tombol Terminal (yang terletak di samping kiri)

Lalu amati sidebar, terdapat tombol di sebelah kiri. Klik tombol "Terminal" untuk membuka terminal dengan prompt seperti ini:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal PaizaCloud Cloud IDE, bisa Anda atur ulang ukuran jendela terminalnya dan pula bisa diperbesar hingga memenuhi layar.

#### AWS Cloud9

1. Buka situs [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Buatlah akun baru
3. Klik *Create Environment*

Lihat antarmuka *sidebar*, ada jendela utama yang besar dengan sejumlah teks, dan jendela kecil di bawah yang telihat seperti ini:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Di area bawah ini adalah *terminal* Cloud 9 yang Anda gunakan. Ukuran jendela terminal ini bisa Anda atur ulang untuk memperbesarnya. 

### Lingkungan Virtual

Lingkungan virtual (disebut juga virtualenv) seperti sebuah kotak khusus yang bisa kita gunakan untuk menulis kode ke dalam proyek yang sedang kita kerjakan. Kita menggunakannya untuk menyimpan berbagai kode yang kita inginkan untuk berbagai proyek, sehingga hal-hal lain yang tidak ada hubungannya dengan proyek tidak bercampur.

Jalankan perintah di bawah ini di terminal Cloud 9:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Bila tetap tidak bekerja, tanyakan pada instruktur.

Kemudian, jalankan:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(perhatikan di baris terakhir kita menggunakan karakter tilde diikuti karakter sama dengan: ~=).

### GitHub

Buatlah akun di [Github](https://github.com).

### PythonAnywhere

Tutorial Django Girls berisi materi Deployment, yang merupakan prosedur pemindahan kode dari aplikasi web Anda ke komputer yang bisa diakses oleh publik (sebut saja server), jadi orang lain bisa melihat aplikasi web yang telah Anda buat.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).