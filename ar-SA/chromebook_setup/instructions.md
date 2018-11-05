يمكنك [تخطي هذا القسم ](http://tutorial.djangogirls.org/en/installation/#install-python) إذا كنت لا تستخدم كروم بوك. إذا كنت كذالك، تجربة التثبيت الخاص بك سوف تكون مختلفة قليلاً. يمكنك تجاهل بقية إرشادات التثبيت.

### Cloud IDE (PaizaCloud Cloud IDE, AWS Cloud9)

Cloud IDE هو أداة توفر لك محرر للشفرة البرمجية والوصول إلى جهاز كمبيوتر يعمل على شبكة الإنترنت حيث يمكنك تثبيت، وكتابة، وتشغيل البرامج. خلال مدة البرنامج التعليمي،Cloud IDE سيكون بمثابة *الجهاز المحلي* الخاص بك. سوف تقوم بتنفيذ الأوامر في الواجهة الطرفية مثل زملائك على OS X, Ubuntu, أو Windows, لكن محطتك الطرفية ستكون متصلة بجهاز كومبيوتر يعمل في مكان اخر تقوم Cloud IDE بإعداده لك. Here is the instructions for cloud IDEs (PaizaCloud Cloud IDE, AWS Cloud9). يمكنك اختيار إحدى بيئات التطوير المتكاملة الخاصة ب Cloud, واتبع تعليمات بيئة التطوير المتكاملة Cloud.

#### PaizaCloud Cloud IDE

1. Go to [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. إنشاء حساب جديد
3. اضغط *خادم جديد *
4. اضغط زر الواجهة الطرفية (على الجانب الأيسر من النافذة)

الآن سترى واجهة مع الشريط جانبي، أزرار على اليسار. انقر فوق زر "المحطة الطرفية" لفتح إطار المحطة الطرفية مع موجه مثل هذا:

{% filename %}المحطة الطرفية{% endfilename %}

    $
    

المحطة الطرفية في IDE سحابة بايزاكلاود مستعدة للتعليمات الخاصة بك. يمكنك تغيير حجم أو تكبير هذا الإطار لجعله أكبر قليلاً.

#### AWS Cloud9

1. Go to [AWS Cloud9](https://aws.amazon.com/cloud9/)
2. إنشاء حساب جديد
3. Click *Create Environment*

Now you should see an interface with a sidebar, a big main window with some text, and a small window at the bottom that looks something like this:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

This bottom area is your *terminal*, where you will give the computer Cloud 9 has prepared for your instructions. You can resize that window to make it a bit bigger.

### البيئة الافتراضية

A virtual environment (also called a virtualenv) is like a private box we can stuff useful computer code into for a project we're working on. We use them to keep the various bits of code we want for our various projects separate so things don't get mixed up between projects.

In your terminal at the bottom of the Cloud 9 interface, run the following:

{% filename %}Cloud 9{% endfilename %}

    sudo apt update
    sudo apt install python3.6-venv
    

If this still doesn't work, ask your coach for some help.

Next, run:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3.6 -mvenv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(note that on the last line we use a tilde followed by an equal sign: ~=).

### GitHub

Make a [GitHub](https://github.com) account.

### بايثون في كل مكان

The Django Girls tutorial includes a section on what is called Deployment, which is the process of taking the code that powers your new web application and moving it to a publicly accessible computer (called a server) so other people can see your work.

This part is a little odd when doing the tutorial on a Chromebook since we're already using a computer that is on the Internet (as opposed to, say, a laptop). However, it's still useful, as we can think of our Cloud 9 workspace as a place for our "in progress" work and Python Anywhere as a place to show off our stuff as it becomes more complete.

Thus, sign up for a new Python Anywhere account at [www.pythonanywhere.com](https://www.pythonanywhere.com).