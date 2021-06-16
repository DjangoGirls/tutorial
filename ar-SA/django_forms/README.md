# نماذج جانغو

الشيء الأخير الذي نريد القيام به على موقعنا هو خلق وسيلة لطيفة لإضافة وتحرير مشاركات مدونتنا. دجانغو `admin` جميل ، لكن من الصعب تخصيصه وجعله جميلا. مع `forms` سيكون لدينا سلطة مطلقة على واجهتنا – يمكن أن نفعل أي شيء تقريبا يمكن أن نتصور!

الشيء الجميل حول أشكال جانغو هو أنه يمكننا تخصيص واحد من الصفر أو إنشاء `ModelForm` الذي سيحفظ نتيجة النموذج في الشكل.

هذا بالضبط ما نريد فعله سننشئ شكل لنمودج `Post`.

مثل كل جزء مهم من دجانغو، فإن النماذج لها ملف خاص بها `forms.py`.

نحن بحاجة إلى إنشاء ملف بهذا الاسم في دليل `blog`.

    blog
       └── forms.py
    

حسنًا، دعونا نفتحه في محرر التعليمات البرمجية (أي في البرنامج الذي تكتب فيه الأكواد) ونكتب التعليمات البرمجية التالية:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

نحتاج أولا الى جلب و احضار نماذج جانغو (`from django import forms`) and our `Post` model (`from .models import Post`).

