# مقدمة إلى بايثون

> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots).

دعنا نكتب بعض التعليمات البرمجية!

## موجه بايثون

> للقراء في المنزل: تم تغطية هذا الجزء في فيديو [ أساسيات بايثون: عدد صحيح، سلاسل، قوائم، متغيرات وأخطاء ](https://www.youtube.com/watch?v=MO63L4s-20U).

لبدء العمل ببايثون، نحتاج إلى فتح *سطر الأوامر* على جهاز الكمبيوتر. يجب عليك ان تعرف كيف تفعل ذالك - لقد تعلمته في [مقدمة لسطر الأوامر](../intro_to_command_line/README.md).

عندما تكون مستعدا، اتبع الإرشادات أدناه.

نريد فتح وحدة تحكم بيثون، لذلك اكتب في `python` على ويندوز أو `python3` على نظام التشغيل ماك / لينوكس واضغط على `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## أمر بايثون الأول الخاص بك!

بعد تشغيل الطلب في بايثون ، تغير الطلب إلى `>>>`. وهذا يعني بالنسبة لنا الآن انه يمكننا استخدام الأوامر في لغة بايثون فقط. ليس عليك الكتابة في `>>>` بايثون سيقوم بذالك.

إذا كنت ترغب في إنهاء وحدة تحكم بايثون ، فقط اكتب `exit()` أو استخدام الاختصار `Ctrl + Z` ل Windows و `Ctrl + D` ماك/لينكس. فإنك لن ترى `>>>`أبدا.

في الوقت الحالي، نحن لا نريد الخروج من وحدة تحكم بايثون. نريد أن نتعلم المزيد. دعونا نبدأ بكتابة بعض الرياضيات، مثل `2 + 3` و `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

لطيف! انظر كيف برز الجواب؟ بيثون يعرف الرياضيات! يمكنك محاولة الأوامر الأخرى مثل:

- `4 * 5`
- `5 - 1`
- `40 / 2`

لإجراء حساب ، قل 2 إلى القوة 3، نكتب: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

استمتع لبعض الوقت مع هذا ، وعد إلى هنا 

كما ترون، بايثون هي الة حاسبة عضيمة. إذا كنت تتساءل ماذا يمكنك أن تفعل…

## سلسلة

ماذا عن اسمك؟ اكتب الاسم الأول في علامات اقتباس مثل هذا:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

لقد أنشأت الآن السلسلة الأولى! هو تسلسل أحرف يمكن معالجتها بواسطة جهاز الكمبيوتر. يجب ان تبدأ السلسلة وتنتهي بنفس الحرف. قد يكون هذا واحد(`'`)) أو الضعف (`"`)) اقتباس (لا فرق!) الإقتباس يقول لبايثون انه هناك سلسلة.

السلاسل يمكن أن تكون مربوطة معا. جرب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

يمكنك أيضا ضرب السلاسل مع عدد:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

إذا كنت بحاجة إلى وضع علامة اقتباس أحادية داخل السلسلة الخاصة بك, لديك طريقتين للقيام بذلك.

استخدام علامات الاقتباس المزدوجة:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

أو الهروب من الفاصلة بخط مائل (`` \):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

لطيف، هاه؟ لرؤية اسمك بالأحرف الكبيرة، اكتب:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

لقد استخدمت `upper` **method** للتو في السلسلة الخاصة بك! وهناك طريقة (مثل `upper()`) عبارة عن سلسلة من التعليمات التي يجب على بايثون تنفيذها على كائن معين (`"Ola"`) بمجرد استدعائه.

إذا كنت تريد أن تعرف عدد الحروف الواردة في اسمك، هناك **function** لذلك أيضا!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

أتساءل لماذا في بعض الأحيان أستدعي الدالات بواسطة `.` في نهاية سلسلة (مثل `"Ola".upper()`)، وفي بعض الأحيان يمكنك استدعاء دالة أولاً ووضع السلسلة في الأقواس؟ حسنا، في بعض الحالات، تنتمي المهام إلى أشياء، مثل `upper()`, ، والتي لا يمكن تنفيذها إلا على السلاسل. في هذه الحالة نسمي المهام ب **method**. مرات اخرى، المهام لا تنتمي إلى أي شيء محدد، ويمكن استخدامها على أنواع مختلفة من الكائنات، مثل `len()`. لهذا نحن نعطي `"Ola"` اعدادات الى المهمة `len`.

