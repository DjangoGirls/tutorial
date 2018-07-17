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

> โปรดจำไว้ว่า ในการเขียนคำสั่งใหม่ในขณะที่เว๊บเซอร์เวอร์กำลังรันอยู่นั้น ให้เปิดหน้าต่างเทอร์มินัลใหม่และเปิดใช้งาน virtualenv เราสามารถตรวจสอบวิธีการเขียนคำสั่งใหม่ในบท **โปรเจ็ค Django แรกของคุณ!** ในส่วน ** การเริ่มต้นเว็บเซิร์ฟเวอร์ </ 0></p> </blockquote> 
> 
> {% filename %}Mac OS X or Linux:{% endfilename %}
> 
>     (myvenv) ~/djangogirls$ python manage.py createsuperuser
>     
> 
> {% filename %}Windows:{% endfilename %}
> 
>     (myvenv) C:\Users\Name\djangogirls> python manage.py createsuperuser
>     
> 
> เมื่อได้รับแจ้ง ให้พิมพ์ username (ด้วยตัวพิมพ์เล็ก ไม่เว้นช่องว่าง) อีเมล์ และรหัสผ่าน **คุณไม่ต้องกังวลใจที่คุณไม่เห็นรหัสผ่านที่คุณกำลังพิมพ์ – มันควรจะเป็นแบบนั้นแหละ** แค่พิมพ์รหัสผ่านให้ครบและถูกต้องแล้วกด Enter เพื่อดำเนินการต่อ ผมลัพธ์ควรมีหน้าตาแบบนี้ (username และอีเมล์ควรจะเป็นของคุณเอง)
> 
>     Username: admin
>     Email address: admin@admin.com
>     Password:
>     Password (again):
>     Superuser created successfully.
>     
> 
> กลับไปยังเบราว์เซอร์ของคุณ เข้าระบบด้วยบัญชีที่คุณเพิ่งสร้างเมื่อสักครู่ คุณก็จะเห็นหน้าแดชบอร์ดของ Django admin แล้วตอนนี้
> 
> ![Django admin](images/django_admin3.png)
> 
> ไปยัง Posts และเริ่มลองเล่นกับมันซักหน่อย เพิ่มบล็อกโพสต์ห้าหรือหกอัน ไม่ต้องสนใจเกี่ยวกับเนื้อหา - คุณสามารถก๊อปและวางเนื้อหาบางส่วนจากในบทเรียนนี้มาใช้ได้เลยเพื่อประหยัดเวลา :)
> 
> ตรวจสอบให้แน่ใจว่า อย่างน้อยสองหรือสามโพสต์ (แต่ไม่ต้องทั้งหมด) มีการตั้งค่าวันที่เผยแพร่ เราจะใช้ประโยชน์จากส่วนนี้ในภายหลัง
> 
> ![Django admin](images/edit_post3.png)
> 
> If you want to know more about Django admin, you should check Django's documentation: https://docs.djangoproject.com/en/2.0/ref/contrib/admin/
> 
> ตอนนี้น่าจะเป็นช่วงเวลาจิบกาแฟ (หรือชา) หรือหาอะไรทานเพื่อเพิ่มพลัง คุณได้สร้างโมเดล Django แรกของคุณ - และคุณสมควรที่จะได้พักบ้าง!