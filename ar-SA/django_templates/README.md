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

جرب هذا في قالبك `blog/templates/blog/post_list.html`. قم بفتحه في محرر التعليمات البرمجية، واستبدل كل شي من `<div>` الثاني إلى `</div>` الثالث بـ `{{ posts }}`. قم بحفظ الملف، وقم بتحديث الصفحة لمشاهدة النتائج:

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
<header>
    <h1><a href="/">Django Girls Blog</a></h1>
</header>

{% for post in posts %}
    <article>
        <time>published: {{ post.published_date }}</time>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </article>
{% endfor %}
```

{% raw %} كل شيء تضعه بين `{% for %}` و `{% endfor %}` سوف يتكرر لكل كائن في القائمة. حدث الصفحة:{% endraw %}

![الرقم 13.3](images/step3.png)

هل لاحظت أننا استخدمنا تدوين مختلف قليلا هذه المرة (`{{ post.title }}` او `{{ post.text }})`؟ يمكننا الوصول إلى البيانات في كل حقل من الحقول المعرفة في نموذج `Post`. ايضا `|linebreaksbr` يربط نص المشاركات من خلال مرشح لتحويل فواصل الأسطر إلى فقرات.

## شيء واحد آخر

سيكون جيدا معرفة ما إذا كان موقع الويب الخاص بك لا يزال يعمل على شبكة الإنترنت العامة، اليس كذالك؟ دعونا نحاول نشره في PythonAnywhere مرة أخرى. هنا خلاصة للخطوات…

* أولاً، ادفع التعليمات البرمجية الخاصة بك إلى Github

{% filename %}command-line{% endfilename %}

    $ git status
    [...]
    $ git add .
    $ git status
    [...]
    $ git commit -m "Modified templates to display posts from database."
    [...]
    $ git push
    

* افتح [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) واذهب الى **Bash console** او افتح واحدة جديدة وشغل هذا الأمر:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd <your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

(تذكر أن تستبدل `<your-pythonanywhere-domain>` بالمجال الفرعي لـ PythonAnywhere الفعلي، بدون أقواس الزاوية. )

* وأخيراً، انتقل إلى ["Web" page](https://www.pythonanywhere.com/web_app_setup/) واضغط على **Reload** في تطبيق الويب الخاص بك. (للوصول إلى صفحات PythonAnywhere الأخرى من وحدة التحكم ، استخدم زر القائمة في الزاوية اليمنى العلوية. يجب أن يكون تحديثك مباشرًا على https://subdomain.pythonanywhere.com -- تحقق من ذلك في المتصفح! إذا كانت مشاركات المدونة على موقع PythonAnywhere لا تتطابق مع المشاركات التي تظهر على المدونة المستضافة على الخادم المحلي، فلا بأس بذالك. قواعد البيانات على جهاز الكمبيوتر المحلي وبايثون في أي مكان لا يتزامنان مع بقية الملفات الخاصة بك.

تهانينا! الآن امضي قدما وحاول إضافة مشاركة جديدة عبر إدارة جانغو الخاصة بك (تذكر من إضافة published_date!) تأكد من أنك في صفحة المشرف لجانغو لموقع pythonanywhere الخاص بك، https://subdomain.pythonanywhere.com/admin. ثم حدث الصفحة لمعرفة ما إذا كانت المشاركة تظهر هناك أم لا.

تعمل مثل السحر؟ نحن فخورون! ابتعدوا قليلا عن جهاز الكمبيوتر الخاص بك - لقد حصلت على استراحة. :)

![الشكل 13.4](images/donut.png)