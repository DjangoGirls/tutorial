# ORM جانغو و Querysets

في هذا الفصل سوف تتعلم كيف تتصل جانغو بقاعدة البيانات وتقوم بتخزين البيانات فيها. دعونا نغوص في الشرح!

## ما هو QuerySet؟

QuerySet هو، في جوهره، قائمة الكائنات من نموذج معين. QuerySet تسمح لك بقراءة البيانات من قاعدة البيانات، وتصفيها وتطلبها.

من السهل التعلم عبر الأمثلة ، دعونا نجرب ذالك. هيا بنا؟

## Django shell

إفتح وحدة التحكم المحلية الخاصة بك (ليس على PythonAnywhere) واكتب هذا الأمر:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

التأثير يجب أن يكون مثل:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

أنت الآن في جانغو في وحدة التحكم التفاعلية. أنها تماما مثل موجه بيثون، ولكن مع بعض سحر جانغو الإضافي. :) يمكنك استخدام كافة اوامر بيثون هنا أيضا، بطبيعة الحال.

### كل الكائنات

دعونا نحاول عرض جميع المشاركات لدينا أولاً. يمكنك القيام بذلك باستخدام الأمر التالي:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

اووبس! ظهر خطأ. يقول لنا أنه لا يوجد أي مشاركة. هذا صحيح لقد نسينا استيراده أولا!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

نستورد النموذج `Post` من`blog.models`. لنحاول عرض جميع المشاركات مرة أخرى:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

هذه قائمة باالمشاركات التي أنشأنا في وقت سابق! قمنا بإنشاء هذه المشاركات باستخدام واجهة المشرف جانغو. ولكن الآن نحن نريد انشاء مشاركات جديدة باستخدام بيثون، فكيف نفعل ذلك؟

### إنشاء كائن

هذه هي الطريقة التي تقوم بها بإنشاء مشاركة كائن جديد في قاعدة البيانات:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

ولكن لدينا عنصر واحد في عداد المفقودين هنا `me`. نحن بحاجة إلى تمرير مثيل من نموذج `User` كمؤلف. كيف نفعل ذلك؟

دعونا نسترد نموذج المستخدم الأول:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

اية مستخدمين لدينا في قاعدة البيانات الخاصة بنا؟ جرب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

هذا هو المستخدم الخارق الذي أنشأنا في وقت سابق! دعونا نحصل على مثيل للمستخدم الآن:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

كما ترون، نحن الآن`get` ا `User` مع `username` يساوي 'ola'. أنيق! بطبيعة الحال، عليك ضبط هذا الخط لاستخدام اسم المستخدم الخاص بك.

الآن يمكننا أخيرا إنشاء مشاركة:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

يا هلا! هل تريد التحقق من ما إذا كان يعمل؟

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

هاهي ذا! مشاركة آخرى في القائمة!

### إضافة المزيد من المشاركات

يمكنك الآن الحصول على القليل من المرح وإضافة المزيد من المشاركات لنرى كيف يعمل. أضف اثنين أو ثلاثة آخرين ثم انتقل إلى الجزء التالي.

### تصفية الكائنات

جزء كبير من QuerySets هو القدرة على تصفيتهم. لنفترض أننا نريد العثور على جميع المشاركات التي قام المستخدم ola بتأليفها. سنقوم باستخدام `filter` بدلاً من `all` في `Post.objects.all()`. بين قوسين نوضح ما هي الشروط التدوينة تحتاج إلى تلبية في نهاية المطاف في queryset لدينا. وفي حالتنا، الشرط أن `author` يجب أن يكون متساوي مع `me`. طريقة كتابتها في دجانغو `author=me`. الأن قطعتنا من الكود تبدو بهذا الشكل:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

أو ربما نريد أن نرى جميع المشاركات التي تحتوي على كلمة 'title' في الحقل `title`؟

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
[<Post: Sample title>, <Post: 4th title of post>]
```

> **ملاحظة** هناك حرفان أسفل السطر (`_`) بين `title` و `contains`. يستخدم ORM دجانغو هذه القاعدة لفصل أسماء الحقول ("title") والعمليات أو الفلاتر ("contains"). إذا قمت باستخدام تسطير واحد فقط، سوف تحصل على خطأ مثل "FieldError: Cannot resolve keyword title_contains".

يمكنك أيضا الحصول على قائمة بجميع المشاركات المنشورة. علينا القيام بذلك بتصفية جميع المشاركات التي قد `published_date` في الماضي:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
[]
```

للأسف، لم يتم نشر المشاركة التي أضفناها من وحدة تحكم بايثون بعد. ولكن يمكننا تغيير ذلك! احصل أولا على مثال لمشاركة نريد نشرها:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

ثم أنشرها باستخدام طريقة `publish`:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

الآن في محاولة للحصول على قائمة المشاركات المنشورة مرة أخرى (اضغط على مفتاح السهم لأعلى ثلاث مرات واضغط `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
[<Post: Sample title>]
```

### العناصر الصادرة

QuerySets تسمح لك أيضا بترتيب قائمة الكائنات. دعونا نحاول ترتيبها حسب الحقل `created_date`:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
[<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]
```

يمكننا أيضا عكس الترتيب بإضافة `-` في البداية:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
[<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]
```

### مجموعات الاستعلام المتسلسلة

يمكنك أيضا دمج QuerySets من خلال **chaining** معا:

    >>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    

هذا حقا قوي ويتيح لك كتابة استفسارات معقدة جدا.

رائع! أنت الآن جاهز للجزء التالي! لإغلاق الشل shell، اكتب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```