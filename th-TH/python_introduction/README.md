{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# ความรู้เบื้องต้นเกี่ยวกับ Python

> บางส่วนของบทนี้ยึดหลักจากบทเรียนของ Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

มาเริ่มเขียนโค้ดกันเถอะ!

## Python prompt

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Integers, Strings, Lists, Variables และ Errors](https://www.youtube.com/watch?v=MO63L4s-20U)

ก่อนที่เราจะเริ่มใช้งาน Python เราจะต้องเปิด *command line* บนคอมพิวเตอร์ของคุณซะก่อน คุณควรที่จะรู้ว่าคุณต้องทำยังไง คุณเรียนมันไปแล้วในบท [Intro to Command Line](../intro_to_command_line/README.md)

เมื่อคุณพร้อม ก็เริ่มทำตามขั้นตอนด้านล่างนี้ได้เลย

เราต้องการเปิดคอนโซล Python ฉะนั้นพิมพ์ `python` บนระบบปฏิบัติการ Windows หรือ `python3` บน ระบบปฏิบัติการ Mac OS/Linux แล้วกด `enter`

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## คำสั่ง Python แรกของคุณ!

หลังจากที่เรารันคำสั่ง Python ข้อความพร้อมรับก็จะเปลี่ยนเป็น `>>>`. สำหรับเรา นั่นหมายถึงตอนนี้เราสามารถที่จะใช้คำสั่งในภาษา Python ได้เพียงอย่างเดียวเท่านั้น คุณไม่ต้องพิมพ์ `>>>` Python จะทำให้คุณเอง

If you want to exit the Python console at any point, type `exit()` or use the shortcut `Ctrl + Z` for Windows and `Ctrl + D` for Mac/Linux. หลังจากนั้นคุณจะไม่เห็น `>>>` อีกต่อไป

สำหรับตอนนี้ เราไม่อยากออกไปจากส่วนควบคุม Python เรายังอยากเรียนเพิ่มเติ่มเกี่ยวกับ Python งั้นเรามาเริ่มจากการพิมพ์คำสั่งเกี่ยวกับคณิตศาสตร์ อย่างเช่น `2 + 3` แล้วกด `enter`

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

หูยยยดีอ่ะ! เห็นคำตอบที่โผล่ขึ้นมามั้ย? Python คำนวณได้ด้วย! คุณสามารถลองคำสั่งอื่นๆอย่าง:

- `4 * 5`
- `5 - 1`
- `40 / 2`

ในการคำนวณเลขยกกำลัง เช่น 2 ยกกำลัง 3 เราก็พิมพ์: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

ลองสนุกกับมันซักหน่อย แล้วกลับมาที่นี่นะ :)

อย่างที่คุณเห็น Python เป็นเครื่องคิดเลขที่เยี่ยมมาก ถ้าคุณอยากรู้ว่าคุณสามารถทำอะไรกับมันได้อีก...

## String

ชื่อคุณเป็นไง? ลองพิมพ์ชื่อของคุณในเครื่องหมายคำพูดหรืออัญประกาศ แบบนี้:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

คุณเพิ่งสร้าง string แรกของคุณ! String เป็นลำดับของตัวอักษรหลายๆตัวเรียงต่อกันที่สามารถประมวลผลได้โดยคอมพิวเตอร์ String นั้นต้องอยู่ในเครื่องหมายคำพูดหรืออัญประกาศเสมอ มันอาจจะเป็นอัญประกาศเดี่ยว (`'`) หรืออัญประกาศคู่ (`"`) (ซึ่งเราสามารถใช้ได้ทั้งคู่!) เครื่องหมายคำพูดหรืออัญประกาศเหล่านี้จะบอก Python ว่าข้างในนั้นคือ string

เราสามารถนำ String มารวมกันได้ ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

นอกจากนี้ คุณยังสามารถคูณจำนวน string ได้อีกด้วย:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

