# ความรู้เบื้องต้นเกี่ยวกับ command-line interface

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=jvZLWhkzX-8)

มันน่าตื่นเต้นใช่มั้ยล้าาา?! คุณจะได้เริ่มเขียนโค้ดบรรทัดแรกของคุณในอีกไม่กี่นาทีนี้แล้ว! :)

**เราขอแนะนำให้รู้จักเพื่อนใหม่ของคุณ: command line หรือ บรรทัดคำสั่ง!**

จากนี้ไปเราจะแนะนำการใช้หน้าต่างสีดำเหมือนกับที่แฮกเกอร์ใช้ มันอาจจะดูน่ากลัวซักหน่อยในตอนแรก แต่มันก็แค่สิ่งที่รอรับคำสั่งจากคุณเท่านั้นเอง

> **หมายเหตุ** ตลอดบทเรียนในหนังสือเล่มนี้ เราจะใช้คำว่า 'directory' และ 'folder' ผสมๆ กัน แต่มันก็คือสิ่งเดียวกันนั่นแหละ

## Command line (บรรทัดคำสั่ง) คืออะไร?

หน้าต่างที่เรียกว่า **command line** หรือ **command-line interface** คือโปรแกรมสำหรับดู จัดการ และแก้ไขไฟล์ต่างๆ ที่อยู่ในเครื่องของคุณ แต่จะอยู่ในรูปแบบที่เป็นโหมดข้อความเท่านั้น มันก็คล้ายๆกับ Windows Explorer หรือ Finder บน Mac เพียงแต่มัน graphical interface แค่นั้นแหละ Command line หรือ บรรทัดคำส่ังมีชื่อเรียกอื่นๆด้วย อย่างเช่น *cmd*, *CLI*, *prompt*, *console* หรือ *terminal*

## การเปิด command-line interface

ก่อนจะเริ่มทดลองใช้ เราก็จะต้องต้องเปิด command-line interface ขึ้นมาซะก่อน

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

ไปที่เมนู Start → Windows System → Command Prompt

> สำหรับ Windows รุ่นเก่า ให้ไปที่เมนู Start → All Programs → Accessories → Command Prompt

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

ไปที่ Applications → Utilities → Terminal

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## Prompt

ตอนนี้คุณควรเห็นหน้าต่างสีขาวหรือสีดำที่รอคุณป้อนคำสั่งอยู่

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see a `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

On Windows, you probably see a `>`, like this:

{% filename %}command-line{% endfilename %}

    >
    

Take a look at the Linux section just above now -- you'll see something more like that when you get to PythonAnywhere later in the tutorial.

<!--endsec-->

Each command will be prepended by a `$` or `>` and one space, but you should not type it. Your computer will do it for you. :)

> หมายเหตุเล็กๆ: บางกรณีคุณอาจจะเจอ `C:\Users\ola>` หรือ `Olas-MacBook-Air:~ ola$` ก่อนเครื่องหมายเหล่านี้ มันไม่ได้ปัญหาอะไรหรอกนะ มันโอเค 100% เลย

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. Ignore the left part and only type in the command, which starts after the prompt.

## คำสั่งแรกของคุณ (เย้!)

Let's start by typing this command:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

And then hit `enter`. This is our result:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> ลองพิมพ์คำสั่งแต่ละคำสั่งดู ห้ามก็อปมาวางนะ ทำแบบนี้แล้วคุณจะจำได้เอง!

## พื้นฐาน

Each operating system has a slightly different set of commands for the command line, so make sure to follow instructions for your operating system. Let's try this, shall we?

### ไดเรกทอรีปัจจุบัน

It'd be nice to know where are we now, right? Let's see. Type this command and hit `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> หมายเหตุ: 'pwd' ย่อมาจาก 'print working directory'

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> หมายเหตุ: 'cd' ย่อมาจาก 'change directory' ใน powershell คุณสามรถใช้ pwd เหมือนในระบบปฏิบัติการ Linux หรือ Mac OS X

<!--endsec-->

You'll probably see something similar on your machine. Once you open the command line you usually start at your user's home directory.

* * *

### Learn more about a command

Many commands you can type at the command prompt have built-in help that you can display and read! For example, to learn more about the current directory command:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

