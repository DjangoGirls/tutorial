{% set warning_icon = '<span class="glyphicon glyphicon-exclamation-sign" style="color: red;" aria-hidden="true" data-toggle="tooltip" title="An error is expected when you run this command!" ></span>' %}

# Ìfihàn sí Python

> Apá kan lára àkòrí yìí dá lórí àwọn àlàyé ti Geek Girls Carrots (https://github.com/ggcarrots/django-carrots).

Jẹ́ ká kọ àwọn kóòdù kan!

## Python prompt

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé apá yìí nínú fídíò [Python Basics: Integers, Strings, Lists, Variables and Errors](https://www.youtube.com/watch?v=MO63L4s-20U).

Láti bẹ̀rẹ̀ ṣíṣe eré pẹ̀lú Python, a nílò láti ṣí *ìlà ìpàṣẹ* kan kalẹ̀ lórí kọ̀mpútà rẹ. Ó yẹ kí o ti mọ bí o ṣe lè ṣe ìyẹn – o ti kọ́ ọ nínú àkòrí [Ìfihàn sí Ìlà Ìpàṣẹ](../intro_to_command_line/README.md) náà.

Tí o bá ti ṣetán, tẹ̀lé àwọn ìtọ́sọ́nà tó wà nísàlẹ̀.

A fẹ́ ṣí console Python kan, nítorí náà tẹ `python` lórí Windows tàbí `python3` lórí Mac OS/Linux kí o sì tẹ `enter`.

{% filename %}command-line{% endfilename %}

    $ python3
    Python {{ book.py_release }} (...)
    Type "help", "copyright", "credits" or "license" for more information.
    >>>
    

## Àṣẹ Python àkọ́kọ́ rẹ!

Lẹ́yìn ṣíṣe àṣẹ Python náà, prompt náà yípadà sí `>>>`. Fún wa, èyí túmọ̀ sí pé ní báyìí a lè lo àwọn àṣẹ ni èdè Python nìkan. Ìwọ kò ní láti tẹ `>>>` – Python yíò ṣe ìyẹn fún ẹ.

Tí o bá fẹ́ jáde nínú console Python náà nígbàkigbà, tẹ `exit()` tàbí lo àbùjá `Ctrl + Z` fún Windows àti `Ctrl + D` fún Mac/Linux. Lẹ́yìn náà ìwọ kò ní rí `>>>` mọ́.

Ní báyìí, a kò fẹ́ jáde nínú console Python náà. A fẹ́ kẹ́kọ̀ọ́ síi nípa rẹ̀. Jẹ́ ká bẹ̀rẹ̀ pẹ̀lú títẹ àwọn ìṣirò kan, bíi `2 + 3` àti títẹ `enter`.

{% filename %}command-line{% endfilename %}

```python
>>> 2 + 3
5
```

Ó dára! Wo bí ìdáhùn náà ṣe yọ síta? Python mọ ìṣirò! O lè gbìyànjú àwọn àṣẹ mìíràn bíi:

- `4 * 5`
- `5 - 1`
- `40 / 2`

Láti ṣe ìṣirò lọ́nà ìlọ́po agbára, ká sọ pé 2 ní ìlọ́po agbára 3, a máa tẹ: {% filename %}command-line{% endfilename %}

```python
>>> 2 ** 3
8
```

Ṣeré pẹ̀lú èyí fún ìgbà díẹ̀ kí o sì padà síbí lẹ́yìn náà. :)

Gẹ́gẹ́ bó o ṣe ríi, Python jẹ́ ètò-ìṣèṣirò tó wúlò púpọ̀ kan. Tí o bá n ṣe kàyéfì nipa ohun mìíràn tí o lè ṣe…

## Àwọn Fọ́nrán

Orúkọ rẹ ńkọ́? Tẹ orúkọ àkọ́kọ́ rẹ nínú àwọn àmì àyọlò báyìí:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola"
'Ola'
```

O ti ṣẹ̀dá fọ́nrán àkọ́kọ́ rẹ báyìí! Ó jẹ́ ìtòtẹ̀léra àwọn ẹyọ ọ̀rọ̀ tí kọ̀mpútà kan lè ṣiṣẹ́ lórí. Fọ́nrán náà gbọ́dọ̀ bẹ̀rẹ̀ àti parí pẹ̀lú ẹyọ ọ̀rọ̀ kannáà. Èyí lè jẹ́ àwọn àmì àyọlò kan ṣoṣo (`'`) tàbí méjì (`"`) (kò sí ìyàtọ̀!) Àwọn àmì àyọlò náà n sọ fún Python pé ohunkóhun tó wà nínú wọn jẹ́ fọ́nrán kan.

A lè so àwọn fọ́nrán papọ̀. Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> "Hi there " + "Ola"
'Hi there Ola'
```

O tún lè ṣe ìlọ́po àwọn fọ́nrán pẹ̀lú nọ́mbà kan:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola" * 3
'OlaOlaOla'
```

Tí o bá nílò láti fi kọmá olókè kan sínú fọ́nrán rẹ, o ní ọ̀nà méjì láti gbà ṣe é.

Lílo àmì àyọlò méjì:

{% filename %}command-line{% endfilename %}

```python
>>> "Runnin' down the hill"
"Runnin' down the hill"
```

tàbí yẹra fún kọmá olókè náà pẹ̀lú àmì adagun sósì kan (``):

{% filename %}command-line{% endfilename %}

```python
>>> 'Runnin\' down the hill'
"Runnin' down the hill"
```

Ó dára, àbí bẹ́ẹ̀ kọ? Láti rí orúkọ rẹ ní àwọn lẹ́tà-ńlá, tẹ:

{% filename %}command-line{% endfilename %}

```python
>>> "Ola".upper()
'OLA'
```

O ṣẹ̀ṣẹ̀ lo **ọ̀nà** `upper` lórí fọ́nrán rẹ! Ọ̀nà kan (bíi `upper()`) jẹ́ ìtòtẹ̀léra àwọn ìtọ́sọ́nà tí Python ní láti ṣe lórí ohun èlò kan tí a fun (`"Ola"`) nígbà tí o bá pè é.

Tí o bá fẹ́ mọ iye lẹ́tà tó wà nínú orúkọ rẹ, **iṣẹ́** kan wà fún ìyẹn náà!

{% filename %}command-line{% endfilename %}

```python
>>> len("Ola")
3
```

O lè máa ronú pé nígbà mìíràn o pe àwọn iṣẹ́ pẹ̀lú `.` kan ní ìparí fọ́nrán kan (bíi `"Ola".upper()`) àti pé nígbà mìíràn o kọ́kọ́ pe iṣẹ́ kan tí o sì fi fọ́nrán náà sínú àkámọ́? Ó dáa, ní àwọn ìṣẹ̀lẹ̀ kan, àwọn iṣẹ́ jẹ́ ti àwọn ohun èlò, bíi `upper()`, èyí tó lè gba ṣíṣe lórí àwọn fọ́nrán nìkan. Ní irú ìṣẹ̀lẹ̀ yìí, a pe iṣẹ́ náà ní **ọ̀nà** kan. Ní àwọn ìgbà mìíràn, àwọn iṣẹ́ kìí ṣe ti ohunkóhun pàtó àti pé ó lè jẹ́ lílò lórí oríṣiríṣi ohun èlò, gẹ́gẹ́ bí `len()`. Ìdí nìyẹn tí a ṣé n gbé `"Ola"` kalẹ̀ gẹ́gẹ́ bí parameter kan sí iṣẹ́ `len` náà.

### Kókó pàtàkì

O dáa, ó tó nípa àwọn fọ́nrán. Títí di báyìí, o ti kẹ́kọ̀ọ́ nípa:

- **prompt náà** – títẹ àwọn àṣẹ (kóòdù) sínú prompt Python náà yíò yọrí sí àwọn ìdáhùn ní Python
- **àwọn nọ́mbà àti àwọn fọ́nrán** – nínú Python, àwọn nọ́mbà jẹ́ lílò fún ìṣirò àti pé àwọn fọ́nrán fún àwọn ohun èlò ọ̀rọ̀
- **operators** – bíi `+` àti `*`, máa pa àwọn iye pọ̀ láti gbé iye tuntun kan jáde
- **àwọn iṣẹ́** – bíi `upper()` àti `len()`, máa ṣiṣẹ́ lórí àwọn ohun èlò.

Àwọn wọ̀nyí jẹ́ àwọn ìpìlẹ̀ gbogbo èdè kóòdù kíkọ tí o bá kọ́. Ṣé o ti ṣetán fún nnkan tó túbọ̀ ṣòro? A retí pé o ti ṣetán!

## Àwọn Àṣìṣe

Jẹ́ ká gbìyànjú nnkan tuntun kan. Ṣe a lè gba gígùn nọ́mbà kan lọ́nà kannáà tí a gbà wádìí gígùn orúkọ wa? Tẹ `len(304023)` kí o sì tẹ `enter`:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> len(304023)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: object of type 'int' has no len()
```

A rí àṣìṣe àkọ́kọ́ wa! Àwòrán aṣàmì {{ warning_icon }} náà jẹ́ ọ̀nà wa láti fún ọ ní ìkìlọ̀ pé kóòdù tí o fẹ́ ṣe kò ní ṣiṣẹ́ bí o ti retí. Ṣíṣe àṣìṣe (kódà àwọn tí o mọ̀ọ́mọ̀ ṣe) jẹ́ apá kan tó ṣe pàtàkì nínú ìkẹ́kọ̀ọ́!

Ó sọ wípé àwọn ohun èlò tó jẹ́ irú "int" (integers, àwọn nọ́mbà odidi) kò ní gígùn. Nítorí náà, kí ní a lè ṣe báyìí? Bóyá a lè kọ nọ́mbà wa gẹ́gẹ́ bí fọ́nrán kan? Àwọn fọ́nrán ní gígùn kan, àbí bẹ́ẹ̀ kọ?

{% filename %}command-line{% endfilename %}

```python
>>> len(str(304023))
6
```

Ó ṣiṣẹ́! A lo iṣẹ́ `str` nínú iṣẹ́ `len` náà. `str()` yíò yí gbogbo nnkan sí àwọn fọ́nrán.

- Iṣẹ́ `str` náà yíò ṣàyípadà àwọn nnkan sí **fọ́nrán**
- Iṣẹ́ `int` náà yíò ṣàyípadà àwọn nnkan sí **nọ́mbà odidi**

> Ní pàtàkì: a lè ṣàyípadà àwọn nọ́mbà sí ọ̀rọ̀, ṣùgbọ́n a kò lè fi dandan ṣàyípadà ọ̀rọ̀ sí nọ́mbà – kíni `int('hello')` yíò jẹ́ gan-an?

## Àwọn variable

Ìlànà pàtàkì kan nínú kóòdù kíkọ ni àwọn variable. Variable kan kò jẹ́ nnkan kan ju orúkọ kan fún nnkan kan kí o bàa lè lò ó nígbà mìíràn. Àwọn onímọ̀ nípa kóòdù máa n lo àwọn variable wọ̀nyí láti tọ́jú dátà, mú kóòdù wọn rọrùn láti kà àti nítorí náà wọn kò ní láti máa rántí ohun tí àwọn nnkan jẹ́.

Jẹ́ ká sọ pé a fẹ́ ṣẹ̀dá variable tuntun kan tí a n pè ní `name`:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Ola"
```

A tẹ orúkọ dọ́gba pẹ̀lú Ola.

Gẹ́gẹ́ bí o ti ṣàkíyèsí, ètò rẹ kò dá ohunkóhun padà bíi ó ti ṣe tẹ́lẹ̀. Nítorí náà, báwo ni a ṣe fẹ́ mọ pé variable náà wà lóòótọ́? Tẹ `name` kí o sì tẹ `enter`:

{% filename %}command-line{% endfilename %}

```python
>>> name
'Ola'
```

Yippee! Variable àkọ́kọ́ rẹ! :) O lè tún ṣàyípadà ohun tó n tọ́ka sí:

