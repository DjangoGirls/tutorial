# Introduction to Command Line


## Introduction
Hey girls, the following steps will show you how to use the black window.  This window is also called the "command line", "cmd", "prompt" and "terminal".

Each operating system has a set of commands for the command line.
Here is a summary of some useful commands:

| Command (WIN)      | Command (Mac OS / Linux)    | Description | Example|
| ------------- |-----------|-------------| -----|
| exit    | exit | close the window | **exit** |
| cd      | cd   | change directory      |   **cd test** |
| dir     | ls   |list folders/files      | **dir** |
| copy    | cp   | copy file | **copy c:\test\test.txt c:\windows\test.txt** |
| move | mv | move file | **move c:\test\test.txt c:\windows\test.txt** |
| md | mkdir | create a new folder | **md testfolder** |
|del | rm | delete a folder/file | **del c:\test\test.txt**
For more about the above commands,  check out the Further Information section below.

These are just a very few of the possible black window commands.
[ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## Useful shortcuts

* Up arrow - rerun previous commands.  You can avoid typing the same commands again by using the up arrow key to rerun recently used commands.


* Tab key - the tab key will autocomplete folder and file names. For example, typing **dir t ** + Tab will autocomplete to all directories starting with t in the current directory (such as task, test, tutorial).


## Further information about the commands above

* The **exit** commmand - this will cause the window to close; it makes sense, right? No need to explain too much ...


* The **cd** command - this command allows you to **c** hange your current **d** irectory. To use the cd command you type cd directoryname and press enter.
For example if you are in a directory called c:\test, and there were three directories in that the test directory called A, B, and C, you could just type **cd A** and press enter. You would then be in the c:\test\A.


* The **cd ..**  command - this will take you to the next folder up.


* The **dir** (WIN) and **ls** (others) command - this will list the files and directories contained in your current directory. If I typed **dir \test** or **ls test** I would see the contents of the c:\test directory.
Also note for many commands you can use the \* symbol which stands for wildcard. With this in mind, typing **dir *.txt** on WIN or **ls *.txt** on other OS will only list those files that end with .txt.


* The **copy** (WIN) or **cp** (others) command - this allows you to copy files from one location to another. To use this command you would type **copy *sourcefile targetfile***. For example if you have the file c:\test\test.txt and would like to copy it to c:\windows\test.txt you would type
**copy c:\test\test.txt c:\windows\test.txt** and press enter.


* The **move** (WIN) or **mv** (others) command - this allows you to move files from one location to another. The syntax you use is the same as for the **copy** command.


* The **md** (WIN) or **mkdir** (others) command - this allows you to create a new directory.  For example **md temp** creates a new folder called temp in the current directory.


* The **del** (WIN) or **rm** command (others) - this allows you to delete the specified file.  For example, **del test.txt** deletes the test.txt file from the current directory.







