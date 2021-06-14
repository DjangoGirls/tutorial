يمكنك [تخطي هذا القسم ](http://tutorial.djangogirls.org/en/installation/#install-python) إذا كنت لا تستخدم كروم بوك. إذا كنت كذلك، تجربة التثبيت الخاص بك سوف تكون مختلفة قليلاً. يمكنك تجاهل بقية إرشادات التثبيت.

### بيئة التطوير المتكاملة السحابية (PaizaCloud Cloud IDE, AWS Cloud9)

بيئة التطوير المتكاملة السحابية هي أداة توفر لك تحرير الأكواد البرمجية والوصول إلى جهاز كمبيوتر يعمل على شبكة الإنترنت حيث يمكنك تثبيت، وكتابة، وتشغيل البرامج. خلال مدة البرنامج التعليمي، بيئة التطوير المتكاملة السحابية ستكون بمثابة *الجهاز المحلي* الخاص بك. سوف تقوم بتنفيذ الأوامر في موجه الأوامر مثل زملائك الذين يعملون على أنظمة OS X, Ubuntu, أو Windows, لكن موجه الأوامر في السحابة سيكون متصل بجهاز حاسوبي يعمل في مكان اخر تقوم بيئة التطوير المتكاملة السحابية بإعداده لك. وإليك الإرشادات الخاصة ببيئات التطوير المتكاملة السحابية (PaizaCloud Cloud IDE, AWS Cloud9). يمكنك اختيار إحدى بيئات التطوير المتكاملة السحابية، واتباع تعليمات بيئة التطوير المتكاملة السحابية.

#### بيئة التطوير المتكاملة السحابية PaizaCloud

1. الذهاب إلى [PaizaCloud Cloud IDE](https://paiza.cloud/)
2. إنشاء حساب جديد
3. إنشاء خادم بالضغط على *New Server* واختيار Django
4. الضغط على زر Terminal (على الجانب الأيسر من النافذة)

الآن سترى واجهة مع قائمة جانبية، وأزرار على اليسار. اضغطي زر "Terminal" لفتح نافذة موجه الأوامر مثل هذا:

{% filename %} Terminal{% endfilename %}

    $
    

موجه الأوامر في PaizaCloud IDE مستعد لأوامرك. يمكنك تغيير حجم النافذة أو تكبيرها لجعلها أكبر قليلاً.

#### AWS Cloud9

حالياً Cloud 9 تتطلب تسجيلك في AWS وإدخال معلومات بطاقتك البنكية.

1. ثبت Cloud 9 من [ متجر كروم](https://chrome.google.com/webstore/detail/cloud9/nbdmccoknlfggadpfkmcpnamfnbkmkcp)
2. إذهب الى [c9.io](https://c9.io) واضغط على *Get started with AWS Cloud9*
3. أنشئ حساب في AWS (يتطلب معلومات بطاقتك البنكية، لكن تستطيع استخدامها مجاناً)
4. من AWS Dashboard، أدخل *Cloud9* في مربع البحث ثم اضغطه
5. من Cloud 9 dashboard، اضغط *Create environment*
6. سمه *django-girls*
7. أثناء تعديل الإعدادات، من "Environment Type" اختر *Create a new instance for environment (EC2)*، ومن "Instance type" اختر *t2.micro*. (المفترض يظهر لك "Free-tier eligible." أي أنها متوفرة في الفئة المجانية). إعدادات cost-saving الافتراضية لا بأس بها، وتستطيع إبقاء الإعدادات الافتراضية الأخرى على ما هي عليه.
8. اضغط على *Next step*
9. اضغط *Create environment*

الآن يفترض أن تشاهد واجهة وقائمة جانبية، ونافذة رئيسية كبيرة تحتوي نص، ونافذة صغيرة في الجزء السفلي التي تبدو مثل هذا:

{% filename %}bash{% endfilename %}

    yourusername:~/workspace $
    

هذه المساحة السفلية تحتوي موجه الأوامر الخاص بك. يمكنك استخدام موجه الأوامر لإرسال التعليمات إلى الكمبيوتر البعيد في Cloud 9. يمكنك تغيير حجم تلك النافذة لجعلها أكبر قليلاً.

#### معرف Glitch.com السحابي

1. انتقل إلى [Glitch.com](https://glitch.com/)
2. قم بالتسجيل للحصول على حساب (https://glitch.com/signup) أو استخدم حساب GitHub الخاص بك إذا كان لديك حساب. (انظر تعليمات GitHub أدناه)
3. انقر فوق *New Project* واختر *hello-webpage*
4. انقر على قائمة الأدوات المنسدلة (في الجزء السفلي الأيسر من النافذة)، ثم على زر المحطة الطرفية لفتح علامة التبويب الطرفية مع توجيه مثل هذا:

{% filename %}Terminal{% endfilename %}

    app@name-of-your-glitch-project:~
    

عند استخدام Glitch.com كقاعدة بيانات سحابية، لا تحتاج إلى إنشاء بيئة افتراضية. بدلاً من ذلك، قم بإنشاء الملفات التالية يدوياً:

{% filename %}glitch.json{% endfilename %}

```json
{
  "install": "pip3 install -r requirements.txt --user",
  "start": "bash start.sh",
  "watch": {
    "throttle": 1000
  }
}
```

{% filename %}requirements.txt{% endfilename %}

    Django~={{ book.django_version }}
    

{% filename %}.bash_profile{% endfilename %}

```bash
alias python=python3
alias pip=pip3
```

{% filename %}start.sh{% endfilename %}

```bash
chmod 600 .bash_profile
pip3 install -r requirements.txt --user
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver $PORT
```

بمجرد إنشاء هذه الملفات، انتقل إلى المحطة الطرفية وتنفيذ الأوامر التالية لإنشاء أول مشروع جانغو الخاص بك:

{% filename %}Terminal{% endfilename %}

    django-admin.py startproject mysite .
    قم بالتحديث
    

من أجل رؤية رسائل الخطأ المفصلة، يمكنك تفعيل سجلات التصحيح جانغو لتطبيق Glitch الخاص بك. ببساطة إضافة ما يلي في نهاية ملف `mysite/settings.py`.

{% filename %}mysite/settings.py{% endfilename %}

```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}
```

سيؤدي هذا إلى إنشاء `debug.log` ملف يفصل عمليات جانغو وأي رسائل خطأ قد تظهر، يجعل من الأسهل إصلاح ما إذا كان موقع الويب الخاص بك لا يعمل.

يجب أن تفشل عملية إعادة التشغيل الأولية لمشروع Glitch. (إذا قمت بالنقر على زر القائمة المنسدلة العلوية `Show` وبعدها على `In a New Window`، سوف تتلقى رسالة خطأ `DisallowedHost` .) لا تقلق بشأن ذلك في هذه المرحلة، هذا البرنامج التعليمي سوف يصلح هذا بمجرد أن تحدث إعدادات جانغو للمشروع الخاص بك في ملف `mysite/settings.py`.

### البيئة الافتراضية

البيئة افتراضية (وتسمى أيضا virtualenv) مثل صندوق خاص يمكننا ملئه بأكواد برمجية مفيدة من اجل مشروع نعمل عليه. نستخدم البيئة الإفتراضية لنحافظ على الأكواد البرمجية التي نريدها لمشاريع مختلفة في بيئات منفصلة، حتى لا تختلط مع مشاريع اخرى.

تشغيل:

{% filename %}Cloud 9{% endfilename %}

    mkdir djangogirls
    cd djangogirls
    python3 -m venv myvenv
    source myvenv/bin/activate
    pip install django~={{ book.django_version }}
    

(لاحظ أنه بالسطر الأخير إستخدمنا علامة المد تليها علامة يساوي: `~=`).

### GitHub

أنشئ حساب في [GitHub](https://github.com).

### بايثون في كل مكان

يتضمن البرنامج التعليمي للفتيات في جانغو قسما عما يسمى بالنشر، وهي عملية أخذ التعليمات البرمجية التي تعمل على تطبيق الويب الجديد ونقلها إلى جهاز كمبيوتر متاح للجمهور (يسمى الخادم) حتى يتمكن أشخاص آخرين من رؤية عملك.

هذا الجزء غريب نوعاً ما عند تنفيذ البرنامج التعليمي على جهاز كروم بوك لأننا نستخدم جهاز كمبيوتر موجود على الإنترنت أساساً (ليس مثل أي كمبيوتر محمول آخر). ومع ذلك، فإنه لا يزال مفيدا، إذا فكرنا في مساحة عمل Cloud 9 كمكان لعملنا "تحت الإنشاء" و Python Anywhere كمكان لعرض أشيائنا إذا اكتملت.

بالتالي، قم بتسجيل حساب جديد في Python Anywhere عبر هذا الرابط [www.pythonanywhere.com](https://www.pythonanywhere.com).