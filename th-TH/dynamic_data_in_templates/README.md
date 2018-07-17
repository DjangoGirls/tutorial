# ข้อมูลแบบ dynamic ใน template

ตอนนี้ เรามีชิ้นส่วนต่างๆ คือ: โมเดล `Post` ที่กำหนดไว้ในไฟล์ `models.py` มี `post_list` ใน `views.py` และ template แต่เราจะทำยังไงให้โพสต์ของเราปรากฎใน HTML template ของเรา? Because that is what we want to do – take some content (models saved in the database) and display it nicely in our template, right?

และนี่คือสิ่งที่ *view* จะจัดการ: เชื่อมโมเดลและ template เข้าด้วยกัน In our `post_list` *view* we will need to take the models we want to display and pass them to the template. In a *view* we decide what (model) will be displayed in a template.

OK, so how will we achieve this?

ตอนนี้เราจะเปิดไฟล์ `blog/views.py` ตอนนี้ *view* `post_list` จะมีหน้าตาแบบนี้:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

ยังจำตอนที่เราคุยกันเกี่ยวกับการนำเข้าโค้ดที่เขียนอยู่ในไฟล์อื่นได้ไหม? Now is the moment when we have to include the model we have written in `models.py`. We will add the line `from .models import Post` like this:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from .models import Post
```

The dot before `models` means *current directory* or *current application*. Both `views.py` and `models.py` are in the same directory. This means we can use `.` and the name of the file (without `.py`). จากนั้นเราก็นำเข้าชื่อของโมเดล (`Post`).

But what's next? To take actual blog posts from the `Post` model we need something called `QuerySet`.

## QuerySet

You should already be familiar with how QuerySets work. We talked about them in [Django ORM (QuerySets) chapter](../django_orm/README.md).

So now we want published blog posts sorted by `published_date`, right? We already did that in QuerySets chapter!

{% filename %}blog/views.py{% endfilename %}

```python
Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
```

Now we put this piece of code inside the `blog/views.py` file by adding it to the function `def post_list(request)`, but don't forget to first add `from django.utils import timezone`:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {})
```

The last missing part is passing the `posts` QuerySet to the template context. Don't worry – we will cover how to display it in a later chapter.

จำไว้ว่าตอนนี้เราได้สร้าง *ตัวแปร* สำหรับ QuerySet ของเรา: นั่นคือ `posts` คิดซะว่าเป็นชื่อ QuerySet ของเรา และเราจะใช้ชื่อนี้ในการอ้างถึงในครั้งหน้า

In the `render` function we have one parameter `request` (everything we receive from the user via the Internet) and another giving the template file (`'blog/post_list.html'`). The last parameter, `{}`, is a place in which we can add some things for the template to use. เราต้องตั้งชื่อให้กับค่าเหล่านั้น (เราจะใช้ชื่อ `'posts'` ในตอนน). :) ผลลัพธ์ควรมีหน้าตาแบบนี้: `{'posts': posts}`. Please note that the part before `:` is a string; you need to wrap it with quotes: `''`.

สุดท้าย ไฟล์ `blog/views.py` ของเราจะมีหน้าตาแบบนี้:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render
from django.utils import timezone
from .models import Post

def post_list(request):
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {'posts': posts})
```

เรียบร้อย! ถึงเวลาที่จะกลับไปยัง template ของเรา และแสดงผล QuerySet!

Want to read a little bit more about QuerySets in Django? You should look here: https://docs.djangoproject.com/en/2.0/ref/models/querysets/