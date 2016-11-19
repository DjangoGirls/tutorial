# Python 简介

> 本章的部分内容基于 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots) 的教程。

让我们现在就开始写代码 ！

## Python 提示符

要玩转 Python，首先需要打开您的计算机上的 *命令行* 。 这一点，你应该已经掌握了——你在 [命令行入门][1]这一章已经学习过。

 [1]: ../intro_to_command_line/README.md

如果你准备好了，那么请按照以下说明进行操作。

在 Windows 下输入 `python` 或在 Mac OS/Linux 上输入`python3` 并敲下 `回车键`。.

    $ python3
    Python 3.4.3 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 第一条 Python 命令 ！

完成运行 Python 命令后，提示符变为 `>>>`。 这就意味着，现在我们只能使用符合 Python 语法的命令。 你不必键入 `>>>` —— Python会为你做的。

如果你想在任何时候退出 Python 控制台，只需要键入 `exit()` 或者在 Windows 下使用快捷键 `Ctrl+Z` ，在 Mac/Linux 下使用 `Ctrl+D` 快捷键。 这时候你就不会再看到 `>>>`。

但是现在，我们不需要退出 Python 控制台。 我们往下要继续了解 Python 。 让我们从最简单的开始。 例如，试着输入一些数学运算，如 `2 + 3` 并敲下 `回车`.

    >>> 2 + 3
    5
    

好的！看到答案是如何显示出来的吗？ Python 懂数学！你可以试试其他命令： - `4 * 5` - `5 - 1` - `40 / 2`

好好的玩一会儿，然后回到这里 :)。

正如你所看到的，Python 是一个不错的计算器。如果你想知道你还能用它做什么……

## 字符串

比试试你的名字？把你的名字用引号括起来，就像这样：

    >>> "Ola"
    'Ola'
    

现在你创建了第一个字符串！ 字符串是一个可以由计算机处理的字符序列。 该字符串的开始和结束位置必须用同一个字符标志。 可以由单引号（`'`） 或双引号（`"`）来 包裹（两者是没有区别的！），让 Python 知道，这中间是一个字符串。

字符串可以用加号连接在一起。像这样：

    >>> "Hi there " + "Ola"
    'Hi there Ola'
    

你也可以将字符串与数字相乘：

    >>> "Ola" * 3
    'OlaOlaOla'
    

如果你的字符串中需要表示一个单引号，你有两种方法：

用双引号来包裹字符串：

    >>> "Runnin' down the hill"
    "Runnin' down the hill"
    

或者使用反斜杠（``）来转义单引号

    >>> 'Runnin\' down the hill'
    "Runnin' down the hill"
    

表现得不错，是吧？如果想把字符串变成大写，只需要输入：

    >>> "Ola".upper()
    'OLA'
    

你刚刚在你的字符串上使用了 `upper` **函数**！ 像 （`upper()`）这样的函数是告诉Python运行某个给定对象如（`"Ola"`）上的一些列指令。

如果你想获取你名字里字母的个数，这里也有一个函数！

    >>> len("Ola")
    3
    

不知道为什么有时候你调用函数会在字符串尾部是用`.`（就像`"Ola".upper()`）而有时候你会在一开始就调用函数，然后将字符串置于括号中吗？ 好吧，在某些情况下，函数属于对象，就像 `upper()`，它只可以被应用于字符串上。 在这种情况下，我们将此函数称为**方法（method）**。 其他时候，函数不隶属于任何一个特定的对象，可以用在不同类型的对象上，例如 `len()` 。 这就是为什么我们使用`"Ola"`作为`len`函数的一个参数。

### 摘要

好的，关于字符串就学到这里。现在你已经学习到了以下这些内容：

*   **提示符**-键入命令行（代码）到 Python 提示符中，将在 Python 中得到回答。
*   **数字和字符串**-在 Python 里数字用于数学运算，而字符串被用作文本对象。
*   **运算符** - 例如 + 和 *, 将对赋值进行结合，并产生新的值。
*   **函数**-例如 upper() 和 len() ，对对象执行操作。

这些都是学习每种编程语言中最基本的东西。想学点更难的东东了吗？我们敢打赌你想！

