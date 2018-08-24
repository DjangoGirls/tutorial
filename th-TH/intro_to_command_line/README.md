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

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

บน Windows จะเป็นเครื่องหมาย `>` แบบนี้:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

คำสั่งแต่ละคำสั่งจะมีเครื่องหมายนี้และเว้นหนึ่งวรรค แต่คุณไม่จำเป็นต้องพิมพ์เองหรอกนะคอมพิวเตอร์จะจัดการให้คุณเอง :)

> หมายเหตุเล็กๆ: บางกรณีคุณอาจจะเจอ `C:\Users\ola>` หรือ `Olas-MacBook-Air:~ ola$` ก่อนเครื่องหมายเหล่านี้ มันไม่ได้ปัญหาอะไรหรอกนะ มันโอเค 100% เลย

ส่วนข้างบนและรวมถึงเครื่องหมาย ` $ </ 0> หรือ <code> & gt; </ 0> มันจะถูกเรียกว่า <em>command line prompt</em> หรือเรียกแบบสั้นๆว่า <em> prompt </ 1> มันจะกระตุ้นให้คุณป้อนข้อมูลบางอย่างลงไป</p>

<p>ในบทเรียนนี้ เมื่อเราต้องการให้คุณพิมพ์คำสั่งใดๆ เราจะรวมเครื่องหมาย <code>$` หรือ `>` และรวมถึงเครื่องหมายอื่นๆ ลงไปทางด้านซ้ายมือให้คุณ Ignore the left part and only type in the command, which starts after the prompt.

## คำสั่งแรกของคุณ (เย้!)

เรามาเริ่มโดนการพิมพ์คำสั่งกันเถอะ:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

จากนั้นกด `enter` นี่คือผลลัพธ์ของเรา:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

อย่างที่คุณเห็น คอมพิวเตอร์จะแสดงชื่อผู้ใช้ของคุณออกมา เจ๋งใช่ป่ะล่ะ? :)

> ลองพิมพ์คำสั่งแต่ละคำสั่งดู ห้ามก็อปมาวางนะ ทำแบบนี้แล้วคุณจะจำได้เอง!

## พื้นฐาน

แต่ละระบบปฏิบัติการที่มีชุดคำสั่งมาให้แตกต่างกัน ควรแน่ใจว่าคุณทำตามคำสั่งของระบบปฏิบัติการที่ใช้อยู่ เรามาลองกันเลยมั๊ย?

### ไดเรกทอรีปัจจุบัน

มันน่าจะดีใช่ไหม หากเรารู้ว่าตอนนี้เราอยู่ไหนแล้ว? ลองมาดูกัน ลองพิมพ์คำสั่งนี้ แล้วกด `enter`:

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

คุณจะเห็นผลลัพธ์ที่ต่างไปเล็กน้อยบนเครื่องของคุณ ซึ่งผลที่ได้มักจะเริ่มที่ไดเรกทอรีบ้านของคุณ

* * *

### แสดงรายการไฟล์และไดเรกทอรี

มันคืออะไรกันนะ? มาดูกัน:

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

### เปลี่ยนไดเรกทอรีปัจจุบัน

ตอนนี้ เราลองไปที่ไดเรกทอรี Desktop ของเรากัน:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

ลองเช็คดูซิว่ามันเปลี่ยนจริงมั้ย:

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

เปลี่ยนแล้วจริงด้วย!

> คำแนะนำจากมือโปร: ถ้าคุณพิมพ์ `cd D` และกดปุ่ม `tab` บนแป้นพิมพ์ command line หรือบรรทัดคำสั่งจะเติมส่วนที่เหลือให้โดยอัตโนมัติ เพราะฉะนั้นคุณจะสามารถพิมพ์คำสั่งได้เร็วขึ้น ถ้าเกิดว่ามันมีมากกว่าหนึ่งโฟลเดอร์ที่เริ่มด้วย "D" ให้กดปุ่ม `tab` สองครั้งเพื่อดูรายการโฟลเดอร์เหล่านั้น

* * *

### สร้างไดเรกทอรี

มาลองสร้างไดเรกทอรีชื่อ practice บน desktop ดูเป็นไง? คุณสามารถทำได้แบบนี้:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

