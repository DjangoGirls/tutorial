# Python 简介

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

让我们现在就开始写代码 ！

## Python 提示符

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

要玩转 Python，首先需要打开您的计算机上的 *命令行* 。 You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

如果你准备好了，那么请按照以下说明进行操作。

在 Windows 下输入 `python` 或在 Mac OS/Linux 上输入`python3` 并敲下 `回车键`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 第一条 Python 命令 ！

完成运行 Python 命令后，提示符变为 `>>>`。 这就意味着，现在我们只能使用符合 Python 语法的命令。 You don't have to type in `>>>` – Python will do that for you.

如果你想在任何时候退出 Python 控制台，只需要键入 `exit()` 或者在 Windows 下使用快捷键 `Ctrl+Z` ，在 Mac/Linux 下使用 `Ctrl+D` 快捷键。 这时候你就不会再看到 `>>>`。

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

好好的玩一会儿，然后回到这里. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## 字符串

比试试你的名字？把你的名字用引号括起来，就像这样：

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

现在你创建了第一个字符串！ 字符串是一个可以由计算机处理的字符序列。 该字符串的开始和结束位置必须用同一个字符标志。 可以由单引号（`'`） 或双引号（`"`）来 包裹（两者是没有区别的！），让 Python 知道，这中间是一个字符串。

字符串可以用加号连接在一起。像这样：

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

你也可以将字符串与数字相乘：

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

如果你的字符串中需要表示一个单引号，你有两种方法：

用双引号来包裹字符串：

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

或者使用反斜杠（``）来转义单引号

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

表现得不错，是吧？如果想把字符串变成大写，只需要输入：

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

不知道为什么有时候你调用函数会在字符串尾部是用`.`（就像`"Ola".upper()`）而有时候你会在一开始就调用函数，然后将字符串置于括号中吗？ 好吧，在某些情况下，函数属于对象，就像 `upper()`，它只可以被应用于字符串上。 在这种情况下，我们将此函数称为**方法（method）**。 其他时候，函数不隶属于任何一个特定的对象，可以用在不同类型的对象上，例如 `len()` 。 这就是为什么我们使用`"Ola"`作为`len`函数的一个参数。

### 摘要

好的，关于字符串就学到这里。现在你已经学习到了以下这些内容：

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

这些都是学习每种编程语言中最基本的东西。想学点更难的东东了吗？我们敢打赌你想！

## 错误

让我们试试一些新东西，我们能够像得到名称长度一样的方式来得到一个数字的长度吗？输入 `len(304023)` 然后敲下 `回车键`：

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

我们得到了第一个错误！它说"int"（整数）的对象类型没有长度。所以我们现在该做什么呢？或许我们能够把我们的数字写成字符串？字符串有长度，对吗？

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

它成功了！我们将 `str` 函数插入到 `len` 函数内。`str` 将所有东西转换成字符串。

- `str` 函数将对象转换成**字符串**
- `int` 函数将对象转换为**整数**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## 变量

变量是编程中的一个重要概念。 变量只不过是一个待会儿你可以使用的一个东西的名称。 程序员是用这些变量去存储数据，让他们的代码变得更具可读性，所以他们不需要一直记住东西是什么。

假设我们想创建一个新变量，叫做 `name` ：

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

正如你所注意到的，你的程序不会像以前那样返回任何东西。那么我们怎么知道这个变量确实存在？简单键入 `name` 然后按下`回车`。

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

你还可以这样使用函数：

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

但是如果我们使用了错误的名字？你能猜出来会发生什么吗？试试吧！

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

一个错误！ 正如你所见，Python有不同种类的错误，这一种称作**NameError**。 Python将会在你尝试使用未定义的变量时产生这种错误。 如果你以后再次遇到这种错误，检查你的代码，看看你是不是错误输入了任何名称。

玩一会儿，然后看看你能做什么！

## 打印功能

试试这个：

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

当你键入 `name`，Python 解释器会打印变量'name'*表示*的字符串，单引号包裹的：'Maria'。 当你调用 `print(name)` 的时候，Python 将会“打印”内容到屏幕上，没有引号，更加整洁。

我们稍后会看到的，当我们想打印一些东西，或者想打印一些多行的东西，`print()` 是一个对我们很有用的函数。

## 列表

除了字符串和整数，Python提供了各种不同类型的对象。 现在我们要介绍一个叫做**列表**的东西。 列表和你想的一样：一个容纳着其他对象的列表对象. :)

继续，创建一个列表：

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

