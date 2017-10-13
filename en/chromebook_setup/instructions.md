You can [skip right over this section](http://tutorial.djangogirls.org/en/installation/#install-python) if you're not using a Chromebook. If you
are, your installation experience will be a little different. You can ignore the
rest of the installation instructions.

### CodeAnywhere

CodeAnywhere is a tool that gives you a code editor and access to a computer running
on the Internet where you can install, write, and run the software. For the duration
of the tutorial, CodeAnywhere will act as your _local computer_. You'll still be
running commands in a terminal interface just like your classmates on OS X,
Ubuntu, or Windows, but your terminal will be connected to a computer running
somewhere else that CodeAnywhere sets up for you.

1. Go to [codeanywhere.com](https://codeanywhere.com)
2. Sign up for an account
3. Check your email and verify your account
4. Close the connection wizard (We'll go back to that in a second)
3. Click _File -> New Project_
4. Name it _django-girls_
5. In the Connection Wizard, name your connection _tutorial-container_
6. Search for "python" in the search box
7. Select _Django - Ubuntu 14.04_
8. Wait for your container to start. This should take 1-2 minutes.


Now you should see an interface with a menu bar, a sidebar, and a big main
window with some text. We want to open a _terminal_, a window that will let us
give instructions to the computer CodeAnywhere has started for us.

To open the terminal, right click on "tutorial-container" in the sidebar and
select _SSH Terminal_. The main area should now show a prompt that looks like this:

{% filename %}CodeAnywhere{% endfilename %}
```
yourusername:~/workspace $
```

Now you're ready to install some software to be prepared for tomorrow.

### Virtual Environment

A virtual environment (also called a virtualenv) is like a private box we can
stuff useful computer code into for a project we're working on. We use them to
keep the various bits of code we want for our various projects separate so
things don't get mixed up between projects.

In your terminal, type the following lines. Hit enter after each one to send the
instruction to the computer.

{% filename %}CodeAnywhere{% endfilename %}
```
sudo apt update
sudo apt install python3.4-venv
```

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}CodeAnywhere{% endfilename %}
```
mkdir djangogirls
cd djangogirls
python3 -mvenv myvenv
source myvenv/bin/activate
pip install --upgrade pip
pip install django~=1.11.0
```

(note that on the last line we use a tilde followed by an equal sign: ~=).

Finally, right click on "tutorial-container" in the sidebar and select
_Refresh_. You should see a new folder, "djangogirls", appear in the list in the
sidebar.

### Golden Rule (of Chromebooks)

Throughout the tutorial, if you see instructions for OS X, Linux, or Windows but
not specifically for Chromebooks, follow whatever the Linux instructions are.

### Github

Make a [Github](https://github.com) account.

### PythonAnywhere

The Django Girls tutorial includes a section on what is called Deployment,
which is the process of taking the code that powers your new web application
and moving it to a publicly accessible computer (called a server) so other
people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're
already using a computer that is on the Internet (as opposed to, say, a laptop).
However, it's still useful, as we can think of our CodeAnywhere workspace as a place
or our "in progress" work and Python Anywhere as a place to show off our stuff
as it becomes more complete.

Thus, sign up for a new Python Anywhere account at
[www.pythonanywhere.com](https://www.pythonanywhere.com).
