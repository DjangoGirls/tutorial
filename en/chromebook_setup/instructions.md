You can [skip right over this section](http://tutorial.djangogirls.org/en/installation/#install-python) if you're not using a Chromebook. If you
are, your installation experience will be a little different. You can ignore the
rest of the installation instructions.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE is a tool that gives you a code editor and access to a computer running
on the Internet where you can install, write, and run the software. For the duration
of the tutorial, cloud IDE will act as your _local machine_. You'll still be
running commands in a terminal interface just like your classmates on OS X,
Ubuntu, or Windows, but your terminal will be connected to a computer running
somewhere else that cloud IDE sets up for you.
Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9).
You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click _New Server_
4. Click Terminal button(on the left side of the window)

Now you should see an interface with a sidebar, buttons at the left.
Click "Terminal" button to open terminal window with prompt like this:

{% filename %}Terminal{% endfilename %}
```
$
```

The terminal on the PaizaCloud Cloud IDE is prepared for your instructions.
You can resize or maximize that window to make it a bit bigger.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. Sign up for an account
3. Click _Create Environment_

Now you should see an interface with a sidebar, a big main window with some
text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}
```
yourusername:~/workspace $
```

This bottom area is your _terminal_, where you will give the computer Cloud 9
has prepared for your instructions. You can resize that window to make it a bit
bigger.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can
stuff useful computer code into for a project we're working on. We use them to
keep the various bits of code we want for our various projects separate so
things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}
```
sudo apt update
sudo apt install python3.6-venv
```

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3.6 -mvenv myvenv
source myvenv/bin/activate
pip install django~={{ book.django_version }}
```

(Note that on the last line we use a tilde followed by an equal sign: `~=`.)

### GitHub

Make a [GitHub](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment,
which is the process of taking the code that powers your new web application
and moving it to a publicly accessible computer (called a server) so other
people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're
already using a computer that is on the Internet (as opposed to, say, a laptop).
However, it's still useful, as we can think of our Cloud 9 workspace as a place
for our "in progress" work and Python Anywhere as a place to show off our stuff
as it becomes more complete.

Thus, sign up for a new Python Anywhere account at
[www.pythonanywhere.com](https://www.pythonanywhere.com).