是的，这个列表是空的。并不是十分有用，对吗？让我们创建一个彩票号码的列表。我们不想总是重复我们的工作，所以我们也将它置于一个变量中：

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

好吧，我们有了一个列表！我们能为它做什么呢？让我们看一看在列表中有多少个彩票数字。你知道什么方法什么函数你可以使用的吗？你已经知道了！

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

是的！`len()`可以给你列表中对象的个数。很方便，对吗？也许我们可以将它排序：

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

这不会返回任何东西，它仅仅改变了数字出现在列表里的顺序。让我们再一次把它打印出来，看看发生了什么：

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

正如你所看到的，你的列表里的数字现在从最小到最大排序。祝贺！

也许我们想要将顺序倒序呢？让我们开始做吧！

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

如果你只想要显示第一个数字，你可以通过使用**索引**完成。 索引就是列表中出现一个项的位置。 程序员一般习惯从0开始计数，所以列表中的第一个对象的索引是0，下一个是1，依此类推。 试试这个：

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

正如你所见，你可以通过使用列表名和置于方括号中的对象索引来访问列表中的不同元素。

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

干得漂亮！

出于额外的乐趣，试试其他的索引：6，7，1000，-1，-6或者-1000。看看你是否能预测出命令尝试的结果。这些结果有意义吗？

你可以找到本章中所有关于列表的方法的Python文档：https://docs.python.org/3/tutorial/datastructures.html

## 字典

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

这表明你刚创建了一个空字典。加油！

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- 键 `name` 指向 `'Ola'` (一个`字符串` 对象),
- `country` 指向`'Poland'` (另一个 `字符串`),
- 和`favorite_numbers` 指向`[7, 42, 92]` (一个有三个数字的 `列表` ).

你可以通过下面的语法检查每个键的内容：

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

如果我们问Python一个不存在的键呢？能猜到吗？让我们试一试，看看！

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

看，另一个错误！这是一个 **KeyError** 。Python 会告诉你键`'age'`并不存在于这个字典里。

那么什么时候使用字典或者列表呢？好吧，这是一个值得思考的点。在查看下一行答案前先在脑子里面设想一个答案。

- 你需要一个有序的元素排列吗？使用列表。
- 你需要将键值相关联，这样你可以在后面更有效的查找他们？使用字典。

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

You can use the `pop()` method to delete an item in the dictionary. 比如，如果你想删除键`'favorite_numbers'`所对应的项，只需要键入如下命令：

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

### 摘要

太棒了！你现在知道很多关于编程的东西了。在最后的部分你学习了：

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

为接下来的部分感到兴奋吗？：）

## 比较事物

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

你知道为什么我们在判断相等时要把两个等号 `==` 放在一起吗？ 我们使用一个等于符号 `=` 来给变量赋值。 You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. 如果我们认为两个东西是不相等的。 我们使用符号 `! =`，如上面的示例中所示。

给Python两个更多的任务：

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y 表示: x 大于 y
- x `<` y 表示：x 小于 y
- x `< =` y 表示： x 小于或等于 y
- x `>=` y 表示：x 大于或等于 y

棒极了！想要做一次吗？试试这个：

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

你可以给 Python 任意多的数字来比较，他会给你想要的答案！非常智能，对吗？

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

你听说过“驴唇不对马嘴”这种说法吗？让我们试试它的 Python 版：

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

在这里你看到就像在这表达式中，Python 是不能比较数字 （`int`） 和字符串 （`str`）。 相反，它显示一个 **TypeError**，并告诉我们两个类型不能相互比较。

## 布尔逻辑

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

布尔也可以是变量！看这里：

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

或者通过这种方式：

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

练习有趣的布尔值，然后尝试下面的命令：

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

祝贺你！布尔值是编程中最酷的功能，你刚刚学会了如何使用它们！

# 保存它！

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

到目前为止，我们所写的所有 Python 代码都是在命令行中，这限制了我们每次只能写一行代码。 正常的程序是被保存在文件里，并通过对应程序语言的**解释器**或者**编译器**处理后执行。 目前为止，我们已经试过在 Python **解释器**中一行一行的运行我们的程序。 我们接下来的几个任务需要不止一行代码，所以我们很快就会需要：

- 退出 Python 解释器
- 打开我们选择的代码编辑器
- 将一些代码保存到一个新的 python 文件
- 运行它！

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

这将让你返回到命令提示符。

早些时候，我们选择了一个代码编辑器在[代码编辑器](../code_editor/README.md)章节。我们现在需要打开一个编辑器，然后写一些代码进入新文件：

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

显然，你现在是一个相当熟练的python开发者，所以随便写一些你今天学到的代码吧。

