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

بلههههه! اولین متغیر شما!‌ :) همواره میتوانید چیزی را که متغیر به آن ارجاع میدهد، تغییر دهید:

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

زمانی که فقط `name` را تایپ می کنید، مفسر پایتون با *ارائه ای* از رشته متنی داخل متغیر 'name' پاسخ می دهد، که دنباله کاراکترهای M-a-h-s-a درون علامت نقل قول است. وقتی که `print(name)` را اجرا می کنید، پایتون محتوای متغیر را در صفحه نمایش چاپ میکند، البته بدون علامت های نقل قول که مرتب تر است.

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

## دیکشنری (لغت نامه) ها

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

می توانید از متد `pop()` برای حذف یک آیتم از دیکشنری استفاده کنید. برای مثال، اگر می خواهید مدخل مربوط به کلید `'favorite_numbers'` را حذف کنید، دستور زیر را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Iran', 'favorite_language': 'Python', 'name': 'Mahsa'}
```

همانطور که در خروجی مشاهده می کنید، کلید مقدار متناظر با 'favorite_numbers' حذف شده است.

به همین شکل، می توانید مقدار مربوط به یک کلید موجود در دیکشنری را تغییر دهید. این را تایپ کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Mahsa'}
```

همانطور که می توانید ببینید مقدار کلید `'country'` از `'Iran'` به `'Germany'` تغییر پیدا کرده است. :) هیجان انگیز نیست؟ هورا! همین الان یک مورد شگفت انگیز دیگر یاد گرفتید.

### خلاصه

بسیار عالی! الان چیزهای زیادی راجع به برنامه نویسی می دانید. در همین قسمت آخر شما موارد زیر را آموختید:

- **خطاها** -اگر پایتون دستوری را متوجه نشود و خطایی را نشان دهد، حالا شما می دانید چطور آن خطا را بخوانید و درک کنید
- **متغیرها** -نام هایی برای اشیا هستند که شما را قادر می سازد راحت تر کد بزنید و کد شما را خواناتر می کند
- **لیست ها** - لیستی از اشیا که در یک ترتیب خاص ذخیره شده اند
- **دیکشنری ها** - اشیایی که به عنوان جفت های کلید-مقدار ذخیره شده اند

برای بخش بعدی هیجان زده اید؟ :)

## مقایسه اشیا

