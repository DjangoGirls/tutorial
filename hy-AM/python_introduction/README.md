{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Ներածություն Python- ին

> Այս գլխի մի մասը հիմնված է Geek Girls Carrots- ի (https://github.com/ggcarrots/django-carrots) ձեռնարկների վրա:

Եկեք գրենք մի քանի ծրագրեր:

## Python prompt (կահակալ)

> Ընթերցողների համար տանը. Այս մասը ներառված է [ Python Basics: Integers, Strings, Lists, Variables and Errors (Python- ի հիմունքներ. Ամբողջ թվեր, տողեր, ցուցակներ, փոփոխականներ և սխալներ) ](https://www.youtube.com/watch?v=MO63L4s-20U) տեսանյութում:

Python- ի հետ խաղալու համար մենք պետք է ձեր համակարգչում բացենք * command line (հրամանի տող)*: Դուք արդեն պետք է իմանաք, թե ինչպես դա անել. Դուք դա սովորել եք [ Intro to Command Line (Հրամանի տողի ներածություն) ](../intro_to_command_line/README.md) գլխում:

Պատրաստ լինելուց հետո հետևեք ստորև ներկայացված հրահանգներին:

Մենք ուզում ենք Python կոնսոլ բացել, այնպես որ Windows- ում մուտքագրեք ` python ` կամ Mac OS / Linux համակարգում ` python3 ` և սեղմեք ` enter `:

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Ձեր առաջին Python command-ը (հրամանը):

Python հրամանը գործարկելուց հետո հուշումը փոխվեց `>>>`. Մեզ համար սա նշանակում է, որ առայժմ մենք կարող ենք օգտագործել միայն Python լեզվով հրամաններ: Պետք չէ մուտքագրել `>>>` - Python- ը դա կանի ձեզ համար:

Եթե ​​ցանկանում եք ցանկացած պահի դուրս գալ Python- ի վահանակից, մուտքագրեք ` ելք () ` կամ օգտագործեք դյուրանցում ` Ctrl + Z ` Windows- ի և ` Ctrl + D ` Mac / Linux- ի համար: Այդ դեպքում `>>>`այլևս չեք տեսնի:

Առայժմ մենք չենք ցանկանում դուրս գալ Python կոնսոլից: Մենք ուզում ենք ավելին իմանալ դրա մասին: Եկեք սկսենք մուտքագրել մի քանի մաթեմատիկա, ինչպիսին է ` 2 + 3 ` և սեղմելով ` մուտքագրումը `:

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Հոյակապ. Տեսեք, թե ինչպես հայտնվեց պատասխանը: Python- ը գիտի մաթեմատիկա: Կարող եք փորձել այլ հրամաններ, ինչպիսիք են ՝

- `4 * 5`
- `5 - 1`
- `40 / 2`

Էքսպոնենտալ հաշվարկ կատարելու համար ասենք 2 հզորության 3-ը ՝ մենք մուտքագրում ենք. {% filename %}command-line (հրամանի տող){% endfilename %}

```python
>>> 2 ** 3
8
```

Մի փոքր զվարճացեք դրանով, ապա վերադառնաք այստեղ :)

Ինչպես տեսնում եք, Python- ը հիանալի հաշվիչ է: Եթե ​​մտածում եք, թե էլ ինչ կարող եք անել ...

## Strings (տողեր)

Ինչ վերաբերում է ձեր անունին: Մուտքագրեք ձեր անունը այսպիսի մեջբերումներում. 

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

Դուք այժմ ստեղծել եք ձեր առաջին string-ը (տողը): Դա նիշերի հաջորդականություն է, որը կարող է մշակվել համակարգչի կողմից: String-ը միշտ պետք է սկսվի և ավարտվի նույն նիշով: Սա կարող է լինել միայնակ (` '`) կամ կրկնակի (` "`) մեջբերումներ (տարբերություն չկա:) Գնանշումները Python- ին ասում են, որ իրենց մեջ եղածը string է:

String-երը կարելի է միասին դնել: Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

Դուք կարող եք նաև բազմապատկել տողերը մի թվով.

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Եթե ​​ձեզ հարկավոր է ապոստերֆ դնել ձեր string-ի ներսում, ապա դա անելու երկու եղանակ ունեք:

Օգտագործելով կրկնակի գնանշումներ.

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

կամ հետադարձ աղեղից խուսափելուց (`\`):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Հետաքրքիր է, ոչ: Ձեր անունը մեծատառով տեսնելու համար մուտքագրեք ՝

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

Դուք հենց ձեր string-ի (տողի) վրա օգտագործեցիք ` upper(վերին) ` ** method(մեթոդը)**: Մեթոդը (ինչպիսին է ` upper() (վերին ()) `) հրահանգների հաջորդականությունն է, որը Python- ը պետք է կատարի տվյալ օբյեկտի վրա (` «Օլա» `), երբ այն զանգահարեք:

Եթե ​​ուզում եք իմանալ ձեր անվան մեջ պարունակվող տառերի քանակը, դրա համար կա **function ( գործառույթ) **:

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

Հետաքրքիր է, թե ինչու եք երբեմն function-ներ (ֆունկցիաներ) կանչում a `.` String-ի (տողի) վերջում (ինչպես ` "Ola".upper()  `) և երբեմն նախ կանչում ես ֆունկցիա և string-ը դնում փակագծերում: Դե, որոշ դեպքերում function-ները (ֆունկցիաները) պատկանում են object-ների (օբյեկտների), ինչպես, օրինակ, ` վերին () `, որը կարող է կատարվել միայն տողերի վրա: Այս դեպքում մենք function (ֆունկցիան) անվանում ենք ** method (մեթոդ) **: Այլ ֆունկցիաներ, գործառույթները չեն պատկանում որևէ կոնկրետ բանի և կարող են օգտագործվել տարբեր տեսակի օբյեկտների վրա, ինչպես ` len () `: Այդ պատճառով մենք`"Ola"` որպես պարամետր ենք տալիս `len` գֆունկցիաին:

### Ամփոփում

Լավ, բավական է string-եր: Մինչ այժմ իմացել եք.

- ** prompt-ը** - Python- ի մեջ հրահանգներ (code / կոդ) մուտքագրելը Python- ում տալիս է պատասխաններ
- **numbers and strings (թվերն ու տողերը) ** - Python- ի համարներում օգտագործվում են մաթեմատիկայի համար, իսկ string-երը `տեքստային object- ների (օբյեկտների) համար
- ** operators (օպերատորները) ** - ինչպիսիք են ` + ` և ` * `, միավորում են արժեքները ՝ նորը արտադրելու համար
- ** function-ներ ** - ինչպես ` upper() ` և ` len() `, գործողություններ կատարել օբյեկտների վրա:

Սրանք յուրաքանչյուր սովորած ծրագրավորման լեզվի հիմունքներն են: Պատրա՞ստ եք ավելի դժվար բանի:

## Errors (Սխալներ)

Փորձենք մի նոր բան: Կարո՞ղ ենք համարի երկարությունը ստանալ նույն կերպ, ինչպես կարող էինք պարզել մեր անվան երկարությունը: Մուտքագրեք ` len(304023) ` և սեղմեք ` enter `:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

Մենք ստացանք մեր առաջին սխալը: {{ warning_icon }} icon-ը (պատկերակը) ձեզ նախապատվություն տալու այն ձևն է, որ այն կոդը, որը պատրաստվում եք գործարկել, չի աշխատի ինչպես սպասվում էր: Սխալներ թույլ տալը (նույնիսկ դիտավորյալները) ուսման կարևոր մասն է:

Այն ասում է, որ «int» տեսակի object-ները (օբյեկտները) (integers/ ամբողջ թվեր) երկարություն չունեն: Այսպիսով, ի՞նչ կարող ենք անել հիմա: Միգուցե կարո՞ղ ենք մեր թիվը գրել որպես string: String-երն ունեն length (երկարություն), չէ՞:

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Դա աշխատեց! Մենք ` str ` գործառույթի ներսում օգտագործեցինք ` str() ` function-ը: ` str() ` ամեն ինչ վերածում է string-երի:

- ` str ` function (ֆունկցիան) իրերը վերափոխում է ** string-երի **
- ` int ` function (ֆունկցիան) իրերը վերափոխում է ** integers **

> Կարևոր. Մենք կարող ենք թվերը վերածել տեքստի, բայց պարտադիր չէ, որ տեքստը վերածենք թվերի. Ի՞նչ կլինի ամեն դեպքում `int('hello') `:

## Variables (Փոփոխականներ)

Mingրագրավորման կարևոր հայեցակարգը variable- ներն (փոփոխականներն) են: Varaible-ը (Փոփոխականը) ոչ այլ ինչ է, քան ինչ-որ բանի անուն, այնպես որ այն հետագայում կարող եք օգտագործել: ծրագրավորողներ օգտագործում են այս փոփոխականները տվյալներ պահելու, իրենց կոդերն ավելի ընթեռնելի դարձնելու համար և ստիպված չեն անընդհատ հիշել, թե ինչ բաներ են:

Ասենք, որ ուզում ենք ստեղծել նոր variable (փոփոխական), որը կոչվում է ` name (անուն) `:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

Մենք մուտքագրում ենք name-ը (անունը) հավասար է Ola:

Ինչպես նկատել եք, ձեր ծրագիրը չի վերադարձրել այլ բան, ինչպես նախկինում էր: Այսպիսով, ինչպե՞ս իմանանք, որ variable-ն (փոփոխականն) իրականում գոյություն ունի: Մուտքագրեք ` name (անունը) ` և սեղմեք ` enter (մուտքագրեք) `

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Ձեր առաջին variable-ը փոփոխականը! :) Դուք միշտ կարող եք փոխել այն, ինչին վերաբերում է.

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

Այն կարող եք օգտագործել նաև function-ներում.

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Հիանալի է, չէ՞: Այժմ variable-ները (փոփոխականները )կարող են լինել ցանկացած ՝ թվեր նույնպես: Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Բայց ի՞նչ կլինի, եթե մենք սխալ անուն օգտագործենք: Կարո՞ղ եք գուշակել, թե ինչ կլինի: Արի փորձենք!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Սխալ! Ինչպես տեսնում եք, Python- ն ունի տարբեր տեսակի սխալներ, և այս մեկը կոչվում է ** NameError **: Python- ը ձեզ կտա այս սխալը, եթե փորձեք օգտագործել դեռ չսահմանված variable (փոփոխական): Եթե ​​ավելի ուշ այս սխալի եք բախվել, ստուգեք ձեր կոդը ՝ ստուգելու համար, արդյոք սխալ եք մուտքագրել որևէ անուն:

Մի փոքր խաղացեք սրա հետ և տեսեք, թե ինչ կարող եք անել:

## Print function (Տպման գործառույթը)

Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Երբ դուք պարզապես մուտքագրում եք ` name (անուն)`, Python- ի թարգմանիչը պատասխանում է 'name' variable (փոփոխական) string-ի (տող) * ներկայացմամբ* , որը M-a-r-i-a տառերն են, որոնք շրջապատված են մեկ չակերտով, ": Երբ ասում եք ` տպել (անունը) `, Python- ը "print"-կանի («կտպագրի») variable-ի պարունակությունը էկրանին ՝ առանց չակերտների, որը ավելի կոկիկ է:

Ինչպես կտեսնենք ավելի ուշ, ` print () ` - ը օգտակար է նաև այն ժամանակ, երբ մենք ուզում ենք գործերը ներսից function-ներ տպել, կամ երբ ուզում ենք իրեր տպել բազմաթիվ տողերի վրա:

## Lists (ցուցակները)

String-երի և integer-ի (թվերի) հետ մեկտեղ Python- ն ունի ամենատարբեր տեսակի object-ներ (օբյեկտներ): Այժմ մենք պատրաստվում ենք ներկայացնել մեկը, որը կոչվում է ** list (ցուցակ) **: Ծուցակները հենց այն են, ինչ դուք կարծում եք. օբյեկտներ, որոնք այլ օբյեկտների ցուցակներ են: :)

Գնացեք և ստեղծեք ցուցակ.

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Այո, այս ցուցակը դատարկ է: Շատ օգտակար չէ, չէ՞: Եկեք ստեղծենք վիճակախաղի համարների ցուցակ: Մենք չենք ուզում անընդհատ կրկնվել, այնպես որ այն նաև կդնենք փոփոխականի մեջ.

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Լավ, մենք ցուցակ ունենք: Ի՞նչ կարող ենք անել դրա հետ: Տեսնենք, թե վիճակախաղի քանի համար կա ցուցակում: Դուք գաղափար ունե՞ք, թե որ function (ֆունկցիան) պետք է օգտագործեք դրա համար: Դուք դա արդեն գիտեք:

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Այո՛ ` len()` - ը կարող է ձեզ ցուցակում մի շարք օբյեկտներ տալ: Հարմար է, չէ՞: Միգուցե հիմա տեսակավորենք.

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Սա ոչինչ չի վերադարձնում, պարզապես փոխեց ցուցակի թվերը հայտնվելու հերթականությունը: Եկեք նորից տպենք և տեսնենք, թե ինչ է տեղի ունեցել:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Ինչպես տեսնում եք, ձեր ցուցակի թվերն այժմ տեսակավորված են ամենացածրից բարձրագույն արժեքից: Շնորհավորանքներ

Միգուցե մենք ուզում ենք հետ շրջե՞լ այդ կարգը: Արի անենք դա!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Եթե ցանկանում եք ինչ-որ բան ավելացնել ձեր ցուցակին, կարող եք դա անել ՝ մուտքագրելով այս հրահանգը.

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Եթե ցանկանում եք ցույց տալ միայն առաջին համարը, ապա կարող եք դա անել ՝ օգտագործելով ** index (ինդեքսներ) **: Ինդեկսը այն թիվն է, որն ասում է, թե որտեղ է ցուցակում ինչ-որ իր տեղի ունենում: Ծրագրավորողները նախընտրում են սկսել հաշվել 0-ից, այնպես որ ձեր ցուցակում առաջին օբյեկտը 0 ինդեքսում է, հաջորդը 1-ի վրա և այլն: Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Ինչպես տեսնում եք, ձեր ցուցակում կարող եք մուտք գործել տարբեր օբյեկտներ ՝ օգտագործելով ցուցակի անվանումը և քառակուսի փակագծերի ներսում գտնվող օբյեկտի ցուցիչը:

Ձեր ցուցակից ինչ-որ բան ջնջելու համար հարկավոր է օգտագործել ** indexes (ինդեքսները) **, ինչպես սովորեցինք վերևում և ` pop() (փոփ()) ` մեթոդը: Եկեք փորձենք մի օրինակ և ամրապնդենք նախկինում սովորածը. մենք կջնջենք մեր ցուցակի առաջին համարը:

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

Դա հիանալի աշխատեց:

Լրացուցիչ զվարճանքի համար փորձեք մի քանի այլ ցուցանիշներ. 6, 7, 1000, -1, -6 կամ -1000: Տեսեք, արդյոք կարող եք կանխատեսել արդյունքը ՝ նախքան հրամանը փորձելը: Արդյո՞ք արդյունքները իմաստ ունեն:

Python- ի փաստաթղթավորման այս գլխում կարող եք գտնել ցուցակի բոլոր մատչելի մեթոդների ցուցակը. https://docs.python.org/3/tutorial/datastructures.html

## Բառարաններ

> Ընթերցողների համար տանը. Այս մասն ընդգրկված է [ Python Basics: Dictionaries (Python- ի հիմունքները: բառարաններ) ](https://www.youtube.com/watch?v=ZX1CVvZLE6c) տեսանյութում:

Բառարանը նման է ցուցակին, բայց արժեքներին մուտք եք գործում թվային ցուցիչի փոխարեն ստեղ փնտրելով: Բանալին կարող է լինել ցանկացած string(տո) կամ համար: Դատարկ բառարան սահմանելու համար շարահյուսությունն է.

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

Սա ցույց է տալիս, որ դուք պարզապես ստեղծել եք դատարկ բառարան: Ուռա!

Այժմ փորձեք գրել հետևյալ հրահանգը (փորձեք փոխարինել նաև ձեր սեփական տեղեկությունները).

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

Այս հրամանի միջոցով դուք պարզապես ստեղծեցիք ` participant (մասնակից) ` անունով փոփոխական `երեք առանցքային արժեքի զույգերով.

- `name(անուն) ` ստեղնը մատնանշում է ` 'Ola' ` արժեքը (` string` օբյեկտ),
- ` country (երկիրը) ` մատնանշում է `'Poland' «Լեհաստան» ` (մեկ այլ ` string `)
- և ` favorite_numbers (սիրված_համարները) ` ցույց են տալիս ` [7, 42, 92] ` (` list (ցուցակ) `, որի մեջ կա երեք համար):

Անհատական ստեղների բովանդակությունը կարող եք ստուգել այս syntax (շարահյուսությամբ).

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Տեսեք, դա նման է ցուցակին: Բայց հարկավոր չէ հիշել ինդեքսը, պարզապես անունը:

Ի՞նչ է պատահում, եթե Python- ից հարցնենք գոյություն չունեցող ստեղնաշարի արժեքը: Դուք կարող եք կռահել? Եկեք փորձենք և տեսնենք:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> participant['age']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'age'
```

Տեսեք, մեկ այլ սխալ: Այս մեկը ** KeyError ** է: Python- ը օգտակար է և ասում է, որ `'age' («տարիքը») ` բանալին գոյություն չունի այս բառարանում:

Ե՞րբ պետք է օգտագործեք բառարան կամ ցուցակ: Լավ, դա խորհելու լավ կետ է: Մտածեք պատասխանի մասին նախքան այն հաջորդ տողում դիտելը:

- Ուղղակի պե՞տք է իրերի պատվիրված հաջորդականություն: Գնացեք ցուցակի համար:
- Ձեզ հարկավոր է արժեքները կապել բանալիների հետ, որպեսզի հետագայում դրանք արդյունավետ (բանալիներով) որոնեք: Օգտագործեք բառարան

Բառարանները, ինչպես list-ները (ցուցակ)ները, * mutable (փոփոխական) են *, ինչը նշանակում է, որ դրանք կարող են փոփոխվել ստեղծվելուց հետո: Բառարանում կարող եք ավելացնել բանալի-արժեքի նոր զույգեր այն ստեղծվելուց հետո, ինչպես հետևյալը.

{% filename %}command-line{% endfilename %}

```python
>>> participant['favorite_language'] = 'Python'
```

Ծուցակների նման, բառարաններում օգտագործելով ` len () ` ֆունկցիան, վերադարձնում է բառարանում բանալի-արժեք զույգերի քանակը: Գնացեք և մուտքագրեք այս հրամանը.

{% filename %}command-line{% endfilename %}

```python
>>> len(participant)
4
```

Հուսով եմ ՝ դա մինչ այժմ իմաստ ունի: :) Պատրա՞ստ եք բառարանների հետ զվարճանալու համար: Կարդացեք մի քանի զարմանալի բաների մասին:

Կարող եք օգտագործել ` pop () ` method-(մեթոդ)ը ՝ բառարանում իրը ջնջելու համար: Ասեք, եթե ցանկանում եք ջնջել `'favorite_numebrs' «սիրված_համարները» ` բանալին համապատասխան գրառումը, մուտքագրեք հետևյալ հրամանը.

{% filename %}command-line{% endfilename %}

```python
>>> participant.pop('favorite_numbers')
[7, 42, 92]
>>> participant
{'country': 'Poland', 'favorite_language': 'Python', 'name': 'Ola'}
```

Ինչպես տեսնում եք արդյունքից, 'favorite_numbers'(«սիրված_համարներ») ստեղնին համապատասխանող ստեղն-արժեք զույգը ջնջվել է:

Բացի դրանից, դուք կարող եք նաև փոխել մի բառ, որը կապված է բառարանում արդեն իսկ ստեղծված բանալին: Մուտքագրեք սա ՝

{% filename %}command-line{% endfilename %}

```python
>>> participant['country'] = 'Germany'
>>> participant
{'country': 'Germany', 'favorite_language': 'Python', 'name': 'Ola'}
```

Ինչպես տեսնում եք, `'country' («երկիր») ` ստեղնի արժեքը փոխվել է ` 'Poland' («Լեհաստան») ` - ից ` 'Germany' («Գերմանիա»)`: :) Հուզիչ? Ուռա! Դուք պարզապես սովորեցիք մեկ այլ զարմանալի բան:

