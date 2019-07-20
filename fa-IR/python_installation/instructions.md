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

نکته قابل توجه: در هنگام نصب پنجره‌ای را خواهید دید به نام "Setup". مطمئن شوید که تیک "Add Python 3.6 to PATH" یا "Add Python to your environment variables" را زده باشید و بعد دکمه "Install Now" را همانطور که در تصویر می‌بینید، بزنید (اگر از نسخه دیگری استفاده کنید ممکن است کمی متفاوت از این به نظر برسد):

![Don't forget to add Python to the Path](../python_installation/images/python-installation-options.png)

وقتی که نصب کامل شد، یک پنجره خواهید دید که شما را به یک لینک برای آموزش بیشتر در مورد پایتون و نیز در مورد نسخه‌ای که نصب کرده‌اید ارجاع می‌دهد. این پنجره را کنسل کنید و یا ببندید - شما در همین دوره آموزشی بیشتر در مورد پایتون یاد خواهید گرفت!

نکته: اگر از نسخه‌های قدیمی‌تر ویندوز استفاده می‌کنید (7، ویستا یا نسخه های قدیمی‌تر) و نصب کننده پایتون 3.6.x خطا می‌دهد می‌توانید این را امتحان کنید:

1. تمام آپدیت‌های ویندوز را نصب کنید و بعد دوباره نصب کردن پایتون را امتحان کنید، یا
2. یک [نسخه قدیمی‌تر پایتون](https://www.python.org/downloads/windows/) را مانند [3.4.6](https://www.python.org/downloads/release/python-346/) نصب کنید.

اگر نسخه قدیمی‌تر پایتون را نصب کنید صفحه نصب با آن چیزی که در بالا دیدیم کمی متفاوت خواهد بود. مطمئن باشید که به سمت پایین اسکرول کنید تا عبارت "Add python.exe to Path" را ببینید، سپس بر روی دکمه در سمت چپ کلیک کنید و "Will be installed on local hard drive" را انتخاب کنید:

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **نکته** قبل از نصب پایتون بر روی OS X، باید مطمئن شوید که Mac شما اجازه نصب پکیج‌های خارج از اپ استور را می‌دهد. به System Preferences بروید (در فولدر Applications است)، بر روی "Security & Privacy" کلیک کنید و سپس تب "General" را انتخاب کنید. اگر گزینه "Allow apps downloaded from:" بر روی "Mac App Store," تنظیم شده بود آن را به "Mac App Store and identified developers." تغییر دهید

لازم است که به وبسایت https://www.python.org/downloads/release/python-361/ بروید و اینستالر پایتون را نصب کنید:

* فایل *Mac OS X 64-bit/32-bit installer* را دانلود کنید،
* بر روی *python-3.6.1-macosx10.6.pkg* دابل کلیک کنید تا اینستالر اجرا شود.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

احتمال زیادی دارد که شما بر روی کامپیوترتان پایتون داشته باشید. برای چک کردن آنکه آیا پایتون دارید (یا اینکه ورژن آن چیست)، یک کنسول باز کنید و دستورات زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

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