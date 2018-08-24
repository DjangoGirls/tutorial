# Pengantar antarmuka baris perintah

> Bagi para pembaca di rumah: bab ini telah dibahas di video [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

Ini menarik kan? Anda akan menulis baris kode pertama Anda hanya dalam beberapa menit! :)

**Mari kita perkenalkan Anda ke teman baru pertama Anda: baris perintah!**

Langkah-langkah berikut akan menunjukkan cara menggunakan jendela hitam yang digunakan oleh semua hacker. Mungkin terlihat sedikit menakutkan pada awalnya tapi sebenarnya itu hanya sebuah prompt menunggu perintah dari Anda.

> **Catatan** Perlu diketahui bahwa di sepanjang buku ini kita akan menggunakan istilah 'directory' dan 'folder' secara bergantian tetapi keduanya adalah satu dan sama.

## Apa itu baris perintah?

Jendela, yang biasanya disebut **command line**atau** antarmuka baris perintah**, adalah aplikasi berbasis teks untuk melihat, menangani, dan memanipulasi berkas di komputer Anda. Ini seperti Windows Explorer atau Finder di Mac, tapi tanpa antarmuka grafis. Nama lain dari baris perintah adalah: *cmd*, *CLI*, *prompt*, *konsol* atau *terminal*.

## Buka antarmuka baris perintah

Untuk memulai beberapa percobaan kita perlu membuka antarmuka baris perintah kita terlebih dahulu.

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Buka menu Start → Windows System → Command Prompt.

> Pada versi Windows yang lama, lihat pada menu Start → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Arahkan ke Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Jendela Perintah

Sekarang Anda akan melihat jendala hitam atau putih yang menunggu perintah yang Anda ketikkan.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}baris-perintah{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

Pada Windows, tandanya `>` seperti ini:

{% filename %}baris-perintah{% endfilename %}

    >
    

<!--endsec-->

Setiap baris perintah akan ada tambahan awal dengan tanda ini dan satu spasi, namun Anda tidak perlu mengetikkannya. Komputer Anda akan melakukannya untuk Anda. :)

> Catatan kecil: dalam kasus Anda mungkin kelihatan seperti `C:\Users\ola>` atau `Olas-MacBook-Air:~ ola$` sebelum tanda prompt, itu tidak menjadi masalah.

Bagian setelah dan termasuk tanda `$` atau `>` disebut *prompt baris perintah*, atau singkatnya disebut *prompt*. Mengharuskan Anda untuk mengetikkan sebuah perintah di sana.

Pada tutorial, pada saat kami ingin Anda untuk mengeikkan baris perintah, kami akan sertakan tanda `$` atau `>`, dan kadang-kadang lebih ke kiri. Ignore the left part and only type in the command, which starts after the prompt.

## Perintah pertama Anda (YAY!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > whoami
    

<!--endsec-->

Dan kemudian tekan `enter`. Beginilah hasilnya:

{% filename %}baris-perintah{% endfilename %}

    $ whoami 
    olasitarska
    

Seperti yang bisa Anda lihat, komputer baru saja mencetak nama pengguna Anda. Rapi, kan? :)

> Coba ketik setiap baris peintah; jangan disalin-tempel. Anda akan ingat lebih banyak dengan cara ini!

## Hal-hal dasar

Setiap sistem operasi memiliki seperangkat perintah yang sedikit berbeda untuk baris perintah, jadi pastikan untuk mengikuti petunjuk untuk sistem operasi Anda. Bagaimana kalau kita mencobanya sekarang?

### Direktori aktif