ถ้าคุณต้องการใส่เครื่องหมายวรรคตอนหรืออะพอสทรอฟี (') ใน string คุณสามารถทำได้สองวิธี

ใช้เครื่องหมายอัญประกาศคู่:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

หรือใช้เครื่องหมายวรรคตอนหรืออะพอสทรอฟรีร่วมกับเครื่องหมายทับขวา (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Nice, huh? To see your name in uppercase letters, type:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

คุณเพิ่งใช้ `upper` **method** กับ string ของคุณ เมธอท (เช่น `upper()`) เป็นลำดับของคำสั่งของ Python ที่มีการดำเนินการบนวัตถุที่กำหนด (`"Ola"`) เมื่อคุณเรียกใช้มัน

ถ้าคุณอยากรู้ว่าชื่อของคุณมีกี่ตัวอักษร มันก็มี **function** ที่ทำหน้าที่นี้เหมือนกัน!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

คุณสงสัยมั้ยว่า ทำไมบางครั้งคุณเรียกใช้ฟังก์ชั่นโดยมี `.` อยู่ท้าย string (เช่น `"Ola".upper()`) และบางครั้งก็เรียกใช้ฟังก์ชั่นโดยมี string อยู่ในวงเล็บ? คืองี้ บางกรณี ฟังก์ชั่นก็เป็นของวัตถุ เช่น `upper()` ซึ่งสามารถใช้ได้เฉพาะกับ string ในกรณีนี้ เราเรียกฟังก์ชั่นว่า **method** กรณีอื่นๆ ที่ฟังก์ชั่นไม่ได้เป็นของวัตถุใดวัตถุหนึ่ง และยังสามารถใช้ได้กับวัตถุชนิดอื่นๆ ได้ เช่น `len()` นั่นคือเหตุผลที่เราใช้ `"Ola"` เป็นพารามิเตอร์ให้กับฟังก์ชัน `len`

### บทสรุป

เอาล่ะ พอก่อนเนอะสำหรับ string จนถึงตอนนี้คุณได้เรียนรู้เกี่ยวกับ:

- **prompt** - คือการพิมพ์คำสั่ง (โค้ด) ลงใน Python prompt ซึ่งผลที่ได้จะมาจากการรันโค้ด Python
- **numbers and strings** - ในภาษา Python ตัวเลขจะใช้ในการคำนวณทางคณิตศาสตร์และ string จะใช้สำหรับวัตถุประเภทข้อความ
- **operators** - เช่น `+` และ `*` จะเป็นการรวมค่าเพื่อใช้ให้การหาค่าใหม่
- **functions** – เช่น `upper()` และ `len()` จะทำงานกับวัตถุ

สิ่งเหล่านี้เป็นพื้นฐานของทุกภาษาเขียนโปรแกรมที่คุณเรียนรู้ คุณพร้อมสำหรับอะไรที่ยากกว่านี้แล้วใช่มั้ย? เรารู้ว่าคุณพร้อม!

## ความผิดพลาด

มาลองทำอะไรใหม่ๆกันบ้าง เราจะหาความยาวของตัวเลขได้เหมือนกับที่เราหาความยาวของชื่อเราได้มั้ยนะ? ลองพิมพ์ `len(304023)` แล้วกด `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

เราเพิ่งเจอข้อผิดพลาดแรกของเรา! สัญลักษณ์ {{ warning_icon }} จะเป็นวิธีที่เราจะบอกกับคุณว่า โค้ดที่คุณกำลังจะรันนั้นจะไม่สามารถทำงานได้อย่างที่คุณคาดหวัง การทำผิดพลาด (รวมถึงความผิดพลาดที่เจตนา) เป็นส่วนสำคัญของการเรียนรู้!

ข้อผิดพลาดนี้บอกเราว่า "int" (integer หรือ จำนวนเต็ม) นั้นไม่สามารถหาความยาวได้ แล้วเราจำทำยังไงล่ะทีนี้? บางทีเราน่าจะเปลี่ยนให้ตัวเลขของเราเป็น string? เพราะ string มีความยาว จริงมั๊ย?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

เฮ้ย มันใช้ได้! เราใช้ฟังก์ชัน `str` ข้างในฟังก์ชัน `len` อีกที, `str()` จะแปลงทุกอย่างให้เป็น string

- ฟังก์ชัน `str` จะแปลงสิ่งต่างๆ ให้กลายเป็น **string**
- ฟังก์ชัน `int` จะแปลงสิ่งต่างๆ ให้กลายเป็น **integer**

> สิ่งสำคัญที่ต้องทราบ: เราสามารถแปลงตัวเลขให้กลายเป็นข้อความได้ แต่เราไม่สามารถแปลงข้อความให้เป็นตัวเลขได้ - `int('hello')` จะแปลงคำว่า hello ให้กลายเป็นจำนวนเต็มได้ยังไงล่ะเนี่ย?

## ตัวแปร

แนวคิดสำคัญในการเขียนโปรแกรมคือ การใช้ตัวแปร ตัวแปรนั้นไม่มีอะไรมากกว่าการเป็นชื่อ ที่คุณสามารถนำไปใช้ในภายหลังได้ โปรแกรมเมอร์ใช้ตัวแปรในการเก็บข้อมูล มันทำให้อ่านโค้ดได้ง่ายขึ้นและยังช่วยให้พวกเขาไม่ต้องจำค่าต่างๆที่อยู่ในโปรแกรม

สมมุติว่าเราอยากจะสร้างตัวแปลที่ใช้ชื่อว่า `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

เราก็พิมพ์ name เท่ากับ Ola

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Enter `name` and hit `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

วู้ฮู้วว! ตัวแปรแรกของคุณ! :) คุณสามารถเปลี่ยนค่าที่ตัวแปรสื่อถึงได้ตลอดนะ:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

คุณใช้มันในฟังก์ชั่นก็ได้นะ:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Now, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

แต่ถ้าเกิดเราใช้ชื่อตัวแปรไม่ถูกล่ะ? คุณเดาได้มั้ยว่าจะเกิดอะไรขึ้น? มาลองดูกัน!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

เออเร่อ! คุณจะเห็นได้ว่า Python มีข้อผิดพลาดหลากหลายชนิด และข้อผิดพลาดนี้เรียกว่า **NameError** Python จะแสดงข้อผิดพลาดนี้ออกมา ถ้าคุณพยายามใช้ตัวแปรที่ยังไม่มีหรือยังไม่ได้กำหนด ถ้าคุณพบข้อผิดพลาดนี้ในภายหลัง ลองตรวจโค้ดของคุณดู คุณอาจจะพิมพ์ชื่อผิดซักที่ก็เป็นได้

ลองเล่นกับมันดูนะ และดูว่าคุณสามารถทำอะไรได้แค่ไหน!

## ฟังก์ชั่นการแสดงผล

ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

เมื่อคุณพิมพ์ `name` ตัวประมวลผลของภาษา Python จะตอบกลับมาด้วย string ของตัวแปร 'name' *ที่อ้างถึง* ซึ่งก็คือตัวอักษร M-a-r-i-a ที่มีเครื่องหมายอัญประกาศเดี่ยวครอบอยู่ เมื่อคุณใช้ `print(name)` Python จะ "แสดง" เนื้อหาที่อยู่ในตัวแปรออกมาบนหน้าจอ โดยที่ไม่มีเครื่องหมายอัญประกาศ ซึ่งจะดูเรียบร้อยกว่า

เราจะเห็นได้ในภายหลังว่า `print()` นั้นมีประโยชน์เมื่อเราต้องการแสดงผลของค่าบางอย่างที่อยู่ข้างในฟังก์ชั่น หรือเมื่อเราต้องการแสดงผลทีละหลายๆ บรรทัด

## List

นอกจาก string และ interger แล้ว Python ยังมีประเภทข้อมูลชนิดต่างๆ อยู่อีก ตอนนี้เราจะแนะนำให้คุณรู้จักหนึ่งในนั้น ซึ่งก็คือ **list** List คือสิ่งที่คุณคิดไว้นั้นแหละ: เป็นวัตถุที่เก็บรายการของวัตถุอื่นๆ ยังไงล่ะ :)

มาลองสร้าง list กัน:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

ใช่แล้ว นี่คือ list ว่างเปล่า ไม่ค่อยมีประโยชน์เลยใช่มั้ย? เราลองมาสร้าง list ของหมายเลขลอตเตอรี่กัน เราจะไม่ทำแบบเดิมซ้ำๆ แล้ว ดังนั้นเราจะใส่ไว้ในตัวแปรซะเลย:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

เอาล่ะ เรามี list แล้ว! แล้วเราทำอะไรกับมันได้บ้างล่ะ? เรามาดูกันว่า เรามีหมายเลขลอตเตอรี่อยู่กี่อันภายใน list คุณพอรู้มั้ยว่าเราจะใช้ฟังก์ชั่นไหน? แน่นอน คุณรู้อยู่แล้ว!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

ใช่แล้ว! ฟังก์ชัน `len()` จะบอกคุณได้ว่ามีวัตถุอยู่ใน list กี่อัน สะดวกดีใช่มั้ยล่ะ? บางทีเราควรจะเรียงเลขข้างในนะ:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

ไม่มีอะไรตอบกลับมาเลย เพราะมันแค่เปลี่ยนลำดับของ list งั้นเราลองพิมพ์ list ออกมาดูอีกทีว่าเกิดอะไรขึ้น:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

อย่างที่คุณเห็น ตัวเลขใน list ของคุณถูกเรียงจากน้อยไปหามาก ยินดีด้วย!

บางทีเราต้องการจะกลับด้านจากมากไปหาน้อย? มาลองกันเลย!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

ถ้าคุณอยากจะเพิ่มอะไรซักอย่างเข้าไปใน list คุณสามารถทำได้โดยใช้คำสั่ง:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

ถ้าคุณต้องการจะแสดงเฉพาะหมายเลขแรก คุณสามารถทำได้โดยใช้ **indexes** ดัชนีคือตัวเลขที่บอกตำแหน่งของสิ่งที่อยู่ใน list โปรแกรมเมอร์จะเริ่มนับจาก 0 เพราะฉะนั้นสิ่งที่อยู่เป็นอันดับแรกในลิสต์ ก็คือ ดัชนีหมายเลข 0 ถัดไปก็คือ 1 และต่อไปเรื่อยๆ ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

คุณจะเห็นได้ว่า คุณสามารถเข้าถึงสิ่งที่อยู่ใน list โดยใช้ชื่อของ list และระบุดัชนีตำแหน่งข้างในวงเล็บเหลี่ยม

ในการลบบางสิ่งจาก list ของคุณ คุณจะต้องใช้ **ดัชนี** ดังที่เราได้เรียนไปแล้วจากด้านบน รวมถึงการใช้เมธอด `pop()` เรามาลองทำตามตัวอย่างนี้เพื่อทบทวนสิ่งที่เรียนมาข้างต้น เราจะทำการลบเลขตัวแรกออกจาก list ของเรา

{% filename %}command-line{% endfilename %}

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

มันทำงานได้ถูกต้องเหมือนมีเวทมนตร์เลยล่ะ!

เพื่อความสนุกยิ่งขึ้น ลองใช้ค่าดัชนีอื่นๆ เช่น: 6, 7, 1000, -1, -6 หรือ -1000 แล้วดูว่าคุณสามารถเดาผลลัพธ์ก่อนที่จะลองพิมพ์คำสั่งได้มั้ย แล้วผลลัพธ์ที่ว่า มันสมเหตุสมผลมั้ย?

คุณสามารถหาฟังก์ชั่นทั้งหมดของ list ได้จากเอกสารในเว็บ Python: https://docs.python.org/3/tutorial/datastructures.html

## Dictionary

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c)

Dictionary นั่นก็คล้ายๆกับ list แต่การเข้าถึงค่าของตัวแปรข้างในต้องใช้ key แทนที่ดัชนี ซึ่ง key นั้นสามารถเป็นได้ทั้ง string หรือ ตัวเลข ส่วนไวยากรณ์(วากยสัมพันธ์) สำหรับสร้าง dictionary เปล่าๆนั้นคือ:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

นี่แสดงว่า คุณเพิ่งสร้าง dictionary เปล่าขึ้นมาแล้ว ฮูเร่!

ตอนนี้ มาลองใช้คำสั่งตามนี้ (ลองเปลี่ยนข้อมูลข้างในด้วยนะ):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

คำสั่งนี้ เป็นการสร้างตัวแปร ชื่อ `participant` ซึ่งมี key-value สามค่า:

- Key ชื่อ `name` ชี้ไปยังค่า `'Ola'` (เป็นวัตถุประเภท `string`)
- `country` ชี้ไปยัง `'Poland'` (เป็น `string` อีกอัน),
- และ `favorite_numbers` ชี้ไปยัง `[7, 42, 92]` (เป็น `list` ที่มีตัวเลขสามตัวข้างใน)

คุณสามารถตรวจสอบค่าที่อยู่ในแต่ละ key ได้จาก:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

เห็นรึเปล่าว่ามันคล้าย list นะ และคุณไม่จำเป็นต้องจำดัชนี ใช้แค่จำชื่อก็พอ

จะเกิดไรขึ้น ถ้าคุณต้องการหาค่าจาก key ที่ไม่มีอยู่จริง? มาลองดูกัน!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

ดูสิ! เกิดข้อผิดพลาดอีกอันนึงแล้ว! อันนี้เรียกว่า **KeyError** Python พยายามช่วยเราด้วยการบอกว่า key ชื่อ `'age'` ไม่มีอยู่ใน dictionary

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

- ถ้าคุณต้องการข้อมูลที่เป็นลำดับ? ใช้ list
- ถ้าคุณต้องการเชื่องโยงค่าข้อมูลโดยใช้ key เพื่อที่จะค้นหาได้ในภายหลังอย่างมีประสิทธิภาพ (โดยใช้ key)? ใช้ dictionary

Dictionary ก็คล้ายๆกับ list คือมัน *mutable* หมายถึงเราสามารถแก้ไขค่าต่างๆ ข้างใน dictionary ได้ หลังจากที่เราสร้างมันขึ้นมาแล้ว คุณสามารถเพิ่ม key - value เข้าไปยัง dictionary ที่สร้างขึ้นมาแล้ว แบบนี้:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

เช่นเดียวกับ list เราใช้ `len()` กับ dictionary เพื่อหาจำนวนคู่ของ key-value ใน dictionary ลองพิมพ์คำสั่งต่อไปนี้ดู:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

เราหวังว่าคุณคงเข้าใจมันบ้างแล้วนะ :) คุณพร้อมที่จะรับความสนุกของ dictionary แล้วใช่มั้ย? ลองอ่านต่อไปสิ สิ่งที่น่าอัศจรรย์อยู่ถัดไปจากบรรทัดนี้แล้ว

คุณสามารถใช้คำสั่ง `pop()` เพื่อลบสมาชิกภายใน dictionary ได้ Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

อย่างที่คุณเห็นจากผลลัพธ์ ค่าของ key-value ที่อยู่ใน key 'favorite_number' ได้ถูกลบไปแล้ว

นอกจากนี้ คุณยังสามารถเปลี่ยนค่าต่างๆ ที่มี key อยู่ข้างใน dictionary อยู่แล้ว ลองพิมพ์ตามนี้ดู:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

อย่างที่คุณเห็น ค่าของ key ที่ชื่อ `'country'` ถูกเปลี่ยนจาก `'Poland'` เป็น `'Germany'` :) น่าตื่นเต้นใช่ไหม? ฮู้เร่! คุณได้รู้สิ่งที่น่าอะเมซิงอีกหนึ่งอย่างแล้ว

### บทสรุป

เจ๋งไปเลย! ตอนนี้คุณได้เรียนรู้เกี่ยวกับการเขียนโปรแกรมเพิ่มมากขึ้นแล้ว ในส่วนที่ผ่านมา คุณได้เรียนรู้เกี่ยวกับ:

- **errors** - ตอนนี้คุณได้รู้วิธีการอ่านและทำความเข้าใจเกี่ยวกับข้อผิดพลาดต่างๆ ที่ Python ได้แสดงให้คุณเห็น เมื่อ Python ไม่เข้าใจเกี่ยวกับคำสั่งที่คุณป้อนเข้าไป
- **variables** หรือ ตัวแปร - ชื่อสำหรับวัตถุต่างๆ ที่ช่วยให้คุณเขียนโค้ดได้ง่ายขึ้น และยังทำให้โค้ดอ่านง่ายมากขึ้นอีกด้วย
- **list** - ลิสต์ที่เก็บรายการวัตถุอย่างเป็นลำดับที่เฉพาะเจาะจง
- **dictionary** - ข้อมูลของวัตถุจะถูกเก็บอยู่ในรูปแบบของคู่ key-value

ตื่นเต้นสำหรับส่วนถัดไปแล้วใช่มั้ย? :)

## การเปรียบเทียบสิ่งต่างๆ

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=7bzxqIKYgf4)

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers! Let's see how that works:

{% filename %}command-line{% endfilename %}

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

เราให้ Python เปรียบเทียบตัวเลขที่เราให้ไป คุณจะเห็นได้ว่า Python ไม่เพียงแต่สามารถเปรียบเทียบตัวเลขได้เท่านั้น แต่ยังสามารถเปรียบเทียบค่าที่ได้จากผลลัพธ์จากการใช้ฟังก์ชั่นได้อีกด้วย เจ๋งไปเลยใช่มั้ยล่ะ?

คุณคงสงสัยว่าทำไมต้องใช้เครื่องหมายเท่ากับถึงสองอันติดกันแบบนี้ `==` เพื่อเปรียบเทียบว่าตัวเลขนั้นเท่ากันหรือไม่? เพราะเราใช้เครื่องหมาย `=` อันเดียว สำหรับกำหนดค่าให้กับตัวแปรไปแล้วนั่นเอง คุณจำเป็นต้องใส่เครื่องหมาย `==` **เสมอ** ถ้าคุณต้องการตรวจสอบว่าทั้งสองค่าเท่ากันหรือไม่ นอกจากนี้เรายังสามารถเปรียบเทียบสิ่งที่ไม่เท่ากันได้อีกด้วย เราใช้เครื่องหมาย `!=` เหมือนในตัวอย่างด้านบน

ลองให้ Python ทำเพิ่มอีกซักสองคำสั่ง:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

เรารู้จักเครื่องหมาย `>` และ `<` แล้วเครื่องหมาย `>=` กับ `<=` ล่ะ มันหมายถึงอะไร? มันอ่านแบบนี้:

- x `>` y หมายถึง: x มีค่ามากกว่า y
- x `<` y หมายถึง: x มีค่าน้อยกว่า y
- x `<=` y หมายถึง: x มีค่าน้อยกว่าหรือเท่ากับ y
- x `>=` y หมายถึง: x มีค่ามากกว่าหรือเท่ากับ y

เจ๋งไปเลย! อยากทำอีกมั้ย? ลองนี่สิ:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

คุณสามารถให้ Python เปรียบเทียบตัวเลขหลายๆตัวได้มากเท่าที่คุณต้องการ แล้วมันก็ให้คำตอบกับคุณเสมอด้วย! ฉลาดสุดๆ เลยใช่ป่ะ?

- **and** - ถ้าคุณใช้ `and` หากต้องการได้ค่า True ค่าของทั้งคู่ต้องเป็นจริง
- **or** - ถ้าคุณใช้ `or` หากต้องการได้ค่า True ค่าใดค่าหนึ่งต้องเป็นจริง

คุณเคยได้คำนี้ไหม "เปรียบเทียบแอปเปิ้ลกับส้ม" เรามาลองอะไรที่คล้ายๆ กันนี้ บน Python กัน:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

จะเห็นได้ว่า Python ไม่สามารถเปรียบเทียบค่าของตัวเลขจำนวนเต็ม (`int`) และ string (`str`) ได้ Python แสดงข้อผิดพลาด **TypeError** ออกมา และบอกเราว่า สองชนิดนี้ไม่สามารถเปรียบเทียบกันได้

## ค่าบูลีน

คุณเพิ่งบังเอิญได้เรียนรู้เกี่ยวกับชนิดของวัตถุชนิดใหม่ในภาษา Python นั้นก็คือ **Boolean** หรือ ค่าบูลีน

Boolean มีเพียงแค่สองค่าเท่านั้น คือ:

- True (จริง)
- False (ไม่จริง)

ถ้าจะให้ Python เข้าใจสิ่งนี้ คุณต้องเขียนให้ถูกต้องแบบนี้เสมอ 'True' (ตัวแรกเป็นตัวอักษรตัวใหญ่ นอกนั้นเป็นตัวเล็กหมด) **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Boolean ก็สามารถเป็นตัวแปรได้เช่นกัน! ลองดูนี่:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

คุณสามารถทำแบบนี้ได้เช่นกัน:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

ลองซ้อมและสนุกไปกับ Boolean โดยลองใช้คำสั่งเหล่านี้:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

ยินดีด้วย! Boolean เป็นฟีเจอร์ที่เจ๋งสุดๆในการเขียนโปรแกรม และคุณเพิ่งได้เรียนรู้วิธีใช้มัน!

# เซฟซะ!

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=dOAg6QVAxyk)

จนถึงตอนนี้ เราก็ได้เขียนโค้ด python ทั้งหมดลงในตัวแปลคำสั่ง ซึ่งจะมีข้อจำกัดในเรื่องการป้อนคำสั่งทีละบรรทัด โปรแกรมปกติจะถูกบันทึกลงในไฟล์และเรียกใช้งานโดย **อินเตอร์พรีเตอร์** หรือ **คอมไพเลอร์** จนถึงตอนนี้เราได้รันโค้ดของเราทีละบรรทัดใน Python **อินเตอร์พรีเตอร์** (ตัวแปลคำสั่ง) จากนี้ไปเราจำเป็นต้องใช้โค้ดมากกว่าหนึ่งบรรทัด งั้นตอนนี้เราจำเป็นต้อง:

- ออกจาก Python interpreter
- เปิดโปรแกรมแก้ไขโค้ดที่เราเลือก
- บันทึกโค้ดลงในไฟล์ python ไฟล์ใหม่
- แล้วเรียกใช้มัน!

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

หลังจากเรียกใช้ฟังก์ชัน คุณจะถูกพากลับมายัง command prompt

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

จริงๆ แล้วตอนนี้ คุณก็มีความรู้เกี่ยวกับ Python พอตัวแล้ว งั้นลองเขียนโค้ดที่คุณได้เรียนจากวันนี้ดู

ตอนนี้เราต้องบันทึกไฟล์ และตั้งชื่อที่มีความหมาย เราจะตั้งชื่อว่า **python_intro.py** และบันทึกไฟล์เก็บไว้ที่หน้าจอเดสก์ท็อปของคุณ เราสามารถตั้งชื่อไฟล์อะไรใดก็ได้ที่เราต้องการ แต่สิ่งที่สำคัญก็คือชื่อไฟล์ต้องลงท้ายด้วย **.py** นามสกุล **.py** จะบอกระบบปฏิบัติการว่าเป็น **python executable file** และ Python สามารถรันไฟล์นี้ได้

> **หมายเหตุ** คุณคงสังเกตเห็นสิ่งที่เจ๋งสุดๆอย่างนึงของ code editor นั้นก็คือสีนั่นเอง! ในคอนโซล Python ทุกอย่างจะเป็นสีเดียวกันหมด ตอนนี้คุณจะเห็นว่าฟังก์ชัน `print` มีสีที่ต่างจาก string มันมีชื่อว่า "syntax highlighting" และเป็นฟีเจอร์ที่มีประโยชน์มากๆ เมื่อเขียนโค้ด ซึ่งสีแต่ละสีจะบ่งบอกสิ่งที่แตกต่างกัน เช่น string ที่ไม่ได้ปิดด้วยเครื่องหมายอัญประกาศหรือชื่อ keyword ที่พิมพ์ผิด (เช่น `def` ซึ่งเดี๋ยวเราจะได้เห็นตัวอย่างด้านล่างนี้) นี่เป็นหนึ่งเหตุผลว่าทำไมเราถึงใช้โปรแกรมแก้ไขโค้ด. :)

เรามีไฟล์แล้ว ตอนนี้ถึงเวลาที่เราจะรันมัน! โดยใช้ความรู้ที่เราเรียนมาในบทการใช้บรรทัดคำสั่ง ใช้เทอร์มินัลโดย **เปลี่ยนไดเรกทอรี** ไปยังหน้าจอเดสก์ท็อป

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

บน Mac คำสั่งที่ใช้จะมีลักษณะแบบนี้:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this:

{% filename %}command-line{% endfilename %}

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

### ถ้าเกิดว่า เงื่อนไขไม่เป็นจริงล่ะ?

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
    

## คอมเม้นท์

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

### บทสรุป

In the last few exercises you learned about:

- **การเปรียบเทียบสิ่งต่างๆ** - ใน Python คุณสามารถเปรียบเทียบสิ่งต่างๆ โดยใช้ `>`, `>=`, `==`, `<=`, `<` และ `and`, `or`
- **Boolean** - คือชนิดของวัตถุซึ่งมีเพียงสองค่าคือ: `True` และ `False`
- **การบันทึกไฟล์** - คือการบันทึกโค้ดลงในไฟล์ ทำให้คุณสามารถรันโปรแกรมขนาดใหญ่ได้
- **if... elif... else** - ช่วยให้คุณรันโค้ดเมื่อตรงตามเงื่อนไขที่ต้องการ
- **comments** - เป็นบรรทัดที่ Python จะไม่รัน ช่วยให้คุณสามารถเขียนโน้ตเล็กๆเกี่ยวกับโค้ดนั้นๆได้

Time for the last part of this chapter!

## สร้างฟังก์ชั่นของคุณเอง!

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=5owr-6suOl0)

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

You may wonder why we've written the name of the function at the bottom of the file. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- ถ้ามันโชว์ว่า `NameError` นั่นหมายถึงคุณพิมพ์อะไรผิด ดังนั้นคุณควรตรวจสอบว่า คุณใช้ชื่อเดียวกันเมื่อสร้างฟังก์ชั่นด้วย เช่นคุณสร้างฟังก์ชั่นชื่อ ` def hi(): ` เมื่อคุณเรียกใช้ฟังก์ชั่น ก็ควรเรียกใช้ชื่อ `hi()` เป็นต้น
- ถ้าโปรแกรมโชว์ว่า `IndentationError` ให้ตรวจสอบว่าบรรทัดทั้งสองบรรทัดที่คุณพิมพ์ว่า `print` นั้น มีการเคาะเว้นวรรคที่เท่ากัน: Python ต้องการให้โค้ดทั้งหมดที่อยู่ในฟังก์ชั่นสอดคคล้องกันอย่างเรียบร้อย
- ถ้าหากโปรแกรมไม่แสดงเอาต์พุตใดๆเลย ให้ตรวจสอบว่า `hi()` *ไม่*ได้ถูกเยื้อง ถ้ามันถูกเยื้อง บรรทัดนี้จะถูกรวมเป็นส่วนหนึ่งของฟังก์ชั่นด้วย และมันจะไม่ถูกรัน

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

## การทำซ้ำ

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=aEA6Rc86HF0)

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

## บทสรุป

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)