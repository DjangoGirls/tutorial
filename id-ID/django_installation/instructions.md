> Bagian dari bagian ini didasarkan pada tutorial oleh Geek Girls Wortel (https://github.com/ggcarrots/django-carrots).
> 
> Bagian dari bagian ini didasarkan pada tutorial  Django-marcador </ 0> yang berlisensi di bawah Lisensi Internasional Creative Commons Attribution-ShareAlike 4.0. Hak cipta tutorial django-marcador oleh Markus Zapke-Gründemann et al.</p> </blockquote> 
> 
> ## Virtual Environment
> 
> Sebelum anda menginstal django, anda akan mempelajari cara menginstall tool yang sangat penting untuk menjaga pengembangan komputer anda secara teratur. Dimungkinkan untuk melewati bagian ini, tapi sangat dianjurkan untuk tidak melewatinya. Dimulai dengan setup sebaik mungkin akan menghindarkan anda dari banyak kesulitan di masa yang akan datang.
> 
> Karena itu, mari membuat sebuah **virtual environment** (juga disebut *virtualenv*). Virtualenv akan memisahkan setup Python/Django untuk tiap proyek. Ini artinya bahwa suatu perubahan yang anda buat pada sebuah website, tidak akan mempengaruhi website lain yang juga sedang anda kembangkan. Jelas bukan ?
> 
> Yang perlu anda kerjakan adalah menemukan sebuah direktory dimana anda ingin menciptakan `virtualenv`, yaitu home directory anda, ini sebagai misal. Pada Windows, mungkin terlihat seperti `C:\Users \ Name` (dimana`Nama` merupakan nama login anda).
> 
> > **CATATAN: ** Pada Windows, pastikan petunjuk ini tidak mengandung karakter beraksen atau karakter khusus; Jika nama pengguna anda mengandung karakter beraksen, gunakan petunjuk yang berbeda, misalnya, `C:\ jangogirls`.
> 
> Karena tutorial ini akan menggunakan sebuah direktory baru yaitu `djangogirls`, dari home direktory anda:
> 
> {% filename%} baris perintah {% endfilename%}
> 
>     $ mkdir djangogirls $ cd djangogirls
>     
> 
> Kita akan membuat sebuah virtualenv dengan nama `myenv`. Bentuk perintah umumnya seperti ini:
> 
> {% filename%} baris perintah {% endfilename%}
> 
>     $ python3 -m venv myvenv
>     
> 
> <!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->
> 
> Untuk membuat new ` virtualenv </ 0> , Anda perlu membuka command prompt dan menjalankan <code> python -m venv myvenv </ 0> . Ini akan terlihat seperti ini:</p>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code>C: \ Users \ Name \ djangogirls & gt; python -m venv myvenv
`</pre> 
> 
> Dimana ` myvenv </ 0> adalah nama <code> virtualenv </ 0> Anda . Anda boleh menggunakan nama yang lain, tapi harus menggunakan huruf kecil dan tanpa spasi, karakter khusus ataupun tanda petik. Ini juga ide bagus untuk menjaga agar nama tetap pendek - Anda akan sering merujuknya!</p>

<!--endsec-->


> 
> <!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

<p>Kita bisa menciptakan <code>virtualenv`pada Linux dan OS X dengan menjalankan 
> 
> `python3 -m venv myvenv`. Ini akan terlihat seperti ini:
> 
> {% filename%} baris perintah {% endfilename%}
> 
>     $ python3 -m venv myvenv
>     
> 
> `myvenv` adalah nama dari `virtualenv` anda. Anda dapat menggunakan nama lain akan tetapi tetap gunakan huruf kecil dan tanpa spasi. Ini juga merupakan ide yang baik untuk menjaga agar nama tetap singkat seperti yang akan anda rujuk secara banyak!
> 
> > ** CATATAN: </ 0> Pada beberapa versi Debian / Ubuntu Anda mungkin menerima error berikut:</p> 
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
> >        apt install python3-venv
> >     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
> >     
> > 
> > Dalam kasus ini, ikuti petunjuk di atas dan pasang paket ` python3-venv </ 0> :
 {% filename%} command-line {% endfilename%}  </p>

<pre><code>$ sudo apt install python3-venv
`</pre> 
> > 
> > ** CATATAN: </ 0> Pada beberapa versi Debian / Ubuntu yang memulai lingkungan virtual seperti saat ini memberikan error berikut:</p> 
> > 
> > {% filename %}baris perintah{% endfilename %}
> > 
> >     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
> >     
> > 
> > Untuk mengatasi hal ini, gunakan perintah `virtualenv`.
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     $ sudo apt install python-virtualenv
> >     $ virtualenv --python=python{{ book.py_version }} myvenv
> >     
> > 
> > ** CATATAN: </ 0> Jika Anda mengalami error seperti</p> 
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     E: Tidak dapat menemukan paket python3-venv
> >     
> > 
> > lalu jalankan:
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     sudo apt install python{{ book.py_version }}-venv
> >     </blockquote> 
> > 
> > <!--endsec-->
> > 
> > ## Bekerja Dengan Virtualenv
> > 
> > Perintah di atas akan meciptakan sebuah direktori dengan nama `myvenv` (atau nama apa saja yang anda pilih) yang berisi virtual environment kita (jelasnya berisi banyak file dan direktori).
> > 
> > <!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->
> > 
> > Aktifkan virtual environment anda dengan menjalankan:
> > 
> > {% filename%} baris perintah {% endfilename%}
> > 
> >     C: \ Users \ Name \ djangogirls & gt; myvenv \ Scripts \ activate
> >     
> > 
> > > ** CATATAN: </ 0> pada Windows 10 Anda mungkin mendapatkan pesan kesalahan pada Windows PowerShell yang mengatakan bahwa ` eksekusi skrip dinonaktifkan pada sistem ini </ 1> . Dalam kasus ini, buka Windows PowerShell lainnya dengan opsi "Run as Administrator".  Kemudian coba ketikkan perintah berikut sebelum memulai lingkungan virtual Anda:</p>
  
  <p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code>C: \ WINDOWS \ system32 & gt; Set-ExecutionPolicy -ExecutionPolicy     Perubahan Kebijakan Eksekusi RemoteSigned
 Kebijakan
     eksekusi membantu melindungi Anda dari skrip yang tidak Anda percaya. Mengubah kebijakan eksekusi mungkin akan memaparkan risiko keamanan yang dijelaskan di topik bantuan about_Execution_Policies di http://go.microsoft.com/fwlink/?LinkID=135170. Apakah Anda ingin mengubah kebijakan eksekusi? [Y] Ya   [A] Ya untuk Semua   [N] Tidak   [L] Tidak untuk Semua   [S] Suspend [?] Help (defaultnya adalah "N"): A
`</pre> </blockquote> 
> > > 
> > > <!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->
> > > 
> > > > **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> > > > 
> > > >     $ . myvenv\Scripts\activate.ps1
> > > >     
> > > > 
> > > > The advantage is that you don't have to switch between editor windows and command-line windows
> > > 
> > > <!--endsec-->
> > > 
> > > <!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->
> > > 
> > > Start your virtual environment by running:
> > > 
> > > {% filename %}command-line{% endfilename %}
> > > 
> > >     $ source myvenv / bin / aktifkan
> > >     
> > > 
> > > Remember to replace `myvenv` with your chosen `virtualenv` name!
> > > 
> > > > **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> > > > 
> > > > {% filename %}command-line{% endfilename %}
> > > > 
> > > >     $ . myvenv/bin/activate
> > > >     
> > > 
> > > <!--endsec-->
> > > 
> > > You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.
> > > 
> > > When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.
> > > 
> > > OK, we have all important dependencies in place. We can finally install Django!
> > > 
> > > ## Installing Django {#django}
> > > 
> > > Now that you have your `virtualenv` started, you can install Django.
> > > 
> > > Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:
> > > 
> > > {% filename %}command-line{% endfilename %}
> > > 
> > >     (myvenv) ~$ python -m pip install --upgrade pip
> > >     
> > > 
> > > ### Installing packages with requirements
> > > 
> > > A requirements file keeps a list of dependencies to be installed using `pip install`:
> > > 
> > > First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:
> > > 
> > >     djangogirls
> > >     ├── myvenv
> > >     │   └── ...
> > >     └───requirements.txt
> > >     
> > > 
> > > In your `djangogirls/requirements.txt` file you should add the following text:
> > > 
> > > {% filename %}djangogirls/requirements.txt{% endfilename %}
> > > 
> > >     Django~={{ book.django_version }}
> > >     
> > > 
> > > Now, run `pip install -r requirements.txt` to install Django.
> > > 
> > > {% filename %}command-line{% endfilename %}
> > > 
> > >     (myvenv) ~$ pip install -r requirements.txt
> > >     Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
> > >       Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
> > >     Installing collected packages: Django
> > >     Successfully installed Django-{{ book.django_version }}
> > >     
> > > 
> > > <!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->
> > > 
> > > > If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)
> > > 
> > > <!--endsec-->
> > > 
> > > <!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->
> > > 
> > > > Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> > > > 
> > > > {% filename %}command-line{% endfilename %}
> > > > 
> > > >     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
> > > >     
> > > 
> > > <!--endsec-->
> > > 
> > > <!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->
> > > 
> > > > If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.
> > > 
> > > <!--endsec-->
> > > 
> > > That's it! You're now (finally) ready to create a Django application!