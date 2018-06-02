> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (https://github.com/ggcarrots/django-carrots).
> 
> Bölümün bu kısmı [django-marcador tutorial](http://django-marcador.keimlink.de/) e dayandırılmış ve Creative Commons Attribution-ShareAlike 4.0 International License koruması altında lisansı alınmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

## Sanal ortam (Virtual environment)

Django'yu yüklemeden önce kod ortamınızı düzenli tutmak için son derece yararlı bir araç yükleyeceğiz. Bu adımı atlayabilirsiniz, fakat atlamamanızı tavsiye ederiz. En iyi olası kurulum ile başlamanız sizi gelecekteki bir sürü sorundan koruyacaktır!

Öyleyse bir **virtual environment**(diğer adıyla *virtualenv*) kuralım. Virtualenv Python/Django kurulumunuzu her proje için ayrı tutup izole eder. Bu, bir websitesine yapacağınız değişikliklerin diğer geliştirdiklerinize yansımayacağı anlamına gelir. Muazzam, değil mi?

Yapmanız gereken tek şey `virtualenv` oluşturmak için bir dizin bulmak; örneğin giriş dizininiz. Windows'ta şöyle görünebilir: `C:\Users\Name` (`Name` yerine kullanıcı adınız gelir).

> **NOTE:** Windows'ta bu dizinin özel karakterler içermediğinden emin olun; eğer kullanıcı adınız özel karakterler içeriyorsa, farklo bir dizin kullanın. Örneğin: `C:\djangogirls`.

Bu eğitim için giriş dizininizde yeni açtığımız `djangogirls` adlı bir klasör kullanacağız:

{% filename %}komut-satırı{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

`myvenv` adında bir virtualenv oluşturacağız. Genel komut aşağıdaki şekilde olacak:

{% filename %}komut-satırı{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

Yeni bir `virtualenv` yaratmak için,prompt komutunu açmanız ve `python -m venv myvenv`'u çalıştırmanız gerekir.Böyle görünecektir; 

{% filename %}komut-satırı{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Burada `myvenv`, `virtualenv`'inizin ismidir. İstediğiniz herhangi bir ismi kullanabilirsiniz, ama küçük harfle yazılmasına ve boşluk, aksan karakterleri (örn: å) ve özel karakterleri kullanmamaya dikkat edin. Ayrıca ismi kısa tutmak işinize yarayacaktır zira bu ismi çokca kullanıyor olacaksınız!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

Hem Linux hem de OS X 'teyken `python3 -m venv myvenv` komutuyla bir `virtualenv` oluşturabiliriz. Şu şekilde gözükecektir:

{% filename %}komut-satırı{% endfilename %}

    $ python3 -m venv myvenv
    

Burada `myvenv` sizin `virtualenv`'inizin ismi. Dilerseniz istediğiniz herhangi bir isim kullanabilirsiniz, ama büyük harf ve boşluk kullanmamaya dikkat edin. Ayrıca ismi çok fazla referans alacağınızdan kısa tutmak iyi bir fikir olacaktır!

> **NOT:** Debian/Ubuntu'nun bazı sürümlerinde aşağıdaki hatayı alabilirsiniz:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  Debian/Ubuntu sistemlerinde, python3-venv paketini aşağıdaki komutu kullanarak yüklemeniz gerekiyor.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> Bu durumda,yukarıdaki yönergeleri izleyin ve `python3-venv` paketini yükleyin:
> 
>     $ sudo apt install python3-venv
>     
> 
> Bu Şekilde Debian/Ubuntu ' nun bazı sürümlerinde sanal ortamı başlatırken o anda aşağıdaki hatayı alabilirsiniz : 
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
    

> **NOT:** Windows 10'da , Windows PowerShell tarafından `bu senaryoların uygulanması bu sistemde devre dışıdır` diyen bir hata alabilirsiniz. Bu durumda,başka bir Windows PowerShell'i,"Yönetici Olarak Çalıştır" seçeneğini kullanarak çalıştırın. Daha sonra Sanal ortamınızı başlatmadan önce sırada ki komutları yazmayı deneyin:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Uygulama politikasını değiştirmek http://go.microsoft.com/fwlink/?LinkID=135170 adresinde yardım kısmında yer alan about_Execution_Policies'teki gibi güvenlik risklerine neden olabilir. Uygulama politikasını değiştirmek istiyor musunuz? [Y] Yes/Evet [A] Yes to All/Hepsi için evet [N] No/Hayır [L] No to All/Hepsi için hayır [S] Suspend/Askıya al [?] Help/Yardım (varsayılan cevap "N")
>     

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

Şu komutu çalıştırarak virtualenv'i başlatın:

{% filename %}komut-satırı{% endfilename %}

    $ source myvenv/bin/activate
    

`myvenv` yerine kendi seçtiğiniz `virtualenv` ismini koymayı unutmayın!

> **NOT:** bazen `source` komutu kullanılamıyor durumda olabilir. Böyle durumlarda onun yerine aşağıdaki komutu da kullanabilirsiniz:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

Konsolunuzda komut isteminizin başında `(myvenv)` gördüğünüzde `virtualenv`'in çalıştığını anlayabilirsiniz.

Virtualenv ile çalışırken `python` otomatik olarak doğru sürümü çalıştıracaktır. Yani `python3` yerine `python` yazabilirsiniz.

Artık bütün gerekli uygulamaları bir araya getirdiğimize göre sonunda Django'yu yükleyebiliriz!

## Django'yu yüklemek

`virtualenv`'i çalıştırdığınıza göre,şimdi Django'yu yükleyebilirsiniz.

Bunu yapmadan önce,bilgisayarımızın,Django yüklemek için kullanacağımız yazılım olan `pip`'in en son versiyonuna sahip olduğundan emin olmalıyız

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~$ python3 -m pip install --upgrade pip
    

Sonra `pip install django~=1.11.0` (eşittir işaretinden önce tilde işareti kullandığımızı not edin: `~=`) çalıştırarak Django 'yu yükleyin.

{% filename %}komut-satırı{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> Eğer Windows'ta pip komutunu kullanırken bir hata aldıysanız, lütfen projenizin isminin özel karakter içerip içermediğini kontrol edin (örneğin `C:\Users\User Name\djangogirls`). Eğer böyleyse, lütfen boşluksuz veya özel karaktersiz bir yer kullanmayı düşünün (öneri: `C:\djangogirls`). Yeni dizinde yeni bir virtualenv oluşturun, arkasından eskisini silin ve yukarıdaki komutu yeniden deneyin. (virtualenv dizinini taşımak işe yaramayacaktır çünkü virtualenv mutlak yollar kullanır.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Django kurmaya çalışırken komut satırınız donabilir. Bu durumda, yukarıdaki komut yerine şu komutu kullanın:
> 
> {% filename %}komut-satırı{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> Eğer Ubuntu 12.04 işletim sisteminde pip komutunu çağırırken bir hata iletisiyle karşılaştıysanız `python -m pip install -U --force-reinstall pip` komutunu çalıştırarak pip kurulumunu onarmayı deneyin.

<!--endsec-->

İşte bu kadar! Sonunda Django uygulamanızı oluşturmaya hazırsınız!