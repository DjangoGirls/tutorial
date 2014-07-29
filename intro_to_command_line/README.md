# Introduction to Command Line


## Introduction
The following steps will show you how to use the black window all hackers use. It might look a bit scary at first, but really, it is just a prompt, waiting for commands from you.

The window, which is usually called the *command line*, is a text-based application for viewing, handling and manipulating files on your computer (much like e.g. Windows Explorer or Finder on Mac, but without the graphical interface). Other names for the command line are: *cmd*, *prompt*, *console* or *terminal*.

Each operating system has a slightly different set of commands for the command line. Here is a summary of some useful commands:

| Command (Windows)      | Command (Mac OS / Linux)    | Description | Example|
| ------------- |-----------|-------------| -----|
| exit    | exit | close the window | **exit** |
| cd      | cd   | change directory      |   **cd test** |
| dir     | ls   |list directories/files      | **dir** |
| copy    | cp   | copy file | **copy c:\test\test.txt c:\windows\test.txt** |
| move | mv | move file | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir | mkdir | create a new directory | **mkdir testdirectory** |
|del | rm | delete a directory/file | **del c:\test\test.txt**


These are just a very few of the commands you can run in your command line. To learn more about them, check out the **Further Information** section below.

[ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Useful shortcuts

* **Up arrow** - rerun previous commands. You can avoid typing the same commands again and again by using the up arrow key to cycle through recently used commands.


* **Tab key** - the tab key autocompletes directory and file names. For example, if you type `dir t` and then use `TAB`, the command line will try to match this to existing files in your current directory and autocomplete the name for you. Meaning, if your directory contains a file called `test.txt`, typing `dir t` and `TAB` will autocomplete to `dir test.txt`.


## Further information on some of the above commands

* **exit** - closes your command prompt. This makes sense, right? No need to explain too much...


* **cd** - allows you to go to another directory. To use it to go to a directory contained within your current directory, type `cd subdirectory` (where you replace subdirectory with the name of the directory you want to go to) and press enter.

**For example:** let's say you are in a directory called `c:\test` with three sub-directories: `documents`, `photos` and `music`.

    c
    └───test
            documents
            photos
            music

To go from `test` to the `documents` subdirectory, simply type `cd documents` and press enter. You are now in `c:\test\A`.

To move back to the `c:\test` directory (or generally, to move 'up' one level), type `cd ..` (`cd` followed by two full stops).


* **dir** (Windows) / **ls** (others) - lists files and directories located in your current directory. If you type `dir` or `ls`, respectively, you will see the contents of the directory you're currently in.
Note that for some commands you can use the `*` (asterisk) symbol, which stands for *all* and is often called a *wildcard*. With this in mind, try typing `dir *.txt` for Windows or `ls *.txt` for other OS to only list files that end with `.txt`.


* **copy** (Windows) / **cp** (others) - allows you to copy files from one location to another. To use this command, type `copy sourcefile targetfile` (where sourcefile is the name/path of the file you want to copy, and targetfile is the name you want to give to the copy you are creating).

**For example**: if you have the file `c:\test\test.txt` and you would like to create a copy at `c:\windows\test.txt`, type:

    copy c:\test\test.txt c:\windows\test.txt


* **move** (Windows) / **mv** (others) - allows you to move files from one location to another. The syntax you use is the same as for the `copy`/`cp` command.


* **mkdir** - allows you to create a new directory.  For example, `mkdir temp` creates a new directory called `temp` in the current directory.


* **del** (Windows) / **rm** (others) - allows you to delete the specified file.  For example, `del test.txt` deletes the `test.txt` file from the current directory. **!!!ATTENTION!!!** Deleting files using `del` or `rm` is irrecoverable, meaning _deleted files will be gone forever_! So, be very careful with this command.






