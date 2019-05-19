## About Anaconda

Some participants may already have installed Python before workshop. Unlike the way in [Python installation](../python_installation/README.md) chapter, some people might have installed Python using a tool, *Anaconda*.

Anaconda is one of the tools which are used to install Python. **After installing Anaconda, you can use Python**. In installing Anaconda, Python packages used for scientific calculations are also installed. When you work on data science or machine learning with Python, Anaconda is one of the options.

If you use Anaconda, you have to install Django in Anaconda style (not using virtualenv). We wrote this chapter for Anaconda users.

## Conda environment

Before we install Django we will get you to install an extremely useful tool for Anaconda to help keep your coding environment tidy on your computer. It's possible to skip this step, but it's highly recommended. Starting with the best possible setup will save you a lot of trouble in the future!

So, let's create a **conda environment**. Conda environment will isolate your Python/Django setup on a per-project basis. This means that any changes you make to one website won't affect any others you're also developing. Neat, right?

All you need to do is find a directory in which you want to create Django application; your home directory, for example. On Windows, it might look like `C:\Users\Name\` (where `Name` is the name of your login).

> __NOTE:__ On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example, `C:\djangogirls`.

For this tutorial we will be using a new directory `djangogirls` from your home directory:

{% filename %}command-line{% endfilename %}
```
$ mkdir djangogirls
$ cd djangogirls
```

We will make a conda environment called myvenv. One of the features of Anaconda is that you can switch between multiple versions of Python. Let's create a conda environment in which we can use Python version *3.6*.

<!--sec data-title="Conda environment: Windows" data-id="condaenv_installation_windows"
data-collapse=true ces-->

To create a new conda environment, you need to open the command prompt and run `conda create -n myvenv python=3.6`. It will look like this:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls> conda create -n myvenv python=3.6
```

Where `myvenv` is the name of your conda environment. You can use any other name, but stick to lowercase and use no spaces, accents or special characters. It is also good idea to keep the name short – you'll be referencing it a lot!

After running above command, You will be asked if you want to continue the process:

{% filename %}command-line{% endfilename %}
```
Proceed ([y]/n)?
```

Type `y` (this means yes) and hit `enter`, then wait for the command to finish. 

<!--endsec-->

<!--sec data-title="Conda environment: Linux and OS X" data-id="condaenv_installation_linuxosx"
data-collapse=true ces-->

We can create a conda environment on both Linux and OS X by running `conda create -n myvenv python=3.6`. It will look like this:

{% filename %}command-line{% endfilename %}
```
$ conda create -n myvenv python=3.6
```

Where `myvenv` is the name of your conda environment. You can use any other name, but stick to lowercase and use no spaces. It is also a good idea to keep the name short as you'll be referencing it a lot!

After running above command, You will be asked if you want to continue the process:

{% filename %}command-line{% endfilename %}
```
Proceed ([y]/n)?
```

Type `y` (this means yes) and hit `enter`, then wait for the command to finish. 

<!--endsec-->

## Working with conda environment

The command above will create a conda environment called `myvenv` (or whatever name you chose).

<!--sec data-title="Working with Conda environment: Windows" data-id="condaenv_windows"
data-collapse=true ces-->

Start your conda environment by running:

{% filename %}command-line{% endfilename %}
```
C:\Users\Name\djangogirls > conda activate myvenv
```

Remember to replace `myvenv` with your chosen conda environment name!

> __NOTE:__ In older versions of Anaconda, `conda activate myvenv` command will return an error. In those cases try doing this instead:
>
>{% filename %}command-line{% endfilename %}
>```
>C:\Users\Name\djangogirls > activate myvenv
>```

<!--endsec-->

<!--sec data-title="Working with Conda environment: Linux and OS X" data-id="condaenv_linuxosx"
data-collapse=true ces-->

Start your conda environment by running:

{% filename %}command-line{% endfilename %}
```
$ conda activate myvenv
```

Remember to replace `myvenv` with your chosen conda environment name!

> __NOTE:__ In older versions of Anaconda, `conda activate myvenv` command will return an error. In those cases try doing this instead:
>
>{% filename %}command-line{% endfilename %}
>```
>$ source activate myvenv
>```

<!--endsec-->

You will know that you have a conda environment started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a conda environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

OK, we have all important dependencies in place. We can finally install Django!

## Installing Django

Now that you have your conda environmet started, you can install Django.

In a conda environment, we use `conda` command to install Django.

{% filename %}command-line{% endfilename %}
```
(myvenv) ~$ conda install django=2.0
```

## preparing requirements file

You have now installed Django. Finally, let's prepare for deployment (Deployment will be explained in detail in [Deploy!](../Deploy/README.md) chapter).

Let's create a Requirements file to use for deployment. In the deployment environment, we will install Django with `pip` command instead of `conda` command. A requirements file keeps a list of dependencies to be installed using `pip` command.

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

```
djangogirls
└───requirements.txt
```

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}
```
Django~={{ book.django_version }}
```

That's it! You're now (finally) ready to create a Django application!
