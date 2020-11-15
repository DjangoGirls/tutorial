# مقدمة إلى HTML

قد تسأل ما هو القالب؟

القالب هو ملف يمكننا إعادة استخدامه لتقديم معلومات مختلفة بتنسيق ثابت - على سبيل المثال، يمكنك استخدام قالب لمساعدتك على كتابة رسالة، على الرغم من أن كل رسالة قد تحتوي على مضمون مختلف ويتم توجيهها إلى شخص مختلف ، باستعمال القالب ستظهر بفس الشكل.

تم وصف تنسيق قالب جانغو في لغة تسمى HTML (وهذا هو ال HTML التي ذكرناها في الفصل الأول،**How the Internet works**).

## ما هي HTML؟

HTML هو رمز يتم تفسيره بواسطة متصفح الويب - مثل كروم أو فايرفوكس أو سفاري - لعرض صفحة ويب للمستخدم.

نقصد ب HTML "HyperText Markup Language". **HyperText** هو نص يعتمد على الإرتباطات التشعبية بين الصفحات. **Markup** يعني أننا اتخذنا وثيقة ووضعنا علامة عليها مع رمز لنقول ل (في هذه الحالة، متصفح) كيفية تفسير الصفحة. تم إنشاء شفرة HTML باستخدام علامات **tags**، حيث يبدأ كل منها باستخدام `<` وينتهي ب `>`. تمثل هذه العلامات علامات **elements**.

## قالبك الأول!

إنشاء قالب يعني إنشاء ملف قالب. كل شيء هو ملف، هو؟ ربما كنت قد لاحظت هذا بالفعل.

يتم حفظ قوالب في `blog/templates/blog` الدليل. لذا أولاً أنشئ دليل يسمى `templates` داخل دليل المدونة الخاص بك. قم بإنشاء دليل آخر يسمى `blog` داخل دليل القوالب الخاصة بك:

    blog
    └───templates
        └───blog
    

(You might wonder why we need two directories both called `blog` – as you will discover later, this is a useful naming convention that makes life easier when things start to get more complicated.)

والآن قم بإنشاء ملف `post_list.html` (فقط اتركه فارغاً للآن) داخل دليل `blog/templates/blog`.

انظر كيف يبدو موقع الويب الخاص بك الآن: http://127.0.0.1:8000/

> إذا كان لا يزال لديك خطأ `TemplateDoesNotExist`,، حاول إعادة تشغيل الخادم الخاص بك. انتقل الى سطر الأوامر حاول ايقاف الخادم (بالضغط على Ctrl+C - مفتاح التحكم و C معا) وإعادة تشغيله من خلال الأمر ` python manage.py runserver `.

![الرقم 11.1](images/step1.png)

لا يوجد خطأ بعد الآن! تهاني:) ومع ذلك، موقع الويب الخاص بك لم ينشر أي شيء ما عدا صفحة فارغة، نظراً لأن القالب فارغ . نحن بحاجة إلى إصلاح ذلك.

Open the new file in the code editor, and add the following:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
<body>
    <p>Hi there!</p>
    <p>It works!</p>
</body>
</html>
```

كيف يبدو موقعك الآن؟ يرجى زيارة الموقع لمعرفة ذالك: http://127.0.0.1:8000/

![الرقم 11.2](images/step3.png)

إنه كان مجديًا! لقد قمت بعمل جيد هناك:)

* إن العلامة الأساسية، `<html>`، هي دائما بداية أي صفحة ويب و `</html>` هي دائما النهاية. كما ترون، يذهب كامل محتوى الموقع بين بداية الوسم `<html>`وعلامة إغلاق `</html>`
* `<p>`علامة لعناصر الفقرة؛ `</p>` يغلق كل فقرة

## الرأس والجسم

كل صفحة HTML تنقسم إلى عنصرين هما **head** و **body**.

* **head** هو عنصر يحتوي على معلومات حول المستند الذي لا يتم عرضه على الشاشة.

* **body** هو عنصر يحتوي على كل شيء يتم عرضه كجزء من صفحة ويب.

نحن نستخدم `<head>` لإخبار المتصفح عن إعدادات الصفحة، و `<body>` ليقول ما هو موجود فعلا في الصفحة.

على سبيل المثال، يمكنك وضع عنصر عنوان صفحة ويب داخل `<head>`، مثل هذا:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Ola's blog</title>
    </head>
    <body>
        <p>Hi there!</p>
        <p>It works!</p>
    </body>
</html>
```

قم بحفظ الملف وقم بتحديث الصفحة الخاصة بك.

![الرقم 11.3](images/step4.png)

لاحظ كيف أن المستعرض قد فهم أن "Ola's blog" هو عنوان الصفحة الخاصة بك؟ لقد فسرت `<title>Ola's blog</title>` ووضعت النص في شريط عنوان المتصفح (سيتم استخدامه أيضا للإشارات المرجعية وما إلى ذلك).

ربما كنت قد لاحظت أيضا أن كل علامة افتتاح تقابلها *closing tag* مع `/` وذالك العنصر هو *nested* (بمعنى أنه لا يمكنك إغلاق علامة معينة حتى يتم إغلاق كل العلامات الموجودة داخلها).

أنها مثل وضع الأمور في صناديق. لديك صندوق واحد كبيرة ، `<html></html>`؛ يوجد داخله `<body></body>`، والذي يحتوي على صناديق صغيرة `<p></p>`.

تحتاج إلى اتباع قواعد *الإغلاق* هذه ، و *تداخل* العناصر – إذا لم تقم بذالك، المستعرض قد لا يكون قادراً على تفسيرها بشكل صحيح وسيتم عرض الصفحة الخاصة بك بشكل غير صحيح.