{% filename %}command-line{% endfilename %}

```python
>>> name = "Sonja"
>>> name
'Sonja'
```

O tún lè lò ó nínú àwọn iṣẹ́:

{% filename %}command-line{% endfilename %}

```python
>>> len(name)
5
```

Ó dára, àbí bẹ́ẹ̀ kọ? Ní báyìí, àwọn variable lè jẹ́ ohunkóhun – àwọn nọ́mbà pẹ̀lú! Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> a = 4
>>> b = 6
>>> a * b
24
```

Ṣùgbọ́n tí a bá lo orúkọ tí kò tọ́ ńkọ́? Kí lo rò pé yíò ṣẹlẹ̀? Jẹ́ ká gbìyànjú!

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> city = "Tokyo"
>>> ctiy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ctiy' is not defined
```

Àṣìṣe kan! Gẹ́gẹ́ bó o ṣe ríi, Python ní oríṣiríṣi àwọn àṣìṣe àti pé èyí ni a n pè ní **NameError**. Python yíò fún ọ ní àṣìṣe yìí tí o bá gbìyànjú láti po variable kan tí a kò tíì ṣàlàyé. Tí o bá pàdé àṣìṣe yìí tó bá yá, ṣàyẹ̀wò kóòdù rẹ láti wo bóyá o ti ṣe àṣìṣe títẹ àwọn orúkọ kankan.

