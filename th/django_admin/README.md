# Django admin

To add, edit and delete the posts we've just modeled, we will use Django admin.

Let's open the `blog/admin.py` file and replace its contents with this:

{% filename %}blog/admin.py{% endfilename %}

```python
from django.contrib import admin
from .models import Post

admin.site.register(Post)
```

อย่างที่คุณเห็น เรามีการ import (รวม) โมเดลโพสต์ที่เราได้ทำในบทที่แล้วมาด้วย To make our model visible on the admin page, we need to register the model with `admin.site.register(Post)`.

เอาล่ะ มาดูกันว่าโมเดลโพสต์ของเราหน้าตาเป็นไง อย่าลืมรัน `python manage.py runserver` ในคอนโซลเพื่อเปิดใช้เว็บเซิร์ฟเวอร์ Go to your browser and type the address http://127.0.0.1:8000/admin/. You will see a login page like this:

![หน้าล็อกอิน](images/login_page2.png)

To log in, you need to create a *superuser* - a user account that has control over everything on the site. Go back to the command line, type `python manage.py createsuperuser`, and press enter.

> Remember, to write new commands while the web server is running, open a new terminal window and activate your virtualenv. We reviewed how to write new commands in the **Your first Django project!** chapter, in the **Starting the web server** section.

เราต้องพิมพ์ชื่อ username (ตัวพิมพ์เล็ก ไม่มีช่องว่าง) อีเมล์ และ รหัสผ่าน Don't worry that you can't see the password you're typing in – that's how it's supposed to be. คุณพิมพ์ลงไปได้เลย และกด `enter` เพื่อดำเนินการต่อ The output should look like this (where the username and email should be your own ones):

{% filename %}command-line{% endfilename %}

    (myvenv) ~/djangogirls$ python manage.py createsuperuser
    Username: admin
    Email address: admin@admin.com
    Password:
    Password (again):
    Superuser created successfully.
    

กลับไปยังเบราว์เซอร์ของคุณ เข้าระบบด้วยบัญชีที่คุณสร้างเมื่อสักครู่ คุณน่าจะเห็นหน้า Django admin แล้วตอนนี้

![Django admin](images/django_admin3.png)

Go to Posts and experiment a little bit with it. Add five or six blog posts. Don't worry about the content – you can simply copy-paste some text from this tutorial to save time. :)

ตรวจสอบดูว่า มีอย่างน้อยสองหรือสามโพสต์ (แต่ไม่ต้องทั้งหมด) มีการตั้งค่าวันที่เผยแพร่ เราจะใช้ประโยชน์ในภายหลัง

![Django admin](images/edit_post3.png)

If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/1.11/ref/contrib/admin/

This is probably a good moment to grab a coffee (or tea) or something to eat to re-energize yourself. You created your first Django model – you deserve a little break!