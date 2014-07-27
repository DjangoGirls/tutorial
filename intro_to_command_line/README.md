# Introduction to Command Line


## Introduction
Hey girls, the following steps will show you how to use the black window all hackers use. It might look a bit scary at first, but really, it is just a prompt, waiting for commands from you.

The window is usually called the *command line*, but you can also hear the following names: *cmd*, *prompt*, *console* or *terminal*.

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
To learn more about the above commands,  check out the Further Information section below.

These are just a very few of the possible black window commands.
[ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Useful shortcuts

* **Up arrow** - rerun previous commands.  You can avoid typing the same commands again by using the up arrow key to rerun recently used commands.


<<<<<<< HEAD
* Tab key - the tab key will autocomplete directory and file names. For example, typing **dir t ** + Tab will autocomplete to all directories starting with t in the current directory (such as task, test, tutorial).
=======
* **Tab key** - the tab key will autocomplete directory and file names. For example, typing `dir t` + `Tab` will autocomplete to all directories starting with `t` in the current directory (such as task, test, tutorial).
>>>>>>> upstream/master


## Further information about the commands above

* **exit** - it closes the black window; it makes sense, right? No need to explain too much...


* **cd** - it allows you to change your current directory. To use it type `cd [directoryname]` and press enter.

**For example:** let's say you are in a directory called `c:\test` with three sub-directories: `documents`, `photos`, and `music`.

    c
    └───test
            documents
            photos
            music

To go to the `documents` directory, simply type `cd documents` and press enter. You are now in `c:\test\A`. To move back to the `c:\test` directory, type `cd ..`.


* **dir** (Windows) / **ls** (others) - it lists files and directories located in your current directory. If you type `dir \test` or `ls test`, you will see the content of the `c:\test` directory.
Note that for many commands you can use the `*` symbol which stands for *all* or *wildcard*. With this in mind, try typing `dir *.txt` for Windows or `ls *.txt` for other OS. It will list only files that end with `.txt`.


* **copy** (Windows) / **cp** (others) - it allows you to copy files from one location to another. To use this command, type `copy [sourcefile] [targetfile]`.

**For example**: if you have the file `c:\test\test.txt` and you would like to copy it to `c:\windows\test.txt`, type:

    copy c:\test\test.txt c:\windows\test.txt


* **move** (Windows) / **mv** (others) - it allows you to move files from one location to another. The syntax you use is the same as for the `copy` command.


* **mkdir** - it allows you to create a new directory.  For example, `mkdir temp` creates a new directory called `temp` in the current directory.


* **del** (Windows) / **rm** (others) - it allows you to delete the specified file.  For example, `del test.txt` deletes the `test.txt` file from the current directory.







