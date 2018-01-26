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

Please note that we create a *variable* for our QuerySet: `posts`. Treat this as the name of our QuerySet. From now on we can refer to it by this name.

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. We need to give them names (we will stick to `'posts'` right now). :) It should look like this: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

So finally our `blog/views.py` file should look like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

That's it! Time to go back to our template and display this QuerySet!

هل تريد قراءة المزيد حول QuerySets في جانغو ؟ يجب أن ننظر هنا: https://docs.djangoproject.com/en/1.11/ref/models/querysets/