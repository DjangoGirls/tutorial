# Yayına alın!

> **Not** Bir sonraki bölüm ara ara zor gelebilir. Dayanın ve bölümü bitirin; yayına alma, website geliştirme sürecinin önemli bir parçasıdır. Biraz daha uğraşmalı olan websitesini canlıya alma işine eğitmeninizin yardım edebilmesi için bu bölümü tutorial'ın ortasına yerleştirdik. Böylece eğer zaman yetmezse tutorial'ı kendi başınıza bitirebilirsiniz.

Şimdiye kadar websiteniz sadece kendi makinanızda idi, şimdi yayına nasıl alacağınızı öğreneceksiniz! Yayına alma uygulamanızı internette yayınlama sürecidir, böylelikle insanlar sonunda gidip uygulamanızı görebilirler :).

Öğrendiğimiz üzere, bir websitesi bir sunucunun üstünde olmalıdır. Internette birçok sunucu sağlayıcı bulunuyor. Görece kolay bir yayına alma süreci olanlardan birini kullanacağız: [PythonAnywhere][1]. PythonAnymwhere çok fazla ziyaretçisi olmayan ufak uygulamalar için ücretsiz yani sizin için kesinlikle yeterli olacaktır.

 [1]: http://pythonanywhere.com/

Dışarıdan kullanacağımız diğer servis bir kod barındırma hizmeti olan [Github][2]. Başkaları da var, ama nerdeyse her programcının bir Github hesabı var, sizin de olacak!

 [2]: http://www.github.com

Github'ı kodumuzu PythonAnywhere'e taşımak için bir atlama tahtası olarak kullanacağız.

# Git

Git, birçok programcı tarafından kullanılan bir "sürüm kontrol sistemi"dir. Bu yazılım dosyaların zaman içindeki değişimlerini izler, böylelikle sonradan eski sürümlere ulaşabilirsiniz. Biraz Microsoft Word'deki "değişiklikleri izle" özelliği gibi, ama çok daha güçlü.

## Git'i kurmak

> **Not** Kurulum adımlarını halihazırda yaptıysanız, bunu tekrar yapmanıza gerek yok - bir sonraki alt bölüme geçip Git reponuzu oluşturabilirsiniz.

{% include "/deploy/install_git.md" %}

## Git repomuzu oluşturmak

Git, kod reposu (veya "repository") denen belli dosyaların değişikliklerini izler. Projemiz için bir tane oluşturalım. Konsolunuzu açın ve `djangogirls` klasöründe aşağıdaki komutları çalıştırın:

> **Not** Reponuzu başlatmadan önce, `pwd` (OS/Linux) veya `cd` (Windows) komutu ile bulunduğunuz dizini kontrol edin. `djangogirls` dizininde olmanız gerekiyor.

```
Hatırlatma: Kullanıcı adı seçerken özel Türkçe karakter kullanmayın.
$ git init 
Initialized empty Git repository in ~/djangogirls/.git/ 
$ git config --global user.name "Adınız" 
$ git config --global user.email you@example.com
```

Git reposunu başlatma işi, proje başına bir kere yapmamız gereken birşey (ayrıca kullanıcı adı ve eposta adresini tekrar girmenize gerek olmayacak).

Git bu dizindeki tüm dizin ve dosyalardaki değişiklikleri kaydedecek, ama takip etmemesini istediğimiz bazı dosyalar var. Bunu dizinin dibinde `.gitignore` adında bir dosya oluşturarak yapıyoruz. Editörünüzü açın ve aşağıdaki içeriklerle yeni bir dosya yaratın:

```
*.pyc
__pycache__
myvenv
db.sqlite3
.DS_Store
```

Ve "djangogirls" dizinin en üst seviyesine `.gitignore` olarak kaydedin.

