# Yayına alın!

> **Not** Bir sonraki bölüm ara ara zor gelebilir. Dayanın ve bölümü bitirin; yayına alma, website geliştirme sürecinin önemli bir parçasıdır. Biraz daha uğraşmalı olan websitesini canlıya alma işine eğitmeninizin yardım edebilmesi için bu bölümü tutorial'ın ortasına yerleştirdik. Böylece eğer zaman yetmezse tutorial'ı kendi başınıza bitirebilirsiniz.

Şimdiye kadar web sitenize sadece kendi bilgisayarınızdan girilebiliyordu. Şimdi onu nasıl canlıya alacağınızı öğreneceksiniz! Yayına alma uygulamanızı internette yayınlama sürecidir, böylelikle insanlar sonunda gidip uygulamanızı görebilirler. :)

Öğrendiğimiz üzere, bir websitesi bir sunucunun üstünde olmalıdır. İnternette bir çok sunucu sağlayıcısı var, biz [PythonAnywhere](https://www.pythonanywhere.com/) kullanacağız. PythonAnywhere ücretsizdir ve çok fazla ziyaretçisi olmayan küçük uygulamalar içindir yani şu anlık sizin için kesinlikle yeterli olacaktır.

Dışarıdan kullanacağımız diğer servis bir kod barındırma hizmeti olan [Github](https://www.github.com). Başkaları da var, ama nerdeyse her programcının bir Github hesabı var, sizin de olacak!

Bu üç yer sizin için önemli olacak. Lokal bilgisayarınız geliştirme ve test yaptığınız yer olacak. Değişikliklerden memnun olduğunuzda programınızın bir kopyasını Github'a koyacaksınız. Web siteniz PythonAnywhere üzerinde olacak ve onu kodunuzun bir kopyasını Github'dan alarak günceleyeceksiniz.

# Git

> **Not** Eğer kurulum adımlarını zaten yaptıysanız, bunu tekrar yapmanıza gerek yok - bir sonraki bölüme geçip Git reponuzu oluşturabilirsiniz.

{% include "/deploy/install_git.md" %}

## Git repomuzu oluşturmak

Git, bir kod deposu (repository veya kısaca "repo") olarak adlandırılan belirli dosyalardaki değişiklikleri izler. Projemiz için bir tane oluşturalım. Konsolunuzu açın ve `djangogirls` klasöründe aşağıdaki komutları çalıştırın:

> **Not** Reponuzu oluşturmadan önce `pwd` (Mac OS X/Linux) ya da `cd` (Windows) komutu ile şu an çalışmakta olan dizininizi kontrol edin. `djangogirls` dizininde olmanız gerekiyor.

{% filename %}komut-satırı{% endfilename %}

    Hatırlatma: Kullanıcı adı seçerken Türkçe karakter kullanmayın.
    $ git init 
    Initialized empty Git repository in ~/djangogirls/.git/ 
    $ git config --global user.name "Adınız" 
    $ git config --global user.email you@example.com
    

Git reposunu başlatmak proje başına sadece bir kere yapmamız gereken bir şeydir (ve kullanıcı adınız ve mailinizi tekrar girmeniz gerekmeyecek).

Git bu dizindeki tüm dizin ve dosyalardaki değişiklikleri kaydedecek, ama takip etmemesini istediğimiz bazı dosyalar var. Bunu dizinin dibinde `.gitignore` adında bir dosya oluşturarak yapıyoruz. Editörünüzü açın ve aşağıdaki içeriklerle yeni bir dosya yaratın:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

Ve onu `.gitignore` ismi ile "djangogirls" dizinine kaydedin.

> **Not** Dosya adının başındaki nokta önemli! Eğer dosyayı oluştururken zorluk yaşarsanız (örneğin Mac'ler Finder'dan nokta ile başlayan bir dosya oluşturmanızdan hoşlanmazlar), editörünüzdeki "Farklı Kaydet" özelliğini kullanın böylece çalışacaktır.
> 
> **Not** `.gittignore` dosyasında belirttiğiniz dosyalardan biri `db.sqlite3` dosyası. Bu dosya tüm gönderilerinizin saklandığı yerel veritabanınızdır. Bunu reponuza eklemek istemiyoruz çünkü PythonAnywhere'deki web siteniz farklı bir veritabanı kullanacak. Bu veritabanı geliştirme makinenizdeki gibi SQLite olabilir ama genelde sitenizdeki çok daha fazla ziyaretçiyi kaldırabilecek MySQL adı verilen bir veritabanı kullanacaksınız. Her iki durumda da, GitHub kopyası için SQLite veritabanınızı yok saymanız, şu ana kadar oluşturduğunuz tüm gönderilerin lokalinizde kalması ve yalnızca lokal olarak kullanılabilmeniz anlamına geliyor. Canlıda onlara ulaşabilmeniz için yeniden eklemek zorundasınız. Lokal veritabanınızı farklı şeyleri test edebileceğiniz ve blogunuzdaki gerçek gönderilerinizi silmekten korkmayacağınız iyi bir oyun alanı olarak düşünmelisiniz.

`git add` kullanmadan önce veya nelerin değiştiğinden emin değilseniz, `git status` komutunu kullanmakta yarar var. Bu, yanlış dosyaların eklenmesi ve gönderilmesi gibi istenmeyen sürprizlerin engelenmesine yardımcı olacak. `git status` komutu, takip edilmeyen/değişen/gönderilecek dosyalar (staged), dal durumu (branch status) gibi bilgiler verir. Çıktıda aşağıdakine benzer olmalıdır:

{% filename %}komut-satırı{% endfilename %}

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
    

Ve son olarak değişikliklerimizi kaydediyoruz. Komut satırına gidin ve aşağıdaki komutları çalıştırın:

{% filename %}komut-satırı{% endfilename %}

    $ git add --all .
    $ git commit -m "Django Girls uygulamasında ilk commit'im"
     [...]
     13 dosya değiştirildi, 200 eklenen (+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Kodunu GitHub'a ekle
    [GitHub.com](https://www.github.com) adresine gidip yeni ve ücretsiz bir hesap için kaydol. (Workshop prep(atölye hazırlığı) aşamasında yaptım zaten ben bunu diyorsanız, bu harika!)
    
    Sonra yeni bir repository oluşturup "my-first-blog" ismini verin. "BENİOKU dosyası ile başlat" onay kutusunu işaretlemeyin, .gitignore seçeneğini boş bırakın (biz manual olarak yaptık) ve Lisans'ı Hiçbiri(None) olarak ayarlayın.
    
    <img src="images/new_github_repo.png" />
    
    > **Not**`my-first-blog` ismi önemlidir – başka bir isim seçebilirsiniz, ancak aşağıdaki talimatlarda bu isim bir çok kez geçecektir ve bu bölümlerde her seferinde seçtiğiniz ismi kullanmanız gerekir. `my-first-blog` ismini kullanırsanız muhtemelen daha kolay olacaktır.
    
    Sonraki ekranda repo'nun klon URL'sini göreceksiniz. "HTTPS" ile başlayanı seçin, kopyalayın ve şunu terminale yapıştırın:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Şimdi Git repository'i bilgisayarınızdaki bir GitHub'a bağlamamız gerekiyor.
    
    Aşağıdakileri konsol ekranına geçirin (`<your-github-username>` kısmını köşeli parantez olamadan GitHub kullanıcı adınızla değiştirin):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />GitHub kullanıcı adınızı ve şifrenize girdikten sonra böyle bir şey görmelisiniz:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': zeynep Password for 'https://zeynep@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. https://github.com/hjwp/my-first-blog.git için toplam 3 (delta 0), yeniden 0 (delta 0)

- [new branch] master -> master Branch master orijinal branch masterı uzaktan takip etmek için kuruldu.

    <br />&lt;!--TODO: belki kurulum bölümünde ssh anahtarları yüklenir ve bir uzantısı olmayan ppl'ye işaret eder--&gt;
    
    Kodunuz şu anda GitHub'ta. Siteye girin ve kontrol edin!  İleride kendini iyi bir şirkette bulacaksın – [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) 'li ve bir çok büyük açık kaynak projesi kodlarını GitHub'da barındırır. :)
    
    
    # PythonAnywhere'de blog açma
    
    &gt; **Not** Siz zaten bir PythonAnywhere hesabına sahip olabilirsiniz – Eğer öyleyse tekrar açmanız gerekmez.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## PythonAnywhere'den kodumuzu çekiyoruz
    
    PythonAnywhere'e kaydolduğunuzda, gösterge tablonuza veya "Konsollar" sayfasına yönlendirilirsiniz. "Bash" konsolunu başlat seçeneğini seçin - bu, bilgisayarınızdaki konsolun bir PythonAnywhere versiyonudur.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Not** PythonAnywhere Linux tabanlıdır, yani Windows kullanıyorsanız bu konsol bilgisayarınızdakinden biraz daha farklı görünecektir.
    
    Reponuzun bir klonunu yaratarak kodumuzu Github'dan PythonAnywhere üzerine çekelim. Aşağıdakileri PythonAnywhere konsoluna geçirin (`&lt;your-github-username&gt;` yerine GitHub kullanıcı adınızın geleceğini unutmayın):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />Bu işlem kodunuzun bir kopyasını PythonAnywhere'a çekecektir. Konsola `tree my-first-blog` yazarak kontrol edebilirsiniz:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### PythonAnywhere üzerinde bir virtualenv oluşturuyoruz
    
    Tam olarak kendi bilgisayarınızda yaptığınız gibi PythonAnywhere üzerinde bir virtualenv oluşturabilirsiniz. Bash konsolunda şunu yazın:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Not** `pip install`(pip kurulumu) adımı bir kaç dakika sürebilir.  Sabır, sabır!  Ama beş dakikadan daha uzun sürüyorsa bir sorun var demektir.  Koçuna sor.
    
    &lt;!--TODO: pip kurulumu yerine requirements.txt kullanmayı düşünün.--&gt;
    
    ### PythonAnywhere' veritabanı kurulumu
    
    İşte kendi bilgisayarınızla sunucu arasındaki başka bir fark daha: farklı bir veri tabanı kullanıyor. Dolayısıyla, kullanıcı hesapları ve gönderiler sunucuda ve bilgisayarınızda farklı olabilir.
    
    Tıpkı kendi bilgisayarınızda yaptığımız gibi, sunucudaki veritabanını `migrate` ve` createsuperuser` ile başlatmak için aşağıdaki kodları kullanalım:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Operations to perform: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Blogumuzu bir web uygulaması olarak yayınlama
    
    Şimdi kodumuz PythonAnywhere'a geçirildi, virtualenv'ımız hazır ve veritabanı başlatıldı. Bir web uygulaması olarak yayına hazırız!
    
    Site logosuna tıklayarak PythonAnywhere gösterge tablosuna geri dönün ve ** Web** sekmesini tıklayın. Son olarak, **Add a new web app** kısmına tıklayarak web uygulaması ekleyin.
    
    Alan adınızı onayladıktan sonra, iletişim kutusundaki **manual configuration** (N.B. - *değil* "Django" seçeneği) seçeneğini işaretleyin. Sonrasında **Python 3.6** 'yı seçin ve sihirbazı bitirmek için İleri butonuna tıklayın.
    
    &gt; **Not** "Manual configuration" seçeneğini seçtiğinize emin olun, "Django" olanı değil. Varsayılan PythonAnywhere Django kurlumu için çok iyiyiz. ;-)
    
    
    ### virtualenv ayarlama
    
    Sunucudaki uygulamada değişiklik yapmak istediğinizde web uygulamanızın PythonAnywhere config ekranına yönlendirileceksiniz.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    "Virtualenv" bölümünde, "Virtualenv yolunu girin" diyen kırmızı metne tıklayın ve `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/` dosya yolunu girin. Taşımadan önce dizin yolunu kaydetmek için onay işareti olan mavi kutuyu tıklayın.
    
    &gt; **Not** Gereken yerlere kendi PythonAnywhere kullanıcı adınızı girin. Eğer bir hata yaparsanız PythonAnywhere size küçük bir uyarı kutusunda gösterecektir.
    
    
    Django, PythonAnywhere'in desteklediği Python'u kullanarak, web sitelerini sunmak için bir standart olan "WSGI" protokolüyle çalışır. PythonAnywhere'in Djano blogunuzu anlaması için yapılandırma şekli olarak WSGI yapılandırma dosyasını düzenliyoruz.
    
    "WSGI yapılandırma dosyası" bağlantısını tıkladıktan sonra (sayfanın üst kısmına yakın "kod" bölümünde `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py` gibi bir adlandırmaya sahip olacak) bir editöre yönlendirileceksin.
    
    Tüm içeriği sil ve aşağıdakilerle değiştir:
    
    {% filename %}&lt;your-username&gt;_pythonanywhere_com_wsgi.py{% endfilename %}
    ```python
    import os
    import sys
    
    path = os.path.expanduser('~/my-first-blog')
    if path not in sys.path:
        sys.path.append(path)
    
    os.environ['DJANGO_SETTINGS_MODULE'] = 'mysite.settings'
    
    from django.core.wsgi import get_wsgi_application
    from django.contrib.staticfiles.handlers import StaticFilesHandler
    application = StaticFilesHandler(get_wsgi_application())
    

Bu dosyanın işi, PythonAnywere'e uygulamanızın nerde yaşadığını ve Django settings dosyasının adının ne olduğunu söylemek.

`StaticFilesHandler` CSS'ler için var. Lokaldeki geliştirmenizde bu `runserver` komutu ile otomatik halloluyor. Tutorial'ın ilerleyen kısımlarında sitemizin CSS'ini düzenlerken statik dosyalar konusuna biraz daha fazla gireceğiz.

**Save** (kaydet)'e basın. Arkasından **Web** sekmesine geri gidin.

Hazırız! Yeşil ve büyük **Reload** (Yeniden yükle) butonuna tıklayın. Uygulamanıza girip görebileceksiniz. Sayfanın tepesinde uygulamaya giden linki bulabilirsiniz.

## Hata ayıklama önerileri

Eğer sitenize girdiğinizde bir hata görürseniz, hata ayıklama bilgileri için ilk bakacağınız yer, **error log**'unuz (hata kayıtlarınız). Buraya olan linki PythonAnywhere'deki [Web sekme](https://www.pythonanywhere.com/web_app_setup/)sinde bulabilirsiniz. Burda hata mesajları olup olmadığına bakın; en yeni mesajlar en altta. Sık karşılaşılan problemler şunlar:

- Konsolda yaptığımız adımlardan birinin unutulması: virtualenv'in oluşturulması, çalışır hale getirilmesi, içine Django'nun kurulumu, veritabanının taşınması (migrate ettirilmesi).

- Web sekmesinde virtualenv dizin yolunda bir hata yapılması durumunda - genellikle kırmızı hata mesajı problem olduğunda oradadır.

- WSGI ayar dosyasında hata yapıldı - my-first-blog dosyasının yolunun doğruluğundan emin misniz?

- Virtualenv'ınız için seçtiğiniz Python versiyonu web uygulamanız için seçtiğiniz Python versiyonu ile aynı mı? İkisinin de 3.6 olması gerekiyor.

PythonAnywhere wiki</a> üzerinde bazı general hata giderme tüyoları mevcuttur.</p> 

Ve eğitmeniniz size yardıma hazır, unutmayın!

# Siteniz canlıda!

Siteniz için bulunan varsayılan sayfa ''İşe yaradı!'' demelidir. Tıpkı yerel bilgisayarınızda olduğu gibi. URL'nin sonuna `/admin/` yazın, 'giriş' tuşuna bastığınızda admin sitesi açılacak. Kullanıcı adı ve şifrenizle giriş yapın, sunucuda yeni blog yazıları girebildiğinizi göreceksiniz.

Birkaç gönderi oluşturduktan sonra, lokalinize (PythonAnywhere'e değil) geri dönebilirsiniz. Değişiklikleri burda lokalinizde yapacaksınız. Bu web geliştirmekte yaygın bir akışıdır - değişiklikleri yerel olarak yapınız, bu değişiklikleri GitHub'a gönderin, değişikliklerinizi canlı Web sunucusuna çekin. Bu canlı web sitenizi bozmadan çalışmanızı ve yeni şeyler denemenizi sağlar. Bayağı havalı, di mi?

Kendinize *KOCAMAN* bir aferin diyin! Yayına alma web geliştirme işinin en uğraştırmalı kısımlarından biridir ve genelde çalışana kadar insanların birkaç gününü alır. Ama işte siteniz canlıda, gerçek internette!