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

<!--sec data-title="Opening: Windows" data-id="windows_prompt" data-collapse=true ces-->

إذهب الى نافدة البداية ← نضام وندوز ← موجه الأوامر.

> على الإصدارات القديمة من ويندوز، ابحث في قائمة ابدأ > كافة البرامج > ملحقات > موجه الأوامر.

<!--endsec-->

<!--sec data-title="Opening: OS X" data-id="OSX_prompt" data-collapse=true ces-->

انتقل إلى التطبيقات → الأدوات المساعدة → تيرمينال.

<!--endsec-->

<!--sec data-title="Opening: Linux" data-id="linux_prompt" data-collapse=true ces-->

It's probably under Applications → Accessories → Terminal, but that may depend on your system. If it's not there, you can try to Google it. :)

<!--endsec-->

## موجه

يجب أن تشاهد الآن نافذة بيضاء أو سوداء تنتظر الأوامر الخاصه بك.

<!--sec data-title="Prompt: OS X and Linux" data-id="OSX_Linux_prompt" data-collapse=true ces-->

If you're on Mac or Linux, you probably see `$`, like this:

{% filename %}command-line{% endfilename %}

    $
    

<!--endsec-->

<!--sec data-title="Prompt: Windows" data-id="windows_prompt2" data-collapse=true ces-->

في Windows، انها علامة `>`، مثل هذا:

{% filename %}command-line{% endfilename %}

    >
    

<!--endsec-->

سيتم إرفاق كل أمر قبل هذه الإشارة ومسافة واحدة، ولكن ليس عليك كتابته. سيقوم جهاز الكمبيوتر بالقيام بذلك نيابة عنك. :)

> مجرد ملاحظة صغيرة: في الحالة الخاصة بك قد يكون هناك شيء من هذا القبيل `C:\Users\ola >` أو `Olas-MacBook-Air:~ ola$` قبل التوقيع الفوري، وهذا موافق 100 ٪.

يطلق على الجزء`$` أو `>` أو *موجه سطر الأوامر*، أو *موجه* كإسم قصير. فإنه يطالبك بإدخال شيء هناك.

في البرنامج التعليمي، عندما نريد منك أن تكتب أمر ما ، سوف نشمل `$` أو `>`، وأحيانا أكثر إلى اليسار. Ignore the left part and only type in the command, which starts after the prompt.

## الأمر الأول الخاص بك (ياي!)

لنبدأ بكتابة هذا الأمر:

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

> حاول كتابة كل أمر؛ لا نسخ ولصق. عليك أن تتذكر هذه الطريقة أكثر!

## الأساسيات

كل نظام تشغيل يحتوي على مجموعة مختلفة قليلاً من أوامر سطر الأوامر، لذا تأكد من اتباع التعليمات لنظام التشغيل الخاص بك. دعونا نحاول هذا،هيا بنا؟

### الدليل الحالي

سيكون من الجميل أن نعرف أين نحن الآن، اليس كذالك؟ لنرى. اكتب هذا الأمر وإضغط `enter`:

<!--sec data-title="Current directory: OS X and Linux" data-id="OSX_Linux_pwd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ pwd
    /Users/olasitarska
    

> ملاحظة: 'pwd' تعني 'دليل عمل الطباعة'.

<!--endsec-->

<!--sec data-title="Current directory: Windows" data-id="windows_cd" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > cd
    C:\Users\olasitarska
    

> ملاحظة: 'cd' تعني 'تغيير الدليل'. تماما مثل pwd مع powershell يمكنك استخدامه في لينكس أو نظام التشغيل Mac OS X.

<!--endsec-->

ربما سترى شيئا مشابها على الجهاز الخاص بك. عندما تقوم بفتح سطر الأوامر تبدأ عادة في الدليل الرئيسي للمستخدم الخاص بك.

* * *

### قائمة الملفات والدلائل

اذا ماذا فيها ؟ سيكون من الرائع معرفة ذالك ، دعونا نرى:

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
    05/08/2014 07:28 PM <DIR>      Applications
    05/08/2014 07:28 PM <DIR>      Desktop
    05/08/2014 07:28 PM <DIR>      Downloads
    05/08/2014 07:28 PM <DIR>      Music
    ...
    

> ملاحظة: في powershell يمكنك أيضا استخدام 'ls' مثل لينكس، ونظام التشغيل Mac OS X. <!--endsec-->

