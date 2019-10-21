# Django models

สิ่งที่เราจะสร้างต่อไปคือ สิ่งที่เราไว้เก็บโพสต์ทั้งหมดในบล็อกของเรา แต่การที่จะทำแบบนั้นเราจะมาทำความรู้จักกับสิ่งหนึ่งที่เรียกว่า `objects`.

## Objects

มีแนวคิดหนึ่งในการเขียนโปรแกรม ที่เรียกว่า `การเขียนโปรแกรมเชิงวัตถุ` The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

แล้ว วัตถุ คืออะไร? มันคือชุดของคุณสมบัติและการกระทำ อาจจะฟังดูแปลกๆ แต่เรากำลังจะอธิบายคุณด้วยตัวอย่างนี้

หากเราต้องการสร้างโมเดล แมว เราจะทำการสร้างวัตถุ `แมว` ซึ่งมีคุณสมบัติต่างๆ เช่น: `สี`, `อายุ`, `อารมณ์` (เช่น อารมณ์ดี, อารมณ์ไม่ดี, ง่วงนอน ;)), และ `เจ้าของ` (ซึ่งก็คือวัตถุ `คน` หรือบางกรณีเช่นแมวจรจัด ก็จะไม่มีเจ้าของ)

นอกจากนี้ `แมว` สามารถกระทำอะไรบางอย่าง: `คราง`, `เกา` หรือ `ให้อาหาร` (ซึ่งเราก็จะให้แมวกิน `อาหารแมว`, อาจจะเป็นวัตถุอื่นที่มีคุณสมบัตต่างๆ เช่น `รสชาติ`).

    แมว
    --------
    สี
    อายุ
    อารมณ์
    เจ้าของ
    คราง()
    เกา()
    ให้อาหาร(อาหาร_แมว)
    

    อาหารแมว
    --------
    รสชาติ
    

ไอเดียนี้ถูกนำไปใช้ในการอธิบายสิ่งต่างๆ ภายในโค้ด ด้วย คุณสมบัติ (เรียกว่า `object properties`) และ การกระทำ (เรียกว่า `methods`).

แล้วเราจะโมเดลโพสของบล็อกเราอย่างไร? เราต้องการสร้างบล็อก ถูกไหม?

เราต้องตอบคำถามเหล่านี้เสียก่อน: บล็อกโพสต์คืออะไร? ควรมีคุณสมบัติอะไรบ้าง?

แน่นอนว่า บล็อกของเราต้องการข้อความ ทั้งเนื้อหาและชื่อเรื่อง จริงไหม? It would be also nice to know who wrote it – so we need an author. สุดท้าย เราต้องการรู้ว่า โพสต์เราถูกสร้างและเผยแพร่เมื่อไหร่

    Post
    --------
    title
    text
    author
    created_date
    published_date
    

มีอะไรบ้างที่เราต้องทำเกี่ยวกับบล็อกโพสต์? มันจะดีถ้าเรามี `method` สำหรับเผยแพร่โพสต์ จริงไหม?

ดังนั้น เราต้องการ method `publish`

ตอนนี้เรารู้แล้วว่าสุดท้ายเราต้องการอะไร เรามาเริ่มโมเดลใน Django กัน!

## Django model

การได้รู้ว่าวัตถุคืออะไรแล้ว เราสามารถสร้าง Django model สำหรับบล็อกโพสต์ของเรา

A model in Django is a special kind of object – it is saved in the `database`. ฐานข้อมูล คือ ชุดของข้อมูล คุณจะเก็บข้อมูลของผู้ใช้ บล็อกโพสต์ของคุณ และอื่นๆ ลงที่นี่ เราจะใช้ฐานข้อมูล SQLite สำหรับเก็บข้อมูลของเรา This is the default Django database adapter – it'll be enough for us right now.

คุณอาจจะคิดได้ว่า โมเดลในฐานข้อมูลคือ ตารางคำนวณที่มี คอลัมน์ (fields) และ แถว (ข้อมูล)

### สร้าง application

เพื่อความเป็นระเบียบเรียบร้อย เราจะสร้าง application ภายใน project ของเรา การจัดระเบียบตั้งแต่เริ่มต้น เป็นสิ่งที่ดีที่ควรทำ การสร้าง application เราต้องรันคำสั่งต่อไปนี้ในคอนโซลของเรา (จากในไดเรกทอรี `djangogirls` ที่มีไฟล์ `manage.py` อยู่ข้างใน):

{% filename %}Mac OS X and Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py startapp blog
    

คุณจะเห็นไดเรกทอรี `blog` เพิ่มขึ้นมา และด้านในก็มีไฟล์อีกจำนวนหนึ่ง ไดเรกทอรีและไฟล์ใน project ของเรา ควรจะมีหน้าตาประมาณนี้:

    djangogirls
    ├── blog
    │   ├── admin.py
    │   ├── apps.py
    │   ├── __init__.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    ├── mysite
    │   ├── __init__.py
    │   ├── settings.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── myvenv
    │   └── ...
    └── requirements.txt
    
    

