# CSS - mempercantik tampilan!

Blog yang kita buat masih terlihat monoton, bukan? Nah, sekarang waktunya untuk mempercantik tampilannya! Kita akan menggunakan CSS untuk itu.

## Apa itu CSS?

Cascading Style Sheets (CSS) adalah bahasa yang digunakan untuk mempresentasikan tampilan dan format situs web yang ditulis dalam bahasa markup (seperti HTML). Gunakan itu sebagai mekap untuk halaman web kita. ;)

Tapi kita tidak ingin melakukan itu (mempercantik) dari nol, bukan? Sekali lagi, kita akan menggunakan sesuatu yang telah pemrogram buat dan itu bisa digunakan secara gratis. Dan itu bisa mempersingkat waktu kita untuk membuat situs web, tepatnya blog.

## Mari kita gunakan Bootstrap!

Bootstrap adalah salah satu kerangka kerja untuk HTML dan CSS yang paling populer untuk mengembangkan situs web yang menarik: https://getbootstrap.com/

Bootstap ini ditulis oleh pemrogram yang bekerja untuk Twitter. Dan sekarang ini dikembangkan oleh sukarelawan dari seluruh dunia!

## Memasang Bootstrap

Untuk memasang Bootstap, bukan file berekstensi `.html` di editor kode dan tambahkan kode ini di dalam elemen HTML `<head>`

<head>
  </1>:</p> 
  
  <p>
    {% filename%} blog / templates / blog / post_list.html {% endfilename%}
  </p>
  
  <pre><code class="html">&lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"&gt; 
&lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"&gt;
</code></pre>
  
  <p>
    This doesn't add any files to your project. It just points to files that exist on the Internet. So go ahead, open your website and refresh the page. Here it is!
  </p>
  
  <p>
    <img src="images/bootstrap1.png" alt="Gambar 14.1" />
  </p>
  
  <p>
    Melihat lebih baik sudah!
  </p>
  
  <h2>
    Static files di Django
  </h2>
  
  <p>
    Mari kita bahas apa itu <strong>static files</strong>. Static files are all your CSS and images. Konten mereka tidak bergantung pada konteks permintaan dan akan sama untuk setiap pengguna.
  </p>
  
  <h3>
    Dimana menyimpan static files untuk Django
  </h3>
  
  <p>
    Django already knows where to find the static files for the built-in "admin" app. Now we need to add some static files for our own app, <code>blog</code>.
  </p>
  
  <p>
    Kita melakukan itu dengan cara membuat folder bernama <code>static</code> didalam blog app:
  </p>
  
  <pre><code>djangogirls ├── blog │ ├── migrasi │ ├── static │   └── template └── mysite
</code></pre>
  
  <p>
    Django secara otomatis akan menemukan folder yang disebut "statis" di dalam folder aplikasi Anda. Maka akan bisa menggunakan isinya sebagai file statis.
  </p>
  
  <h2>
    File CSS pertama mu!
  </h2>
  
  <p>
    Mari buat file CSS sekarang, untuk menambahkan gaya Anda sendiri ke halaman web Anda. Buat sebuah folder bernama <code>css</code> di dalam folder <code>static</code>. Kemudian buat sebuah file bernama <code>blog.css</code> di dalam folder <code>css</code>. Siap?
  </p>
  
  <pre><code>djangogirls
└─── blog
     └─── static
          └─── css
               └─── blog.css
