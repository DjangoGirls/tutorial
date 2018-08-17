# Bagaimana Internet berfungsi

> Untuk pembaca di rumah: bab ini adalah dilindungi dalam [Bagaimana Internet Berfungsi](https://www.youtube.com/watch?v=oM9yAA09wdc) video.
> 
> This chapter is inspired by the talk "How the Internet works" by Jessica McKellar (http://web.mit.edu/jesstess/www/).

Kami yakin anda menggunakan Internet setiap hari. Tapi apakah anda benar-benar tahu apa yang terjadi ketika anda jenis alamat seperti https://djangogirls.org ke pelayar anda dan tekan `masuk`?

Perkara pertama yang kau harus faham bahawa laman web adalah hanya sekelompok fail yang disimpan pada hard disk. Hanya seperti filem anda, music, atau gambar. Bagaimanapun, ada satu bagian yang unik untuk laman websites: mereka termasuk kode komputer yang dipanggil HTML.

Jika anda tidak akrab dengan program itu akan sulit untuk memahami HTML pada mulanya, tetapi anda web browser (seperti Chrome, Safari, Firefox, dan lain-lain.) cinta itu. Web browser direka untuk memahami kode ini, mengikut arahan, dan sekarang ini fail bahawa laman web anda dibuat, persis seperti yang anda inginkan.

Seperti dengan setiap file, kita perlu simpan fail HTML di suatu tempat di hard disk. For the Internet, we use special, powerful computers called *servers*. They don't have a screen, mouse or a keyboard, because their main purpose is to store data and serve it. That's why they're called *servers* – because they *serve* you data.

OK, but you want to know how the Internet looks, right?

We drew you a picture! It looks like this:

![Rajah 1.1](images/internet_1.png)

Looks like a mess, right? In fact it is a network of connected machines (the above-mentioned *servers*). Hundreds of thousands of machines! Many, many kilometers of cables around the world! Anda boleh mengunjungi sebuah kapal Selam Kabel Peta website (http://submarinecablemap.com) untuk melihat bagaimana rumit bersih. Here is a screenshot from the website:

![Rajah 1.2](images/internet_3.png)

It is fascinating, isn't it? But obviously, it is not possible to have a wire between every machine connected to the Internet. Jadi, untuk mencapai satu mesin (sebagai contoh, satu di mana https://djangogirls.org disimpan) kita perlu lulus permintaan melalui banyak, banyak mesin yang berbeza.

It looks like this:

![Rajah 1.3](images/internet_2.png)

Bayangkan bahwa ketika anda jenis https://djangogirls.org, yang anda kirim surat yang mengatakan: "Dear Django Girls, aku ingin melihat djangogirls.org web. Kirimkan ke saya, silakan!"

Your letter goes to the post office closest to you. Kemudian ia pergi untuk yang lain, yang sedikit lebih dekat dengan anda penerima, kemudian yang lain, dan lain sehingga ia dihantar di destinasi. Satu-satunya yang unik adalah bahawa jika anda banyak mengirim surat (*paket data*) ke tempat yang sama, mereka bisa pergi melalui benar-benar berbeza pejabat pos (*penghala*). This depends on how they are distributed at each office.

![Rajah 1.4](images/internet_4.png)

That's how it works - you send messages and you expect some response. Of course, instead of paper and pen you use bytes of data, but the idea is the same!

Bukan alamat dengan nama jalan, bandar, zip code dan nama negara, kami menggunakan alamat IP. Komputer pertama meminta DNS (Nama Domain Sistem) untuk menterjemahkan djangogirls.org ke alamat IP. Ia berfungsi sedikit seperti lama buku telefon di mana anda boleh melihat ke atas nama orang yang anda mahu untuk menghubungi dan mencari mereka nomor telepon dan alamat.

Ketika anda mengirimkan surat, ia perlu mempunyai ciri-ciri tertentu yang akan dihantar dengan betul: alamat, perangko, dan lain-lain. Kau juga menggunakan bahasa yang penerima memahami, kan? The same applies to the *data packets* you send to see a website. We use a protocol called HTTP (Hypertext Transfer Protocol).

So, basically, when you have a website, you need to have a *server* (machine) where it lives. When the *server* receives an incoming *request* (in a letter), it sends back your website (in another letter).

Since this is a Django tutorial, you might ask what Django does. Ketika kau mengirim seorang tindak balas, anda tidak selalu ingin menghantar hal yang sama untuk semua orang. Ia adalah jauh lebih baik jika surat-surat anda adalah peribadi, terutama untuk orang yang telah ditulis untuk anda, kan? Django helps you with creating these personalized, interesting letters. :)

Enough talk – time to create!