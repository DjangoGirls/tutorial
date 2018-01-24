# Введение в Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Давай напишем немного кода!

## Консоль Python

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Чтобы начать играть с Python, нам нужно открыть *командную строку* на твоем компьютере. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

После того, как будешь готова, следуйте приведенным ниже инструкциям.

Мы хотим открыть консоль Python, так что набери `python` если работаешь в Windows, или `python3` для Mac OS/Linux, и нажми `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Твоя первая команда Python!

После запуска Python, консоль изменилась на `>>>`. Для нас это означает, что сейчас мы можем использовать только команды на языке Python. You don't have to type in `>>>` – Python will do that for you.

Если ты хочешь выйти из консоли Python, в любой момент -- просто введи `exit()` или используй сочетание клавиш `Ctrl + Z` для Windows и `Ctrl + D` для Mac/Linux. Тогда ты больше не будешь видеть `>>>`.

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

Поиграй с этим немного и затем вернись сюда. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Строки

Как насчет твоего имени? Введи свое имя в кавычках, вот так:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Сейчас ты создала свою первую строку! Это последовательность символов, которые могут быть обработаны компьютером. Строка должна всегда начинаться и заканчиваться одинаковым символом. Им может быть одинарная (`'`) или двойная (`"`) кавычка (разницы нет!) Кавычки говорят Python'у, что внутри них находится строка.

Строки могут быть слиты воедино. Попробуй так:

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

Использование двойных кавычек:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

или предварение апострофа обратной косой чертой (``):

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

You just used the `upper` **method** on your string! A method (like `upper()`) is a sequence of instructions that Python has to perform on a given object (`"Ola"`) once you call it.

If you want to know the number of letters contained in your name, there is a **function** for that too!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Интересно, почему иногда мы вызываем функцию добавлением `.` к концу строки (как `"Ola".upper()`), а иногда сначала пишем имя функции и затем помещаем строку в скобки? Ну, в некоторых случаях функции принадлежат объектам, например функция `upper()`, которая может быть применена только к строкам. В этом случае мы называем функцию **методом**. В другом случае функции не относятся к чему-то конкретному и могут использоваться для различных типов объектов, например функция `len()`. Вот почему мы передаем `"Ola"` в качестве параметра функции `len`.

### Содержание

OK, достаточно о строках. Пока ты узнала о:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Таковы основы каждого языка программирования, который ты можешь выучить. Готова к чему-то посложнее? Мы уверены, что готова!

## Ошибки

