# Menyebarkan!

> **Nota** Bab berikut kadang-kadang agak sukar untuk diteruskan. Terus dan selesaikannya; penyebaran adalah bahagian penting dalam proses pembangunan laman web. Bab ini diletakkan di tengah-tengah tutorial supaya mentor anda dapat membantu dengan proses yang lebih rumit untuk mendapatkan laman web anda dalam talian. Ini bermakna anda masih boleh menyelesaikan tutorial anda sendiri jika anda kehabisan masa.

Hingga kini, laman web anda hanya tersedia di komputer anda. Kini anda akan belajar bagaimana untuk menggunakannya! Menyebarkan adalah proses menerbitkan aplikasi anda di Internet supaya orang akhirnya boleh pergi dan melihat aplikasi anda. :)

Seperti yang anda pelajari, tapak web harus ditempatkan di pelayan. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

The other external service we'll be using is [GitHub](https://www.github.com), which is a code hosting service. Terdapat orang lain di luar sana, tetapi hampir semua pengaturcara mempunyai akaun GitHub hari ini, dan kini begitu juga anda!

Ketiga tempat ini akan menjadi penting bagi anda. Komputer tempatan anda akan menjadi tempat di mana anda melakukan pembangunan dan ujian. Apabila anda berpuas hati dengan perubahan, anda akan meletakkan salinan program anda di GitHub. Laman web anda akan berada di PythonAnywhere dan anda akan mengemas kini dengan mendapatkan salinan baru kod anda dari GitHub.

# Git

> **Note** If you already did the Installation steps, there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Memulakan repositori Git kami

Git menjejaki perubahan pada satu set fail tertentu dalam apa yang dipanggil repositori kod (atau "repo" untuk pendek). Mari kita mulakan projek kami. Open up your console and run these commands, in the `djangogirls` directory:

> **Note** Check your current working directory with a `pwd` (Mac OS X/Linux) or `cd` (Windows) command before initializing the repository. You should be in the `djangogirls` folder.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Memulakan repositori git adalah sesuatu yang perlu kita lakukan hanya sekali bagi setiap projek (dan anda tidak perlu memasukkan semula nama pengguna dan email sekali lagi).

Git akan menjejaki perubahan kepada semua fail dan folder dalam direktori ini, tetapi terdapat beberapa fail yang kami mahu ia diabaikan. We do this by creating a file called `.gitignore` in the base directory. Buka editor anda dan buat fail baru dengan kandungan berikut:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

And save it as `.gitignore` in the "djangogirls" folder.

> **Note** The dot at the beginning of the file name is important! Jika anda mengalami sebarang kesulitan menciptanya (Mac tidak menyukai anda untuk membuat fail yang bermula dengan titik melalui Finder, sebagai contoh), kemudian gunakan ciri "Simpan Sebagai" dalam editor anda; ia peluru.
> 
> **Note** One of the files you specified in your `.gitignore` file is `db.sqlite3`. Fail itu ialah pangkalan data setempat anda, di mana semua jawatan anda disimpan. Kami tidak mahu menambah ini ke repositori anda kerana laman web anda di PythonAnywhere akan menggunakan pangkalan data yang berbeza. Pangkalan data itu boleh menjadi SQLite, seperti mesin pembangunan anda, tetapi biasanya anda akan menggunakan salah satu yang dipanggil MySQL yang boleh menangani pelawat laman web yang lebih banyak daripada SQLite. Dengan cara ini, dengan mengabaikan pangkalan data SQLite anda untuk salinan GitHub, ini bermakna bahawa semua jawatan yang anda buat setakat ini akan tinggal dan hanya boleh didapati di dalam negara, tetapi anda perlu menambah lagi pengeluaran. Anda perlu memikirkan pangkalan data tempatan anda sebagai taman permainan yang bagus di mana anda boleh menguji perkara yang berbeza dan jangan takut bahawa anda akan memadamkan siaran sebenar anda dari blog anda.

