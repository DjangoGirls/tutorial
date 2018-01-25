# แนะนำให้รู้จัก Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

มาลองเขียนโค้ดกันเลย!

## Python prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

การที่เราจะเริ่มเล่นกับ Python นั้น เราต้องเปิด *บรรทัดคำสั่ง* ขึ้นมาเสียก่อน You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

เมื่อคุณพร้อมแล้ว ทำตามคำสั่งด้านล่างนี้

เราต้องเปิดคอนโซล Python ขึ้นมา โดยพิมพ์คำสั่ง `python` บนวินโดวส์ `python3` บน Mac OS/ลินุกซ์ และกดปุ่ม `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## คำสั่ง Python แรกของคุณ!

หลังจากรันคำสั่ง Python ตัวรอรับคำสั่งจะเปลี่ยนเป็น `>>>`. สำหรับเราตอนนี้ หมายความว่าเราสามารถใช้ได้เฉพาะคำสั่งภาษา Python You don't have to type in `>>>` – Python will do that for you.

ถ้าคุณต้องการออกจากคอนโซล Python แค่พิมพ์ `exit()` คือใช้คีย์ลัด `Ctrl + Z` บนวินโดวส์ และ `Ctrl + D` สำหรับ Mac/ลินุกซ์ แล้วเครื่องหมาย `>>>` จะหายไป

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Nice! See how the answer popped out? Python knows math! You could try other commands like:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

ลองสนุกกับมันสักพักนะ แล้วกลับมาตรงนี้ต่อกัน. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## String

เอาเป็น ชื่อของคุณเป็นไง? ลองพิมพ์ชื่อของคุณในเครื่องหมายคำพูดแบบนี้:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

ตอนนี้คุณได้สร้าง string แรกของคุณแล้ว! มันเป็นลำดับของอักขระซึ่งสามารถประมวลผลได้โดยคอมพิวเตอร์ string นั้นต้องอยู่ในเครื่องหมายคำพูดเสมอ สามารถใช้ได้ทั้งเครื่องหมายคำพูดเดี่ยว (`'`) หรือเครื่องหมายคำพูดคู่ (`"`) (ซึ่งใช้ได้เหมือนกันทั้งคู่!) เครื่องหมายคำพูดบอก Python ว่า ข้างในนั้นคือ string

string สามารถนำมาต่อกันได้ ลองนี่:

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

ถ้าคุณต้องใส่เครื่องหมายจุดลูกน้ำข้างใน string คุณทำได้สองวิธี:

ใช้อัญประกาศคู่:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

