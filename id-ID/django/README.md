# Apa itu Django?

Django (/ dʒæŋɡoʊ/ *jang-goh*) adalah framework aplikasi web open source dan open source yang ditulis dengan Python. Sebuah framework web adalah sebuah set komponen-komponen yang dapat membantu anda untuk mengembangkan website dengan lebih cepat dan mudah.

Ketika anda sedang membangun sebuah website, anda akan selalu berurusan dengan hal-hal serupa misalnya bagaimana menangani autentikasi user (sign up, sign in dan sign out), panel pengelolaan website, form-form, bagaimana mengupload file dan sebagianya.

Beruntung bagi Anda, orang lain lama sekali menyadari bahwa pengembang web menghadapi masalah yang sama saat membangun situs baru, jadi mereka bekerja sama dan menciptakan kerangka kerja (Django menjadi salah satunya) yang memberi Anda komponen siap pakai untuk digunakan.

Kerangka ada untuk menyelamatkan Anda dari keharusan menemukan kembali kemudi dan membantu meringankan sebagian overhead saat Anda membangun situs baru.

## Mengapa anda memerlukan sebuah framework?

Untuk memahami apa sebenarnya Django, kita perlu melihat lebih dekat pada server. Hal pertama adalah bahwa server perlu tahu bahwa Anda ingin melayani Anda sebuah halaman web.

Bayangkanlah sebuah mailbox/kotak surat (port), yang selalu dimonitor untuk mengetahui apakah ada surat masuk (request). Ini dikerjakan oleh server. Server web membaca surat tersebut dan kemudian mengirimkan tanggapan dengan sebuah halaman web. Akan tetapi, ketika anda ingin mengirimkan sesuatu, anda perlu menyiapkan isinya. Dan django akan membantu anda membuat isinya.

## Apa yang terjadi ketika seseorang membuka halaman web di server anda?

Ketika permintaan datang ke server web, itu diteruskan ke Django yang mencoba untuk mencari tahu apa yang sebenarnya diminta. Dibutuhkan alamat halaman web terlebih dahulu dan mencoba untuk mencari tahu apa yang harus dilakukan. Bagian ini dilakukan oleh Django **urlresolver** (perhatikan bahwa alamat situs web disebut URL - Uniform Resource Locator - jadi nama *urlresolver* masuk akal). Ini tidak terlalu cerdas - dibutuhkan daftar pola dan mencoba mencocokkan URL. Django memeriksa pola dari atas ke bawah dan jika ada yang cocok, maka Django meneruskan permintaan ke fungsi yang terkait (yang disebut *view*).

Bayangkanlah ada petugas pengantar surat membawa sebuah surat. Ia menelusuri jalan dan mengecek tiap nomor rumah apakah cocok dengan alamat pada surat. Jika cocok, ia akan mengantarkan ke sana. Begitulah cara kerja urlresolver!

Pada fungsi *view*, semua hal menarik dilakukan: kita bisa melihat database untuk mencari beberapa informasi. Munkin si user ingin mengubah data? Seperti sepucuk surat yang berbunyi, "Tolong ubah deskripsi pekerjaan saya." The *pandangan* dapat memeriksa apakah Anda diperbolehkan untuk melakukan itu, kemudian memperbarui deskripsi pekerjaan untuk Anda dan mengirim kembali pesan: "! Selesai" Kemudian *pandangan* menghasilkan respon dan Django dapat mengirimkannya ke web browser pengguna.

Deskripsi di atas agak disederhanakan, tapi Anda tak perlu tahu segala sesuatu yang sangat teknis dulu. Mengerti yang umum-umum dulu sudah cukup.

Jadi, kita tidak akan belajar segala sesuatunya langsung secara detail, tetapi kita akan mulai membuat sesuatu dengan Django dan kita akan belajar semua hal penting sambil berjalan!