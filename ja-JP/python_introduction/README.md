{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Python入門

> このチャプターの一部はGeek Girls Carrotsのチュートリアルをもとにしています。(https://github.com/ggcarrots/django-carrots)

さあ、コードを書いてみましょう！

## Pythonプロンプト

> 家で１人でこのパートに挑戦している方へ：このパートと続くパートは、動画（英語）もあるので参考にしてください。 [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U)

Pythonであそぶために、*コマンドライン* を開きましょう。 やり方は、チャプター [コマンドラインを使ってみよう](../intro_to_command_line/README.md) で学びましたね。

準備ができたら、次の指示に従ってやってみましょう。

Pythonコンソールを開きましょう。Windowsなら `python` 、Mac OSやLinuxなら `python3` とタイプして `Enter` キーを押してください。

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 最初のPythonコマンド！

Pythonのコマンドが走ると、プロンプト記号が `>>>` に変わりました。 これは、今Pythonの言語を実行できますという意味です。 `>>>` はタイプしなくていいですよ – Pythonがあなたの代わりにやってくれます。

Pythonコンソールを終了したい時は、`exit()` とタイプするか、ショートカット `Ctrl + Z`（Windows）、`Ctrl + D`（Mac/Linux）を使ってください。 そうするともう `>>>` は出なくなります。

けど、今はまだコンソールを終了しないで、もっと動かして学びましょう。簡単な計算からはじめましょう。`2 + 3` とタイプして、`Enter` キーを押してください。

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

できました！答えがでてきましたね。Pythonは計算ができます。他にも、次のようなコマンドを試してみましょう。

- `4 * 5`
- `5 - 1`
- `40 / 2`

2の3乗のような指数の計算は、次のようにタイプします。{% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

ちょっとの間楽しんであそんでみたら、またココに戻ってきてくださいね。:)

お分かりのとおり、Pythonはステキな計算機ですね。他になにができるんだろう…と思ったら、次にいってみましょう。

## 文字列

あなたのお名前を次のようにクォーテーションをつけてタイプしてください。

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

はじめてのString（文字列）が完成です！ Stringとは、文字の集合のことです。 シングルクォーテーション (`'`) あるいは、ダブルクォーテーション (`"`) で囲います。 最初と最後は同じ記号にしてください。 クォーテーションの中が文字列であることを意味しています。

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

あなたの名前の文字数を知りたいときは、その **関数 (function)** もあります！

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

どうして、文字列の後に `.` をつけて関数を呼び出したり ( `"Ola".upper()` のように)、あるいは、先に関数を呼び出してかっこの中に文字列をいれているのか、と疑問に思ったかもしれません。 そうですね。時に、オブジェクトに結びついた関数というのがあります。例えば、`upper()` は、文字列にのみ実行される関数です。 私たちはこれを **メソッド (method)** と呼びます。 それとは別に、特定のオブジェクトに関連せず、異なるタイプのオブジェクトに対して実行できる関数があります。例えば `len()` ですね。 `len` 関数の引数として `"Ola"` をかっこの中にいれているのです。

### まとめ

文字列はだいじょうぶですね。ここまでに学んだことをまとめましょう。

- **プロンプト** – Pythonプロンプトにコマンド（コード）を入力すると、答えがかえってきます。
- **数値と文字列** – 数値は計算に、文字列はテキストに使われます。
- **演算子** – 例えば `+` や `*` のように、値を計算して新しい値を返します。
- **関数** – `upper()` や `len()` のようにオブジェクトに対して行う機能のことです。

すべてのプログラミング言語に共通する基礎になります。 もう少し難易度の高いものに挑戦してみましょう。準備はいいですか？

## エラー

さて、新しいことをやってみましょう。あなたの名前の文字数を数えたように、数字の文字数は数えられるでしょうか？ `len(304023)` と記述して、`Enter` キーを押してみましょう。

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

はじめてのエラーがでました！ {{ warning_icon }} アイコンのついたコードは思ったように動かないコードです。 （今回はチュートリアルで用意されていましたが）思ったように動かないことは学ぶ上で大事です！

オブジェクトタイプ"int" (integers, 数値) は文字数がありませんと言っています。では、どうすればよいでしょうか？この数字を文字列として扱えれば、文字数を数えられるはずですよね？

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

うまく行きました！ `str` 関数を `len` のかっこの中に記述しました。`str()` はその中身を文字列に変換します。

- `str` 関数は、**文字列** に変換します。
- `int` 関数は、文字列や数値を **整数** に変換します。

> 重要！: 数字は文字列にすることはできますが、全ての文字が数字に変換できるわけではありません。 例えば `int('hello')` は数字にはなりませんよね？

## 変数

変数（variables）は、プログラミングの重要なコンセプトです。 後で使うためにつける単なる名札ではありません。 プログラマーは変数を使ってデータを保管したり、 コードを読みやすくして、後でそれが何だったか覚えておかなくてもいいようにします。

変数 `name` を新しくつくってみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

name イコール（=）"Ola" とタイプします。

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

素晴らしいですね！変数は、数値にも使えますよ。

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

## print 関数

次に挑戦してみましょう。

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

単に `name` とタイプした時は、Pythonインタプリタが、変数'name'の文字列*表現（representation）*を返します。ここでは、シングルクォーテーション（''）に囲まれた M-a-r-i-aという文字の集まりです。 しかし、`print(name)`と記述した時は、Pythonは変数の中身を出力します。クォーテーションはありません。

これからさらに詳しくみていきますが、`print()` は、関数から出力をする時や、複数行の出力を行うときにも便利です。

## リスト

数値と文字列の他にも、すべてのオブジェクトタイプを勉強しておきましょう。 今から**list** というものを紹介していきます。 リストは、その名のとおり、オブジェクトの並びをもつものですね。 :)

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

## 辞書（ディクショナリ）

> 家で１人でこのパートに挑戦している方へ：このパートは、動画（英語）もあるので参考にしてください。 [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c)

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

次のように書くと各キーの値を確認できます。

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

リストに似ていますね。しかし、ディクショナリでは、インデックスを覚えておく必要がなく、キーの名前でいいのです。

もし存在しないキーを参照しようとすると、どうなるでしょうか？予想できますか？実際にやってみましょう！

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

またエラーです。今回は **KeyError** というエラーが出ました。Pythonは、このディクショナリにキー `'age'` は存在しませんよ、と教えてくれています。

ディクショナリとリストはどう使い分ければよいのでしょうか？そうですね、これはゆっくり考えてみるべきポイントですね！この後の行を読むまえに、答えを考えてみてください。

- 必要なのは、順序付けられた一連のアイテムですか？　リストを使いましょう。
- キーに対応する値が必要？キーから値を参照する？　ディクショナリを使いましょう。

ディクショナリやリストは、作ったあとに変更できるオブジェクトです。これを *mutable* と呼びます。次のように、ディクショナリを作ったあとで、新しいキーと値を追加することができます。

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

### まとめ

素晴らしいです！これで、あなたはプログラミングについて沢山のことを学びました。ここまでのところをまとめましょう。

- **エラー** – あなたのコマンドをPythonが理解できない時にエラーが表示されます。
- **変数** – コードを簡単にまた読みやすくするために、文字や数値などのオブジェクトにつける名札。
- **リスト** – 複数の値（要素）が順に並んでいるもの。
- **ディクショナリ** – キーと値のペアの集合です。

次に進む準備はいいですか？ :)

