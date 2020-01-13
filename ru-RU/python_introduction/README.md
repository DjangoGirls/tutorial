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

> Для занимающихся дома: эта глава освещена в видео [Как работает Интернет](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Словари схожи со списками, но ты обращаешься к значениям словаря по ключу, а не по индексу. Ключом может быть любая строка или число. Давай создадим пустой словарь:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Это показывает что мы создали пустой словарь. Ура!

Теперь попробуй следующую команду (можешь заменить значения на своё имя, страну и т. д.):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Этой командой ты создала переменную `participant` с тремя парами ключ-значение:

- Ключ `name`, указывающий на значение `'Ola'` (`строковый` объект),
- ключ `country`, указывающий на значение `'Poland'` (еще одна `строка`),
- и ключ `favorite_numbers`, указывающий на значение `[7, 42, 92]` (объект типа `список` с тремя числами внутри).

Значение конкретного ключа можно узнать следующим образом:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Видишь, синтаксис похож на работу со списком. Но вместо того чтобы запоминать индекс, тебе нужно помнить ключ.

Что случится, если мы спросим у Python значение несуществующего в словаре ключа? Можешь предположить? Давай попробуем и узнаем наверняка!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Словари, как и списки, *изменяемы*, т. е. они могут быть изменены после того как были созданы. Ты можешь добавить новые пары ключ/значение в словарь следующим образом:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Также как в примере со списками, использование функции `len()` вернет число пар ключ/значение в словаре. Попробуй сама:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Надеюсь, все вышеизложенное понятно. :) Готова к новым приключениям со словарями? На следующей строке тебя ждут изумительные вещи.

Ты можешь использовать команду `pop` для удаления элементов из словаря. Скажем, ты хочешь удалить элемент с ключом `'favorite_numbers'`, просто набери следующую команду:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Как видно, пара ключ-значение с ключом 'favorite_numbers' была удалена.

Помимо этого, ты можешь заменить значение, ассоциированное с уже существующим ключом. Набери:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Значение, на которое ссылается ключ `'country'` было изменено с `'Poland'` на `'Germany'`. Захватывает? Еще бы! Ты выучила еще одну потрясающую штуку.

### Содержание

Шикарно! Теперь ты знаешь немало о программировании. Мы познакомились с:

- **ошибками** - теперь ты знаешь как читать и анализировать ошибки, которые возникают, если Python не понимает твоей команды
- **переменными** - именами для объектов, которые упрощают твой код и делают его более читабельным
- **списками** - последовательностями объектов в заданном порядке
- **словарями** - объектами, хранящими пары ключ-значение

Готова к продолжению? :)

## Сравниваем вещи