现在我们需要保存文件，然后给它一个描述性的名字。 让我们命名这个文件 **python_intro.py** 然后保存它到您的桌面。 我们可以随意给文件起名字，但是要确保 **.py** 在文件名结尾。 The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. 这就所谓的"语法高亮"，在编写代码时是非常有用的功能。 The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). 这是我们使用代码编辑器的原因之一. :)

文件保存之后，就到了可以运行它的时候了！使用你在命令行章节学习到的技能，在终端**改变目录**到桌面。

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

在 Mac 上命令会看起来像这样：

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

如果你遇到麻烦了，尽管提问寻求帮助。

现在文件中输入这样的代码并使用 Python 执行：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

好吧！你刚刚运行了你保存在文件中的第一个 python 程序。感觉棒极了吗？

你可以继续去学习编程中一些重要的工具：

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

用以下代码替换 **python_intro.py** 中的内容：

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
    

当条件 `3 > 2` 为真（或者 `True` ），Python 希望我们给它进一步的指示。 我们试着让 Python 打印 “it works!”。 更改您在 **python_intro.py** 文件中的代码变为这样：

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

注意我们已经为下一行缩进了4个空格了吗？ 这样做是为了让 Python 知道如果条件正确它将运行什么代码。 你可以使用一个空格，但是几乎所有的 Python 程序员都是用4个，使事情看上去很整洁。 单个 `tab` 也将算作 4 个空格。

保存它，然后再次运行它：

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### 如果条件不为真呢？

在之前的例子里，代码只会在条件被满足的时候被运行。但是 Python 同样有 `elif` 和 `else` 语句：

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

这段代码在运行后会打印：

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

然后运行：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

看到发生什么了吗？如果前面的条件失败了，`elif` 允许你添加额外条件来判断接下来该怎么运行。

在 `if` 语句之后，你可以添加任意多的 `elif` 语句。例如：

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

Python 遍历判断每个测试的条件，并打印：

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

### 摘要

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

现在是本章的最后一个部分了！ 

## 你自己的函数！

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

一个函数就是一些 Python 应该运行的指令集。 每个Python函数都是以关键词 `def` 开始的，我们可以给定一个名字并能指定若干个参数。 Let's give it a go. 使用下面的替换**python_intro.py**中的代码：

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

好吧，我们的第一个函数已经准备好了！

你可以想知道为什么我们把函数的名称写在文件的底部。 这是因为Python读了文件，然后自顶向下的执行它。 所以为了使用我们的函数，我们必须要在底部重写它。

现在让我们运行这个，看看会发生什么：

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

正如你所见的，我们给我们的函数一个叫`name`的参数：

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

记住： `print` 函数是在 `if` 语句的缩进内的。这是因为我们要在仅满足条件时，才运行函数。让我们看看它是如何工作：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

哦！一个错误。 幸运的是，Python给我们一个有用的错误提示信息。 告诉我们函数 `hi()`（这是我们定义的）必须有一个参数（称之为`name`），我们调用函数的时候忘记传递它了。 让我们在文件的底部解决它：

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

然后再次运行它：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

那如果我们改变名字了呢？

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

然后运行它：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

这太棒了，对吗？ 这样我们不用在每次调用此方法跟不同的人打招呼的时候重复自己。 And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

现在让我们调用代码：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

祝贺你！你刚刚学习了如何写函数! :)

## 循环

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

这是最后一部分。这真快，对吗？:)

程序员不喜欢重复劳动。编程的核心是自动化，所以我们不希望手动的一行一行去调用打招呼函数，是吧？这时候循环就能派上用场了。

还记得列表吗？让我们做一个女孩的列表：

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

我们想要根据他们所有人的名字依次打招呼。我们有一个 `hi` 函数去实现这个，所以让我们在一个循环中使用它：

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

这是文件中完整的代码：

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

然后当我们去运行它：

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
    

正如你所看见的，所有你放在 `for` 中的语句都将会根据列表 `girls` 中的每个元素而重复执行.

你同样可以使用 `for` 来遍历使用 `range` 函数生成的数字：

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

这将会打印：

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` 函数产生一个列表的数字，一个挨着一个（这些数字是由您提供的参数而产生的）。

请注意第二个参数将不会被包括在Python输出列表中（意味着`range(1,6)`从1到5计数，但是不包括数字6）。 That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## 摘要

就是这样，**你太厉害啦！** 这是一个棘手的章节，所以你应该为自己感到骄傲。我们为你取得这么多进展而感到骄傲！

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)