# Introduction to Python

> Part of this chapter is based on tutorials by Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

さあ、コードを書いてみましょう！

## Python prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Pythonであそぶために、コマンドライン を開きましょう。 You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

準備ができたら、次の指示に従ってやってみましょう。

Pythonコンソールを開きましょう。Windowsならpython、Mac OSやLinuxならpython3とタイプして Enterキーをおしてください.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Your first Python command!

Pythonのコマンドが走ると、プロンプト記号が >>>に変わりました。 これは、今Pythonの言語を実行できますという意味です。 You don't have to type in `>>>` – Python will do that for you.

Pythonコンソールを終わる時は、exit()　とタイプするか、ショートカットCtrl + Z （Windows）、 Ctrl + D（Mac/Linux）で終了です。 >>> は現れなくなりました。

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

ちょっとの間楽しんであそんでみたら、またココに戻ってきてくださいね. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## Strings

あなたのお名前を次のようにクォーテーションをつけてタイプしてください。

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

はじめてのString（文字列）が完成です！ Stringとは、文字の集合のことです。 シングルクォーテーション (') あるいは、ダブルクォーテーション (") で囲います。 - クォーテーションの中が文字列であることを意味しています。

複数の文字列を結合することもできます。次のように試してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

文字列を繰り返すためには、演算子を使って繰り返し回数を指定することもできます。

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

アポストロフィーを文字列の中に含めたい場合は、２通りの方法があります。

まずは、ダブルクォーテーションを使う方法です。

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

あるいは、バックスラッシュ (\)を使う方法もあります。

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

できましたか？次に、あなたの名前を大文字に変えてみましょう。次のように記述してください。

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

どうして、文字列の後に. をつけて関数を呼び出したり ("Ola".upper()のように)、あるいは、先に関数を呼び出してかっこの中に文字列をいれているのか、と疑問に思ったかもしれません。 そうですね。時に、オブジェクトに結びついた関数というのがあります。例えば、upper()は、文字列にのみ実行される関数です。 私たちはこれをメソッド (method)と呼びます。 それとは別に、特定のオブジェクトに関連せず、異なるタイプのオブジェクトに対して実行できる関数があります。例えばlen()ですね。 len 関数の引数として"Ola"をかっこの中にいれているのです。

### 概要

文字列はだいじょうぶですね。ここまでに学んだことをまとめましょう。

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

すべてのプログラミング言語に共通する基礎になります。 もう少し難易度の高いものに挑戦してみましょう。準備はいいですか？

## Errors

さて、新しいことをやってみましょう。あなたの名前の文字数を数えたように、数字の文字列は数えれるでしょうか？ len(304023)と記述して、Enterキーを押してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

はじめてのエラーがでました！オブジェクトタイプ"int" (integers, 数値) は文字数がありませんと言っています。では、どうすればよいでしょうか？この数字を文字列として扱えれば、文字数を数えれるはずですよね？

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

うまく行きました！ `str` 関数を`Len`の中に記述しました。`str()` はその中身を文字列に変換します。

- `Str` 関数 は**文字列** に変換します
- `int` 関数 は**文字整数** に変換します

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## Variables

変数（variables）は、プログラミングの重要なコンセプトです。 後で使うためにつける単なる名札ではありません。 プログラマーは変数を使ってデータを保管したり、 コードを読みやすくして、後でそれが何だったか覚えておかなくてもいいようにします。

変数`name`を新しくつくってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

見てのとおり、プログラムは、なにも返してくれませんね。では、変数がきちんとあるか、どうやって確かめたらいいのでしょうか？ `name`とタイプして、</code>0>Enterキー</0>をおしてください。

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

関数にも使えます。

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

もしも、間違えた変数名を使ってしまったら、どうなるでしょうか？予想できますか？やってみましょう！

{% filename %}command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

エラーになりました！ 前回とは違うエラータイプです。**NameError**という、初めてみるエラータイプですね。 作成されていない変数を使った時は、Pythonがエラーを教えてくれます。 もし、このエラーに出くわしたら、記述したコードにタイプミスがないか確認してください。

ちょっと遊んで、何ができるか試してみてくださいね！

## The print function

次に挑戦してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

単に`name`とタイプした時は、Pythonインタプリタが、変数'name'の *representation*を返します。 ここでは、 M-a-r-i-aという単なる文字の集まりで、シングルクォーテーション（''）に囲われています。 しかし、 print(name)と記述した時は、Pythonは変数の中身を出力します。クォーテーションはありません。

これからさらに詳しくみていきますが、`print()` は、関数から出力をする時や、複数行の出力を行うときにも便利です。

## Lists

数値と文字列の他にも、すべてのオブジェクトタイプを勉強しておきましょう。 **list**というものがあります。 リストは、その名のとおり、オブジェクトの並びをもつものですね. :)

まずはリストを作りましょう

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

はい、このリストは空っぽです。使いにくいですよね。では、くじ引きの番号のリストを作りましょう。 この番号を何度も繰り返し書きたくはないから、同時に変数に代入してしまいましょう。

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

