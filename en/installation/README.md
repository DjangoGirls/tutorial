# If you're doing the tutorial at home

If you're doing the tutorial at home, not at one of the [Django Girls events](https://djangogirls.org/events/), you can completely skip this chapter now and go straight to the [How the Internet works](../how_the_internet_works/README.md) chapter.

This is because we cover installing things as they are needed in the tutorial -- this is just an additional page that gathers all of the installation instructions in one place (which is useful for some workshop formats). You can choose to install everything that is on this page right now if you wish. But if you want to start learning things before installing a bunch of stuff on your computer, skip this chapter and we will explain the installation parts to you later on, as they are needed.

Good luck!

# If you're attending a workshop

If you are attending one of the [Django Girls events](https://djangogirls.org/events/):
- Your workshop may have an "installation party" before the main workshop. If you are at an installation party, this page is for you! Follow the instructions here to get everything you need for the workshop installed, with the help of the coaches if needed. Then at the main workshop, you'll be able to skip installation instructions you'll encounter in the main tutorial when you get to them.
- The organizers of your workshop may have asked you to try at home to install everything on your computer before the workshop starts. If you have been asked to do that, this page is for you! Follow the instructions here, as best you can. Then at the main workshop, when you get to an installation step in the main tutorial, if you were not able to get that piece installed you can get help from your coach.
- If your workshop does not have an installation party (or you couldn't attend), and if the organizers didn't ask you to try to install everything before you arrived, skip this page and go straight to the [How the Internet works](../how_the_internet_works/README.md) chapter. You'll be installing everything you need as you work through the tutorial.

# Installation
In this tutorial you will be building a blog. In order to do that, as you go through the tutorial you'll be instructed on how to
install various software on your computer and set up some online accounts as needed (if you are using local desktop environment) or instructed on how to create online accounts only (if you are using cloud development). This page gathers all of the installation and sign-up instructions in one place (which is useful for some workshop formats).

## Local Installation
We have seperate guides for different operating systems, that is, Windows, Linux and Mac OS X. You will need to follow the guide for your operating system. This will will be a good option if you have internet challenges, especially if the laptop you are using is your own. The software you need may be downloaded beforehand by the organizers and you can install from a USB stick.

## Chromebook Setup
Chromebook setup instructions have also been written separate from the guides for other operating systems. These apply to someone following the tutorial on a Chromebook.

## Cloud Development
In this tutorial, the cloud development platform we will be using will be [RunCode](https://runcode.io/). RunCode is a cloud development environment which people can use without the need to install Python, Django and Visual Studio Code editor locally on their machines. This cloud environment enables anyone to work from any device that has an internet connection, including cellphones, tablets, laptop or desktop.

This removes the need for you to install packages on a borrowed laptop or the need for you to own a laptop to attend the workshop or follow this tutorial from home as you only need to set up three online accounts. This will also save you time required for setting up your development environment. You can always do the [installation](installation/README.md#command-line) later own as a follow-up after finishing the tutorial. However, loading the development enviroment requires good and fast internet for this solution to work for you.

> **Note** There are sections of this tutorial which depend on the platform you are working on. If you follow the local installation steps for Windows, Linux, OS X or Chromebook, you will need to follow instructions for your operating system. If you follow RunCode Cloud Environment setup instructions, then you will need to follow instructions for RunCode development environment. Where no specific instructions are provided for RunCode Cloud Environment, follow the Linux instructions as RunCode runs on Ubuntu Linux.


# RunCode Cloud Development Setup
To set up RunCode Cloud development, follow the instructions below:

<!-- sec data-title="RunCode Cloud Development setup (if you are using cloud development)" 
data-id="cloud_development" data-collapse=true ces-->
{% include "/cloud_development_setup/instructions.md" %}
<!--endsec-->
 

# Chromebook Installation
To set up your Chromebook, follow the instructions below:

<!--sec data-title="Chromebook setup (if you're using one)"
data-id="chromebook_setup" data-collapse=true ces-->
{% include "/chromebook_setup/instructions.md" %}
<!--endsec-->


# OS X, Windows, Linux Installation {#osx-windows-linux}
> __NOTE:__  You can skip right over this section if you have followed [RunCode Cloud Development](cloud_development_setup/README.md) or [ChromeBook](chromebook_setup/README.md) installation steps. 

If you are not using RunCode or Chromebook, your experience will be a little different as you need to download and install some software locally as well as set up online accounts.

To install software on your machine, follow the instructions below:

## Brief intro to the command line {#intro-command-line}
Many of the steps below reference the "console", "terminal", "command window", or "command line" -- these all mean the same thing: a window on your computer where you can enter commands. When you get to the main tutorial, you'll learn more about the command line. For now, the main thing you need to know is how to open a command window and what it looks like:
{% include "/intro_to_command_line/open_instructions.md" %}

## Install Python {#python}
{% include "/python_installation/instructions.md" %}

## Install a code editor {#code-editor}
{% include "/code_editor/instructions.md" %}

## Set up virtualenv and install Django {#virtualenv}
{% include "/django_installation/instructions.md" %}

## Install Git {#git}
{% include "/deploy/install_git.md" %}

## Create a GitHub account {#github-account}
Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account. Be sure to remember your password (add it to your password manager, if you use one).

## Create a PythonAnywhere account {#pythonanywhere-account}
{% include "/deploy/signup_pythonanywhere.md" %}


# Start reading

Congratulations, you are all set up and ready to go! If you still have some time before the workshop, it would be useful to start reading a few of the beginning chapters:

* [How the internet works](../how_the_internet_works/README.md)

* [Introduction to the command line](../intro_to_command_line/README.md)

* [Introduction to Python](../python_introduction/README.md)

* [What is Django?](../django/README.md)


# Enjoy the workshop!

When you begin the workshop, you'll be able to go straight to [Your first Django project!](../django_start_project/README.md) because you already covered the material in the earlier chapters.