</code></pre>
  
  <p>
    Saatnya menulis CSS! Buka file <code>blog/static/css/blog.css</code> kedalam teks editor mu.
  </p>
  
  <p>
    Kami tidak akan terlalu mendalam dalam menyesuaikan dan mempelajari tentang CSS di sini. Ada rekomendasi untuk pembelajaran CSS secara gratis di akhir halaman ini jika anda ingin belajar lebih banyak.
  </p>
  
  <p>
    Tapi mari kita lakukan setidaknya sedikit. Maybe we could change the color of our headers? Untuk memahami warna, komputer menggunakan kode khusus. Kode ini dimulai dengan <code> # &lt;/ 0> diikuti oleh 6 huruf (A-F) dan angka (0-9). Misalnya, kode biru adalah &lt;code> # 0000FF &lt;/ 0> . Anda dapat menemukan kode warna untuk banyak warna di sini: http://www.colorpicker.com/. Anda juga dapat menggunakan &lt;a href="http://www.w3schools.com/colors/colors_names.asp"> warna yang telah ditetapkan &lt;/ 0> , seperti &lt;code> merah &lt;/ 1> dan &lt;code> hijau &lt;/ 1> .&lt;/p>

&lt;p>Dalam berkas &lt;code>blog/static/css/blog.css</code> kamu harus ditambahkan kode seperti berikut:
  </p>
  
  <p>
    {% filename %}blog/static/css/blog.css{% endfilename %}
  </p>
  
  <pre><code class="css">h1 a, h2 a {
    color: #C25100;
}

</code></pre>
  
  <p>
    <code>h1 a</code> adalah selector dalam CSS. This means we're applying our styles to any <code>a</code> element inside of an <code>h1</code> element; the <code>h2 a</code> selector does the same thing for <code>h2</code> elements. Jadi ketika kita memiliki sesuatu seperti <code>&lt;h1&gt;&lt;a href=""&gt; link &lt;/ 0> , style &lt;code> h1 a &lt;/ 1> akan berlaku. In this case, we're telling it to change its color to &lt;code>#C25100</code>, which is a dark orange. Or you can put your own color here, but make sure it has good contrast against a white background!
  </p>
  
  <p>
    Dalam berkas CSS kita menentukan styles untuk elemen yang berada pada berkas HTML. Cara pertama kita mengidentifikasi elemen adalah dengan nama elemen. Anda mungkin ingat ini sebagai tag dari bagian HTML. Hal-hal seperti <code> a &lt;/ 0> , &lt;code> h1 &lt;/ 0> , dan &lt;code> body &lt;/ 0> adalah contoh nama elemen.
Kami juga mengidentifikasi elemen dengan atribut &lt;code> class &lt;/ 0> atau atribut &lt;code> id &lt;/ 0> . Class dan id adalah nama-nama elemen yang kamu berikan sendiri. Class-class mendefinisikan kelompok-kelompok elemen, dan id menunjuk pada elemen khusus. Misalnya, Anda dapat mengidentifikasi tag berikut dengan menggunakan nama tag &lt;code> a &lt;/ 0> , kelas &lt;code> external_link &lt;/ 0> , atau id &lt;code> link_to_wiki_page &lt;/ 0> :&lt;/p>

&lt;pre>&lt;code class="html">&lt;a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page"&gt;
</code></pre> 
    
    <p>
      Anda dapat membaca lebih lanjut tentang <a href="http://www.w3schools.com/cssref/css_selectors.asp"> CSS Selectors di w3schools </ 0> .</p> 
      
      <p>
        We also need to tell our HTML template that we added some CSS. Open the <code>blog/templates/blog/post_list.html</code> file in the code editor and add this line at the very beginning of it:
      </p>
      
      <p>
        {% filename%} blog / templates / blog / post_list.html {% endfilename%}
      </p>
      
      <pre><code class="html">{% load static %}
</code></pre>
      
      <p>
        Kami hanya memuatkan file statis di sini. :) Antara tag <code>&lt;head&gt;</code> dan <code> &lt;/ 2> &lt;/ 1> , setelah link ke file CSS Bootstrap, tambahkan baris ini:&lt;/p>