It's a good idea to use a `git status` command before `git add` or whenever you find yourself unsure of what has changed. Ini akan membantu menghalang sebarang kejutan daripada berlaku, seperti fail salah yang ditambah atau dilakukan. The `git status` command returns information about any untracked/modified/staged files, the branch status, and much more. Keluaran harus sama dengan yang berikut:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Dan akhirnya kami menyelamatkan perubahan kami. Pergi ke konsol anda dan jalankan arahan ini:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. (Jika anda sudah melakukannya dalam persiapan bengkel, itu bagus!) Kemudian, buat repositori baru, memberikan nama "blog pertama saya". Biarkan kotak semak "memulakan dengan README" tidak dicentang, biarkan pilihan .gitignore kosong (kami telah melakukannya secara manual) dan biarkan Lesen sebagai Tiada.
    
    <img src="images/new_github_repo.png" />
    
    > **Note** The name `my-first-blog` is important – you could choose something else, but it's going to occur lots of times in the instructions below, and you'd have to substitute it each time. Mungkin lebih mudah hanya dengan nama `my-first-blog`.
    
    Pada skrin seterusnya, anda akan dipaparkan URL klon repo anda. Choose the "HTTPS" version, copy it, and we'll paste it into the terminal shortly:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Now we need to hook up the Git repository on your computer to the one up on GitHub.
    
    Type the following into your console (Replace `<your-github-username>` with the username you entered when you created your GitHub account, but without the angle-brackets):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Enter your GitHub username and password and you should see something like this:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [cawangan baru] tuan -> master master Cawangan ditubuhkan untuk mengesan induk cawangan jauh dari asal.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Your code is now on GitHub. Pergi dan periksa!  You'll find it's in fine company – [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), and many other great open source software projects also host their code on GitHub. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    When you've signed up for PythonAnywhere, you'll be taken to your dashboard or "Consoles" page. Pilih pilihan untuk memulakan konsol "Bash" - itulah versi PythonAnywhere dari konsol, sama seperti yang ada pada komputer anda.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Mari kita tarik kod kami dari GitHub dan ke PythonAnywhere dengan membuat "klon" repo kami. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />This will pull down a copy of your code onto PythonAnywhere. Check it out by typing `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Just like you did on your own computer, you can create a virtualenv on PythonAnywhere. In the Bash console, type:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Note** The `pip install` step can take a couple of minutes.  Kesabaran, kesabaran!  Tetapi jika ia mengambil masa lebih dari pada lima minit, ada yang salah.  Tanya jurulatih anda.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Creating the database on PythonAnywhere
    
    Here's another thing that's different between your own computer and the server: it uses a different database. Oleh itu, akaun pengguna dan jawatan mungkin berbeza di pelayan dan di komputer anda.
    
    Just as we did on your own computer, we repeat the step to initialize the database on the server, with `migrate` and `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Publishing our blog as a web app
    
    Now our code is on PythonAnywhere, our virtualenv is ready, and the database is initialized. Kami bersedia untuk menerbitkannya sebagai aplikasi web!
    
    Klik kembali ke papan pemuka PythonAnywhere dengan mengklik pada logonya, kemudian klik pada tab **Web**. Akhirnya, tekan **Tambah apl web baru**.
    
    After confirming your domain name, choose **manual configuration** (N.B. – *not* the "Django" option) in the dialog. Next choose **Python 3.6**, and click Next to finish the wizard.
    
    &gt; **Note** Make sure you choose the "Manual configuration" option, not the "Django" one. Kami terlalu keren untuk setup PythonAnywhere default Django. ;-)
    
    
    ### Setting the virtualenv
    
    You'll be taken to the PythonAnywhere config screen for your webapp, which is where you'll need to go whenever you want to make changes to the app on the server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    In the "Virtualenv" section, click the red text that says "Enter the path to a virtualenv", and enter `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. Klik kotak biru dengan tanda semak untuk menyelamatkan laluan sebelum bergerak.
    
    &gt; **Note** Substitute your own PythonAnywhere username as appropriate. Sekiranya anda membuat kesilapan, PythonAnywhere akan menunjukkan sedikit amaran.
    
    
    ### Configuring the WSGI file
    
    Django works using the "WSGI protocol", a standard for serving websites using Python, which PythonAnywhere supports. Cara kami mengkonfigurasi PythonAnywhere untuk mengenali blog Django kami adalah dengan mengedit fail konfigurasi WSGI.
    
    Click on the "WSGI configuration file" link (in the "Code" section near the top of the page – it'll be named something like `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), and you'll be taken to an editor.
    
    Delete all the contents and replace them with the following:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

Tugas fail ini adalah untuk memberitahu PythonAnywhere di mana aplikasi web kami hidup dan nama fail tetapan Django itu.

The `StaticFilesHandler` is for dealing with our CSS. This is taken care of automatically for you during local development by the `runserver` command. Kami akan mengetahui lebih lanjut mengenai fail statik kemudian dalam tutorial, apabila kami mengedit CSS untuk laman web kami.

Hit **Save** and then go back to the **Web** tab.

We're all done! Hit the big green **Reload** button and you'll be able to go view your application. You'll find a link to it at the top of the page.

## Petua penyahpepijatan

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). Lihat jika terdapat sebarang mesej ralat di sana; yang paling baru berada di bahagian bawah. Masalah biasa termasuk:

- Melupakan satu langkah yang kami lakukan di konsol: mewujudkan virtualenv, mengaktifkannya, memasang Django ke dalamnya, memindahkan pangkalan data.

- Membuat kesilapan dalam laluan virtualenv di tab Web - biasanya terdapat sedikit mesej ralat merah di sana, jika ada masalah.

- Membuat kesilapan dalam fail konfigurasi WSGI - adakah anda mendapat laluan ke folder blog pertama saya?

- Adakah anda memilih versi Python yang sama untuk virtualenv anda seperti yang anda lakukan untuk aplikasi web anda? Kedua-duanya harus 3.6.

There are also some [general debugging tips on the PythonAnywhere wiki](https://www.pythonanywhere.com/wiki/DebuggingImportError).

Dan ingat, jurulatih anda di sini untuk membantu!

# Anda hidup!

Halaman lalai untuk laman web anda sepatutnya mengatakan "Ia berfungsi!", Sama seperti pada komputer tempatan anda. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log masuk dengan nama pengguna dan kata laluan, dan anda akan melihat anda boleh menambah Posts baru pada pelayan.

Sebaik sahaja anda mempunyai beberapa catatan yang dibuat, anda boleh kembali ke persediaan setempat anda (bukan PythonAnywhere ). Dari sini, anda perlu membuat persediaan setempat anda untuk membuat perubahan. Ini adalah alur kerja biasa dalam pembangunan web - membuat perubahan secara tempatan, tolak perubahan tersebut kepada GitHub, dan tarik perubahan anda ke pelayan Web langsung anda. Ini membolehkan anda untuk bekerja dan bereksperimen tanpa memecah laman web anda secara langsung. Cukup sejuk, kan?

Give yourself a *HUGE* pat on the back! Pelancaran pelayan adalah salah satu bahagian yang paling menarik dari pembangunan web dan ia sering memerlukan orang beberapa hari sebelum mereka membuat mereka bekerja. Tetapi anda mendapat laman web anda secara langsung, di Internet sebenar, seperti itu!