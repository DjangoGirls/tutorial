# مشروعك الأول في دجانغو!

> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots).
> 
> جزء من هذا القسم يستند [django-marcador tutorial](http://django-marcador.keimlink.de/) المرخص لها بمرخصة بموجب المشاع الإبداعي   إسناد-على غرار 4.0 الترخيص الدولي. البرنامج التعليمي django-marcador حقوق الطبع والنشر من قبل Markus Zapke-Gründemann وآخرون.

سنقوم بإنشاء مدونة صغيرة!

الخطوة الأولى هي إنشاء مشروع جانغو جديد. في الأساس، وهذا يعني أننا سوف نشغل بعض البرامج النصية التي تقدمها جانغو والتي من شأنها أن تخلق الهيكل العظمي لمشروع دجانغو بالنسبة لنا. هذه مجرد حفنة من الدلائل والملفات التي سوف نستخدمها في وقت لاحق.

أسماء بعض الملفات والدلائل مهمة جداً لجانغو. يجب عدم إعادة تسمية الملفات التي نحن على وشك إنشائها. نقلهم إلى مكان مختلف ليست فكرة جيدة. جانغو تحتاج إلى الحفاظ على بنية معينة لتكون قادرة على العثور على أشياء مهمة.

> تذكر أن تقوم بتشغيل كل شيء في virtualenv. إذا كنت لا ترى بادئة `(myvenv)` في وحدة التحكم الخاصة بك، تحتاج إلى تنشيط virtualenv الخاص بك. قمنا بشرح طريقة فعل ذالك في **Django installation** في قسم **Working with virtualenv**. كتابة `myvenv\Scripts\activate` في وندوز ، او `source myvenv/bin/activate` في ماك ولينكس سيقوم لك بذالك.

<!--sec data-title="Create project: OS X or Linux" data-id="django_start_project_OSX_Linux" data-collapse=true ces-->

في وحدة التحكم الخاصة بك ماكنتوش أو لينكس، يجب أن تقوم بتشغيل الأمر التالي. **Don't forget to add the period (or dot) `.` at the end!**

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ django-admin startproject mysite .
    

> الفاصلة `.` أمر بالغ الأهمية لأنه يخبر السكريبت لتثبيت دجانغو في الدليل الحالي الخاص بك (`.` الفاصلة هي إشارة قصيرة).
> 
> **ملاحظة** عند كتابة الأمر أعلاه، تذكر أن تكتب فقط الجزء الذي يبدأ ب `django-admin`. الجزء `(myvenv) ~/djangogirls$` الموضح هنا هو مجرد مثال من الموجه الذي سيدعو المدخلات الخاصة بك على سطر الأوامر الخاص بك.

<!--endsec-->

<!--sec data-title="Create project: Windows" data-id="django_start_project_windows" data-collapse=true ces-->

في وحدة التحكم الخاصة بوندوز، يجب أن تقوم بتشغيل الأمر التالي. **Don't forget to add the period (or dot) `.` at the end!**:

{% filename %}command-line{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> django-admin.exe startproject mysite .
    

> الفاصلة `.` أمر بالغ الأهمية لأنه يخبر السكريبت لتثبيت دجانغو في الدليل الحالي الخاص بك (`.` الفاصلة هي إشارة قصيرة).
> 
> **ملاحظة** عند كتابة الأمر أعلاه، تذكر أن تكتب فقط الجزء الذي يبدأ ب `django-admin.py`. الجزء (myvenv) C:\Users\Name\djangogirls>` الموضح هنا هو مجرد مثال من الموجه الذي سيدعو المدخلات الخاصة بك على سطر الأوامر الخاص بك.

<!--endsec-->

`django-admin.py` هو البرنامج النصي الذي سينشئ الدلائل والملفات بالنسبة لك. يجب أن يكون لديك الآن هيكل دليل يشبه هذا:

    djangogirls
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    

> **ملاحظة** في بنية الدليل، سترى أيضا `venv` الذي أنشأناه من قبل.

`manage.py` هو سكريبت يساعد في إدارة الموقع. مع أنه سوف نتمكن من (ضمن أمور أخرى) لبدء تشغيل خادم الويب على جهاز الكمبيوتر بدون تثبيت أي شيء آخر.

يحتوي الملف `settings.py` على إعدادات موقعك.

تذكر عندما تكلمنا عن ساعي البريد الذي يبحث اين يرمي الرسائل? `urls.py` ملف يحتوي على قائمة أنماط مستخدمة من قبل `urlresolver`.

دعونا نتجاهل الملفات الأخرى في الوقت الراهن فنحن لن نغييرها. الشيء الوحيد الذي يجب تذكره هو عدم حذفها عن طريق الصدفة!

## تغيير الإعدادات

دعونا نجري بعض التغييرات في `mysite/settings.py`. قم بفتح الملف باستخدام محرر التعليمات البرمجية يالذي قمنا بتثبيته في وقت سابق.

**ملاحظة**: ضع في اعتبارك أن `settings.py` هو ملف عادي، مثل أي ملف آخر. يمكنك فتحه من داخل محرر التعليمات البرمجية، وذلك باستخدام "ملف > فتح" قائمة الإجراأت. سيؤدي هذا بك إلى الحصول على النافذة المعتادة التي يمكنك فيها الانتقال إلى ملف `settings.py` وتحديده. بدلا من ذلك، يمكنك فتح الملف عن طريق الانتقال إلى مجلد djangogirls على سطح المكتب الخاص بك والنقر بزر الماوس الأيمن عليه. ثم، حدد محرر التعليمات البرمجية الخاصة بك من القائمة. اختيار المحرر مهم كما قد يكون لديك برامج أخرى مثبتة يمكنها فتح الملف ولكن لن تسمح لك بتحريره.

سيكون من الجميل أن يكون الوقت صحيح على موقعنا على الانترنت. اذهب الى [Wikipedia's list of time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) وانسخ الوقت في منطقتك الزمنية (TZ) (e.g. `Europe/Berlin`).

في `settings.py`، أعثر على السطر الذي يحتوي على `TIME_ZONE` وعدله لاختيار المنطقة الزمنية الخاصة بك. على سبيل المثال:

{% filename %}mysite/settings.py{% endfilename %}

```python
TIME_ZONE = 'Europe/Berlin'
```

A language code consist of the language, e.g. `en` for English or `de` for German, and the country code, e.g. `de` for Germany or `ch` for Switzerland. If English is not your native language, you can add this to change the default buttons and notifications from Django to be in your language. لذلك سيكون لديك زر "إلغاء" ترجم إلى اللغة التي حددتها هنا. [Django comes with a lot of prepared translations](https://docs.djangoproject.com/en/2.2/ref/settings/#language-code).

If you want a different language, change the language code by changing the following line:

{% filename %}mysite/settings.py{% endfilename %}

```python
LANGUAGE_CODE = 'de-ch'
```

سوف نحتاج أيضا إلى إضافة مسار للملفات الثابتة. ( سوف نعرف كل شيء عن الملفات الثابتة والمغلقة في وقت لاحق في البرنامج التعليمي). الانتقال إلى أسفل إلى *end* الملف، وتحت `STATIC_URL`، أضف وحدة جديدة تسمى `STATIC_ROOT`:

{% filename %}mysite/settings.py{% endfilename %}

```python
STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
```

عندما يكون `DEBUG` هو `True` و `ALLOWED_HOSTS</ 0> فارغ، يتم التحقق من المضيف مع <code>['localhost', '127.0.0.1', '[::1]']`. هذا لن يطابق اسم المضيف لدينا على PythonAnywhere بمجرد نشر التطبيق لدينا لذلك سوف نقوم بتغيير الإعداد التالي:

{% filename %}mysite/settings.py{% endfilename %}

```python
ALLOWED_HOSTS = ['127.0.0.1', '.pythonanywhere.com']
```

> **ملاحظة**: إذا كنت تستخدم Chromebook، أضف هذا السطر في الجزء السفلي من الملف settings.py: `MESSAGE_STORAGE = 'django.contrib.messages.storage.session.SessionStorage'`
> 
> Also add `.amazonaws.com` to the `ALLOWED_HOSTS` if you are using cloud9

## إعداد قاعدة البيانات

هناك الكثير من برامج قواعد البيانات المختلفة التي يمكنها تخزين البيانات لموقعك. سنستخدم الإعداد الافتراضي، `sqlite3`.

تم إعداد هذا بالفعل في هذا الجزء الخاص بك من الملف `mysite/settings.py`:

{% filename %}mysite/settings.py{% endfilename %}

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

لإنشاء قاعدة بيانات مدونتنا، دعونا تشغل الأمر التالي في وحدة التحكم: `python manage.py migrate`(نحن بحاجة إلى أن تكون في الدليل `djangogirls` الذي يحتوي على الملف `manage.py`. اذا مر كل شيء على ما يرام، سترى شيئا مثل هذا:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate
    Operations to perform:
      Apply all migrations: auth, admin, contenttypes, sessions
    Running migrations:
      Rendering model states... DONE
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying sessions.0001_initial... OK
    

ها قد انتهينا! حان الوقت لتشغيل خادم الويب ومعرفة ما إذا كان موقعنا يعمل!

## بدء تشغيل خادم الويب

يجب أن تكون في الدليل الذي يحتوي على ملف `manage.py`(دليل `djangogirls`). في وحدة التحكم، يمكننا أن نبدأ خادم الويب بتشغيل `python manage.py runserver`:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver
    

إذا كنت في كروم بوك، استخدم هذا الأمر بدلاً من ذلك:

{% filename %}Cloud 9{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0.0.0.0:8080
    

إذا كنت على ويندوز، و فشل هذا مع `UnicodeDecodeError`, ، استخدم هذا الأمر بدلاً من ذلك:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py runserver 0:8000
    

Now you need to check that your website is running. Open your browser (Firefox, Chrome, Safari, Internet Explorer or whatever you use) and enter this address:

{% filename %}browser{% endfilename %}

    http://127.0.0.1:8000/
    

If you're using a Chromebook and Cloud9, instead click the URL in the pop-up window that should have appeared in the upper right corner of the command window where the web server is running. The URL will look something like:

{% filename %}browser{% endfilename %}

    https://<a bunch of letters and numbers>.vfs.cloud9.us-west-2.amazonaws.com
    

تهانينا! قمت بإنشاء موقعك الأول وتشغيله باستخدام خادم الويب! أليس هذا رائع؟

![Install worked!](images/install_worked.png)

Note that a command window can only run one thing at a time, and the command window you opened earlier is running the web server. As long as the web server is running and waiting for additional incoming requests, the terminal will accept new text but will not execute new commands.

> لقد استعرضنا كيف تعمل خادمات الويب في الفصل **How the Internet works**.

To type additional commands while the web server is running, open a new terminal window and activate your virtualenv -- to review instructions on how to open a second terminal window, see [Introduction to the command line](../intro_to_command_line/README.md). لإيقاف خادم الويب، قم بالتبديل مرة أخرى إلى النافذة التي يتم تشغيلها واضغط على CTRL+C - مفاتيح التحكم و C معا (على ويندوز، قد تضطر إلى الضغط على Ctrl+Break).

أنت مستعد للخطوة التالية؟ لقد حان الوقت لإنشاء بعض المحتوى!