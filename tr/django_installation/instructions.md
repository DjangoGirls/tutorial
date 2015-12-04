> Bu bölümün bir kısmı Geek Girls Carrots tarafından hazırlanmış eğitimlere dayanılarak hazırlanmıştır (http://django.carrots.pl/).
> 
> Bu bölümün bir parçası Creative Commons Attribution-ShareAlike 4.0 International License ile lisanslı [django-marcador tutorial](http://django-marcador.keimlink.de/)'a dayanılarak hazırlanmıştır. Django-marcador tutorial'ının hakları Markus Zapke-Gründemann'e aittir.

## Sanal ortam (Virtual environment)

Django'yu yüklemeden önce kod ortamınızı düzenli tutmak için son derece yararlı bir araç yükleyeceğiz. Bu adımı atlayabilirsiniz, fakat atlamamanızı tavsiye ederiz. En iyi olası kurulum ile başlamanız sizi gelecekteki bir sürü sorundan koruyacaktır!

Öyleyse bir **sanal ortam**(diğer adıyla *virtualenv*) kuralım. Virtualenv Python/Django kurulumunuzu proje bazlı izole eder. Bu, bir websitesine yapacağınız değişikliklerin diğer geliştirdiklerinize yansımayacağı anlamına gelir. Muazzam, değil mi?

Yapmanız gereken tek şey `virtualenv` oluşturmak için bir dizin bulmak; örneğin giriş dizininiz. Windows'da `C:\Users\İsim` (`İsim` kısmı kullanıcı adınız olacak şekilde).

Bu eğitim için giriş dizininizde `djangogirls` adlı bir klasör kullanacağız:

    mkdir djangogirls
    cd djangogirls
    

`myvenv` adında bir virtualenv oluşturacağız. Genel komut aşağıdaki şekilde olacak:

    python3 -m venv myvenv
    

### Windows

Yeni bir `virtualenv` oluşturmak için konsolu açıp (nasıl yapıldığını birkaç adım önce anlatmıştık - hatırlıyorsunuz değil mi?) `C:\Python34\python -m venv myvenv` komutunu çalıştırın. Şöyle görünmeli:

    C:\Users\İsim\djangogirls> C:\Python34\python -m venv myvenv
    

`C:\Python34\python` dizini önceden Python'u kurduğunuz dizin ve `myenv` ise `virtualenv`'inizin ismi olacaktır. İstediğiniz herhangi bir ismi kullanabilirsiniz, ama küçük harfle yazılmasına ve boşluk, aksan karakterleri (örn: å) ve özel karakterleri kullanmamaya dikkat edin. Ayrıca ismi kısa tutmak iyi bir fikir olabilir, zira bu ismi çok kullanıyor olacaksınız!

### GNU/Linux ve OS X

Linux ve OS X işletim sistemlerinde `virtualenv` (sanal ortam) oluşturmak `python3 -m venv myvenv` komutunu çalıştırmak kadar kolay. Komut şu şekilde görünecektir:

    ~/djangogirls$ python3 -m venv myvenv
    

Burada `myenv` sizin sanal ortamınız olan `virtualenv`'inizin ismi. Dilerseniz istediğiniz herhangi bir isim kullanabilirsiniz, ama büyük harf ve boşluk kullanmamaya dikkat edin. İsmi çok fazla kullanacağınız için kısa tutmak da işinize yarayacaktır.

> **NOT:** Ubuntu 14.04 işletim sisteminde sanal ortam yaratmaya çalışırken şu hatayla karşılaşabilirsiniz:
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> Bu sorunu çözmek için `virtualenv` komutunu kullanabilirsiniz.
> 
>     ~/djangogirls$ sudo apt-get install python-virtualenv
>     ~/djangogirls$ virtualenv --python=python3.4 myvenv
>     

## Sanal ortamda çalışmak

Yukarıdaki komutlar `myvenv` (veya seçtiğiniz isimde) bir klasör oluşturacaktır. Sanal ortam (birkaç klasör ve dosya) bu klasörün içindedir.

#### Windows

Sanal ortamınızı çalıştırarak başlatın:

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

#### GNU/Linux ve OS X

Sanal ortamınızı çalıştırarak başlatın:

    ~/djangogirls$ source myvenv/bin/activate
    

Eğer `virtualenv` sanal ortamınız için `myvenv` yerine başka bir isim seçtiyseniz komutlarınızı buna göre güncellemeyi unutmayın!

> **NOT:** bazen `source` komutu kullanılamıyor durumda olabilir. Böyle durumlarda onun yerine aşağıdaki komutu da kullanabilirsiniz:
> 
>     ~/djangogirls$ . myvenv/bin/activate
>     

Konsolunuzda şuna benzer bir şey gördüğünüzde `virtualenv`'in başladığını anlayabilirsiniz:

    (myvenv) C:\Users\Name\djangogirls>
    

ya da:

    (myvenv) ~/djangogirls$
    

En baştaki `(myvenv)`'e dikkat edin!

Sanal ortamda çalışırken `python` otomatik olarak doğru sürümü çalıştıracaktır. Yani `python3` yerine `python` komutuyla çalışmaya devam edebilirsiniz.

Artık bütün gerekli uygulamaları bir araya getirdiğimize göre sonunda Django'yu yükleyebiliriz!

## Django'yu Yüklemek

`virtualenv` sanal ortamınızı başlattığınız için artık Django'yu `pip` kullanarak yükleyebiliriz. Konsola `pip install django==1.8` komutunu yazın. (İki tane eşittir işareti kullandık: `==`).

    (myvenv) ~$ pip install django==1.8
    Downloading/unpacking django==1.8
    Installing collected packages: django
    Successfully installed django
    Cleaning up...
    

Windows'ta

> Eğer Windows işletim sisteminde çalışıyorsanız ve pip komutunu kullanırken bir hatayla karşılaştıysanız proje adresinizin boşluk veya özel karakter içerip içermediğini kontrol edin. (`C:\Users\User Name\djangogirls` gibi). Eğer böyle bir durum sözkonusuysa projenizi boşluk veya özel karakter içermeyen bir yere taşıyın. (`C:\djangogirls` gibi). Taşıma işleminden sonra yukarıdaki komutları tekrar deneyin.

Linux'te

> Eğer Ubuntu 12.04 işletim sisteminde pip komutunu çağırırken bir hata mesajıyla karşılaştıysanız `python -m pip install -U --force-reinstall pip` komutunu çalıştırarak sanal ortamdaki pip yüklemesini düzeltmeyi deneyin.

İşte bu! Sonunda Django uygulamanızı oluşturmaya hazırsınız!