## 错误

让我们试试一些新东西，我们能够像得到名称长度一样的方式来得到一个数字的长度吗？输入 `len(304023)` 然后敲下 `回车键`：

    >>> len(304023)
    Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
    TypeError: object of type 'int' has no len()
    

我们得到了第一个错误！它说"int"（整数）的对象类型没有长度。所以我们现在该做什么呢？或许我们能够把我们的数字写成字符串？字符串有长度，对吗？

    >>> len(str(304023))
    6
    

它成功了！我们将 `str` 函数插入到 `len` 函数内。`str` 将所有东西转换成字符串。

*   `str` 函数将对象转换成**字符串**
*   `int` 函数将对象转换为**整数**

> 重要提示：我们能够将所有的数字都转换成文本，但我们不能将所有的文本转换成数字，否则 `int("hello")` 究竟是什么意思？

## 变量

变量是编程中的一个重要概念。 变量只不过是一个待会儿你可以使用的一个东西的名称。 程序员是用这些变量去存储数据，让他们的代码变得更具可读性，所以他们不需要一直记住东西是什么。

假设我们想创建一个新变量，叫做 `name` ：

    >>> name = "Ola"
    

你看到了吗？这很容易！原因很简单：名字等于Ola。

正如你所注意到的，你的程序不会像以前那样返回任何东西。那么我们怎么知道这个变量确实存在？简单键入 `name` 然后按下`回车`。

    >>> name
    'Ola'
    

耶！你的第一个变量:)！你随时可以改变它指代的内容：

    >>> name = "Sonja"
    >>> name
    'Sonja'
    

你还可以这样使用函数：

    >>> len(name)
    5
    

太棒了，对吗？当然，变量可以是任何东西，比如数字！试试这个：

    >>> a = 4
    >>> b = 6
    >>> a * b
    24
    

但是如果我们使用了错误的名字？你能猜出来会发生什么吗？试试吧！

    >>> city = "Tokyo"
    >>> ctiy
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'ctiy' is not defined
    

一个错误！ 正如你所见，Python有不同种类的错误，这一种称作**NameError**。 Python将会在你尝试使用未定义的变量时产生这种错误。 如果你以后再次遇到这种错误，检查你的代码，看看你是不是错误输入了任何名称。

玩一会儿，然后看看你能做什么！

## 打印功能

试试这个：

    >>> name = 'Maria'
    >>> name
    'Maria'
    >>> print(name)
    Maria
    

当你键入 `name`，Python 解释器会打印变量'name'*表示*的字符串，单引号包裹的：'Maria'。 当你调用 `print(name)` 的时候，Python 将会“打印”内容到屏幕上，没有引号，更加整洁。

我们稍后会看到的，当我们想打印一些东西，或者想打印一些多行的东西，`print()` 是一个对我们很有用的函数。

## 列表

除了字符串和整数，Python提供了各种不同类型的对象。 现在我们要介绍一个叫做**列表**的东西。 列表和你想的一样：一个容纳着其他对象的列表对象: )

继续，创建一个列表：

    >>> []
    []
    

是的，这个列表是空的。并不是十分有用，对吗？让我们创建一个彩票号码的列表。我们不想总是重复我们的工作，所以我们也将它置于一个变量中：

    >>> lottery = [3, 42, 12, 19, 30, 59]
    

好吧，我们有了一个列表！我们能为它做什么呢？让我们看一看在列表中有多少个彩票数字。你知道什么方法什么函数你可以使用的吗？你已经知道了！

    >>> len(lottery)
    6
    

是的！`len()`可以给你列表中对象的个数。很方便，对吗？也许我们可以将它排序：

    >>> lottery.sort()
    

这不会返回任何东西，它仅仅改变了数字出现在列表里的顺序。让我们再一次把它打印出来，看看发生了什么：

    >>> print(lottery)
    [3, 12, 19, 30, 42, 59]
    

正如你所看到的，你的列表里的数字现在从最小到最大排序。祝贺！

也许我们想要将顺序倒序呢？让我们开始做吧！

    >>> lottery.reverse()
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3]
    

