Poți [sări peste această secțiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu vei folosi Chromebook. Dar dacă folosești deja Chromebook, experiența ta de instalare poate că a fost un pic diferită de aceasta. Și poți ignora restul instrucţiunilor de instalare.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți scrie, și unde poți instala şi executa software-ul. Pe durata acestui tutorial, Cloud IDE se va comporta ca și *calculatorul tău local *. Tu vei rula comenzile în interfața terminalului la fel ca și colegii ce vor folosi Os X, Ubuntu, sau Windows, dar terminalul pe care îl vei folosi tu, este conectat la un calculator care rulează în altă parte, pe care Cloud IDE ți la configurat. Aici sunt instrucţiunile pentru Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Poţi alege unul dintre programele Cloud IDE, şi să urmăreşti instrucţiunile programului Cloud IDE.

#### PaizaCloud Cloud IDE

1. Deschide aplicaţia [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Înregistrează-te
3. Fă un click pe * Server nou *
4. Fă un click pe butonul "Terminal" (din partea stângă a ferestrei)

Acum ar trebui să vezi o interfaţă cu o bară laterală cu butoane în stânga. Fă click pe butonul "Terminal" pentru a deschide fereastra terminală ce va afişa:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalul din PaizaCloud Cloud IDE este gata pentru comenzile dumneavoastră. Puteți redimensiona sau extinde la maxim ferestra pentru o mai bună vizualizare.

#### AWS Cloud9

1. Accesați [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Înregistrați-vă pentru a crea un cont
3. Faceți click pe *Create Environment*

Acum ar trebui să vizualizați o interfață cu o bară laterală, o fereastră principală mare conțințnd un text, și o fereastră mică în partea de jos, care arată aproximativ așa:

{% filename %}bash{% endfilename %}

    nume utilizator:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Mediul Virtual

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).