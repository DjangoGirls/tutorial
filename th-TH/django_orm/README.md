# Django ORM และ QuerySets

ในบทนี้ คุณจะได้เรียนรู้การเชื่อต่อ Django กับ ฐานข้อมูล และเก็บข้อมูลลงในนั้น เริ่มกันเลย!

## QuerySet คืออะไร?

A QuerySet is, in essence, a list of objects of a given Model. QuerySets allow you to read the data from the database, filter it and order it.

ใช้ตัวอย่างจะเห็นภาพกว่า มาลองดูกันเลยไหม?

## Django shell

เปิดคอนโซลบนเครื่องคุณ (ไม่ใช่บน PythonAnywhere) และใช้คำสั่งนี้:

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py shell
    

ผลลัพธ์ควรเป็นดังนี้:

{% filename %}command-line{% endfilename %}

```python
(InteractiveConsole)
>>>
```

ตอนนี้คุณอยู่ในคอนโซลของ Django มันเหมือนกับคอนโซลของ Python แต่เราได้เพิ่มเวทมนต์ของ Django เข้ามา :) แน่นอนว่า คุณสามารถใช้ทุกคำสั่งของ Python ในนี้เช่นกัน

### วัตถุทั้งหมด

ลองแสดงผลของทุกโพสต์กัน คุณสามารถทำได้โดยใช้คำสั่งต่อไปนี้:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
Traceback (most recent call last):
      File "<console>", line 1, in <module>
NameError: name 'Post' is not defined
```

อุ๊ย! เกิดข้อผิดพลาดขึ้นมาล่ะ มันบอกเราว่าไม่มี Post ซึ่งแน่ล่ะ - ก็เราลืม import มันก่อนไง!

{% filename %}command-line{% endfilename %}

```python
>>> from blog.models import Post
```

เรา import โมเดล `Post` จาก `blog.models` เรามาลองแสดงโพสต์ทั้งหมดกันดูอีกที:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>]>
```

มันคือลิสต์ของโพสต์ที่เราได้สร้างไว้ก่อนหน้านี้! เราสร้างโพสต์เหล่านี้จากหน้า Django admin ตอนนี้ เราต้องการสร้างโพสต์ใหม่โดยใช้ Python แล้วเราจะทำมันได้ยังไงล่ะ?

### สร้างวัตถุ

นี่คือวิธีการสร้างวัตถุโพสต์ใหม่ในฐานข้อมูล:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
```

แต่เราขาดอะไรไปอย่างนึง: `ตัวเรา` เราต้องการส่งวัตถุในโมเดล `User` ให้เป็นผู้เขียน แล้วเราจะทำยังไงล่ะ?

เราต้อง import โมเดล User ก่อน:

{% filename %}command-line{% endfilename %}

```python
>>> from django.contrib.auth.models import User
```

เรามีผู้ใช้อยู่ในฐานข้อมูลไหมนะ? ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> User.objects.all()
<QuerySet [<User: ola>]>
```

This is the superuser we created earlier! Let's get an instance of the user now:

{% filename %}command-line{% endfilename %}

```python
>>> me = User.objects.get(username='ola')
```

อย่างที่คุณเห็น มันคือการ `get` `User` โดยใช้ `username` ที่ชื่อ 'ola'. มันดจีย์ใช่มะ! และแน่นอนว่าคุณสามารถเปลี่ยนมันให้เป็นชื่อของคุณได้

ตอนนี้ เราก็สามารถสร้างโพสต์ของเราได้แล้ว:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.create(author=me, title='Sample title', text='Test')
<Post: Sample title>
```

ฮูเร้! มาดูกัน ว่ามีอะไรเพิ่มมาบ้าง?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.all()
<QuerySet [<Post: my post title>, <Post: another post title>, <Post: Sample title>]>
```

มีโพสต์มากกว่าหนึ่งอันแล้ว!

### เพิ่มโพสต์

You can now have a little fun and add more posts to see how it works. Add two or three more and then go ahead to the next part.

### ตัวกรองวัตถุ

ส่วนสำคัญของ QuerySet คือ ความสามารถในการกรองข้อมูล สมมติว่าเราต้องการหาโพสต์ทั้งหมดที่ผู้ใช้มีผู้ใช่ที่ชื่อ ola เป็นคนเขียน เราจะใช้ `filter` แทน `all` ใน `Post.objects.all()` In parentheses we state what condition(s) a blog post needs to meet to end up in our queryset. In our case, the condition is that `author` should be equal to `me`. วิธีการเขียนใน Django ก็คือ: `author=me` ตอนนี้ ผลลัพธ์จากการกรองจะเป็นดังนี้:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(author=me)
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

หรือบางที เราอยากเห็นโพสต์ทั้งหมดที่มีคำว่า 'title' อยู่ข้างในฟิลด์ `title`?

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(title__contains='title')
<QuerySet [<Post: Sample title>, <Post: 4th title of post>]>
```

> **หมายเหตุ** มีขีดล่างสองอัน (`_`) ระหว่าง `title` และ `contains` Django ORM นั้นใช้รูปแบบนี้ในการ แยกชื่อฟิลด์ ("title") และตัวดำเนินการหรือตัวกรอง ("contains") ถ้าคุณใช้ขีดล่างแค่อันเดียว คุณจะพบกับข้อผิดพลาด "FieldError: Cannot resolve keyword title_contains"

You can also get a list of all published posts. We do this by filtering all the posts that have `published_date` set in the past:

{% filename %}command-line{% endfilename %}

```python
>>> from django.utils import timezone
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet []>
```

Unfortunately, the post we added from the Python console is not published yet. But we can change that! First get an instance of a post we want to publish:

{% filename %}command-line{% endfilename %}

```python
>>> post = Post.objects.get(title="Sample title")
```

จากนั้น เผยแพร่โพสต์โดยใช้ method `publish` ของเรา:

{% filename %}command-line{% endfilename %}

```python
>>> post.publish()
```

Now try to get list of published posts again (press the up arrow key three times and hit `enter`):

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.filter(published_date__lte=timezone.now())
<QuerySet [<Post: Sample title>]>
```

### จัดเรียงวัตถุ

QuerySet ให้คุณสามารถจัดเรียงรายการของวัตถุได้ มาลองเรียงลำดับตาม `created_date` กัน:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('created_date')
<QuerySet [<Post: Sample title>, <Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>]>
```

เรายังสามารถกลับผลการจัดเรียงได้โดยเพิ่ม `-` ไว้ที่ด้านหน้า:

{% filename %}command-line{% endfilename %}

```python
>>> Post.objects.order_by('-created_date')
<QuerySet [<Post: 4th title of post>,  <Post: My 3rd post!>, <Post: Post number 2>, <Post: Sample title>]>
```

### Chaining QuerySets

นอกจากนี้คุณยังสามารถรวม QuerySet โดยการ **chaining** เข้าไว้ด้วยกัน:

```python
>>> Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
<QuerySet [<Post: Post number 2>, <Post: My 3rd post!>, <Post: 4th title of post>, <Post: Sample title>]>
```

ตรงนี้มีประโยชน์มากๆ และช่วยให้คุณสร้าง query ที่ซับซ้อนได้

แจ๋ว! คุณพร้อมสำหรับบทถัดไปแล้ว! ปิดคอนโซลโดย:

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```