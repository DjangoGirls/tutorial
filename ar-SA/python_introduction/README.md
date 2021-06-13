{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# مقدمة إلى بايثون

> هذا القسم يستند على دورة تعليمية من فتيات الجزر المهووسات (https://github.com/ggcarrots/django-carrots).

دعونا نكتب بعض الأكواد!

## موجه بايثون

> للقراء في المنزل: تم تغطية هذا الجزء في فيديو [ أساسيات بايثون: عدد صحيح، سلاسل، قوائم، متغيرات وأخطاء ](https://www.youtube.com/watch?v=MO63L4s-20U).

من أجل تعلم واللعب بـ بايثون ، علينا أن نفتح *command line* على جهاز الكمبيوتر. من المفترض أنكم تعرفوا كيف تفعلوا ذلك - لقد تعلمتم ذلك في فصل [Intro to Command Line](../intro_to_command_line/README.md)

بمجرد أن تكونوا جاهزون ، تتبعوا التعليمات التي بالأسفل.

نريد أن نفتح وحدة تحكم بايثون ، اكتبوا `python` على وندوز أو `python3` على ماك أو لينكس واضغطوا `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## أمر بايثون الأول الخاص بك!

بعد تشغيل أمر Python ، تغير الموجه إلى `>>>`. هذا يعني أنه حالياً يمكننا فقط إستخدام الأوامر الخاصة بلغة البايثون. لا يتوجب عليكم أن تكتبوا `>>>` - بايثون سوف يفعل ذلك

إذا كنتم تريدون أن تخرجوا من وحدة تحكم باثون في أي وقت ، اكتبوا `exit()` أو استخدموا الإختصار `Ctrl + Z` في وندوز أو `Ctrl + D` في ماك أو لينكس. لن تروا `>>>` مجدداً

الآن ، نحن لا نريد الخروج من وحدة تحكم بايثون. نريد أن نتعلم أكثر عنه. دعونا نبدأ بكتابة بعض الرياضيات ، مثل `2 + 3` ونضغط `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

جميل! هل ترون كيف برزت الإجابة؟ بايثون يعرف الرياضيات! يمكنكم تجربة أوامر أخرى مثل:

- `4 * 5`
- `5 - 1`
- `40 / 2`

إذا كنتم تريدون كتابة معادلات أسية ، مثل 2 أس 3 ، نكتب: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

استمتعوا بهذا لبعض الوقت ثم عودوا إلى هنا. :)

كما ترون، بايثون آلة حاسبة رائعة. إذا كنت تتساءل عما يمكنك فعله…

## سلسلة

ماذا عن اسمك؟ اكتب اسمك الأول في اقتباسات مثل هذا:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

لقد أنشأت الآن السلسلة الأولى! هو تسلسل أحرف يمكن معالجتها بواسطة جهاز الكمبيوتر. يجب ان تبدأ السلسلة وتنتهي بنفس الحرف. قد يكون هذا واحد (`'`) أو الضعف (`"`) اقتباس (لا فرق!) الإقتباس يقول لبايثون انه هناك سلسلة.

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

لقد استخدمت `upper` **method** للتو في السلسلة الخاصة بك! طريقة (مثل `upper()`) هي سلسلة من التعليمات التي يجب على بايثون تنفيذها على شيء معين (`"Ola"`) بمجرد أن تستدعيها.

إذا كنت تريد أن تعرف عدد الحروف الواردة في اسمك، هناك **function** لذلك أيضا!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

هل تتسائلون في بعض الأحيان لماذا تستدعون الدوال مع `.` في نهاية السلسلة مثل `"Ola".upper()` وفي بعض الأحيان تقومون بإستدعاء الدالة وتضعون السلسلة بين قوسين؟ حسنًا، في بعض الحالات، تنتمي الدوال إلى أشياء، مثل `upper()`، والتي لا يمكن القيام بها إلا على السلاسل. في هذه الحالة نسمي المهام ب **method**. مرات أخرى، الدوال لا تنتمي إلى أي شيء محدد ويمكن استخدامها على أنواع مختلفة من الأشياء، تماما مثل `len()`. لهذا نحن نعطي `"Ola"` كعامل متغير إلى الدالة `len`.

### مُلخّص

طيب، يكفينا سلآسل ، حتى الأن لقد تعلمت:

- **the prompt** كتابة الأوامر (كودات) في موجه اوامر بايثون يعطينا اجابات في بايثون
- **numbers and strings** - في بايثون تستخدم الأرقام للرياضيات والسلاسل للكائنات النصية
- **operators** مثل `+` و `*`, تجمع بين القيم لتنتج واحدة جديدة
- **functions** مثل `upper()` و `len()` تنفذ إجراأت على الكائنات.

هذه هي أساسيات كل لغة برمجة تتعلمها. مستعد لشيء أصعب؟ نحن نراهن بأنك!

## أخطاء

لنجرب شيئا جديدا. هل يمكننا الحصول على طول رقم بنفس الطريقة التي يمكننا بها معرفة طول اسمنا؟ اكتب `len(304023)` واضغط `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

لقد حصلنا على أول خطأ! أيقونة {{ warning_icon }} هي طريقتنا لتنبيهك أن الكود الذي أنت على وشك تشغيله لن يعمل كما هو متوقع. إن ارتكاب الأخطاء (حتى الأخطاء المتعمدة) جزء هام من التعلم!

يقول أن الأشياء من نوع "int" (الأعداد الصحيحة، الأعداد الكاملة) ليس لها أي طول. إذن ماذا يمكننا أن نفعل الآن؟ ربما يمكننا كتابة رقمنا كسلسلة؟ السلاسل لها طول، أليس كذلك؟

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

لقد كان مجدياً! استخدمنا الدالة `str` داخل الدالة `len`. الدالة `str()` تحول كل شي إلى سلاسل.

- الدالة `str` تحول الأشياء إلى **strings</1 ></li> 
    
    - الدالة `int` تحول الأشياء إلى **integers**</ul> 
    
    > هام: علينا تحويل الأرقام إلى نص، ولكن لا يمكن بالضرورة تحويل النص إلى أرقام – ماذا ستكون `int('hello')` على أي حال؟
    
    ## المتغيرات
    
    مفهوم هام في البرمجة وهو المتغيرات. المتغير ليس أكثر من اسم لشيء يمكن استخدامه في وقت لاحق. يستخدم المبرمجون هذه المتغيرات لتخزين البيانات، وجعل التعليمات البرمجية الخاصة بهم أكثر قابلية للقراءة، لذا لا يتوجب عليهم أن يتذكروا ماهية الأشياء.
    
    لنفرض أننا نريد إنشاء متغير جديد يسمى `name`:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> name = "Ola"
    ```
    
    نكتب الاسم يساوي Ola.
    
    كما لاحظت، لم يعيد برنامجك أي شيء كما فعل من قبل. إذاً كيف نعرف أن المتغير موجود بالفعل؟ أدخل `name` واضغط `enter`:
    
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
    
    يمكنك استخدامه في الوظائف أيضا:
    
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
    
    {% filename %}{{ warning_icon }} command-line{% endfilename %}
    
    ```python
    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    ```
    
    خطأ! كما ترون، بايثون لديه أنواع مختلفة من الأخطاء ويسمى هذا **NameError**. سوف يعطيك بايثون هذا الخطأ إذا حاولت استخدام متغير لم يتم تعريفه بعد. إذا واجهت هذا الخطأ في وقت لاحق، تحقق من التعليمات البرمجية الخاصة بك لمعرفة إذا كنت أخطأت في أي أسماء.
    
    العب مع هذا لبعض الوقت و شاهد ما يمكنك فعله!
    
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
    
    عندما تكتب فقط `name`، يستجيب مترجم بايثون بالسلسلة *representation* للمتغير 'name', والتي هي الحروف M-a-r-i-a محاطة بعلامة إقتباس واحدة، ''. عندما تقول `print(name)`، بايثون سيقوم ب "طباعة" محتويات المتغير إلى الشاشة، دون علامات الاقتباس، وهو أكثر إتقاناً.
    
    كما سنرى لاحقا، `print()` مفيد أيضا عندما نريد طباعة الأشياء من داخل الدوال، أو عندما نريد طباعة الأشياء على خطوط متعددة.
    
    ## القوائم
    
    بجانب السلاسل والأعداد الصحيحة، بايثون لديه كل الأنواع المختلفة من الكائنات. الآن سوف نقدم واحدة تسمى **list**. القوائم هي بالضبط ما تعتقده: الأشياء التي هي قوائم أشياء أخرى. :)
    
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
    
    كما ترون، الأرقام في قائمتك الآن مصنفة من أدنى قيمة إلى أعلى قيمة. تهانينا!
    
    ربما نريد عكس هذا الترتيب؟ دعونا نفعل ذلك!
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
    ```
    
    إذا كنت ترغب في إضافة شيء إلى القائمة الخاصة بك، يمكنك فعل ذلك عن طريق كتابة هذا الأمر:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    ```
    
    إذا كنت ترغب في إظهار الرقم الأول فقط، يمكنك القيام بذلك باستخدام **indexes**. الفهرس هو الرقم الذي يقول أين يوجد عنصر في القائمة. المبرمجون يفضلون بدء العد عند 0، لذلك الكائن الأول في قائمتك هو في الفهرس 0، والعنصر التالي هو في 1، وما إلى ذلك. جرب هذا:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
    ```
    
    كما ترون، يمكنك الوصول إلى كائنات مختلفة في قائمتك باستخدام اسم القائمة وفهرس الكائن داخل الأقواس المعقوفة.
    
    لحذف شيء من القائمة الخاصة بك سوف تحتاج إلى استخدام **indexes** كما تعلمنا أعلاه وأسلوب `pop()`. دعونا نجرب مثالا ونعزز ما تعلمناه سابقا، سنقوم بحذف العدد الأول من قائمتنا.
    
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
    
    عمل هذا كالسحر !
    
    للمتعة الإضافية، حاول بعض الفهارس الأخرى: 6، 7، 1000، -1، -6 أو -1000. انظر إذا كان يمكنك التنبؤ بالنتيجة قبل محاولة الأمر. هل النتائج منطقية؟
    
    يمكن أن تجد قائمة بجميع أساليب القائمة المتوفرة في هذا الفصل من وثائق بايثون: https://docs.python.org/3/tutorial/datastructures.html
    
    ## القواميس
    
    > للقراء في المنزل: هذا الفصل تم التكلم عنه في [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).
    
    القاموس مماثل للقائمة، ولكن يمكنك الوصول إلى القيم عن طريق البحث عن مفتاح بدلا من فهرس رقمي. المفتاح يمكن أن يكون أي سلسلة أو عدد. بناء الجملة لتعريف القاموس الفارغ هو:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> {}
    {}
    ```
    
    هذا يدل على أنك قمت بإنشاء قاموس فارغ للتو. يآآاي!
    
    الآن، حاول كتابة الأمر التالي (حاول استبدال معلوماتك الخاصة أيضا):
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
    ```
    
    مع هذا الأمر، قمت للتو بإنشاء متغير يسمى `participant` مع ثلاثة أزواج من القيمة المفتاحية:
    
    - المفتاح `name` يشير إلى قيمة`'Ola'`(كائن `string`)،
    - `country` يشير إلى `'Poland'` (`string` أخرى)،
    - ويشير `favorite_numbers` إلى `[7، 42، 92]` (`list` بثلاثة أرقام).
    
    يمكنك التحقق من محتوى المفاتيح الفردية مع هذه الجملة:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> print(participant['name'])
    Ola
    ```
    
    انظر، إنها مشابهة للقائمة. لكنك لست بحاجة إلى تذكر الفهرس - مجرد الاسم.
    
    ماذا يحدث إذا طلبنا من بايثون قيمة مفتاح غير موجود؟ هل يمكنك التخمين؟ دعونا نحاول ونرى!
    
    {% filename %}{{ warning_icon }} command-line{% endfilename %}
    
    ```python
    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'
    ```
    
    انضر، خطأ آخر! هذا **KeyError**. بايثون مفيد ويخبرك بأن مفتاح `'age'` غير موجود في هذا القاموس.
    
    متى يجب عليك استخدام القاموس أو القائمة؟ حسناً، هذه نقطة جيدة للتفكير. فكر في الإجابة قبل النظر إليها في السطر التالي.
    
    - هل تحتاج فقط إلى تسلسل أمر من العناصر؟ انتقل إلى القائمة.
    - هل تحتاج إلى ربط القيم مع مفاتيح، حتى تتمكن من البحث عنها بكفاءة (عن طريق مفتاح) في وقت لاحق؟ إستخدم المعجم.
    
    القواميس، مثل القوائم، هي *mutable*، مما يعني أنه يمكن تغييرها بعد إنشائها. يمكنك إضافة أزواج مفتاح-قيمة جديدة إلى القاموس بعد إنشائه، مثل هذا:
    
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
    
    آمل أن يكون الأمر منطقيا حتى الآن. :) مستعد لمزيد من المتعة مع القواميس؟ استمر بالقراءة من أجل بعض الأشياء المذهلة.
    
    يمكنك استخدام طريقة `pop()` لحذف عنصر في القاموس. لنفترض أنك تريد حذف المدخل المقابل للمفتاح `'favorite_numbers'`, ، اكتب فقط الأمر التالي:
    
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
    >>> len([1, 2, 3]) > len([4, 5])
    True
    ```
    
    أعطينا بايثون بعض الأرقام للمقارنة. كما ترون، ليس فقط بايثون يمكن مقارنة الأرقام، ولكن يمكن أيضا مقارنة قيم التعبيرات الرياضية مثل `2 * 2` ونتائج الدالة مثل `2` التي تم إرجاعها بواسطة `len([4, 5]`. رائع، هاه؟
    
    هل تتساءل لماذا وضعنا اثنين من العلامات المتساوية `==` بجانب بعضها البعض للمقارنة إذا كانت الأرقام متساوية؟ نحن نستخدم `=` لتعيين القيم للمتغيرات. أنت دائما، **دائما** بحاجة إلى وضع اثنين منها - `==` - إذا كنت ترغب في التحقق مما إذا كانت الأشياء تساوي بعضها البعض. يمكننا أن نقول أيضا أن الأمور غير متساوية مع بعضها البعض. لذالك نستخدم هذه الرموز `!=` كما هو مبين في المثال أعلاه.
    
    أعطي بايثون مهمتان اخرتان:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    ```
    
    لقد رأينا `>` و `<`، ولكن ماذا يعني `>=` و `<=` ؟ اقرأهم بهذه الطريقة:
    
    - `x_>` y يعني: x أكبر من y
    - `x_<` y يعني: x أقل من y
    - x `<=` y يعني: x أقل من أو يساوي y
    - x `> =` يعني y: x أكبر من أو يساوي y
    
    رائع! تريد القيام بذالك مرة اخرى؟ جرب هذا:
    
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
    
    - **و**-إذا قمت باستخدام عامل التشغيل `and`، كل المقارنات يجب أن تكون صحيحة في النظام لكي يكون الأمر كله صحيح
    - **أو** – إذا كنت تستخدم عامل التشغيل `or`، واحد فقط من المقارنات يجب أن يكون صحيحاً في النظام لكي يكون الأمر كله صحيح
    
    هل سمعت عبارة "مقارنة التفاح بالبرتقال"؟ دعونا نجرب ما يعادل هذه العبارة في بايثون:
    
    {% filename %}{{ warning_icon }} command-line{% endfilename %}
    
    ```python
    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: '>' not supported between instances of 'int' and 'str'
    ```
    
    هنا ترى أنه كما هو الحال في التعبير، بايثون غير قادر على مقارنة عدد (`int`) وسلسلة (`str`). بدلاً من ذلك، فإنه يظهر **TypeError** ويقول لنا لا يمكن مقارنة هذين النوعين معا.
    
    ## Boolean
    
    وبالمناسبة، لقد تعلمت للتو نوع جديد من الكائنات في بايثون. تسمى **Boolean**.
    
    هناك نوعين فقط من كائنات Boolean:
    
    - صحيح
    - خطأ
    
    ولكن لكي يفهم بايثون هذا، تحتاج دائما إلى كتابته كـ 'صحيح' (الحرف الأول الكبير، مع بقية الأحرف السفلية). **true, TRUE,، وtRUE لن تنجح – الوحيدة التي ستنجح هي True.** (نفس الأمر ينطبق على 'False' كذلك، بطبيعة الحال.)
    
    Booleans يمكن أن تكون متغيرات، أيضا! انظر هنا:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> a = True
    >>> a
    True
    ```
    
    يمكنك أيضا القيام بذلك بهذه الطريقة:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> a = 2 > 5
    >>> a
    False
    ```
    
    تدرب واستمتع مع Booleans بمحاولة تشغيل الأوامر التالية:
    
    - `True and True`
    - `False and True`
    - `True or 1 == 1`
    - `1 != 2`
    
    تهانينا! Booleans هي واحدة من أروع ميزات البرمجة، وقد تعلمت للتو كيفية استخدامها!
    
    # احفظه!
    
    > للقراء في المنزل: هذا الفصل تم التكلم عنه في فيديو [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk).
    
    حتى الآن كنا نكتب كل ما لدينا من تعليمات بايثون في المترجم، مما يحدنا من إدخال سطر واحد من التعليمات البرمجية في وقت واحد. يتم حفظ البرامج العادية في الملفات ويتم تنفيذها من قبل لغتنا البرمجية **interpreter** أو **compiler**. حتى الآن كنا نقوم بتشغيل برامجنا سطر واحد في كل مرة في بايثون **interpreter**. سنحتاج إلى أكثر من سطر واحد من التعليمات البرمجية للمهام القليلة التالية، لذلك سنحتاج بسرعة إلى:
    
    - قم بإنهاء مترجم بايثون
    - فتح محرر التعليمات البرمجية لدينا الاختيار
    - حفظ بعض التعليمات البرمجية في ملف بايثون جديد
    - تشغيله!
    
    للخروج من مترجم بايثون الذي كنا نستخدمه، ببساطة اكتب دالة `exit()`
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    >>> exit()
    $
    ```
    
    هذا سيضعك مرة أخرى في موجه الأوامر.
    
    في وقت سابق، اخترنا محرر التعليمات البرمجية من قسم [code editor](../code_editor/README.md). We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):
    
    {% filename %}editor{% endfilename %}
    
    ```python
    print('Hello, Django girls!')
    ```
    
    Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.
    
    Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.
    
    > يجب أن تلاحظ واحدة من أروع شيء عن المحررين الأكواد: الألوان! في وحدة تحكم بايثون، كان كل شيء بنفس اللون. الآن يجب أن ترى أن الدالة `print` هي لون مختلف عن السلسلة. وهذا ما يسمى "syntax highlighting"، وهي ميزة مفيدة حقاً عند الترميز. سيعطيك لون الأشياء تلميحات مثل السلاسل غير المغلقة أو الأخطاء المطبعية في اسم الكلمة الرئيسية (مثل `def` في إحدى الدالات، والتي سنراها أدناه). وهذا أحد الأسباب التي تجعلنا نستخدم محرر تعليمات برمجية. :)
    
    With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.
    
    <!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->
    
    On a Mac, the command will look something like this:
    
    {% filename %}command-line{% endfilename %}
    
        $ cd ~/Desktop
        
    
    <!--endsec-->
    
    <!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->
    
    On Linux, it will be like this:
    
    {% filename %}command-line{% endfilename %}
    
        $ cd ~/Desktop
        
    
    (Remember that the word "Desktop" might be translated to your local language.)
    
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
    
    If you get stuck, ask for help. That's exactly what the coaches are here for!
    
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
    
    {% filename %}{{ warning_icon }} command-line{% endfilename %}
    
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
    
    Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.
    
    Save it and give it another run:
    
    {% filename %}command-line{% endfilename %}
    
    ```python
    $ python3 python_intro.py
    It works!
    ```
    
    Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.
    
    ### ماذا إذا كان الشرط غير صحيح؟
    
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
        
    
    ## التعليقات
    
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
    
    ### الملخص
    
    In the last few exercises you learned about:
    
    - **مقارنة الأشياء** – في بايثون يمكنك مقارنة الأشياء باستخدام `>`، `> =`, `= =`، `< =`، `<` و `and` مشغلي `or`
    - **Boolean** نوع من العناصر التي لا يمكن أن تحتوي إلا على قيمتين: `True` أو `False`
    - **حفظ الملفات** – تخزين التعليمات البرمجية في ملفات حيث يمكنك تنفيذ برامج أكبر.
    - **if … elif … else** – البيانات التي تسمح لك بتنفيذ التعليمات البرمجية فقط عند استيفاء شروط معينة.
    - **التعليقات**-الأسطر التي لن تشغلها بايثون والتي تمكنك من توثيق التعليمات البرمجية الخاصة بك
    
    Time for the last part of this chapter!
    
    ## الدالات الخاصة بك!
    
    > للقراء في المنزل: هذا الفصل تم التكلم عنه في فيديو [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0).
    
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
    
    You may wonder why we've written the name of the function at the bottom of the file. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.
    
    Let's run this now and see what happens:
    
    {% filename %}command-line{% endfilename %}
    
        $ python3 python_intro.py
        Hi there!
        How are you؟
        
    
    Note: if it didn't work, don't panic! The output will help you to figure why:
    
    - إذا حصلت على `NameError`، فهذا يعني أنك كتبت شيئا خاطئا، لذا يجب عليك التحقق من أنك استخدمت نفس الاسم عند إنشاء الدالة باستخدام `def hi():` وعند الاتصال به `hi()`.
    - إذا حصلت على `IndentationError`، تحقق من أن كلا من خطوط <`print` لها نفس المسافة البيضاء في بداية السطر: بايثون يريد أن تكون كل شفرة داخل الدالة محاذية بدقة.
    - إذا لم يكن هناك أي إخراج على الإطلاق، تحقق من أن آخر `hi()` *isn't* مسنن - إذا كان كذلك، فسيصبح هذا السطر جزءا من الوظيفة أيضا، ولن يتم تشغيله ابدا.
    
    Let's build our first function with parameters. We will change the previous example – a function that says 'hi' to the person running it – with a name:
    
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
    
    {% filename %}{{ warning_icon }} command-line{% endfilename %}
    
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
    
    Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:
    
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
    
    ## الحلقات
    
    > للقراء في المنزل: هذا الفصل تم التكلم عنه في فيديو [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0).
    
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
    
    The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.
    
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
    
    ## الملخص
    
    That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!
    
    For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)
    
    You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)
    
    ![Cupcake](images/cupcake.png)