OS X and Linux have a `man` command, which gives you help on commands. Try `man pwd` and see what it says, or put `man` before other commands to see their help. The output of `man` is normally paged. Use the space bar to move to the next page, and `q` to quit looking at the help.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

Adding a `/?` suffix to most commands will print the help page. You may need to scroll your command window up to see it all. Try `cd /?`.

<!--endsec-->

### List files and directories

So what's in it? It'd be cool to find out. Let's see:

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
    

> หมายเหตุ: ใน powershell คุณสามาถใช้ 'ls' ได้เหมือนที่คุณใช้ในระบบปฏิบัติการ Linux หรือ Mac OS X <!--endsec-->

* * *

### Change current directory

Now, let's go to our Desktop directory:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

Check if it's really changed:

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

Here it is!

> คำแนะนำจากมือโปร: ถ้าคุณพิมพ์ `cd D` และกดปุ่ม `tab` บนแป้นพิมพ์ command line หรือบรรทัดคำสั่งจะเติมส่วนที่เหลือให้โดยอัตโนมัติ เพราะฉะนั้นคุณจะสามารถพิมพ์คำสั่งได้เร็วขึ้น ถ้าเกิดว่ามันมีมากกว่าหนึ่งโฟลเดอร์ที่เริ่มด้วย "D" ให้กดปุ่ม `tab` สองครั้งเพื่อดูรายการโฟลเดอร์เหล่านั้น

* * *

### Create directory

How about creating a practice directory on your desktop? You can do it this way:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

This little command will create a folder with the name `practice` on your desktop. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! Try it. :)

> คำแนะนำจากโปร: ถ้าคุณไม่อยากพิมพ์คำสั่งเดิมซ้ำๆ ลองกดปุ่ม `ลูกศรขึ้น` และ `ลูกศรลง` บนแป้นพิมพ์ของคุณ เพื่อดูว่าคุณใช้คำสั่งล่าสุดอะไรบ้าง

* * *

### Exercise!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### เฉลย:

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

Congrats! :)

* * *

### Clean up

We don't want to leave a mess, so let's remove everything we did until that point.

First, we need to get back to Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

Check where you are:

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

Now time to delete the `practice` directory:

> **คำเตือน**: การลบไฟล์โดยใช้คำสั่ง `del`, `rmdir` หรือ `rm` เราจะไม่สามารถกู้คืนมาได้ ฉะนั้น *ไฟล์เหล่านี้จะหายไปตลอดกาล*! เพราะฉะนั้นต้องคุณระวังให้มากๆ ก่อนใช้คำสั่งเหล่านี้

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

Done! To be sure it's actually deleted, let's check it:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### Exit

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## ภาพรวม

Here is a summary of some useful commands:

| คำสั่ง (วินโดวส์) | คำสั่ง (Mac OS / ลินุกซ์) | คำอธิบาย                | ตัวอย่างการใช้คำส่ัง                               |
| ----------------- | ------------------------- | ----------------------- | -------------------------------------------------- |
| exit              | exit                      | ปิดหน้าต่าง             | **exit**                                           |
| cd                | cd                        | เปลี่ยนไดเรกทอรี        | **cd test**                                        |
| cd                | pwd                       | แสดงผลไดเรกทอรีปัจจุบัน | **cd** (Windows) หรือ **pwd** (Mac OS / Linux)     |
| dir               | ls                        | ดูรายการไดเรกทอรี/ไฟล์  | **dir**                                            |
| copy              | cp                        | คัดลอกไฟล์              | **copy c:\test\test.txt c:\windows\test.txt**  |
| move              | mv                        | ย้ายไฟล์                | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir             | mkdir                     | สร้างไดเรกทอรีใหม่      | **mkdir testdirectory**                            |
| rmdir (หรือ del)  | rm                        | ลบไฟล์                  | **del c:\test\test.txt**                         |
| rmdir /S          | rm -r                     | ลบไดเรกทอรี             | **rm -r testdirectory**                            |
| [CMD] /?          | man [CMD]                 | get help for a command  | **cd /?** (Windows) or **man cd** (Mac OS / Linux) |

These are just a very few of the commands you can run in your command line, but you're not going to use anything more than that today.

If you're curious, [ss64.com](http://ss64.com) contains a complete reference of commands for all operating systems.

## พร้อมหรือยัง?

Let's dive into Python!