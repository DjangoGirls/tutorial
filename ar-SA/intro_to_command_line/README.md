# مقدمة لواجهة سطر الأوامر

> للقراء في المنزل: هذا الفصل تم التكلم عنه في [Your new friend: Command Line](https://www.youtube.com/watch?v=jvZLWhkzX-8).

أنه مثير، أليس كذلك؟! عليك كتابة السطر الأول الخاص بك من التعليمات البرمجية في بضع دقائق فقط! :)

**دعونا نقدم لكم صديقكم الأول: سطر الأوامر!**

الخطوات التالية سوف تظهر لك كيفية استخدام النافدة السوداء التي يستخدمها جميع الهكر. قد تبدو مخيفه قليلاً في البداية ولكن حقاً أنها مجرد موجه تنتظر الأوامر منك.

> **ملاحظة** يرجى ملاحظة أن طوال هذا الكتاب يمكننا استخدام عبارات 'الدليل' و 'مجلد' بالتبادل ولكنها واحدة ونفس الشيء.

## ما هو سطر الأوامر؟

النافذة، والتي عادة ما تسمى **سطر الأوامر** أو **واجهة سطر الأوامر**، هو تطبيق يستند إلى النص للعرض، والمناولة، ومعالجة الملفات الموجودة على جهاز الكمبيوتر الخاص بك. أنه يشبه إلى حد كبير ويندوز إكسبلورر أو الباحث في Mac، ولكن دون واجهة رسومية. أسماء أخرى لسطر الأوامر هي: *cmd*, *CLI*, *prompt*, *console* أو *terminal*.

## إفتح واجهة سطر الأوامر

لبدء بعض التجارب نحن بحاجة إلى فتح واجهة سطر الأوامر لدينا أولاً.

{% include "/intro_to_command_line/open_instructions.md" %}

## موجه

يجب أن تشاهد الآن نافذة بيضاء أو سوداء تنتظر الأوامر الخاصه بك.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

إذا كنت على Mac أو Linux، ربما ترى `$`، مثل هذا:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

على Windows، ربما ترى `>`، مثل هذا:

{% filename %}command-line{% endfilename %}

    >
    

ألقي نظرة على قسم لينكس أعلاه مباشرة -- سترى شيئا مثل هذا عندما تصل إلى PythonAnywhere لاحقا في البرنامج التعليمي.

<!--endsec-->

سيتم إرفاق كل أمر مسبقاً بواسطة `$` أو `>` ومسافة واحدة، ولكن يجب ألا تكتبها. الكمبيوتر الخاص بك سوف يفعله من أجلك. :)

> ملاحظة صغيرة: في حالتك قد يكون هناك شيء مثل `C:\Users\ola>` أو `Olas-MacBook-Air:~ ola$` قبل علامة الطلب، وهذا هو 100% على ما يرام.

الجزء الذي يصل إلى ويحتوي على `$` أو `>` يسمى *موجه سطر الأوامر*، أو *الموجه* بإختصار. إنه يطالبك بإدخال شيء هناك.

في البرنامج التعليمي، عندما نريد منك كتابة أمر ما، سنقوم بتضمين `$` أو `>`، وأحيانا أكثر إلى اليسار. تجاهل الجزء الأيسر واكتب فقط في الأمر، الذي يبدأ بعد الموجه.

## الأمر الأول الخاص بك (ياي!)

دعونا نبدأ بكتابة هذا الأمر:

<!--sec data-title="Your first command: OS X and Linux" data-id="OSX_Linux_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ whoami
    

<!--endsec-->

<!--sec data-title="Your first command: Windows" data-id="windows_whoami" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > whoami
    

<!--endsec-->

ثم اضغط على `enter`. هذه هي النتيجة لدينا:

{% filename %}command-line{% endfilename %}

    $ whoami
    olasitarska
    

كما ترون، الكمبيوتر قد طبع اسم المستخدم الخاص بك. أنيق، هاه؟ :)

> حاول كتابة كل أمر؛ لا تنسخ وتلصق. سوف تتذكر أكثر بهذه الطريقة!

## الأساسيات

كل نظام تشغيل يحتوي على مجموعة مختلفة قليلاً من أوامر سطر الأوامر، لذا تأكد من اتباع التعليمات لنظام التشغيل الخاص بك. دعونا نحاول هذا،هيا بنا؟

### الدليل الحالي

