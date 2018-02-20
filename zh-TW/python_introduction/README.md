# Python 簡介

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

讓我們寫一點程式碼吧！

## Python 提示字元

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

要開始玩 Python，我們需要打開您的電腦上的 *命令行*。 You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

一旦你準備好了，就跟著下面的說明操作吧。

我們想要開啟 Python 主控台，所以在 Windows 上輸入 `python` 或在 Mac OS/Linux 上輸入 `python3` 並按下 `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 你第一個的 Python 命令！

運行 Python 命令後，命令提示字元改為 `>>>`。 對我們來說這意味著現在我們只可以使用 Python 語言中的命令們。 You don't have to type in `>>>` – Python will do that for you.

如果你想要在任何時間退出 Python 主控台，只要鍵入 `exit()` ，或在 Windows 下使用快速鍵 `Ctrl + Z` ，或者在 Mac/Linux 環境下使用 `Ctrl + Z` 都可以退出主控台。 然後你就不會再看到 `>>>` 了。

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

好了，你可以試著自己玩會兒. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## 字串

那輸入你的名字呢？你可以像下面這樣試試看：

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

你現在已經創造了你的第一個字串！ 這是一個可以被電腦運用的字元集合。 字串通常會以一個同樣的字元來起頭和結束。 或許是一個單引號 (`'`) 或者雙引號 (`"`) (這兩者沒有差別！)，這會讓 Python 知道引號中的東西是一個字串。

字串們也可以被串在一起，試試看這招：

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

你也可以用一個數字來把字串乘起來：

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

還有，如果你想要放一個單引號在你的字串裡面，你有兩種方式可以達成這個目標。

使用雙引號來宣告字串：

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

或者，在想要加入的單引號前面給他一個反斜線 (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

不賴吧？去看看如何把你的名字全部換成大寫，簡單的輸入這個：

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

你應該很好奇，為什麼有時候你會在字串結尾用 `.` 來叫用一個函數（例如 `"Ola".upper()`），但有時你會先呼叫函數，然後把字串放在括號中？ 嗯，在某些狀況下，函數屬於某個物件，像是 `upper()` ，這個函數就只能表現在字串上。 在這個狀況下，我們可以稱呼這類型函數為 **方法(method)**。 其他時候，函數不屬於任何特定的類型或物件，可為各種不同類型或物件所用，像是 `len()`。 這是為什麼我們可以在 `len()` 這個函數中放入一個 `"Ola"` 字串作為參數。

### 彙總

好了，說夠了字串。目前為止你學到了：

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

你剛剛學到的是所有程式語言的基礎。準備好接受更多挑戰了嗎？來吧！

## 錯誤訊息

我們來試試新的東西。看看我們能不能使用找到我們名字長度的那個函數，來得到某個數字的長度呢？輸入 `len(304023)` 按下 `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

恭喜！我們得到了我們的第一個錯誤訊息！它抱怨說這個物件的類型是 "int" (integer, 整數) 所以根本沒有長度這件事。所以我們現在應該怎麼辦呢？或許我們可以把我們這個數字寫成一個字串看看如何？字串就有長度啦，對吧？

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

看起來成功了！我們 `len` 函數中使用了 `str` 函數。`str()` 可以任何物件轉成字串。

- `str` 函數可將物件轉為 **字串**
- `int` 函數可將物件轉為 **整數**

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## 變數

程式設計中有一個重要的觀念稱為變數 (variables)。 一個變數其實沒什麼，就是一個你稍後可以叫用的一個名字。 程序員使用這些變數去儲存資料，讓他們的程式碼有更高的可讀性，這樣他們就不必一直記得那些資料是什麼。

假設現在我們做了一個新的變數叫做 `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

如同你所注意到的，你的程式沒有回傳任何你宣告的東西。所以我們如何得知我們所宣告的變數確實存在呢？簡單的輸入 `name` 然後按下 `enter`:

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

你也可以在函數中使用它：

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

但是萬一我們叫錯變數了呢？你可以猜到會發生什麼事情嗎？讓我們試試看吧！

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

又是一個錯誤訊息！ 如同你所見，Python 有各式各樣的錯誤訊息，這個就叫做一個 **NameError**。 Python 會在你試圖使用一個從未宣告的變數時給你這個錯誤訊息。 如果你得到像這樣的錯誤，就回頭看看你的程式碼裡面是不是有什麼變數的名字是打錯的。

玩一會兒吧，看看你還能做什麼！

## Print 函數

試試這招：

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

當你只是輸入 `name`，Python 直譯器會馬上 *回應* 你變數「name」所代表的字串，就是個用單引號包起來的 M-a-r-i-a 字母們。 當你說 `print(name)` ，Python 就會在螢幕上「印出」這個變數的乾淨內容，沒有引號。

就像是我們稍後會看到的， 當我們想要印出某些東西時，或是想要印出一個有很多行的東西時，`print()` 就是個超有用的函數。

## 清單

除了字串和整數，Python 還有一堆不同形態的物件。 現在我們要介紹的稱為 **清單 (list)**。 清單就是你想的那樣：它是一個列出一堆物件的物件. :)

