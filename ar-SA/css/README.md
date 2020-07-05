# اجعله جميلا بإستخدام CSS!

مدونتنا لا تزال تبدو قبيحة نوعاً ما، أليس كذلك؟ حان الوقت لجعلها جميلة! سوف نجعلها جميلة بإستخدام CSS.

## ما هي تقنية CSS؟

CSS هي لغة تجميل المواقع, تخيل HTML هي هيكل المنزل يعني الحائط و السارية و السقف و CSS هي الصباغة و الصقل والديكور... و ما إلى ذلك , يعني مثل المكياج 

لكننا لا نريد أن نبدأ من الصفر مرة أخرى، أليس كذلك؟ مرة أخرى، سنستخدم شيئا خلقه المبرمجون على الإنترنت مجانا. إعادة اختراع العجلة ليس ممتعا، كما تعلمون.

## لنستخدم Bootstrap!

Bootstrap اطار عمل الأكثر شعبية لـ HTML و CSS لتطوير مواقع جميلة: https://getbootstrap.com/

كتب بواسطة المبرمجين الذين عملوا على تويتر والآن يتم تطويره من قبل المتطوعين من جميع أنحاء العالم!

## تثبيت Bootstrap

لتحميل Bootstrap ، افتح ملف `.html` خاصتك في محرر الكود وأضف هذا في جزء `<head>`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
```

هذا لا يضيف أي ملفات إلى المشروع الخاص بك. بل يشير فقط إلى الملفات الموجودة على شبكة الإنترنت. افتح موقع الويب الخاص بك وقم بتحديث الصفحة. لاحظت الفرق!

![الرقم 14.1](images/bootstrap1.png)

يبدو اجمل الان!

## الملفات الثابتة في Django

اخيراً سوف نمعن بالنظر على ما اسميناه **بالملفات الثابتة**. الملفات الثابتة هي كل CSS والصور. محتواهم لا يعتمد على خاصية الطلب وسيكون مشابها عند الجميع.

### اين توضع الملفات الثابتة لمشروع Django

جانغو عرف مسبقا أين يجد الملفات الثابتة للتطبيق المضمن "admin". الان لايلزمنا سوى اضافة بعض الملفات الثابتة للتطبيق الخاص بنا,`blog`.

نقوم بذلك بانشاء مجلد نسميه `static` داخل تطبيق المدونة:

    djangogirls
    ├── blog
    │   ├── migrations
    │   ├── static
    │   └── templates
    └── mysite
    

جانغو سيجد تلقائيا أي مجلد باسم "static" داخل اي مجلد يحتويه تطبيقك. وسيستطيع استعمال محتوياته كملفات ثابتة.

## الأن مع ملفات CSS

لنقم بانشاء ملف نمطي CSS. لتظيف تعديلاتك الخاصة لموقعك. قم بانشاء مجلد باسم `css` داخل مجلد `static`. قم بانشاء ملف باسم `blog.css` داخل المجلد `css`. مستعد ؟

    djangogirls
    └─── blog
         └─── static
              └─── css
                   └─── blog.css
    

حان الوقت للقيام بكتابة بعض CSS,قم بفتح الملف `blog/static/css/blog.css` داخل المحرر.

لن نذهب عميقاً في تخصيص وتعلم CSS هنا. هناك توصية بدورة CSS مجانية في نهاية هذه الصفحة إذا كنت ترغب في معرفة المزيد.

لكن لنقم بالقليل على الاقل. ربما نريد تغيير لون الترويسة؟ لفهم الالوان, الحاسوب يستعمل شيفرات خاصة. الشيفرات تبتدأ ب `#` و تليها 6 حروف (A-F) و أرقام (0-9). مثلا ، رمز اللون الأزرق هو `#0000FF`. يمكنك العثور على هذه الشيفرات في هذا الموقع: http://www.colorpicker.com/. يمكنك استعمال الالوان المحددة مسبقا ك `red` و `green`.

داخل الملف `blog/static/css/blog.css` يجب عليك اضافة التعليمات البرمجية التالية:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #FF8833;
}

