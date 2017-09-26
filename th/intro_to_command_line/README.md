# แนะนำการใช้บรรทัดคำสั่ง

> For readers at home: this chapter is covered in the [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8) video.

It's exciting, right?! You'll write your first line of code in just a few minutes! :)

**ขอแนะนำให้รู้จักเพื่อนใหม่ของคุณ: บรรทัดคำสั่ง!**

จากนี้ไปจะแนะนำการใช้หน้าต่างดำๆ เหมือนกับที่แฮกเกอร์ใช้ มันอาจจะดูน่ากลัวสักหน่อยในตอนแรก แต่ มันก็แค่สิ่งรอรับคำสั่งจากคุณเท่านั้นเอง

> **Note** Please note that throughout this book we use the terms 'directory' and 'folder' interchangeably but they are one and the same thing.

## อะไรคือบรรทัดคำสั่ง?

หน้าต่างที่เรียกว่า **บรรทัดคำสั่ง** หรือ **อินเทอร์เฟซบรรทัดคำส่ัง** คือโปรแกรมสำหรับดู จัดการ และแก้ไขไฟล์ต่างๆ ที่อยู่ในเครื่องของคุณ แต่จะอยู่ในรูปแบบที่เป็นโหมดข้อความเท่านั้น It's much like Windows Explorer or Finder on the Mac, but without the graphical interface. Other names for the command line are: *cmd*, *CLI*, *prompt*, *console* or *terminal*.

## เปิดอินเทอร์เฟซบรรทัดคำสั่ง

ก่อนจะเริ่มใช้ เราต้องเปิดมันขึ้นมาก่อน

<!--sec data-title="Windows" data-id="windows_prompt" data-collapse=true ces-->

Go to Start menu → Windows System → Command Prompt.

> On older versions of Windows, look in Start menu → All Programs → Accessories → Command Prompt.

<!--endsec-->

<!--sec data-title="OS X" data-id="OSX_prompt" data-collapse=true ces-->

Go to Applications → Utilities → Terminal.

<!--endsec-->

<!--sec data-title="Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, just Google it. :)

<!--endsec-->

## Prompt

ตอนนี้คุณควรเห็นหน้าสีขาวหรือสีดำที่รอคุณป้อนคำสั่งอยู่

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

ถ้าคุณใช้ Mac หรือ ลินุกซ์ คุณอาจจะเห็นเครื่องหมาย `$` แบบนี้:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_prompt2" data-collapse=true ces-->

บนวินโดวส์ จะเป็นเครื่องหมาย `>` แบบนี้:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

Each command will be prepended by this sign and one space, but you don't have to type it. Your computer will do it for you. :)

> Just a small note: in your case there may be something like `C:\Users\ola>` or `Olas-MacBook-Air:~ ola$` before the prompt sign, and this is 100% OK.

The part up to and including the `$` or the `>` is called the *command line prompt*, or *prompt* for short. It prompts you to input something there.

In the tutorial, when we want you to type in a command, we will include the `$` or `>`, and occasionally more to the left. You can ignore the left part and just type in the command which starts after the prompt.

## คำสั่งแรกของคุณ (เย้!)

เริ่มด้วยอะไรง่ายๆ พิมพ์คำสั่งนี้:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

จากนั้นกด `enter` นี่คือผลลัพธ์ของเรา:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

As you can see, the computer has just printed your username. Neat, huh? :)

> Try to type each command; do not copy-paste. You'll remember more this way!

## พื้นฐาน

แต่ละระบบปฏิบัติการที่มีชุดคำสั่งมาให้แตกต่างกัน ควรแน่ใจว่าคุณทำตามคำสั่งของระบบปฏิบัติการที่ใช้อยู่ เรามาลองกันเลยมั๊ย?

### ไดเรกทอรีปัจจุบัน

มันน่าจะดีใช่ไหม หากเรารู้ว่าตอนนี้เราอยู่ไหนแล้ว? ลองมาดูกัน ลองพิมพ์คำสั่งนี้ แล้วกด `enter`:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> หมายเหตุ: 'pwd' ย่อมาจาก 'print working directory'

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> Note: 'cd' stands for 'change directory'. With powershell you can use pwd just like on Linux or Mac OS X.

<!--endsec-->

คุณจะเห็นผลลัพธ์ที่ต่างไปเล็กน้อยบนเครื่องของคุณ ซึ่งผลที่ได้มักจะเริ่มที่ไดเรกทอรีบ้านของคุณ

