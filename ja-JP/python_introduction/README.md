{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Introduction to Python

> このチャプターの一部はGeek Girls Carrotsのチュートリアルをもとにしています。(https://github.com/ggcarrots/django-carrots)

さあ、コードを書いてみましょう！

## Python prompt

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Pythonであそぶために、*コマンドライン* を開きましょう。 やり方は、チャプター [Intro to Command Line](../intro_to_command_line/README.md) で学びましたね。

準備ができたら、次の指示に従ってやってみましょう。

Pythonコンソールを開きましょう。Windowsなら `python` 、Mac OSやLinuxなら `python3` とタイプして `Enter` キーを押してください。

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Your first Python command!

Pythonのコマンドが走ると、プロンプト記号が `>>>` に変わりました。 これは、今Pythonの言語を実行できますという意味です。 `>>>` はタイプしなくていいですよ。 – Pythonがあなたの代わりにやってくれます。

Pythonコンソールを終わる時は、`exit()` とタイプするか、ショートカット `Ctrl + Z`（Windows）、`Ctrl + D`（Mac/Linux）で終了です。 `>>>` は現れなくなりました。

けど、今はまだコンソールを終了しないで、もっと動かして学びましょう。簡単な計算からはじめましょう。`2 + 3` とタイプして、`Enter` キーを押してください。

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

できました！答えがでてきましたね。Pythonは計算ができます。他にも、次のようなコマンドを試してみましょう。

- `<code>4 * 5`</code>
- `<code>5 - 1`</code>
- `<code>40 / 2`</code>

2の3乗のような指数の計算は、次のようにタイプします。{% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

ちょっとの間楽しんであそんでみたら、またココに戻ってきてくださいね。:)

お分かりのとおり、Pythonはステキな計算機ですね. 他になにができるんだろう…と思ったら、次にいってみましょう。

## Strings

あなたのお名前を次のようにクォーテーションをつけてタイプしてください。

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

はじめてのString（文字列）が完成です！ Stringとは、文字の集合のことです。 シングルクォーテーション (`'`) あるいは、ダブルクォーテーション (`"`) で囲います。 最初と最後は同じ記号にしてください。 - クォーテーションの中が文字列であることを意味しています。

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

あるいは、バックスラッシュ (``) を使う方法もあります。

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

ここで `upper` **関数 (function)** を使うことができましたね！ 関数 ( `upper()` など) は、呼び出したオブジェクト ( `"Ola"` のことです) に対してどのような手順でどのような処理をするかをひとまとめにしたものです。

あなたの名前の文字数を知りたいときは、その **関数** もあります！

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

どうして、文字列の後に `.` をつけて関数を呼び出したり ( `"Ola".upper()` のように)、あるいは、先に関数を呼び出してかっこの中に文字列をいれているのか、と疑問に思ったかもしれません。 そうですね。時に、オブジェクトに結びついた関数というのがあります。例えば、`upper()` は、文字列にのみ実行される関数です。 私たちはこれを **メソッド (method)** と呼びます。 それとは別に、特定のオブジェクトに関連せず、異なるタイプのオブジェクトに対して実行できる関数があります。例えば `len()` ですね。 `len` 関数の引数として `"Ola"` をかっこの中にいれているのです。

### 概要

文字列はだいじょうぶですね。ここまでに学んだことをまとめましょう。

- **プロンプト** – Pythonプロンプトにコマンド（コード）を入力すると、答えがかえってきます。
- **数値と文字列** – 数値は計算に、文字列はテキストに使われます。
- **演算子** – 例えば `+` や `*` のように、値を計算して新しい値を返します。
- **関数** – `upper()` や `len()` のようにオブジェクトに対して行う機能のことです。

すべてのプログラミング言語に共通する基礎になります。 もう少し難易度の高いものに挑戦してみましょう。準備はいいですか？

## Errors

さて、新しいことをやってみましょう。あなたの名前の文字数を数えたように、数字の文字列は数えられるでしょうか？ `len(304023)` と記述して、`Enter` キーを押してみましょう。

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

はじめてのエラーがでました！ {{ warning_icon }} アイコンのついたコードは思ったように動かないコードです。 （今回はチュートリアルで用意されていましたが）思ったように動かないことは学ぶ上で大事な経験です！

オブジェクトタイプ"int" (integers, 数値) は文字数がありませんと言っています。では、どうすればよいでしょうか？この数字を文字列として扱えれば、文字数を数えられるはずですよね？

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

うまく行きました！ `str` 関数を `len` の中に記述しました。`str()` はその中身を文字列に変換します。

- `str` 関数は、**文字列** に変換します。
- `int` 関数は、文字列や数値を **整数** に変換します。

> 重要！: 数字は文字列にすることはできますが、全ての文字が数字に変換できるわけではありません。 例えば `int('hello')` は数字にはなりませんよね？

## Variables

変数（variables）は、プログラミングの重要なコンセプトです。 後で使うためにつける単なる名札ではありません。 プログラマーは変数を使ってデータを保管したり、 コードを読みやすくして、後でそれが何だったか覚えておかなくてもいいようにします。

変数 `name` を新しくつくってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

name イコール（=）Ola とタイプします。

見てのとおり、プログラムは、なにも返してくれませんね。では、変数がきちんとあるか、どうやって確かめたらいいのでしょうか？ `name` とタイプして、`Enter` キーを押してください。

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

やりました！あなたのはじめての変数ができましたね！代入する値を変えることもできます。

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

変数には関数も使えます。

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

素晴らしいですね！変数は、もちろん数値にも使えますよ。

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

もしも、間違えた変数名を使ってしまったら、どうなるでしょうか？予想できますか？やってみましょう！

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

エラーになりました！ 前回とは違うエラータイプです。**NameError** という、初めてみるエラータイプですね。 作成されていない変数を使った時は、Pythonがエラーを教えてくれます。 もし、このエラーに出くわしたら、記述したコードにタイプミスがないか確認してください。

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

単に `name` とタイプした時は、Pythonインタプリタが、変数'name'の *representation* を返します。ここでは、 M-a-r-i-aという単なる文字の集まりで、シングルクォーテーション（''）に囲われています。 しかし、`print(name)`と記述した時は、Pythonは変数の中身を出力します。クォーテーションはありません。

As we'll see later, `print()` is also useful when we want to print things from inside functions, or when we want to print things on multiple lines.

## Lists

数値と文字列の他にも、すべてのオブジェクトタイプを勉強しておきましょう。 **list** というものがあります。 リストは、その名のとおり、オブジェクトの並びをもつものですね。 :)

まずはリストを作りましょう。

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

リストに何かを追加したいときは、次のようにコマンドを記述してください。

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

最初の数字だけを出力したいときは、**インデックス(index)** を使って指定することができます。 インデックスは、アイテムがリストのどこにあるかを指す番号です。 リストの先頭の要素から順に「０」、次に「１」と割り当てられています。 次のとおり試してみてください。

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

このように、リスト名と要素のインデックスを [] に記述することで、指定した要素を取り出すことができます。

リストから要素を消すには、これまで学んできたインデックスと `pop()` メソッドを使います。 例で試してみましょう。リストの最初の要素を削除しています。

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

辞書(ディクショナリ)について確認しましょう。リストに似ていますが、インデックスのかわりにキーと呼ばれる識別子で値を参照します。キーは文字列も数値も使えます。ディクショナリは次のように `{}` 括弧で囲んで作成します。

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

これで中身が空っぽのディクショナリができましたね。やったね！

では、つぎのコマンドを記述してみましょう。 (あなた自身の情報に値をおきかえてみてもいいですよ）

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

このコマンドで、`participant` という名前の変数をつくって、３つのキーと値をもつ要素を作成しました。

- キー `name` が指す値は `'Ola'` (`string` オブジェクト)
- キー `country` が指す値は `'Poland'` (`string` オブジェクト)
- キー `favorite_numbers` が指す値はリスト `[7, 42, 92]` (数字を3つ持つ`list`)

次の構文で各キーの値を確認できます。

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

リストに似ていますね。しかし、ディクショナリでは、インデックスを覚えておく必要がなく、名前でいいのです。

もし存在しないキーを参照しようとすると、どうなるでしょうか？予想できますか？実際にやってみましょう！

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

またエラーです。今回は **KeyError** というエラーが出ました。Pythonは、このディクショナリにキー `'age'` は存在しませんよ、と教えてくれています。

ディクショナリとリストはどう使い分ければよいのでしょうか？そうですね、これはゆっくり考えてみるべきポイントですね！この後の解答を読むまえに、考えてみてください。

- 必要なのは、順序付けられた一連のアイテムですか？　リストを使いましょう。
- キーに対応する値が必要？キーから値を参照する？　ディクショナリを使いましょう。

ディクショナリやリストは、生成後に変更できるオブジェクトです。これを *mutable* と呼びます。次のように、ディクショナリを作ったあとで、新しいキーと値を追加することができます。

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

リストと同様に、`len()` 関数をディクショナリに使ってみましょう。ディクショナリでは、キーと値のペアの数を返します。コマンドを入力してやってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

お分かり頂けたでしょうか。 :) では、ディクショナリを使ってもう少し練習してみましょう。準備ができたら、次の行にいってみましょう。

ディクショナリの要素を削除する時は、`pop()` メソッドを使います。 例えば、 キー `'favorite_numbers'` の要素を削除するには、次のように記述してください。

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

このように、`'favorite_numbers'` のキーと値が削除されます。

同様に、次のように記述することで、すでにあるキーの値を変更することができます。

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

これで、キー `'country'` の値は、`'Poland'` から `'Germany'` に変わりました。面白くなってきましたか？その調子です！

### Summary

素晴らしいです！これで、あなたはプログラミングについて沢山のことを学びました。ここまでのところをまとめましょう。

- **エラー** – あなたのコマンドをPythonが理解できない時にエラーが表示されます。
- **変数** – コードを簡単にまた読みやすくするために、文字や数値などのオブジェクトにつける名札。
- **リスト** – 複数の値（要素）が順に並んでいるもの。
- **dictionaries** – キーと値のペアの集合です。

次に進む準備はいいですか？ :)

