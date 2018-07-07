# Django views – time to create!

ได้เวลาแก้บั๊กในบทก่อนหน้านี้แล้ว! :)

*view* คือส่วนที่เราใส่ "logic" ของโปรแกรมของเรา โดยจะขอข้อมูลจาก `model` ที่คุณสร้างก่อนหน้านี้และส่งไปยัง `template` เราจะสร้าง template ในบทถัดไป View นั้นเป็นเพียงฟังก์ชั่นใน Python ซึ่งมีความซับซ้อนกว่าที่เราเคยสร้างในบท **ความรู้เบื้องต้นเกี่ยวกับ Python** นิดหน่อย

view จะอยู่ในไฟล์ `views.py` เราจะเพิ่ม *view* ของเราลงในไฟล์ `blog/views.py`

## blog/views.py

โอเค เปิดไฟล์นี้ขึ้นมาดูว่ามีอะไรข้างใน:

{% filename %}blog/views.py{% endfilename %}

```python
from django.shortcuts import render

# Create your views here.
```

Not too much stuff here yet.

Remember that lines starting with `#` are comments – this means that those lines won't be run by Python.

Let's create a *view* as the comment suggests. Add the following minimal view below it:

{% filename %}blog/views.py{% endfilename %}

```python
def post_list(request):
    return render(request, 'blog/post_list.html', {})
```

อย่างที่คุณเห็น เราได้สร้างฟังก์ชั่น (`def`) ที่ชื่อว่า `post_list` โดยรับ `request` และ `return` ฟังก์ชั่น `render` ซึ่งจะแสดงผล (ซึ่งรวมเข้ากับ) template ของเราคือไฟล์ `blog/post_list.html`.

บักทึกไฟล์ แล้วไปที่ http://127.0.0.1:8000/ และดูว่าเกิดไรขึ้น

เกิดข้อผิดพลาดอีกแล้ว! ลองอ่านดูว่าเกิดไรขึ้นตอนนี้:

![ข้อผิดพลาด](images/error.png)

This shows that the server is running again, at least, but it still doesn't look right, does it? ไม่ต้องกังวลไป มันก็แค่ข้อความที่แสดงถึงข้อผิดพลาด ไม่มีอะไรให้ต้องกลัวเลย! มันก็เหมือนข้อความที่แสดงข้อผิดพลาดในคอนโซล จริงๆแล้วมันมีประโยชน์มากเลยนะ คุณอ่านได้ว่า *TemplateDoesNotExist* งั้นเรามาแก้บั๊คและสร้างเทมเพลตในบทต่อไปกันเลย!

> ข้อมูลเพิ่มเติมเกี่ยวกับ Django view สามารถดูได้ที่หน้าเอกสารของโครงการ Django: https://docs.djangoproject.com/en/1.11/topics/http/views/