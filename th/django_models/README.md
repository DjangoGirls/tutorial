# Django models

What we want to create now is something that will store all the posts in our blog. But to be able to do that we need to talk a little bit about things called `objects`.

## Objects

There is a concept in programming called `object-oriented programming`. The idea is that instead of writing everything as a boring sequence of programming instructions, we can model things and define how they interact with each other.

แล้ว วัตถุ คืออะไร? มันคือชุดของคุณสมบัติและการกระทำ อาจจะฟังดูแปลกๆ แต่เรากำลังจะอธิบายคุณด้วยตัวอย่างนี้

If we want to model a cat, we will create an object `Cat` that has some properties such as `color`, `age`, `mood` (like good, bad, or sleepy ;)), and `owner` (which could be assigned a `Person` object – or maybe, in case of a stray cat, this property could be empty).

Then the `Cat` has some actions: `purr`, `scratch`, or `feed` (in which case, we will give the cat some `CatFood`, which could be a separate object with properties, like `taste`).

    Cat
    --------
    color
    age
    mood
    owner
    purr()
    scratch()
    feed(cat_food)
    

    CatFood
    --------
    taste
    

So basically the idea is to describe real things in code with properties (called `object properties`) and actions (called `methods`).

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

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py startapp blog
    

You will notice that a new `blog` directory is created and it contains a number of files now. The directories and files in our project should look like this:

    djangogirls
    ├── blog
    │   ├── __init__.py
    │   ├── admin.py
    │   ├── apps.py
    │   ├── migrations
    │   │   └── __init__.py
    │   ├── models.py
    │   ├── tests.py
    │   └── views.py
    ├── db.sqlite3
    ├── manage.py
    └── mysite
        ├── __init__.py
        ├── settings.py
        ├── urls.py
        └── wsgi.py
    

After creating an application, we also need to tell Django that it should use it. ซึ่งสามารถทำได้ที่ไฟล์ `mysite/settings.py` We need to find `INSTALLED_APPS` and add a line containing `'blog',` just above `]`. ผลลัพธ์สุดท้ายหน้าตาควรจะเป็นแบบนี้:

{% filename %}mysite/settings.py{% endfilename %}

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'blog',
]
```

### สร้างโมเดลของบล็อกโพสต์

In the `blog/models.py` file we define all objects called `Models` – this is a place in which we will define our blog post.

Let's open `blog/models.py`, remove everything from it, and write code like this:

{% filename %}blog/models.py{% endfilename %}

```python
from django.db import models
from django.utils import timezone


class Post(models.Model):
    author = models.ForeignKey('auth.User')
    title = models.CharField(max_length=200)
    text = models.TextField()
    created_date = models.DateTimeField(
            default=timezone.now)
    published_date = models.DateTimeField(
            blank=True, null=True)

    def publish(self):
        self.published_date = timezone.now()
        self.save()

    def __str__(self):
        return self.title
```

> Double-check that you use two underscore characters (`_`) on each side of `str`. รูปแบบนี้เป็นรูปแบบสากลในหมู่ผู้ใช้ Python บางทีก็เรียกพวกมันว่า "dunder" (ย่อมาจาก "double-underscore")

It looks scary, right? But don't worry – we will explain what these lines mean!

ทุกบรรทัดที่ขึ้นต้นด้วย `from` หรือ `import` คือการหยิบยืมบางส่วนมากจากไฟล์อื่นมาใช้ ดังนั้น แทนที่เราจะคัดลอกและวางสิ่งเดียวกันในทุกไฟล์ เราสามารถใส่บางส่วนโดยใช้ `from ... import ...`.

`class Post(models.Model):` – this line defines our model (it is an `object`).

- `class` เป็นคำพิเศษ บ่งบอกว่าเรากำลังจะสร้างวัตถุ
- `Post` is the name of our model. We can give it a different name (but we must avoid special characters and whitespace). Always start a class name with an uppercase letter.
- `models.Model` บอกเราว่า Post คือ Django Model ดังนั้น Django รู้ว่ามันควรถูกบันทึงลงในฐานข้อมูล

ตอนนี้เราจะมากำหนดคุณสมบัติที่เราเคยพูดถึงกัน: `title`, `text`, `created_date`, `published_date` และ `author` To do that we need to define the type of each field (Is it text? หรือ ตัวเลข? วันและเวลา? A relation to another object, like a User?)

- `models.CharField` – this is how you define text with a limited number of characters.
- `models.TextField` – this is for long text without a limit. Sounds ideal for blog post content, right?
- `models.DateTimeField` – this is a date and time.
- `models.ForeignKey` – this is a link to another model.

เราจะไม่อธิบายทุกสิ่งอย่างในโค้ดนี้ เนื่องจากจะใช้เวลานานเกินไป You should take a look at Django's documentation if you want to know more about Model fields and how to define things other than those described above (https://docs.djangoproject.com/en/1.11/ref/models/fields/#field-types).

แล้วส่วนนี้ `def publish(self):` คืออะไร? This is exactly the `publish` method we were talking about before. `def` คือ ฟังก์ชัน/method และ `publish` คือชื่อของ method You can change the name of the method if you want. The naming rule is that we use lowercase and underscores instead of spaces. For example, a method that calculates average price could be called `calculate_average_price`.

Methods ส่วนใหญ่มักจะ `return` บางอย่างออกมา ตัวอย่างเช่นใน method `__str__` ในที่นี้ เมื่อเราเรียก `__str__()` เราจะได้ข้อความ (**string**) ที่เป็นชื่อของโพสต์

Also notice that both `def publish(self):` and `def __str__(self):` are indented inside our class. Because Python is sensitive to whitespace, we need to indent our methods inside the class. Otherwise, the methods won't belong to the class, and you can get some unexpected behavior.

ถ้ายังมีข้อสงสัยเกี่ยวกับโมเดล อย่าลังเลที่จะถามโค้ชของคุณนะ! เรารู้ว่ามันมีความซับซ้อนบ้าง โดยเฉพาะเมื่อคุณได้เรียนรู้ทั้ง วัตถุและฟังก์ชัน ในเวลาเดียวกัน หวังว่านี่จะทำให้คุณเข้าใจขึ้นบ้างนะ!

### สร้างตารางสำหรับโมเดลในฐานข้อมูลของคุณ

ขั้นตอนสุดท้ายนี้คือ การเพิ่มโมเดลของเราลงในฐานข้อมูล First we have to make Django know that we have some changes in our model. (We have just created it!) Go to your console window and type `python manage.py makemigrations blog`. ผลลัพธ์จะคล้ายนี้:

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
      Rendering model states... DONE
      Applying blog.0001_initial... OK
    

ฮูเร่! โมเดลโพสต์ของเราอยู่ในฐานข้อมูลแล้ว! อยากเห็นข้อมูลข้างในแล้วใช่ไหม? ไปดูกันที่บทถัดไปกันเล๊ย!