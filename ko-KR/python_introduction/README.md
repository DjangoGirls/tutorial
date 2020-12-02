{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# 파이썬(python) 시작하기

> 이번 장의 일부는 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)의 튜토리얼을 바탕으로 작성되었습니다.

자, 코드를 써 봅시다!

## 파이썬 프롬프트 (Python prompt)

> 집에서 공부하시는 분은: [파이썬 기초: 정수, 문자, 리스트, 변수, 에러](https://www.youtube.com/watch?v=MO63L4s-20U)영상을 참고하세요.

Python으로 놀기 위해서는 *커맨드라인*을 열어야 합니다. [커맨드라인 시작하기](../intro_to_command_line/README.md)에서 배웠던 걸 기억하고 있겠지요?

준비되었다면, 아래 내용을 잘 따라오세요.

파이썬 콘솔을 실행해야합니다. 윈도우에서는 `python`을 입력하고 맥OS나 리눅스라면`python3`를 입력하고 `엔터`를 입력하세요.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 나의 첫 번째 파이썬 명령!

파이썬을 실행시키고 나면 프롬프트가 `>>>`로 바뀝니다. 이제부터는 파이썬 언어의 명령어들만 사용할 수 있다는 뜻이예요. `>>>`를 입력할 필요 없어요. 파이썬이 대신해 줄 테니까요.

파이썬 콘솔에서 나가려면 `exit()` 을 입력하거나 윈도우에서는 `Ctrl + Z` 를 맥이나 리눅스에서는 `Ctrl + D`를 입력하면 됩니다. 그러면 `>>>` 는 사라질 거에요.

지금은 우리는 파이썬 콘솔을 나가지 않을거에요. 우리는 더 배우길 원하거든요. 자 이제 `2 + 3` 라는 수학식을 입력하고 `enter`키를 누르세요.

{% filename %}명령줄{% endfilename %}

```python
>>> 2 + 3 
5
```

잘했어요! 결과값이 어떻게 나왔나요? 파이썬은 수학을 알고 있어요! 다른 명령어를 넣어봅시다:

- `4 * 5`
- `5 - 1`
- `40 / 2`

2의 3제곱인 지수연산을 수행하기위해서 우리는 {% filename %}명령줄{% endfilename %} 입력할 거에요.

```python
>>> 2 ** 3
8
```

조금 놀아봤다면 다시 여기로 돌아와주세요 :)

보시다시피, 파이썬은 훌륭한 계산기랍니다. 그 밖에 여러분들이 할 수 있는 것들이 궁금하다면...

## 문자열(String)

이름도 다룰 수 있을까요? 따옴표로 이름을 감싸서 입력해보세요.

{% filename %}명령줄{% endfilename %}

```python
>>> "Ola" 
'Ola'
```

처음으로 문자열을 만들었군요! 문자열은 컴퓨터가 처리할 수 있는 연속된 문자들을 말해요. 문자열은 반드시 시작과 끝이 같은 문자여야해요. 문자열은 작은 따옴표(`'`) 나 큰 따옴표(`"`) 로 감싸야 해요. (둘 간의 차이점은 없어요. 단지 하나로 감싸나 둘로 감싸나 차이일 뿐이에요.) 이 따옴표는 파이썬에게 안에 문자열이리 들어있다고 알려줍니다.

문자열들은 줄줄이 사탕처럼 연결할 수 있어요. 이렇게요:

{% filename %}명령줄{% endfilename %}

```python
>>> "Hi there " + "Ola" 
'Hi there Ola'
```

문자열이랑 숫자를 곱할 수도 있어요.

{% filename %}명령줄{% endfilename %}

```python
>>> "Ola" * 3 
'OlaOlaOla'
```

문자열 안에 작은 따옴표를 넣고 싶다면, 두 가지 방법이 있어요.

큰 따옴표를 사용하는 방법과

{% filename %}명령줄{% endfilename %}

```python
>>> "Runnin' down the hill" 
"Runnin' down the hill"
```

백슬래시 (``) 기호를 이용하는 방법이예요.

{% filename %}명령줄{% endfilename %}

```python
>>> 'Runnin\' down the hill' 
"Runnin' down the hill"
```

알겠나요? 이제 이름을 대문자로 만들어볼까요:

