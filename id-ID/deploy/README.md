# Deploy (Publikasikan)

> **Catatan** Bab berikut mungkin terasa agak sulit untuk dipahami. Lanjutkan sampai selesai; proses deploy merupakan proses yang penting pada proses pengembangan website. Bab ini sengaja diletakkan di bagian tengah tutorial ini dengan harapan agar pendamping anda, kalau ada, dapat membantu anda menjadikan website anda online, dengan sedikit trik. Ini artinya, anda masih dapat menyelesaikan sendiri tutorial ini kalau-kalau anda tak lagi punya cukup waktu.

Sampai sekarang, situs Anda hanya tersedia di komputer Anda. Sekarang Anda akan belajar bagaimana cara menggunakannya! Proses deploy adalah proses mempublikasikan aplikasi anda di Internet agar orang lain dapat membuka dan melihat aplikasi anda. :)

Sebagaimana yang telah anda pelajari, sebuah website haruslah diletakkan pada server. Ada banyak penyedia server di internet, kita akan menggunakan [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere tidak berbayar untuk aplikasi kecil yang tidak memiliki terlalu banyak pengunjung sehingga pasti akan cukup untuk anda sekarang.

Layanan eksternal lain akan menggunakan [GitHub](https://www.github.com), yang merupakan sebuah layanan hosting kode program. Ada beberapa yang lain, akan tetapi hampir semua programmer saat ini memiliki akun di GitHub, anda berikutnya.

Ketiga tempat ini penting bagi Anda. Komputer lokal Anda akan menjadi tempat pengembangan dan pengujian Anda. Bila Anda senang dengan perubahan tersebut, Anda akan menempatkan salinan program Anda di GitHub. Situs Anda akan berada di PythonAnywhere dan Anda akan memperbaruinya dengan mendapatkan salinan kode Anda yang baru dari GitHub.

# Git

> ** Catatan </ 0> Jika Anda sudah melakukan langkah-langkah Instalasi, Anda tidak perlu melakukan ini lagi - Anda dapat melompat ke bagian berikutnya dan mulai membuat gudang Git Anda.</p> </blockquote> 
> 
> {% include "/deploy/install_git.md" %}
> 
> ## Memulai repositori Git kita
> 
> Git mencatat perubahan atas file-file yang disebut repositori kode (atau disingkat "repo" saja). Mari kita mulai untuk proyek kita. Buka konsole dan jalankan perintah ini dalam direktori`djangogirl`:
> 
> > ** Catatan </ 0> Periksa direktori kerja Anda saat ini dengan perintah ` pwd </ 1> (Mac OS X / Linux) atau <code> cd </ 1> (Windows) sebelum menginisialisasi repositori. Anda harus berada di dalam folder <code>djangogirl`.</p> </blockquote> 
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     $ git init
> >     Initialized empty Git repository in ~/djangogirls/.git/
> >     $ git config --global user.name "Nama Anda"
> >     $ git config --global user.email anda@contoh.com
> >      
> >     
> > 
> > Menginisialisasi repositori git adalah sesuatu yang perlu kita lakukan hanya sekali per proyek (dan Anda tidak perlu memasukkan kembali nama pengguna dan email itu lagi).
> > 
> > Git akan mencatat perubahan atas semua file dan folder yang ada dalam direktori ini, tetapi ada beberapa file yang ingin kita abaikan. Kita melakukan ini dengan cara membuat sebuah file yang diberi nama `.fitignore`, dalam direktori utama. Jalankan program editor anda kemudian buat sebuah file baru dengan isi :
> > 
> > {% filename%} .gitignore {% endfilename%}
> > 
> >     * .pyc * ~
> >      __pycache__ 
> >     myvenv db.sqlite3 / static .DS_Store
> >     
> > 
> > Dan simpan sebagai ` .gitignore </ 0> di folder "djangogirls".</p>

<blockquote>
  <p><strong>Catatan</strong> Titik di depan nama file sangat penting!  Jika Anda mengalami kesulitan untuk membuatnya (Mac tidak suka Anda membuat file yang dimulai dengan titik melalui Finder, misalnya), kemudian gunakan fitur "Save As" di editor Anda; itu antipeluru</p>
  
  <p><strong> Catatan </ 0> Salah satu file yang ditentukan dalam Anda <code> Gitignore </ 1> file <code> db.sqlite3 </ 1> . File itu adalah database lokal Anda, di mana semua posting Anda disimpan. Kami tidak ingin menambahkan ini ke repositori Anda karena situs Anda di PythonAnywhere akan menggunakan database yang berbeda.  Database itu bisa berupa SQLite, seperti mesin pengembangan Anda, tapi biasanya Anda akan menggunakan satu yang disebut MySQL yang bisa menangani lebih banyak pengunjung situs daripada SQLite. Either way, dengan mengabaikan database SQLite Anda untuk salinan GitHub, itu berarti semua posting yang Anda buat sejauh ini akan tetap ada dan hanya tersedia secara lokal, namun Anda harus menambahkannya lagi pada produksi. Anda harus memikirkan database lokal Anda sebagai taman bermain yang bagus di mana Anda dapat menguji berbagai hal dan tidak takut bahwa Anda akan menghapus posting sebenarnya dari blog Anda.</p>
</blockquote>

<p>Sebaiknya cek status dulu dengan perintah <code>git status` sebelum melakukan `git add` atau kapanpun anda ingin memastikan apa yang telah berubah. Ini akan membantu mencegah kejutan terjadi, seperti file yang salah ditambahkan atau dilakukan. Perintah ` git status </ 0> mengembalikan informasi tentang file yang tidak dilacak / dimodifikasi / dipentaskan, status cabang, dan banyak lagi. Keluarannya harus serupa dengan berikut ini:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code>$ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        blog/
        manage.py
        mysite/

nothing added to commit but untracked files present (use "git add" to track)
`</pre> 
> > 
> > Dan akhirnya kita simpan perubahan kita. Buka konsole dan jalankan perintah-perintah berikut:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ git add --all
> >     $ git commit -m "Aplikasi Django Girls saya, komit pertama"
> >      [...] 13 file diubah, 200 sisipan (+)
> >      buat mode 100644 .gitignore
> >      [...] buat mode 100644 mysite / wsgi.py
> >      `` `# # Mendorong kode Anda ke GitHub Masuk ke [GitHub.com] (https://www.github.com) dan masuk ke akun pengguna baru yang gratis. 
> >        
> >        (Jika Anda sudah melakukannya dalam persiapan lokakarya, itu bagus!) Kemudian, buat repositori baru, beri nama "my-first-blog". Biarkan kotak centang "inisialisasi dengan README" tidak dicentang, tinggalkan opsi .gitignore kosong (kami telah melakukannya secara manual) dan tinggalkan Lisensi sebagai Tidak Ada.
> >     
> >     <0 /> 
> >     
> >     & gt; ** Catatan ** Nama `my-first-blog` itu penting - Anda bisa memilih yang lain, tapi akan banyak terjadi dalam petunjuk di bawah ini, dan Anda harus menggantinya setiap saat. Mungkin lebih mudah untuk tetap dengan nama `my-first-blog`.
> >     
> >     Pada layar berikutnya, Anda akan ditampilkan URL kloning repo Anda. Pilih versi "HTTPS", salin, dan kami akan segera menempelkannya ke terminal:
> >     
> >      <0 /> 
> >     
> >     Sekarang kita perlu menghubungkan repositori Git di komputer Anda ke yang ada di GitHub.
> >     
> >     Ketik berikut ini ke konsol Anda (Ganti ` &lt;your-github-username&gt; ` dengan nama pengguna yang Anda masukkan saat membuat akun GitHub, namun tanpa tanda kurung siku):
> >     
> >      {% filename%} command-line {% endfilename%}
> >     
> > 
> > $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master
> > 
> >     <br />Masukkan username dan password GitHub Anda dan Anda akan melihat sesuatu seperti ini:
> >     
> >      {% filename%} command-line {% endfilename%}
> >     
> > 
> > Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git
> > 
> > - [cabang baru] master -> master master cabang diatur untuk melacak master cabang jarak jauh dari asal.
> > 
> >     <br />& lt; - TODO: mungkin tombol ssh dipasang di pesta pemasangan, dan titik ppl yang tidak memilikinya ke ekstensi - & gt; 
> >     
> >     Kode Anda sekarang ada di GitHub. Silahkan anda cek!  Anda akan menemukannya di perusahaan yang bagus - [Django] (https://github.com/django/django), [Django Girls Tutorial] (https://github.com/DjangoGirls/tutorial), dan banyak lainnya hebat Proyek perangkat lunak sumber terbuka juga meng-host kode mereka di GitHub. :)
> >     
> >     
> >     # Menyiapkan blog kita di PythonAnywhere
> >     
> >     ## Mendaftar akun PythonAnywhere
> >     
> >     &gt; **Catatan**Anda mungkin sudah membuat akun PythonAnywhere sebelumnya saat instalasi langkah - jika demikian, tidak perlu melakukannya lagi.
> >     
> >     {% include "/deploy/signup_pythonanywhere.md" %}
> >     
> >     
> >     ## Konfigurasi situs kami di PythonAnywhere
> >     
> >     Kembali ke utama [Dasbor PythonAnywhere]
> >     (https://www.pythonanywhere.com/) dengan mengklik logo, dan pilih opsi untuk memulai konsol "Bash" - itu adalah versi PythonAnywhere dari sebuah baris perintah, seperti yang ada di komputer anda.
> >     
> >     &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
> >     
> >     &gt; **Catatan** PythonAnywhere berbasis Linux, jadi jika anda menggunakan Windows, konsol akan terlihat sedikit berbeda dari yang ada di komputer anda.
> >     
> >     Menerapkan aplikasi web pada PythonAnywhere melibatkan merobohkan kode anda dari GitHub, dan kemudian mengkonfigurasi PythonAnywhere untuk mengenalinya dan mulai melayani sebagai aplikasi web.  Ada cara manual untuk melakukannya, tapi PythonAnywhere menyediakan alat pembantu yang akan melakukan semuanya untuk anda. Let's install it first:
> >     
> >     {% filename %}PythonAnywhere command-line{% endfilename %}
> >     
> > 
> > $ pip3.6 install --user pythonanywhere
> > 
> >     <br />Itu harus dicetak beberapa hal seperti `Mengumpulkan pythonanywhere`, dan akhirnya diakhiri dengan sebuah garis yang mengatakan` Berhasil menginstal (...) pythonanywhere- (...) `.
> >     
> >     Sekarang kita jalankan penolong untuk mengkonfigurasi aplikasi anda secara otomatis dari GitHub. Ketik berikut ke konsol di PythonAnywhere (jangan lupa gunakan nama pengguna GitHub Anda di tempat `&lt;your-github-username&gt;`):
> >     
> >     {% filename %}PythonAnywhere baris perintah{% endfilename %}
> >     
> > 
> > $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
> > 
> >     <br />Saat anda menyaksikannya berjalan, anda akan bisa melihat apa yang dilakukannya:
> >     
> >     - Mengunduh kode anda dari GitHub
> >     - Membuat virtualenv pada PythonAnywhere, seperti yang ada di PC anda sendiri
> >     - Memperbarui berkas pengaturan anda dengan beberapa pengaturan penyebaran
> >     - Menyiapkan database pada PythonAnywhere menggunakan perintah `migrate` manage.py
> >     - Menyiapkan file statis anda (kita akan belajar tentang ini nanti)
> >     - Dan mengonfigurasi PythonAnywhere untuk menayangkan aplikasi web anda melalui API-nya
> >     
> >     Pada PythonAnywhere semua langkah-langkah yang otomatis, tapi mereka langkah-langkah yang sama anda akan harus melalui dengan penyedia server lain.  Hal utama yang perlu diperhatikan sekarang adalah database anda di PythonAnywhere benar-benar terpisah dari database anda di PC anda sendiri-itu berarti dapat memiliki pos dan akun admin yang berbeda.
> >     
> >     Akibatnya, seperti yang kita lakukan pada komputer anda sendiri, kita perlu menginisialisasi akun admin dengan `createsuperuser`. PythonAnywhere telah aktifkan virtualenv anda secara otomatis untuk anda, jadi yang perlu anda lakukan hanyalah menjalankan:
> >     
> >     {% filename %}PythonAnywhere baris perintahe{% endfilename %}
> >     
> > 
> > (ola.pythonanywhere.com) $ python manage.py createsuperuser
> > 
> >     <br />Ketik rincian untuk pengguna admin anda.  Sebaiknya gunakan yang sama seperti yang anda gunakan di komputer anda sendiri untuk menghindari kebingungan, kecuali jika anda ingin memasukkan kata sandi di PythonAnywhere lebih aman.
> >     
> >     Sekarang, jika anda suka, anda juga dapat melihat kode anda di PythonAnywhere menggunakan `ls`:
> >     
> >     {% filename %}PythonAnywhere baris perintah{% endfilename %}
> >     
> > 
> > (ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```
> > 
> > Anda juga bisa masuk ke tab "Berkas" dan navigasikan menggunakan browser berkas PythonAnywhere built-in.
> > 
> > ## Anda sekarang hidup!
> > 
> > Situs anda sekarang harus tinggal di Internet publik! Klik melalui tab "Web" PythonAnywhere untuk mendapatkan tautan ke sana. Anda bisa berbagi ini dengan siapapun yang anda inginkan :)
> > 
> > ## Debugging tips
> > 
> > Jika anda melihat kesalahan saat menjalankan skrip `pa_autoconfigure_django.py`, berikut adalah beberapa penyebab umum:
> > 
> > - Lupa membuat token API PythonAnywhere anda.
> > - Membuat kesalahan dalam URL GitHub anda
> > - Jika anda melihat kesalahan yang mengatakan *"Tidak dapat menemukan settings.py anda"*, mungkin karena anda tidak berhasil menambahkan semua berkas anda ke Git, dan / atau anda tidak mendorongnya ke GitHub berhasil. Lihat lagi bagian Git di atas
> > 
> > Jika anda melihat kesalahan saat mencoba mengunjungi situs anda, tempat pertama untuk mencari beberapa info debug ada di log kesalahan **anda**. Anda akan menemukan link ke ini pada PythonAnywhere [Tab Web](https://www.pythonanywhere.com/web_app_setup/). Lihat apakah ada pesan kesalahan di sana; yang paling baru ada di bagian bawah.
> > 
> > There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> > 
> > Dan ingat, pelatih anda ada di sini untuk membantu!
> > 
> > # Periksa situs anda!
> > 
> > Halaman bawaan untuk situs anda harus mengatakan "Ini berhasil!", Seperti halnya pada komputer lokal anda. Coba tambah `/admin/` ke akhir URL, dan anda akan dibawa ke situs admin. Masuk dengan nama pengguna dan kata sandi, dan anda akan melihat anda dapat menambahkan Pos baru di server.
> > 
> > Begitu anda memiliki beberapa tulisan yang dibuat, anda dapat kembali ke penyiapan lokal anda (bukan PythonAnywhere). Dari sini anda harus mengerjakan setup lokal anda untuk melakukan perubahan. Ini adalah alur kerja umum dalam pengembangan web - membuat perubahan secara lokal, mendorong perubahan tersebut ke GitHub, dan menarik perubahan anda ke server Web langsung anda. Ini memungkinkan anda bekerja dan bereksperimen tanpa merusak situs web anda. Cukup keren, ya?
> > 
> > Beri tepuk tangan *HUGE* di belakang! Penyebaran server adalah salah satu bagian tersulit dalam pengembangan web dan sering kali memakan waktu beberapa hari sebelum mereka membuatnya bekerja. Tapi anda punya situs anda hidup, di Internet yang sebenarnya, begitu saja!