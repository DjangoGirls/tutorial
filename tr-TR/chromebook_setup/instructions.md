Chromebook kullanmıyorsanız, [bu bölümü atlayabilirsiniz](http://tutorial.djangogirls.org/en/installation/#install-python). Chromebook kullanıyorsanız kurulum deneyiminiz biraz farklı olacaktır. Diğer yükleme yönergelerini göz ardı edebilirsiniz.

### Bulut Tabanlı Geliştirme Ortamı (IDE) (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE, size İnternette yazılım yükleyebileceğiniz, yazabileceğiniz ve çalıştırabileceğiniz bir kod düzenleyicisi ve çalışan bir bilgisayara erişim sağlayan bir araçtır. Eğitim boyunca, Cloud IDE sizin *yerel makinanız* gibi davranacak. OS X, Ubuntu veya Windows'daki sınıf arkadaşlarınız gibi terminal arayüzünde komut çalıştırmaya devam edeceksiniz, ancak terminaliniz Cloud IDE'nin sizin yerinize kuracağı başka bir bilgisayara bağlanacaktır. Cloud IDE(PaizaCloud bulut IDE, AWS Cloud9)'ler için talimatlar burada. Cloud IDE'lerden birini seçin ve o IDE'nin talimatlarini takip edin.

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/)'ye gidin
2. Bir hesap oluşturun
3. *New Server* a tıklayıp Django app i seçin
4. Pencerenin sol tarafındaki Terminal butonuna tıklayalım

Şimdi arayüzün sol tarafında bir takım buttonları görmeniz gerekiyor. "Terminal" buttonuna tıklayıp aşağıdaki komut satırını gösteren bir ekran açın:

{% filename %}Terminal{% endfilename %}

    $
    

PaizaCloud Cloud IDE'nin terminali sizin komutlarınızı girmeniz icin hazırlanacak. Terminal penceresinin boyunu değiştirebilir ve en büyük boyuta getirebilirsiniz.

#### AWS Cloud9

Cloud 9 kullanmak için bir AWS üyeliğine sahip olmanız ve kredi kartı bilgilerinizi girmeniz gerekiyor.

1. [Chrome Web Mağazası](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)'ndan Cloud 9 uygulamasını yükleyin
2. [c9.io](https://c9.io) sayfasına gidin ve *AWS Cloud9'u kullanmaya başlayın* butonuna tıklayın
3. Bir AWS hesabı açın (kredi kartı bilgilerinizi girmeniz gerekiyor, fakat ücretsiz kullanabilirsiniz)
4. AWS in paneline gidip arama çubuğuna *Cloud9* girin ve tıklayın
5. Cloud 9 panelinde *Create environment* a tıklayın
6. *django-girls* ismini verin
7. Ayarları (Settings) tanımlarken "Environment Type" için *Create a new instance for environment (EC2)* ve "Instance type" için *t2.micro* seçin ("Free-tier eligible." yazısı görünmeli). Halihazırdaki ayarları uygundur ve olduğu gibi bırakın.
8. *Next step* e tıklayın
9. *Create environment* a tıklayın

Şimdi, bir yan panel, içinde bir takım yazıların olduğu büyük bir ana ekran ve altta aşağıdaki yazıya benzeyen küçük bir panel olan yeni bir arayüz görmelisiniz:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Aşağıdaki bölge sizin terminalizdir. Bu terminali kullanarak Cloud 9 bigisayarına komut gönderebilirsiniz. Tercih ederseniz bu pencereyi büyütebilirsiniz.

#### Glitch.com'un Bulut IDE'si

1. [Glitch.com](https://glitch.com/) adresine gidin
2. Kaydol (https://glitch.com/signup) yada GitHub hesabınla kaydol. (See GitHub instructions below.)
3. Tıkla*Yeni Proje*seç*karşılama web sayfası*
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

### Sanal ortam (Virtual environment)

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