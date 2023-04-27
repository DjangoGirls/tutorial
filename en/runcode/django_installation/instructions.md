### Virtual Environment
Before we install Django we will get you to install an extremely useful tool to 
help keep your coding environment tidy on your computer. It's possible to skip 
this step, but it's highly recommended. 
Starting with the best possible setup will save you a lot of trouble in the future!

So, let's create a **virtual environment** (also called a *virtualenv*). 
Virtualenv will isolate your Python/Django setup on a per-project basis. 
This means that any changes you make to one website won't affect any others 
you're also developing. Neat, right?

All you need to do is find a directory in which you want to create the 
`virtualenv`; 
your home directory, for example. On Runcode, it might look like 
`ubuntu@runcode:~$`.

For this tutorial we will be using a new directory `djangogirls` from your home 
directory:

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

We will make a virtualenv called `myvenv`. 

To create a new `virtualenv` on RunCode, you first need to install the 
`virtualenv` module. To do so, first you need to update
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
> and a new `virtualenv` with the name `myvenv` or whatever name you chose 
should be created in your `djangogirls` folder.

### Working with a Virtual Environment
>Start your virtual environment by running:
>```
>$ . myvenv/bin/activate
>```

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using
`pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, 
using the code editor that you installed earlier. 
You do this by opening a new file in the code editor and then saving it as 
`requirements.txt` in the `djangogirls/` folder. 
Your directory will look like this:

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
