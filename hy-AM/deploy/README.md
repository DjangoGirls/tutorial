# Հրապարակում

> **Նշում** Հաջորդ գլուխը, որոշ դեպքերում կարող է մի փոքր դժվար թվալ: Եղեք համառ և ավարտին հասցրեք այն, սերվերային կայքի տեղադրումը վեբ մշակման կարևոր մասն է: Այս գլուխը միտումնավոր տեղադրված է ձեռնարկի մեջտեղում, որպեսզի ձեր ուսուցիչը կարողանա օգնել ձեզ կայք թողարկելու բարդ գործընթացում: Այս կերպ Դուք կարող եք ինքնուրույն լրացնել բոլոր գլուխները, նույնիսկ եթե ժամանակը սուղ է:

Մինչ այժմ ձեր կայքը հասանելի էր միայն ձեր համակարգչում: Այժմ դուք կսովորեք, թե ինչպես «տեղակայել/շահագործման հանձնել» ձեր կայքը: Տեղակայումը ձեր ծրագիրը ինտերնետում հրապարակելու գործընթացն է, որպեսզի մարդիկ վերջապես տեսնեն ձեր ստեղծած աշխատանքը: :)

Ինչպես արդեն գիտեք, կայքը պետք է տեղակայված լինի սերվերի վրա: Ինտերնետում կան շատ սերվերների մատակարարներ, մենք կօգտագործենք [PythonAnywhere](https://www.pythonanywhere.com/) - ը: PythonAnywhere- ն անվճար է փոքր ծրագրերի համար, որոնք ունեն փոքր թվով այցելուներ, ինչը մեզ համար ավելի քան բավարար է:

Մյուս արտաքին ծառայությունը, որը մենք կօգտագործենք, [ GitHub ](https://www.github.com) է, որը ծածկագրերի հոսթինգի (hosting-սպասարկման) ծառայություն է: Կան նաև այլ նմանատիպ ծառայություններ, բայց այսօր գրեթե յուրաքանչյուր ծրագրավորող ունի GitHub հաշիվ, և հիմա դուք նույնպես::

Այս երեք տեղերը ձեզ համար կարևոր կլինեն: Ձեր տեղական համակարգիչը կլինի այն վայրը, որտեղ դուք կկատարեք մշակում և փորձարկում: Երբ գոհ լինեք փոփոխություններից, ձեր ծրագրի պատճենը կտեղադրեք GitHub- ում: Ձեր կայքը կլինի PythonAnywhere- ում, և դուք այն կթարմացնեք ՝ GitHub-ից ձեր կոդի նոր օրինակը ստանալու միջոցով:

# Git

> ** Նշում ** Եթե դուք արդեն կատարել եք [installation steps](../installation/README.md), (տեղադրման քայլերը), ապա դա նորից անելու անհրաժեշտություն չկա. Կարող եք անցնել հաջորդ բաժին և սկսել ստեղծել ձեր Git պահոցը:

{% include "/deploy/install_git.md" %}

## Ստեղծեք մեր Git պահոցը:

Git- ը հետևում է ֆայլերի որոշակի հավաքածուի փոփոխությանը, որը կոչվում է պահոց (կրճատ ՝ «repo»): Եկեք ստեղծենք մեկը մեր նախագծի համար: Բացեք վահանակ և գործարկեք այս հրամանները `djangogirls` գրացուցակում.

> ** Նշում </ 0> Նախքան պահեստի նախնականացումը սկսեք, ստուգեք ձեր ընթացիկ աշխատանքային գրացուցակը `օգտագործելով `pwd` (Mac OS X/Linux) կամ `cd` (Windows) հրամաններ: Դուք պետք է լինեք ` djangogirls ` պանակում (folder):</p> </blockquote> 
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git init
>     Initialized empty Git repository in ~/djangogirls/.git/
>     $ git config --global user.name "Your Name"
>     $ git config --global user.email you@example.com
>     
> 
> Յուրաքանչյուր նախագծի համար անհրաժեշտ է նախաձևակերպել git պահոցը (git repository)միայն մեկ անգամ (և այլևս ստիպված չեք լինի կրկին մուտքագրել ձեր` օգտվողի անունն ու էլ. Փոստի հասցեն):
> 
> Git- ը հետևելու է տվյալ գրացուցակի բոլոր ֆայլերի և գրացուցակների փոփոխություններին, սակայն մենք գերադասում ենք անտեսել դրանցից մի քանիսը: Դա անելու համար մենք պետք է պահեստի բազային գրացուցակում ստեղծենք ` .gitignore ` կոչվող ֆայլ: Բացեք ձեր խմբագիրը և ստեղծեք նոր ֆայլ հետևյալ բովանդակությամբ.
> 
> {% filename %}.gitignore{% endfilename %}
> 
>     # Python
>     *.pyc
>     *~
>     __pycache__
>     
>     # Env
>     .env
>     myvenv/
>     venv/
>     
>     # Database
>     db.sqlite3
>     
>     # Static folder at project root
>     /static/
>     
>     # macOS
>     ._*
>     .DS_Store
>     .fseventsd
>     .Spotlight-V100
>     
>     # Windows
>     Thumbs.db*
>     ehthumbs*.db
>     [Dd]esktop.ini
>     $RECYCLE.BIN/
>     
>     # Visual Studio
>     .vscode/
>     .history/
>     *.code-workspace
>     
> 
> Եվ այն պահպանեք որպես ` .gitignore ` "djangogirls" արմատային գրացուցակում:
> 
> > ** Նշում ** Ֆայլի անվան սկզբում գտնվող կետը կարևոր է: Եթե ​​նման ֆայլեր ստեղծելու խնդիրներ ունեք (Mac- ը թույլ չի տա ձեզ, կետով սկսվող անունով ֆայլ ստեղծել օրինակ, Finder- ի միջոցով), ապա օգտագործեք "Save As" (-պահել որպես) կոճակը ձեր կոդի խմբագրի ընտրացանկում, դա հաստատ անվտանգ է: Եվ համոզվեք, որ ֆայլի անվանման մեջ չեք ավելացնում `.txt`, `.py` կամ որևէ այլ ընդլայնում - Git- ը դա կճանաչի միայն այն դեպքում, եթե անունը պարունակում է միայն `.gitignore`.: Այն ֆայլեր, որոնց անունները սկսվում են (օրինակ `.gitignore` ով) Linux- ը և MacOS-ը դրանք ընդունում են որպես թաքնված, և սովորական `ls` հրամանը ցույց չի տալիս այս ֆայլերը: Փոխարենը օգտագործեք `ls -a` հրամանը `.gitignore` ֆայլը տեսնելու համար:
> > 
> > **Նշում** Ձեր `.gitignore` ֆայլում նշված ֆայլերից մեկը `db.sqlite3` է: Այս ֆայլը ձեր (local database) տեղական տվյալների շտեմարանն է, որտեղ պահվում են ձեր օգտվողների բոլոր գրառումները: Մենք հետևելու ենք վեբ ծրագրավորման ստանդարտ պրակտիկային, ինչը նշանակում է, որ մենք կօգտագործենք առանձին տվյալների բազաներ ձեր տեղական թեստային կայքի և PythonAnywhere- ում ձեր կենդանի կայքի համար: PythonAnywhere տվյալների բազան կարող է լինել SQLite, ճիշտ այնպես, ինչպես ձեր զարգացման սարքում, բայց սովորաբար դուք կօգտագործեք MySQL անունով շտեմարան, որը կարող է սպասարկել այցելուների շատ ավելի մեծ քանակության, քան SQLite- ը: Ամեն դեպքում, անտեսելով ձեր SQLite տվյալների շտեմարանը GitHub- ի համար, նշանակում է, որ մինչ այժմ ձեր ստեղծած բոլոր հաղորդագրություններն ու գերշահագործողները հասանելի կլինեն միայն տեղական մակարդակում, և արտադրության համար անհրաժեշտ է ստեղծել նորերը: Դուք պետք է ձեր տեղական տվյալների բազայի (local database-ի) մասին մտածեք որպես լավ խաղահրապարակ, որտեղ կարող եք փորձարկել տարբեր բաներ և չվախենալ, որ ձեր իրական գրառումները կջնջեք ձեր բլոգից:
> 
> Լավ է օգտագործել `git status` (git կարգավիճակի) հրամանը նախքան`git add` (git ավելացնելը) կամ ցանկացած այլ պահ, երբ վստահ չեք, թե ինչն է փոխվել: Դա կօգնի Ձեզ զերծ մնալ տհաճ անակնկալներից, ինչպիսիք են սխալ ֆայլերի ավելացումը կամ կատարումը: `git status` (git կարգավիճակ) հրամանը վերադարձնում է տեղեկատվություն git- ում նախկինում չնկատված / փոփոխված / ներկայացված բոլոր ֆայլերի, ինչպես նաև մասնաճյուղի կարգավիճակի և այլնի մասին: Արդյունքը պետք է նման լինի հետևյալին.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git status
>     On branch master
>     
>     No commits yet
>     
>     Untracked files:
>       (use "git add <file>..." to include in what will be committed)
>     
>             .gitignore
>             blog/
>             manage.py
>             mysite/
>             requirements.txt
>     
>     nothing added to commit but untracked files present (use "git add" to track)
>     
> 
> Եվ վերջապես մենք կպահպանենք մեր փոփոխությունները: Անցեք վահանակին և մուտքագրեք այս հրամանները.
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git add .
>     $ git commit -m "My Django Girls app, first commit"
>      [...]
>      13 files changed, 200 insertions(+)
>      create mode 100644 .gitignore
>      [...]
>      create mode 100644 mysite/wsgi.py
>     
> 
> ## Հրապարակեք ձեր կոդը GitHub- ում
> 
> Անցեք [GitHub.com](https://www.github.com) կայք և գրանցվեք նոր անվճար օգտվողի հաշվի համար: (Եթե դա արդեն արել եք սեմինարի նախապատրաստական ​​փուլում, հիանալի է): Համոզվեք, որ հիշում եք ձեր գաղտնաբառը (ավելացրեք այն գաղտնաբառերի կառավարչին (password manager), եթե այն օգտագործում եք):
> 
> Հաջորդը, ստեղծեք նոր պահեստ ` "my-first-blog" (իմ առաջին բլոգը) անունով: "initialize with a README" վանդակը պետք չէ ընտրել, բաց թողեք .gitignore- ը (այս ֆայլը ձեռքով կստեղծենք) և թողեք License որպես None:
> 
> ![](images/new_github_repo.png)
> 
> > **Նշում** . `my-first-blog` (իմ առաջին բլոգ) պահեստի անվանումը շատ կարևոր է: Իհարկե կարող եք այլ անվանումով հանդես գալ, բայց այն բազմիցս հանդիպում է հրահանգներում, և ամեն անգամ ստիպված կլինեք փոխել այն ձեր սեփականով: Միգուցե ավելի հեշտ է պահպանել `my-first-blog` անվանումը:
> 
> Հաջորդ էկրանին կտեսնեք ձեր ռեպոյի կլոնային URL- ը, որը դուք կօգտագործեք հետևյալ հրահանգների միջոցով:
> 
> ![](images/github_get_repo_url_screenshot.png)
> 
> Այժմ մենք պետք է ձեր համակարգչում կապենք տեղական Git պահոցը GitHub- ի հետ:
> 
> Մուտքագրեք հետևյալը ձեր վահանակի (console-ի) մեջ (փոխարինեք `<your-github-username>` - ը ձեր GitHub հաշիվը ստեղծելիս մուտքագրած օգտանունով, բայց առանց անկյունային գծերի. իսկ URL-ը պետք է համապատասխանի ձեր տեսած կլոնային URL- ին):
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
>     $ git push -u origin master
>     
> 
> GitHub մուտք գործելուց հետո ձեզանից կպահանջվի ձեր GitHub օգտվողի անունն ու գաղտնաբառը (կա՛մ հենց այնտեղ ՝ հրամանի տողի պատուհանում, կա՛մ ելնող պատուհանում), և հավատարմագրերը մուտքագրելուց հետո պետք է հայտնվի նման մի բան.
> 
> {% filename %}command-line{% endfilename %}
> 
>     Counting objects: 6, done.
>     Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
>     Total 3 (delta 0), reused 0 (delta 0)
>     To https://github.com/ola/my-first-blog.git
>     
>      * [new branch]      master -> master
>     Branch master set up to track remote branch master from origin.
>     
> 
> <!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->
> 
> Ձեր ծածկագիրն այժմ GitHub- ում է: Գնացեք կայք և ստուգեք այն: Այն կարող եք գտնել հիանալի ընկերություններում ինչպիսիք են՝ [Django](https://github.com/django/django), the [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial), և շատ այլ բաց կոդով ծրագրեր GitHub- ում: :)
> 
> # PythonAnywhere- ում մեր բլոգի տեղադրումը
> 
> ## Գրանցվեք PythonAnywhere հաշվում
> 
> > **Նշում** Եթե ավելի վաղ դուք արդեն գրանցվել եք PythonAnywhere հաշվում, ապա կարիգ չկա այն կրկնել:
> 
> {% include "/deploy/signup_pythonanywhere.md" %}
> 
> ## Մեր կայքի տեղադրումը PythonAnywhere- ում
> 
> Վերադարձեք [PythonAnywhere Dashboard](https://www.pythonanywhere.com/) հիմնական ընտրացանկ ՝ կտտացրեք պատկերանշանին և ընտրեք "Bash" վահանակը (console) գործարկելու տարբերակը. Սա PythonAnywhere-ի command line-ի (հրամանի տողի) տարբերակն է, ինչպես ձեր համակարգչում:
> 
> ![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)
> 
> > **Հղում** PythonAnywhere- ը հիմնված է Linux- ի վրա, այնպես որ, եթե դուք օգտագործում եք Windows, ապա console-ը (վահանակը) մի փոքր այլ տեսք կունենա ձեր համակարգչի վրա:
> 
> PythonAnywhere- ում վեբ հավելվածի տեղադրումը ենթադրում է GitHub- ից ձեր կոդի բեռնումը և PythonAnywhere-ի կարգավորումը `որպեսզի այն ճանաչի և գործարկի որպես վեբ ծրագիր: Դա ձեռքով անելու եղանակներ կան, բայց PythonAnywhere- ը տրամադրում է օգնող գործիք, որն ամեն ինչ կանի ձեր փոխարեն: Եկեք նախ տեղադրենք այն.
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pip3.8 install --user pythonanywhere
>     
> 
> Վահանակը պետք է տպի նման մի բան, ինչպիսին է `Collecting pythonanywhere` և վերջում `Successfully installed (...) pythonanywhere- (...)`.
> 
> Այժմ մենք գործարկում ենք օգնականին ՝ GitHub-ից մեր հավելվածը ավտոմատ կերպով կարգավորելու համար: PythonAnyplace- ի վահանակի մեջ մուտքագրեք հետևյալ հրահանգը (մի մոռացեք օգտագործել ձեր GitHub օգտվողի անունը `<your-github-username>` -ի փոխարեն, որպեսզի URL- ը համապատասխանի GitHub-ի կլոնավորված URL- ին):
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pa_autoconfigure_django.py --python=3.8 https://github.com/<your-github-username>/my-first-blog.git
>     
> 
> Երբ տեսնեք, թե ինչպես է այն աշխատում, կարող եք հասկանալ, թե կոնկրետ ինչ է այն անում.
> 
> - Ներբեռնեք ձեր կոդը GitHub- ից
> - Virtualenv-ի ստեղծումը PythonAnyplace- ում `ճիշտ այնպես, ինչպես ձեր համակարգչում է
> - Թարմացրեք ձեր settings file-ը (կարգավորումների ֆայլը) տեղակայման որոշ կարգավորումներում (deployment settings)
> - Ստեղծեք տվյալների բազա PythonAnywhere-ում ՝ օգտագործելով այս `manage.py migrate` հրամանը
> - Ձեր ստատիկ ֆայլերի (static files) կարգավորում (դրանց մասին մենք կիմանանք ավելի ուշ)
> - Եվ կարգավորեք PythonAnywhere- ը `ձեր վեբ հավելվածը API- ի միջոցով սպասարկելու համար
> 
> On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider.
> 
> The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own computer, so it can have different posts and admin accounts. As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     (ola.pythonanywhere.com) $ python manage.py createsuperuser
>     
> 
> Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
> 
> Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     (ola.pythonanywhere.com) $ ls
>     blog  db.sqlite3  manage.py  mysite requirements.txt static
>     (ola.pythonanywhere.com) $ ls blog/
>     __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
>     tests.py  views.py
>     
> 
> You can also go to the "Files" page and navigate around using PythonAnywhere's built-in file browser. (From the Console page, you can get to other PythonAnywhere pages from the menu button in the upper right corner. Once you're on one of the pages, there are links to the other ones near the top.)
> 
> ## You are now live!
> 
> Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)
> 
> > **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.
> 
> ## Debugging tips
> 
> If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:
> 
> - Forgetting to create your PythonAnywhere API token.
> - Making a mistake in your GitHub URL
> - If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
> - If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.
> 
> If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere ["Web" page](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> 
> There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> 
> And remember, your coach is here to help!
> 
> # Check out your site!
> 
> The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server -- remember, the posts from your local test database were not sent to your live blog.
> 
> Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> 
> Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet!