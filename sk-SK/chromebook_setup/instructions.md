Túto časť [môžeš preskočiť](http://tutorial.djangogirls.org/en/installation/#install-python) ak nepoužívaš Chromebook. Ak ho používaš, tak tvoja inštalácia bude trochu iná. Môžeš odignorovať zvyšok inštalačného postupu.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE is a tool that gives you a code editor and access to a computer running on the Internet where you can install, write, and run the software. For the duration of the tutorial, cloud IDE will act as your *local machine*. You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that cloud IDE sets up for you. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click *New Server*
4. Click Terminal button(on the left side of the window)

Now you should see an interface with a sidebar, buttons at the left. Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}

    $
    

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions. You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Sign up for an account
3. Click *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Virtuálne prostredie

Virtuálne prostredie (tiež nazývané virtualenv) je ako súkromná krabica, do ktorej môžeme uložiť užitočný počítačový kód patriaci projektu na ktorom pracujeme. Používame ho na oddelenie rôznych častí kódu pre rôzne projekty, aby sa nám medzi nimi nepomiešali veci.

V termináli, v spodnej časti Cloud 9 rozhrania, spusti nasledovné:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

Ak to ešte stále nefunguje, požiadaj svojho mentora/ku o pomoc.

Ďalej zadaj nasledovné príkazy:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(všimni si, že v poslednom riadku sme použili vlnovku a za ňou znamienko rovnosti).

### GitHub

Vytvor si [GitHub](https://github.com) účet.

### PythonAnywhere

Django Girls tutoriál obsahuje kapitolu o tom čomu sa hovorí nasadenie (Deployment). Je to proces prenesenia kódu, ktorý používa tvoja nová webová aplikácia, na verejne dostupný počítač (ešte nazývaný aj server), aby aj ostatní ľudia videli tvoju prácu.

Táto časť je trochu divná, keď pracuješ s týmto tutoriálom na Chromebooku, lebo už používaš počítač, ktorý je na internete (na rozdiel od notebooku). Napriek tomu, je stále užitočná, lebo si môžeme predstaviť Cloud 9 pracovné prostredie ako miesto kde sa nachádza nedokončená práca a Python Anywhere ako miesto, kde ukážeme našu prácu, ktorá bude hotová.

Teda vytvor si nový Python Anywhere účet na [www.pythonanywhere.com](https://www.pythonanywhere.com).