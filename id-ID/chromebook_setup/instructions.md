Anda bisa [melewatkan bagian ini](http://tutorial.djangogirls.org/en/installation/#install-python) jika Anda tidak menggunakan Chromebook. Jika ya, pengalaman instalasi Anda akan sedikit berbeda. Anda bisa mengabaikan sisa instruksi penginstalan.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE merupakan sebuah layanan berupa editor kode dan diakses lewat komputer yang berjalan di internet yang mana Anda bisa memasang, menulis, dan mengoperasikan perangkat lunak. Di dalam tutorial ini, Cloud IDE ini akan bertindak sebagai *mesin lokal* Anda. Anda tetap bisa mengoperasikan perintah di antarmuka terminal sama seperti mereka yang menggunakan OS X, Ubuntu, atau Windows, tapi terminal ini akan terkoneksi ke komputer yang berjalan di layanan cloud IDE yang Anda gunakan. Inilah instruksi untuk layanan cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Anda bisa pilih salah satu dari layanan cloud IDE, dan ikuti instruksi dari setiap layanan cloud IDE yang Anda gunakan.

#### PaizaCloud Cloud IDE

1. Buka situs [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Buatlah akun baru
3. Klik *New Server* dan pilih Django app
4. Klik tombol Terminal (yang terletak di samping kiri)

Lalu amati sidebar, terdapat tombol di sebelah kiri. Klik tombol "Terminal" untuk membuka terminal dengan prompt seperti ini:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal PaizaCloud Cloud IDE, bisa Anda atur ulang ukuran jendela terminalnya dan pula bisa diperbesar hingga memenuhi layar.

#### AWS Cloud9

Saat ini Cloud 9 mengharuskan Anda untuk mendaftar dengan AWS dan memasukkan informasi kartu kredit.

1. Pasang Cloud 9 dari Chrome web store</ 0></li> 
    
    - Pergi ke [c9.io](https://c9.io) dan klik *Get started with AWS Cloud9*
    - Daftar untuk akun AWS (dibutuhkan informasi kartu kredit, tetapi kamu dapat menggunakannya secara gratis)
    - Pada AWS Dashboard, masuk *Cloud9* pada kotak pencarian dan klik
    - Pada Cloud 9 dashboard, klik *Create environment*
    - Namakan *django-girls*
    - Saat di configuring settings, pilih *Create a new instance for environment (EC2)* untuk "Environment Type" dan *t2.micro* "Instance type" (Tulisan yang seharusnya muncul "Free-tier eligible."). Pengaturan default cost-saving selesai dan Anda dapat menetapkan yang lain secara default.
    - Klik *Next step*
    - Klik *Create environment*</ol> 
    
    Sekarang Anda harus melihat sebuah antarmuka dengan sidebar, jendela utama yang besar dengan beberapa teks, dan sebuah jendela kecil di bagian bawah yang terlihat seperti ini:
    
    {% filename %}bash{% endfilename %}
    
        yourusername:~/workspace $
        
    
    Area bagian bawah adalah terminal Anda. Anda bisa menggunakannya untuk mengirimkan perintah kepada komputer remote Cloud9. Anda bisa menyesuaikan ukuran jendela untuk membuatnya sedikit lebih besar.
    
    ### Lingkungan Virtual
    
    Lingkungan virtual (disebut juga virtualenv) seperti sebuah kotak khusus yang bisa kita gunakan untuk menulis kode ke dalam proyek yang sedang kita kerjakan. Kita menggunakannya untuk menyimpan berbagai kode yang kita inginkan untuk berbagai proyek secara terpisah, sehingga hal-hal lain yang tidak ada hubungannya dengan proyek tidak bercampur.
    
    Jalankan:
    
    {% filename %}Cloud 9{% endfilename %}
    
        mkdir djangogirls
        cd djangogirls
        python3 -m venv myvenv
        source myvenv/bin/activate
        pip install django~={{ book.django_version }}
        
    
    (perhatikan bahwa pada baris terakhir kita menggunakan tilde diikuti dengan tanda sama: `~ =`).
    
    ### GitHub
    
    Buat akun [GitHub](https://github.com).
    
    ### PythonAnywhere
    
    Tutorial Django Girls menyertakan bagian tentang apa yang disebut Deployment, yaitu proses mengambil kode yang memberi kekuatan pada aplikasi web baru Anda dan memindahkannya ke komputer yang dapat diakses publik (disebut server) sehingga orang lain dapat melihat pekerjaan Anda.
    
    Bagian ini sedikit aneh ketika melakukan tutorial pada perangkat Chromebook karena kita sudah menggunakan komputer yang ada di Internet (sebagai lawan, katakanlah, sebuah laptop). Namun, tidak apa, karena kita dapat menggunakan Cloud 9 sebagai tempat untuk melakukan pekerjaan kita dan Python Anywhere sebagai tempat untuk memajang hal-hal yang sudah kita kerjakan.
    
    Demikian, buatlah akun Python Anywhere di [www.pythonanywhere.com](https://www.pythonanywhere.com).