Ṣeré pẹ̀lú èyí fún ìgbà díẹ̀ kí o sì rí ohun tí o lè ṣe!

## Iṣẹ́ print náà

Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> name = 'Maria'
>>> name
'Maria'
>>> print(name)
Maria
```

Nígbà tí o bá tẹ `name`, ètò àgbékalẹ̀ Python náà yíò fèsì padà pẹ̀lú *àpẹẹrẹ* fọ́nrán ti variable 'name' náà, èyí tó jẹ́ àwọn lẹ́tà M-a-r-i-a, tí àwọn àmì àyọlò kan ṣoṣo yíká, ". Nígbà tí o sọ `print(name)`, Python yíò "ṣàtẹ̀jáde" àwọn àkóónú ti variable náà sí ojú àwòrán náà, láìsí àwọn àmì àyọlò náà, èyí tó túbọ̀ dára.

Gẹ́gẹ́ bí a óò ṣe ri tó bá yá, `print()` tún wúlò nígbà tí a bá fẹ́ ṣàtẹ̀jáde àwọn nnkan láti inú àwọn iṣẹ́, tàbí nígbà tí a bá fẹ́ ṣàtẹ̀jáde àwọn nnkan lórí ọ̀pọ̀lọpọ̀ ìlà.

## Àwọn àkójọ

Yàtọ̀ sí àwọn fọ́nrán àti àwọn nọ́mbà odidi, Python ní gbogbo onírúurú àwọn ohun èlò ọ̀tọ̀ọ̀tọ̀. Ní báyìí, a ó ṣàfihàn ọ̀kan tí a n pè ní **àkójọ**. Àwọn àkójọ jẹ́ ohun tí o lérò pé wọ́n jẹ́ gan-an: àwọn ohun èlò èyí tó jẹ́ àwọn àkójọ àwọn ohun èlò mìíràn. :)

Tẹ̀síwájú kí o ṣẹ̀dá àkójọ kan:

{% filename %}command-line{% endfilename %}

```python
>>> []
[]
```

Bẹ́ẹ̀ ni, àkójọ yìí wà ní òfìfo. Kò fi bẹ́ẹ̀ wúlò, àbí bẹ́ẹ̀ kọ? Jẹ́ ká ṣẹ̀dá àkójọ àwọn nọ́mbà tẹ́tẹ́ lọ́tìrì kan. A kò fẹ́ pààrà ara wa ní gbogbo ìgbà, nítorí náà a ó fi sínú variable kan, pẹ̀lú:

{% filename %}command-line{% endfilename %}

```python
>>> lottery = [3, 42, 12, 19, 30, 59]
```

Kò burú, a ti ní àkójọ kan! Kíni a lè ṣe pẹ̀lú rẹ̀? Jẹ́ ká wo iye nọ́mbà tẹ́tẹ́ lọ́tìrì tó wà nínú àkójọ kan. Ṣé o ní àbá kankan nípa iṣẹ́ tó yẹ kí o lò fún ìyẹn? O ti mọ èyí tẹ́lẹ̀!

{% filename %}command-line{% endfilename %}

```python
>>> len(lottery)
6
```

Bẹ́ẹ̀ ni! `len()` lè fún ọ ní iye àwọn ohun èlò tó wà nínú àkójọ kan. Ó wúlò, àbí bẹ́ẹ̀ kọ? Bóyá a ó ṣètò rẹ̀ ní báyìí:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.sort()
```

