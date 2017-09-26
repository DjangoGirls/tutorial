> Part of this section is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. บทเรียน django-marcador เป็นลิขสิทธิ์ของ Markus Zapke-Gründemann

## สภาพแวดล้อมเสมือน

ก่อนที่เราจะติดตั้ง Django เราจะให้คุณติดตั้งเครื่องมีที่มีประโยชน์สุดๆ ตัวนึงก่อน ซึ่งช่วยให้คุณมีสภาพแวดล้อมในการทำงานที่ไม่รบกวนระบบหลักของคุณ คุณจะข้ามขั้นตอนนี้ไปก็ได้นะ แต่เราขอแนะนำอย่างแรง การทำสิ่งนี้จะช่วยให้คุณเจอปัญหาน้อยที่สุดภายในอนาคตอันใกล้นี้!

เอาล่ะ มาสร้าง **สภาพแวดล้อมเสมือน** กัน (เรียกว่า *virtualenv*). Virtualenv จะช่วยแยกสภาพแวดล้อมของ Python/Django ออกจากระบบหลัก ซึ่งหมายความว่า ขณะที่คุณกำลังสร้างเว็บไซต์ จะไม่มีผลกระทบกับระบบอื่นๆ ที่กำลังพัฒนาอยู่ เจ๋งใช่ไหมล่ะ?

ทั้งหมดที่คุณต้องการคือ หาไดเรกทอรีที่คุณต้องการจะสร้าง `virtualenv`; เช่น ไดเรกทอรี home เป็นต้น บน Windows จะมีหน้าตาประมาณ `C:\Users\Name` (ซึ่ง `Name` คือชื่อ login ของคุณ).

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example `C:\djangogirls`.

สำหรับบทเรียนนี้ เราจะใช้ไดเรกทอรีใหม่ ชื่อ `djangogirls` ภายในไดเรกทอรี home ของคุณ

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

เราจะสร้าง virtualenv เรียกว่า `myvenv` คำสั่งทั่วไปจะอยู่ในรูปแบบ:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

Where `myvenv` is the name of your `virtualenv`. คุณใช้ชื่ออื่นได้นะ แต่ขอแค่ให้ใช้ตัวพิมพ์เล็กไม่มีช่องว่าง, หรืออักขระพิเศษเป็นพอ It is also good idea to keep the name short – you'll be referencing it a lot!

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

สร้าง `virtualenv` ทั้งใน Linux และ OS X นั้นง่ายมาก แค่รันคำสั่ง `python3 -m venv myvenv` จะมีหน้าตาประมาณนี้:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` คือชื่อ `virtualenv` ของคุณ คุณใช้ชื่ออื่นได้นะ แต่ขอให้ใช้ตัวพิมพ์เล็กไม่มีช่องว่างหรืออักขระพิเศษเป็นพอ เป็นไอเดียที่ดีที่จะใช้ชื่อสั้นๆ เพราะคุณต้องอ้างถึงมันบ่อยมาก!

> **NOTE:** On some versions of Debian/Ubuntu you may receive the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt-get install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python3-venv
>     
> 
> **NOTE:** On some versions of Debian/Ubuntu initiating the virtual environment like this currently gives the following error:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Error: Command '['/home/eddie/Slask/tmp/venv/bin/python3', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1
>     
> 
> การแก้ปัญหา, ให้ใช้คำสั่ง `virtualenv` แทน
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt-get install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **NOTE:** If you get an error like
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> then instead run:
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## การทำงานกับ virtualenv

คำสั่งข้างต้น จะสร้างไดเรกทอรีชื่อ `myvenv` (หรือชื่อที่คุณเลือก) ข้างในจะมีสภาพแวดล้อม (โดยทั่วไป จะมีทั้งไดเรกทอรีและไฟล์จำนวนนึง)

<!--sec data-title="Windows" data-id="virtualenv_windows"
data-collapse=true ces-->

เริ่มใช้สภาพแวดล้อมเสมือน โดยใช้คำสั่ง:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> myvenv\Scripts\activate
    

> **NOTE:** on Windows 10 you might get an error in the Windows PowerShell that says `execution of scripts is disabled on this system`. In this case, open another Windows PowerShell with the "Run as Administrator" option. Then try typing the following command before starting your virtual environment:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\WINDOWS\system32> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
>         Execution Policy Change
>         The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose you to the security risks described in the about_Execution_Policies help topic at http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy? [Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): A
>     

<!--endsec-->

<!--sec data-title="Linux and OS X" data-id="virtualenv_linuxosx"
data-collapse=true ces-->

เริ่มใช้สภาพแวดล้อมเสมือน โดยใช้คำสั่ง:

{% filename %}command-line{% endfilename %}

    $ source myvenv/bin/activate
    

อย่าลืมแทนที่ `myvenv` ด้วยชื่อ `virtualenv` ที่คุณได้สร้างไว้!

> **หมายเหตุ:** บางครั้งคำสั่ง `source` จะไม่มีให้ใช้ ในกรณีนี้ให้ทำคำสั่งนี้แทน:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ . myvenv/bin/activate
>     

<!--endsec-->

You will know that you have `virtualenv` started when you see that the prompt in your console is prefixed with `(myvenv)`.

When working within a virtual environment, `python` will automatically refer to the correct version so you can use `python` instead of `python3`.

โอววเคย์ ในที่สุดตอนนี้เราพร้อมที่ติดตั้ง Django กันแล้ว!

## การติดตั้ง Django

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install --upgrade pip
    

Then run `pip install django~=1.11.0` (note that we use a tilde followed by an equal sign: `~=`) to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install django~=1.11.0
    Collecting django~=1.11.0
      Downloading Django-1.11.3-py2.py3-none-any.whl (6.8MB)
    Installing collected packages: django
    Successfully installed django-1.11.3
    

<!--sec data-title="Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install django~=1.11.0
>     

<!--endsec-->

<!--sec data-title="Linux" data-id="django_err_linux"
data-collapse=true ces-->

> ถ้าเกิด error ตอนรันคำสั่ง pip บน Ubuntu 12.04 ให้ลองใช้คำสั่ง `python -m pip install -U --force-reinstall pip` เพื่อแก้ไข

<!--endsec-->

นั่นล่ะ! ตอนนี้คุณก็พร้อม(สักที)ที่จะสร้าง Django application แล้ว!