* * *

### แสดงรายการไฟล์และไดเรกทอรี

มันคืออะไรกันนะ? มาดูกัน:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir" data-collapse=true ces-->

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

### เปลี่ยนไดเรกทอรีปัจจุบัน

ตอนนี้ เราลองไปที่ไดเรกทอรี Desktop ของเรากัน:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

ลองตรวจสอบดูซิ ว่าเปลี่ยนจริงไหม

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

เปลี่ยนแล้วจริงด้วย!

> PRO tip: if you type `cd D` and then hit `tab` on your keyboard, the command line will automatically fill in the rest of the name so you can navigate faster. If there is more than one folder starting with "D", hit the `tab` key twice to get a list of options.

* * *

### สร้างไดเรกทอรี

มาลองสร้างไดเรกทอรีชื่อ practice บน desktop ดูเป็นไง? คุณสามารถทำได้แบบนี้:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

คำสั่งน้อยๆ นี้จะสร้างโฟลเดอร์ชื่อ `practice` บน desktop ของคุณ คุณสามารถตรวจดูได้ใน Desktop ของคุณ โดยใช้คำสั่ง `ls` หรือ `dir` ! Try it. :)

> คำแนะนำจากโปร: ถ้าคุณไม่อยากพิมพ์คำสั่งเดิมซ้ำๆ ลองกดปุ่ม `ลูกศรขึ้น` และ `ลูกศรลง` บนแป้นพิมพ์ของคุณ เพื่อดูว่าคุณใช้คำสั่งล่าสุดอะไรบ้าง

* * *

### มาซ้อมมือกันเถอะ!

A small challenge for you: in your newly created `practice` directory, create a directory called `test`. (Use the `cd` and `mkdir` commands.)

#### เฉลย:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

ยินดีด้วย! :)

* * *

### ทำความสะอาด

เราไม่ต้องการทิ้งสิ่งเหล่านี้ไว้ เรามาลบของพวกนี้ออกกันก่อนเลยละกัน

ขั้นแรก เราต้องกลับไปที่ Desktop:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

Using `..` with the `cd` command will change your current directory to the parent directory (that is, the directory that contains your current directory).

ลองตรวจสอบดู:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

ต่อไป มาลบไดเรทอรี `practice` กัน:

> **Attention**: Deleting files using `del`, `rmdir` or `rm` is irrecoverable, meaning *the deleted files will be gone forever*! So be very careful with this command.

<!--sec data-title="Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

เรียบร้อย! มาดูซิว่าไฟล์ถูกลบไปจริงๆ หรือยัง:

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### จบการทำงาน

That's it for now! You can safely close the command line now. Let's do it the hacker way, alright? :)

<!--sec data-title="OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

Cool, huh? :)

## ภาพรวม

สรุปคำสั่งที่มีประโยชน์:

| คำสั่ง (วินโดวส์) | คำสั่ง (Mac OS / ลินุกซ์) | คำอธิบาย                   | ตัวอย่างการใช้คำส่ัง                              |
| ----------------- | ------------------------- | -------------------------- | ------------------------------------------------- |
| exit              | exit                      | ปิดหน้าต่าง                | **exit**                                          |
| cd                | cd                        | เปลี่ยนไดเรกทอรี           | **cd test**                                       |
| cd                | pwd                       | show the current directory | **cd** (Windows) or **pwd** (Mac OS / Linux)      |
| dir               | ls                        | ดูรายการไดเรกทอรี/ไฟล์     | **dir**                                           |
| copy              | cp                        | คัดลอกไฟล์                 | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                        | ย้ายไฟล์                   | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                     | สร้างไดเรกทอรีใหม่         | **mkdir testdirectory**                           |
| rmdir (or del)    | rm                        | delete a file              | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                     | delete a directory         | **rm -r testdirectory**                           |

คำสั่งเหล่านี้เป็นเพียงส่วนหนึ่งที่คุณสามารถเรียกใช้ได้ แต่ในวันนี้คุณจะได้ใช้เพียงเท่านี้ล่ะ

ถ้าคุณอยากรู้เพิ่มเติม [ss64.com](http://ss64.com) มีข้อมูลอ้างอิงเกี่ยวกับคำสั่งครบทุกระบบปฏิบัติการที่สมบูรณ์

## พร้อมหรือยัง?

เราไปดำดิ่งลงสู่โลกของ Python กัน!