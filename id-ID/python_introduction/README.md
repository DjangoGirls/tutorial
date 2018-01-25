# Pengantar Python

> Bagian dari bab ini didasarkan pada tutorial oleh Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Mari kita tulis beberapa kode!

## Python prompt

> Bagi pembaca di rumah: bagian ini tercakup dalam [Dasar-Dasar Python: Integer, String, Daftar, Variabel dan Kesalahan](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Untuk memulai python, kita perlu membuka *Comand line atau Jendela perintah* pada komputer anda. Anda seharusnya sudah tahu bagaimana melakukan itu - Anda mempelajarinya di bagian [Intro to Command Line](../intro_to_command_line/README.md).

Ketika kamu sudah siap, Silakan ikuti instruksi dibawah ini.

Kita ingin membuka konsol Python, Jadi silakan ketik `python` untuk Windows atau `python3` pada Mac OS/Linux dan tekan `Enter`.

{% filename%} baris perintah {% endfilename%}

    $ python3
    Python 3.6.1 (...)
    Ketik "bantuan", "hak cipta", "kredit" atau "lisensi" untuk informasi lebih lanjut.
    >>>
    

## Perintah Python pertama Anda!

Setelah menjalankan perintah Python, prompt akan berubah menjadi `>>>`. Bagi kita sekarang adalah kita harus menggunakan perintah pada bahasa Python saja. Anda tidak perlu mengetik `>>>` - Python akan melakukannya untuk Anda.

Jika kamu ingin keluar dari konsol Python, Cukup dengan mengetik perintah `exit()` atau pakai shortcut `Ctrl + Z` untuk Windows dan `Ctrl + D` untuk Mac/Linux. Maka Anda tidak akan melihat `>>&gt` lagi.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}baris perintah{% endfilename %}

```python
>>> 2 + 3
5
```

Bagus! Lihat bagaimana balasan muncul keluar? Python tahu matematika! Anda bisa mencoba perintah lain seperti:

- `4 * 5`
- `5 - 1`
- `40 / 2
`

Untuk melakukan perhitungan eksponensial, katakan 2 pada power 3, kita ketik: {% filename %}baris perintah{% endfilename %}

```python
>>> 2 ** 3
8
```

Bersenang-senang dengan ini sebentar dan kemudian kembali kesini. :)

Seperti yang Anda lihat, Python adalah kalkulator yang hebat. Jika Anda bertanya-tanya apa lagi yang bisa Anda lakukan…

## String

Bagaimana dengan namamu? Ketik nama depan Anda dalam tanda kutip seperti ini:

{% filename %} baris perintah {% endfilename %}

```python
>>> "Ola"
'Ola'
```

Anda sekarang telah membuat string pertama Anda! Ini adalah urutan karakter yang bisa diolah oleh komputer. String harus selalu dimulai dan diakhiri dengan karakter yang sama. Ini mungkin tunggal (`'`) atau double (`"`) mengutip (tidak ada bedanya!) Kutipan memberi tahu Python bahwa apa yang ada di dalamnya adalah string.

String bisa dirangkai. Coba ini:

