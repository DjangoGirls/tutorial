# روابط جانغو

نحن على وشك بناء صفحتنا الأولى على الإنترنت: الصفحة الرئيسية لمدونتك! ولكن أولاً، دعونا نتعلم قليلاً عن "روابط مواقع جانغو".

## ما هو الرابط (URL) ؟

ببساطة الرابط (URL) هو عنوان صفحة الويب. يمكنك أن ترى عنوان الرابط (URL) في كل مرة تقوم بزيارة الموقع على شبكة الإنترنت --إنها مرئية في شريط العناوين في المتصفح الخاص بك. (نعم! `127.0.0.1:8000` هو عنوان الرابط (URL)! و `https://djangogirls.org` أيضا الرابط (URL))

![URL](images/url.png)

كل صفحة على شبكة الإنترنت تحتاج إلى عنوان رابط (URL) خاص بها. بهذه الطريقة يستطيع تطبيقك ان يعلم ماذا يفتح للمستخدم الذي فتح الرابط. في جانغو نستخدم ما يسمى `URLconf` (URL configuration). URLconf هو مجموعة من الأنماط التي ستحاول جانغو مطابقتها مع عنوان URL المطلوب للعثور على طريقة العرض الصحيح.

## كيف تعمل عناوين Url في جانغو؟

دعونا نفتح الملف `mysite/urls.py` في محرر التعليمات البرمجية الخاصة بك للاختيار ونرى ما يبدو عليه:

{% filename %}mysite/urls.py{% endfilename %}

```python
"""mysite URL Configuration

[...]
"""
from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]
```

كما ترون، جانغو قد وضعت بالفعل شيء هنا بالنسبة لنا.

الخطوط بين علامات الاقتباس الثلاثي (`'' '` أو `"""`) تسمى docstrings – ييمكنك كتابتها في أعلى ملف أو فئة أو طريقة لوصف ما يفعله. هي لا تعمل عبر بايثون.

عنوان URL المشرف، الذي زرته في الفصل السابق، موجود هنا:

{% filename %}mysite/urls.py{% endfilename %}

```python
    path('admin/', admin.site.urls),
```

هذا السطر يعني أن لكل عنوان URL الذي يبدأ ب `admin/`، سوف تجد جانغو مقابله *view*. في هذه الحالة نحن ، نضع الكثير من روابط المدير ، لذالك هي ليست مجموعة كلها في هذا الملف الصغير ، انها اكثر قابلية للقراءة وانضف.

## رابط جانغو الأول الخاص بك!

حان الوقت لإنشاء أول عنوان URL لنا! نريد 'http://127.0.0.1:8000/' أن تكون الصفحة الرئيسية لمدونتنا وأن تعرض قائمة من المشاركات.

نريد أيضا الاحتفاظ بالملف `mysite/urls.py` نظيف، حيث أننا سوف نسترد عناوين Url من تطبيق `blog` لدينا إلى الملف الرئيسي `mysite/urls.py`.

امضي قدما ، واضف السطر الذي سيسترد `blog.urls`. ستحتاج أيضاً إلى تغيير السطر `from django.urls…` لأننا نستخدم الدالة `include` هنا، لذا ستحتاج إلى إضافة ذلك الاستيراد إلى السطر.

ملف `mysite/urls.py` الخاص بك يجب أن يبدو مثل هذا:

{% filename %}mysite/urls.py{% endfilename %}

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
]
```

جانغو سيقوم الآن بإعادة توجيه كل ما يأتي إلى 'http://127.0.0.1:8000/' إلى `blog.urls` والبحث عن المزيد من التعليمات هناك.

## blog.urls

قم بإنشاء ملف فارغ جديد يسمى `urls.py` في الدليل `blog`، وقم بفتحه في محرر الكود. حسنًا! أضف هذين السطرين الأوليين:

{% filename %}blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views
```

Here we're importing Django's function `path` and all of our `views` from the `blog` application. (We don't have any yet, but we will get to that in a minute!)

After that, we can add our first URL pattern:

{% filename %}blog/urls.py{% endfilename %}

```python
urlpatterns = [
    path('', views.post_list, name='post_list'),
]
```

As you can see, we're now assigning a `view` called `post_list` to the root URL. This URL pattern will match an empty string and the Django URL resolver will ignore the domain name (i.e., http://127.0.0.1:8000/) that prefixes the full URL path. This pattern will tell Django that `views.post_list` is the right place to go if someone enters your website at the 'http://127.0.0.1:8000/' address.

The last part, `name='post_list'`, is the name of the URL that will be used to identify the view. This can be the same as the name of the view but it can also be something completely different. We will be using the named URLs later in the project, so it is important to name each URL in the app. We should also try to keep the names of URLs unique and easy to remember.

If you try to visit http://127.0.0.1:8000/ now, then you'll find some sort of 'web page not available' message. This is because the server (remember typing `runserver`?) is no longer running. Take a look at your server console window to find out why.

![Error](images/error1.png)

Your console is showing an error, but don't worry – it's actually pretty useful: It's telling you that there is **no attribute 'post_list'**. That's the name of the *view* that Django is trying to find and use, but we haven't created it yet. At this stage, your `/admin/` will also not work. No worries – we will get there. If you see a different error message, try restarting your web server. To do that, in the console window that is running the web server, stop it by pressing Ctrl+C (the Control and C keys together). On Windows, you might have to press Ctrl+Break. Then you need to restart the web server by running a `python manage.py runserver` command.

> If you want to know more about Django URLconfs, look at the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/urls/