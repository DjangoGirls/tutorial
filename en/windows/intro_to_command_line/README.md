# Introduction to the command-line interface

> For readers at home: this chapter is covered in the 
[Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

__Let us introduce you to your first new friend: the command line!__

The following steps will show you how to use the black window all hackers use. 
It might look a bit scary at first but really it's just a prompt waiting for 
commands from you.

> **Note** Please note that throughout this book we use the terms 'directory' 
and 'folder' interchangeably but they are one and the same thing.

## What is the command line?

The window, which is usually called the __command line__ or 
__command-line interface__, is a text-based application for viewing, handling, 
and manipulating files on your computer. 
It's much like Windows Explorer or Finder on the Mac, but without the graphical 
interface. 
Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Open the command-line interface

To start some experiments we need to open our command-line interface first.

Depending on your version of Windows and your keyboard, 
one of the following should open a command window (you may have to experiment 
a bit, but you don't have to try all of these suggestions):
- Go to the Start menu or screen, and enter "Command Prompt" in the search field.
- Go to Start menu → Windows System → Command Prompt.
- Go to Start menu → All Programs → Accessories → Command Prompt.
- Go to the Start screen, hover your mouse in the lower-left corner of the 
  screen, and click the down arrow that appears (on a touch screen, instead flick 
  up from the bottom of the screen). 
  The Apps page should open. 
  Click on Command Prompt in the Windows System section.
- Hold the special Windows key on your keyboard and press the "X" key. 
  Choose "Command Prompt" from the pop-up menu.
- Hold the Windows key and press the "R" key to get a "Run" window. 
  Type "cmd" in the box, and click the OK key.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Later in this tutorial, you will need to have two command windows open at the 
same time. 
However, on some versions of Windows, if you already have one command window 
open and you try to open a second one using the same method, it will instead 
point you to the command window you already have open. 
Try it now on your computer and see what happens! 
If you only get one command window, try one of the other methods in the list above. 
At least one of them should result in a new command window being opened.


## Prompt

You now should see a white or black window that is waiting for your commands.

On Windows, you will probably see a `>`, like this:

{% filename %}command-line{% endfilename %}
```
>
```

Take a look at the Linux section just above now -- you'll see something more 
like that when you get to PythonAnywhere later in the tutorial.

Each command will be prepended by a `>` and one space, but you should not type it. 
Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` 
before the prompt sign, and this is 100% OK.

The part up to and including the `>` is called the *command line prompt*, or *prompt* for short. 
It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `>`, 
and occasionally more to the left. Ignore the left part and only type in the 
command, which starts after the prompt.

## Your first command (YAY!)

Let's start by typing this command:

{% filename %}command-line{% endfilename %}
```
> whoami
```

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}
```
> whoami
olasitarska
```

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## Basics

Each operating system has a slightly different set of commands for the command 
line, so make sure to follow instructions for your operating system. 
Let's try this, shall we?

### Current directory

It'd be nice to know where are we now, right? 
Let's see. 
Type this command and hit `enter`:

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska
```
> Note: 'cd' stands for 'change directory'. 
  With PowerShell you can use pwd just like on Linux or Mac OS X.

You'll probably see something similar on your machine. 
Once you open the command line you usually start at your user's home directory.

---

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you 
can display and read! 
For example, to learn more about the current directory command:

Adding a `/?` suffix to most commands will print the help page. 
You may need to scroll your command window up to see it all. 
Try `cd /?`.

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

{% filename %}command-line{% endfilename %}
```
> dir
 Directory of C:\Users\olasitarska
05/08/2020 07:28 PM <DIR>      Applications
05/08/2020 07:28 PM <DIR>      Desktop
05/08/2020 07:28 PM <DIR>      Downloads
05/08/2020 07:28 PM <DIR>      Music
...
```
> Note: In PowerShell you can also use 'ls' like on Linux and Mac OS X.

---

### Change current directory

{% filename %}command-line{% endfilename %}
```
> cd Desktop
```

Check if it's really changed:

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```

Here it is!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command 
line will automatically fill in the rest of the name so you can navigate faster. 
If there is more than one folder starting with "D", hit the `tab` key twice to 
get a list of options.

---

### Create directory

How about creating a practice directory on your desktop? 
You can do it this way:

{% filename %}command-line{% endfilename %}
```
> mkdir practice
```

This little command will create a folder with the name `practice` on your 
desktop. 
You can check if it's there by looking on your Desktop or by running a `ls` or 
`dir` command! Try it. :)

> PRO tip: If you don't want to type the same commands over and over, try 
pressing the `up arrow` and `down arrow` on your keyboard to cycle through 
recently used commands.

---

### Exercise!

A small challenge for you: in your newly created `practice` directory, create a 
directory called `test`. 
(Use the `cd` and `mkdir` commands.)

#### Solution:

{% filename %}command-line{% endfilename %}
```
> cd practice
> mkdir test
> dir
05/08/2020 07:28 PM <DIR>      test
```

Congrats! :)

---

### Clean up

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

{% filename %}command-line{% endfilename %}
```
> cd ..
```

Using `..` with the `cd` command will change your current directory to the 
parent directory (that is, the directory that contains your current directory).

Check where you are:

{% filename %}command-line{% endfilename %}
```
> cd
C:\Users\olasitarska\Desktop
```

Now time to delete the `practice` directory:

> __Attention__: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, 
meaning _the deleted files will be gone forever_! So be very careful with this command.

{% filename %}command-line{% endfilename %}
```
> rmdir /S practice
practice, Are you sure <Y/N>? Y
```

Done! To be sure it's actually deleted, let's check it:

{% filename %}command-line{% endfilename %}
```
> dir
```

### Exit

That's it for now! You can safely close the command line now. 
Let's do it the hacker way, alright? :)

{% filename %}command-line{% endfilename %}
```
> exit
```

Cool, huh? :)

## Summary

 Here is a summary of some useful commands:

Command (Windows) | Command (Mac OS / Linux) | Description                | Example
----------------- | ------------------------ | -------------------------- | ---------------------------------------------
exit              | exit                     | close the window           | **exit**
cd                | cd                       | change directory           | **cd test**
cd                | pwd                      | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)
dir               | ls                       | list directories/files     | **dir**
copy              | cp                       | copy file                  | **copy c:\test\test.txt c:\windows\test.txt**
move              | mv                       | move file                  | **move c:\test\test.txt c:\windows\test.txt**
mkdir             | mkdir                    | create a new directory     | **mkdir testdirectory**
rmdir (or del)    | rm                       | delete a file              | **del c:\test\test.txt**
rmdir /S          | rm -r                    | delete a directory         | **rm -r testdirectory**
[CMD] /?          | man [CMD]                | get help for a command     | **cd /?** (Windows) or **man cd** (Mac OS / Linux)

These are just a very few of the commands you can run in your command line, 
but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of 
commands for all operating systems.

## Ready?

Let's dive into Python!