很简单，对吧？如果你想给你的列表里加入些东西，你可以通过简入以下命令：

    >>> lottery.append(199)
    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    

如果你只想要显示第一个数字，你可以通过使用**索引**完成。 索引就是列表中出现一个项的位置。 程序员一般习惯从0开始计数，所以列表中的第一个对象的索引是0，下一个是1，依此类推。 试试这个：

    >>> print(lottery[0])
    59
    >>> print(lottery[1])
    42
    

正如你所见，你可以通过使用列表名和置于方括号中的对象索引来访问列表中的不同元素。

如果需要从列表中删除元素，需要使用 **索引** 和上面学到的 `pop()` 语句来完成。 我们看个例子，删除列表中的第一个数字，以加强我们之前学到的知识。

    >>> print(lottery)
    [59, 42, 30, 19, 12, 3, 199]
    >>> print(lottery[0])
    59
    >>> lottery.pop(0)
    >>> print(lottery)
    [42, 30, 19, 12, 3, 199]
    

干得漂亮！

出于额外的乐趣，试试其他的索引：6，7，1000，-1，-6或者-1000。看看你是否能预测出命令尝试的结果。这些结果有意义吗？

你可以找到本章中所有关于列表的方法的Python文档：https://docs.python.org/3/tutorial/datastructures.html

## 字典

字典类似与列表，但是你通过查找键来获取值，而不是通过访问索引。一个键可以是任何字符串或者数字。定义一个空字典的语法是：

    >>> {}
    {}
    

这表明你刚创建了一个空字典。加油！

现在，试着写下下面的命令（试着也替换你自己的信息）：

    >>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
    

通过这个命令，你刚创建了一个名为`participant`的变量，有三个键值对：

*   键 `name` 指向 `'Ola'` (一个`字符串` 对象),
*   `country` 指向`'Poland'` (另一个 `字符串`),
*   和`favorite_numbers` 指向`[7, 42, 92]` (一个有三个数字的 `列表` ).

你可以通过下面的语法检查每个键的内容：

    >>> print(participant['name'])
    Ola
    

看，这就和列表很相似了。但是你不需要记住索引-仅仅需要记住名字。

如果我们问Python一个不存在的键呢？能猜到吗？让我们试一试，看看！

    >>> participant['age']
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    KeyError: 'age'
    

看，另一个错误！这是一个 **KeyError** 。Python 会告诉你键`'age'`并不存在于这个字典里。

那么什么时候使用字典或者列表呢？好吧，这是一个值得思考的点。在查看下一行答案前先在脑子里面设想一个答案。

*   你需要一个有序的元素排列吗？使用列表。
*   你需要将键值相关联，这样你可以在后面更有效的查找他们？使用字典。

字典，就像列表，是*可变的*，意味着他们在创建之后可以被改变。你可以在字典被创建之后，增加新的键/值对，就像：

    >>> participant['favorite_language'] = 'Python'
    

像列表，使用`len()`方法，返回字典中键值对数目。继续输入命令：

    >>> len(participant)
    4
    

我希望你能觉得到目前为止这些都合情合理。:)准备享受更多字典的乐趣吗？跳到下一行去做一些更有趣的事情。

