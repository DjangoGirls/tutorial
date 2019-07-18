{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# آشنایی با پایتون

> قسمت‌هایی از این بخش بر اساس دوره آموزشی Geek Girls Carrots طراحی شده است (https://github.com/ggcarrots/django-carrots).

حالا بیایید کمی کد بنویسیم!

## خط فرمان پایتون

> > برای کسانی که در خانه مطالعه می‌کنند این بخش در ویدئو [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) توضیح داده شده است.

برای آنکه با پایتون کار کنیم باید یک کنسول *خط فرمان* روی کامپیوتر خود باز کنید. احتمالا بلد هستید که چطور این کار را بکنید، در بخش [آشنایی با خط فرمان](../intro_to_command_line/README.md) آن را یاد گرفته‌اید.

زمانی که آماده بودید، دستورالعمل های زیر را دنبال کنید.

ما میخواهیم یک کنسول پایتون باز کنیم، پس در کنسول خط فرمان ویندوز `python` و در ترمینال لینوکس/ مک `python3` را تایپ کنید و `enter` بزنید.

{% filename %}خط فرمان{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## اولین دستور پایتونی شما!

پس از اجرای دستور Python، خط فرمان به `>>>` تغییر می کند. این تغییر برای ما به معنای آن است که در حال حاضر فقط می توانیم از دستورات زبان پایتون استفاده کنیم. شما نیازی به تایپ `>>>` ندارید - خط فرمان پایتون این کار را برایتان میکند.

اگر به هر دلیلی قصد خروج از خط فرمان پایتون را داشتین، دستور `exit()` را تایپ کنید و یا از کلید میانبر `Ctrl + Z` در ویندوز و `Ctrl + D` در مک/لینوکس استفاده کنید. پس از خروج `>>>` را دیگر نمی بینید.

ما الان نمیخواهیم از خط فرمان پایتون خارج شویم. ما میخواهیم چیزهای بیشتری در مورد آن یاد بگیریم. بیایید با کمی ریاضیات شروع کنیم، مانند `2 + 3` و زدن `enter`.

{% filename %}خط فرمان{% endfilename %}

```python
>>> 2 + 3
5
```

خوبه! دیدید که جواب چگونه ظاهر شد؟پایتون ریاضیات را می فهمد! میتوانید دستور دیگری مثل این را امتحان کنید:

- `4 * 5`
- `5 - 1`
- `40 / 2`

برای اجرای محاسبات نمایی، مانند ۲ به توان ۳، تایپ میکنیم: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

کمی با دستورات مختلف محاسباتی تفریح کنید و دوباره آموزش را ادامه دهید. :)

همانطور که میبینید، پایتون محاسبه گر بسیار خوبی است. اگر شما به این فکر می کنید که چه کارهای دیگری می شود انجام داد…

## رشته های متنی

چطور است نام خود را بین علامت نقل قول تکی (آپاستروف) (' ') بنویسید؟ به صورت زیر:

{% filename %}خط فرمان{% endfilename %}

```python
>>> "Ola"
'Ola'
```

شما همین الان اولین رشته متنی خود را ساختید! رشته متنی دنباله ای از کاراکترها است که میتوان آن ها را توسط کامپیوتر پردازش کرد. رشته متنی همواره باید با یک علامت شروع و با همان پایان یابد. این علامت ممکن است نقل قول تکی یا آپاستروف (`'`) یا نقل قول دوتایی (`"`) باشد (در پایتون بین این دو فرقی نیست) این علامت ها به پایتون میگویند که حاوی یک رشته متنی هستند.

رشته ها می توانند به همدیگر الحاق شوند. دستور زیر را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

همچنین میتوانید یک رشته را در یک عدد ضرب کنید، رشته به تعداد آن عدد تکرار می شود:

{% filename %}خط فرمان{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

اگر نیاز داشتید تا یک علامت آپاستروف داخل رشته بیاورید، دو راه دارید.

استفاده از علامت نقل قول دوتایی:

{% filename %}خط فرمان{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

یا استفاده از یک بک اسلش (``) پیش از علامت آپاستروف:

{% filename %}خط فرمان{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

خوب است، نه؟ برای دیدن نام خود با حروف بزرگ، تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

شما همین الان از **متد** `upper` روی رشته متنی استفاده کردید! یک متد (مانند `upper()`) دنباله ای از دستورات پایتونی است. زمانی که متد را صدا بزنید، آن دستورات روی یک شی ورودی (`"Ola"`) اعمال می شود.

آیا می خواهید تعداد حروف نام خود را بدانید؟ یک **تابع** برای این کار هم هست!

{% filename %}خط فرمان{% endfilename %}

```python
>>> len("Ola")
3
```

به این فکر می کنید که چرا گاهی تابع را با یک `.` در انتهای یک رشته صدا میکنیم (مانند `"Ola".upper()`) و گاهی ابتدا یک تابع را صدا میزنیم و رشته را جلوی نام تابع داخل پرانتز می گذاریم؟ در بعضی موارد، توابع به اشیا تعلق دارند، مانند `upper()` ، که فقط میتواند روی رشته های متنی اعمال شود. در این موارد، تابع را یک **method** می نامیم. در موارد دیگر، توابع به چیری تعلق ندارند و میتوان آنها را روی انواع مختلفی از اشیا استفاده کرد، درست مانند `len()`. به همین دلیل است که `"Ola"` را به عنوان یک پارامتر ورودی به تابع `len` می دهیم.

### خلاصه

بسیار خب، صحبت راجع به رشته ها کافی است. تا اینجا شما موارد زیر را یاد گرفته اید:

- **خط فرمان** - تایپ دستورات (کد) و دیدن نتایج در خط فرمان پایتون
- ** اعداد و رشته های متنی** - در پایتون اعداد برای محاسبات ریاضی و رشته ها به عنوان اشیا متنی استفاده می شوند
- **عملگرها** مانند `+` و `*`، ترکیب مقادیر برای ساخت یک مقدار جدید
- **توابع**- مانند `upper()` و `len()`، که بر روی اشیا، اعمالی را انجام می دهند.

موارد گفته شده، پایه های تمام زبان های برنامه نویسی است که ممکن است بعدا بیاموزید. برای کارهای سخت تر آماده هستید؟ مطمئنیم که آماده اید!

## خطاها

بیایید چیز جدید را امتحان کنیم. میتوانیم طول یک عدد را همانطور که طول نام خودمان را پیدا میکنیم، به دست آوریم؟ تایپ کنید`len(304023)` و `enter` را بزنید:

{% filename %}{{ warning_icon }} خط فرمان{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

اولین خطا را دریافت کردیم! به وسیله آیکن {{ warning_icon }} به شما اعلام می کنیم کدی که قرار است اجرا کنید، مطابق انتظار شما اجرا نخواهد شد. اشتباه کردن (حتی اشتباهات عمدی) بخش مهم یادگیری است!

خطای دریافتی می گوید اشیا نوع "int" (اعداد طبیعی)، صفت "طول" ندارند. خب پس حالا چه کاری میتوانیم بکنیم؟ میتوانیم عددمان را به عنوان یک رشته متنی بنویسیم؟ رشته های متنی دارای طول هستند، درست است؟

{% filename %}خط فرمان{% endfilename %}

```python
>>> len(str(304023))
6
```

کار کرد! ما از تابع `str` داخل تابع `len` استفاده کردیم. `str()` هرچیزی را به رشته متنی تبدیل می کند.

- تابع `str` ورودی اش را به **strings** تبدیل می کند
- تابع `int` ورودی اش را به **integers** تبدیل می کند

> توجه: ما می توانیم اعداد را به متن تبدیل کنیم، اما همیشه نمی توان متن را به عدد تبدیل کرد - مثلا خروجی `int('hello')` چه چیزی میتواند باشد؟

## متغیرها

یکی از مفاهیم مهم در برنامه نویسی، مفهوم متغیر ها است. متغیر نامی است برای یک مقدار که بعدا بتوانید برای ارجاع به آن مقدار، از نام متغیر استفاده کنید. برنامه نویس ها از این متغیرها برای ذخیره داده، و بالا بردن خوانایی کد استفاده می کنند تا مجبور نباشند همه چیز را در ذهن نگه دارند.

بیایید یک متغیر جدید به نام `name` بسازیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> name = "sara"
```

تایپ می کنیم name مساوی sara.

همانطور که توجه کردید، برنامه شما مانند دفعات قبل خروجی نداد. پس از کجا بدانیم متغیر واقعا وجود دارد؟ نام متغیر `name` را وارد کنید و `enter` بزنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> name
'sara'
```

بلههههه! اولین متغیر شما!‌ :) همواره میتوانید چیزی را متغیر به آن ارجاع میدهد، تغییر دهید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> name = "Mahsa"
>>> name
'Mahsa'
```

میتوانید از آن در توابع نیز استفاده کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> len(name)
5
```

عالی است،نه؟ متغیرها میتوانند هرچیزی باشند- مثل اعداد! این یکی را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

ولی اگر نام اشتباه را استفاده کنیم چه می شود؟ می توانید حدس بزنید چه اتفاقی می افتد؟ بیایید امتحان کنیم!

{% filename %}{{ warning_icon }} خط-فرمان{% endfilename %}

```python
>>> city = "Tehran"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

یک خطا! همانطور که می بینید، پایتون دارای انواع مختلفی از خطاها است و این یکی خطا **NameError** نام دارد. اگر سعی کنید از متغیری که هنوز تعریف نشده استفاده کنید، پایتون این خطا را به شما می دهد. اگر بعدا به این خطا برخورد کردید، کد خود را برای اشتباه تایپی در نام متغیرها چک کنید.

کمی این موارد را امتحان کنید تا ببینید چه کارهایی می توانید با آن انجام دهید!

## تابع print

این را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> name = 'Mahsa'
>>> name
'Mahsa'
>>> print(name)
Mahsa
```

زمانی که فقط `name` را تایپ می کنید، مفسر پایتون با *ارائه ای* از رشته متنی داخل متغیر 'name' پاسخ می دهد، که دنباله کاراکترهای M-a-h-s-a درون علامت نقل قول است. وقتی که `print(name)` را اجرا می کنید، پایتون محتوای متغیر را در خروجی چاپ میکند، البته بدون علامت های نقل قول که مرتب تر است.

بعدا خواهیم دید که `print()` زمانی که میخواهیم از داخل توابع چیزی را چاپ کنیم،یا زمانی که میخواهیم چندین خط از متن را چاپ کنیم، نیز مفید است.

## لیست ها

پایتون علاوه بر رشته ها و اعداد، انواع مختلفی از اشیا را دارد. و الان نوعی از اشیا را معرفی میکنیم که **list** نام دارند. لیست ها دقیقا همان چیزی هستند که فکرش را می کنید: یک نوع شی که خودش لیستی از اشیای دیگر است. :)

حالا یک لیست بسازید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> []
[]
```

بله، این لیست خالی است. آنقدر مفید نیست، درست است؟ بیایید یک لیست از اعداد بخت آزمایی بسازیم. ما نمی خواهیم یک عدد تکراری را انتخاب کنیم، پس اعداد بخت آزمایی را داخل یک متغیر می کذاریم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

بسیار خب، ما یک لیست داریم! چه کاری می توانیم با آن انجام دهیم؟ بیایید ببینیم چه تعداد عدد بخت آزمایی درون لیست داریم. هیچ ایده ای درمورد این که از چه تابعی باید استفاده کنیم، دارید؟ از قبل این را می دانید!

{% filename %}خط فرمان{% endfilename %}

```python
>>> len(lottery)
6
```

بله! تابع `len()` می تواند تعداد اشیای درون لیست را بدهد. بسیار مفید، درست است؟ حالا بیایید لیستمان را مرتب کنیم:

{% filename %}خط فرمان{% endfilename %}

```python
>>> lottery.sort()
```

این یکی هیچ خروجی نداد، بلکه فقط ترتیب قرارگرفتن اعداد در لیست را تغییر داد. بیایید دوباره لیست را چاپ کنیم و ببینیم چه اتفاقی افتاده:

{% filename %}خط فرمان{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

همانطور که می بینید، اعداد درون لیست از کمترین مقدار به بیشترین مقدار مرتب شده اند. تبریک!

شاید بخواهیم ترتیب اعداد را برعکس کنیم. بیایید انجامش دهیم!

{% filename %}خط فرمان{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

اگر می خواهید چیزی به لیست خود اضافه کنید، میتوانید این دستور را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

اگر می خواهید فقط عدد اول را نمایش دهید،می توانید این کار با استفاده از **indexes** انجام دهید. ایندکس شماره ای است که نشان دهنده محل قرار گرفتن یک آیتم در لیست است. برنامه نویس ها ترجیح می دهند شمردن را از 0 شروع کنند. پس شماره اولین شی در لیست 0 است، بعدی 1 است و الی آخر. دستور زیر را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

همانطور که می بینید، با استفاده از نام لیست و شماره ایندکس داخل براکت، می توانید به اشیای مختلف درون لیست دسترسی پیدا کنید.

برای حذف چیزی از داخل لیست، باید همانطور که در بالا یاد گرفتیم، از **ایندکس** و متد `pop()` استفاده کنید. بیایید یک مثال را امتحان کنیم و چیزی را که قبلا یاد گرفتیم، بهبود دهیم؛ ما اولین عدد لیست را حذف خواهیم کرد.

{% filename %}خط فرمان{% endfilename %}

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

مانند یک افسون عمل کرد!

برای تفریح بیشتر، باقی ایندکس ها را نیز امتحان کنید:6 ،7، 1000، -1، -6، یا -1000. ببینید می توانید نتیجه را پیش از اجرای دستور، پیش بینی کنید؟ نتایج برای شما معنایی دارند؟

می توانید لیستی از متدهای مربوز به لیست ها را در این بخش از مستندات پایتون پیدا کنید: https://docs.python.org/3/tutorial/datastructures.html

## دیکشنری ها

> برای خوانندگان داخل خانه: این قسمت در ویدئو های بخش [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) پوشش داده شده است.

دیکشنری شبیه به لیست است، ولی برای دسترسی به مقادیر باید از کلیدها به جای ایندکس های عددی استفاده کنید. یک کلید می تواند رشته متنی و یا عدد باشد. دستور زبان تعریف یک دیکشنری خالی این است:

{% filename %}خط فرمان{% endfilename %}

```python
>>> {}
{}
```

خروجی نشان میدهد که یک دیکشنری خالی ساخته اید. هورررااا!

حالا سعی کنید که دستور زیر را بنویسید (سعی کنید اطلاعات خود را نیز جایگزین کنید):

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant = {'name': 'Mahsa', 'country': 'Iran', 'favorite_numbers': [7, 42, 92]}
```

با این دستور، یک متغیر به نام `participant` شامل سه جفت کلید-مقدار ساخته اید:

- کلید `name` به مقدار `Mahsa` (یک شی `string`) اشاره می کند
- کلید `country` به `'Iran'` (یک `string` دیگر) اشاره می کند
- و کلید `favorite_numbers` به `[7, 42, 92]` اشاره می کند (یک `لیست` با سه عدد داخل آن).

می توانید محتوای هر کلید را طبق دستور زیر به تنهایی چک کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> print(participant['name'])
Mahsa
```

ببینید، دیکشنری مشابه یک لیست است. ولی نیازی نیست که ایندکس ها را بخاطر بیاورید - فقط کافی است نام کلید را بدانید.

اگر مقدار کلیدی را که وجود ندارد از پایتون درخواست کنیم چه اتفاقی می افتد؟ می توانید حدس بزنید؟ بیایید امتحان کنیم و ببینیم!

{% filename %}{{ warning_icon }} خط فرمان{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

ببینید، یک خطای دیگر! این یکی **KeyError** است. پایتون به شما کمک می کند و می گوید که کلید `'age'` در دیکشنری وجود ندارد.

چه زمانی از لیست و چه زمانی از دیکشنری باید استفاده کرد؟ نکته خوبی است. قبل از دیدن خط بعد به پاسخ فکر کنید.

- یک دنباله ترتیبی از آیتم ها نیاز دارید؟ لیست را انتخاب کنید.
- آیا نیاز است کلیدها و مقادیر را به همدیگر ارتباط دهید، که بعدا بتوانید به صورت کارآمد مقادیر را بوسیله کلیدها جستجو کنید؟ از یک دیکشنری استفاده کنید.

دیکشنری ها، مانند لیست ها *تغییر پذیر* هستند، به معنای آن که می توان آن ها را پس از ساخت، تغییر داد. می توانید پس از ساختن دیکشنری، جفت کلید-مقدار جدید به آن اضافه کنید، مانند زیر:

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

استفاده از متد`len()` روی دیکشنری، مانند لیست ها، تعداد جفت های کلید-مقدار را برمی گرداند. دستور زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> len(participant)
4
```

امیدواریم تا اینجا همه چیز برایتان روشن باشد. :) آماده تفریح بیشتر با دیکشنری ها هستید؟ ادامه آموزش را بخوانید تا با چیزهای شگفت انگیز روبرو شوید.

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see from the output, the key–value pair corresponding to the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already-created key in the dictionary. Type this:

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### سرفصل ها

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Compare things

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers! Let's see how that works:

{% filename %}خط فرمان{% endfilename %}

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

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}خط فرمان{% endfilename %}

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

{% filename %}خط فرمان{% endfilename %}

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

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Booleans can be variables, too! See here:

{% filename %}خط فرمان{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}خط فرمان{% endfilename %}

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

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}خط فرمان{% endfilename %}

```python
>>> exit()
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

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

{% filename %}خط فرمان{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this:

{% filename %}خط فرمان{% endfilename %}

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

### سرفصل ها

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

## سرفصل ها

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)