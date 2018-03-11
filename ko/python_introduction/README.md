# 파이썬 시작하기

> **Note** 이 장의 일부는 [Geek Girls Carrots 튜토리얼](https://github.com/ggcarrots/django-carrots)을 기초로 작성되었습니다. 


자, 지금부터 코딩 한번 해볼까요?

## 파이썬 프롬프트(Python prompt)

> **Note** 집에서 학습하시는 분은 [파이썬 기초: 숫자, 문자열, 리스트, 변수, 에러](https://www.youtube.com/watch?v=MO63L4s-20U) 영상을 보세요.

파이썬과 놀아보려면 *커맨드 라인* 창을 켜야합니다. [Command Line 시작하기](../intro_to_command_line/README.md) 장에서 어떻게 하는지 배웠어요.

준비되었다면, 아래 내용을 잘 따라오세요.

파이썬 콘솔을 실행하기 위해, 윈도우에서는 `python`을 입력하고, 맥OS나 리눅스라면 `python3`를 입력하고 `엔터`를 입력하세요.

{% filename %}command-line{% endfilename %}
```
$ python3
Python 3.6.1 (...)
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## 첫 번째 파이썬 명령어!

파이썬을 실행시키면 프롬프트가 `>>>`로 바뀝니다. 이제부터는 파이썬 언어 명령어만 사용할 수 있다는 뜻이예요. `>>>`를 입력할 필요 없어요. 파이썬이 대신해 줄 테니까요.

파이썬 콘솔에서 나가려면 `exit()`을 입력하거나, 윈도우에서는 `Ctrl + Z`를, 맥이나 리눅스에서는 `Ctrl + D`를 입력하면 됩니다. 그러면 `>>>` 는 사라질 거에요.

물론 지금 파이썬 콘솔을 종료할 필요가 없답니다. 아직 파이썬 콘솔에 대해 좀 더 배워야 하니까요. 아주 간단한 사칙연산부터 해봅시다. `2 + 3`을 입력하고 `엔터`를 쳐보세요.

{% filename %}command-line{% endfilename %}
```python
>>> 2 + 3
5
```

잘했어요! 값이 출력되었나요? 파이썬은 수학을 할 줄 알아요. 다른 사칙연산도 입력해보세요.

- `4 * 5`
- `5 - 1`
- `40 / 2`

2의 3승과 같이 지수 계산을 위해서는 아래와 같이 입력하세요.

{% filename %}command-line{% endfilename %}
```python
>>> 2 ** 3
8
```

조금 놀아보고 다시 여기로 돌아와주세요. :)

이처럼 파이썬은 훌륭한 계산기랍니다. 이외에도 할 수 있는 것들이 많아요!

## 문자열(String)

이름을 써봅시다. 따옴표(")를 양쪽에 감싸서 입력해보세요.

{% filename %}command-line{% endfilename %}
```python
>>> "Ola"
'Ola'
```

처음으로 문자열을 만들었군요! 문자열은 컴퓨터가 처리할 수 있는 연속된 문자를 말해요. 문자열은 반드시 시작과 끝이 문자여야 하고, 양쪽을 작은따옴표(`'`) 나 큰따옴표(`"`)로 감싸야 해요. (차이점은 없어요) 이 따옴표는 파이썬에게 안에 문자열이 들어있다고 알려줍니다.

문자열은 줄줄이 사탕처럼 연결될 수 있어요. 이렇게요.

{% filename %}command-line{% endfilename %}
```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

문자열과 숫자를 함께 곱할 수도 있어요.

{% filename %}command-line{% endfilename %}
```python
>>> "Ola" * 3
'OlaOlaOla'
```

문자열 안에 작은따옴표를 넣고 싶다면, 두 가지 방법이 있어요.

큰따옴표("")를 사용하는 방법과

{% filename %}command-line{% endfilename %}
```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

백슬래시(`\`)를 이용하는 방법이예요.

{% filename %}command-line{% endfilename %}
```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

{% filename %}command-line{% endfilename %}
```python
>>> "Ola".upper()
'OLA'
```

방금 문자열에 `upper`이라는 __메소드(method)__를 사용했어요! 메소드는(`upper()`같은 것)는 파이썬이 객체(`"Ola"`같은)를 대상으로 수행할 수 있는 일련의 명령을 말해요.
 
총 글자 수를 알고 싶을 때, `len()` __함수(function)__을 사용해요.

{% filename %}command-line{% endfilename %}
```python
>>> len("Ola")
3
```

왜 어떤 함수는 문자열 뒤에 `.`를 붙이고, (`"Ola".upper()`처럼), 또 어떤 함수는 뒤에 문자열이 들어간 괄호(`len("Ola")처럼`)를 붙이는지 궁금하셨죠? ` upper()`같은 함수는 문자열만 쓸 수 있는 함수로, **메서드(method)**라고 합니다. 반면에 `len()`과 같은 함수는 문자열이나 숫자 등 여러 객체를 사용할 수 있어요. 그래서 `len()`함수에 `"Ola"`를 매개변수(parameter)로 준 거예요.

### 요약하기

자, 문자열은 충분히 다루었어요. 지금까지 우리가 공부한 내용을 정리해봅시다.

*   **프롬프트(the prompt)** - 명령어(코드)를 파이썬 프롬프트에 입력하면 파이썬이 응답합니다.
*   **숫자와 문자열(numbers and strings)** - 사칙연산을 할 때는 숫자를 사용하고 글을 다룰 때는 문자열을 사용합니다.
*   **연산자(operators)** - `+` 나 `*`같은 연산자를 사용합니다.
*   **함수(functions)** - 객체에 `upper()`나 `len()`처럼 명령을 수행합니다.

지금까지 가장 기본적인 프로그래밍 문법을 살펴보았어요. 더 어려운 부분으로 넘어가도 괜찮겠죠?

## 오류

새로운 것을 배워봅시다. 총 글자 수도 알아냈듯이 숫자 수도 알 수 있을까요? `len(304023)`을 입력하고 `엔터`를 입력하세요.

{% filename %}command-line{% endfilename %}
```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

첫 번째 에러가 나타났어요! "int"(정수)객체는 길이가 없기 때문이지요. 이제 어떻게 할 수 있을까요? 숫자(number)를 문자열(String)로 바꿔 쓸 수 있지 않을까요? 문자열은 길이를 갖고 있으니까요, 그렇죠?

{% filename %}command-line{% endfilename %}
```python
>>> len(str(304023))
6
```

잘 되네요! 앞에서 우리는 `len()`함수 내부에 `str()`함수를 사용했어요. `str()`함수는 모든 대상을 문자열로 변환한답니다.

*   `str()`함수는 대상을 **문자열**로 변환합니다
*   `int()`함수는 대상을 **정수**로 변환합니다.

> 중요 : 숫자는 텍스트로 변환되지만, 반대로 텍스트는 숫자로 변환될 수 없습니다. - 그렇다면 `int('hello')`는 가능할까요?

## 변수

변수는 프로그래밍에서 중요한 개념입니다. 변수란 여러 번 사용될 수 있게 이름을 붙인 거랍니다. 작성한 코드를 다 기억할 필요없이 코드를 읽기 쉽게 하기 위해 사용하지요. 프로그래머들은 변수를 사용해 데이터를 저장합니다.

`name`이라는 새로운 변수를 만들어 보세요.

{% filename %}command-line{% endfilename %}
```python
>>> name = "Ola"
```

봤죠? 간단해요. 매우 쉬어요! "이름은 올라와 같다"라고 쓰는 거에요.

여러분도 알겠지만, 프로그램은 이전에 수행한 내용을 보여주지 않아요. 그렇다면 변수값을 알려면 어떻게 해야할까요? `name`를 입력하고 `엔터`를 입력하세요.

{% filename %}command-line{% endfilename %}
```python
>>> name
'Ola'
```

야호! `name`은 여러분이 만든 첫 변수랍니다! :) 언제든지 변수값을 바꿀 수 있어요.

{% filename %}command-line{% endfilename %}
```python
>>> name = "Sonja"
>>> name
'Sonja'
```

또 함수 안에 변수명을 사용할 수 있습니다.

{% filename %}command-line{% endfilename %}
```python
>>> len(name)
5
```

멋지죠? 물론 변수는 무엇이든지 담을 수 있으니, 당연히 숫자도 가능하죠! 해봅시다. :

{% filename %}command-line{% endfilename %}
```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

그런데 만약 잘못된 변수명을 입력하면 어떻게 나올까요?

{% filename %}command-line{% endfilename %}
```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

에러가 나타났네요! 보다시피, 파이썬에는 많은 종류의 오류들이 있습니다. **NameError**는 그 중 하나입니다. 파이썬은 아직 정의하지 않은 변수를 사용하면 이 오류를 보여줍니다. 나중에도 **NameError**라는 오류를 보게 된다면, 이름에 오타가 있는지 확인해야겠죠.

조금 더 변수와 놀아봅시다. 그리고 어떤 것들을 할 수 있는지 살펴보아요!


## print() 함수

아래와 코드를 따라 입력해보세요. :

{% filename %}command-line{% endfilename %}
```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

`name`을 쳤을 때, 파이썬 해석기는 'name' 변수의 문자열 *표현(representatio)*으로 응답하는데, 그 모양은 작은따옴표('')로 둘러싸인 M-a-r-i-a 문자입니다. `print(name)`라고 치면, 파이썬은 화면에 따옴표없이 더 깔끔한 화면을 보여(`print`)줍니다.

나중에 차차 알게 될 거지만, `print()`는 함수 안에 있는 내용을 출력할 때, 여러 내용들을 확인하고 싶을 때 유용하게 사용됩니다.


## 리스트(List)

문자열과 정수 외에도 객체를 정렬할 수 있는 여러 방법들이 있습니다. **리스트**라고 불리는 아이에 대해 알아봅시다. 리스트란 서로 다른 객체들을 일렬로 나열한 것이라고 생각하시면 됩니다.

아래와 같이 리스트를 만듭시다. :

{% filename %}command-line{% endfilename %}
```python
>>> []
[]
```

리스트가 비어있네요. 별로 유용해 보이지 않죠? 이제 로또 번호 목록을 만들어 봅시다. 매번 직접 우리가 반복하기는 귀찮으니, 리스트에 변수를 넣어봅시다.

{% filename %}command-line{% endfilename %}
```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

좋아요, 리스트를 만들었어요! 이제 무엇을 할 수 있을까요? 리스트 안에 들어간 로또 번호는 몇 개인지 알려면 어떻게 해야할까요? `len()`함수를 사용할 수 있겠죠? 이미 앞에서 해봤어요!

{% filename %}command-line{% endfilename %}
```python
>>> len(lottery)
6
```

네! `len()`함수는 리스트 안에 있는 객체의 수를 알려줍니다. 유용하죠? 이제 정렬을 해봅시다.

{% filename %}command-line{% endfilename %}
```python
>>> lottery.sort()
```

숫자를 오름차순으로 정렬했지만 출력값이 보이지 않네요. 어떻게 변했는지 리스트를 출력해 확인해봅시다. :

{% filename %}command-line{% endfilename %}
```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

리스트 안에 있는 숫자들은 오름차순으로 정렬되었어요. 잘했습니다!

이번에는 내림차순으로 정렬해볼까요?

{% filename %}command-line{% endfilename %}
```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

참 쉽죠? 여러분이 리스트에 새로운 값을 추가하고 싶다면 이렇게 해보세요. :

{% filename %}command-line{% endfilename %}
```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

첫 번째 숫자 하나만 보여주고 싶다면, **인덱스(indexes)**를 사용하세요. 인덱스는 리스트 내 아이템 위치를 나타내는 숫자입니다. 프로그래머는 0부터 세는 것을 선호합니다. 따라서 리스트에 있는 첫 번째 객체는 인덱스 0부터 시작하고, 그 다음은 1, 그 다음은 2.. 순번대로 번호를 매길 수 있습니다. `.[index숫자]`를 입력해볼까요.

{% filename %}command-line{% endfilename %}
```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

이렇게 리스트 이름과 대괄호`([])`안 객체의 인덱스를 사용해서, 리스트 안에 있는 다른 객체로도 접근이 가능합니다.

리스트 내 아이템을 지우려면 인덱스와 함께 `pop()`메소드를 사용하면 됩니다. 아래 예제 코드를 따라하면서 배운 내용을 다시 기억해봅시다. 리스트에 맨 처음 있는 객체를 삭제해봅시다.

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

마법 같지 않나요!

재미로 몇 번 더 여러 인덱스를 테스트해보세요: 6, 7, 1000, -1, -6, -1000 등이요. 결과값을 보기 전에 미리 정답을 유추해보세요. 생각했던 정답이 나왔나요?

이번 장에서 배운 리스트 메서드와 관련된 모든 내용은 파이썬 공식 문서에서 있습니다. :https://docs.python.org/3/tutorial/datastructures.html

## 딕셔너리(Dictionary)

> 집에서 학습하시는 분들은 [파이썬 기초: 딕셔너리(Dictionaries)](https://www.youtube.com/watch?v=ZX1CVvZLE6c) 영상을 보세요.

딕셔너리는 리스트와 유사하지만, 인덱스가 아닌 키(key)로 값을 찾습니다. 키는 문자열이든, 숫자든지 상관없습니다. 빈 딕셔너리를 만드는 문법은 아래와 같습니다.

{% filename %}command-line{% endfilename %}
```python
>>> {}
{}
```

방금 비어있는 딕셔너리를 하나 만들었답니다. 만세!

자, 이제 아래 명령어를 따라 작성해 봅시다. (딕셔너리 안에 있는 값은 마음대로 수정해도 됩니다)

{% filename %}command-line{% endfilename %}
```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```


위 명령어로 `paticipant`라는 새 변수를 만들었습니다. 이 변수 안에는 3개의 키-값 쌍이 들어있어요.

*   키(key) 는 `name`이고, 값(value) 는 `'Ola'`를 가리킵니다. (`string`입니다)
*   키 `country`의 값은 `'Poland'`입니다. (또 다른 `string`입니다)
*   그리고 키 `favorite_numbers`는 `[7, 42, 92]`를 가리킵니다. (`list`에 숫자 세 개가 있습니다)

아래와 같은 문법으로 개별 키의 값에 접근할 수 있습니다.

{% filename %}command-line{% endfilename %}
```python
>>> print(participant['name'])
Ola
```

리스트와 조금 비슷해보이지만 인덱스가 아닌, 이름을 사용해 값을 찾는다는 것을 기억하세요.

만약 파이썬에 키(key)에 대응하는 값이 없다면 어떻게 될까요? 그럼 테스트 해봅시다!

{% filename %}command-line{% endfilename %}
```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

보세요, **KeyError**에러가 났습니다. 파이썬은 친절하게 `'age'`키가 딕셔너리에 존재하지 않는다고 알려주네요.

그렇다면 언제 딕셔너리를 쓰고, 언제 리스트를 사용해야할까요? 이를 위한 판단 기준은 다음과 같습니다.

*   리스트 : 아이템 정렬이 필요할 때
*   딕셔너리 : 키(key)과 값(value)이 서로 연관되어 있거나, 효과적으로 (키를 사용해서) 어떤 값을 찾을 때

딕셔너리는 리스트와 유사하지만, *변경(mutable)*할 수 있습니다. 딕셔너리가 만들어진 후에도, 그 값을 마음대로 변경할 수 있다는 뜻이지요. 키/값을 나중에 추가할 수 있답니다.

 {% filename %}command-line{% endfilename %}
```python
>>> participant['favorite_language'] = 'Python'
```

리스트처럼 딕셔너리도 `len()`메서드를 사용하여 키-값 쌍의 수를 리턴합니다. 한 번 커맨드라인에서 확인합시다.

{% filename %}command-line{% endfilename %}
```python
>>> len(participant)
4
```

다들 이해를 잘 하고 있으리라 믿어요 :) 딕셔너리로 좀 더 재미있는 것을 해볼까요?

`pop()`메소드로 딕셔너리에 있는 아이템을 삭제해봅시다. 아래 예제를 따라서 `'favorite_numbers'` 키를 삭제해봅시다.

{% filename %}command-line{% endfilename %}
```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

'favorite_numbers' 에 해당하는 키-값 쌍이 삭제되었네요.

키에 해당하는 값도 변경할 수 있습니다. 이렇게 해보세요. :

{% filename %}command-line{% endfilename %}
```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

`'country'` 키에 해당하는 값이 `'Poland'`에서 `'Germany'`로 변경되었네요. :) 재미있죠? 야호! 또 굉장한 것을 배웠네요.

### 요약

훌륭하네요! 이제 모두가 프로그래밍에 대해서 많은 것을 알게 되었어요. 지금까지 우리가 배운 내용을 정리해볼까요.

*   **에러** - 파이썬이 작성된 명령어를 이해하지 못할 때 에러가 발생합니다.
*   **변수** - 객체에 적절한 이름을 붙여 코드를 가독성 좋게 작성할 수 있습니다.
*   **리스트** - 특정한 순서로 정렬된 객체들이 저장된 목록입니다.
*   **딕셔너리** - 키(key)-값(value) 쌍으로 이루어진 객체들이 저장됩니다.

다음 내용이 기대되나요? :)