你可以使用`del`命令去删除字典里的元素。 比如，如果你想删除键`'favorite_numbers'`所对应的项，只需要键入如下命令：

    >>> participant.pop('favorite_numbers')
    >>> participant
    {'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
    

正如你从输出中看到的，键值对所对应的'favorite_numbers'键已经被删除了。

此外，你还可以改变字典中已经存在的键所对应的值。键入：

    >>> participant['country'] = 'Germany'
    >>> participant
    {'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
    

正如你所见，键`'country'`的值已经从`'Poland'`变为了`'Germany'`。:)兴奋吗？哈哈！你刚又学了另一个有趣的东西。

### 摘要

太棒了！你现在知道很多关于编程的东西了。在最后的部分你学习了：

*   **errors** - 你知道如何读并理解错误，如果Python不能理解你所给它的命令。
*   **variables** - 对象名称让你代码变得更简单更可读的
*   **lists** - 按照特定序列排序的存储着对象的列表
*   **dictionaries** - 存储着键值对的对象

为接下来的部分感到兴奋吗？：）

## 比较事物

编程里经常会比较事物。什么是最容易比较的东西呢？当然是数字。让我们来看一看它是怎么工作的：

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
    

我们给 Python 一些数字去比较。正如你所见的，Python 不仅可以比较数字，也可以比较函数的返回值。不错，是的吧？

你知道为什么我们在判断相等时要把两个等号 `==` 放在一起吗？ 我们使用一个等于符号 `=` 来给变量赋值。 你总是 **总是** 需要把两个 `==` 放在一起，如果你希望去检查两个东西是不是相同。 如果我们认为两个东西是不相等的。 我们使用符号 `! =`，如上面的示例中所示。

给Python两个更多的任务：

    >>> 6 >= 12 / 2
    True
    >>> 3 <= 2
    False
    

`>` 和 `<` 很简单, 但 `>=` and `<=` 表示什么啊? 阅读下面的说明：

*   x `>` y 表示: x 大于 y
*   x `<` y 表示：x 小于 y
*   x `< =` y 表示： x 小于或等于 y
*   x `>=` y 表示：x 大于或等于 y

棒极了！想要做一次吗？试试这个：

    >>> 6 > 2 and 2 < 3
    True
    >>> 3 > 2 and 2 < 1
    False
    >>> 3 > 2 or 2 < 1
    True
    

你可以给 Python 任意多的数字来比较，他会给你想要的答案！非常智能，对吗？

*   **and** -如果你使用 `and` 运算符，两个比较值都需要为真（True），这样整个命令才能为真
*   **or** - 如果你想使用 `or` 运算符，只要有一个比较值是真，那么整个命令就为真

你听说过“驴唇不对马嘴”这种说法吗？让我们试试它的 Python 版：

    >>> 1 > 'django'
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    TypeError: unorderable types: int() > str()
    

在这里你看到就像在这表达式中，Python 是不能比较数字 （`int`） 和字符串 （`str`）。 相反，它显示一个 **TypeError**，并告诉我们两个类型不能相互比较。

## 布尔逻辑

顺带提一句，你刚刚学习了一个 Python 新的类型。它被叫做**布尔**——而且这可能是最简单的类型。

只有两个布尔类型对象: - True - False

但是为了 Python 能够理解，你需要写成 True（第一个字母大写，其他字母小写）。 **true, TRUE, tTUE都不会正常工作 —— 只有 True 是正确的**（同样适用于False）

布尔也可以是变量！看这里：

    >>> a = True
    >>> a
    True
    

或者通过这种方式：

    >>> a = 2 > 5
    >>> a
    False
    

练习有趣的布尔值，然后尝试下面的命令：

*   `True and True`
*   `False and True`
*   `True or 1 == 1`
*   `1 != 2`

祝贺你！布尔值是编程中最酷的功能，你刚刚学会了如何使用它们！

# 保存它！

到目前为止，我们所写的所有 Python 代码都是在命令行中，这限制了我们每次只能写一行代码。 正常的程序是被保存在文件里，并通过对应程序语言的**解释器**或者**编译器**处理后执行。 目前为止，我们已经试过在 Python **解释器**中一行一行的运行我们的程序。 我们接下来的几个任务需要不止一行代码，所以我们很快就会需要：

*   退出 Python 解释器
*   打开我们选择的代码编辑器
*   将一些代码保存到一个新的 python 文件
*   运行它！

为了退出我们一直使用的 Python 解释器，只需要键入 exit() 函数：

    >>> exit()
    $
    

这将让你返回到命令提示符。

早些时候，我们在[代码编辑器][2]章节选择了一个代码编辑器。我们现在需要打开一个编辑器，然后写一些代码进入新文件：

 [2]: code_editor/README. md

    python
    print('Hello, Django girls!')
    

> **注意**你应该注意到代码编辑器最酷的事情之一: 颜色! 在 Python 控制台中，一切都是相同的颜色，现在你应该看到 `打印` 函数和字符串的颜色不同。 这就所谓的"语法高亮"，在编写代码时是非常有用的功能。 颜色会给你提示，如未闭合的字符串或关键字名称拼写错误 （如函数中的 `def` 关键字，我们会在下面看到） 。 这是我们使用代码编辑器的原因之一:)

