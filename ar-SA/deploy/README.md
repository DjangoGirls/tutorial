# نشر!

> **ملاحظه** الفصل التالي قد يكون في بعض الأحيان صعبا. استمر و أعزم على الانتهاء منه؛ الإعداد جزء هام من عملية تطوير موقع شبكة الإنترنت. ويوضع هذا الفصل في منتصف البرنامج التعليمي حتى يمكن لمدربك أن يساعدك في العمليات الأصعب قليلاً لنشر موقع الويب الخاص بك على الإنترنت. وهذا يعني أنه لا يزال يمكنك الانتهاء من البرنامج التعليمي الخاص بك بمفردك إذا نفذ الوقت منك.

حتى الأن موقعك كان متاحا فقط على حاسوبك. الأن سوف تتعلم كيف تنشره! النشر هو عملية اتاحة التطبيق الخاص بك على شبكة الإنترنت حيث يمكن للناس الذهاب إلى التطبيق الخاص بك و مشاهدته. :)

كما تعلمت، موقع على شبكة الإنترنت يجب أن يتواجد في خادم. هناك الكثير من مقدمي الخدمة متاحين على شبكة الإنترنت، ونحن سنستخدم [PythonAnywhere](https://www.pythonanywhere.com/). PythonAnywhere متوفر مجانا للتطبيقات الصغيرة التي لا تحتوي على عدد كبير من الزائرين فالآن بالتأكيد ستكون كافية بالنسبة لك.

الخدمات الخارجية الأخرى ستقوم باستخدام [GitHub](https://www.github.com)، وهي خدمة استضافة التعليمات البرمجية. هناك آخرون ، ولكن تقريبا جميع المبرمجين لديهم حساب GitHub في هذه الأيام، والآن أنت سوف يمكنك أيضا الحصول على حساب!

سوف تكون هذه الأماكن الثلاثة هامة بالنسبة لك. الكمبيوتر الخاص بك سوف يكون المكان حيث يمكنك القيام بالتطوير والإختبار. عندما تكون راضيا عن التغييرات، ستقوم بوضع نسخة من التعليمات البرمجية على GitHub. موقعك سيكون على بايثون في كل مكان ، وستقوم بتحديثه عبر استقدام نسخة جديدة من GitHub.

# جيت (Git)

> **ملاحظة** إذا كنت قمت بإجراء خطوات التثبيت سابقا، لا تحتاج للقيام بذلك مرة أخرى -يمكنك التخطي إلى الجزء التالي والبدء في إنشاء مستودع Git الخاص بك.

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

    * .pyc * ~
     __pycache__ 
    myvenv db.sqlite3 / static .DS_Store
    

واحفظه ك `.gitignore` في مجلد "djangogirls".

> **ملاحظة** النقطه في بداية اسم الملف مهمه! إذا كنت تواجه أي صعوبة في انشائه (على سبيل المثال ،أجهزة ماكينتوش لا تمكنك من إنشاء الملفات التي تبدأ بنقطة عن طريق الباحث)، إذا قم باستخدام ميزة "حفظ باسم" في المحرر الخاص بك.
> 
> **ملاحظة** أحد الملفات التي قمت بتحديدها في ملف `.gitignore` هي `db.sqlite3`. هذا الملف هو قاعدة البيانات المحلية الخاصة بك، حيث يتم تخزين جميع المشاركات الخاصة بك. لا نريد اضافة هذا الى المستودع الخاص بك ، لأن موقعك على بايثون في كل مكان سيكون يستخدم قاعدة بيانات مختلفة. قاعدة البيانات تلك يمكن ان تكون SQLite, مثل جهاز التطوير الخاص بك ، لكن في العادة ستستخدم واحدة تسمى MySQL, والتي يمكنها التعامل مع الكثير من الزوار اكثر من SQLite. وفي كلتا الحالتين، بتجاهل قاعدة بيانات SQLite للنسخة GitHub، يعني أن جميع المشاركات التي قمت بإنشائها حتى الآن ستبقى و تكون متاحة محلياً، ولكن سيكون عليك اضافتهم مرة اخرى للإنتاج. ينبغي أن تفكر في قاعدة البيانات المحلية الخاصة بك كملعب جيد حيث يمكنك اختبار أشياء مختلفة وولا تخف من فكرة انك ستحدف مشاركاتك الحقيقية من المدونة.

انها فكرة جيدة استخدام الأمر `git status` قبل `git add` أو كلما وجدت نفسك غير متأكد من ما تغير. وهذا سيساعد على منع أي مفاجآت من الحدوث، مثل إضافة ملفات خاطئة. الأمر `git status` يرجع المعلومات عن اي ملف لم يتم اتباعه تعديله او تنظيمه, حالة الفرع، وأكثر من ذلك بكثير. يجب أن يكون المخرج مشابه لما يلي:

{% filename %}command-line{% endfilename %}

    $ git status
    On branch master
    
    Initial commit
    
    Untracked files:
      (use "git add <file>..." to include in what will be committed)
    
            .gitignore
            blog/
            manage.py
            mysite/
            requirements.txt
    
    nothing added to commit but untracked files present (use "git add" to track)
    

وأخيرا نحفض التغييرات التي قمنا بها, اذهب الى لوحة التحكم الخاصة بك وشغل هذه الأوامر:

{% filename %}command-line{% endfilename %}

    $ git add --all .
    $ git commit -m "My Django Girls app, first commit"
     [...]
     13 files changed, 200 insertions(+)
     create mode 100644 .gitignore
     [...]
     create mode 100644 mysite/wsgi.py
    

## ارسال برنامجك الى GitHub

إذهب إلى [GitHub.com](https://www.github.com) و أنشئ حساب بالموقع, إن كان لديك حساب مسبقا ذلك يفي بالغرض

بعدها أنشئ مستودع جديد. واعطه اسم "my-first-blog". اترك خانة "initialize with a README" دون اختيارها واترك الخيار.gitignore فارغ (لقد فعلنا ذلك يدوياً) وأترك الترخيص على أنه لا شيء.

![](images/new_github_repo.png)

> ** * * ملاحظة * * اسم 'my-first-blog' مهم – يمكن أن تختار شيئا آخر، لكن هذا سيأخد الكثير من الوقت في الإرشادات الموجودة أدناه، وسيكون عليك استبداله كل مرة. ربما من الأسهل الإبقاء على اسم 'my-first-blog'.</p> </blockquote> 
> 
> في الشاشة التالية، سوف يظهر لك رابط استنساخ المستودع الخاص بك. اختر نسخة "HTTPS"،ثم قم بنسخ الرابط سنحتاجه بعد قليل:
> 
> ![](images/github_get_repo_url_screenshot.png)
> 
> الآن نحن بحاجة إلى ربط مستودع Git على جهاز الكمبيوتر الخاص بك مع المستودع الذي أنشأته على GitHub.
> 
> اكتب الأمر التالي في وحدة التحكم الخاصة بك (استبدل '&lt; your-github-username&gt;' مع اسم المستخدم الذي قمت بإدخاله عند إنشاء حساب GitHub الخاص بك، ولكن دون أقواس):{% filename %} command-line{% endfilename %}:
> 
> {% filename %}command-line{% endfilename %}
> 
>     $ git remote add origin https://github.com/<your-github-username>/my-first-blog.git
>     $ git push -u origin master
>     
> 
> أدخل اسم المستخدم في GitHub الخاص بك وكلمة المرور، ويجب أن ترى شيئا من هذا القبيل:
> 
> {% filename %}command-line{% endfilename %}
> 
>     Username for 'https://github.com': ola
>     Password for 'https://ola@github.com':
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
> ![The 'New Console' section on the PythonAnywhere web interface, with a button for 'bash'](images/pythonanywhere_bash_console.png)
> 
> > **ملاحظة** PythonAnywhere يعتمد ومبني على اللينكس. لذا ان كنت على ويندوز فالطرفية ستظهر مختلفة قليلا.
> 
> نشر تطبيق ويب على PythonAnywhere يتضمن سحب التطبيق من GitHub ومن ثم اعداد PythonAnywhere للتعرف عليه وبدء العمل به كتطبيق ويب. هناك طرق يدوية للقيام بذلك, لكن PythonAnywhere يوفر أدوات تقوم بالمهمة عنك. أولا لنثبت لنثبته:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pip3.6 install --user pythonanywhere
>     
> 
> يجب أنت ترى بعض الملاحظات ك`Collecting pythonanywhere` و تنتهي بالعبارة `Successfully installed (...) pythonanywhere- (...)`.
> 
> الان نستخدم الادات المساعدة, لإعداد التطبيق مباشرة من GitHub و بشكل ألي. Type the following into the console on PythonAnywhere (don't forget to use your GitHub username in place of `<your-github-username>`):
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     $ pa_autoconfigure_django.py https://github.com/<your-github-username>/my-first-blog.git
>     
> 
> As you watch that running, you'll be able to see what it's doing:
> 
> - Downloading your code from GitHub
> - Creating a virtualenv on PythonAnywhere, just like the one on your own PC
> - Updating your settings file with some deployment settings
> - Setting up a database on PythonAnywhere using the `manage.py migrate` command
> - Setting up your static files (we'll learn about these later)
> - And configuring PythonAnywhere to serve your web app via its API
> 
> On PythonAnywhere all those steps are automated, but they're the same steps you would have to go through with any other server provider. The main thing to notice right now is that your database on PythonAnywhere is actually totally separate from your database on your own PC—that means it can have different posts and admin accounts.
> 
> As a result, just as we did on your own computer, we need to initialize the admin account with `createsuperuser`. PythonAnywhere has automatically activated your virtualenv for you, so all you need to do is run:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     (ola.pythonanywhere.com) $ python manage.py createsuperuser
>     
> 
> Type in the details for your admin user. Best to use the same ones as you're using on your own computer to avoid any confusion, unless you want to make the password on PythonAnywhere more secure.
> 
> Now, if you like, you can also take a look at your code on PythonAnywhere using `ls`:
> 
> {% filename %}PythonAnywhere command-line{% endfilename %}
> 
>     (ola.pythonanywhere.com) $ ls
>     blog  db.sqlite3  manage.py  mysite requirements.txt static
>     (ola.pythonanywhere.com) $ ls blog/
>     __init__.py  __pycache__  admin.py  forms.py  migrations  models.py  static
>     templates  tests.py  urls.py  views.py
>     
> 
> You can also go to the "Files" tab and navigate around using PythonAnywhere's built-in file browser.
> 
> ## You are now live!
> 
> Your site should now be live on the public Internet! Click through to the PythonAnywhere "Web" tab to get a link to it. You can share this with anyone you want :)
> 
> > **Note** This is a beginners' tutorial, and in deploying this site we've taken a few shortcuts which aren't ideal from a security point of view. If and when you decide to build on this project, or start a new project, you should review the [Django deployment checklist](https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/) for some tips on securing your site.
> 
> ## Debugging tips
> 
> If you see an error while running the `pa_autoconfigure_django.py` script, here are a few common causes:
> 
> - Forgetting to create your PythonAnywhere API token.
> - Making a mistake in your GitHub URL
> - If you see an error saying *"Could not find your settings.py"*, it's probably because you didn't manage to add all your files to Git, and/or you didn't push them up to GitHub successfully. Have another look at the Git section above
> 
> If you see an error when you try to visit your site, the first place to look for some debugging info is in your **error log**. You'll find a link to this on the PythonAnywhere [Web tab](https://www.pythonanywhere.com/web_app_setup/). See if there are any error messages in there; the most recent ones are at the bottom.
> 
> There are also some [general debugging tips on the PythonAnywhere help site](http://help.pythonanywhere.com/pages/DebuggingImportError).
> 
> And remember, your coach is here to help!
> 
> # Check out your site!
> 
> The default page for your site should say "It worked!", just like it does on your local computer. Try adding `/admin/` to the end of the URL, and you'll be taken to the admin site. Log in with the username and password, and you'll see you can add new Posts on the server.
> 
> Once you have a few posts created, you can go back to your local setup (not PythonAnywhere). From here you should work on your local setup to make changes. This is a common workflow in web development – make changes locally, push those changes to GitHub, and pull your changes down to your live Web server. This allows you to work and experiment without breaking your live Web site. Pretty cool, huh?
> 
> Give yourself a *HUGE* pat on the back! Server deployments are one of the trickiest parts of web development and it often takes people several days before they get them working. But you've got your site live, on the real Internet, just like that!