หลังจากที่เราสร้าง application เราต้องบอกให้ Django รู้ด้วยว่าเราจะใช้มัน We do that in the file `mysite/settings.py` -- open it in your code editor. We need to find `INSTALLED_APPS` and add a line containing `'blog.apps.BlogConfig',` just above `]`. ผลลัพธ์สุดท้ายของเราหน้าตาควรจะออกมาเป็นแบบนี้:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog.apps.BlogConfig',
]
```

### สร้างโมเดลของบล็อกโพสต์

ในไฟล์ `blog/models.py` เราจะกำหนดวัตถุทั้งหมด เรียกว่า `Models` - ซึ่งเราจะกำหนดบล็อกโพสต์ของเราไว้ที่นี่

Let's open `blog/models.py` in the code editor, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.conf import settings
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)
    published_date = models.DateTimeField(blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> ตรวจสอบว่าคุณใช้ขีดล่าง (`_`) สองขีดในแต่ละข้างของ `str` (ซ้ายสองขีด ขวาสองขีด) รูปแบบนี้เป็นรูปแบบสากลในหมู่ผู้ใช้ Python บางทีก็เรียกพวกมันว่า "dunder" (ย่อมาจาก "double-underscore")

ดูน่ากลัวเหมือนกันเนอะ ว่ามั้ย? แต่ไม่ต้องห่วงนะ เราจะอธิบายให้คุณฟังว่าขีดๆพวกนั้นหมายความว่ายังไง!

ทุกบรรทัดที่ขึ้นต้นด้วย `from` หรือ `import` คือการที่เรายืมบางส่วนจากไฟล์อื่นๆมาใช้ ดังนั้น แทนที่เราจะคัดลอกและวางสิ่งเดิมๆให้เหมือนๆกันในทุกๆไฟล์ เราสามารถใส่แค่บางส่วนโดยใช้ `from ... import ...`.

`class Post(models.Model):` - บรรทัดนี้คือการเริ่มสร้างโมเดลของเรา (มันคือ `object` นั่นเอง)

- `class` เป็นคำพิเศษ บ่งบอกว่าเรากำลังจะสร้างวัตถุ
- `Post` เป็นชื่อโมเดลของเรา ซึ่งสามรถตั้งเป็นชื่ออื่นได้ (แต่เราต้องหลีกเลี่ยงการใช้อักขระพิเศษ และ การเคาะเว้นช่องว่าง) ชื่อ class จะต้องขึ้นต้นด้วยตัวอักษรตัวใหญ่เสมอ
- `models.Model` บอกเราว่า Post คือ Django Model ดังนั้น Django รู้ว่ามันควรถูกบันทึงลงในฐานข้อมูล

Now we define the properties we were talking about: `title`, `text`, `created_date`, `published_date` and `author`. To do that we need to define the type of each field (Is it text? ตัวเลข? วันที่? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

เราจะไม่อธิบายทุกส่วนของโค้ดทั้งหมดในที่นี้ เนื่องจากจะใช้เวลานานเกินไป You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/2.2/ref/models/fields/#field-types).

แล้วส่วนนี้ `def publish(self):` คืออะไร? นี่คือเมธอด `publish` ที่เราเคยบอกไปก่อนหน้านี้ไง `def` คือ ฟังก์ชั่น/เมธอด และ `publish` คือชื่อของ method คุณสามารถเปลี่ยนชื่อ method ของคุณได้ ถ้าคุณต้องการ การตั้งชื่อจะมีกฎคือ เราจะใช้ตัวพิมพ์เล็กและใช้ขีดล่าง (_) แทนช่องว่าง เช่น เรามี method สำหรับคำนวณราคาเฉลี่ย เราจะตั้งชื่อว่า `calculate_average_price`

Method ส่วนใหญ่มักจะ `return` บางอย่างออกมา There is an example of that in the `__str__` method. In this scenario, when we call `__str__()` we will get a text (**string**) with a Post title.

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

ถ้ายังมีข้อสงสัยเกี่ยวกับโมเดล อย่าลังเลที่จะถามโค้ชของคุณนะ! เรารู้ว่ามันซับซ้อน โดยเฉพาะเมื่อคุณได้เรียนรู้ทั้ง วัตถุและฟังก์ชั่น ในเวลาเดียวกัน But hopefully it looks slightly less magic for you now!

### สร้างตารางสำหรับโมเดลในฐานข้อมูลของคุณ

ขั้นตอนสุดท้ายนี้คือ การเพิ่มโมเดลลงในฐานข้อมูลของเรา ก่อนอื่นเราต้องบอกให้ Django รู้ว่าเรามีการเปลี่ยนแปลงในโมเดลของเรา (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. หน้าตาก็จะประมาณนี้:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py makemigrations blog
    Migrations for 'blog':
      blog/migrations/0001_initial.py:
    
      - Create model Post
    

**Note:** Remember to save the files you edit. Otherwise, your computer will execute the previous version which might give you unexpected error messages.

Django prepared a migration file for us that we now have to apply to our database. Type `python manage.py migrate blog` and the output should be as follows:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py migrate blog
    Operations to perform:
      Apply all migrations: blog
    Running migrations:
      Applying blog.0001_initial... OK
    

ฮู้เร่! โมเดลโพสต์ของเราอยู่ในฐานข้อมูลแล้ว! อยากเห็นข้อมูลข้างในแล้วใช่มั้ยล่ะ? ไปดูในบทถัดไปกันเลยแล้วคุณจะเห็นว่าโพสต์ขอคุณหน้าตาเป็นยังไง!