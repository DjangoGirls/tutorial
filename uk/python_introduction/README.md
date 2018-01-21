# Вступ до Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Давайте напишемо якийсь код!

## Командний рядок Python

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Щоб розпочати роботу із Python нам необхідно відкрити *командний рядок*. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

Так як ви готові, виконаємо наведені нижче інструкції.

Ми хочемо відкрити консоль Python, тому введіть `python` на Windows або `python3` на Mac OS/Linux та натисніть `Enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Ваша перша команда на Python!

Після запуску команди Python командний рядок зміниться на `>>>`. Для нас це означає, що відтепер ми можемо користуватися лише командами мови Python. You don't have to type in `>>>` – Python will do that for you.

Якщо забажаєте вийти із консолі Python, просто наберіть `exit()` або використайте комбінацію `Ctrl + Z` для Windows і `Ctrl + D` для Mac/Linux. Після того ви більше не побачите `>>>`.

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

Поки що можете трохи побавитися із математикою, а далі повертайтесь назад. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Рядки

Як щодо вашого імені? Наберіть ваше ім'я в лапках як тут:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Щойно ви створили свій перший рядок! Це послідовність символів, що може бути оброблена комп'ютером. Рядок має постійно починатися і закінчуватися одним і тим же символом. Це може бути одинарна (`'`) або подвійна (`"`) лапка (немає ніякої різниці)! Лапки вказують Python, що що всередині них рядок.

Рядки можна об'єднувати. Спробуйте:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Також можна множити рядки на число:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Якщо вам раптом треба поставити апостроф всередині рядка, то існує два шляхи це зробити.

Використавши подвійні лапки:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