```

`h1 a` هو محدد CSS. وهذا يعني أننا تقوم بتطبيق أنماط لدينا إلى أي عنصر من عناصر `a` داخل عنصر `h1`؛ محدد `h2 a` يفعل الشيء نفسه لعناصر `h2`. حتى عندما يكون لدينا شيء مثل `<h1><a href="">link</a></h1>`، `h1` سيتم تطبيق النمط. في هذه الحالة نأمرها بتغيير الون الى `#Fca205`, وهو اللون البرتقالي الداكن. أو يمكنك وضع اللون الذي تريده هنا، ولكن تأكد من تباين هذا اللون عن الخلفية البيضاء!

داخل ملف CSS نحدد أنماط العناصر التي توجد داخل ملف HTML. الطريقة الأولى التي نستخدمها لتحديد العناصر هي عبر الإسم. يمكن أن تذكر هذه tags من قسم HTML. أشياء مثل`a`, `h1` و `body` هي كلها امثلة لأسماء العناصر. نحن نحدد العناصر ايضا عبر `class` او عبر `id`. Class و id هي الأسماء التي يمكنك إعطائها للعنصر بنفسك. تحدد class مجموعات من العناصر، و id تشير إلى عناصر محددة. على سبيل المثال، يمكن تحديد tag التالية باستخدام سمة `a`, المصنف `external_link` (class), أو المعرف `link_to_wiki_page` (id):

```html
<a href="https://en.wikipedia.org/wiki/Django" class="external_link" id="link_to_wiki_page">
```

اقرأ عن [محددات CSS في w3schools](http://www.w3schools.com/cssref/css_selectors.asp).

نحن بحاجة إلى أن نقول أيضا لقالب HTML أننا أضفنا بعض ال CSS. افتح الملف `blog/templates/blog/post_list.html` في محرر الأكواد وأضف هذا السطر في البداية:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
```

نحن فقط نحمل الملفات الثابتة هنا ما بين علامات `<head>` و `</head>` بعد الارتباطات بملفات بوتستراب CSS ، قم بإضافة هذا السطر:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link rel="stylesheet" href="{% static 'css/blog.css' %}">
```

المتصفح يقرأ الأوامر بالترتيب الذي اعطي له ، لذا يجب علينا التأكد من ان هذا في المكان الصحيح. وإلا فإن الكود في الملف الخاص بك قد يتم تجاوزه بواسطة الكود في ملفات بوتستراب. قمنا لتونا بإعلام القالب أين توجد ملفات التنسيق CSS.

الآن يجب أن يبدو الملف الخاص بك مثل هذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% load static %}
<html>
    <head>
        <title>Django Girls blog</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="{% static 'css/blog.css' %}">
    </head>
    <body>
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
    </body>
</html>
```

حسنا، قم بحفظ الملف وقم بتحديث الموقع!

![الرقم 14.2](images/color2.png)

عمل جيد! ربما نود أيضا إعطاء موقعنا متنفس وزيادة الهامش على الجانب الأيسر؟ دعونا نحاول هذا!

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
body {
    padding-left: 15px;
}
```

قم بإضافة التعديل أعلاه لملف التنسيق CSS, احفض الملف و أنظر النتيجة!

![الرقم 14.3](images/margin2.png)

ربما يمكننا تخصيص الخط في عنوان الصفحة لدينا؟ ألصق هذا `< header >` في ملف `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<link href="//fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
```

