{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Въведение в Python

> Част от тази глава е базирана на уроци от Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Да напишем малко код!

## Python запитване

> За читателите у дома: тази част е разгледана във видеото [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

За да започнем да играем с Python, трябва да отворим *команден ред* на вашия компютър. Вече трябва да знаете как да го направите - научихте го в главата [Въведение в командния ред](../intro_to_command_line/README.md).

След като сте готови, следвайте инструкциите по-долу.

Искаме да отворим конзола на Python, затова въведете `python` в Windows или `python3` в Mac OS/Linux и натиснете `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Вашата първа Python команда!

След като изпълните командата Python, подканата се промени в `>>>`. За нас това означава, че засега можем да използваме само команди на езика Python. Не е нужно да пишете `>>>` - Python ще направи това вместо вас.

Ако искате да излезете от конзолата на Python във всеки момент, напишете `exi()` или използвайте прекия път `Ctrl + Z` за Windows и `Ctrl + D` за Mac/Linux. Тогава вече няма да виждате `>>>`.

Засега не искаме да излизаме от конзолата Python. Искаме да научим повече за него. Нека започнем с въвеждане на някаква математика, като `2 + 3` и натискане на `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Nice! Вижте как отговорът изскочи? Python знае математика! Можете да опитате и други команди като:

- `4 * 5`
- `5 - 1`
- `40 / 2`

За да извършим експоненциално изчисление, да кажем 2 на степен 3, ние набираме: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Забавлявайте се с това за малко и след това се върнете тук. :)

Както можете да видите, Python е чудесен калкулатор. Ако се чудите какво още можете да направите...

## Низове

Какво ще кажете за вашето име? Въведете първото си име в кавички така:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Сега създадохте първия си низ! Това е поредица от знаци, които могат да бъдат обработени от компютър. Низът винаги трябва да започва и завършва с един и същ символ. Това могат да бъдат единични (`'`) или двойни (`"`) кавички (няма разлика!) Кавичките казват на Python, че това, което е вътре в тях, е низ.

Струните могат да бъдат нанизани заедно. Опитайте това:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Можете също да умножите низове с число:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Ако трябва да поставите апостроф във вашия низ, имате два начина да го направите.

Използвайки двойни кавички:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

или да избягате от апострофа с обратна черта (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Хубаво, а? За да видите името си с главни букви, напишете:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Току що използвахте метода `upper` върху вашия низ! Методът (като `upper()`) е поредица от инструкции, който Python изпълнява върху даден обект (`"Ola"`) след като е повикан.

Ако искате да знаете, от колко на брой букви е вашето име, има функция и за това!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Чудите ли се понякога защо, когато извиквате функции с `.` на края на низа (като `"Ola".upper()`), като понякога извиквате първо функцията и поставяте низа в скоби? Е, в някой случаи функциите принадлежат на обекти, като `upper()`, която може да се използва само върху низове. В този случай, наричам функцията метод. В други случаи, функциите които не принадлежат към определени типове и могат да бъдат използвани при различни обекти, също като `len()`. Затова даваме `"Ola"` като параметър на функцията `len`.

### Обобщение

Добре, достатъчно за низове. Досега научихте за:

- **запитване** -- писане на команди (код) в Python среда в резултат дава отговори на Python език.
- **числа и низове** -- в Python числата се използват за математически операции а низовете за текстови обекти.
- **оператори** – като `+` и `*`, събират стойности за да получат нова
- **функции** – като `upper()` и `len()`, извършващи се върху обектите.

Това са основите на всеки програмен език, който учите. Готови ли сте за нещо по-сложно? Залагаме, че сте!

## Грешки

Нека опитаме нещо ново. Можем ли да вземем дължината на числото по същият начин, по който взехме дължината на нашето име? Напишете `len(304023)` и натиснете `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Показа се първата ни грешка! {{ warning_icon }} е начина, по който ще ви показваме, че кода който се опитвате да пуснете няма да работи както се очаква. Грешките (дори и тези, които правим нарочно) са важна част от процеса на учене!

Казва, че обектът от тип "int" (integers, или още цели числа) нямат дължина. Какво можем да направим сега? Може би да напишем числото ни като низ? Низовете имат дължина, нали така?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Работи! Използвахме функцията `str` във функцията `len`. `str()` преобразува всичко в низове.

- Функцията `str` преобразува нещата като **низове**
- Функцията `int` преобразува нещата като **цели числа**

> Важно: можем да преобразуваме числа в текст, но не можем да направим обратното -- както и да е какво би било `int('hello')`?

## Променливи

Важно понятие в програмирането са променливите. Променливата е нищо повече от име, което може да се използва по-късно в програмата. Програмистите ползват тези променливи да запазват данни. Това прави кода им по-четлив, така че не се налага да запомнят какви са тези неща.

Нека кажем, че искаме да създаде променлива с име `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Пишем name равно на Ola.

Ако забелязахте, програмата ви не върна нищо както преди това. Как да разберем, че променливата съществува? Напишете `name` и натиснете бутона `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Ихууу! Първата ти променлива! :) Винаги може да я промениш към какво се отнася:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Може да я използвате и във функции:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Страхотно, нали? Сега, променливите могат да са какво ли не -- също така и числа! Пробвайте това:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Но какво ако използваме грешното име Можете ли да отгатнете какво ще се случи? Нека опитаме!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Грешка! Както виждате, Python има различни видове грешки, като тази се казва **NameError**. Python винаги ще ви дава тази грешка, ако се опитвате да използвате променлива, която все още не е дефинирана. Ако попаднете на тази грешка по-късно, вижте дали не сте сбъркали при писането на някое от имената.

Поиграйте се малко с това и вижте какво може да правите!

## Фунцкията print

Пробвайте това:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Когато напишете `name`, Python интерпретатора отговаря със низово *изображение* на променливата 'name', където буквите 'M-a-r-i-a' са обградени от единични кавички. Когато кажем `print(name)`, Python ще "отпечата" съдържанието на променливата на екрана, без кавичките, което е по-прилежно.

Както ще видим по-късно `print()` също е полезен, когато искаме да отпечатаме неща от функциите, или когато искаме да отпечатаме неща на няколко реда.

## Листове

Освен низовете и целите числа, Python има всякакви видове типове от обекти. Сега ще въведем една от тях наречена **list**. Листоверте са точно това, което си мислите, че са: обекти, които са листове от други обекти. :)

Давайте нататък и създайте лист:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Да, това е празен лист. Не е много полезен нали? Нека създадем лист с лотарийни номера. Не искаме да се повтаряме постоянно, така че ще използваме променлива:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

И така, имаме лист! Какво можем да правим с него? Нека видим колко лотарийни числа има в листа? Имате ли си на идея коя функция може да се използва за това? Това вече го знаете!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Да! `len()` може да ви даде броя на обектите в листа. Много удобно, нали? Може би и ще го сортираме:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Това не връща нищо, само променя реда, в който числата са показани в листа. Нека го отпечатаме отново и видим какво се случва:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Както се вижда, числата в листа са вече подредени от по-малката към по-голямата стойност. Поздравления!

Може би искаме да направим обратното?

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Ако искате да добавите нещо към вашия лист, може да го направите като напишете следната команда:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Ако искате да покажете само първото число, може да направите това като използвате **индекси**. Индекса е номерът, който казва къде в листа се появява елемента. Програмистите предпочитат да започват броенето от 0, така че първият обект в листа е с индекс 0, следващия е с 1 и т.н. Опитайте това:

{% filename %}command-line{% endfilename %} 

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Както може да видите, можете да достъпите различни обекти от листа си като използвате името на листа и индекс със квадратни скоби.

За да премахнете нещо от листа си ще трябва да използвате **индексите**, които научихме по-горе и метода `pop()`. Нека пробваме пример и затвърдим това, което научихме до момента: ще отстраним първото число от листа ни.

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

Работи безупречно!

За повече веселба, пробвайте други индекси: 6, 7, 1000, -1, -6 or -1000. Пробвайте се да предположите какъв би могъл да е резултата от командата. Имат ли смисъл резултатите?

Можете да намерите лист с всички възможни методи в тази глава от документацията на Python: https://docs.python.org/3/tutorial/datastructures.html

## Речници

> За читателите у дома: тази част е показана във видеото [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

Речника е подобен на листа, но можете да достъпвате стойностите му като погледнете за ключа вместо числения индекс. Синтаксисът за дефиниране на празен речник е:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Това показва, че в момента създадохте празен речник. Ура!

Сега, опитайте се да напишете следната команда (опитайте се да заместите със своя информация):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

С тази команда, току що създадохте променлива с име `participant` с три елемент-стойност (keys-value) двойки.

- Елементът `name` се отнася за стойността `'Ola'` (`низ` обект),
- `country` се отнася за `'Poland'` (друг `низ`),
- and `favorite_numbers` се отнася за `[7, 42, 92]` (`лист` с три числа в него).

Може да проверите съдържанието на всеки от елементите с този синтаксис:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Виждате ли, подобно е на лист. Но не е необходимо да помните индекса -- само името.

Какво се случва, когато попитаме Python за стойността на елемент, който не съществува? Можете ли да познаете? Нека опитаме и видим:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Вижте, друга грешка! Тази е **KeyError**. Python е много услужлив и ти казва, че елемент `'age'` не съществува в този речник.

Кога да използвате речник и кога лист? Това е добър въпрос. Помислете за отговор преди да видите следващия ред.

- Ако имате нужда просто от подредена последователност от елементи? Ползвайте лист.
- Ако трабва да асоциирате стойности с елементи, които искате да може да ги видите на по-късен етап (чрез елемент - by key)? Използвайте речник.

Речниците са като листове, но *непостоянни*, което означава, че могат да бъдат променени след като бъдат създадени. Може да добавяте нови двойки елемент-стойност към речника след като е създаден ето така:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Като при листовете, използването на метода `len()` върху речника връща броя на двойката елемент-стойност в речника. Продължете и напишете тази команда:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Надявам се да има смисъл това което правим досега. :) Готови ли сте за още веселба с речниците? Прочетете някои невероятни неща.

Можете да използвате метода `pop()` да изтриете елемент от речника. Да кажем, че искаме да премахнем въведението, което се отанся за елемента `'favorite_numbers'`, напишете следната команда:

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Както се вижда, двойката елемент-стойност отнасяща се за 'favorite_numbers' беше премахната.

Както и това, можете да промените стойността, която отговаря на вече създаден елемент в речника. Напишете това:

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Както виждате, стойността на елемента `'country'` беше променен от `'Poland'` на `'Germany'`. :) Вълнуващо? Ураа! Току що научихте още едно невероятно нещо.

### Обобщение

Страхотно! Вече знаете много за програмирането. В тази последна част научихте за:

- **грешки** -- знаете как да четете и разбирате грешките които се показват, ако Python не разбира командата която сте задали
- **променливи** – имена на обектите, които ви позволяват да пишете код по-лесно и да правят кода ви по-четлив
- **листове** –листовете са обекти запазени в определен ред
- **речници** – обекти запазени като двойки от елемент-стойност (key-value pairs)

Вълнувате ли се за следващата част? :)

## Сравняване на неща

> За читателите у вома: тази част е показана във видеото [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Голяма част от програмирането включва сравняване на неща. Какво е най-лесното нещо което може да се сравни? Числата! Нека видим как работи:

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

Дадохме на Python да сравни няколко числа. Както може да видите, Python не само че може да сравни числата, но може също така да сравнява и резултатите от метода. Супер, нали?

Чудите ли се защо използвахме два знака за равно `==` един до друг за да сравним дали числата са равни? Използваме едно равно `=` за да причислим стойност на променливите. Винаги, ама **винаги** трябва да иползваме две от тях – `==` – ако искаме да проверим дали две неща са равни едно на друго. Можем също така да кажем, че не искаме двете неща да са равни едно на друго. Затова, използваме символа `!=`, както е показано в примера по-горе.

Дайте на Python още две задачки:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Виждали сме `>` и `<`, но какво означават `>=` и `<=`? Четем ги по този начин:

- x `>` y означава: x е по-голямо от y
- x `>` y означава: x е по-малко от y
- x `<=` y означава: x е по-малко или равно на y
- x `>=` y означава: x е по-голямо или равно на y

Страхотно! Искате ли да направите още нещо? Пробвайте това:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Може да дадете на Python колкото си искате числа да сравнява и ще ви даде отговор! Много умно, нали?

- **and** – ако използвате оператора `and`, двете сравнения трябва да са True за да бъде цялата команда True
- **or** – ако използвате оператора `or`, само едното сравнение трябва да е True за да бъде цялата команда True

Чували ли сте за израза "сравнение на ябълки и портокали"? Нека пробваме подобно нещо в Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Тук виждате, както при израза, Python не е способен да сравни число (`int`) и низ (`str`). Вместо това ни показва грешка **TypeError** и ни казва, че двата типа не могат да бъдат сравнени.

## Булеви променливи

По между другото, току що научихте за нов тип обект в Python. Нарича се **Булев (Boolean)**.

Има само два вида булеви променливи:

- True
- False

Но за Python да разбере това, винаги трябва да пишете 'True' (като първата буква е главна, а следващите малки). **true, TRUE, and tRUE няма да работят – само True е правилно.** (Същото се отнася и до 'False'.)

Булевите стойности могат също да са променливи! Вижте тук:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Може също да го направите по този начин:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Практикувайте и се повеселете с булевите стойности като се опитате да напишете следните команди:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Поздраления! Булевите стойности са едни от най-готините неща в програмирането, и ти току що се научи как да ги използваш!

# Запази!

> За читателите у дома: тази част е показана във видеото [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk)

До тук писахме всичкия си python код в интерпретатора, който ни ограничава да използваме само едни ред да впишем кода. Обикновено програмите са запазени във файлове и после изпълнени от **интерпретатора** или **компилатора** ни. Досега пускахме нашите програми по една на ред в Python интерпретатора. Ще са ни необходими малко повече редове от код за следващите няколко задачи, затова бързо ще направим това:

- Излезем от Python интерпретатора
- Отворим редактор за текс по избор
- Запазим малко код в нов python файл
- Run it!

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

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. This is called "syntax highlighting", and it's a really useful feature when coding. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). This is one of the reasons we use a code editor. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

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

### What if a condition isn't True?

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

### Summary

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## Your own functions!

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

## Loops

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

## Summary

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)