よし、これでリストができました！このリストで何をしましょうか？では、くじ引きの番号がいくつあるか、数えてみましょう。何の関数を使えばいいか、予想できますか？すでに知っていますよね！

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

そうです！`len()` がリストにあるオブジェクトの数を取得できます。便利ですね。では、くじ引きの番号をソートしてみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

これは何も返してきません。これはリストに表示される番号を、順番に並べ替えただけです。再度出力して、確かめてみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

ご覧のとおり、小さい順に並び替えられましたね。おめでとう！

逆順に並び替えてみたくなりましたか？やってみましょう。

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

最初の数字だけを出力したいときは、インデックス**indexes**を使って指定することができます。 インデックスは、アイテムがリストのどこにあるかを指す番号です。次のとおり試してみてください。 インデックスは、リストの先頭の要素から順に「０」、次に「１」と割り当てられています。次のとおり試してみてください。 次に挑戦してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

このように、リスト名と要素のインデックスを[]に記述することで、指定した要素を取り出すことができます。

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

お見事！

他のインデックスも試して遊んでみてください。例えば、 6, 7, 1000, -1, -6, -1000 などをインデックスに指定するとどうなるでしょうか。コマンドを実行する前に予測してみましょう。結果はどうですか？

ご参考に、こちらのドキュメントにリストメソッドがすべて記されています。 https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

