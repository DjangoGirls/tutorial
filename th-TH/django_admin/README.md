# Django admin

การ เพิ่ม, แก้ไข และ ลบโพสต์ที่เราเพิ่งสร้างโมเดลไปนั้น เราจะทำโดยใช้ Django admin

เรามาเปิดไฟล์ `blog/admin.py` และแทนที่ข้างในไฟล์ด้วย:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

อย่างที่คุณเห็น เรามีการ import (รวม) โมเดลโพสต์ที่เราได้ทำในบทที่แล้วมาด้วย การทำให้โมเดลของเราปรากฎในหน้า admin เราต้องทำการลงทะเบียนโมเดลของเรา โดยใช้ `admin.site.register(Post)`.

เอาล่ะ มาดูกันว่าโมเดลโพสต์ของเราหน้าตาเป็นไง อย่าลืมรัน `python manage.py runserver` ในคอนโซลเพื่อเปิดใช้เว็บเซิร์ฟเวอร์ ไปยังเบราว์เซอร์ของคุณ และพิมพ์ http://127.0.0.1:8000/admin/ คุณจะเห็นหน้าเข้าสู่ระบบ แบบนี้:

![หน้าล็อกอิน](images/login_page2.png)

การเข้าสู่ระบบ คุณต้องสร้าง *superuser* - ซึ่งสามารถควบคุมทุกอย่างบนเว็บนี้ได้ กลับไปยัง command line หรือบรรทัดคำสั่ง พิมพ์ `python manage.py createsuperuser` จากนั้นกด enter

> โปรดจำไว้ว่า ในการเขียนคำสั่งใหม่ในขณะที่เว๊บเซอร์เวอร์กำลังรันอยู่นั้น ให้เปิดหน้าต่างเทอร์มินัลใหม่และเปิดใช้งาน virtualenv We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

{% filename %}Mac OS X or Linux:{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    

{% filename %}Windows:{% endfilename %}

    (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
    

When prompted, type your username (lowercase, no spaces), email address, and password. **Don't worry that you can't see the password you're typing in – that's how it's supposed to be.** Just type it in and press `enter` to continue. The output should look like this (where the username and email should be your own ones):

    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

Return to your browser. Log in with the superuser's credentials you chose; you should see the Django admin dashboard.

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

Make sure that at least two or three posts (but not all) have the publish date set. It will be helpful later.

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!