### مُلخّص

طيب، يكفينا سلآسل ، حتى الأن لقد تعلمت:

- **the prompt** كتابة الأوامر (كودات) في موجه اوامر بايثون يعطينا اجابات في بايثون
- **numbers and strings** - في بايثون تستخدم الأرقام للرياضيات والسلاسل للكائنات النصية
- **operators** مثل `+` و `*`, تجمع بين القيم لتنتج واحدة جديدة
- **functions** مثل `upper()` و `len()` تنفذ إجراأت على الكائنات.

هذه هي الأساسيات لكل لغة برمجة تتعلمها. أنت مستعد لشيء أكثر صعوبة؟ ونحن نراهن على ذالك!

## أخطاء

دعنا نجرب شيئا جديداً. يمكن أن نحصل على طول عدد بنفس الطريقة التي يمكن أن نجد بها طول اسمنا؟ اكتب في `len(304023)` واضغط `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

حصلنا على الخطأ الأول! ويقول أن الكائنات من نوع "إنت" (الأعداد الصحيحة، أرقام كاملة) ليس لها طول. فماذا يمكننا أن نفعل الآن؟ ربما يمكننا كتابة رقمنا كسلسلة؟ سلاسل لها طول، أليس كذلك؟

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

لقد كان مجديًا! قمنا باستخدام الدالة `str` داخل الدالة `len`. `str ()` تحويل كل شيء إلى سلاسل.

- الدالة `str` تحول الأشياء إلى **strings</1 ></li> 
    
    - الدالة `int` تحول الأشياء إلى **integers**</ul> 
    
    > هام: علينا تحويل الأرقام إلى نص، ولكن لا يمكن بالضرورة تحويل النص إلى أرقام – ماذا ستكون `int('hello')` على أي حال؟
    
    ## المتغيرات
    
    مفهوم هام في البرمجة وهو المتغيرات. المتغير ليس أكثر من اسم لشيء يمكن استخدامه في وقت لاحق. يستخدم المبرمجون هذه المتغيرات لتخزين البيانات، وجعل التعليمات البرمجية الخاصة بهم أكثر قابلية للقراءة، لذالك هم ليسو بحاجة لتدكر كل شيء.
    
    لنفرض أننا نريد إنشاء متغير جديد يسمى `name`:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
>>> name = "Ola"
```

اكتب اسم يساوي Ola.

