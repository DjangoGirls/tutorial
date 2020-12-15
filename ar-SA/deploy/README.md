# تدشين!

> **ملاحظه** الفصل التالي قد يكون في بعض الأحيان صعبا. استمر و اعزم على الانتهاء منه؛ التدشين جزء هام من عملية تطوير موقع على شبكة الإنترنت. ويوضع هذا الفصل في منتصف البرنامج التعليمي حتى يمكن لمدربك أن يساعدك في العمليات الأصعب قليلاً لنشر موقع الويب الخاص بك على الإنترنت. وهذا يعني أنه لا يزال يمكنك الانتهاء من البرنامج التعليمي الخاص بك بمفردك إذا نفذ الوقت منك.

حتى الأن موقعك كان متاحا فقط على حاسوبك. الأن سوف تتعلم كيف تنشره! النشر هو عملية اتاحة التطبيق الخاص بك على شبكة الإنترنت حيث يمكن للناس الذهاب إلى التطبيق الخاص بك و مشاهدته. :)

كما تعلمت، موقع على شبكة الإنترنت يجب أن يتواجد في خادم. هناك الكثير من مقدمي الخدمة متاحين على شبكة الإنترنت، ونحن سنستخدم [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere متوفر مجانا للتطبيقات الصغيرة التي لا تحتوي على عدد كبير من الزائرين فالآن بالتأكيد ستكون كافية بالنسبة لك.

الخدمات الخارجية الأخرى ستقوم باستخدام [GitHub](https://www.github.com)، وهي خدمة استضافة التعليمات البرمجية. هناك آخرون ، ولكن تقريبا جميع المبرمجين لديهم حساب GitHub في هذه الأيام، والآن أنت سوف يمكنك أيضا الحصول على حساب!

سوف تكون هذه الأماكن الثلاثة هامة بالنسبة لك. الكمبيوتر الخاص بك سوف يكون المكان حيث يمكنك القيام بالتطوير والإختبار. عندما تكون راضيا عن التغييرات، ستقوم بوضع نسخة من التعليمات البرمجية على GitHub. موقعك سيكون على بايثون في كل مكان ، وستقوم بتحديثه عبر استقدام نسخة جديدة من GitHub.

# جيت (Git)

> **Note** If you already did the [installation steps](../installation/README.md), there's no need to do this again – you can skip to the next section and start creating your Git repository.

{% include "/deploy/install_git.md" %}

## ابتداء مستودعك في Git

Git يتعقب التغييرات التي تحدث لمجموعة معينة من الملفات في ما يسمى بمستودع الكود (أو "الريبو" للاختصار). لنبدأ انشاء مستودع (ريبو) لمشروعنا. افتح وحدة التحكم الخاص بك ، وشغل هذه الأوامر في دليل `djangogirls`:

> **ملاحظة** تحقق من دليل العمل الحالي الخاص بك مع `pwd` (Mac OS X/لينكس) أو `cd` (في Windows) قبل تهيئة المستودع. يجب أن تكون في المجلد `djangogirls`.

{% filename %}command-line{% endfilename %}

    $ git init
    Initialized empty Git repository in ~/djangogirls/.git/
    $ git config --global user.name "Your Name"
    $ git config --global user.email you@example.com
    

تهيئة المستودع هو شيء نحتاج القيام به مرة واحدة فقط لكل مشروع (ولن تضطر إلى إعادة إدخال اسم المستخدم والبريد الإلكتروني مرة أخرى).

Git سوف يتعقب التغييرات لكافة الملفات والمجلدات الموجودة في هذا الدليل، ولكن هناك بعض الملفات التي نريد Git أن يتجاهلها. نحن نقوم بهذا عبر انشاء ملف يسمى `.gitignore` في الدليل الرئيسي. افتح المحرر الخاص بك وقم بإنشاء ملف جديد مع محتويات التالية:

{% filename %}.gitignore{% endfilename %}

    # Python
    *.pyc
    *~
    __pycache__
    
    # Env
    .env
    myvenv/
    venv/
    
    # Database
    db.sqlite3
    
    # Static folder at project root
    /static/
    
    # macOS
    ._*
    .DS_Store
    .fseventsd
    .Spotlight-V100
    
    # Windows
    Thumbs.db*
    ehthumbs*.db
    [Dd]esktop.ini
    $RECYCLE.BIN/
    
    # Visual Studio
    .vscode/
    .history/
    *.code-workspace
    

واحفظه ك `.gitignore` في مجلد "djangogirls".

> **ملاحظة** النقطه في بداية اسم الملف مهمه! إذا كنت تواجه أي صعوبة في انشائه (على سبيل المثال ،أجهزة ماكينتوش لا تمكنك من إنشاء الملفات التي تبدأ بنقطة عن طريق الباحث)، إذا قم باستخدام ميزة "حفظ باسم" في المحرر الخاص بك. تأكد من عدم إضافة `.txt`، `py` أو أي امتداد اخر إلى اسم الملف -- سوف يتعرف عليها Git اذا كان الاسم فقط `.gitignore`. Linux and MacOS treat files with a name that starts with `.` (such as `.gitignore`) as hidden and the normal `ls` command won't show these files. Instead use `ls -a` to see the `.gitignore` file.
> 
> **ملاحظة** أحد الملفات التي قمت بتحديدها في ملف `.gitignore` هي `db.sqlite3`. هذا الملف هو قاعدة البيانات المحلية الخاصة بك، حيث يتم تخزين جميع المستخدمين والوظائف الخاصة بك. سوف نتابع الممارسات الموحدة في برمجة الويب، بمعنى أنه سوف نستخدم قواعد بيانات منفصلة لموقع الاختبار المحلي الخاص بك وموقع الويب الخاص بك مباشرة في PythonAnywhere. قاعدة بيانات PythonAnywhere يمكن أن تكون SQLite، مثل الة التطوير خاصتك، ولكن عادة ما تستخدم واحدة تدعى MySQL والتي يمكنها التعامل مع عدد زوار أكبر بكثير من SQLite. وفي كلتا الحالتين، بتجاهل قاعدة بيانات SQLite لنسخة GitHub، يعني أن جميع المشاركات التي قمت بإنشائها حتى الآن ستكون متاحة محلياً فقط، وسيكون عليك إنشاء مشاركات جديدة عند الإنتاج. ينبغي أن تفكر في قاعدة البيانات المحلية الخاصة بك كملعب جيد حيث يمكنك اختبار أشياء مختلفة وولا تخف من فكرة انك ستحدف مشاركاتك الحقيقية من المدونة.

انها فكرة جيدة استخدام الأمر `git status` قبل `git add` أو كلما وجدت نفسك غير متأكد من ما تغير. وهذا سيساعد على منع أي مفاجآت من الحدوث، مثل إضافة ملفات خاطئة. الأمر `git status` يرجع المعلومات عن اي ملف لم يتم اتباعه تعديله او تنظيمه, حالة الفرع، وأكثر من ذلك بكثير. يجب أن يكون المخرج مشابه لما يلي:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    No commits yet
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

وأخيرا نحفظ التغييرات التي قمنا بها, اذهب الى لوحة التحكم الخاصة بك وأدخل هذه الأوامر:

{% filename %}command-line{% endfilename %}

    $ git add .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## ارسال برنامجك الى GitHub

زر [GitHub.com](https://www.github.com) وسجل حساب مستخدم جديد مجاني. (لو فعلت هذا مسبقاً في التحضير للورشة، هذا شيء عظيم!) تأكد من حفظ كلمة السر (أضفها إلى مدير كلمات السر الخاص بك اذا كنت تستخدم احدهم).

بعدها أنشئ مستودع جديد. واعطه اسم "my-first-blog". اترك خانة "initialize with a README" دون اختيارها واترك الخيار.gitignore فارغ (لقد فعلنا ذلك يدوياً) وأترك الترخيص على أنه لا شيء.

![](images/new_github_repo.png)

> ** * * ملاحظة * * اسم 'my-first-blog' مهم – يمكن أن تختار شيئا آخر، لكن هذا سيأخد الكثير من الوقت في الإرشادات الموجودة أدناه، وسيكون عليك استبداله كل مرة. ربما من الأسهل الإبقاء على اسم 'my-first-blog'.</p> </blockquote> 
> 
> في الشاشة التالية، سوف يظهر لك URL استنساخ الريبو الخاص بك، الذي سيتم استخدامه في بعض الأوامر التالية:
> 
> ![](images/github_get_repo_url_screenshot.png)
> 
> الآن نحن بحاجة إلى ربط مستودع Git على جهاز الكمبيوتر الخاص بك مع المستودع الذي أنشأته على GitHub.
> 
> اكتب الأمر التالي في وحدة التحكم الخاصة بك (استبدل `<your-github-username>` مع اسم المستخدم الذي قمت بإدخاله عند إنشاء حساب GitHub الخاص بك، ولكن دون أقواس -- هذا الURL يجب أن يشابه الURL المنسوخ الذي رأيته قبل قليل):
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
>     $ git push -u origin master
>     
> 
> عند الرفع إلى GitHub، سيطلب منك GitHub اسم المستخدم وكلمة المرور (أما في نافذة سطر الأوامر أو في نافذة منبثقة)، وبعد إدخال بيانات الاعتماد يجب أن ترى شيئا مثل هذا:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Counting objects: 6, done.
>     Writing objects: 100% (6/6), 200 bytes | 0 bytes/s, done.
>     Total 3 (delta 0), reused 0 (delta 0)
>     To https://github.com/ola/my-first-blog.git
>     
>      * [new branch]      master -> master
>     Branch master set up to track remote branch master from origin.
>     
> 
> <!--TODO: maybe do ssh keys installs in install party, and point ppl who dont have it to an extension -->
> 
> برنامجك الان في GitHub. اذهب وتحقق من ذلك! ستجد في النهاية – \[Django\] (https://github. com/django/django) وفي \[Django Girls Tutorial\] (https://github. com/DjangoGirls/tutorial)، والعديد من مشاريع البرمجيات الكبيرة مفتوحة المصدر تستضيف برامجها الخاصة في GitHub. :)
> 
> # اعداد مدونتنا على PythonAnywhere
> 
> ## انشئ حساب على PythonAnywhere
> 
> > * * ملاحظة * * قد تكون انشأت حساب ب PythonAnywhere في وقت سابق أثناء خطوات التثبيت – إذا كان الأمر كذلك، لا حاجة للقيام بذلك مرة أخرى.
> 
> {% include "/deploy/signup_pythonanywhere.md" %}
> 
> ## اعداد موقع على PythonAnywhere
> 
> عد الى لوحة التحكم بالنقر على شعار الموقع, وحدد خيار بدئ الطرفية (bash-console) هي نسخة الموقع من الطرفية تماما كتلك اللتي لديك بجهازك.
> 
> ![جزء ""وحدة التحكم الجديدة" على موقع PythonAnywhere، مع زر "bash"](images/pythonanywhere_bash_console.png)
> 
> > **ملاحظة** PythonAnywhere يعتمد ومبني على اللينكس. لذا ان كنت على ويندوز فالطرفية ستظهر مختلفة قليلا.
> 
> نشر تطبيق ويب على PythonAnywhere يتضمن سحب التطبيق من GitHub ومن ثم اعداد PythonAnywhere للتعرف عليه وبدء العمل به كتطبيق ويب. هناك طرق يدوية للقيام بذلك, لكن PythonAnywhere يوفر أدوات تقوم بالمهمة عنك. أولا لنثبت لنثبته:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pip3.8 install --user pythonanywhere
>     
> 
> يجب أنت ترى بعض الملاحظات ك`Collecting pythonanywhere` و تنتهي بالعبارة `Successfully installed (...) pythonanywhere- (...)`.
> 
> الان نستخدم الادات المساعدة, لإعداد التطبيق مباشرة من GitHub و بشكل ألي. اكتب الأمر التالي في وحدة التحكم على PythonAnywhere(لا تنسى أن استخدام اسم المستخدم الخاص بك في GitHub بدلاً من `<your-github-username>`، حتى يتشابه الURL بالURL المنسوخ من Github):
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pa_autoconfigure_django.py --python=3.8 https://github.com/<your-github-username>/my-first-blog.git
>     
> 
> بينما تشاهد ذلك يعمل، سوف يمكنك رؤية ماذا يفعل:
> 
> - تحميل الكود خاصتك من Github
> - إنشاء virtualenv على PythonAnywhere، تماما مثل الذي على جاهز الكمبيوتر خاصتك
> - تحديث ملف الإعدادات مع بعض إعدادات النشر
> - إعداد قاعدة بيانات على PythonAnywhere باستخدام الأمر `manage.py migrate`
> - إعداد الملفات الثابتة (سوف نتعلم عن هذه في وقت لاحق)
> - وتهيئة PythonAnywhere لخدمة التطبيق الويب الخاص بك عبر API،
> 
> في PythonAnywhere جميع تلك الخطوات أتوماتيكية، بل أنهم نفس الخطوات التي عليك أن تذهب من خلالها مع أي موفر خدمة آخر.
> 
> الشيء الرئيسي الذي يجب ملاحظته الآن هو أن قاعدة البيانات الخاصة بك في PythonAnywhere في الواقع منفصلة تماما من قاعدة البيانات على جهاز الكمبيوتر الخاص بك، حتى تتمكن من أن يكون لها وظائف وحسابات المسؤول(admin) مختلفين. نتيجة لذلك، تماما كما فعلت على جهاز الكمبيوتر خاصتك، علينا بدأ حساب المسؤول(admin) ب `createsuperuser`. قام PythonAnywhere بتفعيل Virtualenv خاصتك أتوماتيكيا، لذلك كل ما تحتاج لفعله هو تشغيل:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     (ola.pythonanywhere.com) $ python manage.py createsuperuser
>     
> 
> اكتب التفاصيل للمستخدم المسؤول(admin) الخاص بك. أفضل الطرق لاستخدام نفس الذي تستخدمه على الكمبيوتر الخاص بك لتجنب أي التباس، إلا إذا كنت تريد أن تجعل كلمة المرور على PythonAnywhere أكثر أمنا.
> 
> الان، اذا أردت، يمكنك النظر إلى الكود خاصتك على PythonAnywhere باستخدام `ls`:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     ola.pythonanywhere.com) $ ls)
>     blog  db.sqlite3  manage.py  mysite requirements.txt static
>     ola.pythonanywhere.com) $ ls /blog)
>     __init__.py  __pycache__  admin.py  apps.py  migrations  models.pytests.py  static
>     templates  views.py
>     
> 
> يمكنك أيضا الذهاب إلى صفحة "ملف" وتصفح حولها باستخدام متصفح الملفات المبني في PythonAnywhere. (من صفحة وحدة التحكم، يمكنك الحصول على صفحات أخرى في PythonAnywhere من زر القائمة في الزاوية العلوية اليمنى. وعند تواجدك في إحدى الصفحات، هناك روابط لبعضها الآخر بالقرب من الأعلى.)
> 
> ## أنت على الهواء الأن!
> 
> Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" page to get a link to it. You can share this with anyone you want. :)
> 
> > **ملاحظة** هذا برنامج تعليمي للمبتدئين، وفي نشر هذا الموقع لقد اتخذنا بعض التجاوزات التي لم تكن مثالية من وجهة نظر أمنية. إذا قررت البناء على هذا المشروع، أو البدء في مشروع جديد، يجب عليك مراجعة [Django deployment checklist](https://docs.djangoproject.com/en/2.2/howto/deployment/checklist/) للحصول على بعض النصائح حول رفع مستوى أمان موقعك.
> 
> ## نصائح لتصحيح الأخطاء
> 
> إذا كنت ترى خطأ أثناء تشغيل البرنامج النصي `pa_autoconfigure_django.py`، فيما يلي بعض الأسباب الشائعة:
> 
> - نسيان إنشاء رمز API الخاص بPythonAnywhere.
> - إرتكاب خطأ في عنوان Github URL الخاص بك
> - إذا كنت ترى خطأ يقول *"تعذر العثور على settings.py الخاص بك"*، على الأرجح لأنك لم تتمكن من إضافة كافة الملفات الخاصة بك إلى Git، و/أو لم ترفعهم إلى GitHub بنجاح. ألقي نظرة أخرى على قسم Git أعلاه
> - إذا كنت مسجل سابقاً في PythonAnywhere وحصلت لك مشكلة في collectstatic، فغالباً لديك في حسابك نسخة أقدم من SQLite (مثل 3.8.2). في هذه الحالة، سجل في حساب جديد وجرب الأوامر البرمجية الموجودة في قسم PythonAnywhere في الأعلى.
> 
> إذا كنت ترى خطأ عند محاولة زيارة موقع الويب الخاص بك، المكان الأول للبحث عن بعض معلومات التصحيح هو **سجل الأخطاء** الخاص بك. ستجد رابط لهذا في PythonAnywhere [صفحة "الويب"](https://www.pythonanywhere.com/web_app_setup/). إذا كان هناك أية رسائل أخطاء هناك؛ أحدثها يوجد في الأسفل.
> 
> وهناك أيضا بعض [نصائح عامة لتصحيح الأخطاء في موقع المساعدة لPythonAnywhere](http://help.pythonanywhere.com/pages/DebuggingImportError).
> 
> وتذكر أن المدرب هنا للمساعدة!
> 
> # تحقق من موقع الويب الخاص بك!
> 
> الصفحة الرئيسية لموقعك يجب ان تقول "لقد نجح!" تماما كما تقول على حاسوبك الخاص. حاول إضافة `/admin/` إلى نهاية عنوان URL، وسوف يتم نقلك إلى موقع المشرف. قم بتسجيل الدخول باستخدام اسم المستخدم وكلمة المرور، وسترى أنه يمكنك إضافة وظائف جديدة على الخادم -- تذكر، مشاركاتك من قاعدة البيانات المحلية الخاصة بك لم يتم إرسالها إلى مدونتك المباشرة.
> 
> وبمجرد الانتهاء من إنشاء عدد قليل من المشاركات، يمكنك العودة إلى الإعداد المحلي الخاص بك (ليس PythonAnywhere). من هنا يجب أن تعمل على الإعدادات المحلية خاصتك لإجراء التغييرات. هذا سير عمل مشترك في تطيور المواقع -- قم بالتغييرات محلياً، ارفع تلك التغييرات إلى GitHub، وارسل هذه التغييرات إلى خادم الويب المباشر خاصتك. هذا يسمح لك بالعمل والتجربة دون تخريب موقع الويب الخاص بك. رائع! اليس كذالك؟
> 
> إعطي نفسك تربيت *كبير* على الظهر! عمليات نشر الخوادم واحدة من أصعب أجزاء تطوير المواقع، وكثيراً ما يأخذ الناس عدة أيام قبل أن تتمكن من فعلها. ولكنك قد نشرت موقعك الخاص على شبكة الانترنت!