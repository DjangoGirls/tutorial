# 命令行界面简介

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**让我们把你介绍给你的第一个新朋友： 命令行 ！**

以下步骤将显示你如何使用所有的黑客都使用的黑色窗口。它可能刚开始看上去有点吓人，但事实上它只是等待你的命令提示符。

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## 什么是命令行？

这个窗口通常被称为 **命令行** 或 **命令行界面**，是一个基于文本的用来查看、 处理、 和操作您的计算机上的文件的应用程序。 It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. 命令行的其他名字是： *cmd*，*CLI*、 *提示符*、 *控制台* 或 *终端*.

## 打开命令行界面

为了进行一些实验，我们需要首先打开我们的命令行界面。

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## 提示符

你现在应该看到一个白色或黑色的窗口，正等待着你的命令。

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

在 Windows 上，它是一个 `>` 标志，像这样：

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

每个命令将前缀由这个符号和一个空格组成，但您不必键入它。您的计算机将为您完成这个. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## 你的第一个命令 （耶 ！）

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

然后键入 `enter`。这是我们的结果：

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

正如你所看到的计算机刚刚打印了你的用户名。棒吧，呵呵? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## 基础知识

每个操作系统都有一组略有不同的适用于相应命令行的命令，所以请务必按照您的操作系统说明来做。我们试试这个，好吗？

### 当前目录: 

知道身在何处让人高兴，对不对？让我们看看。输入命令并键入`enter`：

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> 注： 'pwd' 代表 '打印工作目录'。

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

在你的机器上你可能会看见类似的东西。一旦你打开命令行工具你通常开始于用户主目录。

* * *

### 列出文件和目录

那么它是什么？它一定很酷，找出。让我们看看：

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> Note: In powershell you can also use 'ls' like on Linux and Mac OS X. <!--endsec-->

* * *

### 更改当前目录

现在，让我们去我们桌面目录：

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

请检查它是否真的发生改变了：

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

它在这儿 ！

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### 创建目录

在你的桌面上创建一个practice目录怎么样？你可以这样做：

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

这小小的命令将在桌面上为你创建名为`practice` 的目录。 You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! 试试. :)

> 进阶提示： 如果你不想要一遍又一遍地键入相同的命令，试着按 `向上箭头键` 和 `向下箭头` 下循环查看最近你使用过的命令。

* * *

### 练习

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### 解决方法

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

恭喜 ！:)

* * *

### 清理

我们不想留下一个烂摊子，所以让我们删除所有的东西，直到达到目的。

首先，我们需要回到桌面：

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

检查你在哪里：

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

现在删除 `practice` 目录：

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

完成了 ！为了肯定它真的已经删除了，让我们检查一下：

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### 退出

暂时就到这里！你可以安全的关闭命令行。让我们以黑客的方式，好吗? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

很酷吧? :)

## 摘要

这里是一些有用的命令摘要：

| 命令 (Windows)   | 命令 （Mac OS / Linux） | 说明：                        | 示例：                                               |
| -------------- | ------------------- | -------------------------- | ------------------------------------------------- |
| exit           | exit                | 关闭窗口                       | **exit**                                          |
| cd             | cd                  | 更改目录                       | **cd test**                                       |
| cd             | pwd                 | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir            | ls                  | 列出的目录文件                    | **dir**                                           |
| copy           | cp                  | 复制文件                       | **copy c:\test\test.txt c:\windows\test.txt** |
| move           | mv                  | 移动文件                       | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir          | mkdir               | 创建一个新目录                    | **mkdir testdirectory**                           |
| rmdir (or del) | rm                  | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S       | rm -r               | delete a directory         | **rm -r testdirectory**                           |

这些不过是你在你的命令行中可以运行的少量命令，但你今天不会用到比这里更多的了。

如果你好奇，[ss64.com](http://ss64.com) 包含用于所有操作系统命令的完整引用。

## 准备好了吗？

让我们深入到 Python ！