Poți [sări peste această secțiune](http://tutorial.djangogirls.org/en/installation/#install-python) dacă nu vei folosi Chromebook. Dar dacă folosești deja Chromebook, experiența ta de instalare poate că a fost un pic diferită de aceasta. Și poți ignora restul instrucţiunilor de instalare. Poți sări peste această secțiune dacă nu vei folosi Chromebook. Dar dacă folosești deja Chromebook, experiența ta de instalare poate că a fost un pic diferită de aceasta. Și poți ignora restul instrucţiunilor de instalare. Puteţi ignora restul instrucţiunilor de instalare.

### Cloud 9

Cloud 9 este un instrument care îți oferă un editor de cod şi acces la un calculator care rulează pe Internet, în care poți scrie, și unde poți instala şi executa software-ul. Cloud 9 este o unealtă care iți oferă un editor de cod și acces la un calculator care rulează pe internet unde tu poți instala, scrie și rula software-ul. Pentru durata acestui tutorial, Cloud 9 se va comporta ca și *calculatorul tău local *. Tu tot vei rula comenzi într-o interfață cu terminal la fel ca în Os X, Ubuntu, sau Windows, dar terminalul pe care îl folosești este conectat la un calculator care rulează din altă parte pe care Cloud 9 ți la configurat. You'll still be running commands in a terminal interface just like your classmates on OS X, Ubuntu, or Windows, but your terminal will be connected to a computer running somewhere else that Cloud 9 sets up for you.

1. Instalează Cloud 9 din [magazinul de aplicații Chrome](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Acceasează [c9.io](https://c9.io)
3. Creează-ți un cont
4. Apasă pe *Create a New Workspace*
5. Numeștel *django-girls*
6. Selectează rândul *Blank* (al doilea rând din dreapta cel cu logoo-ul portocaliu)

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

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