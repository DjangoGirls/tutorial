Anda bisa [melewatkan bagian ini](http://tutorial.djangogirls.org/en/installation/#install-python) jika Anda tidak menggunakan Chromebook. Jika ya, pengalaman instalasi Anda akan sedikit berbeda. Anda bisa mengabaikan sisa instruksi penginstalan.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE merupakan sebuah layanan berupa editor kode dan diakses lewat komputer yang berjalan di internet yang mana Anda bisa memasang, menulis, dan mengoperasikan perangkat lunak. Di dalam tutorial ini, Cloud IDE ini akan bertindak sebagai *mesin lokal* Anda. Anda tetap bisa mengoperasikan perintah di antarmuka terminal sama seperti mereka yang menggunakan OS X, Ubuntu, atau Windows, tapi terminal ini akan terkoneksi ke komputer yang berjalan di layanan cloud IDE yang Anda gunakan. Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Anda bisa memilih salah satu dari layanan cloud IDE, dan ikuti instruksi dari setiap layanan cloud IDE yang Anda gunakan.

#### PaizaCloud Cloud IDE

1. Buka situs [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Buatlah akun baru
3. Klik *New Server* dan pilih Django app
4. Klik tombol Terminal (yang terletak di samping kiri)

Lalu amati sidebar, terdapat tombol di sebelah kiri. Klik tombol "Terminal" untuk membuka terminal dengan prompt seperti ini:

{% filename %}Terminal{% endfilename %}

    $
    

Terminal pada PaizaCloud Cloud IDE siap menerima instruksi Anda. Anda bisa mengubah ukuran atau memaksimalkan jendela itu untuk membuatnya sedikit lebih besar.

#### AWS Cloud9

Saat ini Cloud 9 mengharuskan Anda untuk mendaftar dengan AWS dan memasukkan informasi kartu kredit.

1. Pasang Cloud 9 dari Chrome web store</ 0></li> 
    
    - Pergi ke [c9.io](https://c9.io) dan klik *Get started with AWS Cloud9*
    - Daftar untuk akun AWS (memerlukan informasi kartu kredit, tetapi kamu dapat menggunakannya secara gratis)
    - Pada AWS Dashboard, masuk *Cloud9* pada kotak pencarian dan klik
    - Pada Cloud 9 dashboard, klik *Create environment*
    - Namakan *django-girls*
    - Saat di configuring settings, pilih *Create a new instance for environment (EC2)* untuk "Environment Type" dan *t2.micro* "Instance type" (Tulisan yang seharusnya muncul "Free-tier eligible."). Pengaturan default cost-saving selesai dan Anda dapat menetapkan yang lain secara default.
    - Klik *Next step*
    - Klik *Create environment*</ol> 
    
    Sekarang Anda harus melihat sebuah antarmuka dengan sidebar, jendela utama yang besar dengan beberapa teks, dan sebuah jendela kecil di bagian bawah yang terlihat seperti ini:
    
    {% filename %}bash{% endfilename %}
    
        yourusername:~/workspace $
        
    
    Area bagian bawah adalah terminal Anda. Anda bisa menggunakannya untuk mengirimkan perintah kepada komputer remote Cloud9. Anda bisa menyesuaikan ukuran jendela untuk membuatnya sedikit lebih besar.
    
    #### Glitch.com Cloud IDE
    
    1. Go to [Glitch.com](https://glitch.com/)
    2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
    3. Click *New Project* and choose *hello-webpage*
    4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:
    
    {% filename %}Terminal{% endfilename %}
    
        app@name-of-your-glitch-project:~
        
    
    When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment. Instead, create the following files manually:
    
    {% filename %}glitch.json{% endfilename %}
    
    ```json
    {
      "install": "pip3 install -r requirements.txt --user",
      "start": "bash start.sh",
      "watch": {
        "throttle": 1000
      }
    }
    ```
    
    {% filename %}requirements.txt{% endfilename %}
    
        Django~={{ book.django_version }}
        
    
    {% filename %}.bash_profile{% endfilename %}
    
    ```bash
    alias python=python3
    alias pip=pip3
    ```
    
    {% filename %}start.sh{% endfilename %}
    
    ```bash
    chmod 600 .bash_profile
    pip3 install -r requirements.txt --user
    python3 manage.py makemigrations
    python3 manage.py migrate
    python3 manage.py runserver $PORT
    ```
    
    Once these files are created, go to the Terminal and execute the following commands to create your first Django project:
    
    {% filename %}Terminal{% endfilename %}
    
        django-admin.py startproject mysite .
        refresh
        
    
    In order to see detailed error messages, you can activate Django debug logs for your Glitch application. Simply add the following at the end of the `mysite/settings.py` file.
    
    {% filename %}mysite/settings.py{% endfilename %}
    
    ```python
    LOGGING = {
        'version': 1,
        'disable_existing_loggers': False,
        'handlers': {
            'file': {
                'level': 'DEBUG',
                'class': 'logging.FileHandler',
                'filename': 'debug.log',
            },
        },
        'loggers': {
            'django': {
                'handlers': ['file'],
                'level': 'DEBUG',
                'propagate': True,
            },
        },
    }
    ```
    
    This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.
    
    The initial restarting of the Glitch project should fail. (If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.) Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.
    
    ### Lingkungan Virtual
    
    A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.
    
    Run:
    
    {% filename %}Cloud 9{% endfilename %}
    
        mkdir djangogirls
        cd djangogirls
        python3 -m venv myvenv
        source myvenv/bin/activate
        pip install django~={{ book.django_version }}
        
    
    (note that on the last line we use a tilde followed by an equal sign: `~=`).
    
    ### GitHub
    
    Make a [GitHub](https://github.com) account.
    
    ### PythonAnywhere
    
    The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.
    
    This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.
    
    Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).