# أشكال دجانغو

الشيء الأخير الذي نريد القيام به على موقعنا هو خلق وسيلة لطيفة لإضافة وتحرير مشاركات مدونتنا. دجانغو `admin` جميل ، لكن من الصعب تخصيصه وجعله جميلا. مع `forms` سيكون لدينا سلطة مطلقة على واجهتنا – يمكن أن نفعل أي شيء تقريبا يمكن أن نتصور!

الشيء الجميل حول أشكال جانغو هو أنه يمكننا تخصيص واحد من الصفر أو إنشاء `ModelForm` الذي سيحفظ نتيجة النموذج في الشكل.

هذا بالضبط ما نريد فعله سننشئ شكل لنمودج `Post`.

مثل كل جزء مهم من دجانغو، فإن النماذج لها ملف خاص بها `forms.py`.

نحن بحاجة إلى إنشاء ملف بهذا الاسم في دليل `blog`.

    blog
       └── forms.py
    

حسنا، دعونا نفتحه ونكتب التعليمة البرمجية التالية:

{% filename %}blog/forms.py{% endfilename %}

```python
from django import forms

from .models import Post

class PostForm(forms.ModelForm):

    class Meta:
        model = Post
        fields = ('title', 'text',)
```

نحتاج إلى استيراد أشكال دجانغو أولا (`from django import forms`)، ومن الواضح أن نموذج `Post` من .(`from .models import Post`).

