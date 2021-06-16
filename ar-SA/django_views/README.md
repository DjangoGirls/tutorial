# وجهات نظر جانغو -وقت الإنشاء!

حان الوقت للتخلص من الشوائب التي انشأناها في الفصل الأخير! :)

*view* هو المكان الذي وضعنا فيه المنطق الخاص بتطبيقنا. وسوف تطلب معلومات من `model` قمت بإنشائها من قبل وتمريرها إلى `template`. سوف ننشئ قالب في الفصل التالي. وجهات النظر هي مجرد وظائف بيثون والتي هي اكثر تعقيد قليلا من التي قمنا بكتابتها في هذا الفصل **مقدمة بيثون**.

Views توضع في الملف `views.py`. وسوف نضيف *views* الخاصة بنا الى `blog/views.py`.

## blog/views.py

حسنًا، دعونا نفتح هذا الملف في محرر التعليمات البرمجية الخاص بنا ونرى ما هو هناك:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

ليس هناك كثيرا من الأشياء هنا حتى الآن.

تدكر ان الأسطر التي تبدأ ب`#` هي مجرد تعليقات وهذا يعني انها لن يتم استخدامها عبر بايثون.

دعونا ننشء *view * كما يوحي التعليق. أضف الأسطر التالية أدناه:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

As you can see, we created a function (`def`) called `post_list` that takes `request` and will `return` the value it gets from calling another function `render` that will render (put together) our template `blog/post_list.html`.

قم بحفظ الملف، انتقل إلى http://127.0.0.1:8000/وانظر ماذا لدينا.

خطأ آخر! اقرأ ما يجري الآن:

![خطأ](images/error.png)

هذا يبين أن الملقم قيد التشغيل مرة أخرى، على الأقل، ولكن لا يزال يبدو وكأنه ليس على ما يرام أليس كذالك؟ لا تقلق، انها مجرد صفحة خطأ، لا تخف! تماما مثل رسائل الخطأ في وحدة التحكم، هذه في الواقع مفيدة جدا. يمكن أن تقرأ أن*TemplateDoesNotExist*. دعونا نصلح هذا الخطأ وننشئ قالب في الفصل التالي!

> Learn more about Django views by reading the official documentation: https://docs.djangoproject.com/en/2.2/topics/http/views/