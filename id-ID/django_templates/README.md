# Django templates

Saatnya menampilkan data! Django menyediakan fitur bawaan berupa **template tags** untuk keperluan tersebut.

## Apa itu template tags?

Anda lihat, di HTML, Anda tidak bisa benar-benar menulis kode Python, karena browser tidak memahaminya. Mereka hanya tahu HTML. Kita tahu bahwa HTML agak statis, sementara Python jauh lebih dinamis.

**Django template tags** allow us to transfer Python-like things into HTML, so you can build dynamic websites faster. Cool!

## Menampilkan template post list

Di pembahasan sebelumnya kita menyediakan post list ke dalam variabel `posts`.

Untuk mencetak variabel ke dalam Django templates, kita menggunakan dua buah karakter kurung kurawal denga nama variable di dalamnya, seperti ini:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
{{posts}}
```

Terapkan ke template `blog/templates/blog/post_list.html`. Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. Simpan file, dan refresh halaman untuk melihat hasil perubahan:

![Gambar 13.1](images/step1.png)

Seperti yang bisa kita lihat, tercetak seperti berikut:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
<QuerySet [<Post: My second post> , <Post: My first post> ] & gt;
```

Yang berarti Django dapat mengenalinya sebagai list objek. Ingat pembahasan dari **Introduction to Python** bagaimana kita menampilkan list? Ya, dengan loop! Di Django template, kita menerapkannya seperti ini:

{% filename%} blog / templates / blog / post_list.html {% endfilename%}

```html
{% untuk posting di posting%} 
{{post}} {% endfor%}

```

Cobalah terapkan di template.

![Gambar 13.2](images/step2.png)

Berhasil! Tapi kami ingin posting ditampilkan seperti tulisan statis yang kami buat sebelumnya di bab ** Introduction to HTML </ 0> . Anda dapat mencampur tag HTML dan template. Kami ` tubuh </ 0> akan terlihat seperti ini:</p>

<p>{% filename%} blog / templates / blog / post_list.html {% endfilename%}</p>

<pre><code class="html"><header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
`</pre> 

{% raw%} Semua yang Anda masukkan antara ` {% untuk%} </ 0> dan <code> {% endfor%} </ 0> akan diulang untuk setiap objek dalam daftar. Segarkan laman Anda: {% endraw%}</p>

<p><img src="images/step3.png" alt="Gambar 13.3" /></p>

<p>Have you noticed that we used a slightly different notation this time (<code>{{ post.title }}` or `{{ post.text }}`)? Kami mengakses data di masing-masing bidang yang didefinisikan dalam model ` Post </ 0> kami . Juga, <code> | linebreaksbr </ 0> sedang menyalurkan teks posting melalui filter untuk mengubah jeda baris menjadi paragraf.</p>

<h2>Satu hal lagi</h2>

<p>Akan lebih baik bila website Anda tetap bekerja di Internet publik kan? Ayo coba gunakan PythonAnywhere lagi. Inilah rekap langkahnya ...</p>

<ul>
<li>First, push your code to GitHub</li>
</ul>

<p>{% filename%} baris perintah {% endfilename%}</p>

<pre><code>$ git status
[...]
$ git add .
$ git status
[...]
$ git commit -m "Modified templates to display posts from database."
[...]
$ git push
`</pre> 

* Kemudian, masuk kembali ke  PythonAnywhere </ 0> dan masuk ke konsol < 1> Bash </ 1> Anda (atau jalankan yang baru), dan jalankan:</li> </ul> 
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    
        $ cd <your-pythonanywhere-domain>.pythonanywhere.com
        $ git pull
        [...]
        
    
    (Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)
    
    * Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.
    
    Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.
    
    Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)
    
    ![Figure 13.4](images/donut.png)