## 比較

> 家で１人でこのパートに挑戦している方へ：このパートは、動画（英語）もあるので参考にしてください。[Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4)

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

`>` と `<` は簡単でしたね。`>=` と `<=` はどうでしょうか？それぞれの意味は、次のとおりです。

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

複数の数値を比較して複雑になっても、その答えを出してくれます。とても賢いですね。

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

## ブール型（Boolean）

偶然にも、**ブール型 (Boolean)** というあたらしいオブジェクトタイプを学びました。

ブール型は、たった２つの値を持ちます。

- True
- False

Pythonを記述するときは、Trueの最初は大文字のT、残りは小文字です。 **true, TRUE, tRUE は間違いです。– True と記述してください** （False についても同様です。）

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

# 保存しよう！

> 家で１人でこのパートに挑戦している方へ：このパートと続くパートは、動画（英語）もあるので参考にしてください。[Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk)

ここまでインタプリタでPythonのコードをかいてきました。つまり、コードを１行ずつしか書くことができませんでした。 普通のプログラムはファイルに保存され、**インタプリタ** あるいは **コンパイラ** でプログラミング言語を処理して実行します。 ここまで、私たちはプログラムを１行ごとにPython **インタプリタ** で実行してきました。 ここからは、１行以上のコードを実行していきましょう。次のような流れになります。

