Chromebook kullanmıyorsanız, [bu bölümü atlayabilirsiniz](http://tutorial.djangogirls.org/en/installation/#install-python). Chromebook kullanıyorsanız kurulum deneyiminiz biraz farklı olacaktır. Diğer yükleme yönergelerini göz ardı edebilirsiniz.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE, size İnternette yazılım yükleyebileceğiniz, yazabileceğiniz ve çalıştırabileceğiniz bir kod düzenleyicisi ve çalışan bir bilgisayara erişim sağlayan bir araçtır. Eğitim boyunca, Cloud IDE sizin *yerel makinanız* gibi davranacak. OS X, Ubuntu veya Windows'daki sınıf arkadaşlarınız gibi terminal arayüzünde komut çalıştırmaya devam edeceksiniz, ancak terminaliniz Cloud IDE'nin sizin yerinize kuracağı başka bir bilgisayara bağlanacaktır. Cloud IDE'ler (PaizaCloud bulut IDE, AWS Cloud9) için talimatlar burada. Cloud IDE'lerden birini seçin ve o IDE'nin talimatlarini takip edin.

#### PaizaCloud Cloud IDE

1. [PaizaCloud Cloud IDE](https://paiza.cloud/)'ye gidin
2. Bir hesap oluşturun
3. Click *New Server* and choose the Django app
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
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Sanal ortam (Virtual environment)

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).