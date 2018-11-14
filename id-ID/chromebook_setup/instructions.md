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

Lingkungan virtual (disebut juga virtualenv) seperti sebuah kotak khusus yang bisa kita gunakan untuk menulis kode ke dalam proyek yang sedang kita kerjakan. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename%} Cloud 9 {% endfilename%}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).