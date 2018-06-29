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

ถ้าคุณอยากจะออกจากส่วนควบคุม Python แค่พิมพ์ `exit()` หรือใช้ shortcut `Ctrl + Z` สำหรับระบบปฏิบัติการ Windows และ `Ctrl + D` สำหรับระบบปฏิบัติการ Mac/Linux หลังจากนั้นคุณจะไม่เห็น `>>>` อีกต่อไป

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

เจ๋งใช่มั้ยล่ะ? ถ้าอยากให้ชื่อของคุณเป็นตัวพิมพ์ใหญ่ทั้งหมด ก็แค่พิมพ์:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

คุณเพิ่งใช้ `upper` **method** กับ string ของคุณ A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

ถ้าคุณอยากรู้ว่าชื่อของคุณมีกี่ตัวอักษร มันก็มี **function** ที่ทำหน้าที่นี้เหมือนกัน!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

คุณสงสัยมั้ยว่า ทำไมบางครั้งคุณเรียกใช้ฟังก์ชั่นโดยมี `.` อยู่ท้าย string (เช่น `"Ola".upper()`) และบางครั้งก็เรียกใช้ฟังก์ชั่นโดยมี string อยู่ในวงเล็บ? คืองี้ บางกรณี ฟังก์ชั่นก็เป็นของวัตถุ เช่น `upper()` ซึ่งสามารถใช้ได้เฉพาะกับ string ในกรณีนี้ เราเรียกฟังก์ชั่นว่า **method** กรณีอื่นๆ ที่ฟังก์ชั่นไม่ได้เป็นของวัตถุใดวัตถุหนึ่ง และยังสามารถใช้ได้กับวัตถุชนิดอื่นๆ ได้ เช่น `len()` นั่นคือเหตุผลที่เราใช้ `"Ola"` เป็นพารามิเตอร์ให้กับฟังก์ชัน `len`

### บทสรุป

เอาล่ะ พอก่อนเนอะสำหรับ string จนถึงตอนนี้คุณได้เรียนรู้เกี่ยวกับ:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

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

เราเพิ่งเจอข้อผิดพลาดแรกของเรา! The {{ warning_icon }} icon is our way of giving you a heads up that the code you are about to run won't work as expected. การทำผิดพลาด (รวมถึงความผิดพลาดที่เจตนา) เป็นส่วนสำคัญของการเรียนรู้!

It says that objects of type "int" (integers, whole numbers) have no length. So what can we do now? Maybe we can write our number as a string? Strings have a length, right?

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

An important concept in programming is variables. ตัวแปรนั้นไม่มีอะไรมากกว่าการเป็นชื่อ ที่คุณสามารถนำไปใช้ในภายหลังได้ โปรแกรมเมอร์ใช้ตัวแปรในการเก็บข้อมูล มันทำให้อ่านโค้ดได้ง่ายขึ้นและยังช่วยให้พวกเขาไม่ต้องจำค่าต่างๆที่อยู่ในโปรแกรม

