{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Вступ до Python

> Частина цього розділу базується на матеріалах Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Давайте напишемо якийсь код!

## Консоль Python

> Для читачів вдома: відеоверсія цього розділу - [Основи Python: числа, рядки, списки, змінні та помилки](https://www.youtube.com/watch?v=MO63L4s-20U) (англ.).

Щоб розпочати роботу із Python, нам необхідно відкрити *командний рядок*. Ви вже повинні знати, як це зробити, адже ознайомились із цим у розділі [Вступ до командного рядка](../intro_to_command_line/README.md).

Як тільки будете готові, виконайте у командному рядку такі дії.

Ми хочемо відкрити консоль Python, тому введіть `python` на Windows або `python3` на Mac OS/Linux та натисніть `Enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Ваша перша команда на Python!

Після запуску консолі Python, як ми побачили, запрошення змінилось на `>>>`. Для нас це означає, що відтепер ми можемо користуватися лише командами мови Python (вони також називаються "інструкціями"). Вам не доведеться друкувати `>>>`, Python зробить це для вас сам.

Якщо забажаєте вийти із консолі Python, наберіть `exit()` або використайте комбінацію клавіш `Ctrl + Z` для Windows і `Ctrl + D` для Mac/Linux. Після цього ви більше не побачите `>>>`.

Але наразі ми не бажаємо виходити із консолі Python. Ми хочемо дізнатися про неї більше. Почнемо з чогось простенького. Наприклад, спробуйте набрати певний математичний вираз, на зразок `2 + 3`, та натисніть `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Чудово! Бачите, де з'явилась відповідь? Python знає математику! Можна спробувати інші команди, наприклад:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Для піднесення до степеня, наприклад 2 у степені 3, ми пишемо: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Поки що можете трохи побавитися із математикою, а далі повертайтесь назад :).

Як бачите, Python є чудовим калькулятором. Мабуть вам цікаво, що ще можна робити?

## Рядки

Як щодо вашого імені? Наберіть ваше ім'я в лапках, як тут (можна писати кирилицею):

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Щойно ви створили свій перший рядок (str)! Це послідовність символів, що може бути оброблена комп'ютером. Рядок має починатися і закінчуватися одним і тим же символом. Це може бути одинарна (`'`) або подвійна (`"`) лапка (немає ніякої різниці)! Лапки вказують Python, що всередині них рядок.

Рядки можна об'єднувати. Спробуйте:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Рядки можна не тільки додавати, але й множити на число:

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

або ж "екранувати" апостроф за допомогою оберненої скісної риски `\` (бекслеш, англ. backslash):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Гарно, еге ж? Щоб побачити своє ім'я, написане великими літерами, наберіть:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Ви щойно застосували до свого рядка **функцію** `upper`! Функція (така як `upper()`) - це набір інструкцій, які повинен виконувати Python над заданим об'єктом (`"Ola"`) після того, як ви її викликали.

Якщо ви раптом забажаєте дізнатися число букв у вашому імені, то для цього також існує функція!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Здивовані, чому іноді ви викликаєте функції із `.` наприкінці рядка (на зразок `"Ola".upper()`), а іноді ви спочатку викликаєте функцію, а рядок вказуєте після неї у дужках? Що ж, у деяких випадках функції належать об'єктам, як наприклад `upper()`, - це означає, що така функція може бути виконана лише над рядком. У цьому випадку ми називаємо функцію **методом**. В інших випадках функції не прив'язані до якогось конкретного об'єкта і можуть використовуватись над різними типами об'єктів, як наприклад `len()`. Саме тому ми використовуємо `"Ola"` у якості параметра для функції `len`.

### Підсумок

Гаразд, досить про рядки. Отже, ви вже ознайомилися із такими поняттями, як:

- **консоль** – виконання команд (інструкцій коду) в консолі Python одразу показує їхній результат
- **числа і рядки** – в Python числа використовуються для математичних виразів, а рядки – для текстових об'єктів
- **оператори** – на зразок `+` та `*`, перетворюють одні значення на інші
- **функції** – на зразок `upper()` та `len()`, виконують дії над об'єктами.

Це є основи будь-якої мови програмування, яку ви вивчатимете. Готові приступити до чогось складнішого? Б'ємось об заклад, що так!

## Помилки

Спробуємо щось нове. Чи можемо ми отримати довжину числа тим же методом, як ми це робили для нашого імені? Наберіть `len(304023)` та натисніть `Enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Ми отримали нашу першу помилку (error)! Іконка {{ warning_icon }} - це наш спосіб попередити вас, що код, який ви збираєтесь запустити, не буде працювати так, як очікувалося. Робити помилки (навіть навмисне) – важлива частина навчання!

Отже, прочитаємо уважно текст помилки вище. У ньому йдеться про те, що це "помилка типу": об'єкт типу "int" (integers, цілі числа) не має довжини. І що ж нам тепер робити? Можливо, можна записати наше число у формі рядка? Рядки ж мають довжину, правда?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Спрацювало! Ми використали функцію `str` всередині функції `len`. `str()` перетворює будь-що на рядок.

- Функція `str` перетворює будь-який об'єкт на **рядок**
- Функція `int` перетворює будь-який об'єкт на **ціле число** (якщо це можливо)

> Важливо: ми можемо перетворити число на текст, однак не завжди можемо перетворити текст на число - чому б могло дорівнювати, наприклад, `int('hello')`?

## Змінні

Важливою концепцію в програмуванні є змінні. Змінна - це не більше, ніж ім'я для чогось, що можна буде використовувати пізніше. Програмісти використовують ці змінні для збереження даних, щоб зробити свій код більш читабельним, і в результаті їм не потрібно пам'ятати зайве.

Скажімо, ми хочемо створити змінну і назвати її `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Бачите? Це просто! Просто: name дорівнює Ola.

Як ви помітили, ваша програма не повернула нічого, на відміну від прикладів вище. Отже, як ми можемо бути певні, що змінна насправді існує? Просто введіть `name` і натисніть `Enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Урра! Ваша перша змінна :)! Ви завжди можете змінити значення, на яке вона посилатиметься:

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

Файно, хіба ні? Звісно, змінні можуть представляти будь-що, наприклад числа! Спробуйте:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

А якщо ми використали неправильне ім'я? Як ви думаєте, що станеться? Спробуймо!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Помилка! Як бачите, Python має різні типи помилок, і дана помилка називається **NameError** ("помилка імені"). Python видасть цю помилку, якщо ви спробуєте використати досі не визначену змінну. Якщо ж ви зіткнетеся із цією помилкою пізніше, перевірте свій код, чи не зробили ви помилки в написанні імен змінних.

Поекспериментуйте трохи із цим усім і подивіться, що тут можна робити!

## Функція print

Спробуйте таке:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Коли ви вводите просто `name`, інтерпретатор Python видає рядкове *представлення* змінної 'name', тобто набір літер M-a-r-i-a, взятий в одинарні лапки, ''. Коли ж ви пишете `print(name)`, Python "друкує" (англ. print) значення змінної на екран без лапок, що є більш елегантним.

Як ми потім побачимо, `print()` є також корисним, коли ми хочемо надрукувати повідомлення зсередини функцій, або ж коли хочемо надрукувати щось у декілька рядків.

## Списки

Окрім рядків та чисел, Python має усі види різних типів об'єктів. Наразі ми збираємося представити вашій увазі один із них, він називається **список** (list). Списки є саме тим, про що ви й подумали: це об'єкти, які є списками інших об'єктів. :)

Створимо список:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Так, цей список пустий. Не дуже корисно, так? Створимо список лотерейних номерів. Ми не бажаємо увесь час повторюватись, то ж покладемо усе до змінної:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Гаразд, маємо список! Що ми можемо з ним робити? Давайте глянемо, скільки лотерейних номерів міститься у списку. Як ви думаєте, яку функцію для цього можна використати? Ви вже це знаєте!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Так! Знайома вам функція `len()` може дати вам кількість об'єктів у списку. Зручно, правда ж? Тепер, можливо, ми захочемо відсортувати список:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Ця функція нічого не повертає, вона лише змінює порядок, в якому зберігаються числа у списку. Давайте надрукуємо список знову і подивимось, що ж сталося:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Як бачимо, числа у нашому списку тепер відсортовано, починаючи з найменшого і закінчуючи найбільшим значенням. Вітаємо!

Можливо, ми хочемо відсортувати числа у зворотньому порядку? Давайте це зробимо!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Якщо ви забажаєте щось додати до свого списку, то можете це зробити за допомогою такої команди:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Якщо захочете показати лише перше число зі списку, то можете зробити це використавши **індекси**. Індекс - це порядковий номер, який повідомляє, з якої позиції у списку взято елемент. Програмісти люблять починати відлік з 0, отже перший об'єкт з вашого списку буде мати індекс 0, наступний - 1, і так далі. Спробуйте таке:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Як бачимо, ви можете отримати доступ до різних об'єктів списку, написавши індекс об'єкта всередині квадратних дужок після імені списку.

Для того, щоб видалити що-небудь зі списку, вам потрібно використати **індекси**, які ви вже знаєте, і метод `pop()`. Давайте спробуємо на прикладі та згадаємо, що ми вивчили раніше; ми будемо видаляти перший елемент з нашого списку.

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

Для додаткового задоволення спробуйте різні індекси: 6, 7, 1000, -1, -6 або -1000. Подивіться, чи можете ви передбачити результат команди перед її застосуванням. Чи мають ці результати якийсь смисл?

Список усіх доступних методів списку міститься у цьому розділі документації Python: https://docs.python.org/3/tutorial/datastructures.html

## Словники

> Для читачів вдома: відеоверсія цього розділу - [Основи Python: словники](https://www.youtube.com/watch?v=ZX1CVvZLE6c) (англ.).

Словник (dict) є чимось подібним до списку (list), але доступ до значень отримується шляхом пошуку за ключем замість числового індексу. Ключ може являти собою будь-який рядок або число. Створити пустий словник можна так:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Це показує, що ви щойно створили пустий словник. Урра!

А тепер спробуйте набрати таку команду (можете підставити сюди вашу власну інформацію):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

За допомогою вказаної команди ви щойно створили змінну-словник із назвою `participant` і трьома парами ключ-значення:

- Ключ `name` (ім'я) вказує на значення `'Ola'` (об'єкт `рядок`),
- `country` (країна) вказує на `'Poland'` (інший `рядок`),
- нарешті, `favorite_number` (улюблені числа) вказує на `[7, 42, 92]` ( `список` з трьома числами всередині).

Можна перевірити значення індивідуальних ключів, використовуючи такий синтаксис:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Бачите, усе подібно до списку. Але вам не треба пам'ятати індекс – треба знати лише ім'я.

Що трапиться якщо запитати Python про значення ключа, який не існує? Не здогадуєтесь? Давайте спробуємо і подивимось!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Погляньте, інша помилка! Цього разу - **KeyError** ("помилка ключа"). Python допомагає і підказує вам, що ключа `'age'` (вік) не існує в даному словнику.

Коли ж варто використовувати словник, а коли список? Що ж, гарне питання. Подумайте над ним перед тим, як подивитися відповідь у наступному рядку.

- Вам необхідна лише впорядкована послідовність елементів? Користуйтеся списком.
- Вам потрібні значення, асоційовані із ключами, так щоб ви могли легко їх знаходити (за допомогою ключа)? Користуйтеся словником.

Словники, як і списки, є *змінюваними*, це означає що вони можуть бути змінені після того, як створені. Ви можете додати нові пари ключ-значення до словника після того, як він був створений, наприклад:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Як і для списків, функція `len()` для словників повертає кількість пар ключ-значення в словнику. Наберіть команду:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Сподіваємося, це наразі має сенс. :) Готові до ще більшого задоволення від роботи зі словниками? Читайте далі, щоб побачити дещо дивовижне.

Ви можете використовувати метод `pop()` для видалення елемента зі словника. Скажімо, якщо ви бажаєте видалити значення, що відповідає ключу `'favorite_numbers'`, наберіть таку команду:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Як бачимо з результатів, пару ключ-значення, що відповідає ключу 'favorite_numbers', було видалено.

Також можна змінити значення, асоційоване з ключем, який вже існує у словнику. Наберіть:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Як бачимо, значення ключа `'country'` було змінено із `'Poland'` на `'Germany'`. :) Вражаюче? Ура! Ви щойно освоїли ще одну дивовижну річ.

