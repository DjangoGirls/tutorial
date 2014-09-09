# Introduction to the command-line interface

Huh, it's exciting, right?! You'll write your first line of code in just a few minutes :)

__Let us introduce you to your first new friend: the command line!__

The following steps will show you how to use the black window all hackers use. It might look a bit scary at first but really it's just a prompt waiting for commands from you.

## What is the command line?

The window, which is usually called the __command line__ or __command-line interface__, is a text-based application for viewing, handling and manipulating files on your computer (much like e.g. Windows Explorer or Finder on Mac, but without the graphical interface). Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## Open the command-line interface

To start some experiments we need to open our command-line interface first.

### Windows

Go to Start menu → All Programs → Accessories → Command Prompt.

### Mac OS X

Applications → Utilities → Terminal.

### Linux

It's probably under Applications → Accessories → Terminal, but that may depend on your version system. If it's not there, just Google it :)

## Prompt

You now should see a white or black window that is waiting for your commands.

If you're on Mac or Linux, you probably see `$`, just like this:

    $

On Windows, it's a `>` sign, like this:

    >

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you :)

> Just a small note: in your case there maybe something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign and that's 100% correct. In this tutorial we will just simplify it to the bare minimum.

## Your first command! \o/

Let's start with something simple. Type this command:

    $ whoami

or

    > whoami

And then hit Enter. This is our result:

    $ whoami
    olasitarska

As you can see, the computer just presented you your username. Neat, huh?:)

> Try to type each command, do not copy paste. You'll remember more this way!

## Basics

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### Current directory

It'd be nice to know where are we now, right? Let's see. Type this command and hit enter:

    $ pwd
    /Users/olasitarska

If you're on Windows:

    > cd
    C:\Users\olasitarska

You'll probably see something similiar on your machine. Once you open the command line you usually start at your user's home directory.

> Note: 'pwd' stands for 'print working directory'.

---

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...

 Windows:

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...

---

### Change current directory

Maybe we can now go to our Desktop directory?

    $ cd Desktop

Windows:

    > cd Desktop

Check if it's really changed:

    $ pwd
    /Users/olasitarska/Desktop

Windows:

    > cd
    C:\Users\olasitarska\Desktop

Here it is!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically autofill the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` button twice to get a list of options.

---

### Create directory

How about creating a Django Girls directory on your desktop? You can do it this way:

    $ mkdir djangogirls

Windows:

    > mkdir djangogirls

This little command will create a folder with the name `djangogirls` on your desktop. You can check if it's there just by looking on your Desktop or by running a `ls`/`dir` command! Try it :)

> PRO tip: If you don't want to type the same commands over and over, try pressing the `up arrow` and `down arrow` on your keyboard to cycle through recently used commands.

---

### Exercise!

Small challenge for you: in your newly created `djangogirls` directory create a directory called `test`. Use `cd` and `mkdir` commands.

#### Solution:

    $ cd djangogirls
    $ mkdir test
    $ ls
    test

Windows:

    > cd djangogirls
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test

Congrats! :)

---

### Clean up

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

    $ cd ..

Windows:

    > cd ..

Making `cd` to `..` will change your current directory to the parent directory (which means the directory that contains your current directory).

Check where you are:

    $ pwd
    /Users/olasitarska/Desktop

Windows:

    > cd
    C:\Users\olasitarska\Desktop

Now time to delete the `djangogirls` directory:

    $ rm -r djangogirls

Windows:

    > rmdir /S djangogirls
    djangogirls, Are you sure <Y/N>? Y

Done! To be sure it's actually deleted, let's check it:

    $ ls

Windows:

    > dir

> __Attention__: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning _deleted files will be gone forever_! So, be very careful with this command.

### Exit

That's it for now! You can safely close the command line now. Let's do it the hacker way, all right?:)

    $ exit

Windows:

    > exit

Cool, huh?:)

## Summary

 Here is a summary of some useful commands:

| Command (Windows) | Command (Mac OS / Linux) | Description             | Example                                       |
| ----------------- | ------------------------ | ----------------------- | --------------------------------------------- |
| exit              | exit                     | close the window        | **exit**                                      |
| cd                | cd                       | change directory        | **cd test**                                   |
| dir               | ls                       | list directories/files  | **dir**                                       |
| copy              | cp                       | copy file               | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                       | move file               | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                    | create a new directory  | **mkdir testdirectory**                       |
|del                | rm                       | delete a directory/file | **del c:\test\test.txt**                      |

These are just a very few of the commands you can run in your command line but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Ready?

Let's dive into Python!
