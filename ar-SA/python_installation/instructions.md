> للقراء في المنزل: هذا الفصل تم التكلم عنه في [تثبيت بايثون محرر التعليمات البرمجية](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots)

دجانغو مكتوب في بايتون. نحتاج إلى بايثون للقيام بأي شيء في دجانغو. دعونا نبدأ بتثبيته! نريد منك تثبيت أحدث إصدار من Python 3، لذا إذا كان لديك أي إصدار سابق، فستحتاج إلى ترقيته. If you already have version {{ book.py_min_version }} or higher you should be fine.

الرجاء تثبيت بايثون العادية كما يلي، حتى عندما يكون لديك أناكوندا مثبت على جهاز الكمبيوتر الخاص بك.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

أولاً تحقق مما إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار 32 بت أو إصدار 64 بت من Windows، على سطر "نوع النظام" من صفحة معلومات النظام. للوصول إلى هذه الصفحة، حاول أحد هذه الأساليب:

* اضغط على مفتاح ويندوز ومفتاح الإيقاف/الاستراحة في نفس الوقت
* افتح لوحة التحكم الخاصة بك من قائمة ويندوز، ثم انتقل إلى النظام & الأمان، ثم النظام
* اضغط على زر Windows ، ثم انتقل إلى الإعدادات > النظام > حول
* ابحث في قائمة بدء تشغيل ويندوز عن "معلومات النظام". للقيام بذلك، انقر فوق زر البدء أو اضغط على مفتاح ويندوز، ثم ابدأ في كتابة `معلومات النظام`. سوف تبدأ في تقديم الاقتراحات بمجرد أن تكتب. يمكنك اختيار الإدخال بمجرد ظهوره.

يمكنك تحميل بايثون ل Windows من https://www.python.org/downloads/windows/. انقر فوق "Latest Python 3 Release - Python x.x.x". إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار **64 بت** من Windows، حمل **Windows x86-64 executable installer**. وبخلاف ذلك، حمل **Windows x86 executable installer**. بعد تحميل المثبت، ينبغي تشغيله (انقر نقراً مزدوجاً على الملف) واتبع الإرشادات الموجودة هناك.

شيء واحد يجب مراقبته: أثناء التثبيت، ستلاحظ علامة نافذة "الإعداد". Make sure you tick the "Add Python {{ book.py_version }} to PATH" or 'Add Python to your environment variables" checkbox and click on "Install Now", as shown here (it may look a bit different if you are installing a different version):

![لا تنس إضافة بيثون إلى المسار](../python_installation/images/python-installation-options.png)

عند اكتمال التثبيت، قد ترى مربع حوار مع رابط يمكنك متابعته لمعرفة المزيد عن بايثون أو عن الإصدار الذي قمت بتثبيته. إغلاق أو إلغاء مربع الحوار هذا -- سوف تتعلم المزيد في هذا البرنامج التعليمي!

Note: If you are using an older version of Windows (7, Vista, or any older version) and the Python {{ book.py_version }} installer fails with an error, then install all Windows Updates and try to install Python again. If you still have the error, try installing Python version {{ book.py_min_release }} from [Python.org](https://www.python.org/downloads/windows/).

> Django {{ book.django_version }} needs Python {{ book.py_min_version }} or greater, which does not support Windows XP or earlier versions.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **Note** Before you install Python on OS X, you should ensure your Mac settings allow installing packages that aren't from the App Store. Go to System Preferences (it's in the Applications folder), click "Security & Privacy," and then the "General" tab. If your "Allow apps downloaded from:" is set to "Mac App Store," change it to "Mac App Store and identified developers."

You need to go to the website https://www.python.org/downloads/mac-osx/ and download the latest Python installer:

* تحميل ملف *مثبت Ma c OS X 64-بت/32-بت * ،
* Double click *python-{{ book.py_release }}-macosx10.9.pkg* to run the installer.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

It is very likely that you already have Python installed out of the box. To check if you have it installed (and which version it is), open a console and type the following command:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

If you have a different version of Python installed, at least {{ book.py_min_version }} (e.g. {{ book.py_min_release }}), then you don't have to upgrade. If you don't have Python installed, or if you want a different version, first check what Linux distribution you are using with the following command:

{% filename %}command-line{% endfilename %}

    $ تنبيه '^NAME=' /etc/os-release
    

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
    Python {{ book.py_release }}
    

The version shown may be different from {{ book.py_release }} -- it should match the version you installed.

**NOTE:** If you're on Windows and you get an error message that `python3` wasn't found, try using `python` (without the `3`) and check if it still might be a version of Python that is {{ book.py_min_version }} or higher. If that doesn't work either, you may open a new command prompt and try again; this happens if you use a command prompt left open from before the Python installation.

* * *

If you have any doubts, or if something went wrong and you have no idea what to do next, please ask your coach! Sometimes things don't go smoothly and it's better to ask for help from someone with more experience.