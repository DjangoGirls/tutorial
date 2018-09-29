# If you're doing the tutorial at home

If you're doing the tutorial at home, not at one of the [Django Girls events](https://djangogirls.org/events/), you can completely skip this chapter now and go straight to the [How the Internet works](../how_the_internet_works/README.md) chapter.

This is because we cover these things in the whole tutorial anyway, and this is just an additional page that gathers all of the installation instructions in one place. The Django Girls event includes one "Installation evening" where we install everything so we don't need to bother with it during the workshop, so this is useful for us.

If you find it useful, you can follow this chapter too. But if you want to start learning things before installing a bunch of stuff on your computer, skip this chapter and we will explain the installation part to you later on.

Good luck!

# Installation
In the workshop you will be building a blog, and there are a few setup tasks in the tutorial which would be good to work through beforehand so that you are ready to start coding on the day.

<!--sec data-title="Chromebook setup (if you're using one)"
data-id="chromebook_setup" data-collapse=true ces-->
{% include "/chromebook_setup/instructions.md" %}
<!--endsec-->

# Brief intro to command line

Many of the steps below reference the "console", "terminal", "command window", or "command line" -- these all mean the same thing: a window on your computer where you can enter commands. When you get to the main tutorial, you'll learn more about the command line. For now, the main thing you need to know is how to open a command window and what it looks like:

<!--sec data-title="Opening command line: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt. If this doesn't work on your version of Windows, check the "Intro to the command line" topic in the main tutorial for instructions.

You should now see a black window with a `>` in it, like this:

{% filename %}command-line{% endfilename %}
```
>
```
There may be something like `C:\Users\ola>` before the prompt sign, and this is 100% OK. When you enter commands shown on this page, omit everything up through the `>`. Also, sometimes the command line example comes from OS X or Linux, which use a `$` in place of the `>`. In that case, omit everything up through the `$` shown.

<!--endsec-->


<!--sec data-title="Opening command line: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal. You should now see a black window with a `$` in it, like this:

{% filename %}command-line{% endfilename %}
```
$
```
There may be something like `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK. When you enter commands shown on this page, omit everything up through the `$`.

<!--endsec-->

<!--sec data-title="Opening command line: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

You should now see a black window with a `$` in it, like this:

{% filename %}command-line{% endfilename %}
```
$
```
There may be something like `~ ola$` before the prompt sign, and this is 100% OK. When you enter commands shown on this page, omit everything up through the `$`.

<!--endsec-->


# Install Python
{% include "/python_installation/instructions.md" %}

# Install a code editor
{% include "/code_editor/instructions.md" %}

# Set up virtualenv and install Django
{% include "/django_installation/instructions.md" %}

# Install Git
{% include "/deploy/install_git.md" %}

# Create a GitHub account
Go to [GitHub.com](https://www.github.com) and sign up for a new, free user account.

# Create a PythonAnywhere account
{% include "/deploy/signup_pythonanywhere.md" %}


# Start reading

Congratulations, you are all set up and ready to go! If you still have some time before the workshop, it would be useful to start reading a few of the beginning chapters:

* [How the internet works](../how_the_internet_works/README.md)

* [Introduction to the command line](../intro_to_command_line/README.md)

* [Introduction to Python](../python_introduction/README.md)

* [What is Django?](../django/README.md)


# Enjoy the workshop!

When you begin the workshop, you'll be able to go straight to [Your first Django project!](../django_start_project/README.md) because you already covered the material in the earlier chapters.
