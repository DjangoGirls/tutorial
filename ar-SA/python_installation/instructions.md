> للقراء في المنزل: هذا الفصل تم التكلم عنه في [تثبيت بايثون محرر التعليمات البرمجية](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots)

دجانغو مكتوبة ببايثون.. نحن بحاجة إلى بايثون للقيام بأي شيء في جانغو. دعونا نبدأ بتثبيته! نحن نريد منك تثبيت "بايثون 3،6"، حتى إذا كان لديك أي إصدار سابق، سوف تحتاج إلى ترقية.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

أولا تحقق ان كان حاسوبك يستخدم نسخة 32 بت او 64 بت من وندوز, ، عن طريق الضغط على مفتاح ويندوز + مفتاح Pause/Break الذي سيقوم بفتح معلومات النظام الخاص بك، وإلقاء نظرة على السطر "نوع النظام". يمكنك تحميل بايثون ل Windows من https://www.python.org/downloads/windows/. انقر فوق "Latest Python 3 Release - Python x.x.x". إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار **64 بت** من Windows، حمل **Windows x86-64 executable installer**. وبخلاف ذلك، حمل **Windows x86 executable installer**. بعد تحميل المثبت، ينبغي تشغيله (انقر نقراً مزدوجاً على الملف) واتبع الإرشادات الموجودة هناك.

شيء واحد يجب عليك الإنتباه له أثناء التثبيت ستلاحظ علامة نافذة "إعداد". تأكد من وضع علامة في خانة الاختيار "Add Python 3.6 to PATH" وانقر فوق "التثبيت الآن"، كما هو موضح هنا:

![لا تنس إضافة بيثون إلى المسار](../python_installation/images/python-installation-options.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

In upcoming steps, you'll be using the Windows Command Line (which we'll also tell you about). For now, if you need to type in some commands, go to Start menu and enter "Command Prompt" into the search field there. (On older versions of Windows, you can start the Command Line with Start menu → Windows System → Command Prompt.) You can also hold in the Windows key and press the "R"-key until the "Run" window pops up. To open the Command Line, type "cmd" and press enter in the "Run" window.

![Type "cmd" in the "Run" window](../python_installation/images/windows-plus-r.png)

Note: if you are using an older version of Windows (7, Vista, or any older version) and the Python 3.6.x installer fails with an error, you can try either:

1. تثبيت كافة تحديثات Windows ومحاولة تثبيت بايثون 3.6 مرة أخرى؛ أو
2. تثبيت [نسخة اقدم من بايثون](https://www.python.org/downloads/windows/) مثال [3.4.6](https://www.python.org/downloads/release/python-346/).

If you install an older version of Python, the installation screen may look a bit different than shown above. Make sure you scroll down to see "Add python.exe to Path", then click the button on the left and pick "Will be installed on local hard drive":

![Add Python to the Path, older versions](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **ملاحظة** قبل أن تقوم بتثبيت بايثون على نظام التشغيل OS X، عليك التأكد من إعدادات ماك إذا كانت تسمح بتثبيت الحزم التي ليست من المتجر. إذهب إلى "تفضيلات النظام" (في مجلد التطبيقات)، انقر فوق "الأمان الخصوصية"، ثم علامة التبويب "عام". إذا كانت " السمحاح بالتطبيقات للتحميل من " موضوعة على تطبيقات أبستور فقط غيرها إلى " تطبيقات أبستور و المطورين الغير المعرفين "

You need to go to the website https://www.python.org/downloads/release/python-361/ and download the Python installer:

* تحميل ملف *مثبت Ma c OS X 64-بت/32-بت * ،
* انقر نقراً مزدوجاً فوق *python-3.6.1-macosx10.6.pkg* لتشغيل المثبت.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

If you have a different 'micro version' of Python installed, e.g. 3.6.0, then you don't have to upgrade. If you don't have Python installed, or if you want a different version, you can install it as follows:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

Type this command into your console:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3.6
    

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
    

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python 3.6.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.