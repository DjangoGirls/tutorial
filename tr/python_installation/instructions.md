> Bu bölüm Geek Girls Carrots tarafından yapılan bir eğitime dayanılarak hazırlanmıştır. (http://django.carrots.pl/)

Django, Python ile yazılmıştır. Django ile bir şey yapmak için Python diline ihtiyacımız var. Hadi Python kurmaya başlayalım! Biz Python 3.4 kurmak istiyoruz, eğer daha düşük bir sürüme sahipseniz, güncellemelisiniz.

### Windows

Windows için Python indirmek için resmi siteyi ziyaret edebilirsiniz: https://www.python.org/downloads/release/python-343/. ***.msi** dosyasını indirdikten sonra, dosyayı çalıştırın (çift-tık) ve yönergeleri izleyin. Python kurulumunu yaptığınız dizinin yolunu unutmamanız önemli. Daha sonra lazım olacak!

Dikkat: Özelleştir (Customize) olarak seçilmiş kurulum sihirbazının ikinci ekranında seçenekleri aşağıya kaydırın ve "Add python.exe to the Path" (python.exe yolunu ekle) seçeneğinin üzerine gelip "Will be installed on local hard drive" seçeneğini seçin:

![Python'u arama yoluna eklemeyi unutmayın](../python_installation/images/add_python_to_windows_path.png)

### GNU/Linux

Muhtemelen sisteminizde Python zaten yüklüdür. Yüklü olup olmadığını (ya da hangi versiyon olduğunu) kontrol etmek için komut satırını açın ve aşağıdaki komutları girin: 

```
$ python3 --version
Python 3.4.3
```

Python yüklü değilse ya da farklı bir versiyon edinmek istiyorsanız aşağıdaki adımları takip edin:

#### Debian veya Ubuntu

Terminale bu komutu girin:

```
$ sudo apt-get install python3.4
```

#### Fedora (21'e kadar)

Terminalde kullanmanız gereken komut:

```
$ sudo yum install python3.4
```

#### Fedora (22+)

Terminalde kullanmanız gereken komut:

```
$ sudo dnf install python3.4
```

### OS X

Python kurulum dosyasını indirmek için resmi siteye gitmelisiniz: https://www.python.org/downloads/release/python-342/:

  * *Mac OS X 64-bit/32-bit yükleyici* dosyasını indirin,
  * *python-3.4.3-macosx10.6.pkg* dosyasına çift tıklayarak yükleyiciyi çalıştırın.

Kurulumun başarılı olup olmadığını kontrol etmek için *Terminal* uygulamasını açın ve aşağıdaki `python3` komutunu çalıştırın:

```
$ python3 --version
Python 3.4.3
```

* * *

Herhangi bir şüpheniz varsa, kurulumda bir şeyler ters gittiyse ya da sonrasında ne yapacağınızı bilmiyorsanız eğitmene sorabilirsiniz! Bazen işler düzgün gitmiyor, bu durumda daha fazla deneyime sahip birinden yardım istemelisiniz.