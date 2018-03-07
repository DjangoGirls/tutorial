# البيانات الديناميكية في قوالب

لدينا قطع مختلفة في المكان: تم تحديد نموذج `Post` في `models.py`,، لدينا `post_list` في `views.py` والقالب المضاف. ولكن كيف سنظهر مشاركاتك في نموذج HTML ؟ لأن هذا ما نريد أن نفعله – اتخاذ بعض المحتويات (النماذج التي تم حفظها في قاعدة البيانات) وعرضها بشكل جميل ، اليس كذالك؟

وهذا بالضبط ما يفترض ب *views* القيام به: ربط النماذج والقوالب. وفي `post_list` *view* سوف نحتاج إلى أن النماذج التي نريد عرضها وتمريرها إلى القالب. في *view* نقرر اية (نمادج) سيتم عرضها في قالب.

حسنا، كيف سوف نحقق ذلك؟

نحن بحاجة إلى فتح `blog/views.py`. وحتى الآن `post_list` *view* يبدو مثل هذا:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

تذكر عندما تحدثنا عن تضمين التعليمات البرمجية المكتوبة في ملفات مختلفة؟ الآن هي اللحظة التي يتعين علينا فيها ادخال النمودج الذي كتبنا في `models.py`. سوف نقوم بإضافة سطر `from .models import Post` مثل هذا:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

النقطة قبل `models` تعني *current directory* أو *current application*. `Views.py` و `models.py` في نفس الدليل. وهذا يعني أننا يمكن أن تستخدم `.` واسم الملف (بدون `.py`). ثم نقوم باستيراد اسم النموذج (`Post`).

ولكن ما هي الخطوة التالية؟ لأخد المشاركات الفعلية للمدونة من `Post` نحن بحاجة إلى ما يسمى `QuerySet`.

## QuerySet

يجب ان تكون مألوف مع طريقة عمل QuerySets ، لقد تكلمنا عنهم في [Django ORM (QuerySets) chapter](../django_orm/README.md).

لذا نريد الآن نشر مشاركات مدونة مرتبة حسب `published_date`، أليس كذلك؟ فعلنا ذلك بالفعل في فصل QuerySets!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

الآن نضع هذه القطعة من التعليمات البرمجية داخل الملف `blog/views.py` عن طريق إضافته إلى الدالة `def post_list(request)`، لكن لا تنسى لأول مرة إضافة `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

آخر جزء مفقود يمرر `posts` QuerySet إلى سياق القالب. لا تقلق -سوف نغطي كيفية عرضه في فصل لاحق.

يرجى ملاحظة أننا ننشئ *variable* لأعمالا QuerySet: `posts`.. عالج هذا كاسم QuerySet لدينا. من الآن فصاعدا يمكن أن نشير إليه بهذا الاسم.

في دالة `render` لدينا معلمة واحد `request`(كل شيء نتلقاه من المستخدم عبر شبكة الإنترنت) والأخرى تعطي ملف القالب (`'blog/post_list.html'`). المعلمة الأخيرة، `{}`، هو مكان الذي يمكن أن نضيف فيه بعض الأشياء للقالب المطلوب استخدامه. نحن بحاجة لإعطائهم أسماء (ونحن سوف تلتزم ب `'posts'` الآن). :) ينبغي أن تبدو مثل هذا: `{'posts': posts}`. يرجى ملاحظة أن الجزء قبل `:` سلسلة; تحتاج إلى الإلتفاف مع علامات اقتباس: `''`.

في النهاية ملف `blog/views.py` يجب اين يبدو مثل هذا:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

هذا كل شيء ، حان الوقت للعودة إلى قالبنا وإضهار QuerySet!

هل تريد قراءة المزيد حول QuerySets في جانغو ؟ يجب أن ننظر هنا: https://docs.djangoproject.com/en/1.11/ref/models/querysets/