`PostForm`,، كما كنت تظن ربما، هو اسم النموذج. نحن بحاجة إلى أن نقول لدجانغو ان هذا النموذج هو `ModelForm`(لذلك جانغو ستقوم ببعض السحر `forms.ModelForm` هو المسؤول عن ذلك.

تاليا ، لدينا `class Meta` والذي يقول لدجانغو اي نمودج يجب استخدامه لإنشاء الشكل (`model = Post`).

وأخيراً، يمكننا أن نقول ياي حقول يجب ان تنتهي في شكلنا. في هذا السيناريو نريد فقط `title` و `text` عرضه – – `author` ينبغي أن يكون الشخص الذي قام بتسجيل هو (أنت!) ويجب تعيين `created_date` تلقائياً عندما نقوم بإنشاء مشاركة (أي في التعليمات البرمجية)، اليس كذالك؟

وهذا كل شيء! كل ما يتعين علينا فعله الآن هو استخدام الشكل في *view* وعرضه في نموذج.

لذلك مرة أخرى سنقوم بإنشاء رابط إلى صفحة، UR، والعرض والقالب.

## رابط لصفحة مع الشكل

حان الوقت لفتح `blog/templates/blog/base.html` سنضيف رابط في `div` بإسم `page-header`:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

علما اننا سنستدعي العرض الجديد `post_new` كلاس `"glyphicon glyphicon-plus"` موفرة لنا عبر قالب البوستراب الذي نستخدمه. وسوف يضهر علامة + لنا.

بعد إضافة السطر، الآن يجب أن يبدو ملف HTML الخاص بك مثل هذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% load staticfiles %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link href='//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
        <div class="page-header">
            <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>
        <div class="content container">
            <div class="row">
                <div class="col-md-8">
                    {% block content %}
                    {% endblock %}
                </div>
            </div>
        </div>
    </body>
</html>
```

سوف تشاهد بعد حفظ وتحديث الصفحة http://127.0.0.1:8000 من الواضح أن خطأ `NoReverseMatch` مألوف، اليس كذالك؟

## عنوان الموقع URL

نفتح `blog/urls.py` وإضافة سطر:

{% filename %}blog/urls.py{% endfilename %}

```python
url(r'^post/new/$', views.post_new, name='post_new'),
```

سوف تبدو هذه التعليمة البرمجية في النهاية هكذا:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.post_list, name='post_list'),
    url(r'^post/(?P<pk>\d+)/$', views.post_detail, name='post_detail'),
    url(r'^post/new/$', views.post_new, name='post_new'),
]
```

بعد تحديث الموقع نرى `AttributeError` بما انه ليس لدينا `post_new` عرض تنفيدي دعونا نضفه الأن.

## عرض post_new

حان الوقت لفتح `blog/views.py` واضافة الأسطر التالية مع بقية اسطر `from`:

{% filename %}blog/views.py{% endfilename %}

```python
from .forms import PostForm
```

عندها *view*: الخاصة بنا:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

لإنشاء نموذج `Post` جديد، نحن بحاجة إلى استدعاء `PostForm()` وتمريرها إلى القالب. سنعود لهذا *view* لكن الأن دعونا ننشئ شكل نمودج سريعا.

## القالب

نحن بحاجة إلى إنشاء ملف `post_edit.html` في الدليل `blog/templates/blog`. لإنشاء نموذج العمل نحن بحاجة إلى عدة أشياء:

* علينا عرض الشكل. يمكننا أن نفعل ذلك عبر (على سبيل المثال{% raw %}`{{ form.as_p }}`{% endraw %}.
* السطر أعلاه يحتاج إلى أن يكون ملفوف مع علامة نموذج HTML: `<form method="POST">...</form>`.
* ونحن بحاجة إلى زر `Save`. ونحن نفعل ذلك مع زر HTML: `<button type="submit">Save</button>`.
* وأخيراً، فقط بعد افتتاح العلامة `<form ...>` نحن بحاجة إلى إضافة {% raw %} `{% csrf_token %}`{% endraw %}. هذا أمر مهم جداً، لأنه يجعل النماذج الخاصة بك آمنة! إذا كنت قد نسيت هذا قليلاً، سيشكو جانغو عند محاولة حفظ النموذج:

![صفحة "CSFR "](images/csrf2.png)

حسنا، دعونا نرى كيف يجب ان يبدو `post_edit.html` HTML:

{% filename %}blog/templates/blog/post_edit.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <h1>New post</h1>
    <form method="POST" class="post-form">{% csrf_token %}
        {{ form.as_p }}
        <button type="submit" class="save btn btn-default">Save</button>
    </form>
{% endblock %}
```

حان الوقت للتحديث! ياي! تم عرض الشكل الخاص بك!

![نموذج جديد](images/new_form2.png)

ولكن انتظر لحظة! عندما تكتب شيئا في حقول `title` و `text` ومحاولة حفظه، ما الذي سيحدث؟

لا شيء! نحن مرة أخرى على نفس الصفحة ونصنا قد اختفى.. ولم يتم إضافة أي وظيفة جديدة. ما هو الخطأ؟

الجواب: لا شيء. نحن بحاجة إلى العمل أكثر قليلاً في *view*.

## حفظ الشكل

أفتح `blog/views.py` مرة أخرى. حاليا كل ما لدينا في `post_new` هو ما يلي:

{% filename %}blog/views.py{% endfilename %}

```python
def post_new(request):
    form = PostForm()
    return render(request, 'blog/post_edit.html', {'form': form})
```

عندما نقدم الشكل، نعود الى نفس المنضر، ولكن هذه المرة لدينا بعض البيانات أكثر في `request`، وبشكل أكثر تحديداً في `request.POST`(التسمية ليس لها علاقة بمشاركات المدونة بل بنشرنا للمعلومات بيانات). تذكر كيف كان تعريفنا `<form>`في ملف HTML، المتغير `method="POST"`؟ كافة الحقول من الشكل الآن في `request.POST`. لا يجب إعادة تسمية `POST` الى أي شيء آخر (القيمة الوحيدة الصالحة ل `method` هي`GET`، ولكن ليس لدينا وقت لشرح الفرق).

لذا في *view* الخاص بنا لدينا حالتين منفصلتين للتعامل معهما: أولا، عندما نصل إلى الصفحة لأول مرة ونريد نموذج فارغ، وثانيا، عندما نعود إلى *view* مع جميع اشكال البيانات التي كتبنا. لذلك نحتاج إلى إضافة شرط (سنستخدم `if` لذلك(:

{% filename %}blog/views.py{% endfilename %}

```python
if request.method == "POST":
    [...]
else:
    form = PostForm()
```

حان الوقت لملئ النقاط `[...]`. إذا كانت `method` `POST` فإننا نريد إنشاء `PostForm` مع بيانات من النموذج، أليس كذلك؟ سوف نفعل ذلك على النحو التالي:

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

في الأساس، لدينا أمرين هنا: نحفظ النموذج مع `form.save` ونضيف مؤلف (بما انه لم يكن هناك مجال ل `author` في `PostForm` وهذا الحقل مطلوب). `commit=False` يعني أننا لا نريد حفظ نموذج `Post` بعد--نريد إضافة الكاتب أولاً. في غالب الوقت ستستخدم `form.save()` بدون `commit=False` ولكن في هذه الحالة، ونحن بحاجة لتوريده. `post.save()` سيتم الاحتفاظ بتغييرات (إضافة المؤلف) ويتم إنشاء تدوينة جديدة!

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

دعونا نرى ما إذا كان يعمل. اذهب إلى صفحة http://127.0.0.1:8000/post/new/,، اضف `title` و `text`،احفضه ، ها انت الأن! تم إضافة مشاركة المدونة الجديدة وسيتم إعادة توجيهك إلى الصفحة `post_detail`!

ربما لاحظتم أننا نضع تاريخ النشر قبل حفظ المشاركة. وفي وقت لاحق سوف نقدم *publish button* في **Django Girls Tutorial: Extensions**.

هذا رائع!

> كما استخدمنا مؤخرا واجهة المسؤول دجانغو، النظام يعتقد حاليا أننا لازلنا مسجلين. وهناك بعض الحالات التي يمكن أن تؤدي بالنسبة إلى تسجيل الخروج (إغلاق المستعرض، إعادة تشغيل DB، إلخ.). إذا، عند إنشاء مشاركة، أن كنت تحصل على أخطاء في اشارة الى عدم وجود مستخدم سجل الدخول، توجه إلى صفحة المشرف http://127.0.0.1:8000/admin وسجل الدخول مرة أخرى. وهذا سيحل المشكلة مؤقتاً. هناك إصلاح دائم في انتظاركم في فصل **Homework: add security to your website!** بعد البرنامج التعليمي الرئيسي.

![خطأ في تسجيل الدخول](images/post_create_error.png)

## التحقق من صحة النموذج

الأن سنضهر لك كم هي رائعة اشكال دجانغو. المشاركة او التدوينة يجب ان تحتوى على `title` `text`. في نموذج `Post` لم نقول إن هذه الحقول (على عكس `published_date`) غير مطلوبة، لذا يتوقع دجانغو افتراضيا تعيينها.

حاول حفظ النموذج بدون `title` و `text`. خمن ما سيحدث!

![التحقق من صحة النموذج](images/form_validation2.png)

جانغو يحرص على التحقق من صحة جميع الحقول في شكلنا ان كانت صحيحة. أليس هذا رائع؟

## تحرير النموذج

الأن نعرف كيف نضيف شكل جديد. لكن ماذا لو اردنا تحرير شكل موجود مسبقا؟ هذا مشابه جدا لما قمنا به. لنقم بإنشاء بعض الأمور الهامة بسرعة. (إذا كنت لا تفهم شيئا، يجب أن تسأل المدرب الخاص بك أو تنظر في الفصول السابقة، لأننا غطينا جميع هذه الخطوات مسبقاً.)

افتح `blog/templates/blog/post_detail.html` واضف السطر

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

بحيث يبدو القالب كما يلي:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <div class="post">
        {% if post.published_date %}
            <div class="date">
                {{ post.published_date }}
            </div>
        {% endif %}
        <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
        <h1>{{ post.title }}</h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endblock %}
```

وفي `blog/urls.py` نضيف هذا السطر:

{% filename %}blog/urls.py{% endfilename %}

```python
    url(r'^post/(?P<pk>\d+)/edit/$', views.post_edit, name='post_edit'),
```

سوف نعيد استخدام القالب `blog/templates/blog/post_edit.html`، آخر شيء مفقود هو طريقة*view*.

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

يبدو هذا بالضبط تقريبا نفس عرض `post_new`، أليس كذلك؟ ولكن ليس تماما. لواحد، يتم تمرير إعدادات `pk` إضافية من عناوين urls. بعد ذلك، نحصل على نموذج `Post` نريد تحرير `get_object_or_404(Post, pk=pk)` وبعد ذلك، عندما نقوم بإنشاء نموذج، نمرر هذه المشاركة باعتبارها `instance`، معا عند حفض النمودج…

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(request.POST, instance=post)
```

وعنما فتحنا نمودج من هذه المشاركة لتحريره:

{% filename %}blog/views.py{% endfilename %}

```python
form = PostForm(instance=post)
```

حسنا، دعونا نختبر إذا كان يعمل! لننتقل إلى صفحة `post_detail`. يجب أن يكون هناك زر تعديل في الركن العلوي الأيسر:

![زر تحرير](images/edit_button2.png)

عند النقر عليه سترى النموذج مع مشاركة مدونتنا:

![تحرير النموذج](images/edit_form2.png)

لا تتردد في تغيير العنوان أو النص وحفظ التغييرات!

تهانينا! التطبيق الخاص بك يصبح اكثر كمالاً!

إعرف المزيد حول حول اشكال دجانغو من خلال قراءة الوثائق الرسمية: https://docs.djangoproject.com/en/1.11/topics/forms/

## الحماية

أن تكون قادر على خلق مشاركات جديدة فقط عن طريق النقر على رابط رائع! ولكن في الوقت الراهن، أي شخص يقوم بزيارة موقع الويب الخاص بك سوف يكون قادر على انشاء مشاركة جديدة، وهذا شيء ربما لا تريده. دعونا تجعل الزر يظهر لك و ليس لأي شخص آخر.

في `blog/templates/blog/base.html`، تجد لدينا `page-header` `div` وعلامة مرساة كانت قد وضعت هناك مسبقا. ينبغي أن تبدو مثل هذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
<a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
```

سنضيف علامة `{% if %}` أخرى ، مما سيجعل الرابط يظهر فقط للمستخدمين الذين سجلوا الدخول إلى المشرف. هذا يعني انت وحدك فقط! غير العلامة `<a>`لتبدو مثل هذا:

{% filename %}blog/templates/blog/base.html{% endfilename %}

```html
{% if user.is_authenticated %}
    <a href="{% url 'post_new' %}" class="top-menu"><span class="glyphicon glyphicon-plus"></span></a>
{% endif %}
```

هذا `{% if %}` سيؤدي إلى إرسال الرابط إلى المتصفح فقط إذا تم تسجيل دخول المستخدم الذي يطلب الصفحة. هذا لا يحمي إنشاء مشاركات جديدة ، ولكنها خطوة أولى جيدة. سنغطي المزيد عن الأمان في الدروس الملحقة القادمة.

هل تذكر رمز التعديل الذي أضفناه للتو إلى صفحة التفاصيل؟ نريد أيضا إضافة التغيير نفسه هناك، حتى لا يتمكن الأشخاص الآخرون من تعديل المشاركات الحالية.

افتح `blog/templates/blog/post_detail.html` واضف السطر:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
<a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
```

غيره إلى هذا:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% if user.is_authenticated %}
     <a class="btn btn-default" href="{% url 'post_edit' pk=post.pk %}"><span class="glyphicon glyphicon-pencil"></span></a>
{% endif %}
```

نظرا لأنك مسجل الدخول، إذا قمت بتحديث الصفحة، فلن ترى شيئا مختلفا. تحميل الصفحة في متصفح مختلف أو نافذة التصفح المتخفي (تسمى "InPrivate" في ويندوز إدج)، على الرغم من ذلك، وسترى أن الرابط لا يضهر والرمز لا يعرض ايضا!

## شيء اخر: أنشر الوقت!

دعونا نرى ما إذا كان كل هذا يعمل على PythonAnywhere. حان الوقت لنشر آخر!

* أولا، التزم بالتعليمات البرمجية الجديدة، وإدفعها إلى جيت هاب:

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add --all .
    $ git status
    $ git commit -m "Added views to create/edit blog post inside the site."
    $ git push
    

* وبعد ذلك، في وحدة [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}command-line{% endfilename %}

    $ cd my-first-blog
    $ git pull
    [...]
    

* وأخيرا، انتقل إلى علامة التبويب [Web tab](https://www.pythonanywhere.com/web_app_setup/) واضغط على **Reload**.

هذا ينبغي ان يكون كل شيء! مبروك:)