Túto časť [môžeš preskočiť](http://tutorial.djangogirls.org/en/installation/#install-python), ak nepoužívaš Chromebook. Ak ho používaš, tak tvoja inštalácia bude trochu iná. Zvyšok inštalačných pokynov môžeš ignorovať.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE je nástroj, ktorý ti poskytne editor kódu a prístup na počítač, ktorý beží v cloude na internete, kde môžeš inštalovať, písať a spúšťať softvér. Počas tohto tutoriálu sa Cloud IDE bude tváriť ako tvoj *lokálny stroj*. Príkazy budeš zadávať do terminálového rozhrania tak, ako tvoje spoluúčastníčky, čo používajú OS X, Ubuntu, alebo Windows, ale tvoj terminál bude pripojený na počítač, ktorý beží niekde inde a ktorý Cloud IDE pripraví pre teba. Tu sú inštrukcie pre cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com). Môžeš si vybrať jedno z Cloud IDE riešení a postupovať podľa inštrukcií pre zvolený typ IDE.

#### PaizaCloud Cloud IDE

1. Choď na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Vytvor si účet
3. Klikni na *New Server* a vyber si Django appku
4. Klikni na tlačítko Terminal (na ľavej strane okna)

Teraz by si mala vidieť rozhranie s bočnou lištou, tlačidlami naľavo. Klikni na tlačítko Terminal, aby sa ti otvorilo terminálové okno s takýmto promptom:

{% filename %}Terminal{% endfilename %}

    $
    

Terminál na PaizaCloud Cloud IDE je pripravený na tvoje inštrukcie. Okno môžeš zmenšiť, zväčšiť, alebo maximalizovať, aby bolo trochu väčšie.

#### AWS Cloud9

Cloud 9 momentálne vyžaduje, aby si si vytvorila AWS účet a vložila informácie o kreditnej karte.

1. Nainštaluj si Cloud 9 z [Chrome webového obchodu](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Choď na [c9.io](https://c9.io) a klikni *Get started with AWS Cloud9*
3. Vytvor si AWS účet (je potrebné zadať údaje o svojej kreditnej karte, ale účet môžeš používať zdarma).
4. Na AWS Dashboarde napíš do vyhľadávania *Cloud9* a klikni naň
5. Na Cloud 9 dashboarde klikni na *Create environment*
6. Nazvi ho *django-girls*
7. Pri konfigurácii nastavení vyber *Create a new instance for environment (EC2)* ako "Environment Type" a *t2.micro* ako "Instance type" (malo by tam byť napísané "Free-tier eligible."). Prednastavené cost-saving nastavenie je okej, aj ostatné prednastavené hodnoty môžeš nechať tak.
8. Klikni na *Next step*
9. Klikni na *Create environment*

Teraz by si mala vidieť rozhranie s bočnou lištou, veľkým hlavným oknom s trochou textu a malým oknom v dolnej časti, ktoré vyzerá takto nejak:

{% filename %}bash{% endfilename %}

    tvojaprezyvka:~/workspace $
    

Táto dolná časť je tvoj terminál. Môžeš ho použiť na poslanie inštrukcií vzdialenému Cloud 9 počítaču. Okno môžeš zväčšiť.

#### Glitch.com Cloud IDE

1. Choď na [Glitch.com](https://glitch.com/)
2. Vytvor si účet (https://glitch.com/signup) alebo použi svoj účet na GitHube, ak máš. (Pozri inštrukcie ku GitHubu nižšie.)
3. Klikni na *New Project* a vyber *hello-webpage*
4. Klikni na rozbaľovacie menu Tools (vľavo dole v okne) a potom na tlačítko Terminal, aby sa ti otvorila terminálová záložka s takýmto promptom:

{% filename %}Terminal{% endfilename %}

    app@nazov-tvojho-glitch-projektu:~
    

Ak používať Glitch.com ako tvoje cloud IDE, nemusíš si vytvárať virtuálne prostredie. Namiesto toho vytvor nasledujúce súbory ručne:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

Keď budeš mať tieto súbory vytvorené, choď do Terminálu a vykonaj nasledujúce príkazy, aby si si vytvorila svoj prvý Django projekt:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    refresh
    

Aby si mala prístup k detailným chybovým hláškam, môžeš si aktivovať debug logy vo svojej Glitch aplikácii. Pridaj nasledovné na koniec súboru `mysite/settings.py`.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

Toto vytvorí súbor `debug.log`, v ktorom nájdeš detaily o tom, čo Django robí, ako aj chybové hlášky, ktoré sa môžu vyskytnúť. Toto ti značne uľahčí opravovanie tvojej stránky, ak niečo nebude fungovať.

Prvotný reštart tvojho Glitch projektu by mal zlyhať. (Keď klikneš na tlačítko `Show` hore a potom na `In a New Window`, mala by si sa dostať po chybovú hlášku `DisallowedHost`.) V tejto chvíli sa tým nemusíš zaoberať, tutoriál to vyrieši v momente, keď budeš meniť nastavenia svojho Django projektu v súbore `mysite/settings.py`.

### Virtuálne prostredie

Virtuálne prostredie (tiež nazývané virtualenv) je ako súkromná krabica, do ktorej môžeme uložiť užitočný počítačový kód pre projekt, na ktorom pracujeme. Používame ho na oddelenie rôznych častí kódu pre rôzne projekty, aby sa nám medzi nimi nepomiešali veci.

Spusti:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(všimni si, že v poslednom riadku sme použili vlnovku a za ňou znamienko rovnosti: `~=`).

### GitHub

Vytvor si [GitHub](https://github.com) účet.

### PythonAnywhere

DjangoGirls tutoriál obsahuje kapitolu o niečom, čomu sa hovorí deployment. Je to proces prenesenia kódu, ktorý poháňa tvoju novú webovú aplikáciu, na verejne dostupný počítač (ešte nazývaný aj server), aby aj ostatní ľudia videli tvoju prácu.

Táto časť je trochu zvláštna, keď pracuješ s týmto tutoriálom na Chromebooku, lebo už používaš počítač, ktorý je na internete (na rozdiel od notebooku). Napriek tomu je stále užitočná, lebo si môžeme predstaviť pracovné prostredie Cloud 9 ako miesto, kde sa nachádza nedokončená práca, a PythonAnywhere ako miesto, kde ukážeme našu prácu, keď bude hotová.

Tak si vytvor nový PythonAnywhere účet na [www.pythonanywhere.com](https://www.pythonanywhere.com).