## 비교하기

> 집에서 학습하시는 분들은 [파이썬 기초: 비교연산자(Comparisons)](https://www.youtube.com/watch?v=ZX1CVvZLE6c) 영상을 보세요.

비교는 프로그래밍에서 매우 중요한 부분이에요. 비교를 할 때, 제일 쉬운 방법은 무엇일까요? 바로 숫자입니다. 어떻게 하는지 알아볼게요. :

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

파이썬이 두 숫자를 비교했네요. 파이썬은 메서드 결과도 비교 가능합니다. 멋지죠?

두 숫자를 비교할 때 왜 등호 부호 `==`를 사용하는지 궁금했죠? 변수에 값을 넣을 때 등호 기호`=` 하나만 사용했기 때문에, 두 대상이 같은지 서로 비교하기 위해서는 **항상** 두 개의 등호 기호 `==`를 사용해야 합니다. 마찬가지로 서로 다른 대상일 경우에는 `!=` 기호를 사용합니다.

두 번 더 테스트 해볼게요. :

{% filename %}command-line{% endfilename %}
```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```


`>`와 `<`는 알겠는데, 그렇다면 `>=`와 `<=`는 무슨 뜻일까요? 아래 내용을 읽어보세요. :

- x `>` y : x는 y보다 크다
- x `<` : x는 y보다 작다
- x `<=` : x가 y보다 작거나 같다
- x `>=` : x가 y보다 크거나 같다

잘했어요! 좀 더 해볼까요?

{% filename %}command-line{% endfilename %}
```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

파이썬은 얼마든지 원하는 만큼 숫자를 비교할 수 있고 답을 알려줄 거랍니다! 똑똑한 녀석이죠?

- **and** - `and` 연산자는, 두 값 모두 참(`True`)일 경우에만 결과가 참(`True`)이 됩니다.
- **or** - `or` 연산자는, 둘 중 하나만 참(`True`)일 경우에 결과가 참(`True`)이 됩니다.

"사과를 오렌지에 비교하기"라는 말을 들어본 적이 있나요? 파이썬에게 시켜봅시다.

{% filename %}command-line{% endfilename %}
```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

이처럼 파이썬은 숫자(`int`)와 문자열(`str`)을 비교할 수 없어요. 대신 **TypeError**를 보여줘 두 타입이 서로 비교 대상이 아니라는 것을 알려줍니다.

## Boolean(불리언)

방금 전 파이썬의 새로운 객체 종류를 배웠는데요. 바로 **Boolean**입니다. 이번 장에서 가장 쉬운 내용이에요.

불리언의 객체 두가지 입니다.
- True(참)
- False(거짓)

파이썬은 항상`True`라고 써야 이해합니다. 첫 글자가 대문자고 나머지는 소문자여야만, Boolean으로 이해합니다. **true, TRUE, tRUE는 모두 틀린 표현이에요. -- `True`만 올바른 표현입니다.** (`False`도 마찬가지입니다)

불리언을 변수로 사용할 수도 있습니다! 아래 코드를 실행해보세요.

{% filename %}command-line{% endfilename %}
```python
>>> a = True
>>> a
True
```

또 이런 방법으로도 쓸 수 있습니다.

{% filename %}command-line{% endfilename %}
```python
>>> a = 2 > 5
>>> a
False
```

아래 명령어를 실행해보면서 불리언을 가지고 놀아보세요.

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

축하합니다! 불리언은 프로그래밍에 있어서 가장 멋진 기능 중 하나에요. 여러분은 불리언을 앞으로 어떻게 사용해야 하는지 방금 배웠답니다!

# 코드 저장하기!

> **Note** 집에서 학습하는 분들은 [파이썬 기초: 파일 저장 및 "If" 조건문](https://www.youtube.com/watch?v=dOAg6QVAxyk) 영상을 보세요.


지금까지 우리는 인터프리터(interpreter)에서 파이썬 코드를 입력해 왔어요. 한 번에 코드 한 줄만 입력할 수 있었어요. 일반적으로 프로그램은 파일로 저장되어 프로그래밍 언어 **인터프리터(interpreter)** 또는 **컴파일러(complier)**로 실행됩니다. 지금까지 우리는 파이썬 **인터프리터**에서 한 줄씩 코드를 입력해 프로그램을 실행시켰어요. 이제 앞으로는 한 줄 이상 더 많은 코드를 작성해 실행해 볼 거에요. 빨리 해볼게요.

*   파이썬 인터프리터를 종료하세요.
*   선택한 코드 에디터를 실행하세요.
*   코드를 새 파이썬 파일로 저장하세요.
*   실행하세요!

사용했던 파이썬 인터프리터를 종료하려면, `exit()`함수를 입력하세요.

{% filename %}command-line{% endfilename %}
```python
>>> exit()
$
```

그러면 커맨드 프롬프트(또는 콘솔)가 초기화됩니다.

앞서 우리는 [코드 에디터](../code_editor/README.md) 장에서 사용할 에디터를 정했습니다. 이제 에디터를 실행해 코드를 작성하고 새 파일로 저장합니다.

{% filename %}editor{% endfilename %}
```python
print('Hello, Django girls!')
```

당연히 여러분은 숙련된 파이썬 개발자에요. 지금 배운 코드를 자유롭게 작성해보세요.

이제 파일명과 함께 저장해야합니다. 파일명을 ** python_intro.py **이라고 붙이고 데스크탑에 저장해 봅시다. 파일명은 마음대로 써도 되지만 파일 확장자는 __.py__ 로 끝나야합니다. **.py**파일 확장자로 운영체제에게 **파이썬 실행 파일**이니 파이썬을 실행하라고 지시합니다.


> **Note** 코드 에디터의 멋진 기능을 알고 있어야 해요. 파이썬 콘솔에서는 모든 코드가 같은 색이였지만, 코드 에디터에는 `print()`함수와 문자열이 다른 색상으로 구분되었어요. 이를 `문법 하이라이팅(syntax highlighting)`하는데, 코딩할 때 필요한 기능입니다. 색상로 구분을 파악할 수 있고 오류도 확인할 수 있어요. 예를 들어, 문자열이 제대로 닫히지 않았다던가, 특정 키워드(함수에서 사용하는 `def`)를 사용할 때, 다른 색상으로 구분되기 때문에 쉽게 파악이 가능합니다. 그래서 코드 에디터를 사용하는 거랍니다. :)

파일을 저장했다면, 커맨드라인 장에서 배웠던 것을 써먹어야죠! 터미널에서 데스크탑(또는 Desktop, 바탕화면)으로 **디렉토리 변경**을 해보세요.

<!--sec data-title="OS X" data-id="python_OSX"
data-collapse=true ces-->

맥OS :

{% filename %}command-line{% endfilename %}
```
$ cd ~/Desktop
```
<!--endsec-->

<!--sec data-title="Linux" data-id="python_linux"
data-collapse=true ces-->

리눅스 :
{% filename %}command-line{% endfilename %}
```
$ cd ~/Desktop
```

<!--endsec-->

<!--sec data-title="Windows" data-id="python_windows" data-collapse=true ces-->

윈도우 :

{% filename %}command-line{% endfilename %}
```
> cd %HomePath%\Desktop
```
<!--endsec-->

따라하다 어려움이 있다면, 코치에게 도움을 요청하세요.

파일 내 코드를 실행하기 위해 파이썬을 불러봅시다.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hello, Django girls!
```

> **Note** 윈도우에서 'python3' 명령어를 인식하지 못하면 'python'라고 입력하세요.


잘했어요! 드디어 파이썬 프로그램이 저장된 파일을 실행했어요. 뿌듯하죠?

다음으로 프로그래밍의 필수 도구를 배울 차례에요.

## If...elif...else

대부분의 코드는 조건문을 만났을 때 실행됩니다. 파이썬은 **if**문을 사용합니다.

**python_intro.py** 파일을 다음과 같이 수정하세요.

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
```

저장하고 실행하면 아래와 같은 에러가 보일 거에요.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
File "python_intro.py", line 2
         ^
SyntaxError: unexpected EOF while parsing
```

파이썬은 조건문 `3 > 2`가 참인 경우(또는 값이 `True`인 경우)에 어떻게 할 것인지 물어보네요. 이 경우에 파이썬이 "It works!"를 출력하게 해봅시다. **python_intro.py** 파일을 아래와 같이 수정하세요.

{% filename %}python_intro.py{% endfilename %}
```python
if 3 > 2:
    print('It works!')
```

두 번째 줄에 들여쓰기 된 코드에 스페이스 4칸을 준 게 보이나요? 조건의 결과(`3 > 2`) 가 참일 경우에, 실행할 코드에 들여쓰기를 해줘야 합니다. 물론 스페이스 한 칸만 띄울 수 있지만, 거의 모든 파이썬 프로그래머들은 코드를 정갈하게 작성하기 위해 4칸을 사용해요. `탭(tab)`한 번은 들여쓰기 4칸과 같습니다.

이제 저장하고 실행해보세요.

{% filename %}command-line{% endfilename %}
```python
$ python3 python_intro.py
It works!
```

### 조건이 참(True) 이 아니라면 어떻게 되나요?

앞 예제에서 조건이 참(`True`)인 경우에만 실행되게 만들었어요. 하지만 파이썬은 `elif`문과 `else`문도 사용할 수 있습니다.

{% filename %}python_intro.py{% endfilename %}
```python
if 5 > 2:
    print('5 is indeed greater than 2')
else:
    print('5 is not greater than 2')
```

실행하면 다음과 같이 출력됩니다.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
5 is indeed greater than 2
```

만약 2가 5보다 크다면 두번째 명령이 실행됩니다. 참 쉽죠? 이제 `elif`가 어떻게 작동하는지 봅시다.

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

그리고 실행해보세요.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hey Sonja!
```

어떻게 됐나요? `elif`문은 맨 처음 조건이 아닐 경우 그 다음 조건을 처리하게 해줍니다.

`if` 문을 쓴 다음에 원하는 만큼 `elif` 문을 계속 추가할 수 있어요. 이렇게요.

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
```
$ python3 python_intro.py
Perfect, I can hear all the details
```
## 주석(Comments)

주석은 `#`으로 시작하는 줄입니다. 파이썬은 `#`의 내용을 무시합니다. 주석은 코드를 읽는 다른 사람들이 보다 쉽게 이해할 수 있도록 작성합니다.

아래 예제를 보세요. :

{% filename %}python_intro.py{% endfilename %}
```python
# volume 값을 바꿔보세요
if volume < 20 or volume > 80:
    volume = 50
    print("That's better!")
```

모든 라인마다 주석을 작성할 필요는 없지만, 코드의 역할과 복잡한 수행 내용을 정리 요약할 때 사용됩니다.

### 요약

지금까지 배운 내용을 정리해봅시다.

- **비교하기** - 파이썬에서 `>`, `>=`, `==`, `<=`, `<` 그리고 `and`, `or` 연산자를 사용해 비교합니다.
- **불리언(Boolean)** -두 둘 중 하나의 값만 가질 수 있는 객체입니다. `True` 또는 `False`
- **파일 저장하기** - 복잡한 프로그램을 실행할 수 있도록 코드를 파일로 저장합니다.
- **`if`...`elif`...`else`** - 조건문을 작성해 특정 조건이 주어졌을 때만 코드가 실행되도록 만듭니다.

드디어 이번 장의 마지막 부분입니다!

## 나만의 함수 만들기!

> **Note** 집에서 학습하는 분들은 [파이썬 기초: 함수](https://www.youtube.com/watch?v=5owr-6suOl0) 영상을 보세요.

앞에서 했던 `len()`와 같은 함수를 사용했었죠? 지금부터는 직접 함수를 만드는 법을 배울 거에요!

함수는 파이썬이 명령어의 나열이에요. 파이썬의 각 함수는 `def`로 시작하고, 이름을 붙일 수 있고, 여러 매개변수를 가질 수 있어요. 쉬운 것부터 시작할게요. **python_intro.py** 파일을 열어 코드를 다음과 같이 고치세요.

{% filename %}python_intro.py{% endfilename %}
```python
def hi():
    print('Hi there!')
    print('How are you?')

hi()
```

우리가 만든 첫 번째 함수네요!

파일 맨 밑에 왜 함수의 이름을 적었는지 궁금할 거에요.왜냐하면 파이썬은 파일을 위에서 아래로 읽어 실행하기 때문이에요. 함수를 사용하기 위해서는 하단에 다시 적어야 합니다.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi there!
How are you?
```

> **Note** 동작하지 않더라도 당황하지 마십시오! 에러 메세지와 출력값은 원인을 파악하고 해결할 수 있게 도와줍니다.
- `NameError`에러는 잘못 입력한 내용이 있을 때 발생합니다. `def hi () :`로 함수를 생성 할 때와`hi ()`로 호출 할 때 같은 이름을 사용했는지 확인하세요.
- `IndentationError`에러가 나오면, `print` 라인 둘 다 라인의 시작 부분에 같은 공백을 가지고 있는지 확인하세요. 파이썬은 함수 안의 모든 코드가 깔끔하게 정렬되어야합니다.
- 출력값이 보이지 않는다면 마지막 `hi()`가 *들여쓰기가 되었는지* 를 확인하세요. - 들여쓰기가 된 행은 함수의 일부가 되기 떄문에 실행되지 않습니다.


다음으로 매개 변수와 함께 첫 번째 함수를 만들어 볼게요. 전에 사용했던 예제를 다시 사용할 거에요. 함수를 실행하면, 이름을 부르고 'hi'를 말하게요.

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
```

함수에 매개변수인 `name`를 넣었어요. :

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

> **Note**: `if`문 안의 `print()`함수는 4칸을 들여쓰기 했습니다. 조건문에 해당하는 경우에만 실행되게 만들기 위해서에요. 이제 어떻게 되는지 보세요.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Traceback (most recent call last):
File "python_intro.py", line 10, in <module>
  hi()
TypeError: hi() missing 1 required positional argument: 'name'
```

이런, 에러가 나왔네요. 다행히도, 파이썬 에러는 유용한 오류 메세지를 보여준답니다. 에러 메시지를 보면 함수 `hi()`가 한 개의 인자값(`name`) 을 필요로 하는데, 그 함수를 호출할 때 빼먹고 실행했다는 것을 알려주고 있어요. 이제 아래와 같이 코드를 수정해봅시다.

{% filename %}python_intro.py{% endfilename %}
```python
hi("Ola")
```

그리고 다시 실행해보세요.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Ola!
```

이름을 바꿔볼까요?

{% filename %}python_intro.py{% endfilename %}
```python
hi("Sonja")
```

그리고 실행하세요.

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Sonja!
```


이제 다른 이름(Ola와 Sonja가 아닌)을 넣는다면 어떻게 될까요? 아래처럼 나오게 만들어보세요. :

{% filename %}command-line{% endfilename %}
```
Hi anonymous!
```

어때요, 정말 굉장하지 않나요? 이로써 인사 함수가 호출될 때마다, 매번 사람 이름을 반복할 필요가 없어요. 그래서 함수가 필요답니다. 매번 똑같은 코드를 반복해 작성하지 않아도 돼요!

좀 더 똑똑하게 만들어 볼게요. - 2명 이상 이름이 있는 경우, 모든 이름마다 조건문을 추가하는 건 꽤 귀찮은 일이 될거에요. 그렇죠?

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

이제 코드를 실행해 봅시다. :

{% filename %}command-line{% endfilename %}
```
$ python3 python_intro.py
Hi Rachel!
```

축하합니다! 우리는 이제 함수를 만들 수 있게 되었어요! :)

## 반복하기

> 집에서 학습하는 분들은 [파이썬 기초: For 문](https://www.youtube.com/watch?v=aEA6Rc86HF0) 영상을 보세요.

이제 마지막 부분입니다. 금방 했죠? :)

프로그래머는 반복되는 일을 하는 것을 좋아하지 않아요. 프로그래밍은 모든 것을 자동화하는 것입니다. 모든 사람의 이름을 일일이 입력해서 hi 라는 메세지를 출력하게 만들고 싶지 않겠죠. 반복문을 사용하면 이를 해결할 수 있습니다.

리스트를 기억하고 있죠? 아래 girls 리스트를 보세요.

{% filename %}python_intro.py{% endfilename %}
```python
girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
```

우리는 여자 아이들 이름을 불러 인사를 하고 싶어요. 우리는 이미 `hi` 함수를 만들었으니 반복문을 사용해봅시다. :

{% filename %}python_intro.py{% endfilename %}
```python
for name in girls:
```

The ```for```문은 ```if```문과  다음 줄은 4칸 들여쓰기를 해야합니다.

아래 완성된 코드입니다.

{% filename %}python_intro.py{% endfilename %}
```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

실행하면 다음과 같습니다.

{% filename %}command-line{% endfilename %}
```
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
```


`girls` 리스트의 요소마다 여러분이 `for`문에 넣은, 들여쓰기를 한 모든 코드들이 반복됩니다.

`for`문에 `range()` 함수로 숫자범위를 지정해 사용할 수 있어요.

{% filename %}python_intro.py{% endfilename %}
```python
for i in range(1, 6):
    print(i)
```

이렇게 출력됩니다.

{% filename %}command-line{% endfilename %}
```
1
2
3
4
5
```

`range()`는 매개변수로 넘겨진 숫자부터 시작하는 숫자 리스트를 만들어주는 함수입니다.

두 숫자 중 두 번째(마지막)숫자는 리스트에 포함되지 않는다는 것을 기억하세요. (즉 `range(1, 6)`는 1부터 5까지 카운트 하며 숫자 6은 리스트에 포함되지 않습니다) "range()"는 반만 열려 있기 때문에, 첫번째 숫자는 포함되지만 마지막 숫자는 포함되지 않아요.

## 요약

이제 다 끝났어요. **모두 정말 대단해요!** 지금까지 어려운 내용을 잘 따라온 여러분들이 정말 자랑스러워요!

다음 장으로 가기전에 잠시 쉬는 시간을 가져도 좋아요. 스트레칭을 하던가, 잠깐 산책을 하던가, 눈을 쉬게 한다던가 말이죠. :)

![Cupcake](images/cupcake.png)