كما لاحظت، فإن البرنامج لم يعد أي شيء كما فعل من قبل. فكيف نعرف أن المتغير موجود بالفعل؟ ما عليك سوى إدخال `name` واضغط على `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

يآآاي! المتغير الأول الخاص بك! :) يمكنك دائماً تغيير ما يشير إليه:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

يمكنك استخدامه في وظائف ايضا:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

رائع، أليس كذلك؟ بالطبع، المتغيرات يمكن أن تكون أي شيء أرقام أيضا! جرب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

ولكن ماذا لو استخدمنا اسم خاطئ؟ هل يمكنك تخمين ما يمكن أن يحدث؟ دعونا نحاول!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

خطأ! كما ترون، بيثون لديه أنواع مختلفة من الأخطاء ويسمى هذا **NameError**. سيعطيك بايثون هذا الخطأ إذا حاولت استخدام متغير لم يتم تعريفه حتى الآن. إذا واجهت هذا الخطأ في وقت لاحق، تحقق من التعليمات البرمجية الخاصة بك لمعرفة إذا كنت أخطأت في أي أسماء.

العب بهذه التعليمات لبعض الوقت، وانضر ما يمكن ان تفعله!

## وظيفة الطباعة

جرب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

عندما تكتب `name`, فقط، يستجيب مترجم بايثون مع*representation* المتغير 'نيم'، وهو الحرف M-a-r-i-a، المحاط بعلامات اقتباس مفردة، ''. When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.

## القوائم

بجانب السلاسل والأعداد الصحيحة، بايثون لديه كل الأنواع المختلفة من الكائنات. الآن نحن بصدد إدخال واحد يسمى **list**. القوائم هي بالضبط ما تعتقد: الكائنات التي هي قوائم لكائنات الأخرى. :)

امضي قدما وأنشئ قائمة:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

نعم، هذه القائمة فارغة. ليست مفيدة جدا، أليس كذلك؟ دعونا ننشئ قائمة من أرقام اليانصيب. نحن لا نريد أن نكرر ذالك طوال الوقت، لذلك سنضعها في متغير أيضا:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

حسنا، لدينا قائمة! ماذا يمكننا أن نفعل حيال ذلك؟ دعونا نرى كم عدد اليانصيب هناك في القائمة. هل لديك أي فكرة عن أي وظيفة يجب عليك استخدامها لذلك؟ أنت تعرف هذا بالفعل!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

نعم! `len()` يمكن أن تعطيك عددا من الكائنات في قائمة. مفيد، أليس كذلك؟ ربما سنقوم بترتيبها الآن:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

هذا لا يعيد أي شيء، انها مجرد تغييرات للترتيب الذي يظهر الأرقام في القائمة. دعونا نطبعه مرة أخرى ونرى ما يحدث:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

كما ترون، يتم فرز الأرقام في القائمة الخاصة بك الآن من أدنى إلى أعلى القيمة. مبروك!

ربما نريد عكس هذا الترتيب؟ دعونا نفعل ذلك!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

إذا كنت ترغب في إضافة أي شيء إلى القائمة الخاصة بك، يمكنك القيام بذلك عن طريق كتابة هذا الأمر:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

إذا كنت ترغب في إظهار الرقم الأول فقط، يمكنك القيام بذلك باستخدام **indexes**. الفهرس هو العدد الذي يقول أين يحدث عنصر في قائمة. المبرمجين يفضلون بدء العد من 0، وبالتالي فإن الكائن الأول في قائمتك هو في مؤشر 0، والكائن القادم هو في 1، وما إلى ذلك. جرب هذا:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

كما ترون، يمكنك الوصول إلى كائنات مختلفة في القائمة الخاصة بك باستخدام الاسم في قائمة الفهرس للكائن داخل أقواس معقوفة.

لحذف شيء من القائمة الخاصة بك سوف تحتاج إلى استخدام **indexes** كما تعلمنا أعلاه وأسلوب `pop()`. دعونا احد الأمثلة ونعزز ما تعلمناه سابقا. سنقوم بحذف الرقم الأول من قائمتنا.

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
>>> print(lottery[0])
59
>>> lottery.pop(0)
59
>>> print(lottery)
[42, 30, 19, 12, 3, 199]
```

انه يعمل كالحصان!

للمتعة الإضافية، حاول بعض الفهارس الأخرى: 6، 7، 1000،-1 أو-6-1000. انظر إذا كان يمكنك التنبؤ بالنتيجة قبل محاولة الأمر. منطقي؟

يمكن أن تجد قائمة بجميع الأساليب القائمة المتوفرة في هذا الفصل من وثائق بايثون: https://docs.python.org/3/tutorial/datastructures.html

## القواميس

