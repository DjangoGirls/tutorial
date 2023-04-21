# RunCode Cloud Environment setup

> **Note** If you already worked through the installation steps, no need to do 
this again – youcan skip straight ahead to 
[How the Internet works](../how_the_internet_works/README.md).

# Installation
In this tutorial you will be building a blog. 
In order to do that, as you go through the tutorial you'll be instructed on how 
to set up some online accounts as needed. 

Since you are using RunCode Cloud development environment, your installation 
experience will be a little different. 
You do not need to install anything locally, you just need to create three 
online accounts. 

# RunCode Setup
With RunCode, you only need to create three online accounts and install
Django on your development environment. This page gathers all of the 
installation and sign-up instructions in one place (which is useful for some 
workshop formats).

## GitHub {#github}
Go to [GitHub.com](https://github.com/) and sign up for a new, free user account.

## RunCode {#runcode}
Go to [RunCode.io](https://runcode.io/) and sign up for a new, free user account. 
You need to have a [Google.com](https://www.google.com/intl/en-GB/gmail/about/) 
account or [GitHub.com](https://github.com/) which you can sign up with.

## Visual Studio Code on RunCode {#visual-studio-runcode}
Visual Studio Code is a source code editor developed by Microsoft for Windows, 
Linux and macOS. 
It includes support for debugging, embedded Git control, syntax highlighting, 
intelligent code completion, snippets, and code refactoring.

You do not need to install Python as it is pre-installed on their platform so 
you can skip straight ahead to the next chapter!

## PythonAnywhere {#pythonanywhere}
{% include "/deploy/signup_pythonanywhere.md" %}

## Command Line {#command-line}
To open the Ubuntu terminal on RunCode, go to Workspaces → New Workspace → Blank. 
This will open a new Visual Studio Code workspace which has an Ubuntu terminal 
in the bottom pane.

Altenatively, you can go to Workspaces → New Workspace → Jupyter Lab. 
This will open a Python prompt which is depicted by `>>>`, you can type `exit()` 
to get back to the Ubuntu terminal.

Ubuntu is a version of Linux so for all command line instructions later in the 
tutorial you can follow Linux instructions.

# Installing Django {#django}

{% include "/django_installation/instructions.md" %}