- Pythonインタプリタを終了します。
- お好きなエディタを起動します。
- Pythonファイルとしてコードを保存します。
- 実行します！

これまで使っていたPythonインタプリタを終了しましょう。`exit()` 関数を入力してください。

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

これで、コマンドプロンプトに戻りました。

前に、[コードエディタ](../code_editor/README.md)セクションからエディタを選択しました。 ここでエディタを開いて、新しいファイルにコードを書き込んでみましょう（Chromebookを使用している場合は、Cloud IDEで新しいファイルを作成し、そのファイルを開きます。ファイルをcloud IDEに含まれたコードエディタで開いています）。

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

あなたは、すでにベテランのPython開発者です。今日学んだコードを自由に書いてみてください。

コードを書いたら、わかりやすい名前をつけて保存しましょう。 **python_intro.py** と名前をつけて、デスクトップに保存してください。 ファイル名は何でもかまいません。ここで重要なことは、拡張子を **.py** とすることです。 コンピュータにこのファイルは **Pythonで実行するファイルです** とおしえます。

> **メモ** コードエディタでは色に注目しましょう！これはとてもクールです。 Pythonコンソールでは、すべての文字は同じ色です。エディタでは、`print` 関数は文字列とは違う色がつきます。 これは「シンタックスハイライト」と呼ばれています。エディタは構文（シンタックス）を強調（ハイライト）します。コードを書くとき、これはとても役に立ちます。 色のおかげで、文字列の最後のクォーテーションの書き忘れや、キーワードの名前（この後学ぶ関数の `def` など）のタイポに気づくことができます。 これが私たちがコードエディタを使う理由の１つです. :)

ファイルを保存したら、実行してみましょう！コマンドラインのセクションで学んだことを思い出して、ターミナルの **ディレクトリを変更** して、デスクトップにしましょう。

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

Macでは、コマンドは次のようになります。

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Linux" data-id="python_linux"
data-collapse=true ces-->

Linuxでは、次のようになります。

{% filename %}command-line{% endfilename %}

    $ cd ~/Desktop
    

（「Desktop」という単語はあなたの地域の言語に翻訳される場合があります。）

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Windowsのコマンドプロンプトでは、次のようになります。

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

WindowsのPowerShellでは、次のようになります。

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

うまくできない時は、質問してください。まさにそのためにコーチがここにいるんです！

ではPythonを使用して、ファイル内のコードを次のように実行します。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

注：Windowsでは「python3」はコマンドとして認識されません。代わりに「python」を使ってファイルを実行します。

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

できました！ファイルに保存された初めてのPythonプログラムを実行できたのです。すばらしいですね。

では、ここからプログラミングに不可欠なツールを学んでいきましょう。

## If … elif … else

ある条件が成立するときにだけコードを実行したいということがよくあります。そのためにPythonでは **if文** を用います。