หรือใช้ร่วมกับเครื่องหมาย backslash (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

แจ๋ว ใช่ไหม? ถ้าอยากได้ตัวพิมพ์ใหญ่ทั้งหมด เพียงใช้:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

คุณอาจสงสัย ทำไมบางครั้งเราเรียกใช้ฟังก์ชันโดยใช้จุด `.` ท้าย string (เช่น `"Ola".upper()`) และบางครั้งก็ใช้ฟังก์ชันโดยมี string อยู่ในวงเล็บ? คืองี้ บางกรณี ฟังก์ชันเป็นสิ่งที่อยู่ในวัตถุ เช่น `upper()` ซึ่งสามารถใช้ได้เฉพาะกับ string ในกรณีนี้ เราเรียกฟังก์ชันว่า **method** กรณีอื่น ฟังก์ชันไม่ได้เป็นของวัตถุใดวัตถุหนึ่ง และยังสามารถใช้ได้กับวัตถุชนิดอื่นๆ ได้ เช่น `len()` นั่นคือเหตุผลที่เราใส่ `"Ola"` เป็นพารามิเตอร์ให้กับฟังก์ชัน `len`

### ภาพรวม

เอาล่ะ พอก่อนสำหรับ string ตอนนี้คุณได้รู้เกี่ยวกับ:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

สิ่งเหล่านี้เป็นพื้นฐานของทุกภาษาโปรแกรมที่คุณเรียนรู้ พร้อมสำหรับของที่ยากกว่านี้แล้วใช่ไหม? เรารู้ว่าคุณพร้อม!

## ข้อผิดพลาด

มาลองของใหม่กัน เราจะสามารถหาความยาวของตัวเลขได้เหมือนกับหาความยาวของชื่อเราได้ไหมนะ? ลองพิมพ์ `len(304023)` แล้วกด `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

แล้วเราก็เจอข้อผิดพลาดอันแรกแล้ว! ซึ่งบอกเราว่าวัตถุชนิด "int" (ตัวเลข) นั้นไม่มีความยาว แล้วทำไงทีนี้? บางทีเราน่าจะเขียนให้เป็นรูปแบบเดียวกับ string? เพราะ string มีความยาว จริงมั๊ย?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

เฮ้ย มันใช้ได้! เราใช้ฟังก์ชัน `str` ข้างในฟังก์ชัน `len` อีกที, `str()` จะแปลงทุกอย่างให้เป็น string

- ฟังก์ชัน `str` แปลงสิ่งต่างๆ ให้กลายเป็น **string**
- ฟังก์ชัน `int` แปลงสิ่งต่างๆ ให้กลายเป็น **integer**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## ตัวแปร

แนวคิดสำคัญในการเขียนโปรแกรมคือ การใช้ตัวแปร ตัวแปรนั้นไม่มีอะไรมากกว่า ชื่อ สำหรับบางสิ่งบางอย่างที่คุณนำไปใช้ในภายหลังได้ โปรแกรมเมอร์ใช้ตัวแปรในการเก็บข้อมูล ทำให้โค้ดอ่านง่ายขึ้นและช่วยให้พวกเขาไม่จำเป็นต้องจดจำสิ่งต่างว่าเป็นอะไรบ้าง

สมมติว่าเราต้องการสร้างตัวแปรที่ชื่อ `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

คุณน่าจะสังเกตเห็นว่า โปรแกรมของคุณไม่ตอบอะไรกลับมาเหมือนแต่ก่อน แล้วเราดูได้ไงว่ามีตัวแปรนี้อยู่จริงๆ? ลองพิมพ์ `name` แล้วกด `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Yippee! Your first variable! :) You can always change what it refers to:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

คุณสามารถใช้มันในฟังก์ชันได้เช่นกัน:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Awesome, right? Of course, variables can be anything – numbers too! Try this:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

ถ้าเกิดเราใช้ชื่อตัวแปรไม่ถูกล่ะ? คุณเดาได้ไหมว่าจะเกิดอะไรขึ้น? ลองดูกัน!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

ข้อผิดพลาดไงล่ะ! คุณจะเห็นได้ว่า Python มีข้อผิดพลาดหลากหลายชนิด และอันนี้เรียกว่า **NameError** Python จะส่งข้อผิดพลาดนี้ออกมา เพื่อคุณพยายามใช้ตัวแปรที่ยังไม่มีหรือยังไม่มีการกำหนด ถ้าคุณพบข้อผิดพลาดนี้ในภายหลัง ลองตรวจโค้ดของคุณดู คุณอาจจะพิมพ์ชื่อผิดสักที่ก็เป็นได้

ลองเล่นกับมันดูสักพักนะ และดูว่าคุณสามารถทำอะไรได้แค่ไหน!

## ฟังก์ชันการแสดงผล

ลองนี่ดู:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

เมื่อคุณพิมพ์ `name` ตัวประมวลผลภาษา Python ตอบกลับมาด้วย string ที่ตัวแปร 'name' *อ้างถึง* ซึ่งก็คือตัวอักษร M-a-r-i-a ที่มีเครื่องหมายอัญประกาศเดี่ยวครอบอยู่ เมื่อใช้ `print(name)` Python จะ "แสดงผล" เนื้อหาที่อยู่ในตัวแปรออกมาทางหน้าจอ โดยไม่มีเครื่องหมายอัญประกาศแต่อย่างใด

เราจะเจอในภายหลังว่า `print()` มีประโยชน์เมื่อเราต้องการแสดงผลค่าบางอย่างที่อยู่ข้างในฟังก์ชัน หรือเมื่อต้องการแสดงผลออกมาทีละหลายๆ บรรทัด

## List

นอกจาก string และ ตัวเลข แล้ว Python ยังมีประเภทข้อมูลชนิดต่างๆ อยู่อีก ตอนนี้เราจะแนะนำให้รู้หนึ่งในนั้น คือ **list** List คือสิ่งที่คุณคิดไว้นั้นแหละ: เป็นวัตถุที่เก็บรายการของวัตถุอื่นๆ ไงล่ะ. :)

มาลองสร้าง list กัน:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

ใช่แล้ว นี่คือ list ว่างเปล่า ไม่มีประโยชน์เลยใช่ไหม? มาสร้าง list ของหมายเลขสลากกัน เราจะไม่ทำแบบเดิมซ้ำๆ แล้ว ดังนั้นเราจะใส่ไว้ในตัวแปรเสียเลย:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

เอาล่ะ เรามี list แล้ว! เราทำอะไรกับมันได้บ้างล่ะ? มาดูกันว่า เรามีหมายเลขสลากอยู่กี่อันภายใน list คุณพอรู้ไหมว่าเราจะใช้ฟังก์ชันไหน? แน่นอน คุณรู้อยู่แล้ว!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

ใช่แล้ว! ฟังก์ชัน `len()` บอกคุณได้ว่ามีวัตถุอยู่ใน list เท่าไหร่ สะดวกดีใช่ไหม? ตอนนี้บางที เราสามารถเรียงเลขข้างในได้นะ:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

ไม่มีอะไรตอบกลับมา มันเปลี่ยนลำดับที่อยู่ list มาลองพิมพ์ออกมาดูอีกทีว่าเกิดอะไรขึ้น:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

อย่างที่คุณเห็น หมายเลขใน list ถูกจัดเรียงเรียบร้อยแล้ว จากน้อยไปหามาก ยินดีด้วย!

บางทีเราต้องการกลับด้านลำดับข้างใน? มาลองกันเลย!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

ถ้าคุณต้องการแสดงเฉพาะหมายเลขแรก คุณสามารถทำได้โดยใช้ **ดัชนี** ดัชนีคือตัวเลขที่บอกตำแหน่งสิ่งอยู่ที่อยู่ list โปรแกรมเมอร์นั้นจะเริ่มนับที่ 0 ดังนั้น สิ่งที่อยู่เป็นอันดับแรกใน list คือ ดัชนีหมายเลข 0 ถัดไปคือ 1 และต่อไปเรื่อยๆ ลองนี่ดู:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

คุณจะเห็นได้ว่า คุณสามารถเข้าถึงสิ่งที่อยู่ใน list โดยใช้ชื่อของ list และระบุดัชนีข้างในวงเล็บก้ามปู

To delete something from your list you will need to use **indexes** as we learned above and the `pop()` method. Let's try an example and reinforce what we learned previously; we will be deleting the first number of our list.

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

ทำงานได้ถูกต้อง ประดุจดั่งมีเวทมนต์เลยล่ะ!

เพื่อความสนุก ลองใช้ดัชนีค่าอื่น เช่น: 6, 7, 1000, -1, -6 หรือ -1000 แล้วดูว่าคุณสามารถเดาผลลัพธ์ก่อนที่จะลองรันได้ไหม แล้วผลลัพธ์ที่ว่า สมเหตุสมผลหรือไหม?

คุณสามารถหาฟังก์ชันทั้งหมดของ list ได้จากเอกสารในเว็บ Python: https://docs.python.org/3/tutorial/datastructures.html

## Dictionary

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

นี่แสดงว่า คุณเพิ่งสร้าง dictionary เปล่าขึ้นมาแล้ว ฮูเร่!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- key ชื่อ `name` ชี้ไปยัง value `'Ola'` (เป็นวัตถุประเภท `string`)
- `country` ชี้ไปยัง `'Poland'` (เป็น `string` อีกอัน),
- และ `favorite_numbers` ชี้ไปยัง `[7, 42, 92]` (เป็น `list` ที่มีตัวเลขสามตัวข้างใน)

คุณสามารถตรวจสอบค่าที่อยู่ในแต่ละ key ได้จาก:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

จะเกิดไรขึ้น ถ้าคุณต้องการหาค่าจาก key ที่ไม่มีอยู่จริง? มาลองดูกัน!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

ข้อผิดพลาดอีกอัน! อันนี้เรียกว่า **KeyError** Python พยามบอกว่า key ชื่อ `'age'` ไม่มีอยู่ใน dictionary

เราจะรู้ได้ไงว่าควรใช้ dictionary หรือ list ตอนไหน? ถามได้ดี เราควรที่จะมีวิธีแก้ปัญหาในใจก่อนที่จะดูคำตอบในบรรทัดถัดไป

- คุณต้องต้อการข้อมูลที่เป็นลำดับใช่หรือไหม? ใช้ list
- คุณต้องการเชื่องโยงค่าข้อมูลโดยใช้ key เพื่อที่จะค้นหาได้ในภายหลังอย่างมีประสิทธิภาพ (โดยใช้ key)? ใช้ dictionary

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` method on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. เช่น ถ้าคุณต้องการลบรายการที่มี key `'favorite_numbers'` เพียงแค่คุณใช้คำสั่งต่อไปนี้:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see from the output, the key–value pair corresponding to the 'favorite_numbers' key has been deleted.

As well as this, you can also change a value associated with an already-created key in the dictionary. Type this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

As you can see, the value of the key `'country'` has been altered from `'Poland'` to `'Germany'`. :) Exciting? Hurrah! You just learned another amazing thing.