> برای خوانندگان داخل خانه: این قسمت در ویدئو های بخش [Python Basics: Dictionaries](https://www.youtube.com/watch?v=7bzxqIKYgf4) پوشش داده شده است.

بخش بزرگی از برنامه نویسی شامل مقایسه اشیا است. مقایسه چه چیز هایی از همه راحت تر است؟ اعداد! بیایید نحوه کارکرد آن را ببینیم:

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

ما چند عدد را برای مقایسه به پایتون داده ایم. همانطور که می بینید، پایتون نه تنها می تواند اعداد را مقایسه کند، بلکه می تواند خروجی متد ها را هم مقایسه کند، به نظر شما عالی نیست؟

آیا به این فکر کرده اید که چرا دو علامت مساوی `==` کنار هم برای چک کردن تساوی اعداد گذاشته ایم؟ ما از یک علامت مساوی `=` برای انتساب مقادیر به متغیرها استفاده می کنیم. اگر می خواهید مساوی بودن دو شی با همدیگر را چک کنید، همیشه و **همیشه** باید از دو علامت مساوی `==` استفاده کنید. همچنین می توانیم مساوی نبودن اشیا را تعیین کنیم. برای این منظور، از علامت `!=`, همانطور که در مثال بالا نشان داده شده است، استفاده می کنیم.

دو تکلیف دیگر به پایتون بدهید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

ما `>` و `<` را دیدیم، ولی `>=` و `<=` چه معنایی دارد؟ آنها را به این صورت بخوانید:

- x `>` y یعنی‌: x بزرگتر از yاست
- x `<` y یعنی: x کوچکتر از y است
- x `<=` y یعنی: x کوچکتر یا مساوی y است
- x `>=` y یعنی: x بزرگتر یا مساوی y است

بسیار عالی! می خواهید بیشتر با آن کار کنید؟ این را امتحان کنید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

می توانید هر تعداد عدد که می خواهید برای مقایسه به پایتون بدهید، و او به شما جواب بدهد! بسیار زیرکانه است، نه؟

- **and** - اگر شما از عملوند `and` استفاده کنید، هر دو مقایسه باید True باشند تا کل عبارت True ارزیابی شود
- **or** - اگر شما از عملوند `or` استفاده می کنید، Trueبودن یکی از مقایسه ها کافی است تا کل عبارت True ارزیابی شود

آیا عبارت " مقایسه سیب با پرتقال" را شنیده اید؟ بیایید نسخه پایتونی آن را امتحان کنیم:

{% filename %}{{ warning_icon }} خط فرمان {% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

همانطور که در عبارت بالا می بینید، پایتون قادر نیست یک رشته (`str`) و یک عدد (`int`) را با هم مقایسه کند. درعوض، یک **TypeError** نشان می دهد و به ما می گوید که دو نوع نمی توانند با یکدیگر مقایسه شوند.

## Boolean

در حقیقت شما با نوع جدیدی از اشیا در پایتون آشنا شدید. به نام **Boolean** بولیَن.

فقط دو نوع شی بولین وجود دارد:

- True - درست
- False - نادرست

برای اینکه پایتون این نوع را بشناسد، باید همیشه به صورت 'True' آن را بنویسید (حرف اول بزرگ، و باقی حروف کوچک). **true, TRUE, و tRUE را نخواهد شناخت - فقط Trueدرست است.** ( برای False هم همینطور.)

بولین ها می توانند به صورت متغیر باشند، اینجا را ببینید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> a = True
>>> a
True
```

می توانید به این صورت نیز انجامش دهید:

{% filename %}خط فرمان{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

با اجرای دستورات زیر، با بولین ها تفریح و تمرین کنید:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

تبریک! بولین ها یکی از جالب ترین ویژگی های برنامه نویسی هستند، و شما همین الان یاد گرفتید چطور از آن ها استفاده کنید!

# ذخیره کنید!

> برای خوانندگان داخل خانه: این قسمت در ویدئو های بخش [Python Basics: Dictionaries](https://www.youtube.com/watch?v=dOAg6QVAxyk) پوشش داده شده است.

تا اینجا ما تمام کدهای پایتون خود را در مفسر خط فرمان نوشته ایم، که مارا محدود به ورود یک خط از کد در یک زمان می کرد. برنامه های نرمال در فایل ذخیره می شوند و به وسیله **مفسر** یا **کامپایلر** زبان برنامه نویسی اجرا می شوند. تا اینجا ما برنامه هایمان به صورت - هربار، یک خط - در **مفسر** پایتون اجرا کردیم. برای تمرین های بعدی به بیش از یک خط کد نیاز خواهیم داشت، پس ما نیاز داریم تا سریعا:

- از مفسر پایتون خارج شویم
- ویرایشگر متنی دلخواه خود را نصب کنیم
- چندخط کد در فایل جدید پایتون ذخیره کنیم
- آن را اجرا کنیم!

برای خروج از مفسر پایتونی که در حال استفاده از آن هستیم، تابع `exit()` را تایپ کنید

{% filename %}خط فرمان{% endfilename %}

```python
>>> exit()
```

این عمل شما را به خط فرمان بازمی گرداند.

پیش از این، ما یک ویرایشگر متنی از بخش [ویرایشگر متن](../code_editor/README.md) انتخاب کردیم. حالا باید ویرایشگر را باز کنیم و چند خط کد در یک فایل جدید بنویسیم (یا اگر از یک کروم بوک استفاده می کنید، یک فایل جدید روی cloud IDE بسازید و فایل را باز کنید):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

به وضوح، حالا شما یک توسعه دهنده پایتون کاربلد هستید، پس کمی از کدهایی که امروز یاد گرفتید را بنویسید.

حالا باید فایل را ذخیره کنیم و یک نام توصیفی به آن بدهیم. بیایید فایل را **python_intro.py** نامگذاری کنیم و آن را روی صفحه دسکتاپ ذخیره کنیم. می توانیم به فایل هر نامی که می خواهیم بدهیم، ولی پایان یافتن فایل با **.py** مهم است. پسوند **.py** به سیستم عامل می گوید که این یک **فایل اجرایی پایتون** است و پایتون می تواند آن را اجرا کند.

> **توجه** شما باید به یکی از جالب ترین ویژگی های ویرایشگر کد دقت کنید: رنگ ها! در کنسول پایتون، همه چیز به یک رنگ بود، حالا شما می توانید ببینید که تابع `print` رنگ متفاوتی با رشته متنی دارد. به این ویژگی "برجسته سازی دستوری " می گویند، که ویژگی بسیار مفیدی برای کد زدن است. رنگ چیزها شما را راهنمایی می‌کند، مانند رشته متنی بسته نشده یا غلط دیکته ای در کلمات کلیدی (مانند `def` در یک تابع که در ادامه خواهیم دید). این یکی از دلایلی است که از ویرایشگر کد استفاده می‌کنیم. :)

وقتی فایل را ذخیره کردیم وقت آن است که آن را اجرا کنیم! ار مهارت‌هایی که در بخش خط فرمان گفتیم استفاده کنید، از ترمینال برای **تغییر دایرکتوری** به دسکتاپ استفاده کنید.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

بر روی Mac، فرمان‌ها شبیه به این خواهد بود:

{% filename %}خط فرمان{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

بر روی لینوکس شبیه به این است:

{% filename %}خط فرمان{% endfilename %}

    $ cd ~/Desktop
    

(به یاد داشته باشید که ممکن است کلمه "Desktop" به زبان منتخب شما ترجمه شده باشد.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

در خط فرمان ویندوز، شبیه به این است:

{% filename %}خط فرمان{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

بر روی پاورشل ویندوز، شبیه به این است:

{% filename %}خط فرمان{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

اگر گیر کردید تقاضای راهنمایی کنید. مربی‌ها برای همین کار در کنار شما هستند!

حالا از پایتون استفاده کنید تا کدهای موجود در فایل را اجرا کنید:

{% filename %}خط فرمان{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

نکته: در ویندوز 'pyhton3' یک دستور محسوب نمیشود. به جای آن از 'python' برای اجرای فایل استفاده کنید:

{% filename %}خط فرمان{% endfilename %}

```python
> python python_intro.py
```

بسیار خب! شما اولین برنامه پایتون خود را که در یک فایل ذخیره شده بود اجرا کردید. فوق العاده نیستید؟

حالا شما می‌توانید به سراغ یکی از ابزارهای ضروری برنامه نویسی بروید:

## If … elif … else

بسیاری از کدها تنها زمانی باید اجرا شوند که شروط داده شده درست باشند. به همین دلیل پایتون چیزی به نام دستور شرطی - **دستور if** دارد.

کد را خود در فایل **python_intro.py** با این جایگزین کنید:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

اگر ما این را ذخیره و اجرا کنیم، خطایی مانند زیر را مشاهده می کنیم:

{% filename %}{{ warning_icon }} خط-فرمان{% endfilename %}

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

### چکیده

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