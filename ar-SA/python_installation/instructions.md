> للقراء في المنزل: هذا الفصل تم التكلم عنه في [تثبيت بايثون محرر التعليمات البرمجية](https://www.youtube.com/watch?v=pVTaqzKZCdA).
> 
> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots)

دجانغو مكتوبة ببايثون.. نحن بحاجة إلى بايثون للقيام بأي شيء في جانغو. دعونا نبدأ بتثبيته! نحن نريد منك تثبيت "بايثون 3،6"، حتى إذا كان لديك أي إصدار سابق، سوف تحتاج إلى ترقية.

<!--sec data-title="Install Python: Windows" data-id="python_windows" data-collapse=true ces-->

أولا تحقق ان كان حاسوبك يستخدم نسخة 32 بت او 64 بت من وندوز, ، عن طريق الضغط على مفتاح ويندوز + مفتاح Pause/Break الذي سيقوم بفتح معلومات النظام الخاص بك، وإلقاء نظرة على السطر "نوع النظام". يمكنك تحميل بايثون ل Windows من https://www.python.org/downloads/windows/. انقر فوق "Latest Python 3 Release - Python x.x.x". إذا كان جهاز الكمبيوتر الخاص بك يقوم بتشغيل إصدار **64 بت** من Windows، حمل **Windows x86-64 executable installer**. وبخلاف ذلك، حمل **Windows x86 executable installer**. بعد تحميل المثبت، ينبغي تشغيله (انقر نقراً مزدوجاً على الملف) واتبع الإرشادات الموجودة هناك.

شيء واحد يجب عليك الإنتباه له أثناء التثبيت ستلاحظ علامة نافذة "إعداد". تأكد من وضع علامة في خانة الاختيار "Add Python 3.6 to PATH" وانقر فوق "التثبيت الآن"، كما هو موضح هنا:

![لا تنس إضافة بيثون إلى المسار](../python_installation/images/python-installation-options.png)

في الخطوات المقبلة، عليك استخدام سطر أوامر Windows (والذي سنتكلم عنه ايضا). الآن، إذا كنت بحاجة لكتابة بعض الأوامر، انتقل إلى قائمة ابدأ ← نظام Windows ← موجه الأوامر. يمكنك أيضا الضغط على مفتاح Windows واضغط مفتاح "R"- حتى تضهر نافدة "Run". لفتح سطر الأوامر، اكتب "cmd" وإضغط على أدخل في "Run". (في الإصدارات الأحدث من Windows، قد تحتاج إلى البحث عن "موجه الأوامر"، نظراً لأنه في بعض الأحيان مخفي.)

![أكتب "cmd" في نافدة "Run&quot](../python_installation/images/windows-plus-r.png)

ملاحضة: اذا كنت تستخدم نسخة قديمة من وندوز ( 7، فيستا، او اي نسخة قديمة) وبايثون 3.6 فشلت في التنصيب يكنك تجريب هذا:

1. تثبيت كافة تحديثات Windows ومحاولة تثبيت بايثون 3.6 مرة أخرى؛ أو
2. تثبيت [نسخة اقدم من بايثون](https://www.python.org/downloads/windows/) مثال [3.4.6](https://www.python.org/downloads/release/python-346/).

إذا قمت بتثبيت إصدار قديم من بايثون، شاشة التثبيت قد تبدو مختلفة بعض الشيء مما هو مبين أعلاه. تأكد من أنك قمت بالتمرير لأسفل لرؤية "Add python.exe to Path"، ثم انقر فوق الزر الموجود على الجانب الأيسر واختر "Will be installed on local hard drive":

![إضافة بايثون إلى المسار، الإصدارات القديمة](../python_installation/images/add_python_to_windows_path.png)

<!--endsec-->

<!--sec data-title="Install Python: OS X" data-id="python_OSX"
data-collapse=true ces-->

> **ملاحظة** قبل أن تقوم بتثبيت بايثون على نظام التشغيل OS X، عليك التأكد من إعدادات ماك إذا كانت تسمح بتثبيت الحزم التي ليست من المتجر. إذهب إلى "تفضيلات النظام" (في مجلد التطبيقات)، انقر فوق "الأمان الخصوصية"، ثم علامة التبويب "عام". إذا كانت " السمحاح بالتطبيقات للتحميل من " موضوعة على تطبيقات أبستور فقط غيرها إلى " تطبيقات أبستور و المطورين الغير المعرفين "

يجب عليك زيارة هذا الموقع وتحميل مثبت بايثون https://www.python.org/downloads/release/python-361/:

* تحميل ملف *مثبت Ma c OS X 64-بت/32-بت * ،
* انقر نقراً مزدوجاً فوق *python-3.6.1-macosx10.6.pkg* لتشغيل المثبت.

<!--endsec-->

<!--sec data-title="Install Python: Linux" data-id="python_linux"
data-collapse=true ces-->

من المحتمل جدا ان لديك نسخة بايثون مثبتة بالفعل ، للتحقق ادخل الأوامر التالية في وحدة التحكم:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

إذا كان لديك 'نسخة مايكرو' مختلفة من بايثون منصبة، مثل 3.6.0، إذا ليس عليك الترقية. إذا لم تنصب بايثون ، أي انك تريد نسخة مغايرة ، يمكنك تثبيته على النحو التالي:

<!--endsec-->

<!--sec data-title="Install Python: Debian or Ubuntu" data-id="python_debian" data-collapse=true ces-->

استخدم هذا الأمر في وحدة التحكم الخاصة بك:

{% filename %} baris perintah {% endfilename %}

    $ sudo apt install python3.6
    

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

تحقق من أن عملية التثبيت كانت ناجحة بفتح موجه الأوامر ثم تشغيل الأمر `python3`:

{% filename %}command-line{% endfilename %}

    $ python3 --version
    Python 3.6.1
    

**ملاحظة:** إذا كنت على ويندوز، و حصلت على رسالة خطأ أنه لم يتم العثور على `python3`، حاول استخدام `python` (دون `3`) وتجربة اذا كان لا يزال هنا نسخة من 3.6 بيثون.

* * *

إذا كان لديك اي سؤال ، او حصل شي ما وليس لديه اي فكرة عن ما حصل ، رجاء إستشر مدربك! أحيانا لا تسير الأمور بسلاسة، لذا من الأفضل أن تطلب المساعدة من شخص لديه خبرة أكبر.