### ภาพรวม

แจ๋ว! ตอนนี้คุณได้รู้เกี่ยวกับการเขียนโปรแกรมเพิ่มมากขึ้นแล้ว ในส่วนที่ผ่านมา คุณได้รู้เกี่ยวกับ:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

ตื่นเต้นสำหรับส่วนถัดไปแล้วใช่ไหม? :)

## การเปรียบเทียบสิ่งต่างๆ

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers, of course. Let's see how that works:

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

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare method results. Nice, huh?

คุณคงสงสัยว่าทำไมต้องใช้เครื่องหมายเท่ากับถึงสองอันติดกันแบบนี้ `==` ระหว่างสิ่งที่ต้องการเปรียบเทียบว่าเท่ากันหรือไม่? เราใช้เครื่องหมาย `=` อันเดียว สำหรับกำหนดค่าให้กับตัวแปรไปแล้วนั่นเอง You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. นอกจากนี้เรายังสามารถเปรียบเทียบสิ่งที่ไม่เท่ากันได้อีกด้วย เราใช้เครื่องหมาย `!=` เหมือนในตัวอย่างที่แล้ว

ให้ Python ทำเพิ่มเติมอีกสองคำสั่ง:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y หมายถึง: x มากกว่า y
- x `<` y หมายถึง: x น้อยกว่า y
- x `<=` y หมายถึง: x น้อยกว่าหรือเท่ากับ y
- x `>=` y หมายถึง: x มากกว่าหรือเท่ากับ y

