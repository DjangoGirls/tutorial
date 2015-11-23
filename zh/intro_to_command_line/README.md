# 命令行界面简介

哈，这是令人兴奋，不是吗？:) 仅几分钟内你会写你第一行代码

**让我们把你介绍给你的第一个新朋友： 命令行 ！**

以下步骤将显示你如何使用所有的黑客都使用的黑色窗口。它可能刚开始看上去有点吓人，但事实上它只是等待你的命令提示符。

> **注意** 请注意，在本书中我们使用术语“目录”和“文件夹”完全可以互换，它们指的是同一个东西。

## 什么是命令行？

这个窗口通常被称为 **命令行** 或 **命令行界面**，是一个基于文本的用来查看、 处理、 和操作您的计算机上的文件的应用程序。 就像 Windows 资源管理器或 Mac 上的 Finder，但没有图形界面。 命令行的其他名字是： *cmd*，*CLI*、 *提示符*、 *控制台* 或 *终端*.

## 打开命令行界面

为了进行一些实验，我们需要首先打开我们的命令行界面。

### Windows系统

转到开始菜单 → 所有程序 → 附件 → 命令提示符。

### Mac OS X 系统

应用程序 → 实用工具 → 终端。

### Linux系统

它可能是根据应用程序 → 附件 → 终端，但这可能取决于您的版本系统。如果它不存在，只需谷歌一下 :)

## 提示符

你现在应该看到一个白色或黑色的窗口，正等待着你的命令。

如果你是在 Mac 或 Linux 上，您可能看到 `$`，就像这样：

    $
    

在 Windows 上，它是一个 `>` 标志，像这样：

    >
    

每个命令将前缀由这个符号和一个空格组成，但您不必键入它。您的计算机将为您完成这个:)

> 温馨提示： 你的提示符前可能是一些类似 `C:\Users\ola >` 或 `Ola-MacBook-Air:~ola$` 这样的符号，这都是正确的。 在本教程中我们将只是简化它到最低限度。

## 你的第一个命令 （耶 ！）

让我们从简单的东西开始。键入以下命令：

    $ whoami
    

或 

    > whoami
    

然后键入 `enter`。这是我们的结果：

    $ whoami
    olasitarska
    

正如你所看到的计算机刚刚打印了你的用户名。棒吧，呵呵?:)

> 尝试键入每个命令，请不要复制粘贴。你会通过这种方式记得更多东西！

## 基础知识

每个操作系统都有一组略有不同的适用于相应命令行的命令，所以请务必按照您的操作系统说明来做。我们试试这个，好吗？

### 当前目录: 

知道身在何处让人高兴，对不对？让我们看看。输入命令并键入`enter`：

    $ pwd
    /Users/olasitarska
    

如果你在 Windows 操作系统上：

    > cd
    C:\Users\olasitarska
    

在你的机器上你可能会看见类似的东西。一旦你打开命令行工具你通常开始于用户主目录。

> 注： 'pwd' 代表 '打印工作目录'。

* * *

### 列出文件和目录

那么它是什么？它一定很酷，找出。让我们看看：

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

Windows系统

    > dir
     Directory of C:\Users\olasitarska
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

* * *

### 更改当前目录

现在，让我们去我们桌面目录：

    $ cd Desktop
    

Windows系统

    > cd Desktop
    

请检查它是否真的发生改变了：

    $ pwd
    /Users/olasitarska/Desktop
    

Windows系统

    > cd
    C:\Users\olasitarska\Desktop
    

它在这儿 ！

> 进阶提示： 如果你键入 `cd D`，然后在点击`tab`键，命令行将自动填充剩下的名称以便你可以更快地导航。 如果有多个文件夹以"D"开头，按下 `tab` 按钮两次以获取选项的列表。

* * *

### 创建目录

在你的桌面上创建一个practice目录怎么样？你可以这样做：

    $ mkdir practice
    

Windows系统

    > mkdir practice
    

这小小的命令将在桌面上为你创建名为`practice` 的目录。 你可以查看桌面文件夹或者通过运行 `ls` 或 `dir` 命令检查它是否存在！ 试试:)

> 进阶提示： 如果你不想要一遍又一遍地键入相同的命令，试着按 `向上箭头键` 和 `向下箭头` 下循环查看最近你使用过的命令。

* * *

### 练习

给你一个小挑战： 在您新创建的 `practice` 目录下创建一个名为 `test`的目录。使用 `cd` 和 `mkdir` 命令。

#### 解决方法

    $ cd practice
    $ mkdir test
    $ ls
    test
    

Windows系统

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

恭喜 ！:)

* * *

### 清理

我们不想留下一个烂摊子，所以让我们删除所有的东西，直到达到目的。

首先，我们需要回到桌面：

    $ cd ..
    

Windows系统

    > cd ..
    

使用 `..` 和 `cd` 命令将改变你的当前目录到父目录（包含当前目录的目录）。

检查你在哪里：

    $ pwd
    /Users/olasitarska/Desktop
    

Windows系统

    > cd
    C:\Users\olasitarska\Desktop
    

现在删除 `practice` 目录：

> **注意**： 删除文件使用 `del`，`rmdir` 或 `rm` 后便不能挽回，意思就是*已删除的文件会一去不复返了* ！ 因此，要十分小心地使用此命令。

    $ rm -r practice
    

Windows系统

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

完成了 ！为了肯定它真的已经删除了，让我们检查一下：

    $ ls
    

Windows系统

    > dir
    

### 退出

暂时就到这里！你可以安全的关闭命令行。让我们以黑客的方式，好吗？:)

    $ exit
    

Windows系统

    > exit
    

很酷吧?：）

## 摘要

这里是一些有用的命令摘要：

| 命令 (Windows) | 命令 （Mac OS / Linux） | 说明：      | 示例：                                               |
| ------------ | ------------------- | -------- | ------------------------------------------------- |
| exit         | exit                | 关闭窗口     | **exit**                                          |
| cd           | cd                  | 更改目录     | **cd test**                                       |
| dir          | ls                  | 列出的目录文件  | **dir**                                           |
| copy         | cp                  | 复制文件     | **copy c:\test\test.txt c:\windows\test.txt** |
| move         | mv                  | 移动文件     | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir        | mkdir               | 创建一个新目录  | **mkdir testdirectory**                           |
| del          | rm                  | 删除文本文件目录 | **del c:\test\test.txt**                        |

这些不过是你在你的命令行中可以运行的少量命令，但你今天不会用到比这里更多的了。

如果你好奇，[ss64.com][1] 包含用于所有操作系统命令的完整引用。

 [1]: http://ss64.com

## 准备好了吗？

让我们深入到 Python ！