คำสั่งน้อยๆ นี้จะสร้างโฟลเดอร์ชื่อ `practice` บน desktop ของคุณ You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! ลองเลย. :)

> คำแนะนำจากโปร: ถ้าคุณไม่อยากพิมพ์คำสั่งเดิมซ้ำๆ ลองกดปุ่ม `ลูกศรขึ้น` และ `ลูกศรลง` บนแป้นพิมพ์ของคุณ เพื่อดูว่าคุณใช้คำสั่งล่าสุดอะไรบ้าง

* * *

### มาฝึกกันเถอะ!

เรามีโจทย์ท้าทายเล็กๆให้คุณ: ให้คุณสร้างไดเรกทอรีใหม่ ชื่อ `test` ลงในไดเรกทอรี `practice` ที่เราเพิ่งสร้างก่อนหน้านี้ โดยใช้คำสั่ง `cd` และ `mkdir`

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

ยินดีด้วย! :)

* * *

### เก็บกวาด

เราไม่ต้องการทิ้งอะไรรกๆไว้ เพราะฉะนั้นเรามาลบของพวกนี้ออกกันก่อนเลยดีกว่า

ขั้นแรก เราต้องกลับไปที่ Desktop:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

การใช้ `..` ร่วมกับคำสั่ง `cd` จะเปลี่ยนไดเรกทอรีปัจจุบันไปยังไดเรกทอรีขั้นถัดขึ้นไปหนึ่งขั้น (ซึ่งก็คือไดเรกทอรีที่เก็บไดเรกทอรีปัจจุบันอยู่นั่นเอง)

ลองตรวจสอบดู:

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

ต่อไป มาลบไดเรทอรี `practice` กัน:

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

เรียบร้อย! มาดูซิว่าไฟล์ถูกลบไปจริงๆแล้วรึยัง:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### จบการทำงาน

ตอนนี้พอเท่านี้ก่อนเนอะ! คุณสามารถปิด command line หรือบรรทัดคำสั่งได้เลยตอนนี้ แต่ลองวิธีที่แฮกเกอร์เค้าทำกันดีมั๊ย? :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

เจ๋งสุดๆไปเลยใช่ม้าาา? :)

## ภาพรวม

สรุปคำสั่งที่มีประโยชน์:

| คำสั่ง (วินโดวส์) | คำสั่ง (Mac OS / ลินุกซ์) | คำอธิบาย                | ตัวอย่างการใช้คำส่ัง                              |
| ----------------- | ------------------------- | ----------------------- | ------------------------------------------------- |
| exit              | exit                      | ปิดหน้าต่าง             | **exit**                                          |
| cd                | cd                        | เปลี่ยนไดเรกทอรี        | **cd test**                                       |
| cd                | pwd                       | แสดงผลไดเรกทอรีปัจจุบัน | **cd** (Windows) หรือ **pwd** (Mac OS / Linux)    |
| dir               | ls                        | ดูรายการไดเรกทอรี/ไฟล์  | **dir**                                           |
| copy              | cp                        | คัดลอกไฟล์              | **copy c:\test\test.txt c:\windows\test.txt** |
| move              | mv                        | ย้ายไฟล์                | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir             | mkdir                     | สร้างไดเรกทอรีใหม่      | **mkdir testdirectory**                           |
| rmdir (หรือ del)  | rm                        | ลบไฟล์                  | **del c:\test\test.txt**                        |
| rmdir /S          | rm -r                     | ลบไดเรกทอรี             | **rm -r testdirectory**                           |

คำสั่งเหล่านี้เป็นเพียงส่วนหนึ่งที่คุณสามารถเรียกใช้ได้ แต่ในวันนี้คุณจะได้ใช้เพียงเท่านี้ล่ะ

ถ้าคุณอยากรู้เพิ่มเติม [ss64.com](http://ss64.com) มีข้อมูลอ้างอิงเกี่ยวกับคำสั่งครบทุกระบบปฏิบัติการที่สมบูรณ์

## พร้อมหรือยัง?

เราไปดำดิ่งลงสู่โลกของ Python กัน!