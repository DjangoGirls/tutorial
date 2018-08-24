# Apa itu Django?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Rangka kerja web adalah satu set komponen yang membantu anda mengembangkan laman web dengan lebih cepat dan lebih mudah.

Apabila anda membina laman web, anda sentiasa memerlukan set komponen yang serupa: cara untuk mengendalikan pengesahan pengguna (mendaftar, melog masuk, melog masuk), panel pengurusan untuk laman web anda, borang, cara untuk memuat naik fail, dan lain-lain.

Nasib baik untuk anda, orang lain lama dahulu menyedari bahawa pembangun web menghadapi masalah yang sama ketika membina laman web baru, jadi mereka bekerja sama dan membuat kerangka kerja (Django menjadi salah satu dari mereka) yang memberikan komponen siap pakai untuk digunakan.

Rangka kerja ada untuk menyelamatkan anda daripada mencipta semula roda dan membantu mengurangkan beberapa overhead apabila anda sedang membina laman web baru.

## Mengapa anda memerlukan rangka kerja?

Untuk memahami apa sebenarnya Django, kita perlu melihat lebih dekat pada pelayan. Perkara pertama adalah bahawa pelayan perlu tahu bahawa anda mahu ia melayani anda halaman web.

Bayangkan peti mel (port) yang dipantau untuk surat masuk ( permintaan ). Ini dilakukan oleh pelayan web. Pelayan web membaca surat itu dan kemudian menghantar respons dengan halaman web. Tetapi apabila anda mahu menghantar sesuatu, anda perlu mempunyai beberapa kandungan. Dan Django adalah sesuatu yang membantu anda membuat kandungan.

## Apa yang berlaku apabila seseorang meminta tapak web dari pelayan anda?

Apabila permintaan datang ke pelayan web, ia diluluskan kepada Django yang cuba memikirkan apa yang sebenarnya diminta. Ia mengambil alamat laman web terlebih dahulu dan cuba mencari tahu apa yang harus dilakukan. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). Ia tidak terlalu pintar - ia memerlukan senarai corak dan cuba memadankan URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Bayangkan pembawa mel dengan surat. Dia sedang berjalan di jalan dan memeriksa setiap nombor rumah di atas surat itu. Sekiranya ia sepadan, dia meletakkan surat itu di sana. Inilah cara kerja urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Mungkin pengguna diminta mengubah sesuatu dalam data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

The description above is a little bit simplified, but you don't need to know all the technical things yet. Having a general idea is enough.

So instead of diving too much into details, we will start creating something with Django and we will learn all the important parts along the way!