* * *

### تغيير الدليل الحالي

الآن، دعنا نذهب إلى دليل سطح المكتب:

<!--sec data-title="Change current directory: OS X and Linux" data-id="OSX_Linux_move_to" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ cd Desktop
    

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

ها هي ذا!

> نصيحة المحترفين: إذا كتبت <`cd D`، ثم ضغطت في `tab` على لوحة المفاتيح، فسيملأ سطر الأوامر تلقائيا بقية الاسم حتى تتمكن من التنقل بشكل أسرع. إذا كان هناك أكثر من مجلد واحد بدءاً من"D"، اضغط مفتاح `tab` مرتين للحصول على قائمة الخيارات.

* * *

### إنشاء دليل

ماذا عن إنشاء دليل للتدرب على سطح المكتب؟ يمكنك القيام بذلك بهذه الطريقة:

<!--sec data-title="Create directory: OS X and Linux" data-id="OSX_Linux_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ mkdir practice
    

<!--endsec-->

<!--sec data-title="Create directory: Windows" data-id="windows_mkdir" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > mkdir practice
    

<!--endsec-->

سيؤدي هذا الأمر الصغير إلى إنشاء مجلد باسم `practice` على سطح المكتب. You can check if it's there by looking on your Desktop or by running a `ls` or `dir` command! جربها. :)

> نصيحة للمحترفين: إذا كنت لا تريد كتابة الأوامر نفسها مرارا وتكرارا، فجرب الضغط على `up arrow` و `down arrow` على لوحة المفاتيح للتنقل عبر الأوامر المستخدمة مؤخرا.

* * *

### تمارين!

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
    05/08/2014 07:28 PM <DIR>      test
    

<!--endsec-->

مبروك

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

باستخدام `.` مع الأمر `cd` سيتم تغيير الدليل الحالي الخاص بك إلى الدليل الأصل (أي، الدليل الذي يحتوي على الدليل الحالي الخاص بك).

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

> **انتباه**: حذف الملفات باستخدام `del`, `rmdir` أو `rm` غير قابلة للاسترداد، مما يعني * الملفات ستزول إلى الأبد*! لذا كن حدرا جدا مع هذه الأوامر.

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

### خروج

هذا كل شيء الأن! يمكنك إغلاق سطر الأوامر الآن بأمان. دعونا نفعل ذلكبطريقة الهكر، حسنا؟ :)

<!--sec data-title="Exit: OS X and Linux" data-id="OSX_Linux_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    $ exit
    

<!--endsec-->

<!--sec data-title="Exit: Windows" data-id="windows_exit" data-collapse=true ces-->

{% filename %}command-line{% endfilename %}

    > exit
    

<!--endsec-->

جيد ، هاه

## الملخص

هنا ملخص لبعض الأوامر المفيدة:

| الأوامر (في Windows) | الأوامر في (ماك/لينكس) | الوصف               | أمثلة                                             |
| -------------------- | ---------------------- | ------------------- | ------------------------------------------------- |
| exit                 | exit                   | أغلق النافذة        | **exit**                                          |
| cd                   | cd                     | تغيير الدليل        | **cd test**                                       |
| cd                   | pwd                    | إظهار الدليل الحالي | **cd** (Windows) o **pwd** (Mac OS / Linux)       |
| dir                  | ls                     | قائمة الدلائل/ملفات | **dir**                                           |
| copy                 | cp                     | نسخ ملف             | **copy c:\test\test.txt c:\windows\test.txt** |
| move                 | mv                     | نقل الملف           | **move c:\test\test.txt c:\windows\test.txt** |
| mkdir                | mkdir                  | إنشاء دليل جديد     | **mkdir testdirectory**                           |
| rmdir (or del)       | rm                     | حذف الملف           | **del c:\test\test.txt**                        |
| rmdir /S             | rm -r                  | حذف الدليل          | **rm -r testdirectory**                           |

هذه فقط عدد قليل جداً من الأوامر يمكنك تشغيلها في سطر الأوامر الخاصة بك، ولكن انت لن تستخدم اي شيء اكثر من ذالك هذا اليوم.

إذا كنت فضولي، [ss64.com](http://ss64.com) يحتوي على مرجع كامل لأوامر لكافة أنظمة التشغيل.

## مستعد ؟

دعونا نغوص في بايثون!