開始建立一個 List 吧：

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

對沒錯，這就是一個空的 List。看起來沒什麼用啊... 我們來建立一組包含樂透彩數字的 List 吧。我們不想每次都重覆輸入這個長的 List，所以我們就把它存進一個變數裡吧：

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

好了，我們有一個 List 了！我們可以拿它來幹嘛？來看看這個 List 的長度吧。你想到可以用什麼函數了嗎？沒錯就是它！

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

賓果！ `len()` 可以告訴你這個 List 有多長。真是太神奇了傑克！或許我們還可以幫這個 List 排序：

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

這不會回傳任何值，只是默默的的改變了 List 中數字們的順序。我們把它印出來看看發生了什麼事吧：

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

如你所見，這串 List 數字已經從小到大排序了。恭喜囉！

那如果我們想要反排序呢？試試看吧！

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

如果你只想要秀某一個數字，你可以使用 **索引 (index)** 來指定。 索引就是一個指出 List 某個物件位置的數字。 電腦宅們喜歡讓索引從 0 開始，所以你的 List 中的第一個物件的索引就是 0，下一個物件則是 1，以此類推。 試試這招：

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

如你所見，你可以呼叫 List 變數的名字並指定索引值，並將索引值放在中括號中，來取得 List 裡不同的物件。

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

帥吧！

更多好玩的是，請嘗試些其他的 index: 6，7，1000，-1，-6 或 -1000。看看是否你能嘗試在執行命令前預測結果。這些結果合理嗎？

你可以在這個 Python 文件章節中，找到所有支援 List 物件的方法：https://docs.python.org/3/tutorial/datastructures.html

## 字典

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

這樣就創建了一個空字典，喲齁！

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- Name 這個 `key` 對應到 `'Ola'` 這個 value (一個 `字串` 物件),
- `country` 對應到 `'Poland'` (另一個 `字串`),
- 還有 `favorite_numbers` 對應到 `[7, 42, 92]` (一個包含了三個數字在內的 `清單`)。

你可以指定獨特的 key 來檢查內容，語法如下：

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

如果你向 Python 要一個不存在的 key 所對應的 value 的話會發生什麼事呢？我們試試看吧！

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

看到了吧，又是一個錯誤訊息，這次是 **KeyError** 。Python 會讓你知道這個 `'age'` key 事實上是不存在目前的 dictionary 中的。

什麼時候要用 List，什麼時候又要用 Dictionary 呢？嗯，這個問題值得深思。再看看下面內容前先把這個問題放在心裡吧。

- 你是不是只是需要一個有序的序列呢？就使用 List 吧。
- 你需要有 key 值的 value，好讓你可以更有效率地 (使用 key) 找到特定值嗎？那就使用 Dictionary 吧。

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

You can use the `pop()` method to delete an item in the dictionary. 如果你說，想要刪掉一個叫做 `'favorite_numbers'` 的 key，就輸入下面指令：

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

### 彙總

太完美了！你現在了解更多程式設計的知識了。在上面你學到了：

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

人生要進階了，興奮嗎？ :)

## 比較事物

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

當我們想確認兩個數字是否同等時，為什麼我們把兩個等號 = `=` 放在一起嗎? 我們使用單個 `=` 用於將值分配給變數。 You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. 我們也可以說兩個事物東西彼此不相等。 為此，我們使用符號 `!=`，如上例所示。

給 Python 多兩個任務︰

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y 表示：x 大於 y
- x `<` y 表示：x 小於 y
- x `<=` y 表示：x 小於或等於 y
- x `>=` y 表示：x 大於或等於 y

真棒！想要做一次嗎？試試這個︰

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

你可以給 Python 任何數量你想要它比較的數字，它會給你答案！很聰明，對吧？

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

你聽過 ”比較蘋果和橘子” 說法嗎？讓我們試著 Python 等同詞︰

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

在這裡就像你在運算式中看到，Python 是不能比較一個數字 (`int`) 和一個字串 (`str`)。 相反地，它顯示 **TypeError**，並告訴我們不能這兩種類型不能相互比較。

## 布林值 (Boolean)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

布林值也可以是變數！看看這裡︰

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

你也可以這樣做︰

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

練習並由試著執行以下命令體會布林值的樂趣︰

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

恭喜！在程式設計中，布林值是最酷的功能之一，而且你剛剛學會了如何使用它們！

# 儲存它！(Save it!)

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

到目前為止，我們已經在解譯器上寫了我們所有的 python 程式碼，解譯器限制了我們一次只能輸入一行程式碼。 正常程式是儲存在檔中，並由我們的程式語言的**解譯器 (interpreter)** 或 **編譯器 (compiler)** 執行。 到目前為止，我們已經在 Python **解譯器**上一次執行一行我們的程式。 我們接下來的幾個任務將需要不止一行的程式碼，所以我們很快將需要︰

- 離開 Python 解譯器
- 打開我們選擇的程式碼編輯器
- 儲存一些程式碼到一個新的 python 檔
- 執行它！

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

這將讓你返回到命令列提示字元。