{% filename %} baris perintah {% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Anda juga bisa mengalikan string dengan angka:

{% filename %}baris perintah{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Jika Anda perlu menempatkan tanda kutip di dalam string Anda, Anda memiliki dua cara untuk melakukannya.

Menggunakan tanda kutip ganda:

{% filename %}baris perintah{% endfilename %}

```python
>>> "Runnin' menuruni bukit"
"Runnin' menuruni bukit"
```

atau keluar dari apostrof dengan garis miring terbalik (``):

{% filename %}baris perintah{% endfilename %}

```python
>>> 'Runnin\' menuruni bukit'
"Runnin' menuruni bukit"
```

Bagus, ya? Untuk melihat nama Anda dalam huruf besar, cukup ketik:

{% filename %}baris-perintah{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Anda hanya menggunakan **method**`upper` pada string anda! method (`upper`) adalah urutan instruksi yang Python harus melakukan pada objek tertentu ( ` " Ola " ` ) setelah anda menyebutnya .

Jika Anda ingin tahu jumlah huruf yang terkandung dalam nama Anda , ada **function** untuk itu juga!

{% filename %} baris-perintah{% endfilename %}

```python
>>> len ("Ola")
3
```

Entah mengapa kadang-kadang Anda memanggil fungsi dengan `.` di akhir string (seperti `"Ola".upper()`) dan terkadang Anda pertama kali memanggil fungsi dan menempatkan string dalam kurung? Nah, dalam beberapa kasus, fungsi termasuk objek, seperti `upper()`, yang hanya bisa dilakukan pada string. Dalam hal ini, kita sebut fungsi sebuah **metode**. Di lain waktu, fungsi tidak termasuk dalam sesuatu yang spesifik dan dapat digunakan pada berbagai jenis objek, seperti `len()`. Itu sebabnya kami memberi `"Ola"` sebagai parameter pada fungsi `len`.

### Ikhtisar

OK, cukup banyak senar. Sejauh ini Anda telah belajar tentang:

- **prompt** - perintah mengetik (kode) ke prompt Python menghasilkan jawaban dengan Python
- **nomor dan string** - dengan nomor Python digunakan untuk matematika dan string untuk objek teks
- **operators** – like `+` and `*`, combine values to produce a new one
- **fungsi** - seperti `atas()` dan `len()`, lakukan tindakan pada objek.

Ini adalah dasar-dasar setiap bahasa pemrograman yang Anda pelajari. Siap untuk sesuatu yang lebih keras? Kami yakin kamu!

## Kesalahan

Let's try something new. Can we get the length of a number the same way we could find out the length of our name? Type in `len(304023)` and hit `enter`:

{% filename%} baris perintah {% endfilename%}

```python
& gt; & gt; & gt; len (304023) Traceback (panggilan terakhir terakhir):
   File " <stdin> ", baris 1, di <module> 
TypeError: objek tipe 'int' tidak memiliki len ()
```

Kami mendapat kesalahan pertama kami! Dikatakan bahwa objek tipe "int" (bilangan bulat, bilangan bulat) tidak memiliki panjang. Jadi apa yang bisa kita lakukan sekarang? Mungkin kita bisa menulis nomor kita sebagai string? String punya panjang, kan?

{% filename %}baris-perintah{% endfilename %}

```python
& gt; & gt; & gt; len (str (304023)) 6
```

Ini berhasil! Kami menggunakan `str` fungsi di dalam `len` fungsi. `str()` mengubah segalanya menjadi senar.

- Fungsi `str` mengubah sesuatu menjadi **string**
- Fungsi `int` mengubah semuanya menjadi **bilangan bulat**

> Penting: kita bisa mengonversi bilangan menjadi teks, tapi kita tidak bisa mengubah teks menjadi angka - apa yang akan `int ('halo')` jadi?

## Variabel

Konsep penting dalam pemrograman adalah variabel. Variabel tidak lebih dari sebuah nama untuk sesuatu sehingga Anda dapat menggunakannya nanti. Pemrogram menggunakan variabel ini untuk menyimpan data, membuat kode mereka lebih mudah dibaca dan karenanya mereka tidak perlu terus mengingat hal-hal apa adanya.

Misalkan kita ingin membuat variabel baru yang disebut ` name ` :

{% filename %}baris perintah{% endfilename %}

```python
>>> nama = "Ola"
```

We type name equals Ola.

Seperti yang telah Anda sadari, program Anda tidak mengembalikan hal seperti sebelumnya. Jadi bagaimana kita tahu bahwa sebenarnya variabel itu ada? Cukup masukkan `nama`dan tekan `masukkan`:

{% filename %}baris-perintah{% endfilename %}

```python
>>> name
'Ola'
```

Hura! Variabel pertama anda :) Anda selalu bisa mengubah apa yang dimaksud dengan:

{% filename %}baris perintah{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Anda dapat menggunakannya dalam fungsi juga:

{% filename %}baris perintah{% endfilename %}

```python
>>> len(name)
5
```

Mengagumkan kan? Tentu saja, variabel bisa apa saja - angka juga! Coba ini:

{% filename %} baris perintah {% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Tapi bagaimana kalau kita menggunakan nama yang salah? Bisakah kamu menebak apa yang akan terjadi? Mari mencoba!

{% filename %}baris perintah{% endfilename %}

```python
>>> kota = "Tokyo"
>>> ctiy
Traceback (panggilan terakhir):
   File "<stdin>", baris 1, di <module>
NameError: nama 'ctiy' tidak didefinisikan
```

Sebuah kesalahan! Seperti yang Anda lihat, Python memiliki jenis kesalahan yang berbeda dan yang satu ini disebut **NameError**. Python akan memberi Anda kesalahan ini jika Anda mencoba menggunakan variabel yang belum didefinisikan. Jika Anda mengalami kesalahan ini nanti, periksa kode Anda untuk melihat apakah Anda salah mengetikkan nama apa pun.

Mainkan dengan ini untuk sementara dan lihat apa yang dapat Anda lakukan!

## Fungsi cetak

Coba ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Bila Anda mengetikkan `nama`, juru bahasa Python merespons dengan string *representasi* dari variabel 'nama', yaitu huruf M-a-r-i-a, dikelilingi oleh tanda kutip tunggal, ''. Bila Anda mengatakan `print (nama)`, Python akan "mencetak" isi variabel ke layar, tanpa tanda petik, yang lebih rapi.

Seperti yang akan kita lihat nanti, `print()` juga berguna saat kita ingin mencetak sesuatu dari fungsi di dalam, atau saat kita ingin mencetak berbagai hal pada banyak baris.

## Daftar

Selain string dan bilangan bulat, Python memiliki berbagai jenis objek. Sekarang kita akan mengenalkan satu daftar ** **. Daftar persis seperti yang Anda duga: objek yang merupakan daftar objek lain. :)

Silakan membuat daftar:

{% filename %}baris perintah{% endfilename %}

```python
>>> []
[]
```

Ya, daftar ini kosong. Tidak terlalu berguna kan? Mari buat daftar nomor undian. Kami tidak ingin mengulangi diri kami sepanjang waktu, jadi kami akan memasukkannya ke dalam variabel juga:

{% filename %}baris perintah{% endfilename %}

```python
>>> undian = [3, 42, 12, 19, 30, 59]
```

Baiklah, kita punya daftar! Apa yang bisa kita lakukan dengan itu? Mari kita lihat berapa jumlah undian yang ada dalam daftar. Apakah Anda tahu fungsi mana yang harus Anda gunakan untuk itu? Anda sudah tahu ini!

{% filename %}baris perintah{% endfilename %}

```python
>>> len(lottery)
6
```

Iya nih! `len()` dapat memberi Anda sejumlah objek dalam daftar. Berguna, kan? Mungkin kita akan mengatasinya sekarang:

{% filename %}baris perintah{% endfilename %}

```python
>>> lottery.sort()
```

Ini tidak mengembalikan apapun, itu hanya mengubah urutan nomor yang muncul dalam daftar. Ayo cetak lagi dan lihat apa yang terjadi:

{% filename %}baris perintah{% endfilename %}

```python
>>> cetak (undian)
[3, 12, 19, 30, 42, 59]
```

Seperti yang dapat Anda lihat, angka dalam daftar Anda sekarang diurutkan dari nilai terendah ke nilai tertinggi. Selamat!

Mungkin kita ingin membalikkan pesanan itu? Ayo lakukan itu!

{% filename %}baris perintah{% endfilename %}

```python
>>> lottery.reverse ()
>>> cetak (undian)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}baris perintah{% endfilename %}

```python
>>> lottery.append (199)
>>> cetak (undian)
[59, 42, 30, 19, 12, 3, 199]
```

Jika Anda hanya ingin menunjukkan angka pertama, Anda dapat melakukannya dengan menggunakan **indeks**. Sebuah indeks adalah angka yang mengatakan di mana dalam daftar sebuah item terjadi. Pemrogram lebih memilih untuk mulai menghitung pada 0, jadi objek pertama dalam daftar Anda ada di indeks 0, yang berikutnya adalah 1, dan seterusnya. Coba ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> cetak (undian[0])
59
>>> cetak (undian [1])
42
```

Seperti yang Anda lihat, Anda dapat mengakses berbagai objek dalam daftar Anda dengan menggunakan nama daftar dan indeks objek di dalam tanda kurung siku .

Untuk menghapus sesuatu dari daftar Anda, Anda perlu menggunakan ** indeks ** seperti yang telah kita pelajari di atas dan metode ` pop () ` . Mari coba contoh dan perkuat apa yang telah kita pelajari sebelumnya; kami akan menghapus nomor pertama dari daftar kami.

{% filename %}baris perintah{% endfilename %}

```python
>>> cetak (undian)
[59, 42, 30, 19, 12, 3, 199]
>>> cetak (undian[0])
59
>>> lottery.pop(0)
59
>>> cetak(undian)
[42, 30, 19, 12, 3, 199]
```

Itu bekerja seperti pesona!

Untuk kesenangan ekstra, cobalah beberapa indeks lainnya: 6, 7, 1000, -1, -6 atau -1000. Lihat apakah Anda bisa memprediksi hasilnya sebelum mencoba perintahnya. Apakah hasilnya masuk akal?

Anda dapat menemukan daftar semua metode daftar yang tersedia di bab dokumentasi Python ini: https://docs.python.org/3/tutorial/datastructures.html

## Kamus

> Bagi pembaca di rumah: bagian ini tercakup dalam [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

Kamus mirip dengan daftar, namun Anda mengakses nilai dengan mencari kunci alih-alih indeks numerik. Kunci bisa berupa string atau angka. Sintaks untuk mendefinisikan kamus kosong adalah:

{% filename %}baris perintah{% endfilename %}

```python
>>> {}
{}
```

Ini menunjukkan bahwa Anda baru saja membuat kamus kosong. Hore!

Sekarang, coba tuliskan perintah berikut (coba ganti informasi Anda sendiri juga):

{% filename %}baris perintah{% endfilename %}

```python
>>> peserta = {'nama': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Dengan perintah ini, Anda baru saja membuat sebuah variabel bernama `peserta` dengan tiga pasangan nilai kunci:

- Kunci `nama` menunjuk ke nilai `'Ola'` (a `string` objek),
- `negara` menunjuk ke `'Polandia'` (string `lainnya`),
- dan `favorite_numbers` menunjuk ke `[7, 42, 92]` (a `daftar` dengan tiga nomor di dalamnya).

Anda dapat memeriksa isi kunci individu dengan sintaks ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Lihat, ini mirip dengan daftar. Tapi Anda tidak perlu mengingat indeks - cukup namanya.

Apa yang terjadi jika kita meminta Python nilai sebuah kunci yang tidak ada? Bisakah kamu menebak? Mari kita coba dan lihat!

{% filename %}baris perintah{% endfilename %}

```python
>>> peserta['usia']
Traceback (panggilan terakhir):
  File "<stdin>", baris 1, di <module>
KeyError: 'usia'
```

Lihat, kesalahan lain! Yang ini adalah **KeyError**. Python sangat membantu dan memberitahu Anda bahwa kunci `'usia'` tidak ada dalam kamus ini.

Kapan sebaiknya Anda menggunakan kamus atau daftar? Nah, itu bagus untuk direnungkan. Pikirkan saja jawabannya sebelum melihat jawabannya di baris berikutnya.

- Apakah Anda hanya butuh urutan barang yang dipesan? Pergi untuk daftar.
- Apakah Anda perlu mengaitkan nilai dengan kunci, sehingga Anda dapat melihatnya secara efisien (dengan kunci) nanti? Gunakan kamus.

Kamus, seperti daftar, *bisa berubah*, artinya bisa diubah setelah dibuat. Anda dapat menambahkan pasangan kunci-nilai baru ke kamus setelah dibuat, seperti ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Seperti daftar, menggunakan metode `len()` pada kamus mengembalikan jumlah pasangan kunci-nilai dalam kamus. Silakan ketik perintah ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> len(participant)
4
```

Saya harap ini masuk akal sampai sekarang. :) Siap untuk bersenang-senang dengan kamus? Baca terus untuk beberapa hal yang menakjubkan.

Anda dapat menggunakan metode ` pop () ` untuk menghapus item dalam kamus. Katakan, jika Anda ingin menghapus entri yang sesuai dengan tombol `'favorite_numbers'`, ketik saja perintah berikut:

{% filename %}baris perintah{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Seperti yang dapat Anda lihat dari keluaran, pasangan kunci-nilai yang sesuai dengan kunci 'favorit_numbers' telah dihapus.

Serta ini, Anda juga dapat mengubah nilai yang terkait dengan kunci yang sudah dibuat di kamus. Ketik ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Seperti yang dapat Anda lihat, nilai kunci `'negara'` telah diubah dari `'Polandia'` ke `'Jerman'`. :) Menyenangkan? Hore! Anda baru saja belajar hal menakjubkan lainnya.

### Ikhtisar

Mengagumkan! Anda tahu banyak tentang pemrograman sekarang. Pada bagian terakhir ini Anda belajar tentang:

- **error** - Anda sekarang tahu bagaimana membaca dan memahami kesalahan yang muncul jika Python tidak mengerti perintah yang Anda berikan
- **variabel** - nama untuk objek yang memungkinkan kode Anda lebih mudah dan membuat kode Anda lebih mudah dibaca
- **daftar** - daftar objek yang tersimpan dalam urutan tertentu
- **kamus** - objek yang disimpan sebagai pasangan kunci-nilai

Bersemangat untuk bagian selanjutnya? :)

## Bandingkan hal-hal

> Bagi pembaca di rumah: bagian ini tercakup dalam [Dasar-dasar Python: Perbandingan](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

Sebagian besar pemrograman melibatkan perbandingan berbagai hal. Apa hal termudah untuk membandingkan? Bilangan, tentu saja. Mari kita lihat bagaimana cara kerjanya:

{% filename %}baris perintah{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
```

Kami memberi Python beberapa nomor untuk dibandingkan. Seperti yang bisa Anda lihat, Python tidak hanya bisa membandingkan angka, tapi juga bisa membandingkan hasil metode. Bagus, ya?

Apakah Anda bertanya-tanya mengapa kita menempatkan dua tanda sama ` == ` di sebelah satu sama lain untuk membandingkan apakah angka sama? Kami menggunakan satu ` = ` untuk menetapkan nilai pada variabel. Anda selalu, **selalu** perlu memasukkan dua dari mereka - `==` - jika Anda ingin memeriksa apakah semuanya sama satu sama lain. Kita juga dapat menyatakan bahwa hal-hal yang tidak setara satu sama lain. Untuk itu, kita menggunakan simbol ` ! = ` , seperti yang ditunjukkan pada contoh di atas.

Berikan Python dua tugas lagi:

{% filename %}baris perintah{% endfilename %}

```python
>>> 6 >= 12 / 2
Benar
>>> 3 < = 2
Salah
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y berarti: x lebih besar dari y
- x `<` y berarti: x kurang dari y
- x `<=` y berarti: x kurang dari atau sama dengan y
- x `>=` y berarti: x lebih besar dari atau sama dengan y

Mengagumkan! Mau melakukan satu lagi? Coba ini:

{% filename %}garis komando{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Anda dapat memberi Python sebanyak mungkin untuk membandingkan yang Anda inginkan, dan ini akan memberi Anda jawaban! Cukup pintar kan?

- **dan** - jika Anda menggunakan operator `dan`, kedua perbandingan harus benar agar keseluruhan perintah menjadi True
- **atau** - jika Anda menggunakan operator `atau`, hanya satu perbandingan yang harus Benar agar seluruh perintah menjadi Benar

Pernahkah Anda mendengar ungkapan "membandingkan apel dengan jeruk?" Mari kita coba yang setara dengan Python:

{% filename %}garis komando{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Di sini Anda melihat bahwa seperti dalam ekspresi, Python tidak dapat membandingkan angka (`int`) dan sebuah string (`str`). Sebagai gantinya, ini menunjukkan ** TypeError ** dan memberi tahu kita bahwa kedua jenis ini tidak dapat dibandingkan bersama-sama.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

Hanya ada dua objek Boolean:

- Benar
- Salah

Tapi bagi Python untuk memahami ini, Anda harus selalu menulisnya sebagai 'Benar' (huruf besar huruf pertama, dengan sisa huruf-hurufnya lebih rendah). **benar, BENAR, dan tRUE tidak akan bekerja - hanya Benar benar. ** (Hal yang sama juga berlaku untuk 'Salah' juga.)

Boolean bisa jadi variabel juga! Lihat disini:

{% filename %}baris perintah{% endfilename %}

```python
>>> a = benar
>>> a
Benar
```

Anda juga bisa melakukannya dengan cara ini:

{% filename %}baris perintah{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Berlatih dan bersenang-senang dengan Boolean dengan mencoba menjalankan perintah berikut:

- `Benar dan Benar`
- `Salah dan benar`
- `Benar atau 1 == 1`
- `1 != 2`

Selamat! Boolean adalah salah satu fitur paling keren dalam pemrograman, dan Anda baru saja belajar menggunakannya!

# Simpan itu!

> Untuk pembaca di rumah: bagian ini tercakup dalam [Dasar-dasar Python: Menyimpan file dan "Jika" pernyataan](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Sejauh ini kami telah menulis semua kode python kami di penerjemah, yang membatasi kami untuk memasukkan satu baris kode sekaligus. Program normal disimpan dalam file dan dieksekusi oleh bahasa pemrograman kita **penerjemah** atau **penyusun**. Sejauh ini kami telah menjalankan program kami satu baris sekaligus di Python **penerjemah**. Kita akan membutuhkan lebih dari satu baris kode untuk beberapa tugas berikutnya, jadi kita akan segera perlu:

- Keluar dari juru bahasa Python
- Buka editor pilihan kami
- Simpan beberapa kode ke file python baru
- Menjalankannya!

Untuk keluar dari interpreter Python bahwa kita telah menggunakan, cukup ketik `exit()` fungsi

{% filename %}baris perintah{% endfilename %}

```python
>>> exit()
$
```

Ini akan mengembalikan Anda ke command prompt.

Sebelumnya, kami memilih editor kode dari bagian [editor kode](../code_editor/README.md). Kita perlu membuka editor sekarang dan menulis beberapa kode ke file baru:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Jelas, Anda adalah pengembang Python yang cukup berpengalaman sekarang, jadi silakan menulis beberapa kode yang telah Anda pelajari hari ini.

Sekarang kita perlu menyimpan file dan memberikannya nama deskriptif. Mari kita panggil file ** python_intro.py ** dan simpan ke desktop Anda. Kita bisa menamai file apapun yang kita mau, tapi yang penting disini adalah memastikan file berakhir di ** .py ** . Ekstensi**.py** memberitahu sistem operasi kita bahwa ini adalah sebuah **Phyton file bisa dieksekusi** dan Phyton itu bisa berjalan.

> **Catatan** Anda harus memperhatikan salah satu hal yang paling keren tentang editor kode: warna! Di konsol Python, semuanya warnanya sama; Sekarang Anda harus melihat bahwa fungsi `print` adalah warna yang berbeda dari string. Ini disebut "penyorotan sintaks", dan ini adalah fitur yang sangat berguna saat mengkodekan. Warna benda akan memberi petunjuk, seperti string yang tidak ditutup atau salah ketik pada nama kata kunci (seperti ` def ` dalam sebuah fungsi, yang akan kita lihat di bawah). Inilah salah satu alasan kita menggunakan kode editor. :)

Dengan file yang tersimpan, saatnya untuk menjalankannya! Dengan menggunakan keahlian yang telah Anda pelajari di bagian baris perintah, gunakan terminal untuk **ubah direktori** ke desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Di Mac, perintahnya akan terlihat seperti ini:

{% filename %}baris perintah{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Di Linux, akan seperti ini (kata "Desktop" bisa diterjemahkan ke bahasa lokal Anda):

{% filename %}garis komando{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Pada Windows Command Prompt, akan seperti ini:

{% filename %}garis komando{% endfilename %}

    > cd %HomePath%\Deskop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Dan pada Windows Powershell, akan seperti ini:

{% filename %}baris perintah{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Jika Anda terjebak, mintalah bantuan.

Sekarang gunakan Python untuk mengeksekusi kode pada file seperti ini:

{% filename %}baris-perintah{% endfilename %}

    $ python3 python_intro.py Halo, Django girls!
    

Catatan: pada Windows 'python3' tidak dikenali sebagai perintah. Sebagai gantinya, gunakan 'python' untuk mengeksekusi file:

{% filename %}baris-perintah{% endfilename %}

```python
> python python_intro.py
```

Baik! Anda hanya menjalankan program Python pertama Anda yang disimpan ke sebuah file. Merasa mengagumkan

Anda sekarang dapat beralih ke alat penting dalam pemrograman:

## Jika ... elif ... lain

Banyak hal dalam kode harus dijalankan hanya bila kondisi yang diberikan terpenuhi. Itu sebabnya Python memiliki sesuatu yang disebut**jika pernyataan**.

Ganti kode di file **python_intro.py** Anda dengan ini:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Jika kita menyimpan dan menjalankan ini, kita akan melihat kesalahan seperti ini:

{% filename %}baris-perintah{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python mengharapkan kita untuk memberikan instruksi lebih lanjut untuk itu yang di eksekusi jika kondisi `3 > 2` ternyata benar (atau `Benar` dalam hal ini). Mari kita coba membuat tulisan Python "It works!". Ubah kode Anda di berkas **python_intro.py** Anda ke ini:

{% filename %}python_intro.py {% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Perhatikan bagaimana kita menjerumuskan baris kode berikut dengan 4 spasi? Kita perlu melakukan ini sehingga Python tahu kode apa yang harus dijalankan jika hasilnya benar. Anda bisa melakukan satu ruang, tapi hampir semua pemrogram Python melakukan 4 untuk membuat segalanya terlihat rapi. Tunggal `tab` juga akan dihitung sebagai 4 ruang.

Simpan dan berikan satu putaran lagi:

{% filename %}garis komando{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Catatan: Ingat bahwa di Windows, 'python3' tidak dikenali sebagai perintah. Mulai sekarang, ganti 'python3' dengan 'python' untuk mengeksekusi file.

### Bagaimana jika sebuah kondisi tidak benar?

Dalam contoh sebelumnya, kode hanya dijalankan bila kondisinya benar. Tapi Python juga punya `elif` dan `lain` pernyataan:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Saat ini dijalankan maka akan tercetak:

{% filename %}baris perintah{% endfilename %}

    $ python3 python_intro.py
    5 memang lebih besar dari 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

dan dieksekusi:

{% filename %}baris perintah{% endfilename %}

    $ python3 python_intro.py
    Hei Sonja!
    

Lihat apa yang terjadi disana? `elif` memungkinkan Anda menambahkan kondisi tambahan yang berjalan jika kondisi sebelumnya gagal.

Anda dapat menambahkan sebanyak `elif` pernyataan yang Anda inginkan setelah pernyataan `jika` awal Anda. Sebagai contoh:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python berjalan melalui setiap tes secara berurutan dan dicetak:

{% filename %}garis komando{% endfilename %}

    $ python3 python_intro.py Sempurna, saya bisa mendengar semua detailnya
    

## Komentar

Komentar adalah garis yang dimulai dengan `#`. Anda bisa menulis apapun yang Anda inginkan setelah `#` dan Python akan mengabaikannya. Komentar dapat membuat kode Anda lebih mudah dipahami oleh orang lain.

Mari kita lihat bagaimana tampilannya:

{% filename %} Pengantar_phyton.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

Anda tidak perlu menulis komentar untuk setiap baris kode, namun berguna untuk menjelaskan mengapa kode Anda melakukan sesuatu, atau memberikan ringkasan saat melakukan sesuatu yang rumit.

### Ikhtisar

Dalam beberapa latihan terakhir yang Anda pelajari:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** - jenis objek yang hanya bisa memiliki satu dari dua nilai: `Benar` atau`Salah`
- ** Simpan file** - menyimpan kode dalam file sehingga Anda bisa menjalankan program yang lebih besar.
- **jika…elif…lain** - pernyataan yang memungkinkan Anda untuk mengeksekusi kode hanya bila kondisi tertentu terpenuhi.
- **perintah** - baris yang tidak akan dijalankan Python yang memungkinkan Anda mendokumentasikan kode Anda

Waktu untuk bagian terakhir dari bab ini!

## Fungsi anda sendiri

> Bagi pembaca di rumah: bagian ini tercakup dalam video [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Ingat fungsi seperti `len ()`yang bisa Anda eksekusi dengan Python? Nah, kabar baik - Anda akan belajar bagaimana menulis sendiri fungsi Anda sekarang!

Fungsi adalah urutan instruksi yang harus dilakukan Python. Setiap fungsi di Python dimulai dengan kata kunci `def`, diberi nama, dan bisa memiliki beberapa parameter. Let's give it a go. Ganti kode di **python_intro.py** dengan mengikuti:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Oke, fungsi pertama kita sudah siap!

Anda mungkin bertanya-tanya mengapa kami menuliskan nama fungsi di bagian bawah file. Ini karena Python membaca file dan mengeksekusinya dari atas ke bawah. Jadi untuk menggunakan fungsi kita, kita harus menulis ulang di bagian bawah.

Ayo jalankan ini sekarang dan lihat apa yang terjadi:

{% filename %}garis komando{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Catatan: jika tidak berhasil, jangan panik! keluarannya akan membantu Anda untuk mengetahui mengapa:

- Jika Anda mendapatkan `kesalahan nama`, itu mungkin berarti Anda mengetikkan sesuatu yang salah, jadi Anda harus memeriksa bahwa Anda menggunakan nama yang sama saat membuat fungsi dengan `def hi():` dan kapan memanggilnya dengan `hi()`.
- Jika Anda mendapatkan `IndentationError`, periksalah bahwa kedua baris `cetak` memiliki spasi yang sama di awal baris: python menginginkan semua kode di dalam fungsi disesuaikan dengan rapi.
- Jika tidak ada output sama sekali, periksa apakah yang terakhir `hi()` *tidak* indentasi - jika memang demikian, baris itu juga akan menjadi bagian dari fungsi, dan itu akan tidak pernah lari.

Mari kita bangun fungsi pertama kita dengan parameter. Kami akan menggunakan contoh sebelumnya - sebuah fungsi yang mengatakan 'hai' kepada orang yang menjalankannya - dengan sebuah nama:

{% filename %}python_intro.py{% endfilename %}

```python
def hi (nama):
```

Seperti yang bisa Anda lihat, sekarang kami memberi parameter fungsi yang kami namakan `nama`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Ingat: Fungsi `print` adalah indentasi empat spasi di dalam `jika`pernyataan. Ini karena fungsinya berjalan saat kondisinya terpenuhi. Mari kita lihat bagaimana cara kerjanya sekarang:

{% filename %}garis komando{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, terjadi kesalahan. Untungnya, Python memberi kita pesan kesalahan yang cukup berguna. Ini memberitahu kita bahwa fungsinya `hi()` (yang kita definisikan) memiliki satu argumen yang dibutuhkan (panggilan `nama`) dan bahwa kita lupa melewatinya saat memanggil fungsinya. Mari kita memperbaikinya di bagian bawah file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

Dan jika kita mengganti namanya?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Dan jalankan:

{% filename %}baris perintah {% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Nah, apa yang menurut Anda akan terjadi jika Anda menulis nama lain di sana? (Bukan Ola atau Sonja.) Cobalah dan lihat apakah Anda benar. Ini harus mencetak ini:

{% filename %} baris perintah {% endfilename %}

    Hai anonim!
    

Ini luar biasa kan? Dengan cara ini Anda tidak perlu mengulanginya sendiri setiap kali Anda ingin mengubah nama orang yang seharusnya disapanya. Dan itulah mengapa kita membutuhkan fungsi - Anda tidak ingin mengulang kode Anda!

Mari kita melakukan sesuatu yang lebih pintar - ada lebih banyak nama daripada dua, dan menulis sebuah kondisi untuk masing-masing akan sulit, bukan?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Mari kita panggil kode sekarang:

{% filename %}baris perintah{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Selamat! Anda baru saja belajar bagaimana menulis fungsi! :)

## Loops

> Bagi pembaca di rumah: bagian ini tercakup dalam [Dasar-dasar Python: Untuk video Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).

Ini adalah bagian terakhir. Itu cepat kan? :)

Pemrogram tidak suka mengulanginya sendiri. Pemrograman adalah tentang mengotomatisasi berbagai hal, jadi kita tidak ingin menyapa setiap orang dengan nama mereka secara manual, bukan? Di situlah loop berguna.

Masih ingat daftar? Mari kita daftar anak perempuan:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Kami ingin menyapa mereka semua dengan nama mereka. Kami memiliki fungsi `hi` untuk melakukan itu, jadi mari kita gunakan dalam satu lingkaran:

{% filename %}python_intro.py{% endfilename %}

```python
untuk nama pada anak perempuan:
```

Itu ```untuk``` pernyataan berperilaku serupa dengan ```jika``` pernyataan; kode di bawah kedua ini perlu indentasi empat spasi.

Berikut adalah kode lengkap yang akan ada di file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Dan saat kita menjalankannya:

{% filename %}baris perintah{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl
    

Seperti yang dapat Anda lihat, semua yang Anda masukkan ke dalam pernyataan `untuk` dengan indent akan diulang untuk setiap elemen dari daftar `girls`.

Anda juga dapat menggunakan `untuk` pada nomor dengan menggunakan fungsi `range`:

{% filename %}python_intro.py{% endfilename %}

```python
untuk saya di kisaran (1, 6):
    cetak(i)
```

Yang akan dicetak:

{% filename %}baris perintah{% endfilename %}

    1
    2
    3
    4
    5
    

`jarak` adalah fungsi yang membuat daftar angka yang mengikuti satu demi satu (angka-angka ini disediakan oleh Anda sebagai parameter).

Perhatikan bahwa kedua dari kedua angka ini tidak termasuk dalam daftar yang dihasilkan oleh Python (artinya `jarak(1, 6)` dihitung dari 1 sampai 5, namun tidak termasuk angka 6). Itu karena "range" setengah terbuka, dan dengan itu kita maksudkan itu termasuk nilai pertama, tapi bukan yang terakhir.

## Ikhtisar

Itu dia. **Kamu benar-benar rock!** Ini adalah bab yang rumit, jadi Anda harus merasa bangga pada diri sendiri. Kami pasti bangga dengan Anda karena sejauh ini berhasil!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)