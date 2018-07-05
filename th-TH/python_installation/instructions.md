> สำหรับผู้อ่านทางบ้าน: บทนี้ครอบคลุมวิดีโอในส่วนของ [การติดตั้ง Python และ Code Editer](https://www.youtube.com/watch?v=pVTaqzKZCdA)
> 
> ในส่วนของบทนี้ อ้างอิงมาจากบทเรียนของ Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)

Django ถูกเขียนโดยภาษา Python เพราะฉะนั้นเราจึงต้องใช้ Python ในการทำอะไรต่างๆใน Django งั้นเรามาเริ่มต้นด้วยการติดตั้ง Python กันเถอะ คุณต้องติดตั้ง Python เวอร์ชั่น 3.6 ถ้าหากคุณมีเวอร์ชั่นก่อนหน้านี้ คุณควรที่จะอัพเกรดมันก่อนนะ

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

ขั้นตอนแรก คุณควรตรวจสอบว่าคอมพิวเตอร์ของคุณรัน Windows เวอร์ชั่น 32-bit หรือ 64-bit คุณสามารถตรวจสอบได้โดยการกดปุ่ม Windows และ ปุ่ม Pause/Break ซึ่งการกดปุ่มสองปุ่มนี้พร้อมกันคุณจะสามารถเปิดเข้าไปดูข้อมูลระบบของคุณได้ จากนั้นให้ดูที่ System type คุณสามารถดาวน์โหลด Python สำหรับ Windows ได้จากเว็บไซต์ https://www.python.org/downloads/release/python-343/ คลิกที่ลิงค์ Latest Python 3 Release - Python x.x.x ถ้าหากคอมพิวเตอร์ของคุณรัน Windows เวอร์ชั่น **64-bit** ให้ดาวน์โหลด **Windows x86-64 executable installer** ถ้าหากคอมพิวเตอร์ของคุณรัน Windows เวอร์ชั่นอื่น ให้ดาวน์โหลด **Windows x86 executable installer** หลังจากดาวน์โหลดไฟล์ *. msi มาแล้ว คุณควรเริ่มติดตั้ง (double-click ที่ไฟล์) และทำตามคำแนะนำของตัวติดตั้ง

สิ่งหนึ่งที่ต้องระวังก็คือ: ระหว่างการติดตั้ง คุณจะสังเกตเห็นหน้าต่างที่มีเครื่องหมาย "Setup" คุณควรตรวจสอบให้แน่ใจว่าคุณติ๊กที่ช่อง "Add Python 3.6 to PATH" และคลิกที่ "Install Now" ตามที่ปรากฏดังนี้:

![อย่าลืมเพิ่ม Python ไปยัง Path](../python_installation/images/python-installation-options.png)

ในขั้นตอนต่อจากนี้ คุณจะต้องใช้ Windows Command Line (ซึ่งเราจะอธิบายให้คุณฟังต่อไป) สำหรับตอนนี้ ถ้าหากคุณอยากจะพิมพ์คำสั่งใดๆ ให้ไปที่ Start และพิมพ์ "Command Prompt" ลงในช่องค้นหาที่ปรากฏ (ใน Windows รุ่นเก่าๆ คุณสามารถเริ่มใช้ Command Line ได้โดยการกด Start → Windows System → Command Prompt) คุณยังสามารถกดปุ่ม Windows และปุ่มตัว R จนหน้าต่าง "Run" เด้งขึ้นมา ในการเปิดใช้ Command Line พิมพ์ "cmd" แล้วกด Enter ในหน้าต่าง "Run"

![พิมพ์ "cmd" ในหน้าต่าง "Run"](../python_installation/images/windows-plus-r.png)

หมายเหตุ: ถ้าหากคุณใช้ Windows รุ่นเก่า (7, Vista, หรือรุ่นที่เก่ากว่านั้น) และไม่สามารถติดตั้ง Python 3.6.x ได้ คุณสามารถลองวิธีใดวิธีหนึ่งตามด้านล่างนี้:

