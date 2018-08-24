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
> > ## Pushing your code to GitHub
> > 
> > Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (If you already did that in the workshop prep, that is great!)
> > 
> > Then, create a new repository, giving it the name "my-first-blog". Leave the "initialize with a README" checkbox unchecked, leave the .gitignore option blank (we've done that manually) and leave the License as None.
> > 
> > ![](images/new_github_repo.png)
> > 
> > > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. It's probably easier to stick with the name `my-first-blog`.
> > 
> > On the next screen, you'll be shown your repo's clone URL. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
> > 
> > ![](images/github_get_repo_url_screenshot.png)
> > 
> > Now we need to hook up the Git repository on your computer to the one up on GitHub.
> > 
> > Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
> >     $ git push -u origin master
> >     
> > 
> > Enter your GitHub username and password and you should see something like this:
> > 
> > {% filename %}command-line{% endfilename %}
> > 
> >     Username for 'https://github.com': ola
> >     Password for 'https://ola@github.com':
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
> > Your code is now on GitHub. Go and check it out! You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
> > 
> > # Setting up our blog on PythonAnywhere
> > 
> > ## Sign up for a PythonAnywhere account
> > 
> > > **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
> > 
> > {% include "/deploy/signup_pythonanywhere.md" %}
> > 
> > ## Configuring our site on PythonAnywhere
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
> > Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`):
> > 
> > {% filename %}PythonAnywhere command-line{% endfilename %}
> > 
> >     $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
> >     
> > 
> > As you watch that running, you'll be able to see what it's doing:
> > 
> > - Downloading your code from GitHub
> > - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
> > - Updating your settings file with some deployment settings
> > - Setting up a database on PythonAnywhere using the `manage.py migrate` command
> > - Setting up your static files (we'll learn about these later)
> > - And configuring PythonAnywhere to serve your web app via its API
> > 
> > On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
> > 
> > As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
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
> >     __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
> >     templates  tests.py  urls.py  views.py
> >     
> > 
> > You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.
> > 
> > ## You are now live!
> > 
> > Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)
> > 
> > > **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.
> > 
> > ## Debugging tips
> > 
> > If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:
> > 
> > - Lupa membuat token API PythonAnywhere anda.
> > - Membuat kesalahan dalam URL GitHub anda
> > - Jika anda melihat kesalahan yang mengatakan *"Tidak dapat menemukan settings.py anda"*, mungkin karena anda tidak berhasil menambahkan semua berkas anda ke Git, dan / atau anda tidak mendorongnya ke GitHub berhasil. Lihat lagi bagian Git di atas
> > 
> > If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> > 
> > There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> > 
> > And remember, your coach is here to help!
> > 
> > # Check out your site!
> > 
> > The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.
> > 
> > Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> > 
> > Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!