Poți [sări peste această secțiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu vei folosi Chromebook. Dar dacă folosești deja Chromebook, experiența ta de instalare poate că a fost un pic diferită de aceasta. Și poți ignora restul instrucţiunilor de instalare.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți scrie, și unde poți instala şi executa software-ul. Pe durata acestui tutorial, Cloud IDE se va comporta ca și *calculatorul tău local *. Tu vei rula comenzile în interfața terminalului la fel ca și colegii ce vor folosi Os X, Ubuntu, sau Windows, dar terminalul pe care îl vei folosi tu, este conectat la un calculator care rulează în altă parte, pe care Cloud IDE ți l-a configurat. Aici sunt instrucţiunile pentru Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9). Poţi alege unul dintre programele Cloud IDE, şi să urmăreşti instrucţiunile programului Cloud IDE.

#### PaizaCloud Cloud IDE

1. Deschide aplicaţia [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Înregistrează-te
3. Click pe *Server nou* și alegeți aplicația Django
4. Fă un click pe butonul "Terminal" (din partea stângă a ferestrei)

Acum ar trebui să vezi o interfaţă cu o bară laterală cu butoane în stânga. Fă click pe butonul "Terminal" pentru a deschide fereastra terminală ce va afişa:

{% filename %}Terminal{% endfilename %}

    $
    

Terminalul din PaizaCloud Cloud IDE este gata pentru comenzile dumneavoastră. Puteți redimensiona sau extinde la maxim ferestra pentru o mai bună vizualizare.

#### AWS Cloud9

Cloud 9 curent îți cere să te înregistrezi cu informațiile AWS și cardul de credit.

1. Instalează Cloud 9 din [magazinul de aplicații Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Mergi la [c9.io](https://c9.io) și accesați *Începe cu Cloud9 AWS*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    nume utilizator:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### Mediul Virtual

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Rulează:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Crează-ți un cont [GitHub](https://github.com).

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Astfel, crează-ți un cont nou pe Python Anywhere accesând: [www.pythonanywhere.com](https://www.pythonanywhere.com).