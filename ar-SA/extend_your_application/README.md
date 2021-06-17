{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this code!" ></span>' %}

# توسيع التطبيق الخاص بك

لقد أكملنا بالفعل جميع الخطوات المختلفة اللازمة لإنشاء موقعنا على الويب: 

حان الوقت للتدريب!

أول شيء نحتاجه في مدونتنا هو، على الأرجح، صفحة لعرض مشاركة واحدة، أليس كذلك؟

لدينا بالفعل نموذج `Post` ، لذلك لا نحتاج إلى إضافة أي شيء إلى `models.py`.

## إنشاء رابط نموذج لتفاصيل المشاركة

سنبدأ بإضافة رابط داخل ملف `blog/templates/blog/post_list.html` افتحه في محرر التعليمات البرمجية، وحتى الآن يجب أن يبدوا هكذا: {% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <article class="post">
            <time class="date">
                {{ post.published_date }}
            </time>
            <h2><a href="">{{ post.title }}</a></h2>
            <p>{{ post.text|linebreaksbr }}</p>
        </article>
    {% endfor %}
{% endblock %}
```

{% raw %} نريد الحصول على رابط من عنوان المشاركة في قائمة المشاركات إلى صفحة تفاصيل المشاركة. دعونا نغير `<h2><a href="">{{ post.title }}</a></h2>` بحيث يربط صفحة تفاصيل المشاركة:{% endraw %}

{% filename %}{{ warning_icon }} blog/templates/blog/post_list.html{% endfilename %}

```html
<h2><a href="{% url 'post_detail' pk=post.pk %}">{{ post.title }}</a></h2>
```

{% raw %} حان الوقت لشرح `{% url 'post_detail' pk=post.pk %}`. كما قد تظن، فإن علامات `{% %}` تعني أننا نستخدم علامات قالب جانغو. هذه المرة سوف نستخدم واحدة منهم والتي ستقوم بإنشاء عنوان URL لنا!{% endraw %}

الجزء `post_detail` يعني أن جانغو سوف يتوقع عنوان URL في `blog/urls.py` مع name=post_detail.

وماذا عن `pk=post.pk`؟ `pk` هو اختصار للمفتاح الأساسي، وهو اسم فريد لكل سجل في قاعدة البيانات. كل نموذج جانغو لديه حقل يعمل كمفتاح رئيسي له، وأياً كان اسمه الآخر، فإنه يمكن أن يشار إليه أيضاً باسم "pk". ونظرا لأننا لم نحدد مفتاحا أساسيا في نموذج `Post`، فإن جانغو ينشئ واحدا لنا (بشكل افتراضي، هو حقل يسمى "id" يحتوي على رقم يزيد لكل سجل، أي 1 و 2 و 3) ويضيفه كحقل لكل واحدة من مشاركاتنا. نصل إلى المفتاح الأساسي من خلال كتابة `post.pk`، بنفس الطريقة التي نصل بها إلى الحقول الأخرى (`title`, `author`, etc.) في الكائن `Post`!

الآن عندما ننتقل إلى http://127.0.0.1:8000/ سيكون لدينا خطأ (كما هو متوقع، نظرا لأنه لا يوجد لدينا عنوان URL أو *view* ل `post_detail`). وسوف تبدو كما يلي:

![NoReverseMatch error](images/no_reverse_match2.png)

## إنشاء عنوان URL لتفاصيل المشاركة

لنقم بإنشاء عنوان URL في `urls.py` من أجل `post_detail` *view* الخاص بنا!

نريد عرض تفاصيل مشاركتنا الأولى في هذا الرابط ****: http://127.0.0.1:8000/post/1/

دعونا ننشئ عنوان URL في ملف `blog/urls.py` لتوجيه جانغو إلى *view* باسم `post_detail`، الذي سوف يعرض مشاركة بأكملها. افتح ملف `blog/urls.py` في محرر التعليمات البرمجية، وأضف السطر `path('post/<int:pk>/', views.post_detail, name='post_detail'),` بحيث يبدو الملف كهذا:

{% filename %}{{ warning_icon }} blog/urls.py{% endfilename %}

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.post_list, name='post_list'),
    path('post/<int:pk>/', views.post_detail, name='post_detail'),
]
```

يحدد هذا الجزء `post/<int:pk>/` نمط عنوان URL - وسوف نشرحه لك:

- `post/` يعني أن عنوان URL يجب أن يبدأ بكلمة **post** يتبعه **/**. حتى الآن كل شيء جيد.
- `<int:pk>` - هذا الجزء أكثر صعوبة. وهو يعني أن جانغو يتوقع قيمة صحيحة وسيقوم بتحويلها إلى عرض كمتغير يسمى `pk`.
- `/` - ثم نحتاج إلى **/** مرة أخرى قبل الانتهاء من عنوان URL.

هذا يعني إذا قمت بإدخال `http://127.0.0.1:8000/post/5/` في المتصفح، جانغو سيفهم أنك تبحث عن *view* يسمى `post_detail` وسينقل معلومة أن `pk` تساوي `5` إلى ذلك الـ *view*.

حسنا، لقد أضفنا نمط عنوان URL جديد إلى `blog/urls.py`! دعونا نقم بتحديث الصفحة http://127.0.0.1:8000/ بوم! توقف الخادم عن العمل مرة أخرى. ألقي نظرة على وحدة التحكم – كما هو متوقع، هناك خطأ آخر!

![AttributeError](images/attribute_error2.png)

هل تذكر ما الخطوة التالية؟ إنها إضافة طريقة عرض!

## إضافة مشاركة لعرض التفاصيل

هذه المرة *view* الخاص بنا يُعطى معلمة إضافية، `pk`. الـ *view* الخاص بنا يحتاج إلى الإمساك به، أليس كذلك؟ لذلك سنقوم بتعريف وظيفتنا كـ `def post_detail(request, pk):`. لاحظ أن هذا العامل يجب أن يكون له نفس الاسم بالضبط الذي حددناه في `urls` (`pk`). لاحظ أيضا أن حذف هذا المتغير غير صحيح وسوف يؤدي إلى خطأ!

الآن، نريد أن نحصل على مشاركة مدونة واحدة فقط. للقيام بذلك، يمكننا استخدام مجموعات الاستعلامات، مثل هذا:

{% filename %}{{ warning_icon }} blog/views.py{% endfilename %}

```python
Post.objects.get(pk=pk)Post.objects.get(pk=pk)
```

ولكن توجد مشكلة في التعليمات البرمجية هذه. إذا لم يكن هناك `Post` مع الـ `primary key` (`pk`) المُعطى سيكون لدينا خطأ قبيح جداً!

![DoesNotExist error](images/does_not_exist2.png)

نحن لا نريد ذلك! لكن لحسن الحظ جانغو يأتي مع شيء سوف يتعامل مع ذلك لنا: `get_object_or_404`. في حالة عدم وجود `Post` مع `pk` المعطى، سيتم عرض صفحة أفضل بكثير، صفحة `Page Not Found 404`.

![Page not found](images/404_2.png)

الخبر الجيد هو أنه يمكنك في الواقع إنشاء صفحة `Page not found` الخاصة بك وجعلها جميلة كما تريد. لكنها ليست مهمة جداً الآن، لذلك سنتخطى ذلك.

طيب، حان الوقت لإضافة *view* لملف `views.py` لدينا!

In `blog/urls.py` we created a URL rule named `post_detail` that refers to a view called `views.post_detail`. This means that Django will be expecting a view function called `post_detail` inside `blog/views.py`.

We should open `blog/views.py` in the code editor and add the following code near the other `from` lines:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render, get_object_or_404
```

And at the end of the file we will add our *view*:

{% filename %}blog/views.py{% endfilename %}

```python
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})
```

Yes. It is time to refresh the page: http://127.0.0.1:8000/

![Post list view](images/post_list2.png)

It worked! But what happens when you click a link in blog post title?

![TemplateDoesNotExist error](images/template_does_not_exist2.png)

Oh no! Another error! But we already know how to deal with it, right? We need to add a template!

## إنشاء قالب لتفاصيل المشاركة

We will create a file in `blog/templates/blog` called `post_detail.html`, and open it in the code editor.

Enter the following code:

{% filename %}blog/templates/blog/post_detail.html{% endfilename %}

```html
{% extends 'blog/base.html' %}

