Anda bisa [lewati langsung bagian ini](http://tutorial.djangogirls.org/en/installation/#install-python) jika anda tidak menggunakan Chromebook. Jika ya, pengalaman instalasi Anda akan sedikit berbeda. Anda bisa mengabaikan sisa instruksi penginstalan.

### Awan 9

Cloud 9 adalah sebuah alat yang memberikan anda kode editor dan akses ke komputer yang sedang aktif di Internet di mana anda bisa menginstal, menulis, dan menjalankan perangkat lunak tersebut. Untuk durasi tutorial, Cloud 9 akan bertindak sebagai * mesin lokal </ 0> Anda . Anda masih akan menjalankan perintah di antarmuka terminal seperti teman sekelas Anda di OS X, Ubuntu, atau Windows, namun terminal Anda akan terhubung ke komputer yang berjalan di tempat lain yang ditetapkan Cloud 9 untuk Anda.</p> 

1. Pasang Cloud 9 dari  penyimpanan web Chrome </ 0></li> 
    
    - Pergi ke  c9.io </ 0></li> 
        
        - Daftar ke akun
        - Klik * Buat Workspace Baru </ 0></li> 
            
            - Nama itu * Django-girls </ 0></li> 
                
                - Pilih * Blank </ 0> (kedua dari kanan di baris bawah dengan logo oranye)</li> </ol> 
                    
                    Sekarang Anda harus melihat sebuah antarmuka dengan sidebar, jendela utama yang besar dengan beberapa teks, dan sebuah jendela kecil di bagian bawah yang terlihat seperti ini:
                    
                    {% filename%} Cloud 9 {% endfilename%}
                    
                        yourusername: ~ / workspace $
                        
                    
                    Bagian bawah ini merupakan *terminal* anda, dimana anda akan memasang Cloud 9 pada komputer yang telah mempersiapkan perintah-perintah anda. Anda dapat mengubah ukuran Window tersebut agar tampak lebih besar.
                    
                    ### Lingkungan Virtual
                    
                    Lingkungan virtual (juga disebut virtualenv) adalah seperti kotak pribadi yang bisa kita gunakan untuk kode proyek komputer yang kita kerjakan. Kami menggunakannya untuk menyimpan berbagai bit kode yang kami inginkan untuk berbagai proyek kami sehingga hal-hal tidak tercampur aduk antara proyek.
                    
                    Di terminal Anda di bagian bawah antarmuka Cloud 9, jalankan yang berikut ini:
                    
                    {% filename%} Cloud 9 {% endfilename%}
                    
                        sudo apt update sudo apt install python3.6-venv
                        
                    
                    Jika ini masih tidak berhasil, mintalah bantuan untuk pelatih Anda.
                    
                    Selanjutnya, jalankan:
                    
                    {% filename%} Cloud 9 {% endfilename%}
                    
                        mkdir djangogirls
                        cd djangogirls
                        python3.6 -mvenv myvenv
                        source myvenv/bin/activate
                        pip install django~={{ book.django_version }}
                        
                    
                    (perhatikan bahwa pada baris terakhir kita menggunakan tilde diikuti dengan tanda sama: ~ =).
                    
                    ### GitHub
                    
                    Make a [GitHub](https://github.com) account.
                    
                    ### PythonAnywhere
                    
                    Tutorial Django Girls menyertakan bagian tentang apa yang disebut Deployment, yaitu proses mengambil kode yang memberi kekuatan pada aplikasi web baru Anda dan memindahkannya ke komputer yang dapat diakses publik (disebut server) sehingga orang lain dapat melihat pekerjaan Anda.
                    
                    Bagian ini sedikit aneh saat melakukan tutorial di Chromebook karena kita sudah menggunakan komputer yang ada di Internet (berlawanan dengan, katakanlah, laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.
                    
                    Jadi, masuk ke akun Python Anywhere baru di  www.pythonanywhere.com </ 0> .</p>