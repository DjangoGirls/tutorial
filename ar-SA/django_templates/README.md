# قوالب دجانغو

حان الوقت لكي نظهر بعض المعلومات! جانغو يعطينا بعضا من شعارات القوالب المفيدة المثبتة فية.

## ما هي شعارات القوالب؟

كما تعرف في لغة الHTML لا يمكنك كتابة كود مكتوب بلغة Python وذلك لأن متصفحات الانترنت لا تفهمة. المتصفحات تفهم الHTML فقط. نحن نعلم أن الHTML نوعا ما جامدة لكن الPython أكثر ديناميكية.

**Django template tags** تسمح لنا بنقل أشياء مثل بيثون إلى HTML، حتى نتمكن من بناء مواقع ديناميكية بشكل أسرع. رائع!

## عرض قالب قائمة المشاركات

في الفصل السابق، قدمنا لقالبنا قائمة بالمشاركات في متغير `posts`. الآن سوف نقوم بعرضه في HTML.

لطباعة متغير في قوالب جانغو، نحن نستخدم أقواس مزدوجة مع اسم المتغير في الداخل، هكذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{{ posts }}
```

جرب هذا في قالبك `blog/templates/blog/post_list.html`. استبدل كل شيء من `<div>` الثاني الى `</div>` الثالت ب `{{ posts }}`. قم بحفظ الملف، وقم بتحديث الصفحة لمشاهدة النتائج:

![الرقم 13.1](images/step1.png)

كما ترون، كل ما لدينا هو هذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<QuerySet [<Post: My second post>, <Post: My first post>]>
```

هذا يعني أن جانغو يفهم ذلك كقائمة من الكائنات. هل تتذكر من **Introduction to Python** كيف نضهر القوائم؟ نعم، مع حلقات! في قالب جانغو يمكنك القيام بها هكذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    {{ post }}
{% endfor %}
```

جرب هذا في قالبك.

![الرقم 13.2](images/step2.png)

إنه كان مجديًا! ولكننا نريد أن يتم عرض المشاركات مثل المشاركات الثابتة التي أنشأناها سابقا في فصل **مقدمة إلى HTML**. يمكنك خلط علامات HTML والقالب. `body` سيبدو هكذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

{% raw %} كل شيء تضعه بين `{% for %}` و `{% endfor %}` سوف يتكرر لكل كائن في القائمة. حدث الصفحة:{% endraw %}

![الرقم 13.3](images/step3.png)

هل لاحظت أننا استخدمنا تدوين مختلف قليلا هذه المرة (`{{ post.title }}` او `{{ post.text }})`؟ يمكننا الوصول إلى البيانات في كل حقل من الحقول المعرفة في نموذج `Post`. ايضا `|linebreaksbr` يربط نص المشاركات من خلال مرشح لتحويل فواصل الأسطر إلى فقرات.

## شيء واحد آخر

سيكون جيدا معرفة ما إذا كان موقع الويب الخاص بك لا يزال يعمل على شبكة الإنترنت العامة، اليس كذالك؟ دعونا نحاول نشره في PythonAnywhere مرة أخرى. هنا خلاصة للخطوات…

* First, push your code to GitHub

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add --all .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* افتح [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) واذهب الى **Bash console** او افتح واحدة جديدة وشغل هذا الأمر:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd $USER.pythonanywhere.com
    $ git pull
    [...]
    

* وأخيرا، انتقل إلى علامة التبويب [Web tab](https://www.pythonanywhere.com/web_app_setup/) واضغط على **Reload**. على تطبيق الويب. يجب أن يكون التحديث مباشر! إذا كانت مشاركات المدونة على موقع PythonAnywhere لا تتطابق مع المشاركات التي تظهر على المدونة المستضافة على الخادم المحلي، فلا بأس بذالك. قواعد البيانات على جهاز الكمبيوتر المحلي وبايثون في أي مكان لا يتزامنان مع بقية الملفات الخاصة بك.

مبروك! الآن امضي قدما وحاول إضافة مشاركة جديدة عبر إدارة جانغو الخاصة بك (تذكر لإضافة publication_date!) تأكد من أنك في إدارة جانغو لموقع pythonanywhere الخاص بك، https://yourname.pythonanywhere.com/admin. ثم حدث الصفحة لمعرفة ما إذا كانت المشاركة تظهر هناك أم لا.

تعمل كالحصان ! نحن فخورون بك ، ابتعد قليلا عن الحاسوب الخاص بك ، انت تستحق استراحة

![الرقم 13.4](images/donut.png)