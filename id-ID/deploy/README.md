# Peluncuran (Deploy)!

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
> >     *.pyc
> >     *~
> >     /.vscode
> >     __pycache__
> >     myvenv
> >     db.sqlite3
> >     /static
> >     .DS_Store
> >     
> > 
> > Dan simpan sebagai ` .gitignore </ 0> di folder "djangogirls".</p>

<blockquote>
  <p><strong>Catatan</strong> Titik di depan nama file sangat penting!  Jika anda mengalami kesulitan membuat nama file semacam ini (Karena Mac tidak suka jika anda membuat nama file yang diawali dengan titik lewat Finder, ini contoh kasus), maka pilih fitur "Save As" pada editor anda, yang seharusnya selalu berfungsi. Penting bahwa Anda tidak mengisi nama file dengan <code>.txt`, `.py` atau ekstensi nama file lainnya - file hanya akan dikenali oleh Git jika namanya persis `.gitignore`.
> > 
> > ** Catatan </ 0> Salah satu file yang ditentukan dalam Anda ` Gitignore </ 1> file <code> db.sqlite3 </ 1> . File ini adalah basis data lokal Anda tempat semua pengguna dan posting Anda disimpan. Kami akan mengikuti praktik umum pengembangan web, yang berarti kami akan menggunakan basis data terpisah untuk situs web pengujian lokal kami dan situs web publik kami di PythonAnywhere. Basis data PythonAnywhere bisa berupa SQLite, seperti pada mesin pengembangan Anda, tetapi biasanya Anda akan menggunakan apa yang disebut basis data MySQL, yang dapat menangani lebih banyak pengunjung daripada SQLite. Bagaimanapun, dengan tidak menggunakan database SQLite Anda untuk salinan GitHub, semua posting superuser Anda sebelumnya hanya akan tersedia secara lokal, dan Anda harus menambahkan yang baru di lingkungan produksi. Anda harus memikirkan database lokal Anda sebagai taman bermain yang bagus di mana Anda dapat menguji berbagai hal dan tidak takut bahwa Anda akan menghapus posting sebenarnya dari blog Anda.</p>
</blockquote>

<p>Sebaiknya cek status dulu dengan perintah <code>git status` sebelum melakukan `git add` atau kapanpun anda ingin memastikan apa yang telah berubah. Ini akan membantu mencegah kejutan terjadi, seperti file yang salah ditambahkan atau dilakukan. Perintah ` git status </ 0> mengembalikan informasi tentang file yang tidak dilacak / dimodifikasi / dipentaskan, status cabang, dan banyak lagi. Keluarannya harus serupa dengan berikut ini:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code>$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        .gitignore
        blog/
        manage.py
        mysite/
        requirements.txt

nothing added to commit but untracked files present (use "git add" to track)
`</pre> 
> > 
> > Dan akhirnya kita simpan perubahan kita. Buka konsole dan jalankan perintah-perintah berikut:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ git add --all .
> >     $ git commit -m "My Django Girls app, first commit"
> >      [...]
> >      13 files changed, 200 insertions(+)
> >      create mode 100644 .gitignore
> >      [...]
> >      create mode 100644 mysite/wsgi.py
> >     
> > 
> > ## Memasukkan kode Anda ke GitHub
> > 
> > Pergi ke [GitHub.com](https://www.github.com) dan daftar secara gratis untuk akun yang baru. (Jika Anda sudah mengaturnya selama persiapan lokakarya, itu bagus!) Pastikan Anda tidak lupa kata sandi Anda (tambahkan ke kata sandi manager Anda, jika Anda menggunakannya).
> > 
> > Kemudian buat sebuah repositori baru, beri nama "my-first-blog". Biarkan kotak centang "initialize with a README" dan pengaturan opsi .gitignore kosong (Kita sudah melakukannya dengan manual) dan biarkan lisensi ditetapkan ke "None".
> > 
> > ![](images/new_github_repo.png)
> > 
> > > **Catatan** Nama `my-first-blog` sangat penting, tentu anda bisa saja memilih nama lain, akan tetapi nama tersebut akan selalu muncul lagi dan anda tentu akan repot harus selalu menggantinya. Jadi tak usah sulit-sulit, pakai saja nama `my-first-blog`.
> > 
> > Pada layar berikutnya, Anda akan diperlihatkan repo's clone URL Anda, yang akan Anda gunakan di beberapa perintah berikut:
> > 
> > ![](images/github_get_repo_url_screenshot.png)
> > 
> > Sekarang kita perlu menghubungkan Git repositori dalam komputer Anda ke dalam GitHub.
> > 
> > Ketik perintah berikut ini pada konsol (Gantilah `<your-github-username>` dengan nama user sesuai akun GitHub yang telah Anda buat, tetapi tanpa tanda kurung sudut):
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
> >     $ git push -u origin master
> >     
> > 
> > Saat Anda push ke GitHub, Anda akan diminta untuk username dan password Github Anda (baik secara langsung di jendela baris perintah atau di jendela pop-up), dan setelah memasukkan kredensial Anda akan melihat sesuatu seperti ini:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     Counting objects: 6, done.
> >     Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
> >     Total 3 (delta 0), reused 0 (delta 0)
> >     To https://github.com/ola/my-first-blog.git
> >     
> >      * [new branch]      master -> master
> >     Branch master set up to track remote branch master from origin.
> >     
> > 
> > <!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->
> > 
> > Kode Anda sekarang ada di GitHub. Silahkan anda cek! You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
> > 
> > # Setting up our blog on PythonAnywhere
> > 
> > ## Sign up for a PythonAnywhere account
> > 
> > > **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
> > 
> > {% include "/deploy/signup_pythonanywhere.md" %}
> > 
> > ## Mengatur situs Kita di PythonAnywhere
> > 
> > Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.
> > 
> > ![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)
> > 
> > > **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
> > 
> > Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application. There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     $ pip3.6 install --user pythonanywhere
> >     
> > 
> > That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.
> > 
> > Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`, so that the URL matches the clone URL from GitHub):
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
> >     
> > 
> > As you watch that running, you'll be able to see what it's doing:
> > 
> > - Downloading your code from GitHub
> > - Creating a virtualenv on PythonAnywhere, just like the one on your own computer
> > - Updating your settings file with some deployment settings
> > - Setting up a database on PythonAnywhere using the `manage.py migrate` command
> > - Setting up your static files (we'll learn about these later)
> > - And configuring PythonAnywhere to serve your web app via its API
> > 
> > On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.
> > 
> > The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own computer, so it can have different posts and admin accounts. As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     (ola.pythonanywhere.com) $ python manage.py createsuperuser
> >     
> > 
> > Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
> > 
> > Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     (ola.pythonanywhere.com) $ ls
> >     blog  db.sqlite3  manage.py  mysite requirements.txt static
> >     (ola.pythonanywhere.com) $ ls blog/
> >     __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
> >     tests.py  views.py
> >     
> > 
> > You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)
> > 
> > ## You are now live!
> > 
> > Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want :)
> > 
> > > **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.
> > 
> > ## Debugging tips
> > 
> > If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:
> > 
> > - Lupa membuat token API PythonAnywhere anda.
> > - Membuat kesalahan dalam URL GitHub anda
> > - Jika anda melihat kesalahan yang mengatakan *"Tidak dapat menemukan settings.py anda"*, mungkin karena anda tidak berhasil menambahkan semua berkas anda ke Git, dan / atau anda tidak mendorongnya ke GitHub berhasil. Lihat lagi bagian Git di atas
> > - If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.
> > 
> > If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> > 
> > There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> > 
> > And remember, your coach is here to help!
> > 
> > # Periksa situs Anda!
> > 
> > The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.
> > 
> > Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> > 
> > Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!