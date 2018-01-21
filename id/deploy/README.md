# Deploy (Publikasikan)

> **Catatan** Bab berikut mungkin terasa agak sulit untuk dipahami. Lanjutkan sampai selesai; proses deploy merupakan proses yang penting pada proses pengembangan website. Bab ini sengaja diletakkan di bagian tengah tutorial ini dengan harapan agar pendamping anda, kalau ada, dapat membantu anda menjadikan website anda online, dengan sedikit trik. Ini artinya, anda masih dapat menyelesaikan sendiri tutorial ini kalau-kalau anda tak lagi punya cukup waktu.

Sampai sekarang, situs Anda hanya tersedia di komputer Anda. Sekarang Anda akan belajar bagaimana cara menggunakannya! Proses deploy adalah proses mempublikasikan aplikasi anda di Internet agar orang lain dapat membuka dan melihat aplikasi anda. :)

Sebagaimana yang telah anda pelajari, sebuah website haruslah diletakkan pada server. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

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
> > Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), digunakan kembali 0 (delta 0) Untuk https://github.com/hjwp/my-first-blog.git
> > 
> > - [cabang baru] master -> master master cabang diatur untuk melacak master cabang jarak jauh dari asal.
> > 
> >     <br />& lt; - TODO: mungkin tombol ssh dipasang di pesta pemasangan, dan titik ppl yang tidak memilikinya ke ekstensi - & gt; 
> >     
> >     Kode Anda sekarang ada di GitHub. Silahkan anda cek!  Anda akan menemukannya di perusahaan yang bagus - [Django] (https://github.com/django/django), [Django Girls Tutorial] (https://github.com/DjangoGirls/tutorial), dan banyak lainnya hebat Proyek perangkat lunak sumber terbuka juga meng-host kode mereka di GitHub. :) # Menyiapkan blog kita di PythonAnywhere 
> >     
> >     & gt; ** Catatan ** Anda mungkin telah membuat akun PythonAnywhere sebelumnya selama langkah-langkah pemasangan - jika ya, tidak perlu melakukannya lagi.
> >     
> >     {% include "/ deploy / signup_ pythonanywhere .md"%} ## Menarik kode kita di PythonAnywhere 
> >     
> >     Bila Anda telah mendaftar ke PythonAnywhere , Anda akan dibawa ke halaman dasbor atau "Consoles". Pilih opsi untuk memulai konsol "Bash" - itu adalah versi konsol PythonAnywhere , seperti yang ada di komputer Anda.
> >     
> >     <0 /> 
> >     
> >     & gt; ** Catatan ** PythonAnywhere berbasis Linux, jadi jika Anda menggunakan Windows, konsol akan terlihat sedikit berbeda dari yang ada di komputer Anda.
> >     
> >     Mari kita tarik kembali kode kita dari GitHub dan memasukkan ke PythonAnywhere dengan cara membuat "clone" dari repo kita. Ketik berikut ke konsol di PythonAnywhere (jangan lupa gunakan nama pengguna GitHub Anda sebagai ganti ` &lt;your-github-username&gt; `):
> >     
> >      {% filename%} PythonAnywhere  command-line {% endfilename%}
> >     
> > 
> > $ git klon https://github.com/<your-github-username>/my-first-blog.git
> > 
> >     <br />Ini akan menarik salinan kode Anda ke PythonAnywhere . Check it out dengan mengetikkan `tree my-first-blog`:
> >     
> >      {% filename%} PythonAnywhere  command-line {% endfilename%}
> >     
> > 
> > $ tree my-first-blog my-first-blog / ├── blog │ ├── ** init </ 0> .py │ ├── admin.py │ ├── migrasi │ │ ├── 0001_initial. py │ │ └── ** init </ 0> .py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── ** init </ 0> .py ├── settings.py ├── urls.py └── wsgi.py</p> 
> > 
> >     <br /><br />### Membuat virtualenv di PythonAnywhere 
> >     
> >     Sama seperti yang Anda lakukan di komputer Anda sendiri, Anda dapat membuat virtualenv di PythonAnywhere . Di konsol Bash, ketik:
> >     
> >      {% filename%} PythonAnywhere  command-line {% endfilename%}
> >     
> > 
> > $ cd my-first-blog
> > 
> > $ virtualenv --python = python3.6 myvenv Menjalankan virtualenv dengan interpreter /usr/bin/python3.6 [...] Memasang setuptools, pip ... done.
> > 
> > $ source myvenv / bin / aktifkan
> > 
> > (myvenv) $ pip install django ~ = 1.11.0 Mengumpulkan Django [...] Berhasil menginstal Django-1.11.3
> > 
> >     <br /><br />& gt; ** Catatan ** Langkah `pip install` bisa memakan waktu beberapa menit.  Sabar, sabar!  Tapi kalau dibutuhkan lebih dari lima menit, ada yang salah.  Tanya pelatihmu
> >     
> >     & lt; ! - TODO: pikirkan tentang penggunaan requirements.txt daripada pemasangan pip .-- & gt; 
> >     
> >     ### Membuat database di PythonAnywhere 
> >     
> >     Inilah hal lain yang berbeda antara komputer dan server Anda sendiri: menggunakan database yang berbeda. Jadi akun dan pos pengguna bisa berbeda di server dan di komputer Anda.
> >     
> >     Sama seperti yang kita lakukan di komputer Anda sendiri, kami mengulang langkah untuk menginisialisasi database di server, dengan `migrate` dan` createuperuser`:
> >     
> >      {% filename%} PythonAnywhere  command-line {% endfilename%}
> >     
> > 
> > (mvenv) $ python manage.py bermigrasi Operasi untuk melakukan: [...] Menerapkan sesi.0001_initial ... OK (mvenv) $ python manage.py createuperuser
> > 
> >     <br />## Mempublikasikan blog kita sebagai aplikasi web Sekarang kode kita ada di PythonAnywhere , virtualenv kita sudah siap, dan database diinisialisasi. Kami siap mempublikasikannya sebagai aplikasi web!
> >     
> >     Klik kembali ke dasbor PythonAnywhere dengan mengklik logo nya, dan kemudian klik pada ** Web ** tab. Akhirnya, tekan ** Tambahkan aplikasi web baru **.
> >     
> >     Setelah mengkonfirmasikan nama domain Anda, pilih ** konfigurasi manual ** (NB - * bukan * opsi "Django") di dialog. Selanjutnya pilih ** Python 3.6 **, dan klik Next untuk menyelesaikan wizard.
> >     
> >     & gt; ** Catatan ** Pastikan Anda memilih opsi "Manual configuration", bukan "Django". Kami terlalu keren untuk setup Django default PythonAnywhere . ;-) ### Menetapkan virtualenv Anda akan dibawa ke layar config PythonAnywhere untuk webapp Anda, di situlah Anda harus pergi kapan pun Anda ingin melakukan perubahan pada aplikasi di server.
> >     
> >     </ / 
> >     
> >     Di bagian "Virtualenv", klik teks merah yang bertuliskan "Enter the path to an virtualenv", dan masukkan `/ home / &lt;your-PythonAnywhere-username&gt; / my-first-blog / myvenv /`. Klik kotak biru dengan tanda centang untuk menyimpan jalan sebelum pindah.
> >     
> >     & gt; ** Catatan ** Ganti nama pengguna PythonAnywhere Anda sendiri yang sesuai. Jika Anda membuat kesalahan, PythonAnywhere akan menunjukkan sedikit peringatan.
> >     
> >     
> >     ### Mengkonfigurasi file WSGI Django bekerja dengan menggunakan "protokol WSGI", sebuah standar untuk melayani situs web menggunakan Python, yang didukung PythonAnywhere . Cara kita mengkonfigurasi PythonAnywhere untuk mengenali blog Django kita adalah dengan mengedit file konfigurasi WSGI.
> >     
> >     Klik pada link "file konfigurasi WSGI" (di bagian "Kode" di dekat bagian atas halaman - akan diberi nama seperti `/ var / www / &lt;your-PythonAnywhere-username&gt; _pythonanywhere_com_wsgi.py`), dan Anda akan menjadi dibawa ke editor
> >     
> >     Hapus semua isi dan ganti dengan yang berikut:
> >     
> >      {% filename%} & amp; lt; nama pengguna & amp; gt; _pythonanywhere_com_wsgi.py {% endfilename%} 
> >     `` `python import os import sys path = os.path.expanduser ('~ / my-first-blog') jika path tidak di sys.path:
> >          sys.path.append ( path) os.environ ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings' dari django.core.wsgi import get_wsgi_application dari django.contrib.staticfiles.handlers import StaticFilesHandler application = StaticFilesHandler (get_wsgi_application ())
> >     
> > 
> > Tugas file ini adalah memberi tahu PythonAnywhere tempat aplikasi web kami tinggal dan apa nama file pengaturan Django.
> > 
> > The ` StaticFilesHandler </ 0> adalah untuk menangani CSS kita. Ini diurus secara otomatis untuk Anda selama pengembangan lokal dengan perintah <code> runserver </ 0> . Kita akan lebih memahami lagi nanti tentang file statis
Kita akan lebih paham lagi apa itu file statis pada tutorial berikutmya, yaitu ketika kita mengedit CSS untuk website kita.</p>

