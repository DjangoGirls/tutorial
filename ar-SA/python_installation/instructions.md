> للقراء في المنزل: هذا الفصل تم التكلم عنه في [تثبيت بايثون محرر التعليمات البرمجية](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots)

دجانغو مكتوب في بايتون. نحتاج إلى بايثون للقيام بأي شيء في دجانغو. دعونا نبدأ بتثبيته! نريد منك تثبيت أحدث إصدار من Python 3، لذا إذا كان لديك أي إصدار سابق، فستحتاج إلى ترقيته. إذا كان لديك بالفعل الإصدار {{ book.py_min_version }} أو أعلى يجب أن تكون على ما يرام.

الرجاء تثبيت بايثون العادية كما يلي، حتى عندما يكون لديك أناكوندا مثبت على جهاز الكمبيوتر الخاص بك.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

أولاً تحقق مما إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار 32 بت أو إصدار 64 بت من Windows، على سطر "نوع النظام" من صفحة معلومات النظام. للوصول إلى هذه الصفحة، حاول أحد هذه الأساليب:

* اضغط على مفتاح ويندوز ومفتاح الإيقاف/الاستراحة في نفس الوقت
* افتح لوحة التحكم الخاصة بك من قائمة ويندوز، ثم انتقل إلى النظام & الأمان، ثم النظام
* اضغط على زر Windows ، ثم انتقل إلى الإعدادات > النظام > حول
* ابحث في قائمة بدء تشغيل ويندوز عن "معلومات النظام". للقيام بذلك، انقر فوق زر البدء أو اضغط على مفتاح ويندوز، ثم ابدأ في كتابة `معلومات النظام`. سوف تبدأ في تقديم الاقتراحات بمجرد أن تكتب. يمكنك اختيار الإدخال بمجرد ظهوره.

يمكنك تحميل بايثون ل Windows من https://www.python.org/downloads/windows/. انقر فوق "Latest Python 3 Release - Python x.x.x". إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار **64 بت** من Windows، حمل **Windows x86-64 executable installer**. وبخلاف ذلك، حمل **Windows x86 executable installer**. بعد تحميل المثبت، ينبغي تشغيله (انقر نقراً مزدوجاً على الملف) واتبع الإرشادات الموجودة هناك.

شيء واحد يجب مراقبته: أثناء التثبيت، ستلاحظ علامة نافذة "الإعداد". تأكد من تحديد مربع الاختيار "إضافة بايثون {{ book.py_version }} إلى باث" أو "إضافة بايثون إلى متغيرات البيئة الخاصة بك" وانقر على "تثبيت الآن"، كما يظهر هنا (قد يبدو مختلفا بعض الشيء إذا كنت تقوم بتثبيت إصدار مختلف):

![لا تنس إضافة بيثون إلى المسار](../python_installation/images/python-installation-options.png)

عند اكتمال التثبيت، قد ترى مربع حوار مع رابط يمكنك متابعته لمعرفة المزيد عن بايثون أو عن الإصدار الذي قمت بتثبيته. إغلاق أو إلغاء مربع الحوار هذا -- سوف تتعلم المزيد في هذا البرنامج التعليمي!

ملاحظة: إذا كنت تستخدم نسخة قديمة من ويندوز (7، فيستا، أو أي إصدار قديم) وتثبيت Python {{ book.py_version }} فشل بخطأ، قم بتثبيت كافة تحديثات ويندوز وحاول تثبيت بايثون مرة أخرى. إذا كنت لا تزال تعاني من الخطأ، حاول تثبيت إصدار بايثون {{ book.py_min_release }} من [Python.org](https://www.python.org/downloads/windows/).

> جانغو {{ book.django_version }} يحتاج Python {{ book.py_min_version }} أو أكثر، الذي لا يدعم Windows XP أو الإصدارات السابقة.

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **ملاحظة** قبل تثبيت Python على OS X، يجب التأكد من أن إعدادات Mac تسمح بتثبيت الحزم التي ليست من متجر التطبيق. انتقل إلى تفضيلات النظام (هو في مجلد التطبيقات)، انقر فوق "الأمان & الخصوصية"، ثم علامة التبويب "الجنرال". إذا تم تعيين "السماح للتطبيقات التي تم تنزيلها من:" إلى "Mac App Store،" قم بتغييره إلى "Mac App Store والمطورين المحددين."

يجب عليك زيارة هذا الموقع وتحميل مثبت بايثون https://www.python.org/downloads/mac-osx/:

* تحميل ملف *مثبت Ma c OS X 64-بت/32-بت * ،
* انقر نقراً مزدوجاً فوق *python-3.6.1-macosx10.6.pkg* لتشغيل المثبت.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

من المحتمل جدا ان لديك نسخة بايثون مثبتة بالفعل ، للتحقق ادخل الأوامر التالية في وحدة التحكم:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python {{ book.py_release }}
    

إذا كان لديك نسخة مختلفة من Python مثبتة، على الأقل {{ book.py_min_version }} ( {{ book.py_min_release }}مثلاً)، فلن تحتاج إلى الترقية. إذا لم يكن لديك Python مثبت، أو إذا كنت تريد إصدار مختلف، فتحقق أولاً من توزيع لينكس الذي تستخدمه مع الأمر التالي:

{% filename %}command-line{% endfilename %}

    $ تنبيه '^NAME=' /etc/os-release
    

وبعد ذلك، ووفقا للنتيجة، اتبع أحد أدلة التثبيت التالية تحت هذا القسم.

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

استخدم هذا الأمر في وحدة التحكم الخاصة بك:

{% filename %}command-line{% endfilename %}

    $ sudo apt install python3
    

<!--endsec-->

<!--sec data-title="Install Python: Fedora" data-id="python_fedora"
data-collapse=true ces-->

استخدم هذا الأمر في وحدة التحكم الخاصة بك:

{% filename %}command-line{% endfilename %}

    $ sudo dnf install python3
    

إذا كنت تستخدم إصدار فيدورا قديم قد تحصل على خطأ لم يتم العثور على الأمر dnf. في هذه الحالة تحتاج إلى استخدام yum بدلاً من ذلك.

<!--endsec-->

<!--sec data-title="Install Python: openSUSE" data-id="python_openSUSE"
data-collapse=true ces-->

استخدم هذا الأمر في وحدة التحكم الخاصة بك:

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