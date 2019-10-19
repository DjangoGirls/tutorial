# نماذج دجانغو

ما نريد أن نخلق الآن هو شيء من شأنه أن يخزن جميع المشاركات في مدونتنا. ولكن لكي نكون قادرين على القيام بذلك، نحتاج إلى الحديث قليلا عن الأشياء المسماة `objects`.

## الكائنات

هناك مفهوم في البرمجة يسمى `object-oriented programming`. والفكرة هي أنه بدلاً من كتابة كل شيء كتسلسل ممل من تعليمات البرمجة، يمكننا نمذجة الأشياء وتحديد كيفية تفاعلها مع بعضها البعض.

ما هو الكائن؟ عبارة عن مجموعة من الخصائص واﻹجراءات. قد تبدو غريبة في البداية، لكن سنقدم لكم المثال التالي.

إذا أردنا نمذجة قط، سنقوم بإنشاء كائن `Cat` يحتوي على بعض الخصائص مثل `اللون`, `العمر`, `المزاج` (مثل جيد أو سيئ، أو النعاس;))، و `المالك`(التي يمكن أن تسند إلى الكائن `الشخص` – أو ربما، في حالة قط ضآل، يمكن أن تكون الخاصية فارغة).

ثم يحتوي `القط` على بعض الإجراءات: `مواء` أو `خدش` أو `إطعام` (وفي بعض الحالات نعطي القط ` طعام القط`، والتي يمكن أن تكون كائن منفصل مع خصائص، مثل `المذاق`).

    القط
    --------
    اللون
    العمر
    المزاج
    المالك
    مواء()
    خدش()
    إطعام(طعام_القط)
    

    CatFood
    --------
    taste
    

مبدأيا الفكرة هي وصف الأشياء الحقيقة بإستعمال البرمجة بالخصائص(تسمى` خصائص الشيئ`) و الإجراءات (تسمى`الأساليب`).

كيف سننشئ مشاركات المدونة بعد ذلك؟ نحن نريد بناء مدونة، أليس كذلك؟

نحن بحاجة إلى الإجابة على السؤال: ما هي وظيفة المدونة؟ ما هي الخصائص التي يجب ان تحملها؟

حسنا، بالتأكيد لدينا مشاركة في مدونتنا تحتاج بعض النصوص مع محتوى وعنوان، أليس كذلك؟ سيكون جيدا ايضا معرفة من كتبها ، لذا نحن بحاجة لكاتب. وأخيرا نود معرفة متى تم إنشاء ونشر المشاركة.

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

ما نوع الأشياء التي يمكن إجراؤها على مشاركة في المدونة؟ سيكون من الجميل أن يكون لديك بعض `method` التي تنشر المشاركة، أليس كذلك؟

لذلك سوف نحتاج إلى أسلوب `publish`.

نظراً لأننا نعرف ما نريد أن نحققه، دعونا نبدأ النمذجة في جانغو!

## نماذج دجانغو

بمعرفة ما هو الكائن ، يمكننا انشاء نمودج للمشاركة على مدونتنا.

النموذج في جانغو هو كائن من نوع خاص يتم حفظه في `database`. قاعدة بيانات هي مجموعة من البيانات. هذا هو المكان الذي ستحفض فيه معلومات حول المستخدمين ،مشاركاتك ومدونتك. سيتم استخدام قاعدة بيانات SQLite لتخزين البيانات الخاصة بنا. هذه قاعدة البيانات الإفتراضية الخاصة بجانغو-- سوف تكون كافية بالنسبة لنا الآن.

يمكنك التفكير في نموذج في قاعدة البيانات كجدول مع الصفوف (بيانات) والأعمدة (الحقول).

### إنشاء تطبيق

لإبقاء كل شيء مرتباً، سننشئ تطبيق منفصل داخل مشروعنا. انه من الجميل ان يكون كل شيء مرتب من البداية. لإنشاء تطبيق نحن بحاجة إلى تشغيل الأمر التالي في وحدة التحكم (من `djangogirls` حيث يوجد الملف `manage.py`):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

ستلاحظ أنه تم إنشاء دليل `blog` جديد ويحتوي على عدد من الملفات الآن. يجب أن تبدو الدلائل والملفات في مشروعنا كما يلي:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    └── requirements.txt
    

بعد إنشاء التطبيق، نحتاج أيضا أن نقول لدجانغو أنه ينبغي استخدامه. We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. المنتج النهائي ينبغي أن يبدو هكذا:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### إنشاء نمودج مشاركة في المدونة

في ملف `blog/models.py` نحدد كافة كائنات تسمى `Models`--وهذا هو المكان الذي سنحدد فيه مشاركات مدونتنا.

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> تحقق جيدا من استخدام حرفين أسفل السطر (`_`) على كل جانب من `str`.  . هذه الاتفاقية تستخدم كثيرا في بايثون وأحيانا كما نسميها "dunder" (اختصارا ل "double-underscore").