&lt;p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="html">&lt;link rel="stylesheet" href="{% static 'css/blog.css' %}"&gt;
</code></pre> 
        
        <p>
          Browser membaca file sesuai urutan yang mereka berikan, jadi kita perlu memastikan ini ada di tempat yang tepat. Jika tidak, kode di file kami mungkin akan diganti dengan kode di file Bootstrap. Kami hanya memberi tahu template kami dimana file CSS kami berada.
        </p>
        
        <p>
          File Anda seharusnya terlihat seperti ini:
        </p>
        
        <p>
          {% filename%} blog / templates / blog / post_list.html {% endfilename%}
        </p>
        
        <pre><code class="html">{% load static %}
&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;Django Girls blog&lt;/title&gt;
        &lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"&gt;
        &lt;link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"&gt;
        &lt;link rel="stylesheet" href="{% static 'css/blog.css' %}"&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div&gt;
            &lt;h1&gt;&lt;a href="/"&gt;Django Girls Blog&lt;/a&gt;&lt;/h1&gt;
        &lt;/div&gt;

        {% for post in posts %}
            &lt;div&gt;
                &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
                &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
                &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
            &lt;/div&gt;
        {% endfor %}
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
        
        <p>
          OK, simpan file dan refresh situsnya
        </p>
        
        <p>
          <img src="images/color2.png" alt="Gambar 14.2" />
        </p>
        
        <p>
          Kerja bagus! Mungkin kita juga ingin memberi website kita sedikit udara dan meningkatkan margin di sisi kiri? Ayo coba ini!
        </p>
        
        <p>
          {% filename%} blog / static / css / blog.css {% endfilename%}
        </p>
        
        <pre><code class="css">badan {
     padding-left: 15px; }
</code></pre>
        
        <p>
          Tambahkan itu ke CSS Anda, simpan file dan lihat hasilnya!
        </p>
        
        <p>
          <img src="images/margin2.png" alt="Gambar 14.3" />
        </p>
        
        <p>
          Mungkin kita bisa menyesuaikan font di header kita? Tempel ini ke file <code>&lt;head&gt;</code> di <code> blog / templates / blog / post_list.html &lt;/ 1> Anda :&lt;/p>