## Compare things

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

比較することは、プログラミングの醍醐味の１つです。簡単に比較できるものといえば、何でしょうか？そうです、数字ですね。さっそくやってみましょう。

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

Pythonにいくつか比較する数字をあたえてみました。数字を比較するだけでなく、演算式の答えも比較することができます。便利でしょ？

２つの数字がイコールであるかどうかを比べる時に、イコールの記号が２つ `==` 並んでいます。 Pythonを記述する時、イコール１つ `=`は、変数に値を代入するときに使います。 ですので、値同士が等しいかどうか比較するときは、必ず **必ず** イコール記号２つ `==` を記述してください。 等しくないことを比較するときは、 上記の例のように `!=` と記述します。

次の２つはどうでしょうか。

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

`>` と `<`は簡単でしたね。`>=` と `<=` はどうでしょうか？それぞれの意味は、次のとおりです。

- x `>` y : x は y より大きい
- x `<` y : x は y より小さい
- x `<=` y : x は y 以下
- x `>=` y : x は y 以上

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

- **and** – `and` の左辺と右辺が共にTrueの場合のみ、True。
- **or** – `or` の左辺あるいは右辺の少なくとも１つがTrueの時、True。

"comparing apples to oranges"という英語の表現を聞いたことはありますか？文字通り訳すと「リンゴとオレンジを比較する」となり、「比較にならないものを比較する」という意味です。Pythonでも同じようなことをやってみましょう。

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Pythonは、数値(`int`)と文字列(`str`)の比較はできません。 **TypeError** とエラーが表示され、２つのオブジェクトタイプが比較できないことを教えてくれています。