显然，你现在是一个相当熟练的python开发者，所以随便写一些你今天学到的代码吧。

现在我们需要保存文件，然后给它一个描述性的名字。 让我们命名这个文件 **python_intro.py** 然后保存它到您的桌面。 我们可以随意给文件起名字，但是要确保 **.py** 在文件名结尾。 **.py** 扩展名告诉操作系统，这是一个 **python可执行文件**，Python 可以运行它。

文件保存之后，就到了可以运行它的时候了！使用你在命令行章节学习到的技能，在终端**改变目录**到桌面。

在 Mac 上命令会看起来像这样：

    $ cd /Users/<your_name>/Desktop
    

在Linux，它会看起来像这样（“桌面”可能会被翻译成您所在的语言）：

    $ cd /home/<your_name>/Desktop
    

并在 windows 上，它会看起来像这样：

    > cd C:\Users\<your_name>\Desktop
    

如果你遇到麻烦了，尽管提问寻求帮助。

现在文件中输入这样的代码并使用 Python 执行：

    $ python3 python_intro.py
    Hello, Django girls!
    

好吧！你刚刚运行了你保存在文件中的第一个 python 程序。感觉棒极了吗？

你可以继续去学习编程中一些重要的工具：

## If...elif...else

很多代码只会在提供的条件被满足的时候运行。这就是为什么Python有**if 语句**.

用以下代码替换 **python_intro.py** 中的内容：

    python
    if 3 > 2:
    

如果我们保存这个，然后运行它，我们会看到一个类似这样的错误：

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

当条件 `3 > 2` 为真（或者 `True` ），Python 希望我们给它进一步的指示。 我们试着让 Python 打印 “it works!”。 更改您在 **python_intro.py** 文件中的代码变为这样：

    if 3 > 2:
        print('It works!')
    

注意我们已经为下一行缩进了4个空格了吗？ 这样做是为了让 Python 知道如果条件正确它将运行什么代码。 你可以使用一个空格，但是几乎所有的 Python 程序员都是用4个，使事情看上去很整洁。 单个 `tab` 也将算作 4 个空格。

保存它，然后再次运行它：

    $ python3 python_intro.py
    It works!
    

### 如果条件不为真呢？

在之前的例子里，代码只会在条件被满足的时候被运行。但是 Python 同样有 `elif` 和 `else` 语句：

    if 5 > 2:
        print('5 is indeed greater than 2')
    else:
        print('5 is not greater than 2')
    

这段代码在运行后会打印：

    $ python3 python_intro.py
    5 is indeed greater than 2
    

如果2是比5大，那么第二个命令会被执行。简单，对吧？在我们看看 `elif` 是怎么工作的：

    name = 'Sonja'
    if name == 'Ola':
        print('Hey Ola!')
    elif name == 'Sonja':
        print('Hey Sonja!')
    else:
        print('Hey anonymous!')
    

然后运行：

    $ python3 python_intro.py
    Hey Sonja!
    

看到发生什么了吗？如果前面的条件失败了，`elif` 允许你添加额外条件来判断接下来该怎么运行。

在 `if` 语句之后，你可以添加任意多的 `elif` 语句。例如：

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
        print("My ears are hurting!")  
    

Python 遍历判断每个测试的条件，并打印：

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

### 摘要

在刚才的三个练习，你已经学习到了：

*   **比较事物** - 在Python里你可以比较东西通过使用`>`, `>=`, `==`, `<=`, `<` 和`and`, `or` 运算符。
*   **Boolean** - 一个只能有两个值中的一个的对象: `True` 或者 `False`
*   **保存文件** - 保存代码到文件里，这样你可以执行更大的程序。
*   **if...elif...else** -让你只执行当某个条件满足后的代码。

现在是本章的最后一个部分了！ 

## 你自己的函数！

还记得你在Python里运行的函数`len()`？好消息，你会学习如何编写自己的函数了！

