Pokud nepoužíváš Chromebook, můžeš [přeskočit přímo na tuto sekci](http://tutorial.djangogirls.org/en/installation/#install-python). Pokud Chromebook používáš, postup instalace se bude trochu lišit. Takže zbytek návodu k instalaci můžeš ignorovat.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE je nástroj, který ti umožňuje využívat editor kódu a přístup k počítači běžícím na internetu, kde můžeš instalovat, psát a spouštět software. V průběhu tutoriálu se Cloud IDE bude chovat jako tvůj *lokální počítač*. Příkazy budeš psát stále pomocí příkazové řádky v terminálu stejně jako tví spolužáci na OS X, Ubuntu nebo Windows, ale tvůj terminál bude propojený s počítačem běžícím někde jinde, což je řešeno pomocí Cloud IDE. Zde jsou instrukce pro všechna Cloud IDE (Paiza Cloud IDE, AWS, Cloud9). Můžeš si vybrat jedno z Cloud IDE řešení a následovat instrukce nastavení pro zvolený typ.

#### PaizaCloud ID

1. Jdi na [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Zaregistruj se nebo se přihlaš ke svému účtu, pokud již registrovaná jsi.
3. Klikni na *Nový Server* a vyber možnost Django App.
4. Klikni na tlačítko Terminál (na levé straně okna).

Nyní bys měla vidět rozhraní s postranním panelem a tlačítka nalevo. Klikni na tlačítko Terminál, kde po otevření příkazové řádky uvidíš něco jako:

{% filename %}Terminal{% endfilename %}

    $
    

Terminál v PaizaCloud IDE je připraven a čeká na tvé příkazy. Můžeš měnit velikost okna, pokud ti nevyhovuje velikost zobrazení.

#### AWS Cloud9

Momentálně Cloud9 vyžaduje, aby ses přihlásila pomocí AWS účtu a zadala jako platební metodu tvou platební kartu.

1. Nainstaluj si Cloud9 z odkazu [Chrome webový obchod](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Běž na [c9.io](https://c9.io) a klikni na *Get started with AWS Cloud9*
3. Přihlaš se pomocí svého AWS účtu (vyžaduje zadání platebních údajů, ale bude možné využívat jej zdarma bez placení).
4. V AWS nástěnce vlož *Cloud9* ve vyhledávacím políčku a dej vyhledat.
5. Na Cloud9 nástěnce klikni na *Vytvořit prostředí*
6. Pojmenuj to jako *django-girls*
7. Zatímco se konfiguruje nastavení, pro "Typ prostředí" vyber možnost *Vytvořit novou instanci pro prostředí (EC2)* a jako "Typ instance" zvol *t2.micro* (mělo by zmiňovat ""Free-tier eligible."). Výchozí nastavení plateb a výdajů lze nechat tak, jak je a stejně pokračovat i u dalších nastavení.
8. Klikni na *Další krok*
9. Klikni na *Vytvořit prostředí*

Nyní bys měla vidět rozhraní s postranním panelem a velkým hlavním oknem, kde bude nějaký text a malé okno v dolní části stránky, které vypadá přibližně takto:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

Tato dolní část je tvůj terminál. Můžeš jej použít pro zadání příkazů pro vzdálený Cloud9 počítač. Můžeš měnit velikost okna, jak potřebuješ.

### Virtuální prostředí

Virtuální prostředí (také nazývané veirtualenv) je jako soukromá krabička, kam můžeme dávat užitečné věci a kód pro náš projekt, na kterém pracujeme. Používáme je pro uchování různých částí kódu, které chceme pro různé naše projekty, abychom tak oddělili části, které by se neměly smíchat dohromady mezi projekty.

Spusť:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(všimni si, že na poslední řádce používáme tzv. tildu ~ a je následována rovnítkem: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).