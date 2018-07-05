> สำหรับผู้อ่านทางบ้าน: บทนี้ครอบคลุมวิดีโอในส่วนของ [การติดตั้ง Python และ Code Editer](https://www.youtube.com/watch?v=pVTaqzKZCdA)
> 
> ในส่วนของบทนี้ อ้างอิงมาจากบทเรียนของ Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django ถูกเขียนโดยภาษา Python เพราะฉะนั้นเราจึงต้องใช้ Python ในการทำอะไรต่างๆใน Django งั้นเรามาเริ่มต้นด้วยการติดตั้ง Python กันเถอะ คุณต้องติดตั้ง Python เวอร์ชั่น 3.6 ถ้าหากคุณมีเวอร์ชั่นก่อนหน้านี้ คุณควรที่จะอัพเกรดมันก่อนนะ

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

ขั้นตอนแรก คุณควรตรวจสอบว่าคอมพิวเตอร์ของคุณรัน Windows เวอร์ชั่น 32-bit หรือ 64-bit คุณสามารถตรวจสอบได้โดยการกดปุ่ม Windows และ ปุ่ม Pause/Break ซึ่งการกดปุ่มสองปุ่มนี้พร้อมกันคุณจะสามารถเปิดเข้าไปดูข้อมูลระบบของคุณได้ จากนั้นให้ดูที่ System type คุณสามารถดาวน์โหลด Python สำหรับ Windows ได้จากเว็บไซต์ https://www.python.org/downloads/release/python-343/ คลิกที่ลิงค์ Latest Python 3 Release - Python x.x.x If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 executable installer**. Otherwise, download the **Windows x86 executable installer**. หลังจากดาวน์โหลดไฟล์ *. msi มาแล้ว คุณควรเริ่มติดตั้ง (double-click ที่ไฟล์) และทำตามคำแนะนำของตัวติดตั้ง

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" checkbox and click on "Install Now", as shown here:

![อย่าลืมเพิ่ม Python ไปยัง Path](../python_installation/images/python-installation-options.png)

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![พิมพ์ "cmd" ในหน้าต่าง "Run"](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python 3.6 again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

คุณต้องไปที่เว็บไซต์ https://www.python.org/downloads/release/python-361/ และดาวน์โหลดตัวติดตั้ง:

* ดาวน์โหลดไฟล์ *Mac OS X 64-bit/32-bit installer*
* Double click ที่ *python-3.4.3-macosx10.6.pkg* เพื่อรันตัวติดตั้ง

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

มีโอกาสสูงที่คุณจะมี Python ติดตั้งอยู่แล้ว ตรวจสอบว่าได้ติดตั้งแล้ว (และเป็นรุ่นอะไร) เปิดคอนโซลขึ้นมา และพิมพ์คำสั่งต่อไปนี้:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. ถ้าคุณยังไม่ได้ติดตั้ง Python หรือ ถ้าคุณต้องการเวอร์ชั่นอื่น คุณสามารถติดตั้งได้ ตามนี้:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

ใช้คำสั่งต่อไปนี้ในคอนโซลของคุณ:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

ใช้คำสั่งต่อไปนี้ในคอนโซลของคุณ:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use yum instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

ใช้คำสั่งต่อไปนี้ในคอนโซลของคุณ:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

ตรวจสอบว่าการติดตั้งสมบูรณ์หรือไม่ โดยเปิดโปรแกรม *Terminal* ขึ้นมา และรันคำสั่ง `python3` ตามนี้:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

หากคุณมีข้อสงสัยใด ๆ หรือคุณคิดว่ามีอะไรผิดพลาด และคุณไม่รู้จะทำอะไรต่อดี - ลองถามโค้ชของคุณสิ! บางครั้ง กระบวนการจะไม่ราบรื่นอย่างที่คิด มันจะดีกว่าถ้าคุณจะขอความช่วยเหลือจากคนอื่นที่มีประสบการณ์มาก่อน