**python_intro.py** ファイルのコードを次のように書き換えてください。

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
```

もしこれを保存して実行すると、次のようなエラーが出ます。

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    File "python_intro.py", line 2
             ^
    SyntaxError: unexpected EOF while parsing
    

`3 > 2` という条件が成立する（ `True` となりますね）時に実行される処理を、まだ記述していませんね。 では、Python に “It works!” と出力してもらいましょう。 **python_intro.py** ファイルの中身を、次のとおりに書き換えてください。

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

2行目をスペース4つでインデント（字下げ）していることに気が付きましたか？ 条件が成り立つ時にどのコードを実行するかPythonが分かるように、インデントする必要があります。 スペース1つでもできますが、Pythonプログラマーはほぼ全員スペース4つとしています。 エディタの設定により、タブ1つもスペース4つと同じになります。 タブかスペースか決めたら、変えないようにしましょう。 例えばスペース4つでインデントしたら、この後もスペース4つでインデントするようにしましょう。インデントにスペースとタブを混ぜてしまうと問題が発生してしまうことがあります。

保存して、もう一度実行してみましょう。

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

注：Windowsでは「python3」はコマンドとして認識されないことを思い出してください。これから先、ファイルを実行するときは「python3」の代わりに「python」とタイプしてくださいね。

### 条件がTrueじゃないときは？

前述の例では、if文の条件が True の時だけコードが実行されました。Pythonは、`elif` や `else` といった記述もできます。

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
    

もし2が5より大きかったら、4行目のコマンドが実行されます。では、`elif` はどうなるのでしょうか？

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

実行すると...

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

どうなったかわかりましたか？ `elif` を使って、前に書いた条件が成立しない場合に実行される条件を追加することができます。

最初の `if` の後に、好きなだけ `elif` を追加することができます。例えば...

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

Pythonは上から順番に各条件をテストして実行し、次のように出力します。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Perfect, I can hear all the details
    

## コメント

コメントは `#` で始まる行です。`#` の後にはなんでも書くことができ、Pythonはそれを無視します。コメントを書いたコードは、ほかの人にとってもわかりやすくなります。

実際にはこのようになります。

{% filename %}python_intro.py{% endfilename %}

```python
# ボリュームが大きすぎたり小さすぎたりしたら変更する
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

コードのすべての行にコメントを書く必要はありません。コメントには、コードの中である処理をする理由や、複雑なコードの動きのまとめを書くと役に立ちます。

### まとめ

これらの練習を通して、学んだことは...

- **比較** – 比較に用いる `>`, `>=`, `==`, `<=`, `<` そして`and`, `or` といった演算子があります。
- **ブール型** – `True` と `False` 2つの値のみを持ちます。
- **ファイルの保存** – コードはファイルに保存することで、大きなプログラムも実行できます。
- **if … elif … else** – 条件分岐することで、特定の条件によって処理を分けて実行することができます。
- **コメント** – あなたがコードについて記述できる行。Pythonは実行しません。

では、いよいよこのチャプターの最後のパートです！

## 自作の関数！

> 家で１人でこのパートに挑戦している方へ：このパートは、動画（英語）もあるので参考にしてください。[Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0)

Pythonでは `len()` のように関数が実行できるのを覚えていますか？ ここでは、自分で関数を作る方法を学びます。

関数は、Pythonが実行する一連の命令をひとまとめにしたものです。 Pythonでは、関数は `def` というキーワードからはじまり、名前をつけ、引数を含むことができます。 やってみましょう。 **python_intro.py** の中身を下記のコードに置き換えてください。

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

よし！あなたの最初の関数を実行する準備ができましたね！

ここであなたは、最後の行になぜ関数の名前を書いたのだろう、と疑問に感じたかもしれません。 これは、Pythonがファイルを読み、上から下へ実行していくからです。 なので、関数を使用するには、一番下に再度書く必要があります。

では実行して、どうなるか見てみましょう。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi there!
    How are you?
    

注：思ったように動かなくても慌てないで！画面の出力は動かない理由をつかむのに役立ちます。

- `NameError` が出ている場合、おそらく何かミスタイプがあります。同じ名前を使っているかチェックしましょう。関数を定義するときは `def hi():` としていますか？関数を実行するときは `hi()` としていますか？
- `IndentationError` が出ている場合、`print` 関数の2行が同じ数のスペースでインデントされているかチェックしましょう。関数の中のコードは同じ数のスベースでインデントされているとPythonは考えます。
- 画面に何も表示されていない場合、最後の `hi()` がインデントされて *いない* かチェックしましょう - もしインデントされていたら、関数の一部になってしまっています。関数が呼び出されていません。

次に引数をつかった関数を作ってみましょう。先ほどの例を変更し、人の名前を呼んで 'hi' と挨拶をする関数にしてみます。

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
```

