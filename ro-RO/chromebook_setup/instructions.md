Poți [sări peste această secțiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu folosești Chromebook. Dacă-l folosești însă, procesul de instalare va fi un pic diferit. Puteţi ignora restul instrucţiunilor de instalare.

### Cloud 9

Cloud 9 este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți scrie, și unde poți instala şi executa software-ul. Pe durata acestui tutorial, Cloud 9 se va comporta ca și *calculatorul tău local *. Tu vei rula comenzile în interfața terminalului la fel ca și colegii ce vor folosi Os X, Ubuntu, sau Windows, dar terminalul pe care îl vei folosi tu, este conectat la un calculator care rulează în altă parte, pe care Cloud 9 ți la configurat.

1. Instalează Cloud 9 din [magazinul de aplicații Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Acceasează [c9.io](https://c9.io)
3. Creează-ți un cont
4. Apasă pe *Create a New Workspace*
5. Numește-l *django-girls*
6. Selectează rândul *Blank* (al doilea rând din dreapta cel cu logoo-ul portocaliu)

Acum puteți vedea o interfață cu un meniu, fereastra principală ce conține un text și o mică ferestruică în partea de jos, ce arată în felul următor:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Virtual Environment

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
    pip install django~=1.11.0
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### Github

Make a [Github](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place or our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).