これで中身が空っぽのディクショナリができましたね。やったね！

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- キー `name` が指す値 `'オーラ'` (`string` オブジェクト)
- キー `country` が指す値 `'Poland'` (`string` オブジェクト),
- キー `favorite_numbers/0> は リスト <code>[7, 42, 92]/0>。 (数字を3つ持つlist).</li>
</ul>

<p>次の構文で各キーの値を確認できます。</p>

<p>{% filename %}command-line{% endfilename %}</p>

<pre><code class="python">>>> print(participant['name'])
Ola
`</pre> 
    See, it's similar to a list. But you don't need to remember the index – just the name.
    
    もし存在しないキーを参照しようとすると、どうなるでしょうか？予想できますか？実際にやってみましょう！
    
    {% filename %}command-line{% endfilename %}
    
    ```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

またエラーです。今回は **KeyError**.というエラーが出ました。Pythonは、このディクショナリにキー'age'は存在しませんよ、と教えてくれています。

ディクショナリとリストはどう使い分ければよいのでしょうか？そうですね、これはゆっくり考えてみるべきポイントですね！この後の解答を読むまえに、考えてみてください。

- 必要なのは、順序付けられた一連のアイテムですか？　リストを使いましょう。
- キーに対応する値が必要？キーから値を参照する？　ディクショナリを使いましょう。

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

You can use the `pop()` method to delete an item in the dictionary. 例えば、 キー`'favorite_numbers'`の要素を削除するには、次のように記述してください。

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

### 概要

素晴らしいです! これで、あなたはプログラミングについて沢山のことを学びました。ここまでのところをまとめましょう。

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

次に進む準備はいいですか？

## Compare things

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

２つの数字がイコールであるかどうかを比べる時に、イコールの記号が２つ==並んでいます。 Pythonを記述する時、イコール１つ=は、変数に値を代入するときに使います。 You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. 等しくないものを求める事もできます。 その時は例のように `!=`と記述します。

次の２つはどうでしょうか

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x > y : x は y　より大きい
- x < y : x は y　より小さい
- x <= y : x は y　以下
- x >= y : x は y　以上

すばらしい! もう少しやってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

条件式が複数あって複雑になっても、その答えを出してくれます。とても賢いですね。

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

"comparing apples to oranges"という英語の表現を聞いたことはありますか？文字通り訳すと「リンゴとオレンジを比較する」となり、「比較にならないものを比較する」という意味です。Pythonでも同じようなことをやってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Pythonは、数値(int)　と文字列(str)の比較はできません。 **TypeError** とエラーが表示され、２つのオブジェクトタイプが比較できないことを教えてくれています。

## Boolean

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

ブール型は、次のように変数に代入することもできます。

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

このようなこともできます。

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

ブール型を使って、練習して遊んでみましょう。次のコマンドを試してみてください。

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

おめでとうございます！ブール型を理解することは、プログラミングでとても大事です。ここまでできましたね！

# Save it!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

ここまでインタプリタでPythonのコードをかいてきました。つまり、コードを１行づつしか書くことができませんでした。 普通のプログラムはファイルに保存され、インタプリタ あるいは コンパイラでプログラミング言語を処理して実行します。 ここまで、私たちはプログラムを１行ごとにPython インタプリタで実行してきました。 ここかっらは、１行以上のコードを実行していきましょう。次のような流れになります。

- Pythonインタプリタを終了します。
- お好きなエディタを起動します。
- Pythonファイルとしてコードを保存します。
- 実行します！

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

これで、コマンドプロンプトに戻りました。

前のチャプター [code editor](../code_editor/README.md) で、エディタを紹介しました。エディタを起動して、新しいファイルにコードを書いてみましょう。

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

あなたは、すでにベテランのpython開発者です。今日学んだコードを自由に書いてみてください。

コードを書いたら、わかりやすい名前をつけて保存しましょう。 **python_intro.py**と名前をつけて、デスクトップに保存してください。 ファイル名は何でもかまいません。ここで重要なことは、拡張子を**py**とすることです。 The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. これは「構文」と呼ばれています「ハイライトする」こと、そして、コーディングとき、それは本当に役に立つ特徴です。 The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). これが私たちがコードエディタを使う理由の１つです. :)

ファイルを保存したら、実行してみましょう！コマンドラインのセクションで学んだことを思い出して、ターミナルの **ディレクトリを変更**して、デスクトップにしましょう。

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Macでは、コマンドは次のようになります。

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

うまくできない時は、質問してください。

次に、ファイルのコードを実行します。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

できました！これで、あなたはファイルに保存されたPythonプログラムを実行できましたね。いい気分ですね。

では、ここからプログラミングに不可欠のツールを学んでいきましょう

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

では、**python_intro.py** ファイルのコードを次のように書き換えてください。

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
    

条件式 3 > 2　がTrueの時、どのように処理をすべきかが記述されていませんね。 では、Python に “It works!”　と出力してもらいましょう。 **python_intro.py **ファイルの中身を、次のとおりに書き換えてください。

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

２行目をスペース４つでインデントしていることに気が付きましたか？ if文がTrueの時、どのコードを実行するかPythonに知らせる必要があります。 スペース１つでもできますが、ほぼ全員のPythonプログラマーはスペース４つとしています。 タブ１つも、スペース４つと同じです。

保存して、もう一度実行してみましょう。

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### What if a condition isn't True?

前述の例では、if文の条件式がTrueの時だけ、コードが実行されました。Pythonは、elif や else といった記述もできます。

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

これを実行した場合、次のように出力されます。

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

それを実行すると...

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

`elif`を追加する事で 、上記の条件が失敗した場合に実行する余分な条件を追加する事ができます。

最初の条件分岐の後に好きなように多くの`elif`を追加する事ができます。例えば...

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

Pythonは上から順番に各条件をテスト、実行し、出力します。

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

### 概要

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

では、このチャプターの最後のパートに挑戦していきましょう！

## Your own functions!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

実行する機能をひとまとめにしたものを関数といいます。 Pythonでは、functionは`def`というキーワードからはじまり、引数を含むことができます。 Let's give it a go. **python_intro.py** の中身を書きのコードに置き換えてください。:

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

あなたの最初の関数を実行する準備ができましたね!

ここであなたは、最後の行になぜ関数の名前を書いたのだろう、と疑問に感じたかもしれません。 これは、Pythonがファイルを読み、上から下へ実行していくからです。 関数を定義したあとに、もう一度その関数を書いて呼び出します。

では実行して、どうなるか見てみましょう:

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

このとおり、関数に`name`という引数を足します。

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

上記のように、`print`関数の前に、インデントを２ついれる必要があります。` if の条件式`が真の時に、なにをすべきかという処理はインデントの後に記述します。 実行して、どのように動くか見てみましょう。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

おっと、エラーがでてしまいました。 Pythonがエラーメッセージを表示してくれています。 定義した関数`hi()`は、`name`という引数が必要ですが、関数を呼び出す時に引数を忘れてしまっています。 最後の行を修正しましょう。:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

実行してください。:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

では、名前を変えてみたらどうなりますか？

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

再度実行してください。:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

すばらしいですね。 挨拶をする人の名前を毎回何度も繰り返して書く必要がなくなりました。 And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

では、実行してみましょう。：

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

おめでとうございます！Functionsの書き方を学びましたね。:)!

## Loops

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

さぁ、もう最後のパートですよ。あっという間ですね。 :)

先ほどお話したとおり、プログラマーはめんどくさがりで、同じことを繰り返すことは好きではありません。プログラミングはすべてを自動的に処理したい。私たちはすべての人の名前ひとつひとつに対して挨拶をしたくないですよね？こういう時にループが便利です。

リストを覚えていますか？女の子の名前をリストにしてみましょう。:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

名前を呼んで、全員にあいさつをしてみましょう。` hi `関数が使えますね。ループの中でつかいましょう。:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The ```for``` statement behaves similarly to the ```if``` statement; code below both of these need to be indented four spaces.

ファイルに書かれるコードはこのようになります。

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

実行してみましょう。:

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
    

ご覧のとおり、girlsリストのすべての要素に対して、`for `の中にインデントして書かれたことが繰り返されています.

for 文では、range 関数をつかって指定した回数だけ繰り返すこともできます。:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

これを実行すると、次のように出力されます:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

range関数は、引数に指定した開始と終了の数値から連続する数値の値を要素として持つリスト型のオブジェクトを作成します。

2つ目の引数（終了の数値）は、リストに含まれないことに注意してください。 That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## 概要

以上です！**おめでとう！頑張りました！** これは簡単ではなかったと思います。自分を褒めてあげてくださいね。ここまで進めることができたのは、本当に素晴らしいことです！

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)