{% block content %}
    <article class="post">
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

Once again we are extending `base.html`. In the `content` block we want to display a post's published_date (if it exists), title and text. But we should discuss some important things, right?

{% raw %}`{% if ... %} ... {% endif %}` is a template tag we can use when we want to check something. (Remember `if ... else ...` from **Introduction to Python** chapter?) In this scenario we want to check if a post's `published_date` is not empty.{% endraw %}

OK, we can refresh our page and see if `TemplateDoesNotExist` is gone now.

![Post detail page](images/post_detail2.png)

Yay! It works!

# Deploy time!

It'd be good to see if your website still works on PythonAnywhere, right? Let's try deploying again.

{% filename %}command-line{% endfilename %}

    $ git status
    $ git add .
    $ git status
    $ git commit -m "Added view and template for detailed blog post as well as CSS for the site."
    $ git push
    

Then, in a [PythonAnywhere Bash console](https://www.pythonanywhere.com/consoles/):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

## Updating the static files on the server

Servers like PythonAnywhere like to treat "static files" (like CSS files) differently from Python files, because they can optimise for them to be loaded faster. As a result, whenever we make changes to our CSS files, we need to run an extra command on the server to tell it to update them. The command is called `collectstatic`.

Start by activating your virtualenv if it's not still active from earlier (PythonAnywhere uses a command called `workon` to do this, it's just like the `source myenv/bin/activate` command you use on your own computer):

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ workon <your-pythonanywhere-domain>.pythonanywhere.com
    (ola.pythonanywhere.com)$ python manage.py collectstatic
    [...]
    

The `manage.py collectstatic` command is a bit like `manage.py migrate`. We make some changes to our code, and then we tell Django to *apply* those changes, either to the server's collection of static files, or to the database.

In any case, we're now ready to hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) (from the menu button in the upper right of the console) and hit **Reload**, and then look at the https://subdomain.pythonanywhere.com page to see the result.

And that should be it. Congrats! :)