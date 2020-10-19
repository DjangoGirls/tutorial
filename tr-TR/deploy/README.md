# Yayına alın!

> **Not** Bir sonraki bölüm ara ara zor gelebilir. Dayanın ve bölümü bitirin; yayına alma, website geliştirme sürecinin önemli bir parçasıdır. Biraz daha uğraştırıcı olan websitesini canlıya alma işine eğitmeninizin yardım edebilmesi için bu bölümü tutorial'ın ortasına yerleştirdik. Böylece eğer zaman yetmezse tutorial'ı kendi başınıza bitirebilirsiniz.

Şimdiye kadar web sitenize sadece kendi bilgisayarınızdan girilebiliyordu. Şimdi onu nasıl canlıya alacağınızı öğreneceksiniz! Yayına alma uygulamanızı internette yayınlama sürecidir, böylelikle insanlar sonunda gidip uygulamanızı görebilirler. :)

Öğrendiğimiz üzere, bir websitesi bir sunucunun üstünde olmalıdır. İnternette birçok sunucu sağlayıcısı var, biz bunlardan [PythonAnywhere](https://www.pythonanywhere.com/) i kullanacağız. PythonAnywhere ücretsiz olduğu ve çok fazla ziyaretçisi olmayan küçük uygulamalar için uygun olduğu için kesinlikle yeterli olacaktır.

Dışarıdan kullanacağımız diğer servis bir kod barındırma hizmeti olan [Github](https://www.github.com). Başkaları da var, ama neredeyse her programcının bir Github hesabı var, sizin de olacak!

Bu üç yer sizin için önemli olacak. Lokal bilgisayarınız geliştirme ve test yaptığınız yer olacak. Değişikliklerden memnun olduğunuzda programınızın bir kopyasını Github'a koyacaksınız. Web siteniz PythonAnywhere üzerinde olacak ve onu kodunuzun bir kopyasını Github'dan alarak güncelleyeceksiniz.

# Git

> **Not** Eğer kurulum adımlarını zaten yaptıysanız, bunu tekrar yapmanıza gerek yok - bir sonraki bölüme geçip Git reponuzu oluşturabilirsiniz.

{% include "/deploy/install_git.md" %}

## Git repomuzu oluşturalım

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
    /.vscode
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

Ve onu `.gitignore` ismi ile "djangogirls" dizinine kaydedin.

> **Not** Dosya adının başındaki nokta önemli! Eğer dosyayı oluştururken zorluk yaşarsanız (örneğin Mac'ler Finder'dan nokta ile başlayan bir dosya oluşturmanızdan hoşlanmazlar), editörünüzdeki "Farklı Kaydet" özelliğini kullanın böylece çalışacaktır. Dosya adına `.txt`,`.py` veya başka dosya uzantılarını eklemediğinizden emin olun-- Git sadece `.gitignore` uzantılı dosyaları tanıyacaktır. Linux ve MacOS `.` ile başlayan dosya isimlerimi saklar (örn. `.gitignore`) ve normal `ls` komutu bu dosyaları göztermez. `.gitignore` dosyasını görmek için `ls -a` komutunu kullanın.
> 
> **Not** `.gittignore` dosyasında belirttiğiniz dosyalardan biri `db.sqlite3` dosyası. Bu yerel veritabanı, tüm kullanıcılar ve mesajların saklandığı dosyadır. Standart web programlama uygulamasını izleyerek, yerel test siteniz ve PythonAnywhere'deki canlı web siteniz için ayrı veritabanları kullanacağız. Bu veritabanı geliştirme makinenizdeki gibi SQLite olabilir ama genelde sitenizdeki çok daha fazla ziyaretçiyi kaldırabilecek MySQL adı verilen bir veritabanı kullanacaksınız. Her iki durumda da, GitHub kopyası için SQLite veritabanınızı yok saymanız, şu ana kadar oluşturduğunuz tüm gönderilerin lokalinizde kalması ve yalnızca lokal olarak kullanılabilmeniz anlamına geliyor. Canlıda onlara ulaşabilmeniz için yeniden eklemek zorundasınız. Lokal veritabanınızı farklı şeyleri test edebileceğiniz ve blogunuzdaki gerçek gönderilerinizi silmekten korkmayacağınız iyi bir oyun alanı olarak düşünmelisiniz.

`git add` kullanmadan önce veya nelerin değiştiğinden emin değilseniz, `git status` komutunu kullanmakta yarar var. Bu, yanlış dosyaların eklenmesi ve gönderilmesi gibi istenmeyen sürprizlerin engelenmesine yardımcı olacak. `git status` komutu, takip edilmeyen/değişen/gönderilecek dosyalar (staged), dal durumu (branch status) gibi bilgiler verir. Çıktıda aşağıdakine benzer olmalıdır:

{% filename %}komut-satırı{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

Ve son olarak değişikliklerimizi kaydediyoruz. Komut satırına gidin ve aşağıdaki komutları çalıştırın:

{% filename %}komut-satırı{% endfilename %}

    $ git add --all .
    $ git commit -m "Django Girls uygulamam, ilk commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Kodunu GitHub'a yollama (Push)

[GitHub.com](https://www.github.com)'a gidin ve ücretsiz yeni bir kullanıcı hesabı oluşturun. (Eğer atölye hazırlıklarında bunu zaten yaptıysanız, bu harika!) Parolanızı hatırladığınızdan emin olun (eğer kullanıyorsanız, parolanızı yöneticinize ekleyin).

Sıra depomuzu oluşturmaya geldi. 'New Repository' tuşuna tıklayıp "my-first-blog" adında bir Github deposu oluşturalım. "initialize with a README" ve ".gitignore" kutularının seçili olmadığından emin olalım (zaten .gitignore dosyamızı kendimiz oluşturmuştuk). Son olarak License seçeneğinde 'None' ı seçelim.

![](images/new_github_repo.png)

> **Not** `my-first-blog` ismi önemli -- başka bir şey de seçebilirsiniz, ama aşağıdaki yönergelerde çok geçiyor, her seferinde değiştirmeniz gerekir. En kolayı `my-first-blog` ismi ile devam etmek.

Bir sonraki ekranda, reponuzun klonlama URL'ini goreceksiniz, bu URL takip eden bir kac komutta kullanacagiz:

![](images/github_get_repo_url_screenshot.png)

Şimdi bilgisayarınızdaki Git reposunu Github'daki repo ile ilişkilendirmemiz gerekiyor.

Aşağıdakini komut satırına yazın (`< your-github-username>`) kısmını Github hesabını yarattığınız sırada kullandığınız kullanıcı adı ile değiştirin, büyüktür küçüktür işaretlerini eklemeyin):

{% filename %}komut-satırı{% endfilename %}

    $ git remote add origin https://github.com/<github-kullanıcı-adınız>/my-first-blog.git 
    $ git push -u origin master
    

GitHub’a bastığınızda, GitHub kullanıcı adınız ve şifreniz istenecektir (komut satırı penceresinde veya açılan pencerede) ve kimlik bilgilerini girdikten sonra şöyle bir şey görmelisiniz:

{% filename %}komut satırı{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/zeynep/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Kodunuz artık Github'da. Hemen gidip bakın! İyi bir çevrede olduğunu göreceksiniz - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), ve daha birçok harika açık kaynak yazılım projesi de kodlarını Github'da tutuyor. :)

# Blogumuzun PythonAnywhere üzerinde kurulumu

## PythonAnywhere hesabı oluşturma

> **Not** En baştaki kurulum adımlarında PythonAnywhere hesabını açmış olabilirsiniz - öyleyse bu kısmı tekrar yapmanıza gerek yok.

{% include "/deploy/signup_pythonanywhere.md" %}

## Sitemizin PythonAnywhere üzerinde yapılandırılması

Ana [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) a logosuna tıklayarak dönelim ve bir "Bash" console başlatalım – bu bilgisayarınızdaki komut satırının PythonAnywhere versiyonudur.

![PythonAnywhere web arayüzündeki 'New Console' bölümünde, 'bash' için butona tıkla](images/pythonanywhere_bash_console.png)

> **Not:** PythonAnywhere Linux tabanlıdır, eğer Windows kullanıyorsan, bilgisyarındaki konsoldan biraz farklı görünür.

PythonAnywhere'de bir web yazılımı konuşlandırmak için kodun GitHub'dan çekilmesi ve PythonAnywhere'in bu kodu tanıyabilmesi ve çalıştırması için yapılandırmamız gerekiyor. Bu iş manuel olarak yapabilir ama PythonAnywhere bunu kolaylıkla yapabilmek için yardımcı bir araç sunar. İlk önce bu aracı kuralım:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Bu komut ekrana bir takım şeyler yazar, mesela `Collecting pythonanywhere` den başlayıp, sonunda `Successfully installed (...) pythonanywhere- (...)` gibi bir şey der.

Şimdi, programımızı otomatik olarak yapılandırmak için bu komutu calıştıralım. Aşağıdakileri PythonAnywhere konsoluna yazın (`<your-github-username>` yerine kendi Github kullanıcı adınızı yazmayı unutmayın):

{% filename %}PythonAnywhere komut satırı{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.6 https://github.com/<your-github-username>/my-first-blog.git
    

Bu komut çalışırken neler olup bittiğini izleyebilirsiniz:

- Kodunuz GitHub'dan çekiliyor
- PythonAnywhere üzerinde kendi bilgisayarınızdaki gibi bir virtualenv oluşturuluyor
- Yayına almak için gerekli ayarlar (settings) dosyası güncelleniyor
- Yine `manage.py migrate` komutu ile PythonAnywhere üzerinde veritabanı oluşturuluyor
- Sabit dosyaların (bunları daha sonra öğreneceğiz) oluşturuluyor
- Ve web uygulamanızın API sinin PythonAnywhere tarafından sunulması için ayarlar yapılıyor

Bu adımlar PythonAnywhere'de otomatikleştirilmiştir, ancak farklı sunucu sağlayıcıları ile yapılacak olan adımlarla aynıdır.

Şu an dikkat edilmesi gereken en önemli şey PythonAnywhere'teki veritabanınızın aslında kendi bilgisayarınızdaki veritabanından tamamen ayrı olmasıdır, böylece farklı yayınlara ve yönetici hesaplarına sahip olabilir. Bu nedenle, aynen kendi bilgisayarımızda yapmış olduğumuz gibi, `createsuperuser` ile bir admin kullacısını oluşturmamız gerekiyor. PythonAnywhere otomatik olarak virtualenv i başlatmış olduğu için, bu kullanıcıyı hemen oluşturabiliriz:

{% filename %}PythonAnywhere komut satırı{% endfilename %}

    (<kullanici-adiniz>.pythonanywhere.com) $ python manage.py createsuperuser
    

Admin kullanıcısının detaylarını girin. Daha önce kendi bilgisayarınızda oluşturduğunuz kullanıcı detayları ile aynı tutarsanız hatırlamak daha kolay olacaktır, fakat güvenlik açısından PythonAnywhere üzerindeki şifreyi daha zor tanımlamak isteyebiliriz.

Şimdi, isterseniz, PythonAnywhere üzerindeki kodlara `ls` komutu ile göz atabilirsiniz:

{% filename %}PythonAnywhere komut satırı{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

"Files" sekmesine giderek de PythonAnywhere in sunduğu arayüz ile dosyaları gezinebilirsiniz. (Sağ üst köşedeki menü butonunu kullanarak, konsol sayfasından diğer PythonAnywhere sayfalarına geçebilirsiniz. Bu sayfaların birindeyken, sayfanın yukarısında diğer sayfalara olan linkleri görebilirsiniz.)

## Şimdi Canlı Yayındasınız!

Web siteniz şimdi İnternet üzerinden erişilebilir olmalı! PythonAnywhere "Web" tabına tıklayarak linki kopyalayıp istediğiniz herkes ile paylaşabilirsiniz :)

> **Not** Bu kılavuz başlangıçlara yönelik olduğu için basit tutmak amacıyla siteyi yayına alırken güvenlik açısından ideal olmayan bir kaç seçim yaptık. Eğer bu projeyi geliştirmek veya yeni bir projeye başlamak isterseniz, güvenlik tavsiyeleri için [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) sayfasını inceleyin.

## Hata ayıklama önerileri

`pa_autoconfigure_django.py` komut dosyasını çalıştırırken bir hata görürseniz, bunun yaygın birkaç nedeni vardır:

- PythonAnywhere API tokeni oluşturmayı unutmak.
- GitHub URL'nizde bir hata yapmak
- *"Could not find your settings.py"* hatası genellikle tüm gerekli dosyaların Git'e eklenmemiş ve/veya GitHub'a başarılı olarak push edilmemiş olmasından kaynaklanır. Tekrar Git bölümüne bakın
- Eğer daha önce PythonAnywhere hesabına kaydolduysanız ve collectstatic hatası ile karşılaştıysanız, büyük ihtimalle hesabınızda SQLite'ın eski versiyonunu (örneğin 3.8.2) kullanıyorsunuzdur. Bu durumda, yeni bir hesap açın ve PythonAnywhere bölümündeki komutları tekrar deneyin.

Websitenizi ziyaret ettiğiniz zaman bir hata ile karşılaşırsanız ilk bakacağınız yer **error log** dosyasıdır. PythonAnywhere [Web](https://www.pythonanywhere.com/web_app_setup/) sekmesinde bu dosyaya link bulabilirsiniz. Hata mesajlarını buradan kontrol edebilrisiniz; en yakın zamandaki hatalar en sonda yer alır.

[PythonAnywhere wiki üzerinde bazı genel hata giderme tüyoları](http://help.pythonanywhere.com/pages/DebuggingImportError) mevcuttur.

Ve eğitmeniniz size yardıma hazır, unutmayın!

# Sitenize göz atın!

Siteniz için bulunan varsayılan sayfa ''İşe yaradı!'' demelidir. Tıpkı yerel bilgisayarınızda olduğu gibi. URL'nin sonuna `/admin/` yazın, 'giriş' tuşuna bastığınızda admin sitesi açılacak. Kullanıcı adı ve parola ile giriş yapın, sunucuya yeni Mesaj ekleyebileceğinizi göreceksiniz - yerel test veritabanınızdaki yayınların canlı blogunuza gönderilmediğini unutmayın.

Birkaç gönderi oluşturduktan sonra, lokal kurulumunuza geri dönebilirsiniz (PythonAnywhere'e değil). Değişiklikleri lokalinizde yapacaksınız. Bu web geliştirmekte yaygın bir akışıdır - değişiklikleri yerel olarak yapar, sonra bu değişiklikleri GitHub'a gönderip canlı Web sunucusuna çekersiniz. Bu canlı web sitenizi bozmadan çalışmanızı ve yeni şeyler denemenizi sağlar. Bayağı havalı, di mi?

Kendinize *KOCAMAN* bir aferin diyin! Yayına alma web geliştirme işinin en uğraştırmalı kısımlarından biridir ve genelde çalışana kadar insanların birkaç gününü alır. Ama işte siteniz canlıda, gerçek internette!