Èyí kò dá ohunkóhun padà, ó kàn ṣàyípadà ètò èyí tí àwọn nọ́mbà náà fi fojú hàn nínú àkójọ náà. Jẹ́ ká ṣàtẹ̀jáde rẹ̀ lẹ́ẹ̀kan síi kí a wo ohun tó ṣẹlẹ̀:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery)
[3, 12, 19, 30, 42, 59]
```

Gẹ́gẹ́ bó o ṣe ríi, a ti ṣètò àwọn nọ́mbà tó wà nínú àkójọ rẹ láti iye tó kéré jù sí iye tó tóbi jù. Kú oríire!

Bóyá a fẹ́ yí títò náà padà? Jẹ́ ká ṣe ìyẹn!

{% filename %}command-line{% endfilename %}

```python
>>> lottery.reverse()
>>> print(lottery)
[59, 42, 30, 19, 12, 3]
```

Tí o bá fẹ́ ṣàfikún nnkan kan sí àkójọ rẹ, o lè ṣe èyí nípasẹ̀ títẹ àṣẹ yìí:

{% filename %}command-line{% endfilename %}

```python
>>> lottery.append(199)
>>> print(lottery)
[59, 42, 30, 19, 12, 3, 199]
```

Tí o bá fẹ ṣàfihàn nọ́mbà àkọ́kọ́ nìkan, o lè ṣe èyí nípasẹ̀ lílo **àwọn atọ́kà**. Atọ́ka kan jẹ́ nọ́mbà kan tó n sọ ibi ti nnkan kan wà nínú àkójọ kan. Àwọn onímọ̀ nípa kóòdù fẹ́ràn láti bẹ̀rẹ̀ kíkà láti 0, nítorí náà ohun èlò àkọ́kọ́ nínú àkójọ rẹ wà ní atọ́ka 0, èyí tó kàn wà ní 1, àti bẹ́ẹ̀ bẹ́ẹ̀ lọ. Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> print(lottery[0])
59
>>> print(lottery[1])
42
```

