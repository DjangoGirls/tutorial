# 파이썬(python) 시작하기

> 이번 장의 일부는 Geek Girls Carrots (https://github.com/ggcarrots/django-carrots)의 튜토리얼을 바탕으로 작성되었습니다.

자, 코딩 한 번 해봅시다!

## 파이썬 프롬프트 (Python prompt)

> For readers at home: this part is covered in the [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U) video.

Python과 함께 놀기 위해서는 *커맨드라인*을 열어야 합니다. You should already know how to do that – you learned it in the [Intro to Command Line](../intro_to_command_line/README.md) chapter.

준비되었다면, 아래 내용을 잘 따라오세요.

파이썬 콘솔을 실행해야합, 윈도우에서는 `python`을 입력하고 맥OS나 리눅스라면`python3`를 입력하고 `엔터`를 입력하세요.

{% filename %}command-line{% endfilename %}

    $ python3
    Python 3.6.1 (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## 나의 첫 번째 파이썬 명령!

파이썬을 실행시키고 나면 프롬프트가 `>>>`로 바뀝니다. 이제부터는 파이썬 언어의 명령어들만 사용할 수 있다는 뜻이예요. You don't have to type in `>>>` – Python will do that for you.

파이썬 콘솔에서 나가려면 `exit()` 을 입력하거나 윈도우에서는 `Ctrl + Z` 를 맥이나 리눅스에서는 `Ctrl + D`를 입력하면 됩니다. 그러면 `>>>` 는 사라질 거에요.

For now, we don't want to exit the Python console. We want to learn more about it. Let's start by typing some math, like `2 + 3` and hitting `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3 
5
```

잘했어요! 결과값이 어떻게 나왔나요? 파이썬은 수학을 알고 있어요! 다른 명령어를 넣어봅시다:

- `4 * 5`
- `5 - 1`
- `40 / 2`

To perform exponential calculation, say 2 to the power 3, we type: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

조금 놀아봤다면 다시 여기로 돌아와주세요. :)

As you can see, Python is a great calculator. If you're wondering what else you can do…

## 문자열(String)

이름도 다룰 수 있을까요? 따옴표로 이름을 감싸서 입력해보세요.

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" 
'Ola'
```

처음으로 문자열을 만들었군요! 문자열은 컴퓨터가 처리할 수 있는 연속된 문자들을 말해요. 문자열은 반드시 시작과 끝이 같은 문자여야해요. 문자열은 작은 따옴표(`'`) 나 큰 따옴표(`"`) 로 감싸야 해요. (둘 간의 차이점은 없어요. 단지 하나로 감싸나 둘로 감싸나 차이일 뿐이에요.) 이 따옴표는 파이썬에게 안에 문자열이리 들어있다고 알려줍니다.

문자열들은 줄줄이 사탕처럼 연결할 수 있어요. 이렇게요:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola" 
'Hi there Ola'
```

문자열이랑 숫자를 곱할 수도 있어요.

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3 
'OlaOlaOla'
```

문자열 안에 작은 따옴표를 넣고 싶다면, 두 가지 방법이 있어요.

큰 따옴표를 사용하는 방법과

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill" 
"Runnin' down the hill"
```

백슬래시 (``) 기호를 이용하는 방법이예요.

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill' 
"Runnin' down the hill"
```

알겠나요? 이제 이름을 대문자로 만들어볼까요:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

방금 문자열에 `upper`이라는 **함수(function)**를 사용했어요! 함수 (`upper()` 같은 것)란 파이썬이 주어진 대상(`"Ola"`같은)에 대해 수행할 수 있는 일련의 명령을 말해요.

내 이름의 총 글자의 수를 알고 싶을 때, 사용하는 **함수**도 있어요.

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola") 
3
```

함수 호출 시, 어떤 함수는 문자열 뒤에 `.`를 붙이고, (`"Ola".upper()` 처럼), 또 어떤 함수는 함수 뒤에 문자열이 들어간 괄호를 붙이는지 궁금하셨죠? `upper()`와 같은 함수는 객체에 속하게 되어 해당 문자열에서만 수행되기 때문이죠. 이와 같은 경우, 함수를 **메서드(method)**라고 합니다. 그리고, `len()`과 같은 함수들은 특정한 대상에 속하지 않고 여러가지 객체를 대상으로 사용할 수 있습니다. 그래서 `len` 함수에 `"Ola"`를 매개 변수(parameter) 로 준 거예요.

### 목차

자, 문자열은 충분히 다루었어요. 지금까지 우리가 공부한 것들을 정리해봅시다:

- **the prompt** – typing commands (code) into the Python prompt results in answers in Python
- **numbers and strings** – in Python numbers are used for math and strings for text objects
- **operators** – like `+` and `*`, combine values to produce a new one
- **functions** – like `upper()` and `len()`, perform actions on objects.

지금까지 프로그래밍 언어의 기초에 대해 알아보았어요. 더 어려운 부분으로 넘어가도 괜찮겠죠? 그럼요!

## 오류

이제 새로운 것을 해볼 때에요. 이름의 글자 길이를 알아냈듯이 숫자의 길이도 알 수 있을까요? `len(304023)` 을 입력하고 `엔터`를 입력해보세요:

{% filename %}command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

첫 번째 에러가 나타났어요! "int" (정수) 형식의 객체는 길이가 없기 때문이지요. 이제 어떻게 할 수 있을까요? 숫자(number) 를 문자열(String) 로 바꿔 쓸 수 있지 않을까요? 문자열은 길이를 갖고 있으니까요, 그렇죠?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

잘 되네요! 앞에서 우리는`len` 함수 내부에 `str` 함수를 사용했어요. `str` 함수는 모든 것을 문자열로 변환한답니다.

- `str`함수는 대상을 **문자열**로 변환합니다
- `int` 함수는 대상을 **정수**로 변환합니다.

> Important: we can convert numbers into text, but we can't necessarily convert text into numbers – what would `int('hello')` be anyway?

## 변수

변수는 프로그래밍에서 중요한 개념입니다. 변수란 어떤 것을 나중에도 사용할 수 있도록 이름을 붙인 것일 뿐 입니다. 프로그래머들은 이 변수를 데이터 저장하는데 사용하고, 작성한 코드를 다 기억할 필요없이 코드를 읽기 쉽게 하기 위해 사용하지요.

`name`이라는 새로운 변수를 만들어봅시다:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

We type name equals Ola.

여러분도 알겠지만, 프로그램은 이전에 수행한 것을 보여주지 않습니다. 그러면 실제 변수에 어떤 값이 들어있는지 알려면 어떻게 해야할까요? 간단하게 `name`를 입력하고 `엔터`를 입력하세요:

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

또 함수 안에서 변수를 사용할 수 있습니다:

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

그런데 만약 잘못된 이름을 사용했다면 어떻게 될까요? 어떤 일이 일어날까요? 해봅시다!

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

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

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

네, 리스트가 비어있어요. 별로 유용해 보이지 않죠? 이제 로또 번호 목록을 만들어 봅시다. 매번 직접 우리가 반복하기는 귀찮으니, 리스트에 변수를 넣어봅시다:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

좋아요, 리스트를 만들었네요! 어떻게 쓰면 될까요? 목록에 수 많은 로또 번호가 있다고 생각해봅시다. 함수를 사용할 수 있는 아이디어가 떠올랐나요? 여러분들은 이미 앞에서 해봤어요!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

네! `len()` 함수는 리스트 안에 있는 객체의 수를 알려줍니다. 편리하지 않나요? 이제 정렬을 해봅시다:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

아무것도 보여주지 않네요. 이 함수는 리스트 안의 숫자들을 오름차순으로 정렬합니다. 어떻게 변했는지 리스트를 출력해봅시다:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

위에 나왔듯이, 리스트 안에 있는 숫자들은 오름차순으로 정렬되었습니다. 축하합니다!

만약 반대로 내림차순으로 정렬하고 싶다면요? 하면 됩니다!

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

만약 첫 번째 숫자 하나만 보여주고 싶다면, **인덱스(index)**를 사용하세요. 인덱스는 리스트 안의 아이템 위치를 나타내는 숫자입니다. 프로그래머는 0부터 세는 것을 선호합니다. 따라서 리스트에 있는 첫 번째 객체는 인덱스 0부터 시작하고, 그 다음은 1, 그 다음은 2.. 가 됩니다. 해봅시다:

{% filename %}command-line{% endfilename %}

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

마법같네요!

재미로 몇 번 더 여러 인덱스를 테스트해보세요: 6, 7, 1000, -1, -6, -1000 등이요. 결과값을 보기 전에 미리 어떤 값이 나올지 예상할 수 있었나요? 생각했던 정답이 나왔나요?

이번 장에 나온 리스트 메서드와 관련된 모든 내용은 파이썬 공식 문서에서 찾을 수 있습니다. : https://docs.python.org/3/tutorial/datastructures.html

## 딕셔너리(Dictionary)

> For readers at home: this part is covered in the [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c) video.

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

방금 비어있는 딕셔너리를 하나 만들었답니다. 만세!

Now, try writing the following command (try substituting your own information, too):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- 키(key) 는 `name`이고, 값(value) 는 `'Ola'`를 가리킵니다. (`string(문자열)` 객체이지요.),
- 키 `country`의 값은 `'Poland'`입니다. (또 다른 `string`입니다),
- 그리고 키 `favorite_numbers`는 `[7, 42, 92]`를 가리킵니다. (`리스트`에는 세 개의 숫자가 있습니다.)

여러분은 아래와 같은 문법으로 개별 키의 값에 접근할 수 있습니다.

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

See, it's similar to a list. But you don't need to remember the index – just the name.

만약 파이썬에 키에 대응하는 값이 없는 경우에는 어떻게 될까요? 예측할 수 있나요? 그럼 한 번 알아봅시다!

{% filename %}command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

보세요, 에러가 났네요! 이번에는 **KeyError**에러가 났습니다. 파이썬은 친절하게 키 `'age'`가 딕셔너리에 존재하지 않는다고 알려주네요.

그렇다면 언제 딕셔너리를 쓰고, 언제 리스트를 사용해야할까요? 이를 위한 판단 기준은 다음과 같습니다.

- 아이템을 나열할 때 정렬이 필요하나요? 그렇다면 리스트를 사용하세요.
- 키(key) 과 값(value) 이 서로 연관되어 있어야 하나요? 또는 보다 효과적으로 (키를 사용해서) 어떤 값을 찾아야 하나요? 그렇다면, 딕셔너리를 사용하세요.

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

You can use the `pop()` method to delete an item in the dictionary. `'favorite_numbers'` 키를 삭제하고 싶으면, 아래와 같은 명령어를 입력하면 됩니다. :

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

훌륭하네요! 이제 모두가 프로그래밍에 대해서 많은 것을 알게 되었어요. 지금까지 우리가 배운 내용은 다음과 같아요. :

- **errors** – you now know how to read and understand errors that show up if Python doesn't understand a command you've given it
- **variables** – names for objects that allow you to code more easily and to make your code more readable
- **lists** – lists of objects stored in a particular order
- **dictionaries** – objects stored as key–value pairs

다음 내용이 기대되나요? :)

## 비교하기

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

두 숫자를 비교할 때 왜 등호 부호 `==`를 사용하는지 궁금했죠? 우리는 변수에 값을 넣을 때 한 개의 등호 기호 `=`를 사용하죠. You always, **always** need to put two of them – `==` – if you want to check if things are equal to each other. 마찬가지로 두 대상이 서로 같지 않다라고 말할 수 있습니다. 위 예제에서 볼 수 있었듯이 서로 같은 대상이 아닐 때는 `!=` 기호를 사용합니다.

두 번 더 테스트 해볼게요.:

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

잘했어요! 좀 더 해볼까요? 이런 건 어떨까요. :

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

파이썬은 얼마든지 원하는 만큼 숫자를 비교할 수 있고 답을 알려줄 거에요! 똑똑한 녀석이죠?

- **and** – if you use the `and` operator, both comparisons have to be True in order for the whole command to be True
- **or** – if you use the `or` operator, only one of the comparisons has to be True in order for the whole command to be True

"사과를 오렌지에 비교하기"라는 말을 들어본 적이 있나요? 파이썬에게 시켜봅시다. :

{% filename %}command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

이처럼 파이썬은 숫자(`int`) 와 문자열(`str`) 을 비교할 수 없어요. 비교는 못하지만 대신 **TypeError**를 보여줘 두 타입이 서로 비교 대상이 아니라는 것을 알려줍니다.

## Boolean (불리언)

Incidentally, you just learned about a new type of object in Python. It's called **Boolean**.

There are only two Boolean objects:

- True
- False

But for Python to understand this, you need to always write it as 'True' (first letter uppercase, with the rest of the letters lowercased). **true, TRUE, and tRUE won't work – only True is correct.** (The same applies to 'False' as well, of course.)

Boolean도 변수로 사용할 수도 있습니다! 다음을 보세요:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

이런 식으로도 쓸 수 있습니다.

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

아래 명령어를 실행해보면서 Boolean을 가지고 놀아보세요. :

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

축하합니다! Boolean은 프로그래밍에 있어서 가장 멋진 기능 중 하나에요. 여러분은 Boolean을 앞으로 어떻게 사용해야 하는지 방금 배웠답니다!

# 코드 저장하기!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

지금까지 우리는 인터프리터(interpreter) 에서 파이썬 코드를 입력해 왔어요. 한 번에 코드 한 줄만 입력할 수 있었어요. 일반적으로 프로그램은 파일로 저장되어 프로그래밍 언어 **인터프리터(interpreter)** 또는 **컴파일러(complier)**로 실행됩니다. 지금까지 우리는 파이썬 **인터프리터**에서 한 줄씩 코드를 입력해 프로그램을 실행시켰어요. 이제 앞으로는 한 줄 이상 더 많은 코드를 작성해 실행해 볼 거에요. 빨리 해볼게요. :

- 파이썬 인터프리터를 종료하세요.
- 선택한 코드 에디터를 실행하세요.
- 코드를 새 파이썬 파일로 저장하세요.
- 실행하세요!

To exit from the Python interpreter that we've been using, simply type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

그러면 커맨드 프롬프트(또는 콘솔창) 가 초기화 됩니다.

앞서 우리는 [코드 편집기](../code_editor/README.md) 섹션에서 어떤 코드 편집기를 사용할지 정했었습니다. 이제 편집기를 실행해서 새 코드를 작성하여 새 파일로 저장합니다:

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

오늘 우리 모두가 파이썬 개발자가 되었답니다. 그러니 오늘 배운 코드를 가지고 놀아보세요.

이제 파일을 저장하고 파일 이름을 바꾸세요. 바탕화면에 **python_intro.py** 파일로 저장하세요. 원하는 파일이름으로 저장할 수 있지만, 파일 이름이 반드시 **.py**로 끝나야 해요. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

> **Note** You should notice one of the coolest thing about code editors: colors! In the Python console, everything was the same color; now you should see that the `print` function is a different color from the string. 이를 "문법 하이라이팅(syntax highlighting)" 하는데, 코딩할 때 필요한 기능이죠. The color of things will give you hints, such as unclosed strings or a typo in a keyword name (like the `def` in a function, which we'll see below). 그래서 우리는 코드 에디터를 사용한답니다. :)

파일을 저장했다면, 커맨드라인 장에서 배웠던 것을 써먹어야죠! 터미널에서 데스크탑으로 **디렉토리 변경**을 해보세요.

<!--sec data-title="Change directory: OS X" data-id="python_OSX"
data-collapse=true ces-->

맥이라면 명령어는 다음과 같을 것입니다:

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

혹시 하다가 막히면, 코치에게 도움을 요청하세요.

이제 파일 안에 있는 코드를 실행하기 위해 다음과 같이 파이썬을 실행해 봅시다. :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Note: on Windows 'python3' is not recognized as a command. Instead, use 'python' to execute the file:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

잘했어요! 우리는 첫 파이썬 프로그램이 저장된 파일을 실행했어요. 내가 드디어 해냈다고 느껴지나요?

다음으로 프로그래밍의 필수 도구를 알아볼 차례에요. :

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

**python_intro.py** 파일을 다음과 같이 수정하세요:

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
    

파이썬은 조건문 `3 > 2`가 참인 경우(또는 값이 `True`인 경우)에 어떤할 지 물어 보네요. 이 경우에 파이썬이 "It works!"를 출력하게 해봅시다. : **python_intro.py** 파일을 아래와 같이 수정하세요. :

{% filename %}python_intro.py{% endfilename %}

```python
if 3 > 2:
    print('It works!')
```

두 번째 줄 들여쓰기 된 코드에 스페이스 4칸을 준 게 보이나요? 조건의 결과(여기서는 3>2) 가 참일 경우에, 실행할 코드에 들여쓰기를 해줘야 합니다. 물론 스페이스 한 칸만 띄울 수 있지만, 거의 모든 파이썬 프로그래머들은 코드를 깔끔하게 작성하기 위해 4칸을 사용해요. `탭(tab)` 한 번은 스페이스 4칸을 준 것과 같아요.

이제 저장하고 실행해보세요:

{% filename %}command-line{% endfilename %}

```python
$ python3 python_intro.py
It works!
```

Note: Remember that on Windows, 'python3' is not recognized as a command. From now on, replace 'python3' with 'python' to execute the file.

### 조건이 참(True) 이 아니라면 어떻게 되나요?

앞의 예제에서 코드가 조건이 True인 경우에만 실행되게 만들었어요. 하지만 파이썬은 `elif`문과 `else`문도 사용할 수 있습니다.

{% filename %}python_intro.py{% endfilename %}

```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

실행하면 다음과 같이 출력됩니다:

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

그리고 실행해보세요. :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hey Sonja!
    

어떻게 됐나요? `elif`문은 맨 처음 조건이 아닐 경우 그 다음 조건을 처리하게 해줍니다.

여러분은 `if` 문을 쓴 다음에 원하는 만큼 `elif` 문을 계속 추가할 수 있어요. 이렇게요. :

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

파이썬이 각 테스트를 순서대로 실행하고 출력합니다:

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

드디어 이번 장의 마지막 부분입니다!

## 나만의 함수 만들기!

> For readers at home: this part is covered in the [Python Basics: Functions](https://www.youtube.com/watch?v=5owr-6suOl0) video.

Remember functions like `len()` that you can execute in Python? Well, good news – you will learn how to write your own functions now!

함수는 파이썬이 실행해야하는 명령어의 나열이에요. 파이썬의 각 함수는 `def`로 시작해, 이름을 가지고, 몇 가지 매개 변수를 가집니다. Let's give it a go. **python_intro.py**파일을 열어 코드를 다음과 같이 고치세요. :

{% filename %}python_intro.py{% endfilename %}

```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

네, 우리가 만든 첫 번째 함수네요!

파일 맨 밑에 왜 함수의 이름을 적는지 궁금할거에요. 왜냐하면 파이썬은 파일을 위에서 아래로 읽어 실행하기 떄문이에요. 우리의 함수를 사용하기 위해서는 하단에 다시 적어야 합니다.

이제 실행해서 어떻게 되는지 봅시다:

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

함수에 매개변수인 `name`를 주었어요.

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

기억하세요: `if`문 안의 `print`함수는 4칸을 들여쓰기 했습니다. 조건문에 해당하는 경우에만 실행되게 만들기 위해서에요. 이제 어떻게 되는지 보세요. :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Traceback (most recent call last):
    File "python_intro.py", line 10, in <module>
      hi()
    TypeError: hi() missing 1 required positional argument: 'name'
    

이런, 에러가 나왔네요. 다행히도, 파이썬 에러는 유용한 오류 메세지를 보여주네요. 에러 메시지를 보면 함수 `hi()`가 한 개의 인자값(`name`) 을 필요로 하는데, 그 함수를 호출할 때 빼먹고 실행했다는 것을 알려주고 있어요. 이제 아래와 같이 코드를 수정해봅시다:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

그리고 다시 실행해보세요. :

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

만약 이름을 바꾸면 어떻게 될까요?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

그리고 실행하세요:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Now, what do you think will happen if you write another name in there? (Not Ola or Sonja.) Give it a try and see if you're right. It should print out this:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

어때요, 정말 굉장하지 않나요? 이로써 인사 함수가 호출될 때마다, 사람 이름을 매번 반복할 필요가 없어요. And that's exactly why we need functions – you never want to repeat your code!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right?

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

이제 코드를 실행해 봅시다:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

축하합니다! 이제 여러분은 함수를 작성하는 방법을 배웠습니다! :)

## 반복하기

> For readers at home: this part is covered in the [Python Basics: For Loop](https://www.youtube.com/watch?v=aEA6Rc86HF0) video.

이제 마지막 부분입니다. 금방 했죠? :)

프로그래머는 반복되는 일을 스스로 하기를 좋아하지 않아요. 프로그래밍이란 어떤 일들을 자동화하는 것이니까 반복적인 경우가 생기면 그걸 반복해서 해결하는 코드를 짜는 것이지요. 앞에서 했던 예제와 같이 인사해야 하는 사람이 수백명 있을 경우, 설마 각각 사람마다 인사하려고 hi('누구누구') 코드를 수백번 입력하고 싶지는 않겠지요? 이런 경우에 바로 반복문(loop)를 사용할 수 있어요.

리스트 아직 기억하고 있어요? 아래 girls 리스트를 보세요. :

{% filename %}python_intro.py{% endfilename %}

```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

우리는 여자 아이들 이름을 불러 인사를 하고 싶어요. 우리는 이미 `hi` 함수를 만들었으니 반복문을 사용해봅시다. : 

{% filename %}python_intro.py{% endfilename %}

```python
for name in girls:
```

The `for` statement behaves similarly to the `if` statement; code below both of these need to be indented four spaces.

아래 완성된 코드입니다. :

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

실행하면 다음과 같습니다:

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
    

`girls` 리스트의 요소마다 여러분이 `for`문에 넣은, 들여쓰기를 한 모든 코드들이 반복됩니다.

`for`문에 `range` 함수로 숫자를 사용할 수 있어요.

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

이렇게 출력됩니다. :

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range`는 매개 변수로 넘겨진 숫자부터 시작하는 숫자 리스트를 만들어주는 함수입니다.

파이썬에서는 두 숫자 중 두 번째는 리스트에 포함되지 않는다는 것을 주의하세요. (즉 `range(1, 6)`는 1부터 5까지 카운트 하며 숫자 6은 리스트에 포함되지 않습니다.) That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## 목차

이제 다 끝났어요. **모두 정말 대단해요!** 어려운 내용이었는데 잘 해낸 나 자신을 자랑스럽게 생각하세요. 여기까지 온 것이 자랑스럽습니다!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)