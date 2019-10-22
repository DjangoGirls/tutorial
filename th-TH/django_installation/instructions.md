> บางส่วนของบทนี้ยึดหลักจากบทเรียนของ Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)
> 
> Part of this section is based on the [django-marcador tutorial](http://django-marcador.keimlink.de/) licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. บทเรียน django-marcador เป็นลิขสิทธิ์ของ Markus Zapke-Gründemann

## สภาพแวดล้อมเสมือน

ก่อนที่เราจะติดตั้ง Django เราจะให้คุณติดตั้งเครื่องมีที่มีประโยชน์สุดๆ ตัวนึงก่อน ซึ่งช่วยให้คุณมีสภาพแวดล้อมในการทำงานที่ไม่รบกวนระบบหลักของคุณ คุณจะข้ามขั้นตอนนี้ไปก็ได้นะ แต่เราขอแนะนำอย่างแรง การทำสิ่งนี้จะช่วยให้คุณเจอปัญหาน้อยที่สุดภายในอนาคตอันใกล้นี้!

เอาล่ะ มาสร้าง **สภาพแวดล้อมเสมือน** กัน (เรียกว่า *virtualenv*). Virtualenv จะช่วยแยกสภาพแวดล้อมของ Python/Django ออกจากระบบหลัก ซึ่งหมายความว่า ขณะที่คุณกำลังสร้างเว็บไซต์ จะไม่มีผลกระทบกับระบบอื่นๆ ที่กำลังพัฒนาอยู่ เจ๋งใช่ไหมล่ะ?

ทั้งหมดที่คุณต้องการคือ หาไดเรกทอรีที่คุณต้องการจะสร้าง `virtualenv`; เช่น ไดเรกทอรี home เป็นต้น บน Windows จะมีหน้าตาประมาณนี้ `C:\Users\Name` (ซึ่ง `Name` คือชื่อ login ของคุณ)

> **NOTE:** On Windows, make sure that this directory does not contain accented or special characters; if your username contains accented characters, use a different directory, for example, `C:\djangogirls`.

สำหรับบทเรียนนี้ เราจะใช้ไดเรกทอรีใหม่ ชื่อ `djangogirls` ภายในไดเรกทอรี home ของคุณ

{% filename %}command-line{% endfilename %}

    $ mkdir djangogirls
    $ cd djangogirls
    

เราจะสร้าง virtualenv เรียกว่า `myvenv` คำสั่งทั่วไปจะอยู่ในรูปแบบ:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

<!--sec data-title="Virtual environment: Windows" data-id="virtualenv_installation_windows"
data-collapse=true ces-->

To create a new `virtualenv`, you need to open the command prompt and run `python -m venv myvenv`. It will look like this:

{% filename %}command-line{% endfilename %}

    C:\Users\Name\djangogirls> python -m venv myvenv
    

`myvenv` คือชื่อของ `virtualenv` ของคุณ คุณจะใช้ชื่ออื่นก็ได้นะ แต่ขอแค่ให้ใช้ตัวพิมพ์เล็กและไม่มีช่องว่างหรือใช้อักขระพิเศษ ถ้าจะให้ดีคุณควรที่จะใช้ชื่อสั้นๆ เพราะคุณต้องอ้างถึงมันบ่อยมาก!

<!--endsec-->

<!--sec data-title="Virtual environment: Linux and OS X" data-id="virtualenv_installation_linuxosx"
data-collapse=true ces-->

สร้าง `virtualenv` ทั้งใน Linux และ OS X นั้นง่ายมาก แค่รันคำสั่ง `python3 -m venv myvenv` จะมีหน้าตาประมาณนี้:

{% filename %}command-line{% endfilename %}

    $ python3 -m venv myvenv
    

`myvenv` คือชื่อ `virtualenv` ของคุณ คุณจะใช้ชื่ออื่นก็ได้นะ แต่ขอแค่ให้ใช้ตัวพิมพ์เล็กและไม่มีช่องว่าง ถ้าจะให้ดีคุณควรที่จะใช้ชื่อสั้นๆ เพราะคุณต้องอ้างถึงมันบ่อยมาก!

> **หมายเหตุ: ** ในบางรุ่นของ Debian/Ubuntu คุณอาจได้รับข้อความที่แสดงข้อผิดพลาดต่อไปนี้:
> 
> {% filename %}command-line{% endfilename %}
> 
>     The virtual environment was not created successfully because ensurepip is not available.  On Debian/Ubuntu systems, you need to install the python3-venv package using the following command.
>        apt install python3-venv
>     You may need to use sudo with that command.  After installing the python3-venv package, recreate your virtual environment.
>     
> 
> In this case, follow the instructions above and install the `python3-venv` package: {% filename %}command-line{% endfilename %}
> 
>     $ sudo apt install python3-venv
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
>     $ sudo apt install python-virtualenv
>     $ virtualenv --python=python3.6 myvenv
>     
> 
> **หมายเหตุ:** ถ้าคุณได้รับข้อผิดพลาดเช่น
> 
> {% filename %}command-line{% endfilename %}
> 
>     E: Unable to locate package python3-venv
>     
> 
> ให้คุณรันนี่แทน
> 
> {% filename %}command-line{% endfilename %}
> 
>     sudo apt install python3.6-venv
>     

<!--endsec-->

## การทำงานกับ virtualenv

คำสั่งข้างต้น จะสร้างไดเรกทอรีชื่อ `myvenv` (หรือชื่อที่คุณเลือก) ข้างในจะมีสภาพแวดล้อม (โดยทั่วไป จะมีทั้งไดเรกทอรีและไฟล์จำนวนนึง)

<!--sec data-title="Working with virtualenv: Windows" data-id="virtualenv_windows"
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
> 
> **NOTE:** For users of the popular editor VS Code, which come with an integrated terminal based off windows powershell, if you wish to stick with the integrated terminal, you may run the following command to activate your virtual environment:
> 
>     $ . myvenv\Scripts\activate.ps1
>     
> 
> The advantage is that you don't have to switch between editor windows and command-line windows

<!--endsec-->

<!--sec data-title="Working with virtualenv: Linux and OS X" data-id="virtualenv_linuxosx"
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

คุณจะรู้ได้ว่า `virtualenv` ถูกเริ่มใช้แล้ว โดยดูที่ prompt บน console มันจะมีคำว่า `(myvenv)` อยู่ด้านหน้า

เมื่อทำงานกับสภาพแวดล้อมเสมือน `python` จะอ้างถึงเวอร์ชันที่ถูกต้องให้ ซึ่งจะทำให้คุณใช้คำสั่ง `python` แทนคำสั่ง `python3` ได้เลย.

โอววเคย์ ในที่สุดตอนนี้เราพร้อมที่ติดตั้ง Django กันแล้ว!

## Installing Django {#django}

Now that you have your `virtualenv` started, you can install Django.

Before we do that, we should make sure we have the latest version of `pip`, the software that we use to install Django:

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ python -m pip install --upgrade pip
    

### Installing packages with requirements

A requirements file keeps a list of dependencies to be installed using `pip install`:

First create a `requirements.txt` file inside of the `djangogirls/` folder, using the code editor that you installed earlier. You do this by opening a new file in the code editor and then saving it as `requirements.txt` in the `djangogirls/` folder. Your directory will look like this:

    djangogirls
    ├── myvenv
    │   └── ...
    └───requirements.txt
    

In your `djangogirls/requirements.txt` file you should add the following text:

{% filename %}djangogirls/requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

Now, run `pip install -r requirements.txt` to install Django.

{% filename %}command-line{% endfilename %}

    (myvenv) ~$ pip install -r requirements.txt
    Collecting Django~={{ book.django_version }} (from -r requirements.txt (line 1))
      Downloading Django-{{ book.django_version }}-py3-none-any.whl (7.1MB)
    Installing collected packages: Django
    Successfully installed Django-{{ book.django_version }}
    

<!--sec data-title="Installing Django: Windows" data-id="django_err_windows"
data-collapse=true ces-->

> If you get an error when calling pip on Windows platform, please check if your project pathname contains spaces, accents or special characters (for example, `C:\Users\User Name\djangogirls`). If it does, please consider using another place without spaces, accents or special characters (suggestion: `C:\djangogirls`). Create a new virtualenv in the new directory, then delete the old one and try the above command again. (Moving the virtualenv directory won't work since virtualenv uses absolute paths.)

<!--endsec-->

<!--sec data-title="Installing Django: Windows 8 and Windows 10" data-id="django_err_windows8and10"
data-collapse=true ces-->

> Your command line might freeze after when you try to install Django. If this happens, instead of the above command use:
> 
> {% filename %}command-line{% endfilename %}
> 
>     C:\Users\Name\djangogirls> python -m pip install -r requirements.txt
>     

<!--endsec-->

<!--sec data-title="Installing Django: Linux" data-id="django_err_linux"
data-collapse=true ces-->

> If you get an error when calling pip on Ubuntu 12.04 please run `python -m pip install -U --force-reinstall pip` to fix the pip installation in the virtualenv.

<!--endsec-->

That's it! You're now (finally) ready to create a Django application!