<p>Klik <strong>Save</strong> dan kembalilah ke tab <strong>Web</strong>.</p>

<p>Selesai! Klik tombol hijau besar dengan label <strong>Reload</strong> dan anda akan dapat melihat aplikasi anda. Nda akan menemukan sebuah link yang mengarah kepadanya di bagian atas halaman.</p>

<h2>Tip Debugging (Mencari bug atau error)</h2>

<p>Jika anda melihat ada error pada saat anda membuka website anda, lokasi pertama-tama untuk mencari informasi debugging adalah pada <strong>error log</strong>. Anda akan menemukan sebuah link yang mengarah ke sana pada tab <a href="https://www.pythonanywhere.com/web_app_setup/">Web tab</a> PythonAnywhere. Lihat apakah ada pesan error di sana, yang terbaru ada di bagian bawah. Masalah-masalah yang umum dijumpai meliputi:</p>

<ul>
<li><p>Melupakan salah satu langkah yang kami lakukan di konsol: membuat virtualenv, mengaktifkannya, menginstal Django ke dalamnya, memigrasikan database.</p></li>
<li><p>Membuat kesalahan di jalur virtualenv di tab Web - biasanya akan ada pesan kesalahan kecil berwarna merah di sana, jika ada masalah.</p></li>
<li><p>Membuat kesalahan dalam file konfigurasi WSGI - apakah Anda mendapatkan jalur ke folder blog pertama saya?</p></li>
<li><p>Apakah anda memilih versi python yang sama untuk virtualenv dengan python apliksi web anda? Keduanya harus versi 3.6.</p></li>
</ul>

