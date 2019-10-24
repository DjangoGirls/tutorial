> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (https://github.com/ggcarrots/django-carrots).
> 
> Bölümün bu kısmı [django-marcador tutorial](http://django-marcador.keimlink.de/) e dayandırılmış ve Creative Commons Attribution-ShareAlike 4.0 International License koruması altında lisansı alınmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

## Sanal ortam (Virtual environment)

Django'yu yüklemeden önce kod ortamınızı düzenli tutmak için son derece yararlı bir araç yükleyeceğiz. Bu adımı atlayabilirsiniz, fakat atlamamanızı tavsiye ederiz. En iyi olası kurulum ile başlamanız sizi gelecekteki bir sürü sorundan koruyacaktır!

Öyleyse bir **virtual environment** (diğer adıyla *virtualenv*) kuralım. Virtualenv Python/Django kurulumunuzu her proje için ayrı tutup izole eder. Bu, bir websitesine yapacağınız değişikliklerin diğer geliştirdiklerinize yansımayacağı anlamına gelir. Muazzam, değil mi?

Yapmanız gereken tek şey `virtualenv` oluşturmak için bir dizin bulmak; örneğin giriş dizininiz. Windows'ta şöyle görünebilir: `C:\Users\Name` (`Name` yerine kullanıcı adınız gelir).

> **NOTE:** Windows'ta bu dizinin özel karakterler içermediğinden emin olun; eğer kullanıcı adınız özel karakterler içeriyorsa, farklı bir dizin kullanın. Örneğin: `C:\djangogirls`.

Bu eğitim için giriş dizininizde yeni açtığımız `djangogirls` adlı bir klasör kullanacağız:

{% filename %}komut-satırı{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

`myvenv` adında bir virtualenv oluşturacağız. Genel komut aşağıdaki şekilde olacak:

{% filename %}komut-satırı{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Yeni bir `virtualenv` yaratmak için, komut satırını açmanız ve `python -m venv myvenv`'u çalıştırmanız gerekir. Böyle görünecektir:

{% filename %}komut-satırı{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Burada `myvenv`, `virtualenv`'inizin ismidir. İstediğiniz herhangi bir ismi kullanabilirsiniz, ama küçük harfle yazılmasına ve boşluk, aksan karakterleri (örn: å) ve özel karakterleri kullanmamaya dikkat edin. Ayrıca ismi kısa tutmak işinize yarayacaktır zira bu ismi çokça kullanıyor olacaksınız!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Hem Linux hem de OS X 'teyken `python3 -m venv myvenv` komutuyla bir `virtualenv` oluşturabiliriz. Şu şekilde gözükecektir:

{% filename %}komut-satırı{% endfilename %}

    $ python3 -m venv myvenv
    

Burada `myvenv` sizin `virtualenv`'inizin ismi. Dilerseniz istediğiniz herhangi bir isim kullanabilirsiniz, ama büyük harf ve boşluk kullanmamaya dikkat edin. Ayrıca ismi kısa tutmak işinize yarayacaktır zira bu ismi çokça kullanıyor olacaksınız!

> **NOT:** Debian/Ubuntu'nun bazı sürümlerinde aşağıdaki hatayı alabilirsiniz:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     Ensurepip kullanılamadığından sanal ortam başarıyla oluşturulamadı.  Debian/Ubuntu sistemlerinde, aşağıdaki komutu kullanarak python3-venv paketini yüklemeniz gerekir.
>        apt install python3-venv
>     sudo komutu ile kullanmanız gerekebilir.  python3-venv paketini indirdikten sonra, virtualenv'inizi yeniden oluşturun. 
>     
> 
> Bu durumda, yukarıdaki yönergeleri izleyin ve `python3-venv` paketini yükleyin:
> 
>     $ sudo apt install python3-venv
>     
> 
> Bu şekilde Debian/Ubuntu'nun bazı sürümlerinde sanal ortamı başlatırken o anda aşağıdaki hatayı alabilirsiniz:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     Error: Command '['/home/zeynep/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Bu sorunu çözmek için `virtualenv` komutunu kullanabilirsiniz.
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOT:** Eğer aşağıdaki gibi bir hata alırsanız
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> o zaman yerine bunu çalıştırın:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## Virtualenv ile çalışmak

Yukarıdaki komutlar `myvenv` (veya seçtiğiniz isimde) bir klasör oluşturacaktır. Bu klasörde birçok dosya ve klasör bulunur.

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

Şu komutu çalıştırarak virtualenv'i başlatın:

{% filename %}komut-satırı{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOT:** Windows 10'da , Windows PowerShell tarafından `bu senaryoların uygulanması bu sistemde devre dışıdır` diyen bir hata alabilirsiniz. Bu durumda, başka bir Windows PowerShell'i, "Yönetici Olarak Çalıştır" seçeneğiyle açın. Bundan sonra sanal ortamınızı başlatmadan önce aşağıdaki komutları yazmayı deneyin:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!-- (This comment separates the two blockquote blocks, so that GitBook and Crowdin don't merge them into a single block.) -->

> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> Bu durumun avantajı ise editor ve komut-satırı arasında pencere değistirmek zorunda olmamamız

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Şu komutu çalıştırarak virtualenv'i başlatın:

{% filename %}komut-satırı{% endfilename %}

    $ source myvenv/bin/activate
    

`myvenv` kısmını seçtiğiniz `virtualenv` ismi ile değiştirmeyi unutmayın!

> **NOTE:** sometimes `source` might not be available. In those cases try doing this instead:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Requirements ile paketleri yüklemek

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!