แจ๋ว! อยากทำเพิ่มอีกหน่อยไหม? ลองนี่ดู:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

คุณสามารถให้ Python เปรียบเทียบตัวเลขได้มากเท่าที่ต้องการ และมันก็ให้คำตอบกลับมาเสมอด้วย! ฉลาดสุดๆ เลยใช่ไหม?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

คุณเคยได้คำนี้ไหม "เปรียบเทียบ แอปเปิ้ลกับส้ม" เรามาลองอะไรที่คล้ายๆ กันนี้ บน Python กัน:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

จะเห็นได้ว่า Python ไม่สามารถเปรียบเทียบค่าของตัวเลข (`int`) และ string (`str`) ได้ Python เลขแสดงข้อผิดพลาด **TypeError** ออกมา และบอกเราว่า สองชนิดนี้ไม่สามารถเปรียบเทียบกันได้

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Boolean สามารถเป็นตัวแปรได้เช่นกัน! ลองดูนี่:

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

ยินดีด้วย! Boolean เป็นฟีเจอร์ที่เจ๋งสุดๆ ในการเขียนโปรแกรม และคุณเพิ่งได้เรียนรู้วิธีใช้มันเรียบร้อยแล้ว!

# เซฟซะ!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

จนถึงบัดดี้ เราก็ได้เขียนโค้ด python ทั้งหมดลงใน interpreter ซึ่งก็มีข้อจำกัดเรื่องการป้อนคำสั่งทีละบรรทัด โปรแกรมปกติจะถูกบันทึกลงไฟล์และเรียกใช้งานโดย **interpreter** หรือ **คอมไพเลอร์** เราได้รันโค้ดของเราทีละบรรทัดใน Python **interpreter** ตอนนี้เราต้องการที่รันทีละคำสั่งสำหรับงานถัดไป ตอนนี้เราจำเป็นต้อง:

- ออกจาก Python interpreter
- เปิดตัวแก้ไขโค้ดที่คุณเลือก
- บันทึกโค้ด python บางอย่างลงไฟล์
- แล้วเรียกใช้มัน!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

หลังจากเรียกใช้ฟังก์ชัน คุณจะถูกพากลับมายังบรรทัดคำสั่งของระบบ

ก่อนหน้านี้ เราได้เลือกว่าจะใช้โปรแกรมแก้ไขโค้ดจากบท [โปรแกรมแก้ไขโค้ด](../code_editor/README.md) เปิดใช้งานโปรแกรมและเขียนโค้ดบางอย่างลงไฟล์

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

จริงๆ แล้วตอนนี้ คุณก็มีความรู้เกี่ยวกับ Python พอตัวแล้ว เพราะงั้นลองเขียนโค้ดที่คุณได้รู้วันนี้ดู

