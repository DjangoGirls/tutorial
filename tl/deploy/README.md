# I-deploy!

> **Paalala** Ang sumunod na kabanata ay maaring masyadong mahirap maintindihan paminsan-minsan. Magtiyaga at tapusin ito; ang pag-deploy ay isang pinaka-importanteng bahagi sa proseso ng paggawa ng mga website. Ang kabanatang ito ay nilagay sa gitnang bahagi ng tutorial para ang iyong tagapayo ay makatulong sa mga medyo mahirap na proseso sa pag-gawang online ng iyong website. Ibig sabihin nito, pwede mo pa ring tapusin ang tutorial na ikaw lang kahit maubusan ka pa ng oras.

Hanggang ngayon, ang iyong website ay magagamit lang sa iyong kompyuter. Sa ngayon, matutunan mo kung paano ito i-deploy! Ang pag-deploy ay isang proseso ng paglathala ng iyong application sa Internet para sa wakas ay mapuntahan at makita ng mga tao ang iyong app. :)

Base sa natutunan mo, ang website ay kinakailangang nakalagay sa isang server. There are a lot of server providers available on the internet, we're going to use [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere is free for small applications that don't have too many visitors so it'll definitely be enough for you now.

Ang isa pang external service na gagamitin ay ang [GitHub](https://www.github.com), na isang service ng naghohost ng mga code. Mayroon pang pang ibang mga providers, pero karamihan sa mga programmer ngayon ay mayroon nang account sa Github, at ngayon ikaw din!

Ang tatlong lugar na ito ay importante para sa iyo. Ang iyong lokal na komputer kung saan gagawin mo ang pag-dedevelop at pag-test. Kung masaya kana sa mga pagbabago, ikaw ay maglalagay ng kopya ng iyong program sa Github. Ang iyong website ay nandoon sa PythonAnywhere at atin itong i-update sa pamamagitan ng pagkuha ng bagong kopya ng iyong code mula sa Github.

# Git

> **Paalala** Maaring nagawa mo ang mga hakbang sa pag-install, hindi mo na kailangang gawin ito ulit - pwede kang dumeretso sa sunod na seksiyon at magsimulang maglikha ng iyong repository sa Git.

{% include "/deploy/install_git.md" %}

## Pinapaandar ang ating repository sa Git

Ang Git ay nagsubaybay sa mga pagbabago sa isang partikular na grupo ng file sa loob ng tinatawag na repository ng code (o "repo" sa maikli). Umpisahan natin ang isa para sa iyong proyekto. Buksan ang iyong consile at patakuhin ang mga command na ito, sa loob ng directory ng `djangogirls`:

> **Paalala** TIyakin ang iyong kasalukuyang working directory gamit ang `pwd` (Mac OS X/Linux) o `cd` (Windows) na command bago i-initialize ang repository. Dapat na nasa loob ka ng `djangogirls` na folder.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Ang pag-initialize ng git repository ay kailangang gawin nang isang beses lang sa bawat proyekto (at hindi na kinakailangang maglagay pa ng bansag at email kailanman).

Ang git ay magsubaybay sa mga pagbabago sa lahat ng mga file at mga folder sa loob ng directory, pero maaring may mga files na gusto nating isawalang-bahala. Gagawin natin ito sa pamamagitan ng paglikha ng file na tinatawag na `.gitignore` sa loob ng base na directory. Buksan ang iyong editor at maglikha ng bagong file na may sumusunod na nilalaman:

{% filename %}.gitignore{% endfilename %}

    *.pyc
    *~
    __pycache__
    myvenv
    db.sqlite3
    /static
    .DS_Store
    

At i-save ito isip `.gitignore` sa loob ng "djangogirls" na folder.

> **Paalala** Ang tuldok sa harap ng pangalan ng file ay importante! Kung ikaw ay nahihirapan sa paglikha nito (ang Mac ay hindi gusto na maglikha ka ng mga file na nagisisumula sa isang tulod sa pamamagitan ng Finder, halimbawa), kung gayon ay gamitin ang "Save As" na katangian ng iyong editor; ito ay himpit.
> 
> **Paalala** Isa sa mga file na nilakip mo sa iyong `.gitignore` file ay si `db.sqlite3`. Ang file na yan ay ang iyong local na database, kung saan lahat ng mga post mo ay nakalagay. Hindi natin gustong isali ito sa iyong repository dahil ang website mo sa PythonAnywhere ay gagamit ng ibang database. Ang database na yan ay maaring SQLite, gaya ng iyong pang-develop na machine, pero kadalasan gagamit ka ng MySQL, mas marami itong bisita na makakaya kaysa sa SQLite. Alinman dito, ang pagsawalang-bahala sa iyong SQLite na data para sa iyong kopya sa github, ay pamamaraan para ang lahat ng post na iyong nalikha ay mananatili at magagamit lamang sa iyong lokalidad, pero kailangan mo pa ring isali ito uli sa production. Isipin mo ang iyong local na database na isang magandang palaruan kung saan pede mung masubukan ang ibat-ibang bagay na walang takot na mabura mo ang mga tunay na post galing sa iyong blog.

Mainam na gamitin mo muna ang `git status` na commmand bago ka mag `git add` o kapag hindi ka sigurado kung ano ang nagbago. Nakakatulong ito para hindi ka mabigla sa mga pangyayari, gaya ng mga maling file na nasali at na-commit. Ang `git status` na command ay naghahatid ng mga impormasyon sa lahat ng mga file na hindi naka track/binago/at na-stage, ang estado ng branch, at marami pang iba. Ang output ay dapat kagaya ng sumusunod:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
    
    nothing added to commit but untracked files present (use "git add" to track)
    

At sa wakas, ating i-save ang ating mga binago. Pumunta iyong console at patakbuhin ang mga command na ito:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
     ```
    
    
    ## Pushing your code to GitHub
    
    Pumunta sa [GitHub.com](https://www.github.com) at magsign-up ng bago, at libreng user account. (Kung nagawa mo na ito sa paghahanda sa workshop, magaling!)
    
    Pagkatapos, maglikha ng bagong repository, at pangalanan mo ito nang "my-first-blog". Hayaan ang "initialize with a README" na checkbox na hindi naka tsek, hayaan ang opsyon na .gitignore na walang laman (nagawa natin ito nang manu-mano) at hayaan ang Lisensya na naka-set sa None.
    
    <img src="images/new_github_repo.png" />
    
    > **Paalala** Importante ang pangalan na `my-first-blog` – pwede kang pumili ng iba, pero ito ay maraming beses na makikita mo sa mga instruksiyon sa baba, at kailangan mo itong palitan sa bawat beses. Mas madali kung ang gamitin mo nalang na pangalan ay ang `my-first-blog`.
    
    Sa kasunod na screen, ipapakita sa clone URL ng iyong repo. Piliin ang "HTTPS" na bersyon, kopyahin ito, at agad natin itong idikit sa terminal:
    
    <img src="images/github_get_repo_url_screenshot.png" />
    
    Ngayon kailang nating ikabit ang repository ng Git sa iyong kompyuter doon sa kopya ng Github.
    
    I-type ang sumusunod sa iyong console (Palitan ang `<your-github-username>` ng basag na nilagay mo sa paglikha mo ng iyong Github na account, pero walang mga angle-bracket):
    
    {% filename %}command-line{% endfilename %}
    

$ git remote add origin https://github.com/<your-github-username>/my-first-blog.git $ git push -u origin master

    <br />Ilagay ang iyong GitHub na username at password at makikita mo ang gaya nito:
    
    {% filename %}command-line{% endfilename %}
    

Username for 'https://github.com': hjwp Password for 'https://hjwp@github.com': Counting objects: 6, done. Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done. Total 3 (delta 0), reused 0 (delta 0) To https://github.com/hjwp/my-first-blog.git

- [new branch] master -> master Branch master set up to track remote branch master from origin.

    <br />&lt;!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension --&gt;
    
    Ang iyong code ay nasa GitHub na. Puntahan at suriin ito!  Makikita mo na ito ay nasa magandang grupo – [Django](https://github.com/django/django), ang [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), at marami pang ibang magagandang mga open-source proyekto na mga software na nakahost din ang code sa Github. :)
    
    
    # Sini-setup ang iyong blog sa PythonAnywhere
    
    &gt; **Paalala** Maaring nakalikha ka na ng account sa PythonAnywhere sa pag-install na baitang - kung gayon, hindi mo na kalilangan itong ulitin.
    
    {% include "/deploy/signup_pythonanywhere.md" %}
    
    
    ## Pulling our code down on PythonAnywhere
    
    Kung nakasign-up ka sa PythonAnywhere, dadalhin ka sa iyong dashboard o "Consoles" na pahina. Piliin ang opsyon para patakbuhin ang console na "Bash" - yan ang bersyon ng PythonAnywhere na console, gaya ng sa iyong kompyuter.
    
    &lt;img src="images/pythonanywhere_bash_console.png" alt="pointing at Other: Bash in Start a new Console" /&gt;
    
    &gt; **Paalala** Ang PythonAnywhere ay nakabatay sa Linux, kung ikaw ay nasa Windows, ang console ay medyo kakaiba sa console ng kompyuter mo.
    
    Ating hahatakin ang ating code galing sa Github papunta sa PythonAnywhere sa pamamagitan ng paglikha ng "clone" ng ating repo. I-type mo ang sumusunod sa iyong console sa PythonAnywhere (wag kalimot na gamiting ang iyong GitHub na bansag kapalit ng `&lt;your-github-username&gt;`):
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ git clone https://github.com/<your-github-username>/my-first-blog.git

    <br />Ito ay maghahatag ng kopya ng iyong code papunta sa PythonAnywhere. Suriin ito sa pamamagitan ng pag-type ng `tree my-first-blog`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ tree my-first-blog my-first-blog/ ├── blog │ ├── **init**.py │ ├── admin.py │ ├── migrations │ │ ├── 0001_initial.py │ │ └── **init**.py │ ├── models.py │ ├── tests.py │ └── views.py ├── manage.py └── mysite ├── **init**.py ├── settings.py ├── urls.py └── wsgi.py

    <br /><br />### Creating a virtualenv on PythonAnywhere
    
    Tulad ng ginawa mo sa iyong sariling kompyuter, pwede kang maglikha ng virtualenv sa PythonAnywhere. Sa loob ng console ng Bash, i-type ang:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

$ cd my-first-blog

$ virtualenv --python=python3.6 myvenv Running virtualenv with interpreter /usr/bin/python3.6 [...] Installing setuptools, pip...done.

$ source myvenv/bin/activate

(myvenv) $ pip install django~=1.11.0 Collecting django [...] Successfully installed django-1.11.3

    <br /><br />&gt; **Paalala** Ang hakbang na `pip install` ay maaring tatagal ng ilang minuto.  Tiis, tiis!  Kung ito ay tatagal ng lampas na limang minuto, may problema.  Tanungin ang iyong coach.
    
    &lt;!--TODO: think about using requirements.txt instead of pip install.--&gt;
    
    ### Paglikha ng database sa PythonAnywhere
    
    Ito pa ang ibang bagay na kakaiba sa iyong kompyuter at server: ito ay gumagamit ng ibang database. Kaya ang mga user account at mga post ay maaring kakaiba sa iyong server at sa iyong kompyuter.
    
    Tulad ng ginawa natin sa iyong sariling kompyuter, uulitin natin ang hakbang sa pag-initialize ng database sa iyong server, gamit ang `migrate` at `createsuperuser`:
    
    {% filename %}PythonAnywhere command-line{% endfilename %}
    

(mvenv) $ python manage.py migrate Mga operasyon na kailangang gawin: [...] Applying sessions.0001_initial... OK (mvenv) $ python manage.py createsuperuser

    <br />## Paglathala ng ating blog isip isang web app
    
    Ngayon ang ating code ay nasa PythonAnywhere na, ang ating virtualenv ay handa na, at na initialize na ang database. Handa na kaming ilathala ito isip isang web app!
    
    I-click pabalik sa PythonAnywhere na dashboard sa pamamagitan ng pag-click sa logo nito, and then i-click ang **Web** na tab. Sa wakas, pindutin ang **Add a new web app**.
    
    Pagkatapos ikompirma ang pangalan ng iyong domain, piliin ang **manual configuration** (N.B. - *not* the "Django" option) sa loob ng dialog. Kasunod, piliin ang **Python 3.6**, at i-click ang Next para tapusin ang wizard.
    
    &gt; **Paalala** Siguraduhing napili mo ang opsyon na "Manual configuration", hindi yung "Django". Masyado tayong cool para sa default na Django setup ng PythonAnywhere. ;-)
    
    
    ### Setting the virtualenv
    
    Dadalhin ka sa config screen ng PythonAnywhere sa iyong webapp, kung saan ka kailangang pumunta sa tuwing gusto mong gumawa na pagbabago sa iyong app na nasa server.
    
    &lt;img src="images/pythonanywhere_web_tab_virtualenv.png" /&gt;
    
    Sa loob ng "Virtualenv" na bahagi, i-click ang pulang teksto na nagsasabing "Enter the path to a virtualenv", at pumasok sa `/home/&lt;your-PythonAnywhere-username&gt;/my-first-blog/myvenv/`. I-click ang asul na kahon na may checkmark para i-save ang path bago magpatuloy.
    
    &gt; **Paalala** Palitan ang iyong bansa sa PythonAnywhere kung kinakailangan. Kung may mga mali, magpapakita ang PythonAnywhere ng mga konting babala.
    
    
    ### Configuring the WSGI file
    
    Ang Django ay gumagana gamit ang "WSGI protocol", isang pamantayan sa pagpapatakbo ng mga website gamit ang Python, na sinusuportahan ni PythonAnywhere. Ang pamamaraan na ma-configure ang PythonAnywhere para makilala nya ang ating blog sa Django ay sa pamamagitan ng pag-edit ng WSGI na configuration file.
    
    I-click ang link ng "WSGI configuration file" (sa loob ng "Code" na seksiyon malapit sa taas ng pahina - tatawagin itong `/var/www/&lt;your-PythonAnywhere-username&gt;_pythonanywhere_com_wsgi.py`), at dadalhin ka sa isang editor.
    
    Burahin ang lahat ng lamat at palitan ito nang sumusunod: 
    
    
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
    

Ang trabaho ng file na ito ay para sabihan si PythonAnywhere kung saan ang ating web app nakatira at kung ano ang pangalan ng file para sa setting ng Django.

Ang `StaticFilesHandler` ay para sa pagbabahagi ng ating CSS. Ito ay awtomatikong nagawa para sayo habang nagdedevelop sa lokal sa pamamagitan ng pagpatakbo ng `runserver` na command. Malalaman natin ito nang masinsinan ang tungkol sa static na mga file sa huling parte ng tutorial, kung saan i-edit natin ang CSS para sa ating site.

Banatan ang **Save** na button at bumalik sa **Web** na tab.

Tapos na tayo! Banatan ang malaking berdeng **Reload** na button at maari mo nang matingnan ang iyong application. Makikita mo ang link sa taas ng pahina.

## Mga tip para sa pag-debug

Kung may nakita kang mga problema habang binista mo ang iyong website, ang una mong dapat tingnan ay ang mga debugging na impormasyon sa loob ng iyong **error log**. Makakakita ka ng link papunta dito sa [Web tab](https://www.pythonanywhere.com/web_app_setup/) ng PythonAnywhere. Tingnan kung may mga error na mga mensahe sa loob; ang pinakabago ay nasa ilalim. Ang mga karaniwang problema ay lakip nito:

- Kung malimutan ang isa sa mga hakbang na ginawa natin sa console: paglikha ng virtualenv, pag-activate nito, pag-install ng Django sa loob nito, at paglipat ng database.

- Kung may nagawang mali sa path ng virtualenv sa loob ng Web tab - kadalasan ay mayroon itong mga maliliit na pulang error message sa loob, kung may problema.

- May mga mali sa loob ng WSGI na configuration file - nakuha mo bang maayos ang daan papunta sa iyong my-first-blog na folder?

- Pinili mo ba ang parehang bersyon ng Python sa iyong virtualenv gaya ng ginawa mo sa web app? Ang dalawa ay dapat 3.6.

Mayroon ding mga [karaniwang debugging na mga tip sa wiki ng PythonAnywhere](https://www.pythonanywhere.com/wiki/DebuggingImportError).

At wag kalimutan, nandito ang iyong coach para tumulong!

# Buhay ka pa!

Ang default na pahina ng iyong website ay dapat nagsasabing "It worked!", gaya ng ginawa nito sa iyong lokal na kompyuter. Subukan mong magdagdag ng `/admin/` sa bandang huli ng URL, at dadalhin ka nito sa site ng admin. Maglog-in gamit ang iyong bansag at password, at makikita mo na maari kang magdagdag ng mga bagong Post sa server.

Kapay may nalikha ka nang mga posts, maari kang bumalik sa iyong lokal na setup (hindi sa PythonAnywhere). Mula dito, dapat kang magtrabaho sa iyong lokal na setup para sa mga pagbabago. Ito ay karaniwang pamamaraan sa web development - gumawa ng update sa lokal, i-push ang mga binago sa Github, at hatakin ang mga ito sa iyong live na Web server. Ito ay nagbibigay sa iyo ng pagkakataon na magtrabaho at mag-eksperimento na hindi nasisira ang iyong live na Web site. Galing, di ba?

Bigyan mo ang sarili mo ng isang *NAPAKALAKING* tapik sa likod mo! Ang pag deploy sa server ay isa sa mga mahihirap ng parte ng web development at ito ay kadalasang aabot ng ilang araw bago nila mapatakbo ito. Pero ikaw ay nakapatakbo ng sa iyong site nang live, sa tunay na Internet nang ganon na lang!