### Ամփոփում

Հոյակապ. Դուք հիմա շատ բան գիտեք ծրագրավորման մասին: Այս վերջին մասում իմացաք.

- ** errors (սխալներ) ** - Դուք այժմ գիտեք, թե ինչպես կարդալ և հասկանալ սխալները, որոնք հայտնվում են, եթե Python- ը չի հասկանում ձեր կողմից տրված հրամանը
- ** variables (փոփոխականներ) ** - օբյեկտների անուններ, որոնք թույլ են տալիս ավելի հեշտ ծածկագրել և ձեր կոդն ավելի ընթեռնելի դարձնել
- ** lists (ցուցակներ) ** - որոշակի հերթականությամբ պահված օբյեկտների ցուցակներ
- ** disctionaries (բառարաններ) ** - օբյեկտներ, որոնք պահվում են որպես ստեղն-արժեք զույգեր

Հիասթափվա՞ծ եք հաջորդ մասի համար: :) 

## Համեմատեք իրերը

> Ընթերցողների համար տանը. Այս մասն ընդգրկված է [ Python Basics: Comparisons (Համեմատություններ )](https://www.youtube.com/watch?v=7bzxqIKYgf4) տեսանյութում:

Ծրագրավորման մեծ մասը ներառում է իրերի համեմատություն: Ո՞րն է համեմատության մեջ ամենահեշտ բանը: Թվե՛ր: Տեսնենք, թե ինչպես է դա գործում.

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

Մենք որոշ թվեր տվեցինք Python- ին `համեմատելու համար: Ինչպես տեսնում եք, Python- ը ոչ միայն կարող է համեմատել թվերը, այլ նաև կարող է համեմատել մաթեմատիկական արտահայտությունների արժեքները, ինչպիսիք են ` 2 * 2 ` և ֆունկցիայի արդյունքները, ինչպիսին է ` 2 ` վերադարձվածը ` len ([4, 5]) `: Հաճելի է, հա՞:

Զարմանո՞ւմ եք, թե ինչու ենք իրար կողքի դնում երկու հավասար ` == ` նշաններ ՝ համեմատելու համար, եթե թվերը հավասար են: Մենք օգտագործում ենք մեկ ` = ` փոփոխականներին արժեքներ նշանակելու համար: Դուք միշտ, ** միշտ ** պետք է դնեք դրանցից երկուսը ՝ ` == ` - եթե ուզում եք ստուգել, արդյոք իրերը հավասար են միմյանց: Կարող ենք նաև փաստել, որ իրերն անհավասար են միմյանց համար: Դրա համար մենք օգտագործում ենք `!= ` խորհրդանիշը, ինչպես ցույց է տրված վերևում բերված օրինակում:

Python- ին տվեք ևս երկու առաջադրանք.

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

Մենք տեսել ենք `>`և `<` բայց ի՞նչ են նշանակում `>=` և `<=`: Կարդացեք դրանք այսպես.

- x `>` y նշանակում է ՝ x- ն y- ից մեծ է
- x `<` y նշանակում է `x- ը y- ից փոքր է
- x `<=` y նշանակում է `x- ը y- ից փոքր է
- x `>=` y նշանակում է. x- ը y- ից մեծ է կամ հավասար է դրան

Հիանալի! ուզում ես մի հատ էլ անել? Փորձեք այս:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

Կարող եք Python- ին տալ այնքան թվեր, որպեսզի համեմատես, որքան ուզում ես, և դա քեզ կպատասխանի: Բավականին խելացի, այդպես չէ՞:

- ** and (և) ** - եթե օգտագործում եք ` and (և) ` օպերատորը, երկու համեմատություններն էլ պետք է լինեն Ճիշտ, որպեսզի ամբողջ հրամանը լինի Ճիշտ:
- ** or (կամ) ** - եթե օգտագործում եք ` or (կամ) ` օպերատոր, ապա համեմատություններից միայն մեկը պետք է լինի Ճիշտ, որպեսզի ամբողջ հրամանը լինի Ճիշտ

Լսե՞լ եք «խնձորը նարինջի հետ համեմատելը» արտահայտության մասին: Փորձենք Python- ի համարժեքը.

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

Այստեղ տեսնում եք, որ ինչպես արտահայտության մեջ, Python- ը ի վիճակի չէ համեմատել համարը (` int `) և տողը (` str `): Փոխարենը, այն ցույց է տալիս ** TypeError ** և մեզ ասում է, որ երկու տիպերը չեն կարող համեմատվել միասին:

## Boolean

Ի դեպ, դուք հենց նոր իմացաք Python- ի նոր տեսակի օբյեկտների մասին: Այն կոչվում է ** Boolean (Բուլյան) **:

Boolean (Բուլյան) ընդամենը երկու օբյեկտ կա.

- Ճիշտ
- Կեղծ

Բայց որպեսզի Python- ը դա հասկանա, դուք պետք է այն միշտ գրեք որպես 'True' («Ճիշտ») (առաջին տառերը մեծատառով, մնացած տառերը փոքրատառերով): ** true, TRUE և tRUE չեն գործի. Միայն True- ն է ճիշտ: ** (Նույնը վերաբերում է նաև 'False' - ին):

Booleans- ը նույնպես կարող է փոփոխական լինել: Տեսեք այստեղ ՝

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

Դուք կարող եք նաև դա անել այս կերպ.

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Պարապեք և զվարճացեք Booleans- ի հետ `փորձելով կատարել հետևյալ հրահանգները.

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Շնորհավորանքներ. Booleans- ը ծրագրավորման ամենաթեժ առանձնահատկություններից մեկն է, և դուք պարզապես սովորեցիք, թե ինչպես օգտագործել դրանք:

# Պահպանել այն!

> Ընթերցողների համար տանը. Այս մասը ներառված է [ Python Basics: Saving files and 'if' statement (Python- ի հիմունքներում. Ֆայլեր պահելը և «Եթե» հայտարարությունը) ](https://www.youtube.com/watch?v=dOAg6QVAxyk) տեսանյութում:

Մինչ այժմ մենք թարգմանչի մեջ գրում էինք մեր պիթոնի բոլոր կոդերը, ինչը մեզ սահմանափակում է միանգամից մեկ տող կոդ մուտքագրելով: Նորմալ ծրագրերը պահվում են ֆայլերում և կատարվում են մեր ծրագրավորման լեզվի ** interpreter (թարգմանիչ) ** կամ ** compiler (կազմողի) ** կողմից: Մինչ այժմ մենք միանգամից տողեր ենք վարում մեր ծրագրերը Python- ի ** interpreter (թարգմանչի) ** մեջ: Հաջորդ մի քանի առաջադրանքների համար մեզ մեկից ավելի տող ծածկագիր է պետք, ուստի մեզ արագ անհրաժեշտ կլինի.

- Ելք Python- ի թարգմանիչից
- Բացեք մեր ընտրած կոդերի խմբագրիչը
- Մի քանի կոդ պահեք պիթոնի նոր ֆայլում
- Սկսե՛ք (run the code) 

Մեզ համար օգտագործվող Python- ի interpreter (թարգմանիչից) դուրս գալու համար մուտքագրեք ` exit()  (ելք())` ֆունկցիան

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Սա ձեզ կրկին կտեղադրի command-ի (հրամանի) տողի մեջ:

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

Մենք ուզում ենք նրանց բոլորին ողջունել իրենց անունով: Դա անելու համար մենք ունենք ` hi ` function, ուստի եկեք օգտագործենք այն loop-ի (օղակի) մեջ.

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

## Ամփոփում

Վերջ ** Դուք լիովին ռոք եք անում: ** Սա բարդ գլուխ էր, այնպես որ դուք պետք է հպարտանաք ինքներդ ձեզնով: Մենք անկասկած հպարտ ենք ձեզանով, որ հասել եք մինչ այժմ:

Python- ի պաշտոնական և ամբողջական ձեռնարկի համար այցելեք https://docs.python.org/3/tutorial/: Սա ձեզ լեզվի ավելի մանրակրկիտ և ամբողջական ուսումնասիրություն կտա: Ողջույն :)

Կարող եք համառոտ մեկ այլ բան անել ՝ ձգվել, մի փոքր շրջել, հանգստանալ ձեր աչքերով ՝ նախքան հաջորդ գլուխ անցնելը: :)

![Cupcake](images/cupcake.png)