{% filename %}명령줄{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

방금 문자열에 `upper`이라는 **함수(function)**를 사용했어요! 함수 (`upper()` 같은 것)란 파이썬이 주어진 대상(`"Ola"`같은)에 대해 수행할 수 있는 일련의 명령을 말해요.

내 이름의 총 글자의 수를 알고 싶을 때, 사용하는 **함수**도 있어요.

{% filename %}명령줄{% endfilename %}

```python
>>> len("Ola") 
3
```

함수 호출 시, 어떤 함수는 문자열 뒤에 `.`를 붙이고, (`"Ola".upper()` 처럼), 또 어떤 함수는 함수 뒤에 문자열이 들어간 괄호를 붙이는지 궁금하셨죠? `upper()`와 같은 함수는 객체에 속하게 되어 해당 문자열에서만 수행되기 때문이죠. 이와 같은 경우, 함수를 **메서드(method)**라고 합니다. 그리고, `len()`과 같은 함수들은 특정한 대상에 속하지 않고 여러가지 객체를 대상으로 사용할 수 있습니다. 그래서 `len` 함수에 `"Ola"`를 매개 변수(parameter) 로 준 거예요.

### 목차

자, 문자열은 충분히 다루었어요. 지금까지 우리가 공부한 것들을 정리해봅시다:

- **the prompt: 프롬프트** - 명령어(코드) 를 파이썬 프롬프트에 입력하면 파이썬이 응답합니다.
- **numbers and strings: 숫자와 문자열** - 파이썬에서는 셈을 할 때는 숫자를 사용하고 글을 다룰 때는 문자열을 사용합니다.
- **operators: 연산자** - 값들을 이용해서 새로운 값을 만들 때는 `+` 와 `*` 같은 연산자를 이용합니다.
- **functions 함수** - `upper()` 나 `len ()` 처럼 대상에 명령을 수행합니다.

지금까지 프로그래밍 언어의 기초에 대해 알아보았어요. 더 어려운 부분으로 넘어가도 괜찮겠죠? 그럼요!

## 오류

이제 새로운 것을 해볼 때에요. 이름의 글자 길이를 알아냈듯이 숫자의 길이도 알 수 있을까요? `len(304023)` 을 입력하고 `엔터`를 입력해보세요:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

첫 번째 에러가 나타났어요! 여기서 {{warning_icon}} 아이콘은 `이 코드는 여러분이 예상하는 대로 실행되지 않을 것입니다`를 의미합니다. 학습하는데 있어서 의도적인 실수를 만들어보는 것도 중요한 역할을 하기도 한답니다!

"int"(정수)객체는 길이가 없기 때문이지요. 이제 어떻게 할 수 있을까요? 숫자(number)를 문자열(String)로 바꿔 쓸 수 있지 않을까요? 문자열은 길이를 갖고 있으니까요, 그렇죠?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

잘 되네요! 앞에서 우리는`len` 함수 내부에 `str` 함수를 사용했어요. `str` 함수는 모든 것을 문자열로 변환한답니다.

- `str`함수는 대상을 **문자열**로 변환합니다
- `int` 함수는 대상을 **정수**로 변환합니다.

> 중요 : 우리는 숫자를 텍스트로 변환할 수는 있지만, 반드시 텍스트를 숫자로 변환할 수 있는건 아닙니다 - `int('hello')` 가 어떻게 될 것 같나요?

## 변수

변수는 프로그래밍에서 중요한 개념입니다. 변수란 어떤 것을 나중에도 사용할 수 있도록 이름을 붙인 것일 뿐 입니다. 프로그래머들은 이 변수를 데이터 저장하는데 사용하고, 작성한 코드를 다 기억할 필요없이 코드를 읽기 쉽게 하기 위해 사용하지요.

`name`이라는 새로운 변수를 만들어봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> name = "Ola"
```

우리는 name 변수에 Ola를 입력했어요.

여러분도 알겠지만, 프로그램은 이전에 수행한 것을 보여주지 않습니다. 그러면 실제 변수에 어떤 값이 들어있는지 알려면 어떻게 해야할까요? 간단하게 `name`를 입력하고 `엔터`를 입력하세요:

{% filename %}명령줄{% endfilename %}

```python
>>> name
'Ola'
```

야호! 여러분이 만든 첫 변수입니다 :)! 언제든지 여러분은 변수를 바꿀 수 있어요:

{% filename %}명령줄{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

또 함수 안에서 변수를 사용할 수 있습니다:

{% filename %}명령줄{% endfilename %}

```python
>>> len(name)
5
```

멋지죠? 물론 변수는 무엇이든지 담을 수 있으니, 당연히 숫자도 가능하죠! 해봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

그런데 만약 잘못된 이름을 사용했다면 어떻게 될까요? 어떤 일이 일어날까요? 해봅시다!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

에러가 나타났네요! 보다시피, 파이썬에는 많은 종류의 오류들이 있습니다. 그 중 하나가 **NameError**입니다. 파이썬은 아직 정의하지 않은 변수를 사용하면 이 오류를 보여줍니다. 나중에 똑같은 오류를 보게 된다면, 이름에 오타가 없는지 확인해보세요.

잠시동안 변수와 놀아봅시다. 그리고 어떤 것들을 할 수 있는지 살펴보아요!

## print 함수

해봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

`name`을 쳤을 때, 파이썬 해석기는 'name' 변수의 문자열 *표현(representatio)*으로 응답하는데, 그 모양은 작은 따옴표('') 로 둘러싸인 M-a-r-i-a 문자들 입니다. `print(name)`라고 치면, 파이썬은 화면에 따옴표 없이 더 깔끔한 변수를 "출력(print)"할 것입니다.

나중에 보겠지만, `print()`는 함수 안에 있는 어떤 것을 출력하거나, 이를 여러 줄로 출력할 때 유용하게 사용됩니다.

## 리스트 (List)

문자열과 정수 외에, 파이썬은 객체 정렬 위한 여러 방법들이 있어요. 이제 **리스트**라고 불리는 녀석에 대해서 알아보기로 하겠습니다. 리스트를 이렇게 생각하시면 됩니다: 다른 객체들을 나열한 객체. :)

이제 리스트를 만듭시다:

{% filename %}명령줄{% endfilename %}

```python
>>> []
[]
```

네, 리스트가 비어있어요. 별로 유용해 보이지 않죠? 이제 로또 번호 목록을 만들어 봅시다. 매번 직접 우리가 반복하기는 귀찮으니, 리스트에 변수를 넣어봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

좋아요, 리스트를 만들었네요! 어떻게 쓰면 될까요? 목록에 수 많은 로또 번호가 있다고 생각해봅시다. 함수를 사용할 수 있는 아이디어가 떠올랐나요? 여러분들은 이미 앞에서 해봤어요!

{% filename %}명령줄{% endfilename %}

```python
>>> len(lottery)
6
```

네! `len()` 함수는 리스트 안에 있는 객체의 수를 알려줍니다. 편리하지 않나요? 이제 정렬을 해봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> lottery.sort()
```

아무것도 보여주지 않네요. 이 함수는 리스트 안의 숫자들을 오름차순으로 정렬합니다. 어떻게 변했는지 리스트를 출력해봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

위에 나왔듯이, 리스트 안에 있는 숫자들은 오름차순으로 정렬되었습니다. 축하합니다!

만약 반대로 내림차순으로 정렬하고 싶다면요? 하면 됩니다!

{% filename %}명령줄{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

참 쉽죠? 여러분이 리스트에 새로운 값을 추가하고 싶다면면, 추가할 때마다 매번 다시 정렬 명령을 해줘야 합니다:

{% filename %}명령줄{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

만약 첫 번째 숫자 하나만 보여주고 싶다면, **인덱스(index)**를 사용하세요. 인덱스는 리스트 안의 아이템 위치를 나타내는 숫자입니다. 프로그래머는 0부터 세는 것을 선호합니다. 따라서 리스트에 있는 첫 번째 객체는 인덱스 0부터 시작하고, 그 다음은 1, 그 다음은 2.. 가 됩니다. 해봅시다:

{% filename %}명령줄{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

리스트의 이름이나 대괄호 안에 들어가는 객체의 인덱스를 사용해서, 리스트 안에 있는 다른 객체로도 접근이 가능합니다.

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

That worked like a charm!

For extra fun, try some other indexes: 6, 7, 1000, -1, -6 or -1000. See if you can predict the result before trying the command. Do the results make sense?

You can find a list of all available list methods in this chapter of the Python documentation: https://docs.python.org/3/tutorial/datastructures.html

## 딕셔너리(Dictionary)

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- 키(key) 는 `name`이고, 값(value) 는 `'Ola'`를 가리킵니다. (`string(문자열)` 객체이지요.),
- 키 `country`의 값은 `'Poland'`입니다. (또 다른 `string`입니다),
- 그리고 키 `favorite_numbers`는 `[7, 42, 92]`를 가리킵니다. (`리스트`에는 세 개의 숫자가 있습니다.)

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

What happens if we ask Python the value of a key that doesn't exist? Can you guess? Let's try it and see!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Look, another error! This one is a **KeyError**. Python is helpful and tells you that the key `'age'` doesn't exist in this dictionary.

When should you use a dictionary or a list? Well, that's a good point to ponder. Think about the answer before looking at it in the next line.

- 아이템을 나열할 때 정렬이 필요하나요? 그렇다면 리스트를 사용하세요.
- 키(key) 과 값(value) 이 서로 연관되어 있어야 하나요? 또는 보다 효과적으로 (키를 사용해서) 어떤 값을 찾아야 하나요? 그렇다면, 딕셔너리를 사용하세요.

Dictionaries, like lists, are *mutable*, meaning that they can be changed after they are created. You can add new key–value pairs to a dictionary after it is created, like this:

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Like lists, using the `len()` function on the dictionaries returns the number of key–value pairs in the dictionary. Go ahead and type in this command:

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

I hope it makes sense up to now. :) Ready for some more fun with dictionaries? Read on for some amazing things.

You can use the `pop()` method to delete an item in the dictionary. Say, if you want to delete the entry corresponding to the key `'favorite_numbers'`, type in the following command:

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

### 목차

Awesome! You know a lot about programming now. In this last part you learned about:

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## 비교하기

> For readers at home: this part is covered in the [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4) video.

A big part of programming involves comparing things. What's the easiest thing to compare? Numbers! Let's see how that works:

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

We gave Python some numbers to compare. As you can see, not only can Python compare numbers, but it can also compare values of mathematical expressions like `2 * 2` and function results like the `2` returned by `len([4, 5])`. Nice, huh?

Do you wonder why we put two equal signs `==` next to each other to compare if numbers are equal? We use a single `=` for assigning values to variables. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. We can also state that things are unequal to each other. For that, we use the symbol `!=`, as shown in the example above.

Give Python two more tasks:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

We've seen `>` and `<`, but what do `>=` and `<=` mean? Read them like this:

- x `>` y : x는 y보다 크다
- x `<` : x는 y보다 작다
- x `<=` : x가 y보다 작거나 같다
- x `>=` : x가 y보다 크거나 같다

Awesome! Wanna do one more? Try this:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

You can give Python as many numbers to compare as you want, and it will give you an answer! Pretty smart, right?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

Have you heard of the expression "comparing apples to oranges"? Let's try the Python equivalent:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Here you see that just like in the expression, Python is not able to compare a number (`int`) and a string (`str`). Instead, it shows a **TypeError** and tells us the two types can't be compared together.

## Boolean (불리언)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well.)

Booleans can be variables, too! See here:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

You can also do it this way:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Practice and have fun with Booleans by trying to run the following commands:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Congrats! Booleans are one of the coolest features in programming, and you just learned how to use them!

# 코드 저장하기!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- 파이썬 인터프리터를 종료하세요.
- 선택한 코드 에디터를 실행하세요.
- 코드를 새 파이썬 파일로 저장하세요.
- 실행하세요!

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

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. 이를 "문법 하이라이팅(syntax highlighting)" 하는데, 코딩할 때 필요한 기능이죠. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). 그래서 우리는 코드 에디터를 사용한답니다. :)

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

### 조건이 참(True) 이 아니라면 어떻게 되나요?

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

### 목차

In the last few exercises you learned about:

- **comparing things** – in Python you can compare things by using `>`, `>=`, `==`, `<=`, `<` and the `and`, `or` operators
- **Boolean** – a type of object that can only have one of two values: `True` or `False`
- **Saving files** – storing code in files so you can execute larger programs.
- **if … elif … else** – statements that allow you to execute code only when certain conditions are met.
- **comments** - lines that Python won't run which let you document your code

Time for the last part of this chapter!

## 나만의 함수 만들기!

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

## 반복하기

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

## 목차

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)