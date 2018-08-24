# 命令行介面簡介

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**容我們為你介紹你的第一個新朋友：命令行！**

接下來的步驟將會為你示範如何使用這個駭客們都一定要使用的黑畫面。這或許第一次看起來有點可怕，但其實不過就是一個閃爍的小游標在等著你下命令給它啦。

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## 什麼是命令行？

這個視窗，就是通常被稱為 **命令行** 或 **命令行介面** 的東西，這是一個以文字為主的應用程式，可以查看、處理並且控制你電腦裡的檔案們。 It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. 還有其他稱呼像是 *cmd*, *CLT*, *prompt*, *console* 或是 *terminal*.

## 打開命令行介面

開始試驗看看吧，首先我們需要打開命令行介面。

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

## 命令提示字元

你應該看到一個白的（或黑的）視窗正在等候你的命令。

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

在 Windows 下，它是 `>`，像這樣：

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

每個命令都將會以這個提示字元與一個空白字元來準備運行，但是你不需要鍵入這兩個字元，你的電腦會很貼心的幫你打好. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## 你的第一個命令 (耶!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

然後按下 `enter`。這是我們的結果：

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

如同你所看到的，電腦就會秀出你的使用者名稱，很簡潔對吧? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## 基礎

每一個作業系統的命令行都有可觀的不同的指令，所以確定遵循你的自有設備，現在就容我們來試試看吧？

### 目前路徑

知道我們現在身在路徑的哪裡是很棒的事情，讓我們試試看，鍵入以下指令並按下 `enter`：

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> 溫馨小提示：'pwd' 代表「印出目前路徑」。

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

你將可能在你的電腦上看到這些相似的結果。通常你打開命令行，都會以你的使用者根目錄為起點。

* * *

### 列出所有檔案和路徑

有哪些東西在這個資料夾下呢？試著找找吧，讓我們看看：

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

### 改變現在的路徑

或許我們現在可以到「桌面」這個路徑去看看？

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

檢查看看是不是路徑已經變更了：

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

就是這麼簡單！

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### 創建路徑

新建一個 practice 的資料夾在你的桌面上怎麼樣？你可以這麼做：

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

這些小指令可以建立一個叫做 `practice` 的資料夾在你的桌面。 You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! 試試看吧. :)

> 進階技巧：如果你不想重複的輸入一樣的指令，試著使用 `上方向鍵` 和 `下方向鍵` 來選擇你使用過的指令。

* * *

### 實戰！

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### 解答：

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

恭喜完成! :)

* * *

### 清除

我們不想弄得一團亂，所以來移除上一個練習我們所創建的全部東西。

首先，我們需要回到桌面：

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

檢查一下現在你在哪了：

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

是時候刪除 `practice` 資料夾了:

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

完成！確保這個資料夾真的被刪除了，我們可以輸入：

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### 離開

是時候了！你現在可以安全地關閉命令行。我們用更 hacker 的方法來做這件事，試試看吧? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

酷吧? :)

## 彙總

總結

| 指令 (Windows)   | 指令 (Mac OS / Linux) | 描述                         | 例子                                                |
| -------------- | ------------------- | -------------------------- | ------------------------------------------------- |
| exit           | exit                | 關閉視窗                       | **exit**                                          |
| cd             | cd                  | 改變目錄                       | **cd test**                                       |
| cd             | pwd                 | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir            | ls                  | 列出目錄/檔案                    | **dir**                                           |
| copy           | cp                  | 複製檔案                       | **copy c:\test\test.txt c:\windows\test.txt** |
| move           | mv                  | 移動檔案                       | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir          | mkdir               | 創建新目錄                      | **mkdir testdirectory**                           |
| rmdir (or del) | rm                  | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S       | rm -r               | delete a directory         | **rm -r testdirectory**                           |

這裡只是一些最基礎的命令行，你可以跑跑看。但是今天我們不打算更深入下去了。

如果你還好奇，[ss64.com](http://ss64.com) 包含了非常完整所有作業系統的的指令。

## 準備好了嗎？

讓我們迎接 Python 吧！