كما من قبل، تحقق من الأمر والمكان قبل الارتباط بـ `blog/static/css/blog.css`. هذا السطر سيطلب خط يسمى *Lobster* من "خطوط جوجل " (https://www.google.com/fonts).

أعثر على `h1` إعلان كتلة (التعليمات البرمجية بين الأقواس `{` `}`) في ملف CSS `blog/static/css/blog.css`. الآن قم بإضافة السطر `font-family: 'Lobster';` بين أقواس، وحدث الصفحة:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
h1 a, h2 a {
    color: #C25100;
    font-family: 'Lobster';
}
```

![الرقم 14.3](images/font.png)

عظيم!

كما ذكر أعلاه، CSS لديها مفهوم طبقات. هذه تسمح لك بتسمية جزء من التعليمات البرمجية ل HTML وتطبيق الأنماط فقط لهذا الجزء، دون التأثير على الأجزاء الأخرى. هذا يمكن ان يكون مفيد جدا! ربما يكون لديك اثنين من divs اللذان يقومان بشيء مختلف (مثل الهيدر او الموضوع الخاص بك). الكلآس يمكن اي يساعدك في جعلها تبدو مختلفة.

أمضي قدما وقم بتسمية بعض أجزاء من التعليمات البرمجية ل HTML. إضافة فئة تدعي `page-header` إلى `div` الذي يحتوي الهيدر الخاص بك ، مثل هذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="page-header">
    <h1><a href="/">Django Girls Blog</a></h1>
</div>
```

الان أضف Class `post` إلى `div` الذي يحتوي مقالات المدونة.

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="post">
    <p>published: {{ post.published_date }}</p>
    <h2><a href="">{{ post.title }}</a></h2>
    <p>{{ post.text|linebreaksbr }}</p>
</div>
```

سنقوم الآن بإضافة كتل إعلان لمحددات مختلفة. المحددات التي تبدأ ب `.` تتعلق بالفصول. هناك العديد من الدروس والشروحات التي تتكلم عن CSS في الأنترنت والتي يمكنها مساعدتك على فهم الأكواد التالية. الآن، فقط قم بنسخ ولصق في ملف `blog/static/css/blog.css` خاصتك:

{% filename %}blog/static/css/blog.css{% endfilename %}

```css
.page-header {
    background-color: #C25100;
    margin-top: 0;
    padding: 20px 20px 20px 40px;
}

.page-header h1, .page-header h1 a, .page-header h1 a:visited, .page-header h1 a:active {
    color: #ffffff;
    font-size: 36pt;
    text-decoration: none;
}

.content {
    margin-left: 40px;
}

h1, h2, h3, h4 {
    font-family: 'Lobster', cursive;
}

.date {
    color: #828282;
}

.save {
    float: right;
}

.post-form textarea, .post-form input {
    width: 100%;
}

.top-menu, .top-menu:hover, .top-menu:visited {
    color: #ffffff;
    float: right;
    font-size: 26pt;
    margin-right: 20px;
}

.post {
    margin-bottom: 70px;
}

.post h2 a, .post h2 a:visited {
    color: #000000;
}
```

تم قم بإحاطة تعليمات HTML التي تظهر المقالات:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
{% for post in posts %}
    <div class="post">
        <p>published: {{ post.published_date }}</p>
        <h2><a href="">{{ post.title }}</a></h2>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
```

في `blog/templates/blog/post_list.html` بهذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<div class="content container">
    <div class="row">
        <div class="col-md-8">
            {% for post in posts %}
                <div class="post">
                    <div class="date">
                        <p>published: {{ post.published_date }}</p>
                    </div>
                    <h2><a href="">{{ post.title }}</a></h2>
                    <p>{{ post.text|linebreaksbr }}</p>
                </div>
            {% endfor %}
        </div>
    </div>
</div>
```

إحفظ الملفات الأن، وقم بتحديث موقع الويب الخاص بك.

![الرقم 14.4](images/final.png)

وووهووو! يبدو رائعا أليس كذالك؟ انظر إلى التعليمات البرمجية التي ألصقناها للتو للعثور على الأماكن التي أضفنا فيها كلاسات في HTML واستخدمناها في CSS. أين يمكن عمل تعديل ان اردت للوقت ان يكون turquoise؟

لا تخافوا من العبث مع هذه CSS قليلا ومحاولة تغيير بعض الأشياء. اللعب ب CSS يمكن أن يساعدك على فهم ما تقوم به الأشياء المختلفة. إذا كسرت شيء لا تقلق يمكنك اصلاحه دائما!

نوصي بشدة بالدورات التدريبية المجانية أونلاين "Basic HTML & HTML5" و "Basic CSS" في [freeCodeCamp](https://learn.freecodecamp.org/). يمكن أن تساعدك على تعلم كل شيء عن جعل مواقعك أجمل باستخدام HTML و CSS.

جاهز للفصل التالي؟! :)