ตอนนี้เราต้องบันทึกไฟล์ และตั้งชื่อที่สื่อความหมายให้ ตั้งชื่อว่า **python_intro.py** และบันทึกไฟล์เก็บไว้ที่เดสก์ท็อปของคุณ เราสามารถตั้งชื่อไฟล์ชื่อใดก็ได้ตามต้องการ แต่สิ่งที่สำคัญคือชื่อไฟล์ต้องลงท้ายด้วยนามสกุล **.py** The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. มีชื่อเรียกว่า "syntax highlighting" และเป็นฟีเจอร์ที่มีประโยชน์มากๆ เมื่อเขียนโค้ด The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). นี่เป็นหนึ่งเหตุผลว่าทำไมเราถึงใช้โปรแกรมแก้ไขโค้ด. :)

เรามีไฟล์แล้ว ถึงเวลาที่เราจะรันมัน! โดยใช้ความรู้ที่เราเรียนมาในบทการใช้บรรทัดคำสั่ง ใช้เทอร์มินัลโดย **เปลี่ยนไดเรกทอรี** ไปยังเดสก์ท็อป

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

บน Mac คำสั่งที่ใช้จะมีลักษณะเหมือนแบบนี้:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

On Linux, it will be like this (the word "Desktop" might be translated to your local language):

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

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

ถ้าคุณติดปัญหา ขอความช่วยเหลือได้เลย

ตอนนี้ ใช้คำสั่ง Python เพื่อรันไฟล์โค้ดของเรา แบบนี้:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

นี่แหละ! คุณเพิ่งรันโปรแกรม Python แรกของคุณที่อยู่บนไฟล์ รู้สึกดีใช่ไหม?

ตอนนี้คุณสามารถไปต่อยัง เครื่องมือสำคัญในการเขียนโปรแกรม:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

แทนที่โค้ดในไฟล์ **python_intro.py** ให้เป็นดังนี้:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

If we were to save and run this, we'd see an error like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

Python ต้องการให้เราเพิ่มเติมคำสั่งที่ต้องจะต้องรัน ถ้าเงื่อนไข `3 > 2` นั้นเป็นจริง (หรือ `True` นั่นเอง) เราให้ Python แสดงผล “It works!” ละกัน แก้ไขโค้ดในไฟล์ **python_intro.py** แบบนี้:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

สังเกตวิธีที่เราเยื้องบรรทัดถัดลงมาโดยใช้ 4 ช่องว่างไหม? เราต้องทำแบบนี้เพื่อให้ Python รู้ว่า เราต้องการรันโค้ดถ้าเงื่อนไขนั้นเป็นจริง คุณสามารถใช้ช่องว่างเดียวนะ แต่เหมือนโปรแกรมเมอร์ Python นั้นจะใช้ 4 ช่องว่าง เพื่อทำให้ดูเรียบร้อย `แท็บ` ก็นับเป็น 4 ช่องว่างเช่นกัน

บันทึกไฟล์และลองรันอีกครั้ง:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### ถ้าเกิดว่า เงื่อนไขไม่เป็นจริงล่ะ?

ในตัวอย่างที่แล้ว โค้ดจะถูกรันก็ต่อเมื่อเงื่อนไขเท่ากับ True เท่านั้น แต่ Python ยังมีอย่างอื่นเช่นกัน คือ `elif` และ `else` :

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

เมื่อเรารัน จะแสดงผลออกมาดังนี้:

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

และลองรัน:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

มีเกิดอะไรขึ้นบ้าง? `elif` ให้คุณสามารถเพิ่มเงื่อนไขเพิ่มเติมลงไปได้ หากเงื่อนไขก่อนหน้านี้ไม่เป็นจริง

คุณสามารถเพิ่ม `elif` ได้มากเท่าที่ต้องการ ตามหลัง `if` ตัวอย่างเช่น:

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

Python จะรันและทดสอบแต่ละเงื่อนไข จากนั้นก็แสดงผลออกมา:

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

### ภาพรวม

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

เอาล่ะ ได้เวลาสำหรับส่วนสุดท้ายในบทนี้แล้ว!

## ฟังก์ชันของคุณเอง!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

ฟังก์ชันคือลำดับของคำสั่งที่ Python จะดำเนินการหรือรัน แต่ละฟังก์ชันใน Python เริ่มด้วยคำว่า `def` ตามด้วยชื่อ และสามารถรับพารามิเตอร์ได้ Let's give it a go. แทนที่โค้ดในไฟล์ **python_intro.py** ให้เป็นดังนี้:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