### Підсумок

Чудово! Тепер ви знаєте багато про програмування. У цій останній частині ви дізналися про такі поняття, як:

- **помилки** – тепер ви знаєте, як читати та розуміти помилки, які з'являються, якщо Python не розуміє введеної команди;
- **змінні** – імена для об'єктів, що дозволяють вам спростити процес написання коду і зробити його більш читабельним;
- **списки** – послідовності об'єктів, впорядкованих певним чином;
- **словники** – об'єкти, що містять пари ключ-значення.

Не дочекаєтеся переходу до наступної частини? :)

## Порівняння

> Для читачів вдома: відеоверсія цього розділу - [Основи Python: порівняння](https://www.youtube.com/watch?v=7bzxqIKYgf4) (англ.).

Велика частина програмування — це порівняння. Що є найпростішою річчю для порівняння? Звісно, числа. Давайте подивимось, як це працює:

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
>>> len([1, 2, 3]) > len([4, 5])
True
```

Ми надали Python деякі числа для порівняння та отримали результат: True (істина) або False (хиба). Як бачимо, Python порівнює не тільки числа, але може й порівнювати значення математичних виразів (на зразок `2 * 2`) або результати функцій, такі як `2` , що повертається функцією `len([4, 5])`. Гарно, еге ж?

Цікаво, чому ми використали два однакові знаки `==`, щоб перевірити, чи є числа рівними? Ми використовуємо один знак `=` для присвоєння значень змінним. Тому **завжди** треба писати два знаки `==`, якщо ви бажаєте здійснити перевірку двох чисел на рівність одне одному. Ми також можемо перевіряти, чи є два об'єкти нерівними. Для цього ми використовуємо символи `!=`, як показано в прикладі вище.

Задайте для Python ще дві задачі:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Щодо `>` та `<` начебто зрозуміло, але що означають `>=` та `<=`? Читайте їх так:

- x `>` y означає: x більше y
- x `<` y означає: x менше y
- x `<=` y означає: x менше або дорівнює y
- x `>=` y означає: x більше або дорівнює y

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

Ви можете давати Python стільки чисел для порівняння, скільки заманеться, і він дасть вам результат! Дуже розумно, чи не так?

- **and** – якщо з'єднати дві умови оператором `and`, то результат буде істинним (True) лише у випадку, коли обидві умови істинні (True);
- **or** – якщо з'єднати дві умови оператором `or`, то результат буде істинним (True), коли хоча б одна з умов – істинна (True).

Чули колись вираз "порівнювати тепле з м'яким"? Давайте спробуємо щось подібне у Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Бачимо, що як і у тому жартівному виразі, Python не в змозі порівняти число (`int`) та рядок (`str`). Натомість виводиться **TypeError** ("помилка типу"), яка повідомляє нам про те, що ці два типи не можна порівнювати між собою.

## Логічний тип даних

Між іншим, ви щойно дізналися про новий тип даних в Python. Він називається **логічним типом** (або булевим, bool).

Можливо, це найпростіший тип. Існує лише два значення логічного типу:

- Істинне: True
- Хибне: False

Але для того, щоб Python міг це зрозуміти, треба завжди писати 'True' (перша літера – велика, а решта – маленькі). **true, TRUE, tRUE не працюють -- лише True є правильним** (Те ж саме стосується і 'False').

Логічні значення також можуть бути змінними! Погляньте:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Можна зробити теж саме і по-іншому:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Попрактикуйте з логічними виразами, спробувавши запустити такі команди:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Вітання! Логічні значення – одна із найкрутіших властивостей програмування, і ви щойно освоїли, як їх застосовувати!

# Збережіть!

> Для читачів вдома: відеоверсія цього розділу – [Основи Python: збереження файлів та інструкція "if"](https://www.youtube.com/watch?v=dOAg6QVAxyk) (англ.).

Досі ми писали весь наш Python-код в інтерпретаторі, що обмежує нас написанням лише одного рядка за раз. Зазвичай програми зберігаються у файлах і виконуються **інтерпретатором** або **компілятором** нашої мови програмування. Досі ми запускали наші програми одним рядком в **інтерпретаторі** Python. Для наступних задач нам знадобиться більше, ніж один рядок коду, отже нам потрібно:

- Закрити інтерпретатор Python
- Відкрити редактор коду, який ми обрали
- Зберегти певний код у Python-файлі
- Запустити його!

Щоб вийти з інтерпретатора Python, яким ми користувалися до цього, наберіть функцію `exit()`:

{% filename %}командний рядок{% endfilename %}

```python
>>> exit()
$
```

Ви повернетеся назад до командного рядка.

Раніше ми вже обрали для себе редактор коду в розділі [Редактор коду](../code_editor/README.md). А тепер ми маємо відкрити цей редактор і написати якийсь код в новому файлі (якщо ви використовуєте хромбук, створіть новий файл у хмарному IDE і відкрийте цей файл там же у редакторі коду):

{% filename %}редактор коду{% endfilename %}

```python
print('Hello, Django girls!')
```

Очевидно, ви тепер є досить досвідченою Python-програмісткою, отже можете написати у ваш код усе, що ви до цього часу вивчили.

А тепер треба зберегти файл і дати йому описове ім'я. Назвіть файл **python_intro.py** і збережіть його на вашому робочому столі. Ви можете назвати файл як завгодно, тільки важливо, щоб назва закінчувалась на **.py**. Закінчення **.py** говорить нашій операційної системи, що це **виконуваний файл Python** і Python може його запускати.

> **Примітка:** Ви повинні помітити одну з найкрутіших фіч редакторів коду: кольори! У консолі Python все було одного кольору, тепер же ви бачите, що функція `print` має інший колір, ніж рядок, який вона друкує. Це називається "підсвічуванням синтаксису", і це справді корисна функція для програмістів. Різний колір слів дає вам підказку про незакриті лапки рядка чи орфографічну помилку в ключовому слові (згодом зверніть увагу на колір слова `def` в описі функції). Це одна з вагомих причин, чому ми використовуємо редактор коду. :)

По тому, як файл успішно збережено, час запустити його! Згадуючи, чому ви навчились у розділі про командний рядок, скористайтеся терміналом, щоб **змінити директорію** на робочий стіл.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Для Mac команда буде виглядати так:

{% filename %}командний рядок{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Для Linux команда буде на зразок

{% filename %}командний рядок{% endfilename %}

    $ cd ~/Desktop
    

(Пам'ятайте, що слово "Desktop" може бути перекладене вашою мовою.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

У командному рядку Windows це буде так:

{% filename %}командний рядок{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

А у Windows Powershell команда буде такою:

{% filename %}командний рядок{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

Якщо ви застрягли, попросіть допомоги. Це як раз той випадок, коли треба турбувати тренера.

Тепер ви можете виконати ваш код у файлі, викликаючи Python:

{% filename %}командний рядок{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Примітка: у Windows команди 'python3' немає. Замість цього виконуйте файл командою 'python':

{% filename %}командний рядок{% endfilename %}

```python
> python python_intro.py
```

Гаразд! Ви щойно запустили вашу першу Python-програму, яка була збережена у файлі. Чудові відчуття?

Тепер ви можете переходити до важливого інструменту в програмуванні:

## If … elif … else

Часто певні дії у нашій програмі мають відбуватись лише тоді, коли виконуються задані умови. Саме тому Python має інструмент, який називається **інструкцією if (якщо)**.

Замініть код у вашому файлі **python_intro.py** на такий:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

Якщо ми збережемо цей файл і запустимо його, то побачимо таку помилку:

{% filename %}{{ warning_icon }} командний рядок{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    
    (Помилка синтаксису: неочікуваний кінець файлу у рядку 2)
    

Python очікує від нас подальших інструкцій, які будуть виконані у разі, якщо умова `3 > 2` виявиться істинною (тобто `True`). Спробуємо змусити Python надрукувати “It works!” ("Воно працює!"). Змініть код у вашому файлі **python_intro.py** на такий:

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

Звернули увагу, що ми зробили відступ в 4 пробіли для наступного рядка коду? Це необхідно для того, щоб Python знав, який шматок коду запускати у разі, якщо умова істинна. Можна зробити відступ і в один пробіл, але майже усі Python-програмісти роблять відступ у 4 пробіли, щоб було акуратніше. Клавіша Tab також додає 4 пробіли (якщо ви не налаштували свій редактор інакше). Як зробите вибір, вже не змінюйте його! Якщо ви почали робити відступ з 4 пробілами, робіть такими ж і всі інші відступи у програмі – інакше ви можете зіткнутися з проблемами.

Збережіть і запустіть знову:

{% filename %}командний рядок{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Примітка: Пам'ятайте, що у Windows немає команди 'python3'. Тому, коли виконуєте файл, пишіть 'python' замість 'python3'.

### А що, коли умова не істинна?

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

### Зміст

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Ваші власні функції!

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

You may wonder why we've written the name of the function at the bottom of the file. When we write `def hi():` and the indented lines following, this is us writing instructions for what the `hi()` function should do. Python will read and remember these instructions, but won't run the function yet. To tell Python we want to run the function, we have to call the function with `hi()`. Python reads the file and executes it from top to bottom, so we have to define the function in the file before we call it.

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

## Цикли

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

## Зміст

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)