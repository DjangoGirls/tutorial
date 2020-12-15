# Ṣàgbékalẹ̀!

> **Àkíyèsí** Àkòrí tó kàn yìí lè ṣòro díẹ̀ láti kọ́ yanjú nígbà mìíràn. Máa kọ́ ọ nìṣó kí o sì parí rẹ̀; ìṣàgbékalẹ̀ jẹ́ apá kan tó ṣe pàtàkì nínú ìlànà ìgbéjáde ààyè ayélujára náà. Àkòrí yìí wà ní àárín àlàyé náà kí atọ́nisọ́nà rẹ bá lè ràn ọ́ lọ́wọ́ pẹ̀lú ìlànà gbígbé ààyè ayélujára rẹ sórí íńtánẹ́ẹ̀tì tó bá ṣòro díẹ̀ náà. Èyí túmọ̀ sí pé o ṣì lè parí àlàyé náà fúnra rẹ tí kò bá sí àkókò mọ́.

Títí di báyìí, ààyè ayélujára rẹ wà lórí kọ̀mpútà rẹ nìkan. Ní báyìí, o máa kọ́ bí o ṣe lè ṣàgbékalẹ̀ rẹ̀! Ṣíṣe àgbékalẹ̀ jẹ́ ìlànà ṣíṣe ìgbéjáde ètò rẹ sórí Íńtánẹ́ẹ̀tì kó lè ṣeéṣe fún àwọn èèyàn láti lọ wo ètò rẹ. :)