เอาล่ะ ฟังก์ชันแรกของเราพร้อมแล้ว!

คุณคงสงสัย ทำไมเราต้องเขียนชื่อฟังก์ชันที่ด้านท้ายของไฟล์ด้วย ทั้งนี้เพราะ Python อ่านไฟล์และดำเนินการรันจาก บทลงล่าง ดังนั้น การที่จะใช้ฟังก์ชันของเรา เราจึงต้องเขียนชื่อฟังก์ชันด้านล่าง

ลองรันและดูว่าเกิดอะไรขึ้น:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

ดังที่คุณเห็น ตอนนี้เรามีฟังก์ชันที่มีพารามิเตอร์เรียกว่า `name`:

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

ข้อควรจำ: ฟังก์ชัน `print` เยื้องเข้าไปสี่บรรทัดภายในคำสั่ง `if` นั่นเพราะฟังก์ชันจะถูกเรียกเมื่อเงื่อนไขถูกต้อง มาดูกันว่ามันทำงานยังไง:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

อุปส์ เกิดข้อผิดพลาด แต่โชคดี ที่ Python บอกเราว่าข้อผิดพลาดเกิดจากอะไร มันบอกเราว่า ฟังก์ชัน `hi()` (ที่เราสร้างไว้) ต้องการหนึ่งพารามิเตอร์ (เรียกว่า `name`) และเราลืมส่งไปเมื่อเรียกใช้ฟังก์ชัน มาแก้ไขที่ด้านล่างของไฟล์กัน:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

และลองรันอีกครั้ง:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

และถ้าเราเปลี่ยนชื่อล่ะ?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

และรันมัน:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

แจ๋วเลย ใช่ไหม? ด้วยวิธีนี้ คุณไม่จำเป็นต้องพิมพ์ซ้ำทุกครั้งที่คุณต้องการเปลี่ยนชื่อของบุคคลที่เราต้องการทักทาย And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

มาลองรันกัน:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

ขอแสดงความยินดี! คุณได้เรียนรู้วิธีเขียนฟังก์ชันแล้ว! :)

## การทำซ้ำ

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

นี่เป็นส่วนสุดท้ายของบทนี้แล้ว เร็วเนอะว่ามั๊ย? :)

โปรแกรมเมอร์นั้นไม่ชอบทำอะไรซ้ำไปมา การเขียนโปรแกรมนั้นเป็นการทำงานอย่างอัตโนมัติ ดังนั้นเราจริงไม่ต้องการทักทายทุกๆ คน ด้วยชื่อของพวกเขาด้วยมือในทุกๆ ชื่อ จริงไหม? และการทำซ้ำจะเข้ามาช่วยในส่วนนี้

ยังจำ list ได้ใช่ไหม? เรามาสร้างรายการของชื่อสาวๆ กัน:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

เราต้องการที่จะทักทายด้วยชื่อพวกเขาทั้งหมด เรามีฟังก์ชัน `hi` เพื่อทำสิ่งนั้นอยู่แล้ว เรามาใช้พร้อมๆ ไปกับการทำซ้ำกัน:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

และนี่คือโค้ดทั้งหมดของไฟล์:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

และเมื่อเรารันไฟล์:

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
    

อย่างที่คุณเห็น ทุกสิ่งที่อยู่ภายในคำสั่ง `for` จะถูกทำซ้ำและวนเข้าไปในรายชื่อที่อยู่ใน list `girls`.

คุณสามารถใช้ `for` กับตัวเลขได้เช่นกัน โดยใช้ฟังก์ชัน `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

ซึ่งจะแสดงผล:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` คือฟังก์ชันที่จะสร้าง list ของตัวเลข โดยมีเลขเริ่มต้นและสิ้นสุด (ซึ่งเลขเหล่านี้ใส่เข้ามาเป็นพารามิเตอร์ของฟังก์ชัน)

หมายเหตุ เลขตัวที่สองของฟังก์ชันนั้นจะไม่ถูกรวมเข้ามาด้วย (ความหมายคือ `range(1, 6)` จะนับจาก 1 ถึง 5 แต่ไม่รวมเลข 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## ภาพรวม

มีเพียงเท่านี้แหละ **คุณเจ๋งมาก!** จริงๆ บทนี้เป็นบทที่ยาก และคุณควรจะภูมิใจในตัวเองนะ เราภูมิใจในตัวคุณนะที่คุณมาถึงจุดนี้ได้!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)