يبدو مخيفا، أليس كذلك؟ ولكن لا تقلق--سوف نشرح ماذا تعني هذه السطور!

جميع الخطوط بدءاً `from` أو `import` هي سطور تضيف بعض أجزاء من ملفات أخرى. بدلاً من نسخ ولصق نفس الأشياء في كل ملف، يمكن أن ندرج بعض الأجزاء مع `من... import ...`.

`class Post(models.Model):` --هذا السطر يحدد نموذج لدينا (و هو`الكائن`).

- `class` هي كلمة أساسية خاصة التي تشير إلى أنه علينا تحديد كائن.
- `Post` هو اسم نموذجنا. ويمكننا أن نعطيه اسما مختلفا (ولكن يجب علينا تجنب الأحرف الخاصة والمسافاة). ابدأ دائما بإسم فئة مع حرف كبير.
- `models.Model` يعني أن المشاركة هي نموذج لجانغو، لذلك دجانغو يعرف أنه يجب حفظها في قاعدة البيانات.

والآن علينا أن نحدد الخصائص التي كنا نتحدث عنها`title`, `text`, `created_date`, `published_date` و `author`. للقيام بذالك نحن بحاجة إلى تحديد نوع كل حقل (النص؟ رقم؟ تاريخ؟ علاقة لكائن آخر، مثل مستخدم)

- `models.CharField` –--وهكذا يمكنك تحديد نص مع عدد محدود من الأحرف.
- `models.TextField` – هذا لنص طويل دون حد. يبدو مثاليا لمدونة لمشاركة المحتوى، أليس كذلك؟
- `models.DateTimeField` --هذا هو التاريخ والوقت.
- `models.ForeignKey`--وهذا ارتباط إلى نموذج آخر.

نحن لن شرح كل شيء من التعليمات البرمجية هنا لأنه سوف يستغرق الكثير من الوقت. You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

وماذا عن `def publish(self):`؟ هذا هو بالضبط الأسلوب `publish` الذي كنا نتحدث عنه. `def` يعني أن هذا أسلوب دالة و `publish` اسم الأسلوب. يمكنك تغيير اسم الأسلوب إذا أردت. حكم التسمية أن نستخدم حروف صغيرة وتسطيرات أسفل السطر بدلاً من المسافات. على سبيل المثال، يمكن استدعاء أسلوب والذي يقوم بحساب متوسط السعر `calculate_average_price`.

أساليب كثيرا ما `return` شيئا. هناك مثال على ذلك في أسلوب `__str__`. في هذا السيناريو، عندما ندعو `__str__()` سوف تحصل على نص (**string**) مع عنوان البريد.

كما لاحظ أن كلا `def publish(self):` و `def __str__(self):` يتم فصلها داخل فئتنا. نظراً لأن بايثون حساسة للمسافة البيضاء، نحن بحاجة لوضع مسافة بادئة لأساليب عملنا داخل الفئة. بخلاف ذلك، الأساليب التي لا تنتمي إلى الفئة، ويمكنك الحصول على بعض السلوك الغير متوقع.

إذا كان هناك شيء لا يزال غير واضح حول النماذج، لا تتردد بسؤال المدرب الخاص بك! نحن نعلم أنها معقدة، لا سيما عندما كنت تتعلم ما الأشياء والمهام في نفس الوقت. ولكن نأمل أن يبدو أقل سحرا قليلا الآن!

### إنشاء جداول للنماذج في قاعدة البيانات الخاصة بك

الخطوة الأخيرة هنا لإضافة نموذجنا الجديد إلى قاعدة البيانات الخاصة بنا. أولاً يجب أن تجعل جانغو يعرف أن لدينا بعض التغييرات في نموذجنا. (لقد أنشئناه للتو!) إذهب إلى إطار وحدة التحكم الخاصة بك واكتب `python manage.py makemigrations blog`. ستبدو كالشكل التالي:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**ملاحظة:** تذكر أن تقوم بحفظ الملفات التي يمكنك تحريرها. وبخلاف ذلك، سيقوم الكمبيوتر بتنفيد النسخة السابقة والتي قد تعطيك رسائل خطأ غير متوقعة.

أعدت دجانغو ملف ترحيل لنا وعلينا الآن أن نطبقه على قاعدة البيانات الخاصة بنا. اكتب `python manage.py migrate blog` ويكون الإخراج كما يلي:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

يا هلا! الآن لدينا نموذج آخر في قاعدة بياناتنا! سيكون من الجميل أن نراه ، اليس كذالك؟ انتقل إلى الفصل التالي لمعرفة الشكل الذي تبدو عليه مشاركتك!