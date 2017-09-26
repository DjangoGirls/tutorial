# Apa itu Django ?

Django (/ˈdʒæŋɡoʊ/ *jang-goh*) is a free and open source web application framework, written in Python. Sebuah framework web adalah sebuah set komponen-komponen yang dapat membantu anda untuk mengembangkan website dengan lebih cepat dan mudah.

Ketika anda sedang membangun sebuah website, anda akan selalu berurusan dengan hal-hal serupa misalnya bagaimana menangani autentikasi user (sign up, sign in dan sign out), panel pengelolaan website, form-form, bagaimana mengupload file dan sebagianya.

Luckily for you, other people long ago noticed that web developers face similar problems when building a new site, so they teamed up and created frameworks (Django being one of them) that give you ready-made components to use.

Frameworks exist to save you from having to reinvent the wheel and to help alleviate some of the overhead when you’re building a new site.

## Mengapa anda memerlukan sebuah framework?

To understand what Django is actually for, we need to take a closer look at the servers. The first thing is that the server needs to know that you want it to serve you a web page.

Bayangkanlah sebuah mailbox/kotak surat (port), yang selalu dimonitor untuk mengetahui apakah ada surat masuk (request). Ini dikerjakan oleh server. The web server reads the letter and then sends a response with a webpage. Akan tetapi, ketika anda ingin mengirimkan sesuatu, anda perlu menyiapkan isinya. Dan django akan membantu anda membuat isinya.

## Apa yang terjadi ketika seseorang membuka halaman web di server anda ?

When a request comes to a web server, it's passed to Django which tries to figure out what is actually requested. It takes a web page address first and tries to figure out what to do. This part is done by Django's **urlresolver** (note that a website address is called a URL – Uniform Resource Locator – so the name *urlresolver* makes sense). It is not very smart – it takes a list of patterns and tries to match the URL. Django checks patterns from top to bottom and if something is matched, then Django passes the request to the associated function (which is called *view*).

Bayangkanlah ada petugas pengantar surat membawa sebuah surat. Ia menelusuri jalan dan mengecek tiap nomor rumah apakah cocok dengan alamat pada surat. Jika cocok, ia akan mengantarkan ke sana. Begitulah cara kerja urlresolver!

In the *view* function, all the interesting things are done: we can look at a database to look for some information. Munkin si user ingin mengubah data? Like a letter saying, "Please change the description of my job." The *view* can check if you are allowed to do that, then update the job description for you and send back a message: "Done!" Then the *view* generates a response and Django can send it to the user's web browser.

Tentu saja diskripsi tadi agak disederhanakan, toh sejauh ini anda tak perlu tahu segala sesuatu yang sangat teknis dulu. Mengerti yang umum-umum dulu sudah cukup.

Jadi, kita tidak akan belajar segala sesuatunya langsung secara detail, tetapi kita akan membuat sesuatu dengan django dan hal-hal penting lainnya sambil berjalan!