`PostForm`,، كما كنت تظن ربما، هو اسم النموذج. نحن بحاجة إلى أن نقول لدجانغو ان هذا النموذج هو `ModelForm`(لذلك جانغو ستقوم ببعض السحر `forms.ModelForm` هو المسؤول عن ذلك.

تاليا ، لدينا `class Meta` والذي يقول لدجانغو اي نمودج يجب استخدامه لإنشاء الشكل (`model = Post`).

وأخيراً، يمكننا أن نقول ياي حقول يجب ان تنتهي في شكلنا. في هذا السيناريو نريد فقط `title` و `text` عرضه – – `author` ينبغي أن يكون الشخص الذي قام بتسجيل هو (أنت!) ويجب تعيين `created_date` تلقائياً عندما نقوم بإنشاء مشاركة (أي في التعليمات البرمجية)، اليس كذالك؟

وهذا كل شيء! كل ما يتعين علينا فعله الآن هو استخدام الشكل في *view* وعرضه في نموذج.

لذلك مرة أخرى سنقوم بإنشاء رابط إلى صفحة، UR، والعرض والقالب.

## رابط لصفحة مع الشكل

قبل أن نضيف الرابط، نحتاج إلى بعض الأيقونات لاستخدامها كأزرار للرابط. لهذا البرنامج التعليمي، قم بتنزيل [file-earmark-plus.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/file-earmark-plus.svg) وحفظه في المجلد `blog/templates/blog/icons/`

> ملاحظة: لتنزيل صورة SVG، قم بفتح قائمة السياق على الرابط (عادة بالنقر على اليمين عليه) واختر "حفظ الرابط ك". في مربع الحوار الذي يسألك أين تحفظ الملف، انتقل إلى دليل `djangogirl` لمشروع جانغو الخاص بك. وفي ذلك إلى الدليل الفرعي `blog/templates/blog/icons`، وحفظ الملف هناك.

حان الوقت لفتح `blog/templates/blog/base.html` في محرر التعليمات البرمجية. الآن يمكننا استخدام ملف الأيقونة هذا داخل قالب القاعدة كما يلي. في عنصر `div` داخل قسم `header` ، سنضيف رابط قبل عنصر `h1`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

لاحظ أننا نريد تسمية العرض الجديد `post_new`. الـ SVG icon [](https://icons.getbootstrap.com/icons/file-earmark-plus/) مقدم من [Bootstrap Icons](https://icons.getbootstrap.com/) وسوف يعرض أيقونة صفحة مع علامة زائد. نحن نستخدم موجه قالب جانغو يسمى `include`. سيؤدي هذا إلى حقن محتوى الملف في قالب جانغو. متصفح الويب يعرف كيفية التعامل مع هذا النوع من المحتوى دون أي معالجة أخرى.

> يمكنك تنزيل جميع أيقونات Bootstrap [here](https://github.com/twbs/icons/releases/download/v1.1.0/bootstrap-icons-1.1.0.zip). فك ضغط الملف وانسخ جميع ملفات صور SVG في مجلد جديد داخل `blog/templates/blog/` يسمى `icons`. بهذه الطريقة يمكنك الوصول إلى أيقونة مثل `pencil-fill.svg` باستخدام مسار الملف `blog/templates/blog/icons/pencil-fill.svg`

بعد تعديل السطر ، يجب أن يبدو ملف HTML الخاص بك مثل هذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load static %}
<!DOCTYPE html>
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <header class="page-header">
            <div class="container">
                <a href="{% url 'post_new' %}" class="top-menu">
                    {% include './icons/file-earmark-plus.svg' %}
                </a>
                <h1><a href="/">Django Girls Blog</a></h1>
            </div>
        </header>
        <main class="content container">
            <div class="row">
                <div class="col">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </main>
    </body>
</html>

```

بعد حفظ و تحديث الصفحة : http://127.0.0.1:8000 سوف ترى خطأ مألوف! `NoReverseMatch` هل هذا ما حدث معك/معكي؟ جيد !!

## عنوان الموقع URL

نقوم بفتح `blog/urls.py` في محرر التعليمات البرمجية وإضافة سطر:

{% filename %}blog/urls.py{% endfilename %}

```python
path('post/new/', views.post_new, name='post_new'),
```

وسوف تبدو التعليمات البرمجية النهائية هكذا:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
    path('post/new/', views.post_new, name='post_new'),
]
```

بعد تحديث الموقع، نرى `AttributeError`، حيث أننا ليس لدينا `post_new` طريقة عرض منفذة. دعونا نضيفها الآن.

## عرض post_new

حان الوقت لفتح `blog/views. y` الملف في محرر التعليمات البرمجية وإضافة الأسطر التالية مع بقية صفوف `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

عندها *view* الخاصة بنا:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

لإنشاء نموذج `Post` جديد، نحن بحاجة إلى استدعاء `PostForm()` وتمريرها إلى القالب. سنعود لهذا *view* لكن الأن دعونا ننشئ شكل نمودج سريعا.

## القالب

نحن بحاجة إلى إنشاء ملف `post_edit.html` في الدليل `blog/templates/blog`، وفتحه في محرر التعليمات البرمجية. لجعل النموذج يعمل نحن بحاجة إلى عدة أشياء:

* علينا عرض الشكل. يمكننا أن نفعل ذلك عبر (على سبيل المثال{% raw %}`{{ form.as_p }}`{% endraw %}.
* يجب تغليف السطر أعلاه مع عنصر نموذج HTML: `<form method="POST">...</form>`.
* ونحن بحاجة إلى زر `Save`. ونحن نفعل ذلك مع زر HTML: `<button type="submit">Save</button>`.
* وأخيراً، فقط بعد افتتاح العلامة `<form ...>` نحن بحاجة إلى إضافة {% raw %} `{% csrf_token %}`{% endraw %}. هذا أمر مهم جداً، لأنه يجعل النماذج الخاصة بك آمنة! إذا كنت قد نسيت هذا قليلاً، سيشكو جانغو عند محاولة حفظ النموذج:

![CSFR Forbidden page](images/csrf2.png)

حسنًا، دعونا نرى كيف يجب أن تبدو HTML في `post_edit.html`:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h2>New post</h2>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

حان وقت التحديث! ياي! يتم عرض النموذج الخاص بك!

![New form](images/new_form2.png)

ولكن انتظر لحظة! عندما تكتب شيئا في حقول `title` و `text` ومحاولة حفظه، ما الذي سيحدث؟

لا شيء! نحن مرة أخرى في نفس الصفحة و النص الخاص بنا يذهب… و لم تتم إضافة أي مشاركة جديدة. إذاً ماذا خطأ؟

الجواب: لا شيء. نحن بحاجة إلى العمل أكثر قليلاً في *view*.

## حفظ الشكل

افتح `blog/views.py` مرة أخرى في محرر التعليمات البرمجية. حاليا كل ما لدينا في العرض `post_new` هو التالي:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

عندما نسلم الشكل، يتم أخذنا إلى نفس المكان، ولكن هذه المرة لدينا بيانات أكثر في `request`، وبشكل أكثر تحديداً في `request.POST` (التسمية ليس لها علاقة بمشاركات المدونة؛ إنها تتعلق بحقيقة أننا "ننشر" البيانات). تذكر كيف في ملف HTML ، تعريفنا `<form>` لديه المتغير `method="POST"`؟ جميع الحقول من النموذج الآن في `request.POST`. لا يجب إعادة تسمية `POST` الى أي شيء آخر (القيمة الوحيدة الصالحة ل `method` هي`GET`، ولكن ليس لدينا وقت لشرح الفرق).

لذا في *view* الخاص بنا لدينا حالتين منفصلتين للتعامل معهما: أولا، عندما نصل إلى الصفحة لأول مرة ونريد نموذج فارغ، وثانيا، عندما نعود إلى *view* مع جميع بيانات النموذج التي كتبناها للتو. لذا نحن بحاجة إلى إضافة شرط (سنستخدم `if` لذلك):

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

حان الوقت لملء النقاط `[...]`. إذا كانت الطريقة `` `POST` إذاً نريد بناء `PostForm` مع بيانات من النموذج، أليس كذلك؟ سوف نفعل ذلك على النحو التالي:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST)
```

الشيء التالي هو التحقق مما إذا كان النموذج صحيح (تم تعيين جميع الحقول المطلوبة ولم يتم تقديم أية قيم غير صحيحة). ونحن نفعل ذلك عبر `form.is_valid()`.

نتحقق مما إذا كان النموذج صالح وإذا كان كذلك، يمكننا حفظه!

{% filename %}blog/views.py{% endfilename %}

```python
if form.is_valid():
    post = form.save(commit=False)
    post.author = request.user
    post.published_date = timezone.now()
    post.save()
```

في الأساس، لدينا أمرين هنا: نحفظ النموذج مع `form.save` ونضيف مؤلف (بما انه لم يكن هناك مجال ل `author` في `PostForm` وهذا الحقل مطلوب). `commit=False` يعني أننا لا نريد حفظ نموذج `Post` بعد--نريد إضافة الكاتب أولاً. في غالب الوقت ستستخدم `form.save()` بدون `commit=False` ولكن في هذه الحالة، نحن بحاجة لتوريده. `post.save()` سوف يحافظ على التغييرات (إضافة المؤلف) ويتم إنشاء مشاركة مدونة جديدة!

وأخيرا، سيكون أمرا رائعا إذا تمكنا من الانتقال مباشرة إلى صفحة `post_detail` لمشاركتنا التي تم إنشاؤها حديثا في المدونة، أليس كذلك؟ ولتحقيق ذلك، نحتاج إلى استيراد:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import redirect
```

أضفه في بداية الملف. والآن يمكننا أن نقول: "انتقل إلى صفحة `post_detail` للمشاركة التي تم إنشاؤها حديثا":

{% filename %}blog/views.py{% endfilename %}

```python
return redirect('post_detail', pk=post.pk)
```

`post_detail` هو اسم العرض الذي نريد الذهاب اليه. تذكر أن هذا *view* يتطلب متغير `pk`؟ لتمريرها إلى العرض، نستخدم `pk=post.pk`، حيث `post` هي مشاركة المدونة التي تم إنشاؤها حديثا!

حسنا، لقد تحدثنا كثيرا، ولكن ربما نريد أن نرى ما يبدو عليه *view* الآن، أليس كذلك؟

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

دعونا نرى ما إذا كان يعمل. اذهب إلى صفحة http://127.0.0.1:8000/post/new/,، اضف `title` و `text`،احفظه ، ها انت الآن! تم إضافة مشاركة المدونة الجديدة وسيتم إعادة توجيهك إلى الصفحة `post_detail`!

ربما لاحظتم أننا نضع تاريخ النشر قبل حفظ المشاركة. وفي وقت لاحق سوف نقدم *publish button* في **Django Girls Tutorial: Extensions**.

هذا رائع!

> وبما أننا استخدمنا مؤخرا واجهة المشرف في جانغو، فإن النظام يعتقد حاليا أننا لا نزال مسجلين الدخول. هناك بعض الحالات التي يمكن أن تؤدي بنا إلى تسجيل الخروج (إغلاق المتصفح، إعادة تشغيل DB، إلخ.). إذا وجدت عند إنشاء مشاركة، أنك تحصل على أخطاء تشير إلى عدم وجود مستخدم مسجل الدخول، انتقل إلى صفحة المشرف http://127.0.0.1:8000/admin وسجل الدخول مرة أخرى. وهذا سيحل المشكلة مؤقتاً. هناك إصلاح دائم في انتظاركم في فصل **Homework: add security to your website!** بعد البرنامج التعليمي الرئيسي.

![Logged in error](images/post_create_error.png)

## التحقق من صحة النموذج

الآن، سوف نريكم كيف أن أشكال جانغو رائعة. يجب أن تحتوي مشاركة المدونة على حقول `title` و `text`. في نموذج `Post` لدينا لم نقل أن هذه الحقول (على عكس `published_date` غير مطلوبة. لذلك جانغو، بشكل افتراضي، يتوقع أن يتم تعيينهم.

حاول حفظ النموذج بدون `title` و `text`. خمن ما سيحدث!

![Form validation](images/form_validation2.png)

جانغو يحرص على التحقق من صحة جميع الحقول في شكلنا ان كانت صحيحة. أليس هذا رائع؟

## تحرير النموذج

الآن نحن نعرف كيفية إضافة مشاركة جديدة. ولكن ماذا لو أردنا تعديل واحدة موجودة بالفعل؟ هذا مشابه جدا لما قمنا به. لنقم بإنشاء بعض الأمور الهامة بسرعة. (إذا كنت لا تفهم شيئا، يجب أن تسأل المدرب الخاص بك أو تنظر في الفصول السابقة، لأننا غطينا جميع هذه الخطوات مسبقاً.)

أولا، دعونا نحفظ الرمز الذي يمثل زر التحرير. قم بتنزيل [pencil-fill.svg](https://raw.githubusercontent.com/twbs/icons/main/icons/pencil-fill.svg) وحفظه في الموقع `blog/templates/blog/icons/`.

افتح `blog/templates/blog/post_detail.html` في محرر التعليمات البرمجية وأضف التعليمات البرمجية التالية داخل عنصر `article`:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<aside class="actions">
    <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
      {% include './icons/pencil-fill.svg' %}
    </a>
</aside>
```

بحيث يبدو القالب كما يلي:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <article class="post">
        <aside class="actions">
            <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
                {% include './icons/pencil-fill.svg' %}
            </a>
        </aside>
        {% if post.published_date %}
            <time class="date">
                {{ post.published_date }}
            </time>
        {% endif %}
        <h2>{{ post.title }}</h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endblock %}
```

افتح `blog/urls.py` في محرر التعليمات البرمجية، وأضف هذا السطر:

{% filename %}blog/urls.py{% endfilename %}

```python
    path('post/<int:pk>/edit/', views.post_edit, name='post_edit'),
```

سنقوم بإعادة استخدام القالب `blog/templates/blog/post_edit.html`، لذلك آخر شيء مفقود هو *view*.

دعونا نفتح `blog/views.py` وإضافة هذا في نهاية الملف:

{% filename %}blog/views.py{% endfilename %}

```python
def post_edit(request, pk):
    post = get_object_or_404(Post, pk=pk)
    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.published_date = timezone.now()
            post.save()
            return redirect('post_detail', pk=post.pk)
    else:
        form = PostForm(instance=post)
    return render(request, 'blog/post_edit.html', {'form': form})
```

يبدو هذا بالضبط تقريبا نفس عرض `post_new`، أليس كذلك؟ ولكن ليس تماما. لسبب واحد، نحن نمرر عامل `pk` إضافي من `urls`. بعد ذلك، نحصل على نموذج `Post` الذي نريد تعديله مع `get_object_or_404(Post, pk=pk)` وثم عندما نقوم بإنشاء نموذج، فإننا نمرر هذا المنشور كـ `instance`، كلاهما عندما نحفظ النموذج…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

…وعندما نكون قد فتحنا للتو نموذج مع هذا المنشور للتحرير:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

حسنا، دعونا نختبر إذا كان يعمل! لننتقل إلى صفحة `post_detail`. يجب أن يكون هناك زر تعديل في الركن العلوي الأيسر:

![Edit button](images/edit_button2.png)

عند النقر عليه سترى النموذج مع مشاركة مدونتنا:

![Edit form](images/edit_form2.png)

لا تتردد في تغيير العنوان أو النص وحفظ التغييرات!

تهانينا! أصبح تطبيقك أكثر وأكثر اكتمالاً!

إذا كنت بحاجة إلى مزيد من المعلومات حول نماذج جانغو، فيجب عليك قراءة الوثائق: https://docs.djangoproject.com/en/2.2/topics/forms/

## الحماية

التمكن من إنشاء مشاركات جديدة بالنقر على رابط رائع! ولكن في الوقت الراهن، أي شخص يقوم بزيارة موقع الويب الخاص بك سوف يكون قادر على انشاء مشاركة جديدة، وهذا شيء ربما لا تريده. دعونا تجعل الزر يظهر لك و ليس لأي شخص آخر.

افتح `blog/templates/blog/base.html` في محرر التعليمات البرمجية، ابحث عن `div` في داخل `header` وعلامة المرساة التي وضعتها سابقاً. يجب أن تبدو هكذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu">
    {% include './icons/file-earmark-plus.svg' %}
</a>
```

سوف نضيف علامة `{% if %}` أخرى إلى هذا، والذي سيجعل الرابط يظهر فقط للمستخدمين الذين تم تسجيل دخولهم كمشرفين. الآن، إنه أنت فقط! قم بتغيير عنصر `<a>` ليبدو هكذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu">
        {% include './icons/file-earmark-plus.svg' %}
    </a>
{% endif %}
```

سيؤدي هذا `{% if %}` إلى إرسال الرابط إلى المتصفح فقط إذا كان المستخدم الذي يطلب الصفحة مسجل الدخول. هذا لا يحمي إنشاء مشاركات جديدة تماماً، ولكنها خطوة أولى جيدة. سنقوم بتغطية المزيد من الأمان في دروس الإضافة.

تذكر رمز التحرير الذي أضفناه للتو إلى صفحة التفاصيل؟ نحن أيضا نريد إضافة نفس التغيير هناك، لذلك لن يتمكن الأشخاص الآخرون من تحرير المشاركات الموجودة.

افتح `blog/templates/blog/post_detail.html` في محرر التعليمات البرمجية وابحث عن هذا السطر:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
    {% include './icons/pencil-fill.svg' %}
</a>
```

غيره إلى هذا:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}">
        {% include './icons/pencil-fill.svg' %}
     </a>
{% endif %}
```

نظرا لأنك مسجل الدخول، إذا قمت بتحديث الصفحة، فلن ترى شيئا مختلفا. حمل الصفحة في متصفح مختلف أو نافذة متخفية (تسمى "InPrivate" في Windows Edge)، على الرغم من ذلك، وسترى أن الرابط لا يظهر، ولا تعرض الأيقونة أيضا!

## شيء اخر: وقت النشر!

دعونا نرى ما إذا كان كل هذا يعمل على PythonAnywhere. حان الوقت لنشر آخر!

* أولاً، فوّض التعليمات البرمجية الخاصة بك، وادفعها إلى GitHub:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* وبعد ذلك، في وحدة [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(تذكر أن تستبدل `<your-pythonanywhere-domain>` بالمجال الفرعي لـ PythonAnywhere الفعلي، بدون أقواس الزاوية. )

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (use the menu button in the upper right of the console) and hit **Reload**. Refresh your https://subdomain.pythonanywhere.com blog to see the changes.

And that should be it. Congrats! :)