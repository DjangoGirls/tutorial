Anda dapat  melewatkan hak atas bagian ini </ 0> jika Anda tidak menggunakan Chromebook. Jika ya, pengalaman instalasi Anda akan sedikit berbeda. Anda bisa mengabaikan sisa instruksi penginstalan.</p> 

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
                        
                    
                    This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.
                    
                    ### Lingkungan Virtual
                    
                    Lingkungan virtual (juga disebut virtualenv) adalah seperti kotak pribadi yang bisa kita gunakan untuk kode proyek komputer yang kita kerjakan. Kami menggunakannya untuk menyimpan berbagai bit kode yang kami inginkan untuk berbagai proyek kami sehingga hal-hal tidak tercampur aduk antara proyek.
                    
                    Di terminal Anda di bagian bawah antarmuka Cloud 9, jalankan yang berikut ini:
                    
                    {% filename%} Cloud 9 {% endfilename%}
                    
                        sudo apt update sudo apt install python3.6-venv
                        
                    
                    Jika ini masih tidak berhasil, mintalah bantuan untuk pelatih Anda.
                    
                    Selanjutnya, jalankan:
                    
                    {% filename%} Cloud 9 {% endfilename%}
                    
                        mkdir djangogirls cd djangogirls python3.6 -mvenv myvenv source myvenv / bin / mengaktifkan pip install django ~ = 1.11.0
                        
                    
                    (perhatikan bahwa pada baris terakhir kita menggunakan tilde diikuti dengan tanda sama: ~ =).
                    
                    ### Github
                    
                    Buat akun  Github </ 0> .</p> 
                    
                    ### PythonAnywhere
                    
                    Tutorial Django Girls menyertakan bagian tentang apa yang disebut Deployment, yaitu proses mengambil kode yang memberi kekuatan pada aplikasi web baru Anda dan memindahkannya ke komputer yang dapat diakses publik (disebut server) sehingga orang lain dapat melihat pekerjaan Anda.
                    
                    Bagian ini sedikit aneh saat melakukan tutorial di Chromebook karena kita sudah menggunakan komputer yang ada di Internet (berlawanan dengan, katakanlah, laptop). Namun, ini masih berguna, karena kita dapat memikirkan ruang kerja Cloud 9 kita sebagai tempat atau karya "dalam proses" kita dan Python Anywhere sebagai tempat untuk memamerkan barang-barang kita karena menjadi lebih lengkap.
                    
                    Jadi, masuk ke akun Python Anywhere baru di  www.pythonanywhere.com </ 0> .</p>