> **Not** Dosya adının başındaki nokta önemli! Eğer dosyayı oluştururken zorlanırsanız (örneğin Mac'ler Finder ile nokta ile başlayan dosya yaratmanızdan hoşlanmıyor), editörünüzdeki "Farklı Kaydet" özelliğini kullanın, kesin çalışır.

`git add` kullanmadan önce veya nelerin değiştiğinden emin değilseniz, `git status` komutunu kullanmakta yarar var. Bu, yanlış dosyaların eklenmesi ve gönderilmesi gibi istenmeyen sürprizlerin engelenmesine yardımcı olacak. `git status` komutu, takip edilmeyen/değişen/gönderilecek dosyalar (staged), dal durumu (branch status) gibi bilgiler verir. Çıktının aşağıdaki gibi olması gerekiyor:

```
$ git status 
On branch master 

Initial commit

Untracked files:
  (use "git add <dosya>..." to include in what will be committed)

         .gitignore
         blog/
         manage.py
         mysite/ 

nothing added to commit but untracked files present (use "git add" to track)
```

Ve son olarak değişikliklerimizi kaydediyoruz. Komut satırına gidin ve aşağıdaki komutları çalıştırın:

```
$ git add --all
$ git commit -m "Django Girls uygulamam, ilk commit"
 [...]
 13 files changed, 200 insertions (+)
 create mode 100644 .gitignore
 [...]
create mode 100644 mysite/wsgi.py
```

## Kodunuzu Github'a gönderme

[GitHub.com>][2] adresine gidin ve kendinize yeni bedava bir kullanıcı hesabı açın. (Bunu atölye hazırlıklarında zaten yaptıysanız, harika!)

Arkasından "ilk-blogum" (veya "my-first-blog") isminde yeni bir repo oluşturun. "Initialize with a README" kutucuğunu işaretlemeden bırakın, .gitignore opsiyonunu boş bırakın (onu elle yaptık) ve 'License'ı 'None' olarak bırakın.

![][3]

 [3]: images/new_github_repo.png

> **Not** `ilk-blogum` ismi önemli -- başka birşey de seçebilirsiniz, ama aşağıdaki yönergelerde çok geçiyor, her seferinde değiştirmeniz gerekir. En kolayı `ilk-blogum` ismi ile devam etmek.

Bir sonraki ekranda, repo'yu klonlamak için gereken URL'yi göreceksiniz. "HTTPS"li versiyonunu seçin, kopyalayın. Birazdan onu komut penceresine yapıştıracağız:

![][4]

 [4]: images/github_get_repo_url_screenshot.png

Şimdi bilgisayarınızdaki Git reposunu Github'daki repo ile ilişkilendirmemiz gerekiyor.

Aşağıdakini komut satırına yazın (`<github-kullanıcı-adınız>` kısmını Github hesabını yarattığınız sırada kullandığınız kullanıcı adı ile değiştirin, büyüktür küçüktür işaretlini eklemeyin):

```
$ git remote add origin https://github.com/<github-kullanıcı-adınız>/ilk-blogum.git 
$ git push -u origin master
```

Github kullanıcı adı ve şifrenizi girin, arkasından aşağıdakine benzer bir şey görmeniz gerekiyor:

```
Username for 'https://github.com': zeynep 
Password for 'https://zeynep@github.com': 
Counting objects: 6, done.
Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0) 
To https://github.com/zeynep/my-first-blog.git 
 * [new branch] master -> master 
Branch master set up to track remote branch master from origin.
```

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extention -->

Kodunuz artık Github'da. Siteye girin ve kontrol edin! İyi bir çevrede olduğunu göreceksiniz - [Django][5], the [Django Girls Tutorial][6], ve daha birçok harika açık kaynak yazılım projesi de kodlarını Github'da tutuyor :)

 [5]: https://github.com/django/django
 [6]: https://github.com/DjangoGirls/tutorial

# Blogumuzun PythonAnywhere üzerinde kurulumu

> **Not** En baştaki kurulum adımlarında PythonAnywhere hesabını açmış olabilirsiniz - öyleyse bu kısmı tekrar yapmanıza gerek yok.

{% include "/deploy/signup_pythonanywhere.md" %}

## Kodunuzu PythonAnywhere üzerine çekmek

PythonAnywhere'de hesap açtığınızda, 'dashboard' (gösterge paneli) sayfanıza veya "Consoles" sayfasına yönlendirileceksiniz. "Bash" konsolu başlatma seçeneğini seçin -- bu bilgisayarınızdaki konsolun PythonAnywhere versiyonu.

> **Not** PythonAnywhere Linux tabanlı, o yüzden kendi makinanız Windows ise konsol biraz farklı gözükecektir.

Reponuzun bir klonunu yaratarak kodumuzu Github'dan PythonAnywhere üzerine çekelim. Aşağıdakileri PythonAnywhere konsoluna yazın (`<github-kullanıcı-adınız>` yerine kendi Github kullanıcı adınızı yazmayı unutmayın):

```
$ git clone https://github.com/<github-kullanıcı-adınız>/ilk-blogum.git
```

Bu kodunuzun bir kopyasını PythonAnywhere üzerine indirecektir. `tree ilk-blogum` yazarak kontrol edin:

```
$ tree ilk-blogum
ilk-blogum/
├── blog
│   ├── __init__.py
│   ├── admin.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   └── views.py
├── manage.py
└── mysite
    ├── __init__.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```

### PythonAnywhere üzerine bir virtualenv (sanal ortam) oluşturmak

Bilgisayarınızda nasıl bir virtualenv (sanal ortam) oluşturduysanız, aynı şekilde PythonAnywhere üzerinde de oluşturabilirsiniz. Bash konsoluna, aşağıdakileri yazın:

