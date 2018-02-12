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
    

Username for 'https://github.com': ola Password for 'https://ola@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/ola/my-first-blog.git

- [new branch] master -> master Branch master orijinal branch masterı uzaktan takip etmek için kuruldu.

    <br />&lt;!--TODO: belki kurulum bölümünde ssh anahtarları yüklenir ve bir uzantısı olmayan ppl'ye işaret eder--&gt;
    
    Kodunuz şu anda GitHub'ta. Siteye girin ve kontrol edin!  İleride kendini iyi bir şirkette bulacaksın – [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) 'li ve bir çok büyük açık kaynak projesi kodlarını GitHub'da barındırır. :)
    
    
    # Setting up our blog on PythonAnywhere
    
    ## Sign up for a PythonAnywhere account
    
    &gt; **Note** You might have already created a PythonAnywhere account earlier during the install steps – if so, no need to do it again.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Configuring our site on PythonAnywhere
    
    Go back to the main [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) by clicking on the logo, and choose the option to start a "Bash" console – that's the PythonAnywhere version of a command line, just like the one on your computer.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="Pointing at Bash in the New Console section" /&gt;
    
    &gt; **Note** PythonAnywhere is based on Linux, so if you're on Windows, the console will look a little different from the one on your computer.
    
    Deploying a web app on PythonAnywhere involves pulling down your code from GitHub, and then configuring PythonAnywhere to recognise it and start serving it as a web application.  There are manual ways of doing it, but PythonAnywhere provides a helper tool that will do it all for you. Let's install it first:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pip3.6 install --user pythonanywhere

    <br />That should print out some things like `Collecting pythonanywhere`, and eventually end with a line saying `Successfully installed (...) pythonanywhere- (...)`.
    
    Now we run the helper to automatically configure our app from GitHub. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git

    <br />As you watch that running, you'll be able to see what it's doing:
    
    - Downloading your code from GitHub
    - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
    - Updating your settings file with some deployment settings
    - Setting up a database on PythonAnywhere using the `manage.py migrate` command
    - Setting up your static files (we'll learn about these later)
    - And configuring PythonAnywhere to serve your web app via its API
    
    On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.  The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
    
    As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ python manage.py createsuperuser

    <br />Type in the details for your admin user.  Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
    
    Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(ola.pythonanywhere.com) $ ls blog db.sqlite3 manage.py mysite static (ola.pythonanywhere.com) $ ls blog/ **init**.py **pycache** admin.py forms.py migrations models.py static templates tests.py urls.py views.py ```

You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.

## You are now live!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)

## Debugging tips

If you see an error while running the `pa_autoconfigure_django.py` script, there are a couple of common causes:

- Forgetting to create your API token.
- Making a mistake in your GitHub URL

If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.

There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).

And remember, your coach is here to help!

# Siteniz canlıda!

The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.

Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?

Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!