або ж екранувати апостроф за допомогою зворотнього слеша (бекслеша) (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Гарно, еге ж? Щоб побачити своє ім'я написане великими літерами, просто наберіть:

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

Здивовані чому іноді ви викликаєте функції із `.` наприкінці рядка (на зразок `"Ola".upper()`), а іноді ви спочатку викликаєте функцію і вказуєте рядок у дужках? Що ж, в деяких випадках, функції належать об'єктам, як `upper()`, котра може бути виконана лише над рядком. У цьому випадку, ми називаємо функцію **методом**. Іншого разу, функції не належать до жодного об'єкту і можуть використовуватись стосовно різних типів об'єктів, як `len()`. Саме тому ви використовуємо `"Ola"` у якості параметра для функції `len`.

### Зміст

Гаразд, досить стосовно рядків. Отже, ви вже ознайомилися із такими поняттями як:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

Це є основи кожної мови програмування, яку ви вивчатимете. Готові приступити до чогось складнішого? Б'ємось об заклад, що так!

## Помилки

Спробуємо щось нове. Чи можемо ми отримати довжину числа тим же методом як ми це робили для нашого імені? Наберіть `len(304023)` та натисніть `Enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Ми отримали нашу першу помилку! Вона говорить про те, що об'єкт типу "int" (integers, цілі числа) не мають довжини. І що ж нам тепер робити? Можливо, можна записати наше число у формі рядка? Рядки ж мають довжину, правда?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Спрацювало! Ми використали функцію `str` всередині функції `len`. `str()` перетворює будь-що на рядки.

- Функція `str` перетворює речі на **рядки**
- Функція `int` перетворює речі на **цілі числа**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Змінні

Важливою концепцію в програмуванні є змінні. Змінна - це ніщо більше, ніж ім'я для чогось, що можна буде використовувати пізніше. Програмісти використовують ці змінні для збереження даних, щоб зробити свій код більш читабельним і, таким чином, їм не потрібно пам'ятати зайве.

Скажімо, ми хочемо створити змінну і назвати її `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

Як ви зауважили, ваша програма не повернула нічого як вона це робила до того. Отже, як ми можемо бути певні, що змінна насправді існує? Просто введіть `name` і натисніть `Enter`:

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

Також можна використовувати її у функціях:

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

Але що, якщо ми використали неправильне ім'я? Чи можете ви передбачити, що станеться? Спробуймо!

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Помилка! Як бачите, Python має різні типи помилок і дана помилка називається **NameError**. Python виведе для вас цю помилку, якщо ви спробуєте використати досі не визначену змінну. Якщо ж ви зіткнетеся із цією помилкою пізніше, перевірте свій код щоб побачити чи не пропустили ви часом якоїсь змінної.

Поекспериментуйте із цим усім поки що і подивіться що можна робити!

## Функція print

Спробуйте наступне:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Коли ви просто набираєте `name`, Python інтерпретує відповіді за допомогою рядкового *представлення* змінної 'name', котра є набором літер M-a-r-i-a, взятим в одинарні лапки, ''. Коли ви повідомляєте `print(name)`, Python "надрукує" значення змінної на екран, без лапок, що є більш акуратним.

Як ми потім побачимо, `print()` є також корисним коли ми хочемо надрукувати речі з внутрішніх функцій, або ж коли хочемо надрукувати речі в декілька рядків.

## Списки

Окрім рядків та чисел, Python має усі види різних типів об'єктів. Наразі ми збираємося представити вашій увазі один із них, що називається **список**. Списки є саме тим, про що ви й подумали: це є об'єкти, що є списками інших об'єктів. :)

Створимо список:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Так, цей список пустий. Не дуже корисно, чи не так? Створимо список лотерейних чисел. Ми не бажаємо увесь час повторюватись, то ж покладемо усе до змінної, також:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Гаразд, маємо список! Що ми можемо із цим робити? Давайте глянемо скільки лотерейних номерів міститься у списку. Не маєте жодного уявлення яку функцію для цього можна використати? Ви вже це знаєте!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Так! `len()` може дати вам кількість об'єктів у списку. Зручно, правда ж? Може, тепер здійснимо сортування:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Ця функція нічого не повертає, вона лише змінює порядок, в якому з'являються числа у списку. Давайте надрукуємо список знову і подивимось що ж трапилося:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Як бачимо, числа у вашому списку тепер відсортовано починаючи з найменшого і закінчуючи найбільшим значенням. Вітаємо!

Можливо, ми хочемо відсортувати числа у зворотньому порядку? Давайте це зробимо!

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

Якщо захочете показати лише перше число, то можете зробити це використавши **індекси**. Індекс - це номер, що повідомляє про те, звідки у списку взято елемент. Програмісти вважають за краще рахувати з 0, таким чином, перший об'єкт у списку має індекс 0, наступний — 1 і так далі. Спробуйте наступне:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Як бачимо, ви можете отримати доступ до різних об'єктів списку використавши ім'я списку та індекс об'єкта всередині квадратних дужок.

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

Працює чудово!

Для додаткового задоволення, спробуйте деякі індекси: 6, 7, 1000, -1, -6 або -1000. Подивіться чи здатні ви передбачити результат команди перед її застосуванням. Чи мають ці результати якийсь смисл?

Список усіх доступних методів для списку міститься у цьому розділі документації з Python: https://docs.python.org/3/tutorial/datastructures.html

## Словники

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Це показує, що ви просто створили пустий словник. Урра!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- ключ `name` вказує на значення `'Ola'` (об'єкт `string` - рядок),
- `country` вказує на `'Poland'` (інший об'єкт `string` - рядок),
- і `favorite_numbers` вказує на `[7, 42, 92]` (об'єкт `list` - список з трьома числами всередині).

Можна перевірити значення індивідуальних ключів, використовуючи наступний синтаксис:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

Що трапиться якщо запитати Python про значення ключа, що не існує? Не здогадуєтесь? Давайте спробуємо і подивимось!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Погляньте, інша помилка! Цього разу - **KeyError**. Python допомагає і підказує вам про те, що ключа `'age'` не існує в даному словнику.

Коли ж варто використовувати словник, а коли список? Що ж, гарне питання. Просто вирішимо його подумки перед тим, як подивитися відповідь у наступному рядку.

- Вам необхідна лише впорядкована послідовність елементів? Користуйтеся списком.
- Вам потрібні значення асоційовані із ключами, так що ви можете ефективно переглядати їх (за допомогою ключа) пізніше? Користуйтеся словником.

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

You can use the `pop()` method to delete an item in the dictionary. Скажімо, якщо ви бажаєте видалити значення, що відповідає ключу `'favorite_numbers'`, просто наберіть наступну команду:

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

### Зміст

Чудово! Тепер ви знаєте багато про програмування. У цій останній частині ви дізналися про такі поняття як:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Не дочекаєтеся переходу до наступної частини? :)

## Порівняння

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

Цікаво чому ми використали два однакові знаки `==` щоб порівняти чи є рівними числа? Ми використовуємо `=` для присвоєння значень змінним. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. Ми також можемо перевіряти чи два об'єкта є нерівними. Для цього ми використовуємо символ `!=`, як показано в прикладі вище.

Задайте для Python ще дві задачі:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y означає x більше ніж y
- x `<` y означає x менше ніж y
- x `<=` y означає x менше або рівне y
- x `>=` y означає x більше або рівне y

Чудово! Хочете ще? Спробуйте це:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Ви можете задавати для Python стільки чисел для порівння скільки заманеться, і він дасть вам результат! Дуже розумно, чи не так?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Чи чули ви про вираз "порівняння яблук і апельсинів"? Давайте спробуємо Python еквівалент:

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Бачимо тут, що як і у виразі, Python не в змозі порівняти число (`int`) та рядок (`str`). Натомість, виводиться **TypeError** і повідомляє нас про те, що ці два типи не можна порівнювати між собою.

## Логічні типи

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Логічні значення також можуть бути змінними! Погляньте:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Можна також зробити теж саме по іншому:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Практикуйте із логічними типами спробувавши запустити наступні команди:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Вітання! Логічні типи одна із найкрутіших властивостей програмування, і ви щойно освоїли, як їх застосовувати!

# Збережіть!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

Поки ми писали весь наш python код в інтерпритаторі, що обмежує нас написанням лише одного рядка за раз. Зазвичай програми зберігаються у файли і виконуються **інтерпритатором** або **компілятором** нашої мови програмування. Досі ми запускали наші програми одним рядком в Python **інтерпретаторі**. Для наступних задач нам знадобиться більше, ніж один рядок коду, отже нам потрібно:

- Закрити Python інтепретатор
- Відкрити наш текстовий редактор на вибір
- Зберегти певний код в python файлі
- Запустити його!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Ви повернетеся назад до командного рядка.

Раніше, ми вже обрали для себе редактор коду, в секції [редактор коду](../code_editor/README.md). А тепер ми маємо відкрити цей редактор і написати якийсь код в новому файлі:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Очевидно, ви тепер є досить досвідченим Python програмістом, отже, можете написати у ваш код усе, що ви до цього часу вивчили.

А тепер треба зберегти файл і дати йому описове ім'я. Назвімо файл **python_intro.py** і збережемо його на вашому робочому столі. Ви можете називати файл як завгодно, тільки важливо щоб назва закінчувалась на **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. Це називається "підсвіткою синтаксису", і це справді корисна для програміста функція. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). Це одна з вагомих причин, чому ми використовуємо редактор коду. :)

По тому як файл успішно збережено, час запустити його! Використовуючи навики отримані під час освоєння розділу, що стосувався командного рядка, скористайтеся терміналом, щоб **змінити директорію** на робочий стіл.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Для Mac, команда буде виглядати так:

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

Якщо ви застрягли, просто попросіть допомогти.

Використовуйте Python, щоб виконати код у файлі, таким чином:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Гаразд! Ви щойно запустили вашу першу Python програму, яка була збережена у файлі. Чудові відчуття?

Тепер ви можете переходити до важливого інструменту у програмуванні:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Замініть код вашого файлу **python_intro.py** на наступне:

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
    

Python очікує від нас подальших інструкцій, які повинні бути виконані, якщо умова `3 > 2` виявляється істинною (тобто `True`). Спробуємо змусити Python надрукувати “It works!”. Змініть код у файлі **python_intro.py** на наступне:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Зауважили яким чином ми зробили відступ в 4 пробіли для наступного рядка коду? Це необхідно робити для того, щоб Python знав, який шматок коду запускати, якщо результати умови істинні. Можна зробити відступ і в один пробіл, але майже усі Python програмісти роблять відступ у 4 пробіли, щоб було акуратніше. Один `tab` також рахується як 4 пробіли.

Збережіть і запустіть знову:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### А що, коли умова не істинна?

У попередніх прикладах, код виконувався лише коли умови були істинними - True. Однак, Python також має умови `elif` та `else`:

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

Коли запустимо це, буде виведено:

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

і в результаті:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

Бачите що тут відбуваеться? `elif` вказує додаткові умови для перевірки, якщо результат попередніх невдалий.

Ви можете додати стільки виразів `elif`, скільки вам до вподоби, одразу після виразу `if`. Наприклад:

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

Python послідовно виконує всі перевірки та друкує:

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

### Зміст

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Час для останньої частини цього параграфу!

## Ваші власні функції!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

Функція - це набір інструкцій, які Python повинен виконати. Кожна функція в Python починається із ключового слова `def`, отримує ім'я і може містити певні параметри. Let's give it a go. Перепишемо код в **python_intro.py** наступним чином:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Окей, наша перша функція готова!

Ви можете запитати для чого ми написали ім'я функції наприкінці файлу. Це тому, що Python зчитує файл і виконує його згори донизу. Отже, для того, щоб скористатися нашою функцією, ми повинні написати її знову унизу.

А тепер запустимо і подивимось що станеться:

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

Як бачимо, зараз ми задали для нашої функції параметр, який назвали `name`:

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

Пам'ятайте: функція `print` відділена відступами від команди `if` на чотири пробіли. Це тому, що функція запускається, коли виконується умова. Давайте подивимося, як це відбувається зараз:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

Ой, помилка. На щастя, Python надає нам дуже корисне повідомлення про помилку. Воно повідомляє нас про те, що функція `hi()` (та, яку ми визначили) має один необхідний аргумент (`name`) і що ми забули передати його коли здійснювали виклик функції. Виправимо це наприкінці файлу:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

І запустимо знову:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

А якщо ми змінимо ім'я?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Запустіть:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Чудово, чи не так? Таким чином вам не потрібно повторюватись кожного разу, коли ви захочете змінити ім'я особи, з якою має вітатися наша функція. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

А тепер виконаємо програму:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Вітаємо! Ви щойно розібралися з тим як писати функції! :)

## Цикли

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

Це вже остання частина. Усе було швидко, чи не так? :)

Програмісти не люблять повторюватись. Програмування - це процес автоматизації всього, тому ми не хочемо вітати кожну людину по імені вручну, правильно? Тут пригодяться цикли.

Ще пам'ятаєте про списки? Давайте створимо список дівчат:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

Ми б хотіли привітатися із кожною з них персонально. Щоб це зробити у нас є функція `hi`, отже, використаємо її в циклі:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

Тут наведено повну версію коду у файлі:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

А коли ми зАпустимо усе це:

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
    

Як бачимо, все, що міститься всередині виразу `for` із відступом буде повторюватися для кожного елементу зі списку `girls`.

Також можна використовувати `for` для чисел, використовуючи функцію `range`:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Що виведе на екран:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` - це функція, що створює список чисел, що йдуть одне за одним ці числа задаються вами як параметри).

Зауважте, що друге з цих двох чисел, не входить до списку, що виводиться на екран Python (тобто `range(1, 6)` рахує від 1 до 5, але не включає число 6). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Зміст

Ось і все. **Ви дали перцю!** Це був складнуватий розділ, тому ви можете пишатися собою. Ми ж безумовно пишаємося вами, адже ви вже багато чого досягли!

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)