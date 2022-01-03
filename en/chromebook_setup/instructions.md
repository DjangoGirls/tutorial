You can [skip right over this section](http://tutorial.djangogirls.org/en/installation/#install-python) if you're not using a Chromebook. If you
are, your installation experience will be a little different. You can ignore the
rest of the installation instructions.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com)

Cloud IDE is a tool that gives you a code editor and access to a computer running
on the Internet where you can install, write, and run the software. For the duration
of the tutorial, cloud IDE will act as your _local machine_. You'll still be
running commands in a terminal interface just like your classmates on OS X,
Ubuntu, or Windows, but your terminal will be connected to a computer running
somewhere else that cloud IDE sets up for you.
Here are the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9, Glitch.com).
You can choose one of the cloud IDEs, and follow the instruction of the cloud IDE.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. Sign up for an account
3. Click _New Server_ and choose the Django app
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
Currently Cloud 9 requires you to sign up with AWS and enter credit card
information.

1. Install Cloud 9 from the [Chrome web store](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. Go to [c9.io](https://c9.io) and click _Get started with AWS Cloud9_
3. Sign up for an AWS account (requires credit card information, but you can
   use it for free)
4. In the AWS Dashboard, enter _Cloud9_ in the search bar and click it
5. In the Cloud 9 dashboard, click _Create environment_
6. Name it _django-girls_
7. While configuring settings, select _Create a new instance for environment
   (EC2)_ for "Environment Type" and the _t2.micro_ "Instance type" (it should
   say "Free-tier eligible."). The default cost-saving setting is fine and you
   can keep the other defaults.
8. Click _Next step_
9. Click _Create environment_

Now you should see an interface with a sidebar, a big main window with some
text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}
```
yourusername:~/workspace $
```

This bottom area is your terminal. You can use the terminal to send instructions
to the remote Cloud 9 computer. You can resize that window to make it a bit
bigger.

#### Glitch.com Cloud IDE

1. Go to [Glitch.com](https://glitch.com/)
2. Sign up for an account (https://glitch.com/signup) or use your GitHub account if you have one. (See GitHub instructions below.)
3. Click _New Project_ and choose _hello-webpage_
4. Click on the Tools dropdown list (at the bottom left side of the window), then on Terminal button to open terminal tab with a prompt like this:

{% filename %}Terminal{% endfilename %}
```
app@name-of-your-glitch-project:~
```

When using Glitch.com as your Cloud IDE, you don't have to create a virtual environment.
Instead, create the following files manually:

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
```
Django~={{ book.django_version }}
```

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

Once these files are created, go to the Terminal and execute the following commands to create your first Django project:

{% filename %}Terminal{% endfilename %}
```
django-admin.py startproject mysite .
refresh
```

In order to see detailed error messages, you can activate Django debug logs for your Glitch application.
Simply add the following at the end of the `mysite/settings.py` file.

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
This will create a `debug.log` file detailing Django operations and any error messages that might come up, making it much easier to fix if your website does not work.

The initial restarting of the Glitch project should fail.
(If you click on the top dropdown button `Show` then click on `In a New Window`, you will receive a `DisallowedHost` error message.)
Do not worry about it at this stage, the tutorial will fix this as soon as you update the Django settings of your project in the `mysite/settings.py` file.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can
stuff useful computer code into for a project we're working on. We use them to
keep the various bits of code we want for our various projects separate so
things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3 -m venv myvenv
source myvenv/bin/activate
pip install django~={{ book.django_version }}
```

(note that on the last line we use a tilde followed by an equal sign: `~=`).

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