<p>Ada juga beberapa <a href="https://www.pythonanywhere.com/wiki/DebuggingImportError"> kiat debugging umum pada PythonAnywhere wiki </ 0> .</p>

<p>Dan ingat, pendamping anda siap di sini untuk membantu ada!</p>

<h1>Website anda kini hidup!</h1>

<p>Halaman default untuk situs Anda harus mengatakan "It worked!", Seperti halnya pada komputer lokal Anda. Coba tambahkan <code>/admin/` di akhir URL, maka anda akan masuk pada admin website. Lakukan Log in dengan username dan password yang sesuai dan anda akan dapat membuat posting baru di server.
> > 
> > Begitu Anda memiliki beberapa tulisan yang dibuat, Anda dapat kembali ke penyiapan lokal Anda (bukan PythonAnywhere ). Dari sini Anda harus mengerjakan setup lokal Anda untuk melakukan perubahan. Ini adalah alur kerja umum dalam pengembangan web - membuat perubahan secara lokal, mendorong perubahan tersebut ke GitHub, dan menarik perubahan Anda ke server Web langsung Anda. Ini memungkinkan Anda bekerja dan bereksperimen tanpa merusak situs web Anda. Cukup keren, ya?
> > 
> > Tepuk tangan! Pada proses pengembangan website, proses deploy ke dalam server adalah sebuah proses yang perlu sedikit trik dan seseorang biasanya perlu beberapa hari usaha sampai berhasil. Tapi kini anda sudah berhasil membuat website anda hidup dalam Internet sesungguhnya, itu sangat bagus!