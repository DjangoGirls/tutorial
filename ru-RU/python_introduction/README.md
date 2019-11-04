{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Введение в Python

> Часть этой главы основана на учебных пособиях Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Давай напишем немного кода!

## Консоль Python

> Для читателей дома: Эта часть объясняется в видео [основы Python: целые числа, строки, списки, переменных и ошибки](https://www.youtube.com/watch?v=MO63L4s-20U).

Чтобы начать играть с Python, нам нужно открыть *командную строку* на твоем компьютере. Ты уже должна знать, как это сделать -- мы изучали это в главе [Введение в интерфейс командой строки](../intro_to_command_line/README.md).

После того, как будешь готова, следуйте приведенным ниже инструкциям.

Мы хотим открыть консоль Python, так что набери `python` если работаешь в Windows, или `python3` для Mac OS/Linux, и нажми `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Твоя первая команда Python!

После запуска Python, консоль изменилась на `>>>`. Для нас это означает, что сейчас мы можем использовать только команды на языке Python. Тебе не нужно вводить `>>>` - Python будет делать это за нас.

Если ты хочешь выйти из консоли Python, в любой момент -- просто введи `exit()` или используй сочетание клавиш `Ctrl + Z` для Windows и `Ctrl + D` для Mac/Linux. Тогда ты больше не будешь видеть `>>>`.

Сейчас мы не хотим выходить из консоли Python. Мы хотим больше узнать о нем. Начнем с ввода математических действий, таких как `2 + 3` и нажмем `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Хорошо! Видела как появился ответ? Python знает математику! Можешь попробовать и другие команды, например:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Для вычисления экспоненциала, скажем, 2 в степени 3, мы набираем в консоли: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Поиграй с этим немного и затем вернись сюда. :)

Как видишь, Python является прекрасным калькулятором. Если тебе интересно, что еще можно сделать…

## Строки

Как насчет твоего имени? Введи свое имя в кавычках, вот так:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Сейчас ты создала свою первую строку! Это последовательность символов, которые могут быть обработаны компьютером. Строка должна всегда начинаться и заканчиваться одинаковым символом. Им может быть как одинарная (`'`), так и двойная (`"`) кавычка (разницы нет!) Кавычки говорят Python'у, что внутри них находится строка.

Строки можно объединять. Попробуй так:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Ты также можешь умножать строки на число:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Если тебе нужно поставить апостроф внутри строки, то есть два способа сделать это.

Используя двойные кавычки:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

или экранировав апостроф обратной косой чертой (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Прикольно, да? Чтобы увидеть своё имя прописными буквами, просто набери:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Ты только что использовала **функцию** `upper` для своей строки! Функция (такая как `upper()`) представляет собой набор инструкций, который должен выполнить Python на заданном объекте (в нашем случае: `"Ola"`) при её вызове.

Если ты хочешь узнать количество букв в своём имени, то и для этого тоже существует **функция**!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Интересно, почему иногда мы вызываем функцию добавлением `.` к концу строки (как `"Ola".upper()`), а иногда сначала пишем имя функции и затем помещаем строку в скобки? Итак, в некоторых случаях функции принадлежат объектам, например функция `upper()`, которая может быть применена только к строкам. В этом случае мы называем функцию **методом**. В другом случае, функции не относятся к чему-то конкретному и могут использоваться для различных типов объектов, например функция `len()`. Вот почему мы передаем `"Ola"` в качестве параметра функции `len`.

### Содержание

OK, достаточно о строках. Пока ты узнала о:

- **консоль** - ввод команд (кода) в интерактивную командную строку Python приводит к ответам на Python
- **числа и строки** - в Python числа используются для вычислений, а строки - для текстовых объектов
- **операторы** - такие как `+` и `*`, производят действия над значениями для получения нового
- **функции** - такие как `upper()` и `len()`, выполняют действия над объектами.

Таковы основы каждого языка программирования, который ты можешь выучить. Готова к чему-то посложнее? Мы уверены, что готова!

## Ошибки

Давай попробуем кое-что новенькое. Можем ли мы получить длину числа так же, как длину твоего имени? Введи `len(304023)` и нажми `Enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Мы получили нашу первую ошибку! {{ warning_icon }} иконка в нашем случае показывает, что код, который мы пытаемся запустить, не будет работать так, как мы этого ожидаем. Делать ошибки (даже преднамеренные) - это неотъемлемая часть процесса обучения!

Наша ошибка говорит о том, что у объектов типа «int» (целые числа) нет длины. Так что же мы можем сейчас сделать? Может быть мы можем написать наше число в виде строки? У строк ведь есть длина, верно?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Сработало! Мы использовали функцию `str` внутри функции `len`. `str()` преобразует все в строки.

- Функция `str` преобразует объекты в **строки**
- Функция `int` преобразует объекты в **целые числа**

> Важно: мы можем преобразовать число в текст, но не всегда удается преобразовать текст в числа - например, каков будет результат `int('hello')`?

## Переменные

Переменные -- важное понятие в программировании. Переменная -- это не более чем имя для чего-то, чтобы использовать его позднее. Программисты используют переменные для хранения данных, чтобы их код был более читабельным, и для того, чтобы им не пришлось запоминать что есть что.

Допустим, мы хотим создать новую переменную с именем `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Мы указали, что имя равно Ola.

Как ты уже заметила, твоя программа не возвращает ничего, как было ранее. Так откуда мы знаем, что переменная действительно существует? Просто введи `name` и нажми `Enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Ура! Твоя первая переменная:)! Ты всегда можешь изменить то, к чему она относится:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
```

Ты можешь использовать их также и в функциях:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Круто, правда? Переменными, конечно, может быть что угодно, и цифры тоже! Попробуй следующее:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Но что делать, если мы использовали неправильное имя? Можешь догадаться, что произойдет? Давай попробуем!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Ошибка! Как ты можешь видеть, в Python есть различные типы ошибок, эта называется **NameError**. Python выдаст эту ошибку при попытке использовать переменную, которая пока не определена. При возникновении этой ошибки проверь свой код, чтобы узнать, не написала ли ты неправильно имя переменной.

Попрактикуйся в этом какое-то время и посмотри, что ты сможешь сделать!

## Функция print

Попробуй ввести:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Если просто ввести `name`, интерпретатор Python вернет строковое *представление* переменной 'name', которым, в нашем случае, являются буквы M-a-r-i-a, окруженные одинарными кавычками, ''. Когда ты вводишь `print(name)`, Python "печатает" содержание переменной на экран, без кавычек, что удобнее.

Как мы увидим позднее, `print()` пригодится, когда нам будет нужно печатать что-то изнутри функций, или когда мы захотим напечатать что-то на нескольких строчках.

## Списки

Помимо строк и целых чисел Python имеет богатую коллекцию других типов объектов. Сейчас мы собираемся представить тебе один из них - **list** (список). Списки - это именно то, о чем ты подумала: объекты, которые являются списками других объектов. :)

Давай начнем с создания списка:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Да, это пустой список. Не особенно полезен, да? Давай создадим список лотерейных номеров. Мы не хотим повторять их каждый раз, так что присвоим список переменной:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Замечательно, у нас есть список! Что мы можем с ним сделать? Для начала посмотрим как много лотерейных номеров в нашем списке. Есть идеи какую функцию можно использовать для этого? Ты её уже знаешь!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Точно! `len()` вернет тебе количество объектов в списке. Удобно, правда? Может быть мы теперь отсортируем его:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Эта команда не возвращает ничего, она просто меняет порядок номеров в списке. Давайте выведем его на экран и посмотрим что получилось:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Как видишь, номера в списке теперь отсортированы от меньшего к большему. Поздравляем!

Может быть нам нужно изменить порядок? Давай сделаем это!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Если хочешь добавить что-то к своему списку, то можешь воспользоваться этой командой:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Если ты хочешь получить первый номер в списке, то можешь воспользоваться **индексами**. Индекс - это номер позиции в списке, на котором находится нужное нам значение. Программисты предпочитают начать считать с 0, так что первому объекту в списке соответствует индекс 0, следующему —1, и так далее. Попробуй ввести:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Как видишь, ты можешь обратиться к различным объектам в своем списке используя имя списка и индекс объекта в квадратных скобках.

Чтобы удалить что-то из вашего списка, нужно использовать **индексы**, как мы узнали выше, и метод `pop()`. Давай попробуем закрепить пройденное примером; мы будем удалять первый элемент из нашего списка.

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

Сработало как по волшебству!

В качестве дополнительной тренировки попробуй следующие индексы: 6, 7, 1000, -1, -6 и -1000. Сможешь предсказать результат? Видишь логику работы?

Ты можешь найти перечень всех методов, относящихся к списку, в этой главе официальной документации Python: https://docs.python.org/3/tutorial/datastructures.html

## Словари

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

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

- Ключ `name`, указывающий на значение `'Ola'` (`строковый` объект),
- ключ `country`, указывающий на значение `'Poland'` (еще одна `строка`),
- и ключ `favorite_numbers`, указывающий на значение `[7, 42, 92]` (объект типа `список` с тремя числами внутри).

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

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

- Тебе нужна упорядоченная последовательность элементов? Список - наш выбор.
- Тебе нужны сочетания ключ - значение, чтобы быстро искать значения (по ключу) в дальнейшем? Словарь отлично подойдет.

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

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

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

### Содержание

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Сравниваем вещи

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

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

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y означает: x больше y
- x `<` y означает: x меньше y
- x `<=` y означает: x меньше или равен y
- x `>=` y означает: x больше или равен y

Супер! Хочешь еще? Тогда попробуй вот это:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

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

## Логические значения

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

Существует только два логических объекта:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Ты можешь присваивать переменным логические значения! Смотри сюда:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Или это можно сделать так:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Попрактикуйся и развлекись с логическими значениями на примере этих выражений:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# Сохраняй!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Закрыть интерактивную консоль Python
- Открыть наш текстовый редактор
- Сохранить код в новом файле
- Запустить его!

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

This will put you back into the command prompt.

Earlier, we picked out a code editor from the [code editor](../code_editor/README.md) section. We'll need to open the editor now and write some code into a new file (or if you're using a Chromebook, create a new file in the cloud IDE and open the file, which will be in the included code editor):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Obviously, you're a pretty seasoned Python developer now, so feel free to write some code that you've learned today.

Now we need to save the file and give it a descriptive name. Let's call the file **python_intro.py** and save it to your desktop. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Это называется «синтаксическая подсветка», и это действительно удобная штука для программирования. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Это одна из причин, по которой мы используем редакторы кода. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

На Линукс это будет так:

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

### Что, если условие не True?

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

### Содержание

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Твоя собственная функция!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

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

You may wonder why we've written the name of the function at the bottom of the file. This is because Python reads the file and executes it from top to bottom. So in order to use our function, we have to re-write it at the bottom.

Let's run this now and see what happens:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

Note: if it didn't work, don't panic! The output will help you to figure why:

- If you get a `NameError`, that probably means you typed something wrong, so you should check that you used the same name when creating the function with `def hi():` and when calling it with `hi()`.
- If you get an `IndentationError`, check that both of the `print` lines have the same whitespace at the start of a line: python wants all the code inside the function to be neatly aligned.
- If there's no output at all, check that the last `hi()` *isn't* indented - if it is, that line will become part of the function too, and it will never get run.

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

## Циклы

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

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

И после запуска:

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

## Содержание

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)