> للقراء في المنزل: هذا الفصل تم التكلم عنه في [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

القاموس مماثل للقائمة، ولكن يمكنك الوصول إلى القيم عن طريق البحث عن المفتاح بدلا من الفهرس الرقمي. المفتاح يمكن أن يكون أي سلسلة أو رقم. تعريف جملة لبنآء قاموس فارغ:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

هذا يدل على أنك قمت بإنشاء قاموس فارغ للتو. يآآاي!

والآن، حاول كتابة الأمر التالي (محاولة استبدال المعلومات الخاصة بك، ايضا):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

مع هذا الأمر، الذي أنشأته للتو متغير يسمى `participant` مع ثثلاثة أزواج القيمة الرئيسية:

- المفتاح `name` يشير إلى قيمة`'Ola'`(كائن `string`)،
- `country` يشير إلى `'Poland'` (`string` أخرى)،
- ويشير `favorite_numbers` إلى `[7، 42، 92]` (`list` بثلاثة أرقام).

يمكنك التحقق من محتوى المفاتيح الفردية مع بناء الجملة التالي:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

انظر، انها مماثلة للقائمة. ولكن لا تحتاج إلى تذكر الفهرس - فقط الاسم.

ماذا يحدث إذا طلبنا من بايثون قيمة مفتاح غير موجود؟ هل يمكنك التخمين؟ دعونا نحاول ونرى!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

انضر، خطأ آخر! هذا **KeyError**. بايثون مفيد ويخبرك بأن مفتاح `'age'` غير موجود في هذا القاموس.

متى يجب استخدام قاموس أو قائمة؟ حسنا، هذه نقطة جيدة للتفكير. فقط فكر في حل قبل النظر في الجواب في السطر التالي.

- هل تحتاج فقط إلى تسلسل أمر من العناصر؟ انتقل إلى القائمة.
- هل تحتاج إلى ربط القيم مع مفاتيح، حتى تتمكن من البحث عنها بكفاءة (عن طريق مفتاح) في وقت لاحق؟ إستخدم المعجم.

القواميس، مثل القوائم، و *mutable*، بمعنى أنه يمكن تغييرها بعد إنشائها. يمكنك إضافة أزواج مفتاح – القيمة الجديدة إلى قاموس بعد إنشائه، هكذا:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

مثل القوائم، باستخدام طريقة `len()` على القواميس ترجع عدد أزواج القيمة الرئيسية في القاموس. إمضي قدما واكتب هذا الأمر:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

آمل أن يكون هذا منطقيا حتى الآن. :) هل انت على استعداد لمتعة أكثر مع القواميس؟ قراءة لبعض الأشياء المدهشة.

يمكنك استخدام الأسلوب `pop()` لحدف عنصر من القاموس. لنفترض أنك تريد حذف المدخل المقابل للمفتاح `'favorite_numbers'`, ، اكتب فقط الأمر التالي:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

كما ترون من المخرج، تم حذف زوج مفتاح القيمة المقابلة لمفتاح 'favorite_numbers'.

فضلا عن ذلك، يمكنك أيضا تغيير قيمة مرتبطة بمفتاح تم إنشاؤه مسبقاً في القاموس. اكتب هذا الأمر:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

كما ترون، تم تغيير قيمة المفتاح `'country'` من `'Poland'` إلى `'Germany'`. :) مثير؟ مرحى! لقد تعلمت للتو شيء آخر مدهش.

### الملخص

مدهش! أنت تعرف الكثير عن البرمجة الآن. لقد تعلمت في هذا الجزء الأخير حول:

- **أخطاء** – يمكنك الآن معرفة كيفية قراءة وفهم الأخطاء التي تظهر إذا كان بايثون لم يفهم امر اعطيته له
- **المتغيرات** –أسماء الكائنات التي تسمح لك بتكويد أكثر سهولة وجعل التعليمات البرمجية الخاصة بك أكثر قابلية للقراءة
- **قوائم** – قوائم الكائنات المخزنة في ترتيب معين
- **قواميس** – الكائنات المخزنة كقيمة مفتاح-أزواج

متحمس للجزء القادم؟ :)

## مقارنة الأشياء