> Для занимающихся дома: эта глава освещена в видео [Как работает Интернет](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Немалая часть программирования требует сравнения вещей. Что проще всего сравнить друг с другом? Числа, конечно. Давай посмотрим как это работает:

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

Мы передали Python несколько чисел для сравнения. Как ты можешь заметить, Python сравнивает не только числа, но и результаты методов (например, умножения). Неплохо, правда?

Хочешь спросить почему мы написал двойной символ равенства `==`, чтобы проверить одинаковы ли числа? Потому что одинарные символ равенства `=` уже задействован под присваивание значения переменным. Ты всегда, **всегда** должна писать два символа равенства `==`, если хочешь проверить одинаковы ли объекты. Мы также можем проверить различаются ли объекты. Для этого, мы используем `!=`, как показано в примере выше.

Дадим Python еще два задания:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

С `>` и `<` все понятно, но что значат `>=` и `<=`? Читай их следующим образом:

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

- **and** - если ты используешь `and` оператор, оба сравнения по бокам от него должны быть True (верны), чтобы результат всей команды был равен True
- **or** - если ты используешь `or` оператор, достаточно одному из сравнений по бокам от него быть равным True, чтобы результат всей команды также равнялся True

Ты когда-нибудь слышала выражение "сравнивать яблоки и апельсины"? Попробуем что-то подобное в Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Как мы видим, Python не знает как сравнить число (`int`) и строку (`str`) между собой. Поэтому он просто возвращает нам ошибку **TypeError** и предупреждает, что объекты заданных типов не могут быть сравнены.

## Логические значения

Кстати, вы только что узнали о новом типе объекта на Python. Он называется **Boolean**.

Существует только два логических объекта:

- True
- False

Чтобы Python понимал тебя, ты всегда должна писать True с заглавной буквы (остальные прописные). **true, TRUE, tRUE не будет восприниматься -- только True.** (Та же логика применима к False, само собой.)

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

Поздравляем! Логические значения одна из самых классных фишек программирования и ты только что научилась ими пользоваться!

# Сохраняй!

> Для занимающихся дома: эта глава освещена в видео [Как работает Интернет](https://www.youtube.com/watch?v=dOAg6QVAxyk).

До сих пор мы писали весь код в интерактивной консоли, где Python сразу анализировал, обрабатывал и выполнял наши команды. Мы были ограничены одной строкой. Обычно, программы сохраняются в файлах и выполняются **интерпретатором** или **компилятором** нашего языка программирования. Пока мы только просили **интерпретатор** Python выполнять наши однострочные команды из консоли. Однако, нам понадобится больше места для следующих задач, поэтому задача минимум:

- Закрыть интерактивную консоль Python
- Открыть наш текстовый редактор
- Сохранить код в новом файле
- Запустить его!

Чтобы закрыть интерактивную консоль Python просто набери функцию ~~~ exit()~~~ :

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Это вернет тебя в командную строку.

Ранее мы выбрали редактор кода из раздела [редактор кода](../code_editor/README.md). Теперь нам нужно открыть редактор и написать код в новый файл (или если вы используете Chromebook, создайте новый файл в облачном IDE и откройте файл, который будет включен в редактор кода):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Очевидно, ты уже искушенный Python разработчик, так что не стесняйся добавить что-нибудь по своему вкусу из ране изученного.

Теперь нам нужно сохранить файл с кодом и дать ему подходящее имя. Давай назовем его **python_intro.py** и сохраним на рабочий стол. Мы можем назвать файл как хотим, но важно чтобы название заканчивалось на **.py**. Расширение **.py** говорит операционной системе, что это **исполняемый файл python**, и Python может его запустить.

> **Примечание** Ты должна уде была заметить одну из крутейших вещей в редакторах кода: цвета! В интерактивной консоли Python весь текст был одного цвета, сейчас же функция `print` должна отличаться по цвету от текста, который передается в неё в качестве атрибута. Это называется «синтаксическая подсветка», и это действительно удобная штука для программирования. Цвет подсветки может подсказать тебе о незакрытой кавычке или опечатке в ключевом слове (таком как `def` в определении функции, с которым мы скоро познакомимся). Это одна из причин, по которой мы используем редакторы кода. :) :)

После сохранения файла пришло время запустить его! Используя навыки из раздела о командной строки, открой терминал и **поменяй текущую директорию** на рабочий стол.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Для Mac команда будет выглядеть так:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

На Линукс это будет так:

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

(Помните, что слово "Рабочий стол" может быть переведено на ваш локальный язык.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

В командной строке Windows это будет так:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

И для Windows Powershell это будет выглядеть так:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Если ты застряли, попроси помощи. Именно для этого здесь нужны наставники!

Теперь используй Python чтобы запустить код в файле:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Примечание: в Windows 'python3' не распознается как команда. Вместо этого используй 'python' для выполнения файла:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Отлично! Ты только что запустила свою первую программу, чей код был сохранен в файле. Чувствуешь воодушевление?

Можно передвигаться дальше к такому незаменимому в программировании инструменту как:

## If … elif … else

Зачастую определенный код в программе должен выполняться только при соблюдении определенных условий. Поэтому в Python есть такая вещь как **условный оператор if**.

Замени код в своем файле **python_intro.py** на:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Если мы сохраним его и запустим, то получим ошибку:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

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

Обратила внимание как мы сделали отступ во второй строке из 4 символов пробела? Мы поступаем так, чтобы Python понимал какой код после условного оператора if должен быть выполнен, если условие равно True. Можно ограничиться и одним пробелом, однако, практически все программисты Python используют 4, чтобы код выглядел аккуратно и читабельно. A single Tab will also count as 4 spaces as long as your text editor is set to do so. When you made your choice, don't change it! If you already indented with 4 spaces, make any future indentation with 4 spaces, too - otherwise you may run into problems.

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