Gẹ́gẹ́ bí o ṣe kẹ́kọ̀ọ́, ààyè ayélujára kan ní láti wà lórí server kan. Ọ̀pọ̀lọpọ̀ àwọn olùpèsè server ló wà lórí íńtánẹ́ẹ̀tì, a máa lo [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere wà lọ́fẹ̀ẹ́ fún àwọn ètò kékèké tí kò ní àwọn àlejò púpọ̀, nítorí náà yóò tó fún ọ ní báyìí.

Ìpèsè ìta mìíràn tí a ó máa lò ni [GitHub](https://www.github.com), èyí tó jẹ́ ìpèsè kan fún pípèsè kóòdù. Àwọn mìíràn wà níbẹ̀, ṣùgbọ́n ó fẹ́rẹ̀ẹ́ jẹ́ gbogbo àwọn onímọ̀ nípa kóòdù ló ní account GitHub kan ní àkókò tá a wà yìí, ìwọ náà yíò ní báyìí!

Àwọn ààyè mẹ́ta wọ̀nyí yíò ṣe pàtàkì sí ẹ. Kọ̀mpútà tìẹ yíò jẹ́ ààyè tí o ti máa ṣe ìgbéjáde àti ṣíṣe àyẹ̀wò. Nígbà tí inú rẹ bá dùn pẹ̀lú àwọn ìyípadà náà, ìwọ yíò fi ẹ̀dà ètò rẹ kan sórí GitHub. Ààyè ayélujára rẹ yíò wà lórí PythonAnywhere, ìwọ yíò máa ṣe ìmúdójúìwọ̀n rẹ̀ nípasẹ̀ gbígba ẹ̀dà tuntun kan ti kóòdù rẹ láti GitHub.

# Git

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## Bíbẹ̀rẹ̀ repository Git wa

Git máa n ṣàmójútó àwọn ìyípadà sí àpapọ̀ àwọn fáìlì pàtó kan nínú ohun tí a n pè ní repository kóòdù kan (tàbí "repo" ní kúkúrú). Jẹ́ ká bẹ̀rẹ̀ ẹyọkan fún iṣẹ́ wa. Ṣí console rẹ kalẹ̀ kí o sì ṣe àwọn àṣẹ wọ̀nyí, nínú àkójọpọ̀ fáìlì `djangogirls` náà:

> **Àkíyèsí** Ṣàyẹ̀wò àkójọpọ̀ fáìlì rẹ tó n ṣiṣẹ́ lọ́wọ́lọ́wọ́ pẹ̀lú àṣẹ `pwd` (Mac OS X/Linux) tàbí `cd` (Windows) ṣáájú bíbẹ̀rẹ̀ repository náà. Ó yẹ kí o wà nínú fódà `djangogirls` náà.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

Bíbẹ̀rẹ̀ repository Git náà jẹ́ nnkan kan tí a nílò láti ṣe lẹ́ẹ̀kan ṣoṣo péré lórí iṣẹ́ kan (àti pé ìwọ kò ní láti tún tẹ orúkọ aṣàmúlò àti ímeèlì náà mọ́).

Git yíò ṣàmójútó àwọn ìyípadà sí gbogbo àwọn fáìlì àti fódà tó wà nínú àkójọpọ̀ fáìlì yìí, ṣùgbọ́n àwọn fáìlì kan wà tí a fẹ́ kí ó fojú fò. A máa ṣe èyí nípasẹ̀ ṣíṣẹ̀dá fáìlì kan tí a n pè ní `.gitignore` sínú àkójọpọ̀ fáìlì ìpìlẹ̀ náà. Ṣí olóòtú rẹ kalẹ̀ kí o sì ṣẹ̀dá fáìlì tuntun kan pẹ̀lú àwọn àkóónú tó tẹ̀le yìí:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder at project root
    /static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

Tọ́jú rẹ̀ gẹ́gẹ́ bí `.gitignore` sínú fódà "djangogirls" náà.

> **Àkíyèsí** Àmì tó-ín (dot) tó wà ní ìbẹ̀rẹ̀ orúkọ fáìlì náà ṣe pàtàkì! Tí o bá n kojú ìṣòro kankan pẹ̀lú ṣíṣẹ̀dá rẹ̀ (fún àpẹẹrẹ, MacOS kò nífẹ̀ẹ́ kí o ṣẹ̀dá àwọn fáìlì tó bẹ̀rẹ̀ pẹ̀lú àmì tó-ín kan nípasẹ̀ Finder náà), nígbà náà lo ẹ̀yà "Save As" tó wà nínú olóòtú rẹ, ó máa yanjú ìṣòro náà. Ri dájú pé ìwọ kò ṣàfikún `.txt`, `.py`, tàbí èyíkéyìí àfikún mìíràn sí orúkọ fáìlì náà -- Git yíò lè dá fáìlì náà mọ̀ tí orúkọ náà bá jẹ́ `.gitignore` nìkan. Linux and MacOS treat files with a name that starts with `.` (such as `.gitignore`) as hidden and the normal `ls` command won't show these files. Instead use `ls -a` to see the `.gitignore` file.
> 
> **Àkíyèsí** Ọ̀kan lára àwọn fáìlì tí o dárúkọ pàtó nínú fáìlì `.gitignore` rẹ jẹ́ `db.sqlite3`. Fáìlì yẹn jẹ́ àkójọpọ̀ dátà ti orí kọ̀mpútà rẹ, níbi tí gbogbo àwọn aṣàmúlò àti àwọn àròkọ rẹ gba títọ́jú sí. A ó tẹ̀lé ìlànà kíkọ kóòdù ayélujára, tó túmọ̀sí pé a ó lo àkójọpọ̀ dátà ọ̀tọ̀ọ̀tọ̀ fún ààyè ṣíṣe àyẹ̀wò lórí kọ̀mpútà rẹ àti ààyè ayélujára rẹ tó n ṣiṣẹ́ lórí PythonAnywhere. Àkójọpọ̀ dátà PythonAnywhere náà lè jẹ́ SQLite, bíi ẹ̀rọ ìgbéjáde rẹ, ṣùgbọ́n ìwọ yíò sábà máa lo ọ̀kan tí a n pè ní MySQL èyí tó lè kojú àwọn àlejò ààyè púpọ̀ ju SQLite lọ. Èyí tó wù kó jẹ́, nípasẹ̀ fífojú fo àkójọpọ̀ dátà SQLite rẹ fún ẹ̀dà GitHub náà, ó túmọ̀ sí pé gbogbo àwọn àròkọ àti alábòójútó tí o ti ṣẹ̀dá látẹ̀yìnwá máa wà lórí kọ̀mpútà rẹ nìkan, àti pé ìwọ yíò ní láti ṣẹ̀dá àwọn tuntun lásìkò iṣẹ́. Ó yẹ kí o ronú nípa àkójọpọ̀ dátà tó wà lórí kọ̀mpútà rẹ gẹ́gẹ́ bí ibi ìṣeré tó dára kan níbi tí o ti lè ṣàyẹ̀wò oríṣiríṣi nǹkan láìbẹ̀rù pé o máa yọ àwọn àròkọ gidi rẹ kúrò lórí blog rẹ.

Ó jẹ́ èrò tó dára kan láti lo àṣẹ `git status` kan ṣáájú `git add` tàbí nígbàkígbà tí o bá rí pé o tí ń ṣiyèméjì nípa ohun tó ti yípadà. Èyí yíò ṣe ìrànlọ́wọ́ láti ṣèdíwọ́ fún èyíkéyìí ìyàlẹ́nu láti ṣẹlẹ̀, gẹ́gẹ́ bíi ṣíṣe àfikún tàbí commit àwọn fáìlì tí kò yẹ. Àṣẹ `git status` náà yíò dá ìròyìn padà nípa àwọn fáìlì ti kò ní àmójútó/tí a ṣàtúnṣe/tí a gbé kalẹ̀, ipò ẹ̀ka náà, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ. Ó yẹ kí àbájáde náà jọ èyí tó tẹ̀le yìí:

{% filename %}command-line{% endfilename %}

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
    

Ní ìparí, a máa tọ́jú àwọn ìyípadà wa. Lọ sí console rẹ kí o ṣe àwọn àṣẹ wọ̀nyí:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## Títi kóòdù rẹ sí GitHub

Lọ sí [GitHub.com](https://www.github.com) kí o sì forúkọ sílẹ̀ fún account aṣàmúlò ọ̀fẹ́ tuntun kan. (Tí o bá ti ṣe ìyẹn tẹ́lẹ̀ nínú ìmúrasílẹ̀ àpérò náà, ó dára!) Ri dájú láti rántí ọ̀rọ̀ aṣínà rẹ (ṣàfikún rẹ̀ sínú alákòóso ọ̀rọ̀ aṣínà rẹ, tí o bá lo ọ̀kan).

Lẹ́yìn náà, ṣẹ̀dá repository tuntun kan, pẹ̀lú orúkọ "my-first-blog". Fi àpótí adarí yíyàn "initialize with a README" náà sílẹ̀ láì yàn, fi àṣàyàn .gitignore náà sílẹ̀ ní òfìfo (a ti ṣe ìyẹn fúnra wa) àti pé fi License náà sílẹ̀ gẹ́gẹ́ bí None.

![](images/new_github_repo.png)

> **Àkíyèsí** Orúkọ `my-first-blog` náà ṣe pàtàkì – o lè yan nǹkan mìíràn, ṣùgbọ́n yóò máa wáyé ní ọ̀pọ̀ ìgbà nínú àwọn ìtọ́sọ́nà tó wà nísàlẹ̀, ìwọ yíò sì ní láti máa rọ́pò rẹ̀ nígbà kọ̀ọ̀kan. Ó ṣeéṣe kó rọrùn láti faramọ́ orúkọ `my-first-blog` náà.

Lórí ojú àwòrán tó kàn náà, ìwọ yíò rí URL ìfijọ ti repo rẹ, èyí tí o máa lò nínú àwọn kan lára àwọn àṣẹ tó tẹ̀le yìí:

![](images/github_get_repo_url_screenshot.png)

Ní báyìí, a nílò láti ṣe ìsopọ̀ repository Git tó wà lórí kọ̀mpútà rẹ pẹ̀lú èyí tó wà lórí GitHub.

Tẹ èyí tó tẹ̀le yìí sínú console rẹ (rọ́pò `<your-github-username>` pẹ̀lú orúkọ aṣàmúlò tí o tẹ̀ nígbà tí o ṣẹ̀dá account GitHub rẹ, ṣùgbọ́n láìsí àwọn àkámọ́ onígun náà -- ó yẹ kí URL náà dọ́gba pẹ̀lú URL ìfijọ tí o ṣẹ̀ṣẹ̀ rí):

{% filename %}command-line{% endfilename %}

    $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
    $ git push -u origin master
    

Nígbà tí o bá ti kóòdù rẹ sí GitHub, ìwọ yíò rí ìbéèrè fún orúkọ aṣàmúlò àti ọ̀rọ̀ aṣínà GitHub rẹ (bóyá nínú fèrèsé ìlà ìpàṣẹ náà tàbí nínú fèrèsé aṣẹ́yọsókè kan), àti pé lẹ́yìn títẹ àwọn ohun-ẹ̀rí, ó yẹ kí o rí nnkan kan báyìí:

{% filename %}command-line{% endfilename %}

    Counting objects: 6, done.
    Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github.com/ola/my-first-blog.git
    
     * [new branch]      master -> master
    Branch master set up to track remote branch master from origin.
    

<!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->

Kóòdù rẹ ti wà lórí GitHub ní báyìí. Lọ síbẹ̀ kí o ṣàyẹ̀wò rẹ̀! Ìwọ yíò ri pé ó wà ní ibi tó dáa – [Django](https://github.com/django/django), [Django Girls Tutorial](https://github.com/DjangoGirls/tutorial) náà, àti ọ̀pọ̀lọpọ̀ àwọn iṣẹ́ ńláńlá mìíràn tó jẹ́ ètò orísun gbangba máa n pèsè kóòdù wọn sórí GitHub. :)

# Ṣíṣe àgbékalẹ̀ blog wa sórí PythonAnywhere

## Forúkọ sílẹ̀ fún account PythonAnywhere kan

> **Àkíyèsí** Ó ṣeéṣe kí o ti ṣẹ̀dá account PythonAnywhere kan tẹ́lẹ̀ lásìkò àwọn ìgbésẹ̀ ìṣàgbékalẹ̀ náà – tó bá rí bẹ́ẹ̀, kò sídìí láti tún ṣe é mọ́.

{% include "/deploy/signup_pythonanywhere.md" %}

## Ṣíṣe ètò ààyè wa lórí PythonAnywhere

Padà sí [Pánẹ́ẹ̀lì ìdarí PythonAnywhere](https://www.pythonanywhere.com/) pàtàkì náà nípasẹ̀ títẹ orí àmì náà, kí o sì yan àṣàyàn láti bẹ̀rẹ̀ console "Bash" kan – ìyẹn ni ẹ̀yà ìlà ìpàṣẹ ti PythonAnywhere kan, gẹ́gẹ́ bíi èyí tó wà lórí kọ̀mpútà rẹ.

![Abala 'New Console' náà lórí atọ́kùn ayélujára PythonAnywhere, pẹ̀lú bọ́tìnnì kan fún 'bash'](images/pythonanywhere_bash_console.png)

> **Àkíyèsí** PythonAnywhere dá lórí Linux, nítorí náà tí o bá wà lórí Windows, console náà yíò yàtọ̀ díẹ̀ sí èyí tó wà lórí kọ̀mpútà rẹ.

Ṣíṣe àgbékalẹ̀ ètò ayélujára kan sórí PythonAnywhere ní láti ṣe pẹ̀lú fífa kóòdù rẹ láti GitHub, lẹ́yìn náà ṣíṣe ètò PythonAnywhere láti dá a mọ̀ àti bẹ̀rẹ̀ pípèsè rẹ̀ gẹ́gẹ́ bí ètò ayélujára kan. Àwọn ọ̀nà tí o lè gbà ṣé fúnra rẹ wà, ṣùgbọ́n PythonAnywhere pèsè irinṣẹ́ olùrànlọ́wọ́ kan tí yíò ṣe gbogbo rẹ̀ fún ẹ. Jẹ́ ká kọ́kọ́ ṣàgbékalẹ̀ rẹ̀:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pip3.8 install --user pythonanywhere
    

Ó yẹ kí ìyẹn ṣàtẹ̀jáde àwọn nnkan kan bíi `Collecting pythonanywhere`, kí o sì parí gbẹ̀yìn pẹ̀lú ìlà kan tó n sọ pé `Successfully installed (...) pythonanywhere- (...)`.

Ní báyìí, a máa mú olùrànlọ́wọ́ náà ṣiṣẹ́ láti ṣètò ètò wa láti GitHub fúnra rẹ̀. Tẹ èyí tó tẹ̀le yìí sínú console náà lórí PythonAnywhere (má gbàgbé láti lo orúkọ aṣàmúlò GitHub rẹ dípò `<your-github-username>`, kí URL náà bàa lè dọ́gba pẹ̀lú URL ìfijọ láti GitHub náà):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ pa_autoconfigure_django.py --python=3.8 https://github.com/<your-github-username>/my-first-blog.git
    

Bó o ṣe ń wo ìyẹn tó n ṣiṣẹ́, ìwọ yíò lè rí ohun tó ń ṣe:

- Gbígba kóòdù rẹ láti GitHub
- Ṣíṣẹ̀dá virtualenv kan lórí PythonAnywhere, gẹ́gẹ́ bí èyí tó wà lórí kọ̀mpútà tìẹ
- Ṣíṣe ìmúdójúìwọ̀n fáìlì àwọn ìṣètò rẹ pẹ̀lú àwọn ìṣètò ìṣàgbékalẹ̀ kan
- Ṣíṣe àgbékalẹ̀ àkójọpọ̀ dátà kan sórí PythonAnywhere pẹ̀lú lílo àṣẹ `manage.py migrate` náà
- Ṣíṣe àgbékalẹ̀ àwọn fáìlì tó wà lójú kan rẹ (a ó kẹ́kọ̀ọ́ nípa àwọn wọ̀nyí tó bá yá)
- Àti ṣíṣe ètò PythonAnywhere láti pèsè ètò ayélujára rẹ nípasẹ̀ API rẹ̀

Lórí PythonAnywhere, gbogbo àwọn ìgbésẹ̀ wọ̀nyí máa jẹ́ ṣíṣe fúnra wọn, ṣùgbọ́n wọ́n jẹ́ àwọn ìgbésẹ̀ kannáà tí o ní láti gbà kọjá pẹ̀lú èyíkéyìí olùpèsè server mìíràn.

Ohun pàtàkì láti ṣàkíyèsí ní báyìí ni pé àkójọpọ̀ dátà rẹ lórí PythonAnywhere yàtọ̀ pátápátá sí àkójọpọ̀ dátà rẹ lórí kọ̀mpútà tìẹ, nítorí náà ó lè ní àwọn àròkọ àti account alábòójútó ọ̀tọ̀ọ̀tọ̀. Nítorí èyí, gẹ́gẹ́ bí a ṣe ṣe lórí kọ̀mpútà tìẹ, a nílò láti bẹ̀rẹ̀ account alábòójútó náà pẹ̀lú `createsuperuser`. PythonAnywhere ti mú virtualenv rẹ ṣiṣẹ́ fún ẹ fúnra rẹ̀, nítorí náà gbogbo ohun tí o nílò láti ṣe ni:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ python manage.py createsuperuser
    

Tẹ àwọn àlàyé fún aṣàmúlò alábòójútó rẹ. Ó dára jù láti lo àwọn ohun kannáà gẹ́gẹ́ bí o ṣé n lo lórí kọ̀mpútà tìẹ láti yẹra fún èyíkéyìí ìdààmú, àyàfi tí o bá fẹ́ mú ọ̀rọ̀ aṣínà lórí PythonAnywhere túbọ̀ láàbò síi.

Ní báyìí, tí o bá fẹ́, o lè tún ṣàyẹ̀wò kóòdù rẹ lórí PythonAnywhere pẹ̀lú lílo `ls`:

{% filename %}PythonAnywhere command-line{% endfilename %}

    (ola.pythonanywhere.com) $ ls
    blog  db.sqlite3  manage.py  mysite requirements.txt static
    (ola.pythonanywhere.com) $ ls blog/
    __init__.py  __pycache__  admin.py  apps.py  migrations  models.py
    tests.py  views.py
    

O tún lè lọ sí ojú-ìwé "Files" náà kí o sì lọ káàkiri pẹ̀lú lílo aṣàwákiri fáìlì ti PythonAnywhere. (Láti ojú-ìwé Console náà, o lè dé àwọn ojú-ìwé PythonAnywhere mìíràn láti bọ́tìnnì àkójọ àṣàyàn náà ní igun òkè lápá ọ̀tún. Tí o bá ti wà lórí ọ̀kan lára àwọn ojú-ìwé náà, àwọn atọ́ka sí àwọn yòókù náà yíò wà nítòsí òkè náà.)

## O tí n ṣiṣẹ́ báyìí!

Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)

> **Àkíyèsí** Èyí jẹ́ àlàyé ti ṣẹ̀ṣẹ̀bẹ̀rẹ̀ kan, àti pé nínú ṣíṣe àgbékalẹ̀ ààyè yìí a ti gba àwọn àbùjá díẹ̀ kan èyí tí kò dára nípa ti ààbò. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) for some tips on securing your site.

## Àwọn àbá wíwá ojútùú ìṣòro

Tí o bá rí àṣìṣe kan nígbà tí ìlànà ìṣe `pa_autoconfigure_django.py` n ṣiṣẹ́, lára àwọn ohun tó sábà máa ń fà á nìyí:

- Tí o bá gbàgbé láti ṣẹ̀dá token API PythonAnywhere rẹ.
- Ṣíṣe àṣìṣe kan nínú URL GitHub rẹ
- Tí o bá rí àṣìṣe kan tó n sọ pé *"Could not find your settings.py"*, ó ṣeéṣe kó jẹ́ nítorí pé ìwọ kò gbìyànjú láti ṣàfikún gbogbo àwọn fáìlì rẹ sí Git, àti/àbí ìwọ kò ti wọ́n sí GitHub pẹ̀lú àṣeyọrí. Tún ṣàyẹ̀wò abala Git tó wà lókè náà
- If you previously signed up for a PythonAnywhere account and had an error with collectstatic, you probably have an older version of SQLite (eg 3.8.2) for your account. In that case, sign up for a new account and try the commands in the PythonAnywhere section above.

Tí o bá rí àṣìṣe kan nígbà tí o bá gbìyànjú láti ṣàbẹ̀wò ààyè rẹ, ibi àkọ́kọ́ láti ṣàyẹ̀wò fún ìròyìn wíwá ojútùú ìṣòro ni inú **error log** rẹ. Ìwọ yíò rí atọ́ka kan sí èyí lórí [ojú-ìwé "Ayélujára"](https://www.pythonanywhere.com/web_app_setup/) PythonAnywhere náà. Ṣàyẹ̀wò tí àwọn ìròyìn àṣìṣe kankan bá wà níbẹ̀; àwọn ti àìpẹ́ yìí wà nísàlẹ̀.

[Àwọn àbá wíwá ojútùú ìṣòro lórí ààyè ìrànlọ́wọ́ PythonAnywhere náà](http://help.pythonanywhere.com/pages/DebuggingImportError) tún wà.

Rántí, olùkọ́ rẹ wà níbí láti ràn ọ́ lọ́wọ́!

# Ṣàyẹ̀wò ààyè rẹ!

Ó yẹ kí ojú-ìwé ìpìlẹ̀ fún ààyè rẹ sọ pé "Ó ṣiṣẹ́!", gẹ́gẹ́ bí ó ṣe máa n ṣe lórí kọ̀mpútà rẹ. Gbìyànjú ṣíṣe àfikún `/admin/` sí ìparí URL náà, ìwọ yíò sì lọ sí ààyè alábòójútó náà. Wọlé pẹ̀lú orúkọ aṣàmúlò àti ọ̀rọ̀ aṣínà náà, ìwọ yíò sì rí pé o lè ṣàfikún àwọn Àròkọ tuntun sórí server náà -- rántí, a kò fi àwọn àròkọ láti àkójọpọ̀ dátà orí kọ̀mpútà rẹ ránṣẹ́ sí blog rẹ tó n ṣiṣẹ́.

Tí o bá ti ṣẹ̀dá àwọn àròkọ díẹ̀ kan, o lè padà sí àgbékalẹ̀-ètò kọ̀mpútà rẹ (kìí ṣe PythonAnywhere). Láti ibí, ó yẹ kí o ṣiṣẹ́ lórí àgbékalẹ̀-ètò kọ̀mpútà rẹ láti ṣe àwọn ìyípadà. Èyí jẹ́ ìtẹ̀síwájú iṣẹ́ kan tó wọ́pọ̀ nínú ìgbéjáde ayélujára – ṣe àwọn ìyípadà lórí kọ̀mpútà rẹ, ti àwọn ìyípadà yẹn sí GitHub, kí o sì fa àwọn ìyípadà rẹ sí server Ayélujára rẹ tó n ṣiṣẹ́. Èyí yíò fún ọ láàyè láti ṣiṣẹ́ àti ṣe ìdánrawò láì ṣe ohun tí kò tọ́ sórí ààyè Ayélujára rẹ tó n ṣiṣẹ́. Ó dára púpọ̀, àbí bẹ́ẹ̀ kọ?

Kí ara rẹ *kú oríire!* Àwọn ìṣàgbékalẹ̀ server jẹ́ ọ̀kan lára àwọn apá ìgbéjáde ayélujára tó ṣòro jù, ó sábà máa ń gba àwọn èèyàn ní ọjọ́ bíi mélòó kan kí wọ́n tó mú wọn ṣiṣẹ́. Ṣùgbọ́n ìwọ ti mú ààyè rẹ ṣiṣẹ́, lórí Íńtánẹ́ẹ̀tì gidi náà!