```
$ cd ilk-blogum

$ virtualenv --python=python3.4 myvenv
Running virtualenv with interpreter /usr/bin/python3.4
[...]
Installing setuptools, pip...done.

$ source myvenv/bin/activate

(mvenv) $  pip install django whitenoise
Collecting django
[...]
Successfully installed django-1.8.2 whitenoise-2.0
```

> **Not** `pip install` birkaç dakika sürebilir. Sabır, sabır! Ama 5 dakikadan uzun sürüyorsa, birşeyler yanlış olmuştur. Eğitmeninize sorun.

<!--TODO: think about using requirements.txt instead of pip install.-->

### Statik dosyaların toplanması.

"whitenoise"un ne olduğunu merak ettiniz mi? "Statik dosyalar" için kullanılan bir araç. Statik dosyalar, HTML veya CSS dosyaları gibi düzenli olarak değişmeyen veya kod çalıştırmayan dosyalardır. Bu dosyalar sunucularda bilgisayarımızdakinden farklı çalışırlar. Bu yüzden onları sunucudan yayınlamak için "whitenoise" gibi bir araca ihtiyacımız var.

Tutorial'ın ilerleyen kısımlarında sitemizin CSS'ini düzenlerken statik dosyalar konusuna biraz daha fazla gireceğiz.

Şimdilik sadece sunucuda `collectstatic` diye ek bir komut çalıştıracağız. Bu komut, Django'ya sunucdaki bütün statik dosyaları toparlamasını söyler. An itibariyle bunlar çoğunlukla admin sitesini güzelleştiren dosyalar.

```
(mvenv) $ python manage.py collectstatic

You have requested to collect static files at the destination
location as specified in your settings:

    /home/zeynep/ilk-blogum/static

This will overwrite existing files! (Bu işlem halihazırdaki dosyalarınız üzerinde değişiklik yapar!)
Are you sure you want to do this? (Bu işlemi yapmak istediğinizden emin misiniz?)

Type 'yes' to continue, or 'no' to cancel: yes (Onaylıyorsanız 'yes', vazgeçtiyseniz 'no' yazın)
```

"yes" yazın ve işte başladı! Bilgisayarlara sayfa sayfa yazı yazdırmayı sevmiyor musunuz? Ben hep beraberinde küçük küçük sesler çıkarırım. Trr, trr, trr...

```
Copying '/home/zeynep/ilk-blogum/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/actions.min.js'
Copying '/home/zeynep/ilk-blogum/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/js/inlines.min.js'
[...]
Copying '/home/zeynep/ilk-blogum/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/changelists.css'
Copying '/home/zeynep/ilk-blogum/mvenv/lib/python3.4/site-packages/django/contrib/admin/static/admin/css/base.css'
62 static files copied to '/home/zeynep/ilk-blogum/static'.
```

### PythonAnywhere üzerinde veritabanının oluşturulması

Bilgisayarınız ve sunucu arasında farklı olan bir başka şey daha: farklı bir veritabanı kullanıyor. Dolayısıyla bilgisayarınızdaki ve sunucudaki kullanıcı hesapları ve blog yazıları farklı olabilir.

Sunucudaki veritabanına aynen bilgisayardaki gibi `migrate` (taşımak) ve `createsuperuser` (yetkili bir kullanıcı oluşturmak) komutlarıyla oluşturup ilk örnek verilerle ile doldurabiliriz:

```
(mvenv) $ python manage.py migrate
Operations to perform:
[...]
  Applying sessions.0001_initial... OK


(mvenv) $ python manage.py createsuperuser
```

## Blog'umuzu web uygulaması olarak yayınlama

Artık kodumuz PythonAnywhere üzerinde, virtualenv'imiz hazır, statik dosyalar toplandı, ve veritabanı hazırlandı. Blogumuzu bir web uygulaması olarak yayınlamaya hazırız!

PythonAnywhere logosuna tıklayarak 'dashboard'a geri gidin, burda **Web** sekmesine tıklayın. En son **Add a new web app** (yeni bir web uygulaması yaratın) linkine tıklayın.

Açılan pencerede alan adınızı kontrol edin, **manual configuration** (elle konfigürasyon)'ı seçin ("Django" opsiyonunu *değil*). Arkasından **Python 3.4**'ü seçin ve işlemi bitirmek için 'Next'e basın.

> **Not** "Manual configuration" seçeneğini seçtiğinizden emin olun, "Django" seçeneğini değil. Hazır PythonAnywhere Django kurulumunu seçmek için fazla havalıyız ;-)

### virtualenv'in (sanal ortamın) ayarlanması

