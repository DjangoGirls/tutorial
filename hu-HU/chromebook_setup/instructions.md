You can [skip right over this section](http://tutorial.djangogirls.org/en/installation/#install-python) if you're not using a Chromebook. If you are, your installation experience will be a little different. You can ignore the rest of the installation instructions.

### Cloud 9

Cloud 9 egy eszköz, amely ad egy kódot, szerkesztő, valamint a hozzáféréshez egy számítógép az Interneten hol lehet telepíteni, írjon, majd futtassa a szoftvert. For the duration of the tutorial, Cloud 9 will act as your *local machine*. Még mindig parancsok futtatását egy terminál interfész, mint az osztálytársai OS X, Az Ubuntu, vagy a Windows, de a terminál lesz csatlakoztatott számítógépen futó máshol, hogy a Cloud 9-beállítja az ön számára.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io)
3. Sign up for an account
4. Click *Create a New Workspace*
5. Name it *django-girls*
6. Select the *Blank* (second from the right on the bottom row with orange logo)

Most megjelenik egy felület, egy sáv, egy nagy fő ablakot néhány szöveg, valamint egy kis ablak alján, hogy valahogy így néz ki:

{% filename %}Cloud 9{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### Virtuális környezet

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
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).