早些時候，我們在[程式碼編輯器](../code_editor/README.md) 章節中選擇了一個程式碼編輯器。現在我們將需要打開程式碼編輯器和寫一些程式碼到一個新的檔案︰

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

明顯地，你現在是一個經驗相當豐富的 Python 開發人員，所以便意編寫一些你今天已經學到了的程式碼。

現在，我們需要儲存這個檔案並給它一個描述性的名字。 讓我們稱這個檔案為 **python_intro.py** 並將它儲存到你的桌面。 我們可以給檔案取任何我們想要的名字，但重要的部分是要確保檔名以 **.py** 結尾。 The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. 這就所謂的 ”語法強調”，在編寫程式碼時是非常有用的功能。 The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). 這是我們使用程式碼編輯器中的的原因之一. :)

存檔後，現在可以執行它！用你已經在命令列章節學到的技能，使用終端機 **更改目錄** 到桌面。

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

在 Mac 上，命令列將看起來像這樣︰

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

如果你遇到困難，就尋求幫助。

現在使用 Python 執行檔案中的程式碼，像這樣︰

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

好！你剛好執行你的第一個被儲存到檔案的 Python 程式 。很棒的感覺吧？

你現在可以繼續程式設計的基本工具︰

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

將你 **python_intro.py** 檔中的程式碼替換成這︰

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
    

Python 期望我們能夠給進一步指示，假如條件 `3 > 2` 為真（或 `True` 就此而言）該執行什麼。 我們試著讓 Python 列印 ”成功了！”。 把你 **python_intro.py** 的程式碼改為這樣︰

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

注意為什麼我們在下一行程式碼內縮４個空白？ 我們需要這樣做，所以 Python 知道假如結果為真 (true) 該執行什麼程式碼。 你可以內縮１個空白，但幾乎所有的 Python 程式設計師都內縮４個空白，使程式碼看起來很整潔。 一個 `tab` 等同４個空白。

存檔並給再執行它︰

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### 什麼情況下一個條件式不是真的？

在前面的例子，程式碼只有當條件是真時才執行。但 Python 也有 `elif` 和 `else` 語法︰

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

當你執行它將顯示出︰

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

並執行：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

看看那裡發生了什麼？ 假如前面的條件式失敗的話，`elif` 讓你增加額外可執行的條件式。

在你的 `if` 後面，你可以增加任何你想要的 `elif` 語句。例如︰

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

Python 依序執行每個測試，並顯示︰

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

### 彙總

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

現在是這一章的最後一部分了！

## 你自己的函數！(Your own functions!)

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

函數是 Python 應該執行的一序列的指令。 在 Python 中每個函數都以關鍵字 `def` 開頭、給定一個名稱、並且可以有一些參數。 Let's give it a go. 將 **python_intro.py** 中的程式碼替換為以下內容︰

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

Okay，我們的第一個函數準備好了！

你可能想知道為什麼我們把函數的名稱寫在檔案的底部。 這是因為 Python 從頂部到底部讀取檔案並執行它。 所以為了使用我們的函數，我們必須重新把它寫在底部。

現在讓我們執行這個，看看會發生什麼︰

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

正如你所看到的，我們現在給我們的函數一個我們叫它 `name` 的參數︰

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

記住︰在 `if` 語句內的 `print` 向內的縮進四個空白。這是因為當滿足條件時函數才執行。現在讓我們看看它是如何運作：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

哎呀，一個錯誤。 幸運地，Python 給我們一個非常有用的錯誤訊息。 它告訴我們，函數 `hi()`（我們定義的那一個）必需有一個參數（名為 `name`），而且我們忘了把它傳遞函數當我們呼叫它時。 讓我們在檔的底部修復它︰

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

並再次執行它︰

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

而如果我們更改名字？

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

然後執行它︰

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

這太棒了，對吧？ 以這種方式，當你想要改變函數要問候的人名時，你自己不需要每次重複所有動作。 And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

現在讓我們呼叫程式碼︰

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

恭喜你！你剛剛學會了如何編寫函數！:)

## 迴圈 (Loops)

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

這已經是最後一部分，很快速，對吧？:)

程式設計師不喜歡重複。程式設計核心是自動化，所以我們不想人工地呼叫每個我們想問候的人，對吧？這是迴圈派上用場的地方。

還記得列表 (lists) 嗎？讓我們做一個 girls 列表︰

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

我們想要用他們的名字問候它們每一個人，我們有 `hi` 函數來完成這個，所以讓我們在一個迴圈中使用它︰

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

這是將會在檔中的完整程式碼︰

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

然後當我們執行它︰

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
    

正如你所看到的，所有你內縮放進 `for` 語句的程式碼都會對 `girls` 列表的每一個元素執行一次.

你也可以在 `for` 使用以`range` 函數計數的數字。

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

這將顯示︰

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` 是一個函數，它建立一系列數字，一個接一個（你提供這些數字作為參數）。

請注意這兩個數字的第二並未包括在 Python 輸出清單中（這表示 `range(1, 6)` 是從１數到５，但不包括數字６）。 That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## 彙總

就是這些。**你太棒了！**這是一個棘手的章節，所以你應該為自己感到驕傲。我們當然為你的進展感到驕傲！

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)