Давай попробуем кое-что новенькое. Можем ли мы получить длину числа так же, как длину твоего имени? Введи `len(304023)` и нажми `Enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Мы получили нашу первую ошибку! Она говорит о том, что у объектов типа «int» (целые числа) нет длины. Так что же мы можем сейчас сделать? Может быть мы можем написать наше число в виде строки? У строк ведь есть длина, верно?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Сработало! Мы использовали функцию `str` внутри функции `len`. `str()` преобразует все в строки.

- Функция `str` преобразует объекты в **строки**
- Функция `int` преобразует объекты в **целые числа**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Переменные

Переменные -- важное понятие в программировании. Переменная -- это не более чем имя для чего-то, чтобы использовать его позднее. Программисты используют переменные для хранения данных, чтобы их код был более читабельным, и для того, чтобы им не пришлось запоминать что есть что.

Допустим, мы хотим создать новую переменную с именем `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Как ты уже заметила, твоя программа не возвращает ничего, как было ранее. Так откуда мы знаем, что переменная действительно существует? Просто введи `name` и нажми `Enter`:

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
```

Ты можешь использовать их также и в функциях:

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

Но что делать, если мы использовали неправильное имя? Можешь догадаться, что произойдет? Давай попробуем!

{% filename %}command-line{% endfilename %}

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

Как мы увидим позднее, `print()` пригодится когда нам будет нужно печатать что-то изнутри функций или когда мы захотим напечатать что-то на нескольких строчках.

## Списки

Помимо строк и целых чисел Python имеет богатую коллекцию других типов объектов. Сейчас мы собираемся представить тебе один из них - **list** (список). Списки - это именно то, о чем ты подумала: объекты, которые являются списками других объектов. :)

Давай начнем с создания списка:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Отлично, это пустой список. Не особенно полезен, да? Давай создадим список лотерейных номеров. Мы не хотим повторять их каждый раз, так что присвоим список переменной:

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

If you want to add something to your list, you can do this by typing this command:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Если ты хочешь получить первый номер в списке, то можешь воспользоваться **индексами**. Индекс это номер позиции в списке, на котором находится нужное нам значение. Программисты предпочитают начать считать с 0, так что первому объекту в списке соответствует индекс 0, следующему —1, и так далее. Попробуй ввести:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Как видишь, ты можешь обратиться к различным объектам в своем списке используя имя списка и индекс объекта в квадратных скобках.

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

Сработало как заклинание!

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

Это показывает что мы создали пустой словарь. Ура!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Ключ `name`, указывающий на значение `'Ola'` (`строковый` объект),
- ключ `country`, указывающий на значение `'Poland'` (еще одна `строка`),
- и ключ `favorite_numbers`, указывающий на значение `[7, 42, 92]` (объект типа `список` с тремя числами внутри).

Значение конкретного ключа можно узнать следующим образом:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Что случится, если мы спросим у Python значение несуществующего в словаре ключа? Можешь предположить? Давай попробуем и узнаем наверняка!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Смотри, другая ошибка! Эта называется **KeyError**. Python услужливо напоминает, что ключа `'age'` не существует в словаре.

Когда стоит использовать словарь, а когда список? Это хороший вопрос для самостоятельного размышления. Сделай предположение перед тем, как читать дальше.

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

You can use the `pop()` method to delete an item in the dictionary. Скажем, ты хочешь удалить элемент с ключом `'favorite_numbers'`, просто набери следующую команду:

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

Шикарно! Теперь ты знаешь немало о программировании. Мы познакомились с:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Готова к продолжению? :)

## Сравниваем вещи

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

Хочешь спросить почему мы написал двойной символ равенства `==`, чтобы проверить одинаковы ли числа? Потому что одинарные символ равенства `=` уже задействован под присваивание значения переменным. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Мы также можем проверить различаются ли объекты. Для этого, мы используем `!=`, как показано в примере выше.

Дадим Python еще два задания:

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

Ты можешь передать Python так много чисел, как захочешь, и он будет возвращать ответ! Хитро, правда?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Ты когда-нибудь слышала выражение "сравнивать яблоки и апельсины"? Попробуем что-то подобное в Python:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Как мы видим, Python не знает как сравнить число (`int`) и строку (`str`) между собой. Поэтому он просто возвращает нам ошибку **TypeError** и предупреждает, что объекты заданных типов не могут быть сравнены.

## Логические значения

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Ты можешь присваивать переменным логические значения! Смотри сюда:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Или так:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Попрактикуйся с логическими значениями на примере этих выражений:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Поздравляем! Логические значения одна из самых классных фишек программирования и ты только что научилась ими пользоваться!

# Сохраняй!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

До сих пор мы писали весь код в интерактивной консоли, где Python сразу анализировал, обрабатывал и выполнял наши команды. Мы были ограничены одной строкой. Обычно, программы сохраняются в файлах и выполняются **интерпретатором** или **компилятором** нашего языка программирования. Пока мы только просили **интерпретатор** Python выполнять наши однострочные команды из консоли. Однако, нам понадобиться больше места для следующих задач, поэтому задача минимум:

- Закрыть интерактивную консоль Python
- Открыть наш текстовый редактор
- Сохранить код в новом файле
- Запустить его!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Это вернет тебя в командную строку.

Ранее мы выбрали редактор кода в разделе [Текстовый редактор](../code_editor/README.md). Открой его сейчас и напиши следующий код:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Очевидно, ты уже искушенный Python разработчик, так что не стесняйся добавить что-нибудь по своему вкусу из ране изученного.

Теперь нам нужно сохранить файл с кодом и дать ему подходящее имя. Давай назовем его **python_intro.py** и сохраним на рабочий стол. Мы можем назвать файл как хотим, но важно чтобы название заканчивалось на **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Это называется «синтаксическая подсветка», и это действительно удобная штука для программирования. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Это одна из причин, по которой мы используем редакторы кода. :)

После сохранения файла пришло время запустить его! Используя навыки из раздела о командной строки, открой терминал и **поменяй текущую директорию** на рабочий стол.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Для Mac команда будет выглядеть так:

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

Если возникли проблемы - просто обратись за помощью.

Теперь используй Python чтобы запустить код в файле:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Отлично! Ты только что запустила свою первую программу, чей код был сохранен в файле. Чувствуешь воодушевление?

Можно передвигаться дальше к такому незаменимому в программировании инструменту как:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Замени код в своем файле **python_intro.py** на:

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
    

Python предполагает, что мы должны дать ему инструкции, которые будут им выполнены при соблюдении условия `3 > 2` (т. е. при равенстве условия логическому значению `True`). Давай попробуем заставить Python напечатать на экране “It works!”. Внеси следующие изменения в **python_intro.py**:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Обратила внимание как мы сделали отступ во второй строке из 4 символов пробела? Мы поступаем так, чтобы Python понимал какой код после условного оператора if должен быть выполнен, если условие равно True. Можно ограничиться и одним пробелом, однако, практически все программисты Python используют 4, чтобы код выглядел аккуратно и читабельно. Каждая `табуляция` также считается за 4 пробела.

Сохраняем и запускаем еще раз:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### Что, если условие не True?

В предыдущем пример код выполнялся только когда условие равнялось True. Однако, Python имеет операторы `elif` и `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Если запустить этот код, он напечатает:

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

