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

جرب هذا في قالبك `blog/templates/blog/post_list.html`. Open it up in the code editor, and replace everything from the second `<div>` to the third `</div>` with `{{ posts }}`. قم بحفظ الملف، وقم بتحديث الصفحة لمشاهدة النتائج:

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
        <h2><a href="">{{ post.title }}</a></h2>
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
    

(Remember to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain, without the angle-brackets.)

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app. (To reach other PythonAnywhere pages from the console, use the menu button in the upper right corner.) Your update should be live on https://subdomain.pythonanywhere.com -- check it out in the browser! If the blog posts on your PythonAnywhere site don't match the posts appearing on the blog hosted on your local server, that's OK. The databases on your local computer and Python Anywhere don't sync with the rest of your files.

Congrats! Now go ahead and try adding a new post in your Django admin (remember to add published_date!) Make sure you are in the Django admin for your pythonanywhere site, https://subdomain.pythonanywhere.com/admin. Then refresh your page to see if the post appears there.

Works like a charm? We're proud! Step away from your computer for a bit – you have earned a break. :)

![Figure 13.4](images/donut.png)