## تخصيص القالب الخاص بك

يمكنك الآن الحصول الأن على بعض المتعة ومحاولة تخصيص القالب الخاص بك! وإليك بعض العلامات المفيدة لذلك:

* `<h1>A heading</h1>` لأهم عنوان لديك
* `<h2>A sub-heading</h2>` لعنوان في المستوى التالي
* `<h3>A sub-sub-heading</h3>` ومع ذالك إلى `<h6>`
* `<p>فقرة من النص</p>`
* ويؤكد `<em>text</em>` على النص الخاص بك
* ويؤكد `<strong>text</strong>` بشدة على النص الخاص بك
* `<br>`يذهب إلى سطر آخر (لا يمكنك وضع أي شيء داخل br وليس هناك أي علامة إغلاق)
* `<a href="https://djangogirls.org">link</a>` إنشاء رابط
* `<ul><li>first item</li><li>second item</li></ul>` أنشئ قائمة مثل هذه!
* `<div></div>` تعرف جزء من الصفحة

هنا مثال لقالب كامل انسخه والصقه `blog/templates/blog/post_list.html`:

{% filename %}blog/templates/blog/post_list.html{% endfilename %}

```html
<html>
    <head>
        <title>Django Girls blog</title>
    </head>
    <body>
        <div>
            <h1><a href="/">Django Girls Blog</a></h1>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My first post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        </div>

        <div>
            <p>published: 14.06.2014, 12:14</p>
            <h2><a href="">My second post</a></h2>
            <p>Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut f.</p>
        </div>
    </body>
</html>
```

لقد أنشأنا ثلاثة أقسام `div` هنا.

* يحتوي العنصر `div` الأول على عنوان مدونتنا - إنه عنوان ورابط
* هناك عنصرين `div` اخرين يحتويان على منشورات مدونتنا مأرخة.`h2`عنوان التدوينة ويمكن النقر عليه و فقرتين`p`, واحدة للتأريخ التدوينة و الاخرى لمضمون التدوينة.

هو يتيح لنا هذا التأثير:

![الرقم 11.4](images/step6.png)

يااي! ولكن حتى الآن، يعرض نموذجنا تماما **نفس المعلومات** - بينما كنا نتحدث عن النماذج في وقت سابق للسماح لنا بعرض معلومات ** مختلفة ** في **نفس التنسيق**.

ما كنا نريد فعله حقا هو اضهار مشاركات حقيقية في ادارة دجانغو ، وذالك اين سنذهب لاحقا ،.

## شيء اخر: أنشر الوقت!

سيكون من الجيد أن نرى كل هذا على الإنترنت، ايس كذالك؟ دعونا ننشر بايثون في كل مكان اخر:

### Commit, and push your code up to GitHub

أولاً، دعونا نرى ما هي الملفات التي تغيرت منذ آخر نشر (شغل هذه الأوامر محليا ، ليس في بايثون في كل مكان):

{% filename %}command-line{% endfilename %}

    $ git status
    

تأكد من أنك في مجلد `djangogirls` ودعنا نخبر `git` بتضمين جميع التغييرات ضمن هذا المجلد:

{% filename %}command-line{% endfilename %}

    $ git add .
    

قبل رفع جميع الملفات دعنا نرى ماذا سترفع `git` ( جميع الملفات التي ترفعها `git` يجب ان تضهر باللون الأخضر):

{% filename %}command-line{% endfilename %}

    $ git status
    

شارفنا على الانتهاء ، الآن حان الوقت لنقول لها ان تحفض هذه التغييرات بتاريخها. سنعطيه "رسالة التزام" حيث نصف ما قمنا بتغييره. يمكنك كتابة ما تريد في هذه الحالة ، لكن من الأفضل ان تكتب شيء يدل على ما قمت بفعله حتى تتذكر في المستقبل.

{% filename %}command-line{% endfilename %}

    $ git commit -m "Changed the HTML for the site."
    

> **Note** Make sure you use double quotes around the commit message.

عندما نقوم بذالك نرفع او ندفع بتعديلاتنا إلى GitHub:

{% filename %}command-line{% endfilename %}

    $ git push
    

### اسحب التعليمات الجديدة إلى PythonAnywhere، وأعد تحميل تطبيق الويب

* افتح [PythonAnywhere consoles page](https://www.pythonanywhere.com/consoles/) واذهب الى **Bash console** او افتح واحدة جديدة وشغل هذا الأمر:

{% filename %}PythonAnywhere command-line{% endfilename %}

    $ cd ~/<your-pythonanywhere-domain>.pythonanywhere.com
    $ git pull
    [...]
    

You'll need to substitute `<your-pythonanywhere-domain>` with your actual PythonAnywhere subdomain name, without the angle-brackets. Your subdomain name is normally your PythonAnywhere user name, but in some cases it might be a bit different (such as if your user name contains capital letters). So if this command doesn't work, use the `ls` (list files) command to find your actual subdomain/folder name, and then `cd` to there.

Now watch your code get downloaded. If you want to check that it's arrived, you can hop over to the **"Files" page** and view your code on PythonAnywhere (you can reach other PythonAnywhere pages from the menu button on the console page).

* Finally, hop on over to the ["Web" page](https://www.pythonanywhere.com/web_app_setup/) and hit **Reload** on your web app.

تحديثك يجب ان يكون متاح, قم بعمل تحديث صفحة الموقع في المتصفح. التغييرات يجب ان تظهر لك الان