> للقراء في المنزل: هذا الفصل تم التكلم عنه في فيديو [Python Basics: Dictionaries](https://www.youtube.com/watch?v=7bzxqIKYgf4).

جزء كبير من البرمجة ينطوي على مقارنة الأشياء. ما هو أسهل شيء للمقارنة؟ أرقام، بالطبع. دعونا نرى كيف يعمل:

{% filename %}command-line{% endfilename %}

```python
>>> 5 > 2
True
>>> 3 < 1
False
>>> 5 > 2 * 2
True
>>> 1 == 1
True
>>> 5 != 2
True
```

أعطينا بايثون بعض الأرقام للمقارنة. كما ترون،بايثون لا يمكنها مقارنة الأرقام فقط، ولكن يمكنها أيضا مقارنة نتائج الأسلوب. لطيف، هاه؟

هل تتساءل لماذا وضعنا اثنين من العلامات المتساوية `==` بجانب بعضها البعض للمقارنة إذا كانت الأرقام متساوية؟ ونحن نستخدم `=` واحد لتعيين القيم للمتغيرات. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y means: x is greater than y
- x `<` y means: x is less than y
- x `<=` y means: x is less than or equal to y
- x `>=` y means: x is greater than or equal to y

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Save it!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Exit the Python interpreter
- Open up our code editor of choice
- Save some code into a new python file
- Run it!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. This is called "syntax highlighting", and it's a really useful feature when coding. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

On Windows Command Prompt, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

And on Windows Powershell, it will be like this:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

If you get stuck, just ask for help.

Now use Python to execute the code in the file like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Replace the code in your **python_intro.py** file with this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python expects us to give further instructions to it which are executed if the condition `3 > 2` turns out to be true (or `True` for that matter). Let’s try to make Python print “It works!”. Change your code in your **python_intro.py** file to this:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

Save it and give it another run:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### What if a condition isn't True?

In previous examples, code was executed only when the conditions were True. But Python also has `elif` and `else` statements:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

When this is run it will print out:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    5 is indeed greater than 2
    

If 2 were a greater number than 5, then the second command would be executed. Let's see how `elif` works:

{% filename %}python_intro.py{% endfilename %}

```python
name = 'Sonja'
if name == 'Ola':
    print('Hey Ola!')
elif name == 'Sonja':
    print('Hey Sonja!')
else:
    print('Hey anonymous!')
```

and executed:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

See what happened there? `elif` lets you add extra conditions that run if the previous conditions fail.

You can add as many `elif` statements as you like after your initial `if` statement. For example:

{% filename %}python_intro.py{% endfilename %}

```python
volume = 57
if volume < 20:
    print("It's kinda quiet.")
elif 20 <= volume < 40:
    print("It's nice for background music")
elif 40 <= volume < 60:
    print("Perfect, I can hear all the details")
elif 60 <= volume < 80:
    print("Nice for parties")
elif 80 <= volume < 100:
    print("A bit loud!")
else:
    print("My ears are hurting! :(")
```

Python runs through each test in sequence and prints:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## Comments

Comments are lines beginning with `#`. You can write whatever you want after the `#` and Python will ignore it. Comments can make your code easier for other people to understand.

Let's see how that looks:

{% filename %}python_intro.py{% endfilename %}

```python
# Change the volume if it's too loud or too quiet
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

You don't need to write a comment for every line of code, but they are useful for explaining why your code is doing something, or providing a summary when it's doing something complex.

### Summary

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Your own functions!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

A function is a sequence of instructions that Python should execute. Each function in Python starts with the keyword `def`, is given a name, and can have some parameters. Let's give it a go. Replace the code in **python_intro.py** with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay, our first function is ready!

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

As you can see, we now gave our function a parameter that we called `name`:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    if name == 'Ola':
        print('Hi Ola!')
    elif name == 'Sonja':
        print('Hi Sonja!')
    else:
        print('Hi anonymous!')

hi()
```

Remember: The `print` function is indented four spaces within the `if` statement. This is because the function runs when the condition is met. Let's see how it works now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Oops, an error. Luckily, Python gives us a pretty useful error message. It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. Let's fix it at the bottom of the file:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

And run it again:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

And if we change the name?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

And run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

This is awesome, right? This way you don't have to repeat yourself every time you want to change the name of the person the function is supposed to greet. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Let's call the code now:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Congratulations! You just learned how to write functions! :)

## Loops

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

This is the last part already. That was quick, right? :)

Programmers don't like to repeat themselves. Programming is all about automating things, so we don't want to greet every person by their name manually, right? That's where loops come in handy.

Still remember lists? Let's do a list of girls:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

We want to greet all of them by their name. We have the `hi` function to do that, so let's use it in a loop:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Here is the full code that will be in the file:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

And when we run it:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    Next girl
    Hi Monica!
    Next girl
    Hi Phoebe!
    Next girl
    Hi Ola!
    Next girl
    Hi You!
    Next girl
    

As you can see, everything you put inside a `for` statement with an indent will be repeated for every element of the list `girls`.

You can also use `for` on numbers using the `range` function:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Which would print:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` is a function that creates a list of numbers following one after the other (these numbers are provided by you as parameters).

Note that the second of these two numbers is not included in the list that is output by Python (meaning `range(1, 6)` counts from 1 to 5, but does not include the number 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Summary

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)