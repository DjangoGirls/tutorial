If you are using RunCode Cloud development environment, your installation experience will be a little different. You can ignore the rest of the installation instructions as you do not need to install anything locally, you just need to create three online accounts. 

## Create a GitHub account
Go to [GitHub.com](https://github.com/) and sign up for a new, free user account.Skip this step if you already did 
this in the previous step so you could sign up for RunCode.

## Create a RunCode account
Go to [RunCode.io](https://runcode.io/) and sign up for a new, free user account. You need to have a 
[Google.com](https://www.google.com/intl/en-GB/gmail/about/) account or [GitHub.com](https://github.com/) 
which you can sign up with.

## Create a PythonAnywhere account {#pythonanywhere-account}
{% include "/deploy/signup_pythonanywhere.md" %}

## Command Line
To open the Ubuntu terminal on RunCode, go to Workspaces → New Workspace → Blank, and select the “Tiny” Workspace Type. After waiting for it to start, this will open a new Visual Studio Code workspace which has an Ubuntu terminal in the bottom pane.

Altenatively, you can go to Workspaces → New Workspace → Jupyter Lab. This will open a Python prompt which is depicted by `>>>`, you can type `exit()` to get back to the Ubuntu terminal.

Ubuntu is a version of Linux so for all command line instructions later in the tutorial you can follow Linux instructions.

## Virtual Environment
Before we install Django we will get you to install an extremely useful tool to help keep your coding environment tidy on your computer. It's possible to skip this step, but it's highly recommended. Starting with the best possible setup will save you a lot of trouble in the future!

So, let's create a **virtual environment** (also called a *virtualenv*). Virtualenv will isolate your Python/Django setup on a per-project basis. This means that any changes you make to one website won't affect any others you're also developing. Neat, right?

All you need to do is find a directory in which you want to create the `virtualenv`; your home directory, for example. On Windows, it might look like `C:\Users\Name\` (where `Name` is the name of your login).

For this tutorial we will be using a new directory `djangogirls` from your home directory:

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

We will make a virtualenv called `myvenv`. 

To create a new `virtualenv` on RunCode, you first need to install the `virtualenv` module. To do so, first you need to update
the packages in your environment
>```
>$ sudo apt-get update -y
>```
> then install `virtualenv` by running the command:
>```
>$ sudo apt-get install -y virtualenv
>```

> After this you can create the `virtualenv` run the command:
>```
>$ virtualenv -p python myvenv
>```
> and a new `virtualenv` with the name `myvenv` or whatever name you chose should be created in your `djangogirls` folder.

## Working with a Virtual Environment
>Start your virtual environment by running:
>```
>$ . myvenv/bin/activate
>```

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using
`pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

```
djangogirls
├── myvenv
│   └── ...
└───requirements.txt
```

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}
```
Django~={{ book.django_version }}
```

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ pip install -r requirements.txt
Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
  Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.9MB)
Installing collected packages: Django
Successfully installed Django-{{ book.django_version }}
```

That's it! You're now (finally) ready to create a Django application!