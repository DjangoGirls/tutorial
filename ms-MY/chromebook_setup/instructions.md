You can [skip right over this section](http://tutorial.djangogirls.org/en/installation/#install-python) if you're not using a Chromebook. Sekiranya anda berada, pengalaman pemasangan anda akan sedikit berbeza. Anda boleh mengabaikan sisa arahan pemasangan.

### Awan 9

Cloud 9 is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. For the duration of the tutorial, Cloud 9 will act as your *local machine*. Anda masih akan menjalankan arahan dalam antara muka terminal seperti rakan sekelas anda di OS X, Ubuntu, atau Windows, tetapi terminal anda akan disambungkan ke komputer yang berjalan di tempat lain yang Awan 9 menetapkan untuk anda.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io)
3. Daftar untuk akaun
4. Click *Create a New Workspace*
5. Name it *django-girls*
6. Select the *Blank* (second from the right on the bottom row with orange logo)

Sekarang anda perlu melihat antara muka dengan bar sisi, tetingkap utama yang besar dengan beberapa teks, dan tetingkap kecil di bahagian bawah yang kelihatan seperti ini:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Persekitaran Maya

Persekitaran maya (juga dipanggil virtualenv) adalah seperti kotak peribadi yang boleh kita buat kod komputer berguna untuk projek yang sedang kita kerjakan. Kami menggunakannya untuk menyimpan pelbagai bit kod yang kami mahukan untuk pelbagai projek kami yang berasingan supaya perkara tidak dapat bercampur antara projek.

Di terminal anda di bahagian bawah antara muka awan 9, jalankan yang berikut:

{% filename %}Cloud 9{% endfilename %}

    kemas kini sudo apt
    sudo apt install python3.6-venv
    

Jika ini masih tidak berfungsi, tanya jurulatih anda untuk mendapatkan bantuan.

Seterusnya, jalankan:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~=1.11.0
    

(ambil perhatian bahawa pada baris terakhir kita menggunakan tilde diikuti dengan tanda yang sama: ~ =).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

Tutorial Django Girls merangkumi seksyen tentang apa yang disebut Deployment, yang merupakan proses mengambil kod yang menguatkan aplikasi web baru anda dan mengalihkannya ke komputer yang boleh diakses secara umum (dipanggil pelayan) supaya orang lain dapat melihat karya anda.

Bahagian ini agak aneh apabila melakukan tutorial pada Chromebook kerana kami sudah menggunakan komputer yang ada di Internet (berbanding dengan, katakan, komputer riba). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).