สมมุติว่าเราอยากจะสร้างตัวแปลที่ใช้ชื่อว่า `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

เราก็พิมพ์ name เท่ากับ Ola

As you've noticed, your program didn't return anything like it did before. So how do we know that the variable actually exists? Simply enter `name` and hit `enter`:

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

You can use it in functions too:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

เจ๋งไปเลยใช่มั้ยล่ะ? แน่นอนว่าตัวแปรนั้นสามารถเป็นอะไรก็ได้ เป็นตัวเลขก็ได้! ลองนี่สิ:

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

An error! As you can see, Python has different types of errors and this one is called a **NameError**. Python will give you this error if you try to use a variable that hasn't been defined yet. If you encounter this error later, check your code to see if you've mistyped any names.

Play with this for a while and see what you can do!

## ฟังก์ชันการแสดงผล

ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

When you just type `name`, the Python interpreter responds with the string *representation* of the variable 'name', which is the letters M-a-r-i-a, surrounded by single quotes, ''. When you say `print(name)`, Python will "print" the contents of the variable to the screen, without the quotes, which is neater.

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.

## List

Beside strings and integers, Python has all sorts of different types of objects. Now we're going to introduce one called **list**. Lists are exactly what you think they are: objects which are lists of other objects. :)

Go ahead and create a list:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Yes, this list is empty. Not very useful, right? Let's create a list of lottery numbers. We don't want to repeat ourselves all the time, so we will put it in a variable, too:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

All right, we have a list! What can we do with it? Let's see how many lottery numbers there are in a list. Do you have any idea which function you should use for that? You know this already!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Yes! `len()` can give you a number of objects in a list. Handy, right? Maybe we will sort it now:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

This doesn't return anything, it just changed the order in which the numbers appear in the list. Let's print it out again and see what happened:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

อย่างที่คุณเห็น ตัวเลขในลิสต์ของคุณถูกเรียงจากน้อยไปหามาก ยินดีด้วย!

Maybe we want to reverse that order? Let's do that!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

ถ้าคุณอยากจะเพิ่มอะไรซักอย่างเข้าไปในลิสต์ คุณสามารถทำได้โดยใช้คำสั่ง:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

ถ้าคุณต้องการจะแสดงเฉพาะหมายเลขแรก คุณสามารถทำได้โดยใช้ **indexes** ดัชนีคือตัวเลขที่บอกตำแหน่งของสิ่งที่อยู่ในลิสต์ โปรแกรมเมอร์จะเริ่มนับจาก 0 เพราะฉะนั้นสิ่งที่อยู่เป็นอันดับแรกในลิสต์ ก็คือ ดัชนีหมายเลข 0 ถัดไปก็คือ 1 และต่อไปเรื่อยๆ ลองนี่:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

As you can see, you can access different objects in your list by using the list's name and the object's index inside of square brackets.

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

มันทำงานได้ถูกต้องเหมือนมีเวทมนตร์เลยล่ะ!

เพื่อความสนุกยิ่งขึ้น ลองใช้ค่าดัชนีอื่นๆ เช่น: 6, 7, 1000, -1, -6 หรือ -1000 แล้วดูว่าคุณสามารถเดาผลลัพธ์ก่อนที่จะลองพิมพ์คำสั่งได้มั้ย แล้วผลลัพธ์ที่ว่า มันสมเหตุสมผลมั้ย?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## Dictionary

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c)

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- key ชื่อ `name` ชี้ไปยัง value `'Ola'` (เป็นวัตถุประเภท `string`)
- `country` ชี้ไปยัง `'Poland'` (เป็น `string` อีกอัน),
- และ `favorite_numbers` ชี้ไปยัง `[7, 42, 92]` (เป็น `list` ที่มีตัวเลขสามตัวข้างใน)

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Just have a solution in mind before looking at the answer in the next line.

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

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, just type in the following command:

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

### บทสรุป

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

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

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

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

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

Boolean มีเพียงแค่สองค่าเท่านั้น คือ:

- True (จริง)
- False (ไม่จริง)

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Booleans can be variables, too! See here:

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

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# เซฟซะ!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

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

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. มีชื่อเรียกว่า "syntax highlighting" และเป็นฟีเจอร์ที่มีประโยชน์มากๆ เมื่อเขียนโค้ด The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). นี่เป็นหนึ่งเหตุผลว่าทำไมเราถึงใช้โปรแกรมแก้ไขโค้ด. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

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

If you get stuck, just ask for help.

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

สังเกตวิธีที่เราเยื้องบรรทัดถัดลงมาโดยใช้ 4 ช่องว่างไหม? เราต้องทำแบบนี้เพื่อให้ Python รู้ว่า เราต้องการรันโค้ดถ้าเงื่อนไขนั้นเป็นจริง คุณสามารถเว้นช่องว่างไว้ช่องเดียวได้นะ แต่โปรแกรมเมอร์ Python เกือบทุกคนจะเว้นช่องว่าง 4 ช่อง เพื่อทำให้มันดูเรียบร้อย การกด Tab หนึ่งครึ่งก็นับว่าเป็นการเว้นช่องว่าง 4 ช่องได้ ตราบใดที่ text editor ของคุณถูกเช็ตให้ทำงานแบบนั้น เมื่อคุณเลือกทำอย่างใดอย่างนึงแล้ว อย่าเปลี่ยนนะ! ถ้าคุณเยื้องบรรทัดลงมาโดยเคาะเว้นช่องว่าง 4 ช่อง ก็ให้เคาะเว้นช่องว่าง 4 ช่องไปตลอด ห้ามเปลี่ยนไปกด Tab สลับกัน ไม่อย่างงั้นคุณจะเจอปัญหาแน่

บันทึกไฟล์และลองรันอีกครั้ง:

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

### บทสรุป

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

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

เอาล่ะ ฟังก์ชั่นแรกของเราพร้อมแล้ว!

คุณคงสงสัยว่าทำไมเราต้องเขียนชื่อฟังก์ชั่นที่ด้านล่างของไฟล์ด้วย นั่นก็เพราะว่า Python อ่านไฟล์และรันจากบนลงล่าง ดังนั้น การที่จะใช้ฟังก์ชั่นของเรา เราจึงต้องเขียนชื่อฟังก์ชั่นด้านล่าง

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
    

อุ๊ย เกิดข้อผิดพลาดขึ้นล่ะ แต่โชคดี ที่ Python โชว์ข้อความที่ค่อนข้างเป็นประโยชน์เพื่อบอกเราว่าข้อผิดพลาดเกิดจากอะไร It tells us that the function `hi()` (the one we defined) has one required argument (called `name`) and that we forgot to pass it when calling the function. มาแก้ไขที่ด้านล่างของไฟล์กัน:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

แล้วลองรันอีกครั้ง:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

แล้วถ้าคุณอยากจะเปลี่ยนชื่อล่ะ?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

แล้วรันโค้ด:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

ตอนนี้ คุณคิดว่าจะเกิดอะไรขึ้นถ้าเราใช้ชื่ออื่น? (ที่ไม่ใช่ Ola หรือ Sonja) คุณลองดูนะ ถ้าคุณทำถูก มันจะแสดงผลแบบนี้:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

มันเจ๋งสุดๆไปเลยใช่ป่ะ? ด้วยวิธีนี้ คุณไม่จำเป็นต้องพิมพ์ซ้ำทุกครั้งที่คุณต้องการเปลี่ยนชื่อของบุคคลที่เราต้องการทักทาย และนั่นคือเหตุผลที่เราต้องการฟังก์ชั่น - คุณไม่อยากจะเขียนโค้ดของคุณซ้ำๆ ไงล่ะ!

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
    

ยินดีด้วย! คุณได้เรียนรู้เกี่ยวกับการเขียนฟังก์ชั่นแล้ว! :)

## การทำซ้ำ

> สำหรับผู้อ่านทางบ้าน ส่วนนี้จะครอบคลุมในส่วนวิดิโอของ [Python Basics: Dictionaries](https://www.youtube.com/watch?v=aEA6Rc86HF0)

นี่เป็นส่วนสุดท้ายของบทนี้แล้ว เร็วเนอะว่ามั๊ย? :)

โปรแกรมเมอร์นั้นไม่ชอบทำอะไรซ้ำไปมา การเขียนโปรแกรมนั้นเป็นการทำงานอย่างอัตโนมัติ ดังนั้นเราจึงไม่ต้องการที่จะพิมพ์ทักทายทุกๆ คน ด้วยชื่อของพวกเขาซ้ำๆในทุกๆชื่อ จริงไหม? และการทำซ้ำจะเข้ามาช่วยในส่วนนี้

ยังจำ list ได้ใช่ไหม? เรามาสร้างลิสต์ของชื่อสาวๆ กัน:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

เราต้องการที่จะทักทายด้วยพวกเขาด้วยชื่อของแต่ละคน เรามีฟังก์ชัน `hi` เพื่อทำสิ่งนั้นอยู่แล้ว งั้นเรามาใช้มันร่วมกับการทำซ้ำกัน:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

คำสั่ง `for` ทำงานในรูปแบบลักษณะคล้ายๆกันกับคำสั่ง `if` โค้ดด้านล่างจำเป็นต้องเคาะเยื้องบรรทัดเข้ามา 4 ช่องเช่นกัน

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

คุณสามารถใช้ `for` กับตัวเลขได้เช่นกัน โดยใช้ฟังก์ชั่น `range`

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

ซึ่งจะแสดงผลดังนี้:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` คือฟังก์ชันที่จะสร้าง list ของตัวเลข โดยมีเลขเริ่มต้นและสิ้นสุด (ซึ่งเลขเหล่านี้ใส่เข้ามาเป็นพารามิเตอร์ของฟังก์ชั่น)

หมายเหตุ เลขตัวที่สองของฟังก์ชั่นนั้นจะไม่ถูกรวมเข้ามาด้วย (ความหมายคือ `range(1, 6)` จะนับจาก 1 ถึง 5 แต่ไม่รวมเลข 6) นั่นเป็นเพราะว่า "range" นั้นเป็นแบบ half-open ซึ่งคือรวมตัวแรกแต่ไม่นับตัวสุดท้าย

## บทสรุป

บทนี้ก็มีเพียงเท่านี้แหล่ะ **คุณเจ๋งมากเลย!** จริงๆ บทนี้เป็นบทที่ยากนะ และคุณก็ควรจะภูมิใจในตัวเอง เราภูมิใจในตัวคุณนะที่คุณมาถึงจุดนี้ได้!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

ตอนนี้คุณอาจจะอยากทำอย่างอื่นบ้าง ไปยืดเส้นยืดสาย เดินเล่น พักสายตาซะหน่อย ก่อนที่จะมาต่อกันในบทถัดไป :)

![Cupcake](images/cupcake.png)