Gẹ́gẹ́ bó o ṣe ríi, o lè ní ànfààní sí oríṣiríṣi ohun èlò nínú àkójọ rẹ nípasẹ̀ lílo orúkọ àkójọ náà àti atọ́ka ohun èlò náà nínú àwọn àkámọ́ olópòó.

Láti yọ nnkan kan kúrò nínú àkójọ rẹ, ìwọ yíò nílò láti lo **àwọn atọ́ka** gẹ́gẹ́ bí a ṣe kẹ́kọ̀ọ́ lókè àti ọ̀nà `pop()` náà. Jẹ́ ká gbìyànjú àpẹẹrẹ kan láti ṣàrídájú ohun tí a ti kọ́ tẹ́lẹ̀; a ó yọ nọ́mbà àkọ́kọ́ tó wà nínú àkójọ wa kúrò.

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

Ìyẹn ṣiṣẹ́ dáadáa!

Fún àfikún eré, gbìyànjú àwọn atọ́ka mìíràn: 6, 7, 1000, -1, -6 tàbí -1000. Wo bóyá o lè sọ àsọtẹ́lẹ̀ àbájáde náà ṣáájú kí o tó gbìyànjú àṣẹ náà. Ṣe àwọn àbájáde náà bọ́gbọ́n mu?

O lè ṣàwárí àkọsílẹ̀ kan ti gbogbo àwọn ọ̀nà àkójọ tó wà nínú àkòrí yìí ti àkọsílẹ̀ àlàyé Python náà: https://docs.python.org/3/tutorial/datastructures.html

## Dictionaries

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé apá yìí nínú fídíò [Python Basics: Dictionaries](https://www.youtube.com/watch?v=ZX1CVvZLE6c).

A dictionary is similar to a list, but you access values by looking up a key instead of a numeric index. A key can be any string or number. The syntax to define an empty dictionary is:

{% filename %}command-line{% endfilename %}

```python
>>> {}
{}
```

This shows that you just created an empty dictionary. Hurray!

Ní báyìí, gbìyànjú kíkọ àṣẹ tó tẹ̀le yìí (gbìyànjú láti rọ́pò ìròyìn tìẹ, pẹ̀lú):

{% filename %}command-line{% endfilename %}

```python
>>> participant = {'name': 'Ola', 'country': 'Poland', 'favorite_numbers': [7, 42, 92]}
```

With this command, you just created a variable named `participant` with three key–value pairs:

- The key `name` points to the value `'Ola'` (a `string` object),
- `country` points to `'Poland'` (another `string`),
- and `favorite_numbers` points to `[7, 42, 92]` (a `list` with three numbers in it).

You can check the content of individual keys with this syntax:

{% filename %}command-line{% endfilename %}

```python
>>> print(participant['name'])
Ola
```

Wo, ó rí bíi àkójọ kan. Ṣùgbọ́n ìwọ kò nílò láti rántí atọ́ka náà – orúkọ náà nìkan.

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

- Do you just need an ordered sequence of items? Go for a list.
- Do you need to associate values with keys, so you can look them up efficiently (by key) later on? Use a dictionary.

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

### Kókó pàtàkì

Ó dára! O mọ púpọ̀ nípa kóòdù kíkọ ní báyìí. Ní apá tó gbẹ̀yìn yìí, o ti kẹ́kọ̀ọ́ nípa:

- **àwọn àṣìṣe** – o ti mọ bí o ṣe lè ka àti lóye àwọn àṣìṣe tó máa fojú hàn tí Python kò bá mọ àṣẹ kan tí o bá fún-un
- **àwọn variable** – àwọn orúkọ fún àwọn ohun èlò tó máa fún ọ láàyè láti kọ kóòdù pẹ̀lú ìrọ̀rùn tí yíò sì mú kóòdù rẹ rọrùn láti kà
- **àwọn àkójọ** – àwọn àkójọ àwọn ohun èlò tí a tọ́jú pẹ̀lú ètò pàtó kan
- **dictionaries** – objects stored as key–value pairs

Excited for the next part? :)