Akan lebih baik jika mengetahui di mana posisi kita sekarang. Mari kita lihat. Ketikkan perintah ini lalu tekan `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ pwd /
    Users/olasitarska
    

> Catatan: 'pwd' singkatan dari 'print working directory'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd 
    C:\Users\olasitarska
    

> Catatan: 'cd' singkatan dari 'change directory'. Dengan powershell Anda dapat menggunakn pwd seperti halnya pada Linux atau Mac OS X.

<!--endsec-->

Anda mungkin akan melihat sesuatu yang serupa di mesin Anda. Setelah Anda membuka baris perintah yang biasanya Anda gunakan di direktori home pengguna Anda.

* * *

### Daftar berkas dan direktori

Jadi apa isinya? Pasti menyenangkan untuk mencari tahu. Mari kita lihat:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ ls 
    Applications 
    Desktop 
    Downloads 
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > dir  
    Directory of C:\Users\olasitarska 
    05/08/2014 07:28 PM <DIR> Applications 
    05/08/2014 07:28 PM <DIR> Desktop 
    05/08/2014 07:28 PM <DIR> Downloads 
    05/08/2014 07:28 PM <DIR> Music 
    ...
    

> Catatan: di powershell Anda juga dapat menggunakan 'ls' seperti pada Linux dan Mac OS X. <!--endsec-->

* * *

### Mengganti direktori aktif

Sekarang, mari kita ke direktori Desktop:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Coba periksa apa sudah benar-benar berubah:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Ini dia!

> PRO tip: jika Anda ketik `cd D` dan kemudian menekan `tab` pada keyboard Anda, perintah tersebut akan secara otomatis mengisi sisa dari perintah yang akan diketik sehingga Anda dapat bekerja lebih cepat. Jika ada lebih daru satu folder yang dimulai dengan "D", tekan tombol `tab` dua kali untuk melihat daftar pilihan yang tersedia.

* * *

### Membuat Direktori

Bagaimana jika kita membuat direktori praktik di dekstop Anda? Anda dapat melakukannya begini:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ mkdir praktik
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > mkdir praktik
    

<!--endsec-->

Perintah sederhana ini akan membuat sebuh folder dengan nama `praktik` pada Desktop Anda. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Cobalah. :)

> PRO tip: Jika Anda tidak ingin mengetikkan perintah yang sama berulangkali, coba tekan `panah atas` dan `panah bawah` pada keyboard Anda untuk melihat perintah yang baru saja Anda gunakan.

* * *

### Latihan!

Tantangan kecil untuk Anda: pada direktori `praktik` yang baru Anda buat, buat sebuah direktori dengan nama `tes`. (Gunakan perintah `cd` dan `mkdir`.)

#### Solusi:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ cd practice 
    $ mkdir test 
    $ ls 
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd practice 
    > mkdir test 
    > dir 
    05/08/2014 07:28 PM <DIR> test
    

<!--endsec-->

Selamat! :)

* * *

### Pembersihan

Kami tidak ingin meninggalkan kekacauan, jadi mari kita hilangkan semua yang telah kita lakukan sampai saat itu.

Pertama, kita perlu kembali ke Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd ..
    

<!--endsec-->

Penggunaan `..` dengan perintah `cd` akan mengubah direktori aktif saat ini kembali ke direktori induk (yaitu, direktori yang berisi direktori aktif saat ini.).

Periksa posisi Anda:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ pwd 
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > cd 
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

Sekarang kita akan menghapus direktori `praktik`:

> **Perhatian**: Menghapus berkas dengan menggunakan `del`, `rmdir ` atau `rm ` tidak dapat dipulihkan, artinya *berkas yang dihapus akan hilang selamanya*! Jadi berhati-hatilah dengan perintah ini.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}baris-perinah{% endfilename %}

    > rmdir /S practice 
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Selesai! Untuk memastikan itu benar-benar dihapus, mari kita periksa:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

Itu dulu untuk saat ini! Anda dapat menutup baris perintah sekarang. Mari melakukannya seperti yang dilakukan peretas, oke? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}baris-perintah{% endfilename %}

    > exit
    

<!--endsec-->

Keren, kan? :)

## Ringkasan

Berikut ini adalah beberapa ringkasan perintah yang akan berguna:

| Perintah (Windows) | Perintah (Mac OS / Linux) | Keterangan                  | Contoh                                         |
| ------------------ | ------------------------- | --------------------------- | ---------------------------------------------- |
| exit               | exit                      | menutup jendela kerja       | **exit**                                       |
| cd                 | cd                        | mengganti direktori         | **cd tes**                                     |
| cd                 | pwd                       | menunjukkan direktori aktif | **cd** (Windows) atau **pwd** (Mac OS / Linux) |
| dir                | ls                        | daftar direktori/file       | **dir**                                        |
| copy               | cp                        | menyalin berkas             | **copy c:\tes\tes.txt c:\windows\tes.txt** |
| move               | mv                        | memindakan berkas           | **move c:\tes\tes.txt c:\windows\tes.txt** |
| mkdir              | mkdir                     | membuat direktori baru      | **mkdir direktorites**                         |
| rmdir (or del)     | rm                        | menghapus berkas            | **del c:\tes\tes.txt**                       |
| rmdir /S           | rm -r                     | menghapus direktori         | **rm -r testdirectory**                        |

Ini semua hanya beberapa perintah yang dapat Anda jalankan pada baris perintah, tapi hari ini Anda tidak akan menggunakan apapun lebih dari itu.

Jika Anda masih penasaran, [ss64.com](http://ss64.com) berisi referensi lengkap tentang perintah-perintah untuk semua sistem operasi.

## Siap?

Mari menyelami dunia Python!