## Boolean

偶然にも、**ブール型 (Boolean)** というあたらしいオブジェクトタイプを学びました。

ブール型は、たった２つの値を持ちます。

- True
- False

Pythonを記述するときは、Trueの最初は大文字のT、残りは小文字です。 **true, TRUE, tRUE は間違いです。– True と記述してください** (もちろん False についても同様です。)

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

- `<code>True and True`</code>
- `<code>False and True`</code>
- `<code>True or 1 == 1`</code>
- `<code>1 != 2`</code>

おめでとうございます！ブール型を理解することは、プログラミングでとても大事です。ここまでできましたね！

# Save it!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

ここまでインタプリタでPythonのコードをかいてきました。つまり、コードを１行づつしか書くことができませんでした。 普通のプログラムはファイルに保存され、**インタプリタ** あるいは **コンパイラ** でプログラミング言語を処理して実行します。 ここまで、私たちはプログラムを１行ごとにPython **インタプリタ** で実行してきました。 ここからは、１行以上のコードを実行していきましょう。次のような流れになります。

- Pythonインタプリタを終了します。
- お好きなエディタを起動します。
- Pythonファイルとしてコードを保存します。
- 実行します！

これまで使っていたPythonインタプリタを終了しましょう。`exit()` ファンクションを記述してください。

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

コードを書いたら、わかりやすい名前をつけて保存しましょう。 **python_intro.py** と名前をつけて、デスクトップに保存してください。 We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. これは「構文」と呼ばれています「ハイライトする」こと、そして、コーディングとき、それは本当に役に立つ特徴です。 The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). これが私たちがコードエディタを使う理由の１つです. :)

With the file saved, it's time to run it! Using the skills you've learned in the command line section, use the terminal to **change directories** to the desktop.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

On a Mac, the command will look something like this:

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

If you get stuck, just ask for help.

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

Notice how we've indented the next line of code by 4 spaces? We need to do this so Python knows what code to run if the result is true. You can do one space, but nearly all Python programmers do 4 to make things look neat. A single `tab` will also count as 4 spaces.

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

### 概要

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

Let's build our first function with parameters. We will use the previous example – a function that says 'hi' to the person running it – with a name:

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

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

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

## 概要

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)