Son bahsettiğimiz adım sizi web uygulamanızın PythonAnywhere ayar ekranına getirecek. Sunucudaki uygulamanızda değişiklik yapmak istediğinizde bu ekranı kullanmanız gerekiyor.

![][7]

 [7]: images/pythonanywhere_web_tab_virtualenv.png

"Virtualenv" bölümünde "Enter the path to a virtualenv" (virtualenv için dizin yolu girin) linkini tıklayın ve şunu yazın: `/home/<kullanıcı-adınız>/ilk-blogum/myenv`. Devam etmeden önce, dizin yolunu kaydetmek için tik işareti olan mavi kutuyu tıklayın.

> **Not** İlgili yeri kendi kullanıcı adınızı yazın. Eğer hata yaparsanız, PythonAnywhere size bir uyarı gösterecektir.

### WSGI dosyasının ayarlanması

Django, "WSGI protokolü"nü kullanarak çalışır. WSGI, PythonAnywhere'in de desteklediği Python kullanan websitelerinin servis edilmesi için kullanılan bir standart. PythonAnywhere'in Django blogumuzu anlaması için WSGI ayar dosyasını düzenleyiyoruz.

"WSGI Configuration file" (WSGI ayar dosyası) linkine tıklayın ("Code" denen kısımda, sayfanın üst tarafında -- adı `/var/www/<kullanıcı-adınız>_pythonanywhere_com_wsgi.py`'a benzer birşey olacak). Burdan bir edöitöre yönlendirileceksiniz.

Tüm içeriği silin ve onların yerine aşağıdakileri yazın:

```python
import os
import sys

path = '/home/<kullanıcı-adınız>/ilk-blogum'  # burada kendi kullanıcı adınızı yazın
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'

from django.core.wsgi import get_wsgi_application
from whitenoise.django import DjangoWhiteNoise
application = DjangoWhiteNoise(get_wsgi_application())
```

> **Not** `<kullanıcı-adınız>` diye geçen kısıma kendi kullanıcı adınızı yazmayı unutmayın

Bu dosyanın işi, PythonAnywhere'e web uygulamamızın nerde yaşadığını ve Django ayar dosyasının adının ne olduğunu söylemek. Aynı zamanda "whitenoise" statik dosya aracını ayarlıyor.

**Save** (kaydet)'e basın. Arkasından **Web** sekmesine geri gidin.

Hazırız! Yeşil ve büyük **Reload** (Yeniden yükle) butonuna tıklayın. Uygulamanıza girip görebileceksiniz. Sayfanın tepesinde uygulamaya giden linki bulabilirsiniz.

## Hata ayıklama önerileri

Eğer sitenize girdiğinizde bir hata görürseniz, hata ayıklama bilgileri için ilk bakacağınız yer, **error log**'unuz (hata kayıtlarınız). Buraya olan linki PythonAnywhere'deki [Web sekme][8]sinde bulabilirsiniz. Burda hata mesajları olup olmadığına bakın; en yeni mesajlar en altta. Sık karşılaşılan problemler şunlar:

 [8]: https://www.pythonanywhere.com/web_app_setup/

*   Konsolda yaptığımız adımlardan birinin unutulması: virtualenv'in oluşturulması, çalışır hale getirilmesi, içine Django'nun kurulumu, collectstatic'in çalıştırılması, veritabanının taşınması (migrate ettirilmesi).

*   Web sekmesinde virtualenv dizin yolunda bir hata yapılması -- eğer problem varsa, ilgili yerde küçük kırmızı bir hata mesajı olur.

*   WSGI ayar dosyasına bir hata yapmak -- ilk-blogum dizinine olan yolu doğru yazdığınızdan emin misiniz?

*   Virtualenv'ınız için seçtiğiniz Python versiyonu web uygulamanız için seçtiğiniz Python versiyonu ile aynı mı? İkisinin de 3.4 olması gerekiyor.

*   [Python Anywhere vikisinde (bilgi sayfalarında) genel hata ayıklama önerileri][9] bulunuyor.

 [9]: https://www.pythonanywhere.com/wiki/DebuggingImportError

Ve eğitmeniniz size yardıma hazır, unutmayın!

# Siteniz canlıda!

Sitenizin varsayılan sayfası "Welcome to Django" diyor olmalı, aynen bilgisayarınızda olduğu gibi. URL'nin sonuna `/admin/` yazın, 'giriş' tuşuna bastığınızda admin sitesi açılacak. Kullanıcı adı ve şifrenizle giriş yapın, sunucuda yeni blog yazıları girebildiğinizi göreceksiniz.

Kendinize *KOCAMAN* bir aferin diyin! Yayına alma web geliştirme işinin en uğraştırmalı kısımlarından biridir ve genelde çalışana kadar insanların birkaç gününü alır. Ama işte siteniz canlıda, gerçek internette!