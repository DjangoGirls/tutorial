# Bagaimana Internet Bekerja

> Bagi pembaca di rumah: bab ini tercakup dalam video [How the Internet Works](https://www.youtube.com/watch?v=oM9yAA09wdc).
> 
> Bab ini terinspirasi oleh pembicaraan "Bagaimana Internet bekerja" oleh Jessica McKellar (http://web.mit.edu/jesstess/www/).

Kami yakin Anda menggunakan internet setiap hari. Tapi apakah Anda benar-benar tahu apa yang terjadi saat Anda mengetikkan alamat seperti https://djangogirls.org ke browser Anda dan tekan `enter`?

The first thing you need to understand is that a website consists of a bunch of files saved on a hard disk. Sama seperti film, musik, atau gambar Anda. Namun, ada satu bagian yang unik untuk situs web: termasuk kode komputer yang disebut HTML.

Jika Anda tidak terbiasa dengan pemrograman, akan sulit untuk memahami HTML pada awalnya, namun browser web Anda (seperti Chrome, Safari, Firefox, dll.) Menyukainya. Browser web dirancang untuk memahami kode ini, ikuti instruksinya, dan tunjukkan file-file ini yang dibuat oleh situs web Anda, persis seperti yang Anda inginkan.

Seperti pada setiap file, kita perlu menyimpan file HTML di suatu tempat pada hard disk. Untuk internet, kami menggunakan khusus, kuat komputer disebut *server*. Mereka tidak memiliki layar, mouse atau keyboard, karena mereka tujuan utama adalah untuk menyimpan data dan melayani. Itu sebabnya mereka disebut *server* - karena mereka *melayani* data Anda.

OK, tapi Anda ingin tahu bagaimana internet terlihat, kan?

Kami menggambarmu! Sepertinya ini:

![Gambar 1.1](images/internet_1.png)

Sepertinya berantakan, kan? Bahkan itu adalah jaringan mesin yang terhubung (yang disebutkan di atas * server </ 0> ). Ratusan ribu mesin! Banyak, banyak kilometer dari kabel di seluruh dunia! Anda dapat mengunjungi kabel bawah laut peta situs web (http://submarinecablemap.com) untuk melihat bagaimana rumit net. Berikut adalah screenshot dari website:</p> 

![Gambar 1.2](images/internet_3.png)

Hal ini menarik, bukan? But it is not possible to have a wire between every machine connected to the Internet. Jadi, untuk mencapai mesin (misalnya, satu di mana https://djangogirls.org disimpan) kita perlu lulus permintaan melalui banyak, banyak mesin yang berbeda.

Itu tampak seperti ini:

![Gambar 1.3](images/internet_2.png)

Bayangkan bahwa ketika Anda mengetik https://djangogirls.org, Anda mengirim surat yang berbunyi: "Dear Django Girls, saya ingin melihat situs djangogirls.org, kirimkan kepada saya, please!"

Surat Anda ke kantor pos terdekat dengan Anda. Kemudian pergi ke yang lain yang sedikit lebih dekat ke penerima Anda, lalu ke yang lain, dan yang lainnya sampai dikirim ke tempat tujuannya. Satu-satunya hal yang unik adalah jika Anda mengirim banyak surat ( * paket data * ) ke tempat yang sama, mereka bisa melalui kantor pos yang sama sekali berbeda ( * router * ). Hal ini tergantung bagaimana mereka didistribusikan di setiap kantor.

![Gambar 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Instead of paper and pen you use bytes of data, but the idea is the same!

Alih-alih alamat dengan nama jalan, kota, kode pos dan nama negara, kita menggunakan alamat IP. Komputer Anda pertama kali meminta DNS (Domain Name System) untuk menerjemahkan djangogirls.org ke alamat IP. Ini bekerja sedikit seperti buku telepon kuno di mana Anda dapat mencari nama orang yang ingin Anda hubungi dan menemukan nomor telepon dan alamat mereka.

Bila Anda mengirim surat, perlu ada fitur tertentu yang bisa disampaikan dengan benar: alamat, stempel, dll. Anda juga menggunakan bahasa yang dipahami oleh penerima, bukan? Hal yang sama berlaku untuk paket data * * yang Anda kirim untuk melihat situs web. Kami menggunakan protokol yang disebut HTTP (Hypertext Transfer Protocol).

Jadi, pada dasarnya, jika Anda memiliki situs web, Anda harus memiliki *server* (mesin) tempat tinggalnya. Ketika * server * menerima permintaan * masuk * (dalam sebuah surat), ia akan mengirimkan kembali situs Anda (dalam surat lain).

Karena ini adalah tutorial Django, Anda mungkin bertanya apa yang Django lakukan. Bila Anda mengirim tanggapan, Anda tidak selalu ingin mengirimkan hal yang sama kepada semua orang. Jauh lebih baik jika surat Anda dipersonalisasi, terutama untuk orang yang baru saja menulis surat kepada Anda, bukan? Django membantu Anda membuat surat yang dipersonalisasi dan menarik ini. :)

Cukup waktu bicara untuk menciptakan!