一个函数就是一些 Python 应该运行的指令集。 每个Python函数都是以关键词 `def` 开始的，我们可以给定一个名字并能指定若干个参数。 让我们从一个简单的开始。 使用下面的替换**python_intro.py**中的代码：

    def hi():
        print('Hi there!')
        print('How are you?')
    
    hi()
    

好吧，我们的第一个函数已经准备好了！

你可以想知道为什么我们把函数的名称写在文件的底部。 这是因为Python读了文件，然后自顶向下的执行它。 所以为了使用我们的函数，我们必须要在底部重写它。

现在让我们运行这个，看看会发生什么：

    $ python3 python_intro.py
    Hi there!
    How are you?
    

那很简单！让我们建立我们第一个有参数的函数。我们使用前面的例子-一个函数打印“hi to the person running it”

    def hi(name):
    

正如你所见的，我们给我们的函数一个叫`name`的参数：

    def hi(name):
        if name == 'Ola':
            print('Hi Ola!')
        elif name == 'Sonja':
            print('Hi Sonja!')
        else:
            print('Hi anonymous!')
    
    hi()
    

记住： `print` 函数是在 `if` 语句的缩进内的。这是因为我们要在仅满足条件时，才运行函数。让我们看看它是如何工作：

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

哦！一个错误。 幸运的是，Python给我们一个有用的错误提示信息。 告诉我们函数 `hi()`（这是我们定义的）必须有一个参数（称之为`name`），我们调用函数的时候忘记传递它了。 让我们在文件的底部解决它：

    hi("Ola")
    

然后再次运行它：

    $ python3 python_intro.py
    Hi Ola!
    

那如果我们改变名字了呢？

    hi("Sonja")
    

然后运行它：

    $ python3 python_intro.py
    Hi Sonja!
    

现在，如果我们写了另一个名字会发生什么？（不是 Ola 或者 Sonja ）试试看是不是和你想的是一样的。它应该打印成这样：

    Hi anonymous!
    

这太棒了，对吗？ 这样我们不用在每次调用此方法跟不同的人打招呼的时候重复自己。 而这正是我们为什么需要（定义）函数 - 你永远不想重复你的代码！

让我们做一些更智能的事情——如果有超过两个或者更多的名字，我们需要为每个都写一个判断，会比较难，对不对？

    def hi(name):
        print('Hi ' + name + '!')
    
    hi("Rachel")
    

现在让我们调用代码：

    $ python3 python_intro.py
    Hi Rachel!
    

祝贺你！你刚刚学习了如何写函数！:)

## 循环

这是最后一部分。这真快，对吗？:)

程序员不喜欢重复劳动。编程的核心是自动化，所以我们不希望手动的一行一行去调用打招呼函数，是吧？这时候循环就能派上用场了。

还记得列表吗？让我们做一个女孩的列表：

    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    

我们想要根据他们所有人的名字依次打招呼。我们有一个 `hi` 函数去实现这个，所以让我们在一个循环中使用它：

    for name in girls:
    

for 语句的声明和 if 语句声明类似，下面代码需要缩进。

这是文件中完整的代码：

    def hi(name):
        print('Hi ' + name + '!')
    
    girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
    for name in girls:
        hi(name)
        print('Next girl')
    

然后当我们去运行它：

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
    

正如你所看见的，所有你放在 `for` 中的语句都将会根据列表 `girls` 中的每个元素而重复执行。.

你同样可以使用 `for` 来遍历使用 `range` 函数生成的数字：

    for i in range(1, 6):
        print(i)
    

这将会打印：

    1
    2
    3
    4
    5
    

`range` 函数产生一个列表的数字，一个挨着一个（这些数字是由您提供的参数而产生的）。

请注意第二个参数将不会被包括在Python输出列表中（意味着`range(1,6)`从1到5计数，但是不包括数字6）。 这是因为"范围"是半开区间，意思是包含第一个值，但不包括最后一个。

## 摘要

就是这样，**你太厉害啦！** 这是一个棘手的章节，所以你应该为自己感到骄傲。我们为你取得这么多进展而感到骄傲！

你可以简单做点其他事情—— 伸个懒腰，走动一会儿，放松下你的眼睛，再接着往下一章。:)

![纸杯蛋糕][3]

 [3]: images/cupcake.png