ご覧のように、関数に `name` という引数を与えました。

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

要確認：`print` 関数は、` if `文の中で4つのスペースでインデントします。 これは、条件が満たされたときに関数が実行されるためです。 では、どのように動くか見てみましょう。

{% filename %}{{ warning_icon }} command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

おっと、エラーがでてしまいました。 ラッキーなことに、Pythonがかなり役に立つエラーメッセージを表示してくれています。 定義した関数 `hi()` は、`name` という引数が必要ですが、関数を呼び出す時に引数を忘れてしまっているということがわかります。 最後の行を修正しましょう。

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

実行してください。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

では、名前を変えてみたらどうなりますか？

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

実行してください。

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

では、OlaやSonja以外の名前に変えた時、どうなるかわかりますか？やってみて、予測が正しいか確認して下さい。このように出力されます。

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

すごいでしょ？ 挨拶をする人の名前を変えるたびに繰り返しコードを書く必要がなくなりました。 これが関数を作る理由です。何度も繰り返してコードを書きたくないですよね！

もっとスマートにしてみましょう。名前が2つよりも多いと、それぞれの名前に対して条件を書くのは大変じゃないですか？ファイルの内容を下記のように書き換えてください。

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

では、実行してみましょう:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

おめでとうございます！関数の書き方を学びましたね！:)

## ループ

> 家で１人でこのパートに挑戦している方へ：このパートは、動画（英語）もあるので参考にしてください。[Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0)

さぁ、もう最後のパートですよ。あっという間ですね。 :)

先ほどお話ししたとおり、プログラマーはめんどくさがりで、同じことを繰り返すのは好きではありません。プログラミングの目的は、物事を自動化することです。名前を呼んで挨拶をする関数をすべての人に対して手で呼び出したくないですよね？こういう時にループが便利です。

リストを覚えていますか？女の子の名前をリストにしてみましょう:

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

名前を呼んで、全員にあいさつをしてみましょう。` hi `関数が使えますね。ループの中で使いましょう:

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

この `for` 文は `if` 文に似ています。これらの下に書くコードは、4つのスペースでインデントする必要があります。

ファイルに書かれるコードはこのようになります:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

実行してみましょう:

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
    

ご覧のとおり、`girls` リストのすべての要素に対して、`for` 文の中にインデントして書いたことが繰り返されています。

`for` 文では、`range` 関数を使って指定した回数だけ繰り返すこともできます。

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
    

`range` 関数は、連続する数値を要素とするリストを作ります。引数に指定した開始の数値から終了の数値までのリストです。

2つ目の引数（終了の数値）は、リストに含まれないことに注意してください。（`range(1, 6)`は1から5がカウントされますが、6は含まれません。） 開始に指定した数値は含まれて、終了に指定した値は含まれないのです。

## まとめ

以上です！**おめでとう！頑張りました！** これは簡単ではなかったと思います。自分を褒めてあげてくださいね。ここまで進めることができたのは、本当にすごいことです！

公式の完全なPythonチュートリアルは https://docs.python.org/3/tutorial/ にあります。これによって言語のより徹底的で完全な学習ができるでしょう。ばんざい！

次のチャプターに進む前に、少し気晴らしに、ストレッチやお散歩をして、目や身体を休ませてあげてくださいね。

![カップケーキ](images/cupcake.png)