## Ṣe ìfiwéra àwọn nnkan

> Fún àwọn òǹkàwé ní ilé: a ti ṣàlàyé apá yìí nínú fídíò [Python Basics: Comparisons](https://www.youtube.com/watch?v=7bzxqIKYgf4).

Apá kan tó tóbi nínú kóòdù kíkọ ní láti ṣe pẹ̀lú ṣíṣe ìfiwéra àwọn nnkan. Kíni nnkan tó rọrùn jù láti fi wéra? Àwọn nọ́mbà! Jẹ́ ká wo bí ìyẹn ṣé n ṣiṣẹ́:

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

Fún Python ní àwọn iṣẹ́ méjì síi:

{% filename %}command-line{% endfilename %}

```python
>>> 6 >= 12 / 2
True
>>> 3 <= 2
False
```

A ti rí `>` àti `<`, ṣùgbọ́n kíni `>=` àti `<=` túmọ̀ sí? Kà wọ́n báyìí:

- x `>` y túmọ̀ sí: x tóbi ju y
- x `<` y túmọ̀ sí: x kéré sí y
- x `<=` y túmọ̀ sí: x kéré sí tàbí dọ́gba pẹ̀lú y
- x `>=` y túmọ̀ sí: x tóbi ju tàbí dọ́gba pẹ̀lú y

O dára! Ṣé o fẹ́ ṣe ẹyọkan síi? Gbìyànjú èyí:

{% filename %}command-line{% endfilename %}

```python
>>> 6 > 2 and 2 < 3
True
>>> 3 > 2 and 2 < 1
False
>>> 3 > 2 or 2 < 1
True
```

O lè fún Python ní ọ̀pọ̀lọpọ̀ nọ́mbà láti ṣe ìfiwéra bíi o ṣe fẹ́, àti pé yóò fún ọ ní ìdáhùn kan! Ó já fáfá púpọ̀, àbí bẹ́ẹ̀ kọ?

- **and** – tí o bá lo operator `and` náà, àwọn àfiwé méjèèjì ní láti jẹ́ True kí gbogbo àṣẹ náà bàa lè jẹ́ True
- **or** – tí o bá lo operator `or` náà, ẹyọkan ṣoṣo nínú àwọn àfiwé náà ní láti jẹ́ True kí gbogbo àṣẹ náà bàa lè jẹ́ True

Ṣé o ti gbọ́ nípa gbólóhùn "ṣíṣe ìfiwéra èso ápù àti ọsàn"? Jẹ́ ká gbìyànjú irú rẹ̀ nínú Python:

{% filename %}{{ warning_icon }} command-line{% endfilename %}

```python
>>> 1 > 'django'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '>' not supported between instances of 'int' and 'str'
```

O ti ri níbí pé gẹ́gẹ́ bí inú gbólóhùn náà, Python kò lè ṣe ìfiwéra nọ́mbà kan (`int`) àti fọ́nrán kan (`str`). Dípò, ó ṣàfihàn **TypeError** kan àti pé ó sọ fún wa pé irú àwọn nnkan méjèèjì kò ṣeé fi wéra papọ̀.

## Boolean

Lọ́nà kan ṣáá, o ṣẹ̀ṣẹ̀ kẹ́kọ̀ọ́ nípa irú ohun èlò tuntun kan nínú Python. A ń pè é ní **Boolean**.

Àwọn ohun èlò Boolean méjì nìkan ló wà:

- True
- False

Ṣùgbọ́n fún Python láti mọ èyí, o nílò láti rí pé o kọ́ gẹ́gẹ́ bí 'True' (tí lẹ́tà àkọ́kọ́ máa jẹ́ lẹ́tà-ńlá, tí àwọn lẹ́tà yòókù máa jẹ́ lẹ́tà kékeré). **true, TRUE, àti tRUE kò ní ṣiṣẹ́ – True nìkan ló tọ́.** (Bẹ́ẹ̀ náà ló ṣe jẹ́ sí 'False' bákan náà.)

Àwọn Boolean lè jẹ́ variable, pẹ̀lú! Wo ibí:

{% filename %}command-line{% endfilename %}

```python
>>> a = True
>>> a
True
```

O tún lè ṣe é lọ́nà yìí:

{% filename %}command-line{% endfilename %}

```python
>>> a = 2 > 5
>>> a
False
```

Ṣe ìdánrawò kí o sì ṣeré pẹ̀lú àwọn Boolean nípasẹ̀ ìgbìyànjú láti ṣe àwọn àṣẹ tó tẹ̀le yìí:

- `True and True`
- `False and True`
- `True or 1 == 1`
- `1 != 2`

Kú oríire! Àwọn Boolean jẹ́ ọ̀kan lára àwọn ẹyà tó dára jù nínú kóòdù kíkọ, àti pé o ṣẹ̀ṣẹ̀ kẹ́kọ̀ọ́ bí o ṣe lè lò wọ́n!

# Tọ́jú rẹ̀!

> For readers at home: this part is covered in the [Python Basics: Saving files and "If" statement](https://www.youtube.com/watch?v=dOAg6QVAxyk) video.

So far we've been writing all our python code in the interpreter, which limits us to entering one line of code at a time. Normal programs are saved in files and executed by our programming language **interpreter** or **compiler**. So far we've been running our programs one line at a time in the Python **interpreter**. We're going to need more than one line of code for the next few tasks, so we'll quickly need to:

- Exit the Python interpreter
- Ṣí olóòtú kóòdù tí a yàn láàyò
- Tọ́jú àwọn kóòdù kan sínú fáìlì python tuntun kan
- Mú u ṣiṣẹ́!

To exit from the Python interpreter that we've been using, type the `exit()` function

{% filename %}command-line{% endfilename %}

```python
>>> exit()
$
```

Èyí yíò dá ọ padà sínú command prompt náà.

Ní ìṣáájú, a ti mú olóòtú kóòdù kan láti abala [olóòtú kóòdù](../code_editor/README.md) náà. A ó nílò láti ṣí olóòtú náà ní báyìí àti kọ àwọn kóòdù kan sínú fáìlì tuntun kan (tàbí tí o bá n lo Chromebook kan, ṣẹ̀dá fáìlì tuntun kan sínú cloud IDE náà kí o sì ṣí fáìlì náà, èyí tí yíò jẹ́ nínú olóòtú kóòdù tó wà lára rẹ̀ náà):

{% filename %}editor{% endfilename %}

```python
print('Hello, Django girls!')
```

Dájúdájú, o jẹ́ olùgbéjáde Python tó ti nírìírí púpọ̀ kan ní báyìí, nítorí náà má tijú láti kọ àwọn kóòdù tí o ti kọ́ lónìí.

Ní báyìí, a nílò láti tọ́jú fáìlì náà àti fún-un lórúkọ aṣàpèjúwe kan. Jẹ́ ká pe fáìlì náà ní **python_intro.py** àti tọ́jú rẹ̀ sí desktop rẹ. We can name the file anything we want, but the important part here is to make sure the file ends in **.py**. The **.py** extension tells our operating system that this is a **Python executable file** and Python can run it.

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
    

(Rántí pé ọ̀rọ̀ "Desktop" náà lè ní ìtumọ̀ sí èdè abínibí rẹ.)

<!--endsec-->

<!--sec data-title="Change directory: Windows Command Prompt" data-id="python_windows" data-collapse=true ces-->

Lórí Windows Command Prompt, yóò rí báyìí:

{% filename %}command-line{% endfilename %}

    > cd %HomePath%\Desktop
    

<!--endsec-->

<!--sec data-title="Change directory: Windows Powershell" data-id="python_windowsPSH" data-collapse=true ces-->

Àti lórí Windows Powershell, yóò rí báyìí:

{% filename %}command-line{% endfilename %}

    > cd $Home\Desktop
    

<!--endsec-->

If you get stuck, ask for help. That's exactly what the coaches are here for!

Now use Python to execute the code in the file like this:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hello, Django girls!
    

Àkíyèsí: lórí Windows a kò dá 'python3' mọ̀ gẹ́gẹ́ bí àṣẹ kan. Dípò, lo 'python' láti ṣiṣẹ́ lórí fáìlì náà:

{% filename %}command-line{% endfilename %}

```python
> python python_intro.py
```

Alright! You just ran your first Python program that was saved to a file. Feel awesome?

You can now move on to an essential tool in programming:

## If … elif … else

Lots of things in code should be executed only when given conditions are met. That's why Python has something called **if statements**.

Rọ́pò kóòdù tó wà nínú fáìlì **python_intro.py** rẹ pẹ̀lú èyí:

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

- **ṣíṣe ìfiwéra àwọn nnkan** – nínú Python, o lè ṣe ìfiwéra àwọn nnkan nípasẹ̀ lílo `>`, `>=`, `==`, `<=`, `<` àti àwọn operator `and`, `or` náà
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
    

Oops, àṣìṣe kan. Èyí tó jẹ́ oríre fún wa, Python n fún wa ní ìròyìn àṣìṣe tó wúlò púpọ̀ kan. Ó n sọ fún wa pé iṣẹ́ `hi()` náà (èyí tí a ṣàlàyé) ní argument kan tó nílò (tí a n pè ní `name`) àti pé a ti gbàgbé láti darí rẹ̀ nígbà tí a n pe iṣẹ́ náà. Jẹ́ ká ṣàtúnṣe rẹ̀ ní ìsàlẹ̀ fáìlì náà:

{% filename %}python_intro.py{% endfilename %}

```python
hi("Ola")
```

Kí a sì mú u ṣiṣẹ́ léèkan si:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Ola!
    

Àti pé tí a bá ṣàyípadà orúkọ náà?

{% filename %}python_intro.py{% endfilename %}

```python
hi("Sonja")
```

Kí a sì mú u ṣiṣẹ́:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Sonja!
    

Ní báyìí, kíni o lérò pé yíò ṣẹlẹ̀ tí o bá kọ orúkọ mìíràn síbẹ̀? (Kìí ṣe Ola tàbí Sonja.) Gbìyànjú rẹ̀ wò kí o sì ri bóyá o gbà á. Ó yẹ kó ṣàtẹ̀jáde èyí:

{% filename %}command-line{% endfilename %}

    Hi anonymous!
    

Èyí dára, àbí bẹ́ẹ̀ kọ? Lọ́nà yìí, ìwọ kò ní láti máa pààrà ara rẹ ní gbogbo ìgbà tí o bá fẹ́ ṣàyípadà orúkọ ẹni tó yẹ kí iṣẹ́ náà kí. Àti pé ìdí nìyẹn tí a fi nílò àwọn iṣẹ́ – ìwọ kò ní fẹ́ pààrà kóòdù rẹ!

Let's do something smarter – there are more names than two, and writing a condition for each would be hard, right? Replace the content of your file with the following:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

hi("Rachel")
```

Jẹ́ ká pe kóòdù náà ní báyìí:

{% filename %}command-line{% endfilename %}

    $ python3 python_intro.py
    Hi Rachel!
    

Kú oríire! O ṣẹ̀ṣẹ̀ kẹ́kọ̀ọ́ nípa bí o ṣe lè kọ àwọn iṣẹ́! :)

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

Kóòdù kíkún tí yíò wà nínú fáìlì náà nìyí:

{% filename %}python_intro.py{% endfilename %}

```python
def hi(name):
    print('Hi ' + name + '!')

girls = ['Rachel', 'Monica', 'Phoebe', 'Ola', 'You']
for name in girls:
    hi(name)
    print('Next girl')
```

Àti nígbà tí a bá mú u ṣiṣẹ́:

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
    

Gẹ́gẹ́ bó o ṣe ríi, gbogbo nnkan tí o fi sínú gbólóhùn `for` kan pẹ̀lú ìtẹ̀wọnú kan yíò máa wáyé fún gbogbo element ti àkójọ `girls` náà.

O tún lè lo `for` lórí àwọn nọ́mbà pẹ̀lú lílo iṣẹ́ `range` náà:

{% filename %}python_intro.py{% endfilename %}

```python
for i in range(1, 6):
    print(i)
```

Èyí tí yíò ṣàtẹ̀jáde:

{% filename %}command-line{% endfilename %}

    1
    2
    3
    4
    5
    

`range` jẹ́ iṣẹ́ kan tó máa ṣẹ̀dá àkójọ àwọn nọ́mbà kan tó n tẹ̀lé ara wọn níkọ̀ọ̀kan (àwọn nọ́mbà wọ̀nyí máa wà ní ìpèsè nípasẹ̀ rẹ gẹ́gẹ́ bí àwọn parameter).

Ṣàkíyèsí pé ìkejì àwọn nọ́mbà méjèèjì wọ̀nyí kò sí nínú àkójọ tí Python gbé jáde (tó túmọ̀sí pé `range(1, 6)` bẹ̀rẹ̀ kíkà láti 1 sí 5, ṣùgbọ́n kò sí nọ́mbà 6 náà lára wọn). That is because "range" is half-open, and by that we mean it includes the first value, but not the last.

## Kókó pàtàkì

That's it. **You totally rock!** This was a tricky chapter, so you should feel proud of yourself. We're definitely proud of you for making it this far!

For official and full python tutorial visit https://docs.python.org/3/tutorial/. This will give you a more thorough and complete study of the language. Cheers! :)

You might want to briefly do something else – stretch, walk around for a bit, rest your eyes – before going on to the next chapter. :)

![Cupcake](images/cupcake.png)