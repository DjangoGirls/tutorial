يمكنك [تخطي هذا القسم ](http://tutorial.djangogirls.org/en/installation/#install-python) إذا كنت لا تستخدم كروم بوك. إذا كنت كذلك، تجربة التثبيت الخاص بك سوف تكون مختلفة قليلاً. يمكنك تجاهل بقية إرشادات التثبيت.

### بيئة التطوير المتكاملة IDE السحابية ( PaizaCloud Cloud IDE, AWS Cloud9)

بيئة التطوير المتكاملة IDE السحابية هي أداة توفر لك محرر للشفرة البرمجية والوصول إلى جهاز كمبيوتر يعمل على شبكة الإنترنت حيث يمكنك تثبيت، وكتابة، وتشغيل البرامج. خلال مدة البرنامج التعليمي،بيئة التطوير المتكاملة IDE السحابية ستكون بمثابة *الجهاز المحلي* الخاص بك. سوف تقوم بتنفيذ الأوامر في الواجهة الطرفية مثل زملائك على OS X, Ubuntu, أو Windows, لكن محطتك الطرفية ستكون متصلة بجهاز كومبيوتر يعمل في مكان اخر تقوم بيئة التطوير المتكاملة IDE السحابية بإعداده لك. وإليك الإرشادات الخاصة ببيئات التطوير المتكاملة IDE السحابية (PaizaCloud Cloud IDE, AWS Cloud9). يمكنك اختيار إحدى بيئات التطوير المتكاملة الخاصة ب Cloud, واتبع تعليمات بيئة التطوير المتكاملة Cloud.

#### بيئة التطوير المتكاملة IDE الخاصة ب Cloud PaizaCloud

1. اذهب إلى بيئة التطوير المتكاملة IDE [PaizaCloud](https://paiza.cloud/)
2. إنشاء حساب جديد
3. Click *New Server* and choose the Django app
4. اضغط زر الواجهة الطرفية (على الجانب الأيسر من النافذة)

الآن سترى واجهة مع الشريط جانبي، أزرار على اليسار. انقر فوق زر "المحطة الطرفية" لفتح إطار المحطة الطرفية مع موجه مثل هذا:

{% filename %}المحطة الطرفية{% endfilename %}

    $
    

المحطة الطرفية في IDE سحابة بايزاكلاود مستعدة للتعليمات الخاصة بك. يمكنك تغيير حجم أو تكبير هذا الإطار لجعله أكبر قليلاً.

#### AWS Cloud9

Currently Cloud 9 requires you to sign up with AWS and enter credit card information.

1. ثبت Cloud 9 من [ متجر كروم](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. إذهب الى [c9.io](https://c9.io) واضغط على *ابدأ مع AWS Cloud9*
3. Sign up for an AWS account (requires credit card information, but you can use it for free)
4. In the AWS Dashboard, enter *Cloud9* in the search bar and click it
5. In the Cloud 9 dashboard, click *Create environment*
6. Name it *django-girls*
7. While configuring settings, select *Create a new instance for environment (EC2)* for "Environment Type" and the *t2.micro* "Instance type" (it should say "Free-tier eligible."). The default cost-saving setting is fine and you can keep the other defaults.
8. Click *Next step*
9. Click *Create environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your terminal. You can use the terminal to send instructions to the remote Cloud 9 computer. You can resize that window to make it a bit bigger.

### البيئة الافتراضية

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

Run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: `~=`).

### GitHub

Make a [GitHub](https://github.com) account.

### بايثون في كل مكان

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).