1. ติดตั้ง Windows Updates ทั้งหมด และลองติดตั้ง Python 3.6 อีกครั้ง; หรือ
2. ติดตั้ง [Python รุ่นเก่า](https://www.python.org/downloads/windows/) เช่น e.g., [3.4.6](https://www.python.org/downloads/release/python-346/)

ถ้าหากคุณติดตั้ง Python รุ่นเก่า หน้าจอการติดตั้งอาจจะดูแตกต่างจากหน้าจอที่เราโชว์ในตัวอย่างด้านบน ควรตรวจสอบให้แน่ใจว่าคุณเลื่อนลงไปดู "Add python.exe to Path" แล้วคลิกที่ปุ่มด้านซ้ายมือ จากนั้นจึงเลือก "Will be installed on local hard drive":

![เพิ่ม Python to the Path รุ่นเก่า](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **หมายเหตุ** ก่อนที่คุณจะติดตั้ง Python บนระบบปฏิบัติการ OS X คุณควรตรวจสอบให้แน่ใจว่าการตั้งค่า Mac ของคุณนั้นอนุญาตให้ติดตั้งแพคเก็จที่ไม่ได้มาจาก App Store ได้ ให้ไปที่ System Preferences (มันอยู่ในโฟลเดอร์ Applications) คลิก "Security & Privacy," หลังจากนั้นให้คลิกที่แท็บ "General" ถ้าหาก "Allow apps downloaded from:" ถูกตั้งค่าให้อยู่ใน "Mac App Store," ให้เปลี่ยนเป็น "Mac App Store and identified developers."

คุณต้องไปที่เว็บไซต์ https://www.python.org/downloads/release/python-361/ และดาวน์โหลดตัวติดตั้ง Python:

* ดาวน์โหลดไฟล์ *Mac OS X 64-bit/32-bit installer*
* Double click ที่ *python-3.4.3-macosx10.6.pkg* เพื่อรันตัวติดตั้ง

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

มีโอกาสสูงที่คุณจะมี Python ติดตั้งอยู่แล้ว ตรวจสอบว่าได้ติดตั้งแล้ว (และเป็นรุ่นอะไร) เปิดคอนโซลขึ้นมา และพิมพ์คำสั่งต่อไปนี้:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

ถ้าหากคุณได้ติดตั้ง Python รุ่น 'micro version' เช่น 3.6.0 คุณก็ไม่ต้องอัพเกรดใดๆ ถ้าคุณยังไม่ได้ติดตั้ง Python หรือ ถ้าคุณต้องการเวอร์ชั่นอื่น คุณสามารถติดตั้งได้ ตามนี้:

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
    

ถ้าหากคุณใช้ Fedora รุ่นเก่า คุณอาจจะได้รับข้อความที่บอกถึงข้อผิดพลาดว่า `dnf` is not found (ไม่พบ dnf) ในกรณีนั้น คุณต้องใช้ yum แทน

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
    

**หมายเหตุ:** ถ้าหากคุณใช้ระบบปฏิบัตการ Windows และคุณได้รับข้อความที่บอกถึงข้อผิดพลาดว่า `python3` wasn't found (ไม่พบ python3) คุณควรลองพิมพ์ `python` (ไม่ต้องพิมพ์เลข `3`) แล้วลองตรวจสอบดูว่ามันยังเป็น Python รุ่น 3.6 หรือไม่

* * *

หากคุณมีข้อสงสัยใด ๆ หรือคุณคิดว่ามีอะไรผิดพลาด และคุณไม่รู้จะทำอะไรต่อดี - ลองถามโค้ชของคุณสิ! บางครั้ง กระบวนการจะไม่ราบรื่นอย่างที่คิด มันจะดีกว่าถ้าคุณจะขอความช่วยเหลือจากคนอื่นที่มีประสบการณ์มาก่อน