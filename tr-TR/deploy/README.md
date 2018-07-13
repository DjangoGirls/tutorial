# Yayına alın!

> **Not** Bir sonraki bölüm ara ara zor gelebilir. Dayanın ve bölümü bitirin; yayına alma, website geliştirme sürecinin önemli bir parçasıdır. Biraz daha uğraştırıcı olan websitesini canlıya alma işine eğitmeninizin yardım edebilmesi için bu bölümü tutorial'ın ortasına yerleştirdik. Böylece eğer zaman yetmezse tutorial'ı kendi başınıza bitirebilirsiniz.

Şimdiye kadar web sitenize sadece kendi bilgisayarınızdan girilebiliyordu. Şimdi onu nasıl canlıya alacağınızı öğreneceksiniz! Yayına alma uygulamanızı internette yayınlama sürecidir, böylelikle insanlar sonunda gidip uygulamanızı görebilirler. :)

Öğrendiğimiz üzere, bir websitesi bir sunucunun üstünde olmalıdır. İnternette birçok sunucu sağlayıcısı var, biz [PythonAnywhere](https://www.pythonanywhere.com/) kullanacağız. PythonAnywhere ücretsizdir ve çok fazla ziyaretçisi olmayan küçük uygulamalar içindir yani şu an sizin için kesinlikle yeterli olacaktır.

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
    $ git commit -m "Django Girls uygulamam, ilk commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Kodunu GitHub'a yollama (Push)

Şimdi [Github.com](https://www.github.com) adresine gidip bir Github hesabı açmalıyız. (Eğer daha önceden hesap açtıysanız süper!)

Sıra depomuzu oluşturmaya geldi. 'New Repository' tuşuna tıklayıp "my-first-blog" adında bir Github deposu oluşturalım. "initialize with a README" ve ".gitignore" kutularının seçili olmadığından emin olalım (zaten .gitignore dosyamızı kendimiz oluşturmuştuk). Son olarak License seçeneğinde 'None'yi seçelim.

![](images/new_github_repo.png)

> **Not** `my-first-blog` ismi önemli -- başka birşey de seçebilirsiniz, ama aşağıdaki yönergelerde çok geçiyor, her seferinde değiştirmeniz gerekir. En kolayı `my-first-blog` ismi ile devam etmek.

Bir sonraki ekranda, repo'yu klonlamak için gereken URL'yi göreceksiniz. "HTTPS"li versiyonunu seçin, kopyalayın. Birazdan onu komut penceresine yapıştıracağız:

![](images/github_get_repo_url_screenshot.png)

Şimdi bilgisayarınızdaki Git reposunu Github'daki repo ile ilişkilendirmemiz gerekiyor.

Aşağıdakini komut satırına yazın (`<github-kullanıcı-adınız>` kısmını Github hesabını yarattığınız sırada kullandığınız kullanıcı adı ile değiştirin, büyüktür küçüktür işaretlerini eklemeyin):

{% filename %}komut-satırı{% endfilename %}

    $ git remote add origin https://github.com/<github-kullanıcı-adınız>/my-first-blog.git 
    $ git push -u origin master
    

Github kullanıcı adı ve şifrenizi girin, ardından aşağıdakine benzer bir şey görmeniz gerekiyor:

{% filename %}komut satırı{% endfilename %}

    Username for 'https://github.com': zeynep 
    Password for 'https://zeynep@github.com': 
    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/zeynep/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Kodunuz artık Github'da. Hemen gidip bak! İyi bir çevrede olduğunu göreceksiniz - [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), ve daha birçok harika açık kaynak yazılım projesi de kodlarını Github'da tutuyor. :)

# Blogumuzun PythonAnywhere üzerinde kurulumu

## PythonAnywhere hesabı oluşturma

> **Not** En baştaki kurulum adımlarında PythonAnywhere hesabını açmış olabilirsiniz - öyleyse bu kısmı tekrar yapmanıza gerek yok.

{% include "/deploy/signup_pythonanywhere.md" %}

## Sitemizin PythonAnywhere üzerinde yapılandırılması

Ana [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) a logosuna tıklayarak dönelim ve bir "Bash" console başlatalım – bu bilgisayarınızdaki komut satırının PythonAnywhere versiyonudur.

![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)

> **Not:** PythonAnywhere Linux tabanlıdır, eğer Windows kullanıyorsan, bilgisyarındaki konsoldan biraz farklı görünür.

PythonAnywhere'de bir web yazılımı konuşlandırmak için kodun GitHub'dan çekilmesi ve PythonAnywhere'in bu kodu tanıyabilmesi ve çalıştırması için yapılandırmamız gerekiyor. Bu iş manuel olarak yapabilir ama PythonAnywhere bunu kolaylıkla yapabilmek için yardımcı bir araç sunar. İlk önce bu aracı kuralım:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.6 install --user pythonanywhere
    

Bu komut ekrana bir takım şeyler yazar, mesela `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.

Şimdi, programımızı otomatik olarak yapılandırmak için bu komutu calıştıralım. Aşağıdakileri PythonAnywhere konsoluna yazalım (GitHub username yerine kendi GitHub ismini yazmayı unutma `<your-github-username>`):

{% filename %}PythonAnywhere komut satırı{% endfilename %}

    $ git clone https://github.com/<github-kullanıcı-adınız>/my-first-blog.git
    

As you watch that running, you'll be able to see what it's doing:

- Downloading your code from GitHub
- Creating a virtualenv on PythonAnywhere, just like the one on your own PC
- Updating your settings file with some deployment settings
- Setting up a database on PythonAnywhere using the `manage.py migrate` command
- Setting up your static files (we'll learn about these later)
- And configuring PythonAnywhere to serve your web app via its API

On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.

As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.

Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite  static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
    templates  tests.py  urls.py  views.py
    

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

> **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/) for some tips on securing your site.

## Hata ayıklama önerileri

`pa_autoconfigure_django.py` komut dosyasını çalıştırırken bir hata görürseniz, bunun yaygın birkaç nedeni vardır:

- Forgetting to create your PythonAnywhere API token.
- Making a mistake in your GitHub URL
- If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

[PythonAnywhere wiki üzerinde bazı genel hata giderme tüyoları](http://help.pythonanywhere.com/pages/DebuggingImportError) mevcuttur.

Ve eğitmeniniz size yardıma hazır, unutmayın!

# Sitenize göz atın!

Siteniz için bulunan varsayılan sayfa ''İşe yaradı!'' demelidir. Tıpkı yerel bilgisayarınızda olduğu gibi. URL'nin sonuna `/admin/` yazın, 'giriş' tuşuna bastığınızda admin sitesi açılacak. Kullanıcı adı ve şifrenizle giriş yapın, sunucuda yeni blog yazıları girebildiğinizi göreceksiniz.

Birkaç gönderi oluşturduktan sonra, lokalinize (PythonAnywhere'e değil) geri dönebilirsiniz. Değişiklikleri lokalinizde yapacaksınız. Bu web geliştirmekte yaygın bir akışıdır - değişiklikleri yerel olarak yapınız, bu değişiklikleri GitHub'a gönderin, değişikliklerinizi canlı Web sunucusuna çekin. Bu canlı web sitenizi bozmadan çalışmanızı ve yeni şeyler denemenizi sağlar. Bayağı havalı, di mi?

Kendinize *KOCAMAN* bir aferin diyin! Yayına alma web geliştirme işinin en uğraştırmalı kısımlarından biridir ve genelde çalışana kadar insanların birkaç gününü alır. Ama işte siteniz canlıda, gerçek internette!