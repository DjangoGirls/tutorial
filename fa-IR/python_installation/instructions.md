> برای خوانندگان در خانه: این فصل در ویدئو [نصب پایتون و ویرایشگر کد](https://www.youtube.com/watch?v=pVTaqzKZCdA) توضیح داده شده است.
> 
> این قسمت بر اساس دوره آموزشی Geek Girls Carrots نوشته شده است.(https://github.com/ggcarrots/django-carrots)

جنگو با پایتون نوشته شده است. برای نجام هر کاری در جنگو، به زبان پایتون احتیاج داریم. بیایید با نصب پایتون شروع کنیم! ما می‌خواهیم شما آخرین نسخه پایتون 3 را نصب کنید، بنابراین اگر هرنسخه قدیمی تری دارید باید آن را به روزرسانی کنید. اگر نسخه پایتون 3.4 یا جدیدتر آن را دارید برای این برنامه کافی است.

حتی اگر بر روی کامپیوتر شما Anaconda نصب شده است، لطفاً پایتون معمولی را به روش زیر نصب کنید.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

ابتدا متوجه شوید که کامپیوتر شما دارای ویندوز 32-bit است یا 64-bit، در ردیف "System type" در صفحه System Info می‌توانید این را متوجه شوید. برای پیدا کردن این صفحه یکی از کارهای زیر را انجام دهید:

* دکمه Windows و دکمه Pause/Break را همزمان روی کیبورد فشار دهید
* Control Panel را از منو ویندوز باز کنید، سپس به System & Security بروید و بعد از آن به System بروید
* دکمه Windows را فشار دهید، سپس مسیر Settings > System > About را دنبال کنید

می‌توانید پایتون برای ویندوز را از وبسایت https://www.python.org/downloads/windows/ دانلود کنید. بر روی لینک "Latest Python 3 Release - Python x.x.x" کلیک کنید. اگر کامپیوتر شما نسخه **64-bit** ویندوز را اجرا می‌کند، **Windows x86-64 executable installer** را دانلود کنید. در غیر اینصورت، **Windows x86 executable installer** را دانلود کنید. پس از دانلود کردن اینستالر، باید آن را اجرا کنید (بر روی آن دوبار کلیک کنید) و دستورالعمل‌ها را دنبال کنید.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. install all Windows Updates and try to install Python again; or
2. install an [older version of Python](https://www.python.org/downloads/windows/), e.g., [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* Download the *Mac OS X 64-bit/32-bit installer* file,
* Double click *python-3.6.1-macosx10.6.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ grep ^NAME= /etc/os-release
    

Afterwards, depending on the result, follow one of the following installation guides below this section.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

If you're on older Fedora versions you might get an error that the command `dnf` is not found. In that case, you need to use `yum` instead.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

Use this command in your console:

{% filename %}command-line{% endfilename %}

    $ sudo zypper install python3
    

<!--endsec-->

Verify the installation was successful by opening a command prompt and running the `python3` command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

The version shown may be different from 3.6.1 -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is 3.4.0 or higher.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.