и запускаем:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Видишь, что произошло? `elif` позволяет добавить дополнительные условия, которые запускаются если предыдущие не срабатывают.

Можно использовать сколько угодно `elif` после первого `if`. Например:

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

Python проходит через каждую проверку условия и выводит:

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

Пришло время для последней части этой главы!

## Твоя собственная функция!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Функция - это последовательность инструкций, которые должен выполнить Python. Каждая функция в Python начинается с ключевого слова `def`, имеет свое имя и параметры. Let's give it a go. Замени код в **python_intro.py** на следующий:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Отлично, наша первая функция готова!

Ты можешь задаться вопросом, почему мы написали имя функции в конце файла. Причина в том, что Python читает и исполняет код из файла сверху вниз. Поэтому, для использования нашей функции мы должны вызвать её в конце файла.

Давай запустим и посмотрим что произойдет:

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

Как ты можешь заметить, мы передали нашей функции параметр `name`:

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

Помни: функция `print` расположена внутри блока оператора `if` с отступом в четыре пробела. Это потому, что она запускается тогда, когда выполняется условие. Давай посмотрим, как это работает:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Упс, ошибка. К счастью, Python выдает довольно подробное сообщение об ошибке. Оно говорит нам, что функция `hi()` (которую мы определили) имеет один обязательный аргумент (`name`) и мы забыли передать его при вызове функции. Давай исправим это в конце файла:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

И запустИм еще раз:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

И если мы поменяем имя?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

И повторИм:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Шикарно, верно? Так тебе не придется повторяться каждый раз, когда ты захочешь изменить имя. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Давай выполним этот код:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Поздравляем! Ты только что научилась писать свои собственные функции! :)

## Циклы

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Ну вот и последняя часть. Быстро время пролетело, верно? :)

Программисты не любят повторяться. Программирование — это автоматизация вещей, поэтому мы не хотим приветствовать каждого человека по имени вручную, верно? Здесь пригодятся циклы.

Еще помнишь о списках? Давай создадим список девушек:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Мы хотим поздороваться с каждой по имени. У нас есть функция `hi`, которая этим и занимается, так что давай поместим её в цикл:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Ниже полный код, который должен быть у нас в файле:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

И после ИсполненИя:

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
    

Как ты можешь заметить, все команды внутри цикла `for` (с отступом от левого края) будут выполняться для каждого элемента списка `girls`.

Ты также можешь использовать цикл `for` на числах, используя функцию `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Что выведет на экран:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

Функция `range` создает список чисел, следующих от первого до второго с заданным шагом (начало, конец и шаг мы передаем функции как параметры, если шаг не указать, как в примере выше, он будет по умолчанию равен 1).

Обрати внимание что второе число (конец списка) не включается в результат работы функции (`range(1, 6)` создает список от 1 до 5, не включающий 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Содержание

Вот и всё. **Ты чертовски крута!** Эта глава была непростой, так что ты можешь гордиться собой. Мы-то точно тобой гордимся — вон как далеко продвинулась уже!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Пирожок](images/cupcake.png)