&lt;p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="html">&lt;link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css"&gt;
</code></pre> 
          
          <p>
            Seperti sebelumnya, periksa urutan dan tempat sebelum link ke <code> blog / static / css / blog.css &lt;/ 0> . Baris ini akan mengimpor font yang disebut &lt;em> Lobster &lt;/ 1> dari Google Fonts (https://www.google.com/fonts).&lt;/p>

&lt;p>Temukan blok deklarasi &lt;code> h1 a &lt;/ 0> (kode antara tanda kurung &lt;code> { &lt;/ 0> dan &lt;code> } &lt;/ 0> ) di file CSS &lt;code> blog / static / css / blog .css &lt;/ 0> .  Sekarang tambahkan baris &lt;code> font-family: 'Lobster'; &lt;/ 0> di antara kawat gigi, dan segarkan halaman:&lt;/p>

&lt;p>{% filename%} blog / static / css / blog.css {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="css">h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
</code></pre> 
            
            <p>
              <img src="images/font.png" alt="Gambar 14.3" />
            </p>
            
            <p>
              Besar!
            </p>
            
            <p>
              Seperti disebutkan di atas, CSS memiliki konsep kelas. Ini memungkinkan Anda memberi nama bagian dari kode HTML dan menerapkan gaya hanya pada bagian ini, tanpa mempengaruhi bagian lain. Ini bisa sangat membantu! Mungkin Anda memiliki dua divs yang melakukan sesuatu yang berbeda (seperti header dan postingan Anda). Sebuah kelas dapat membantu Anda membuat mereka terlihat berbeda.
            </p>
            
            <p>
              Silakan dan beri nama beberapa bagian kode HTML. Tambahkan sebuah kelas yang disebut <code> header halaman &lt;/ 0> ke &lt;code> div &lt;/ 0> yang berisi header Anda, seperti ini:&lt;/p>

&lt;p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="html">&lt;div class="page-header"&gt; 
&lt;h1&gt;&lt;a href="/"&gt; Django Girls Blog &lt;/ 1> &lt;/ 0>    

</code></pre> 
              
              <p>
                Dan sekarang tambahkan sebuah kelas <code> pos &lt;/ 0> ke &lt;code> div &lt;/ 0> berisi sebuah posting blog.&lt;/p>

&lt;p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="html">&lt;div class="post"&gt;
    &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
    &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
    &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
&lt;/div&gt;
</code></pre> 
                
                <p>
                  Kami sekarang akan menambahkan blok deklarasi ke penyeleksi yang berbeda. Pemilih dimulai dengan <code> . &lt;/ 0> berhubungan dengan kelas. Ada banyak tutorial dan penjelasan bagus tentang CSS di Web yang dapat membantu Anda memahami kode berikut. For now, copy and paste it into your &lt;code>blog/static/css/blog.css</code> file:
                </p>
                
                <p>
                  {% filename%} blog / static / css / blog.css {% endfilename%}
                </p>
                
                <pre><code class="css">.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h1 a, .post h1 a:visited {
    color: #000000;
}
</code></pre>
                
                <p>
                  Kemudian hubungilah kode HTML yang menampilkan tulisan dengan deklarasi kelas. Ganti ini:
                </p>
                
                <p>
                  {% filename%} blog / templates / blog / post_list.html {% endfilename%}
                </p>
                
                <pre><code class="html">{% for post in posts %}
    &lt;div class="post"&gt;
        &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
        &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
        &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
    &lt;/div&gt;
{% endfor %}
</code></pre>
                
                <p>
                  di <code> blog / templates / blog / post_list.html &lt;/ 0> dengan ini:&lt;/p>

&lt;p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}&lt;/p>

&lt;pre>&lt;code class="html">&lt;div class="content container"&gt;
    &lt;div class="row"&gt;
        &lt;div class="col-md-8"&gt;
            {% for post in posts %}
                &lt;div class="post"&gt;
                    &lt;div class="date"&gt;
                        &lt;p&gt;published: {{ post.published_date }}&lt;/p&gt;
                    &lt;/div&gt;
                    &lt;h2&gt;&lt;a href=""&gt;{{ post.title }}&lt;/a&gt;&lt;/h2&gt;
                    &lt;p&gt;{{ post.text|linebreaksbr }}&lt;/p&gt;
                &lt;/div&gt;
            {% endfor %}
        &lt;/div&gt;
    &lt;/div&gt;
&lt;/div&gt;
</code></pre> 
                  
                  <p>
                    Simpan file tersebut dan segarkan situs Anda.
                  </p>
                  
                  <p>
                    <img src="images/final.png" alt="Gambar 14.4" />
                  </p>
                  
                  <p>
                    Woo hoo! Terlihat mengagumkan, kan? Lihatlah kode yang baru kita tempel untuk menemukan tempat di mana kita menambahkan kelas dalam HTML dan menggunakannya di CSS. Di mana Anda akan membuat perubahan jika Anda ingin tanggal menjadi turquoise?
                  </p>
                  
                  <p>
                    Jangan takut untuk bermain-main dengan CSS ini sedikit dan mencoba untuk mengubah beberapa hal. Bermain dengan CSS dapat membantu Anda memahami hal-hal yang berbeda. Jika Anda memecahkan sesuatu, jangan khawatir - Anda selalu bisa membatalkannya!
                  </p>
                  
                  <p>
                    Kami sangat merekomendasikan untuk mengambil online gratis ini <a href="https://www.codecademy.com/tracks/web"> Codeacademy HTML & amp; Kursus CSS </ 0> . Ini dapat membantu Anda mempelajari semua tentang membuat situs web Anda lebih cantik dengan CSS.</p> 
                    
                    <p>
                      Siap untuk bab berikutnya ?! :)
                    </p>