سيكون من الجميل أن نعرف أين نحن الآن، اليس كذالك؟ لنرى. اكتب هذا الأمر وإضغط `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> ملاحظة: 'pwd' تعني 'طباعة دليل العمل'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> ملاحظة: 'cd' تعني 'تغيير الدليل'. مع PowerShell يمكنك استخدام pwd تماما مثل Linux أو Mac OS X.

<!--endsec-->

ربما سترى شيئا مشابها على الجهاز الخاص بك. عندما تقوم بفتح سطر الأوامر تبدأ عادة في الدليل الرئيسي للمستخدم الخاص بك.

* * *

### معرفة المزيد حول الأمر

العديد من الأوامر التي يمكنك كتابتها في موجه الأوامر لها مساعدة مدمجة يمكنك عرضها وقراءتها! على سبيل المثال، لمعرفة المزيد عن أمر الدليل الحالي:

<!--sec data-title="Command help: OS X and Linux" data-id="OSX_Linux_man" data-collapse=true ces-->

OS X و Linux لديهما أمر `man` الذي يعطيك المساعدة في الأوامر. جرب `man pwd` وشاهد ما يقوله، أو ضع `man` قبل أوامر أخرى لمشاهدة مساعدتهم. ناتج `man` هو عادة صفحة استخدم زر المسافة للإنتقال إلى الصفحة التالية، و `q` للخروج من النظر إلى المساعدة.

<!--endsec-->

<!--sec data-title="Command Help: Windows" data-id="windows_help" data-collapse=true ces-->

إضافة `/?` لاحقة لمعظم الأوامر سوف يطبع صفحة المساعدة. قد تحتاج إلى تمرير نافذة الأوامر الخاصة بك لرؤية كل شيء. جرب `cd /?`.

<!--endsec-->

### قائمة الملفات والدلائل

اذاً ماذا فيها؟ سيكون من الرائع معرفة ذلك، دعونا نرى:

<!--sec data-title="List files and directories: OS X and Linux" data-id="OSX_Linux_ls" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    Applications
    Desktop
    Downloads
    Music
    ...
    

<!--endsec-->

<!--sec data-title="List files and directories: Windows" data-id="windows_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
     Directory of C:\Users\olasitarska
    05/08/2020 07:28 PM <DIR>      Applications
    05/08/2020 07:28 PM <DIR>      Desktop
    05/08/2020 07:28 PM <DIR>      Downloads
    05/08/2020 07:28 PM <DIR>      Music
    ...
    

> ملاحظة: في PowerShell يمكنك أيضا استخدام 'ls' مثل Linux و Mac OS X. <!--endsec-->

* * *

### تغيير الدليل الحالي

الآن، دعونا نذهب إلى دليل سطح المكتب لدينا:

<!--sec data-title="Change current directory: OS X" data-id="OSX_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

<!--endsec-->

<!--sec data-title="Change current directory: Linux" data-id="Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

لاحظ أن اسم الدليل "سطح المكتب" قد يترجم إلى لغة حساب لينكس الخاص بك. إذا كان الأمر كذلك، ستحتاج إلى استبدال `Desktop` بالاسم المترجم؛ على سبيل المثال، `Schreibtisch` بالألمانية.

<!--endsec-->

<!--sec data-title="Change current directory: Windows" data-id="windows_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd Desktop
    

<!--endsec-->

تحقق إذا كان تم تغييره حقا:

<!--sec data-title="Check if changed: OS X and Linux" data-id="OSX_Linux_pwd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check if changed: Windows" data-id="windows_cd2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

ها هي!

> نصيحة المحترفين: إذا كتبت `cd D` ثم ضغطت على `tab` في لوحة المفاتيح، فسيملأ سطر الأوامر تلقائيا بقية الاسم حتى تتمكن من التنقل بشكل أسرع. إذا كان هناك أكثر من مجلد واحد يبدأ بـ "D"، اضغط على مفتاح `tab` مرتين للحصول على قائمة الخيارات.

* * *

### إنشاء دليل

ماذا عن إنشاء دليل تدريب على سطح المكتب الخاص بك؟ يمكنك القيام بذلك بهذه الطريقة:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

سيؤدي هذا الأمر الصغير إلى إنشاء مجلد باسم `practice` على سطح المكتب. يمكنك التحقق إذا كان هناك من خلال النظر في سطح المكتب الخاص بك أو بواسطة تشغيل أمر `dir` أو `ls`! جربها. :)

> نصيحة للمحترفين: إذا كنت لا ترغب في كتابة نفس الأوامر مراراً وتكراراً، حاول الضغط على `سهم للأعلى` و `سهم للأسفل` على لوحة المفاتيح للتنقل عبر الأوامر المستخدمة مؤخرا.

* * *

### تمرين!

تحدي صغيرة بالنسبة لك: في الدليل الذي تم إنشاؤه حديثا `practice` ، قم بإنشاء دليل يسمى `test`(استخدم الأمرين `cd` و `mkdir`.)

#### الحل:

<!--sec data-title="Exercise solution: OS X and Linux" data-id="OSX_Linux_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd practice
    $ mkdir test
    $ ls
    test
    

<!--endsec-->

<!--sec data-title="Exercise solution: Windows" data-id="windows_test_dir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd practice
    > mkdir test
    > dir
    05/08/2020 07:28 PM <DIR>      test
    

<!--endsec-->

تهانينا! :)

* * *

### التنظيف

لا نريد أن تترك فوضى، لذلك دعونا نزيل كل ما قمنا به حتى هذه النقطة.

أولاً، نحن بحاجة للعودة إلى سطح المكتب:

<!--sec data-title="Clean up: OS X and Linux" data-id="OSX_Linux_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd ..
    

<!--endsec-->

<!--sec data-title="Clean up: Windows" data-id="windows_back" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd ..
    

<!--endsec-->

استخدام `..` مع أمر `cd` سيغير الدليل الحالي الخاص بك إلى الدليل الأصلي (وهو، الدليل الذي يحتوي على الدليل الحالي الخاص بك).

تحقق أين أنت:

<!--sec data-title="Check location: OS X and Linux" data-id="OSX_Linux_pwd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska/Desktop
    

<!--endsec-->

<!--sec data-title="Check location: Windows" data-id="windows_cd3" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska\Desktop
    

<!--endsec-->

حان الوقت الآن لحذف دليل `practice`:

> **انتباه**: حذف الملفات بإستخدام `del`، `rmdir` أو `rm` غير قابل للإسترداد، مما يعني أن *الملفات المحذوفة ستزول للأبد*! لذا كن حدرا جدا مع هذه الأوامر.

<!--sec data-title="Delete directory: Windows Powershell, OS X and Linux" data-id="OSX_Linux_rm" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ rm -r practice
    

<!--endsec-->

<!--sec data-title="Delete directory: Windows Command Prompt" data-id="windows_rmdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > rmdir /S practice
    practice, Are you sure <Y/N>? Y
    

<!--endsec-->

تم! للتأكد دعونا نتحقق من انك حدفته فعليا:

<!--sec data-title="Check deletion: OS X and Linux" data-id="OSX_Linux_ls2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ ls
    

<!--endsec-->

<!--sec data-title="Check deletion: Windows" data-id="windows_dir2" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > dir
    

<!--endsec-->

### الخروج

هذا كل شيء الأن! يمكنك إغلاق سطر الأوامر الآن بأمان. دعونا نفعل ذلك بطريقة القراصنة، حسناً؟ :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

رائع، هاه؟ :)

## الملخص

هنا ملخص لبعض الأوامر المفيدة:

| الأوامر (في Windows) | الأوامر في (ماك/لينكس) | الوصف                 | أمثلة                                              |
| -------------------- | ---------------------- | --------------------- | -------------------------------------------------- |
| exit                 | exit                   | أغلق النافذة          | **exit**                                           |
| cd                   | cd                     | تغيير الدليل          | **cd test**                                        |
| cd                   | pwd                    | إظهار الدليل الحالي   | **cd** (Windows) o **pwd** (Mac OS / Linux)        |
| dir                  | ls                     | قائمة الدلائل/ملفات   | **dir**                                            |
| copy                 | cp                     | نسخ ملف               | **copy c:\test\test.txt c:\windows\test.txt**  |
| move                 | mv                     | نقل الملف             | **move c:\test\test.txt c:\windows\test.txt**  |
| mkdir                | mkdir                  | إنشاء دليل جديد       | **mkdir testdirectory**                            |
| rmdir (or del)       | rm                     | حذف الملف             | **del c:\test\test.txt**                         |
| rmdir /S             | rm -r                  | حذف الدليل            | **rm -r testdirectory**                            |
| [CMD] /?             | man [CMD]              | احصل على مساعدة للأمر | **cd /?** (Windows) أو **man cd** (Mac OS / Linux) |

هذه فقط عدد قليل جداً من الأوامر التي يمكنك تشغيلها في سطر الأوامر الخاصة بك، ولكنك لن تستخدم أي شيء اكثر من ذلك اليوم.

إذا كنت فضولياً، [ss64.com](http://ss64.com) يحتوي على مرجع كامل للأوامر لجميع أنظمة التشغيل.

## مستعد ؟

دعونا نغوص في بايثون!